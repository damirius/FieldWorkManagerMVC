<?php

namespace Applications\PMTool\Controllers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class TaskController extends \Library\BaseController {

  public function executeIndex(\Library\HttpRequest $rq) {
    $user = $this->app()->user();
    \Applications\PMTool\Helpers\TaskHelper::AddTabsStatus($user);
    if (!\Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($user)) {
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::ProjectsRootUrl);
    }
    $toList = FALSE;
    if (\Applications\PMTool\Helpers\TaskHelper::UserHasTasks($user, 0) && $rq->getData("target") !== "") {
      $toList = $rq->getData("target") === "listAll";
    } else {
      $this->executeGetList($rq, NULL, FALSE);
      $toList = \Applications\PMTool\Helpers\TaskHelper::UserHasTasks($user, 0);
    }
    if ($toList && $rq->getData("target") === "listAll") {
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::TaskListAll);
    } else {
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::TaskShowForm . "?mode=add&test=true");
    }
  }

  public function executeShowForm(\Library\HttpRequest $rq) {
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);
    if ($rq->getData("mode") === "edit") {
      $this->page->addVar("task_editing_header", $this->resxData["task_legend_edit"]);
    } else {
      $this->page->addVar("task_editing_header", $this->resxData["task_legend_add"]);
    }
    //Which module?
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::tabStatus, \Applications\PMTool\Helpers\TaskHelper::GetTabsStatus($this->app()->user()));
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

  public function executeListAll(\Library\HttpRequest $rq) {
    //Get list of task stored in session
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);

    $data = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects => \Applications\PMTool\Helpers\TaskHelper::GetFilteredTaskObjectsList($this->app()->user()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower($this->module()))
    );
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data, $data);

    $modules = $this->app()->router()->selectedRoute()->phpModules();
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::active_list, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::active_list]);
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::inactive_list, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::inactive_list]);
  }

  public function executeAdd(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());

    //Load interface to query the database
    $manager = $this->managers->getManagerOf($this->module);
    $this->dataPost["project_id"] = $sessionProject[\Library\Enums\SessionKeys::ProjectObject]->project_id();

    $task = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), new \Applications\PMTool\Models\Dao\Task());

    $result["dataIn"] = $task;

    $result["dataOut"] = $manager->add($task);
    $task->setTask_id($result["dataOut"]);
    array_push($sessionProject[\Library\Enums\SessionKeys::ProjectTasks], \Library\Enums\SessionKeys::TaskKey . $task->task_id());

    if ($result["dataOut"] !== NULL) {
      \Applications\PMTool\Helpers\TaskHelper::AddSessionTask($this->app()->user(), $task);
      \Applications\PMTool\Helpers\ProjectHelper::SetUserSessionProject($this->app()->user(), $sessionProject);
    }

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
        "resx_key" => $this->action(),
        "step" => $result["dataOut"] > 0 ? "success" : "error"
    ));
  }

  public function executeEdit(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionTask = \Applications\PMTool\Helpers\TaskHelper::GetSessionTask($this->app()->user(), $this->dataPost["task_id"]);
    //Init PDO
    $task = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), new \Applications\PMTool\Models\Dao\Task());
    $result["data"] = $task;

    $manager = $this->managers->getManagerOf($this->module());
    $result_edit = $manager->edit($task);

    //Clear the task and facility list from session for the connect PM
    if ($result_edit) {
      $sessionTask[\Library\Enums\SessionKeys::TaskObj] = $task;
      \Applications\PMTool\Helpers\TaskHelper::SetSessionTask($this->app()->user(), $sessionTask);
    }

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
        "resx_key" => $this->action(),
        "step" => $result_edit ? "success" : "error"
    ));
  }

  public function executeDelete(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $db_result = FALSE;
    $task_id = intval($this->dataPost["task_id"]);

    //Check if the task to be deleted if the Task manager's
    $task_selected = \Applications\PMTool\Helpers\TaskHelper::GetSessionTask($this->app()->user(), $task_id);
    //Load interface to query the database
    if ($task_selected !== NULL) {
      $manager = $this->managers->getManagerOf($this->module());
      if ($manager->delete($task_id)) {
        $sessionTasks = \Applications\PMTool\Helpers\TaskHelper::GetSessionTasks($this->app()->user());
        unset($sessionTasks[\Library\Enums\SessionKeys::TaskKey . $task_id]);
        \Applications\PMTool\Helpers\TaskHelper::SetSessionTasks($this->app()->user(), $sessionTasks);

        $index = \Applications\PMTool\Helpers\CommonHelper::FindIndexInIdListById(
                        (\Library\Enums\SessionKeys::TaskKey . $task_id), $sessionProject[\Library\Enums\SessionKeys::ProjectTasks]);
        $db_result = $index === NULL ? FALSE : TRUE;
        unset($sessionProject[\Library\Enums\SessionKeys::ProjectTasks][$index]);
        \Applications\PMTool\Helpers\ProjectHelper::SetUserSessionProject($this->app()->user(), $sessionProject);
      }
    }

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
        "resx_key" => $this->action(),
        "step" => $db_result !== FALSE ? "success" : "error"
    ));
  }

  public function executeGetList(\Library\HttpRequest $rq = NULL, $sessionTask = NULL, $isAjaxCall = FALSE) {
    // Init result
    $result = $this->InitResponseWS();

    //Init PDO
    $list = array();
    if ($sessionTask === NULL) {
      //Load interface to query the database for tasks
      $project = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
      $manager = $this->managers->getManagerOf($this->module);
      \Applications\PMTool\Helpers\TaskHelper::StoreSessionTask($this->app()->user(), $manager->selectMany($project[\Library\Enums\SessionKeys::ProjectObject]));
    }
    if ($isAjaxCall) {
      $step_result = $result[\Library\Enums\SessionKeys::ProjectTasks] !== NULL ? "success" : "error";
      $this->SendResponseWS(
              $result, array(
          "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
          "resx_key" => $this->action(),
          "step" => $step_result
      ));
    }
  }

  public function executeGetItem(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $task_id = intval($this->dataPost["task_id"]);

    $task_selected = \Applications\PMTool\Helpers\TaskHelper::GetSessionTask($this->app()->user(), $task_id);
    \Applications\PMTool\Helpers\TaskHelper::SetSessionTask($this->user(), $task_selected);

    $result["task"] = $task_selected;
    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
        "resx_key" => $this->action(),
        "step" => ($task_selected !== NULL) ? "success" : "error"
    ));
  }

  public function executeUpdateItems(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS(); // Init result

    $rows_affected = 0;
    //Get the task objects from ids received
    $task_ids = str_getcsv($this->dataPost["task_ids"], ',');
    $sessionTasks = \Applications\PMTool\Helpers\TaskHelper::GetSessionTasks($this->app()->user());

    foreach ($task_ids as $id) {
      $task = $sessionTasks[\Library\Enums\SessionKeys::TaskKey . $id][\Library\Enums\SessionKeys::TaskObj];
      $task->setTask_active($this->dataPost["action"] === "active" ? TRUE : FALSE);
      $manager = $this->managers->getManagerOf($this->module);
      $rows_affected += $manager->edit($task) ? 1 : 0;
    }
    \Applications\PMTool\Helpers\TaskHelper::SetSessionTasks($this->app()->user(), $sessionTasks);

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Task,
        "resx_key" => $this->action(),
        "step" => ($rows_affected === count($task_ids)) ? "success" : "error"
    ));
  }

  public function executeManageLocations(\Library\HttpRequest $rq) {
    \Applications\PMTool\Helpers\TaskHelper::SetActiveTab($this->user(), \Applications\PMTool\Resources\Enums\TaskTabKeys::LocationsTab);
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->user());
    $sessionTask = \Applications\PMTool\Helpers\TaskHelper::GetCurrentSessionTask($this->user());

    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentTask, $sessionTask[\Library\Enums\SessionKeys::TaskObj]);

    $data = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_right => $sessionProject[\Library\Enums\SessionKeys::ProjectLocations],
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_left => array(),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_right => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower("location")),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_left => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower($this->module()))
    );
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data, $data);


    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::tabStatus, \Applications\PMTool\Helpers\TaskHelper::GetTabsStatus($this->user()));

    //Which module?
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

}
