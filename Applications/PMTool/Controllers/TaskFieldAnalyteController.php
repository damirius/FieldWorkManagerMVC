<?php

namespace Applications\PMTool\Controllers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class TaskFieldAnalyteController extends \Library\BaseController {

  public function executeUpdateItems(\Library\HttpRequest $rq) {
    $result = \Applications\PMTool\Helpers\AnalyteHelper::UpdateProjectAnalytes($this);
    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::TaskFieldAnalyte,
        "resx_key" => $this->action(),
        "step" => ($result["rows_affected"] === count($result["arrayOfValues"])) ? "success" : "error"
    ));
  }

  public function executeManageLocations(\Library\HttpRequest $rq) {
    $sessionTask = \Applications\PMTool\Helpers\TaskHelper::GetCurrentSessionTask($this->user());
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->user());

    \Applications\PMTool\Helpers\TaskHelper::SetActiveTab($this->user(), \Applications\PMTool\Resources\Enums\TaskTabKeys::FieldAnalytesTab);
    //Get Project Analytes
    $project_analytes = array();
    
    //Get Task Analytes
    $task_analytes = array();
    
    //Filter Project Analytes
    $project_analytes = \Applications\PMTool\Helpers\LocationHelper::FilterLocationsToExcludeTaskLocations($project_analytes, $task_analytes);

    //Fetch tooltip data from xml and pass to view as an array
    $tooltip_array = \Applications\PMTool\Helpers\PopUpHelper::getTooltipMsgForAttribute('{"targetcontroller":"taskFieldAnalyte", "targetaction": "fieldAnalyte", "targetattr": ["active-taskAnalyte-header","inactive-taskAnalyte-header"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::tooltip_message, $tooltip_array);

    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentTask, $sessionTask[\Library\Enums\SessionKeys::TaskObj]);
    $data_left = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_list_left => $task_analytes,
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_left => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower("field_analyte"))
    );
    $data_right = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects_list_right => $project_analytes,
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties_right => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower("field_analyte"))
    );
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data_left, $data_left);
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data_right, $data_right);

    //tab status
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::tabStatus, \Applications\PMTool\Helpers\TaskHelper::GetTabsStatus($this->user()));
    //form modules
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

}
