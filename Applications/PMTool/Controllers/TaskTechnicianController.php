<?php

namespace Applications\PMTool\Controllers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class TaskTechnicianController extends \Library\BaseController {

  public function executeUpdateItems(\Library\HttpRequest $rq) {
    //Check how task technicians are implemented.
  }

  public function executeManageTechnicians(\Library\HttpRequest $rq) {
    $sessionTask = \Applications\PMTool\Helpers\TaskHelper::GetCurrentSessionTask($this->user());
    if ($sessionTask[\Library\Enums\SessionKeys::TaskObj] === NULL) {
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::TaskRootUrl);
    }

    \Applications\PMTool\Helpers\TaskHelper::SetActiveTab($this->user(), \Applications\PMTool\Resources\Enums\TaskTabKeys::TechniciansTab);
    $sessionPm = \Applications\PMTool\Helpers\PmHelper::GetCurrentSessionPm($this->user());
    $pm_technicians = \Applications\PMTool\Helpers\TechnicianHelper::GetPmTechnicians($this, $sessionPm);
    $task_technicians = \Applications\PMTool\Helpers\TechnicianHelper::GetAndStoreTaskTechnicians($this, $sessionTask);
    // filter the pm technicians after we retrieve the task technicians
    $pm_technicians = \Applications\PMTool\Helpers\TechnicianHelper::FilterTechniciansToExcludeTaskTechnicians($pm_technicians, $task_technicians);

    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentPm, $sessionPm[\Library\Enums\SessionKeys::PmObject]);
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentTask, $sessionTask[\Library\Enums\SessionKeys::TaskObj]);
    $this->page->addVar("HasItemsToDisplay", \Applications\PMTool\Helpers\PmHelper::DoesPmHaveActiveTechnicians($this->user()));
    $data = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_list_right => $pm_technicians,
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_list_left => $task_technicians,
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_right => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower("technician")),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_left => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower("technician"))
    );
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data, $data);

    //tab status
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::tabStatus, \Applications\PMTool\Helpers\TaskHelper::GetTabsStatus($this->user()));
    //form modules
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

}
