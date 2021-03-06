<?php

/**
 *
 * @package		Basic MVC framework
 * @author		Jeremie Litzler
 * @copyright	Copyright (c) 2015
 * @license		
 * @link		
 * @since		
 * @filesource
 */
// ------------------------------------------------------------------------

/**
 * CommonHelper Class
 *
 * @package		Application/PMTool
 * @subpackage	Helpers
 * @category	TaskHelper
 * @author		FWM DEV Team
 * @link		
 */

namespace Applications\PMTool\Helpers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class TaskHelper {

  public static function AddSessionTask($user, \Applications\PMTool\Models\Dao\Task $task) {
    $sessionTasks = self::GetSessionTasks($user);
    $sessionTask = self::MakeSessionTask($task);
    $sessionTasks[\Library\Enums\SessionKeys::TaskKey . $task->task_id()] = $sessionTask;
    self::SetCurrentSessionTask($user, $sessionTask);
    self::SetSessionTasks($user, $sessionTasks);
  }

  public static function AddTabsStatus(\Library\User $user) {
    $tabs = array(
        \Applications\PMTool\Resources\Enums\TaskTabKeys::InfoTab => "active",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::TechniciansTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::LocationsTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::InspFormsTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::FieldAnalytesTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::CocTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::LabAnalytesTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::ServicesTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::FieldSampleMatrixTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::LabSampleMatrixTab => "",
        \Applications\PMTool\Resources\Enums\TaskTabKeys::FormsTab => "",
    );
    $user->setAttribute(\Library\Enums\SessionKeys::TabsStatus, $tabs);
  }

  /**
   * <p>
   * Sets the data into the task session array when it is selected so that the 
   * data necessary is available for the different actions.
   * </p>
   * @param type $caller <p>
   * Instance the controller calling the helper class </p>
   * @param type $sessionTask <p>
   * The session array of type Task to use. It needs to be refreshed at every
   * action </p>
   */
  public static function FillSessionTask($caller, $sessionTask) {
    ServiceHelper::GetAndStoreTaskServices($caller, $sessionTask);

    //Get the refreshed session array value and then update it then
    $sessionTask = self::GetCurrentSessionTask($caller->user());

    //Then you can do your logic to update the session array value
  }

  public static function GetAndStoreCurrentTask(\Library\User $user, $task_id) {
    $sessionTasks = NULL;
    if ($user->keyExistInSession(\Library\Enums\SessionKeys::SessionTasks)) {
      $sessionTasks = $user->getAttribute(\Library\Enums\SessionKeys::SessionTasks);
    }

    //If there is no session tasks yet, create one with the $task id given
    if ($sessionTasks !== NULL) {
      $key = \Library\Enums\SessionKeys::TaskKey . $task_id;
      $user->setAttribute(\Library\Enums\SessionKeys::CurrentTask, $sessionTasks[$key]);
      return array_key_exists($key, $sessionTasks) ?
              $sessionTasks[$key][\Library\Enums\SessionKeys::TaskObject] : NULL;
    }
    return NULL;
  }

  public static function GetFilteredTaskObjectsList(\Library\User $user) {
    $filteredTaskList = array();
    $sessionTasks = self::GetSessionTasks($user);
    foreach (self::GetSessionProjectTasks($user) as $task_key) {
      if (array_key_exists($task_key, $sessionTasks)) {
        array_push($filteredTaskList, $sessionTasks[$task_key][\Library\Enums\SessionKeys::TaskObj]);
      }
    }
    return $filteredTaskList;
  }

  public static function GetSessionTask(\Library\User $user, $task_id) {
    //retrieve the session task from $task_id
    $sessionTasks = self::GetSessionTasks($user);
    $key = \Library\Enums\SessionKeys::TaskKey;
    if ($task_id !== 0) {
      $key .= $task_id;
    }
    $user->setAttribute(\Library\Enums\SessionKeys::CurrentTask, $sessionTasks[$key]);
    return $sessionTasks[$key];
  }

  public static function GetSessionTasks(\Library\User $user) {
    return $user->getAttribute(\Library\Enums\SessionKeys::SessionTasks);
  }

  public static function GetSessionProjectTasks(\Library\User $user) {
    $currentProject = ProjectHelper::GetCurrentSessionProject($user);
    return $currentProject[\Library\Enums\SessionKeys::ProjectTasks];
  }

  public static function GetTabsStatus(\Library\User $user) {
    return $user->getAttribute(\Library\Enums\SessionKeys::TabsStatus);
  }

  public static function GetTaskInfoTabUrl($currentTask) {
    if ($currentTask === NULL) {
      return
              \Library\Enums\ResourceKeys\UrlKeys::TaskShowForm
              . "?mode=add";
    } else {
      return
              \Library\Enums\ResourceKeys\UrlKeys::TaskShowForm
              . "?mode=edit&task_id="
              . $currentTask->task_id();
    }
  }

  public static function GetTaskCocTabUrl($currentTask) {

    return
            \Library\Enums\ResourceKeys\UrlKeys::TaskCOC
            . "?mode=edit&task_id="
            . $currentTask->task_id();
  }

  public static function GetCurrentSessionTask($user) {
    return $user->keyExistInSession(\Library\Enums\SessionKeys::CurrentTask) ?
            $user->getAttribute(\Library\Enums\SessionKeys::CurrentTask) : FALSE;
  }

  public static function MakeSessionTask(\Applications\PMTool\Models\Dao\Task $task) {
    $sessionTask = array(
        \Library\Enums\SessionKeys::TaskObj => $task,
        \Library\Enums\SessionKeys::TaskCocInfoObj => NULL,
        \Library\Enums\SessionKeys::TaskLocations => array(),
        \Library\Enums\SessionKeys::TaskTechnicians => array()
    );
    return $sessionTask;
  }

  public static function UserHasTasks(\Library\User $user, $task_id) {
    return count(self::GetFilteredTaskObjectsList($user)) > 0;
  }

  public static function SetActiveTab(\Library\User $user, $tab_name) {
    $tabs = $user->getAttribute(\Library\Enums\SessionKeys::TabsStatus);
    foreach ($tabs as $key => $value) {
      $tabs[$key] = "";
    }
    $tabs[$tab_name] = "active";
    $user->setAttribute(\Library\Enums\SessionKeys::TabsStatus, $tabs);
  }

  public static function SetCurrentSessionTask(\Library\User $user, $sessionTask = NULL, $task_id = 0) {
    $currentSessionTask = $user->getAttribute(\Library\Enums\SessionKeys::CurrentTask);

    if ($task_id > 0 && $sessionTask === NULL) {
      $sessionTasks = self::GetSessionTasks($user);
      $sessionTask = $sessionTasks[\Library\Enums\SessionKeys::TaskKey . $task_id];
      if ($currentSessionTask != NULL && $sessionTask !== NULL && $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id() != $currentSessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id()) {
        $user->unsetAttribute(\Library\Enums\SessionKeys::CurrentDiscussion);
      }
    }
    $user->setAttribute(\Library\Enums\SessionKeys::CurrentTask, $sessionTask);
    return $sessionTask;
  }

  public static function SetSessionTasks($user, $tasks) {
    $user->setAttribute(\Library\Enums\SessionKeys::SessionTasks, $tasks);
  }

  public static function SetSessionTask(\Library\User $user, $sessionTask) {
    $sessionTasks = $user->getAttribute(\Library\Enums\SessionKeys::SessionTasks);
    $task_id = $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id();
    $sessionTasks[\Library\Enums\SessionKeys::TaskKey . $task_id] = $sessionTask;
    $user->setAttribute(\Library\Enums\SessionKeys::CurrentTask, $sessionTask);
    self::SetSessionTasks($user, $sessionTasks);
  }

  public static function getLabServicesForTask($caller, $sessionTask, $filterCategory) {
    $labServices = $taskServices = array();
    if (isset($sessionTask[\Library\Enums\SessionKeys::TaskServices]) && count($sessionTask[\Library\Enums\SessionKeys::TaskServices]) > 0) {
      $taskServices = \Applications\PMTool\Helpers\ServiceHelper::GetServicesFromTaskServices($caller->user(), $sessionTask);
    } else {
      $taskServices = ServiceHelper::GetAndStoreTaskServices($caller, $sessionTask);
      $sessionTask[\Library\Enums\SessionKeys::TaskServices] = $taskServices;
      TaskHelper::SetSessionTask($caller->user(), $sessionTask);
    }
    foreach ($taskServices as $service) {
      if ($service['service_type'] === $filterCategory) {
        array_push($labServices, $service);
      }
    }
    return $labServices;
  }

  public static function StoreSessionTask($user, $list, $sessionProject = NULL) {
    $SessionTasks = array();
    $project =
            $sessionProject === NULL ?
            ProjectHelper::GetCurrentSessionProject($user) :
            $sessionProject;
    $countActiveTask = 0;
    foreach ($list as $task) {
      $key = \Library\Enums\SessionKeys::TaskKey . $task->task_id();
      $sessionTask = self::MakeSessionTask($task);
      $SessionTasks[$key] = $sessionTask;
      array_push($project[\Library\Enums\SessionKeys::ProjectTasks], $key);
      if ($task->task_active()) {
        $countActiveTask += 1;
        $currentSessionTask = $sessionTask; //Get sessin task object
      }
    }
    ProjectHelper::SetUserSessionProject($user, $project);
    self::SetSessionTasks($user, $SessionTasks);
    if ($countActiveTask === 1) {//Set current task if there is only one active
      self::SetCurrentSessionTask($user, $currentSessionTask);
    }
    return $SessionTasks;
  }

  public static function UnsetUserSessionTask(\Library\User $user, $task_id) {
    $sessionTasks = $user->getAttribute(\Library\Enums\SessionKeys::SessionTasks);
    unset($sessionTasks[\Library\Enums\SessionKeys::TaskKey . $task_id]);
    self::UnsetCurrentSessionTask($user);
    $user->setAttribute(\Library\Enums\SessionKeys::SessionTasks, $sessionTasks);
  }

  public static function UnsetCurrentSessionTask(\Library\User $user) {
    $user->unsetAttribute(\Library\Enums\SessionKeys::CurrentTask);
  }

  public static function UpdateSessionTask(\Library\User $user, $sessionTask) {
    $sessionTasks = self::GetSessionTasks($user);
    if ($sessionTasks !== NULL) {
      $currentSessionTask = $user->getAttribute(\Library\Enums\SessionKeys::CurrentTask);
      $sessionTasks[\Library\Enums\SessionKeys::TaskKey . $sessionTask[\Library\Enums\SessionKeys::TaskObject]->task_id()] = $currentSessionTask = $sessionTask;
      self::SetSessionTask($user, $currentSessionTask);
      self::SetSessionTasks($user, $sessionTasks);
    }
  }

  /**
   * Returns which tabs are to be shown
   * for the passed task
   */
  public static function TabStatusFor($sessionTask) {
    $ret_val = array(
        \Applications\PMTool\Resources\Enums\ViewVariables\Task::task_req_service => $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_req_service(),
        \Applications\PMTool\Resources\Enums\ViewVariables\Task::task_req_form => $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_req_form(),
        \Applications\PMTool\Resources\Enums\ViewVariables\Task::task_req_field_analyte => $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_req_field_analyte(),
        \Applications\PMTool\Resources\Enums\ViewVariables\Task::task_req_lab_analyte => $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_req_lab_analyte(),
    );
    return $ret_val;
  }

  /**
   * For the passed task ID, creates location specific 
   * PDF forms from PDF template
   */
  public static function CreateLocationSpecificPDF($sessionTask, $caller) {

    $task_id = $sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($caller->user());

    //Fetch the locations for this task
    $taskLocations = self::GetTaskLocationsForTask($sessionTask, $caller);

    //Fetch the template file relation for this task
    $taskTemplateForms = self::GetTaskTemplateFormForTask($sessionTask, $caller);

    self::ProcessTemplateForms($caller, $sessionTask, $taskLocations, $taskTemplateForms);
  }

  public static function GetTaskLocationsForTask($sessionTask, $caller) {
    $taskLocationDAO = new \Applications\PMTool\Models\Dao\Task_location();
    $taskLocationDAO->setTask_id($sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id());
    $dal = $caller->managers()->getManagerOf("Task");
    return $dal->selectMany($taskLocationDAO, "task_id");
  }

  public static function GetTaskTemplateFormForTask($sessionTask, $caller) {
    $templateDAO = new \Applications\PMTool\Models\Dao\Task_template_form();
    $templateDAO->setTask_id($sessionTask[\Library\Enums\SessionKeys::TaskObj]->task_id());
    $dal = $caller->managers()->getManagerOf("Task");
    return $dal->selectMany($templateDAO, "task_id");
  }

  public static function ProcessTemplateForms($caller, $sessionTask, $taskLocations, $taskTemplateForms) {
    foreach ($taskTemplateForms as $template) {
      //And finally the file itself, which needs to be copied
      //It could be a master form or a user forms, check
      if (is_null($template->master_form_id()) || $template->master_form_id() == '0') {
        //master form id doesn't exist, it must be an user form
        $formData = UserFormHelper::GetFormFromTaskTemplateFrom($caller, $template);
        $tmp_name = './uploads/user_form/' . $formData[0]->value();
      } else {
        //mster form
        $formData = MasterFormHelper::GetFormFromTaskTemplateFrom($caller, $template);
        $tmp_name = './uploads/master_form/' . $formData[0]->value();
      }
      //Pseudo array for file based on the master file
      $file['file'] = array(
          'name' => $formData[0]->value(),
          'type' => $formData[0]->content_type(),
          'tmp_name' => $tmp_name,
          'error' => 0,
          'size' => $formData[0]->size() * 1000
      );

      //So now we have to loop over the locations and create multiple files
      self::ProcessTaskLocations($caller, $sessionTask, $taskLocations, $file, $formData);
    }
  }

  public static function ProcessTaskLocations($caller, $sessionTask, $taskLocations, $file, $formData) {
    foreach ($taskLocations as $loc_key => $taskLocationObj) {
      //We have to get the Location names too
      //Check if exists in Session
      $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($caller->user());
      //Recall session projects
      $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($caller->user());
      $locationRecord = \Applications\PMTool\Helpers\CommonHelper::FindIndexInObjectListById($taskLocationObj->location_id(), "location_id", $sessionProject, \Library\Enums\SessionKeys::ProjectLocations);

      if (!empty($locationRecord)) {
        $locationObject = $locationRecord['object'];
        self::CopyFileForTaskLocation($caller, $taskLocationObj, $locationObject, $file, $formData);
      } else {
        throw new \Exception("TaskHelper::ProcessTaskLocations ==> No location object found in ProjectLocations for location_id=" . $taskLocationObj->location_id());
      }
    }
  }

  public static function CopyFileForTaskLocation($caller, $taskLocationObj, $locationObj, $file, $formData) {
    $dataPost = array(
        'itemCategory' => 'task_location',
        'itemId' => $taskLocationObj->task_location_id(),
        'title' => $formData[0]->title() . '_' . $locationObj->location_name(),
        'itemReplace' => false
    );

    \Library\Controllers\FileController::copyFile($file, $dataPost, $caller);
  }

  public static function GetTaskListFromDb($caller, $sessionProjet = NULL) {
    $project =
            $sessionProjet === NULL ?
            \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($caller->user()) :
            $sessionProjet;
    //Load interface to query the database for tasks
    $task = new \Applications\PMTool\Models\Dao\Task();
    $task->setProject_id($project[\Library\Enums\SessionKeys::ProjectObject]->project_id());
    $manager = $caller->managers()->getManagerOf("Task");
    $sessionTasks = \Applications\PMTool\Helpers\TaskHelper::StoreSessionTask($caller->user(), $manager->selectMany($task, "project_id"));
    foreach ($sessionTasks as $sessionTask) {
      TaskHelper::FillSessionTask($caller, $sessionTask);
    }
    TaskHelper::SetCurrentSessionTask($caller->user(), NULL);
  }

}
