<?php

namespace Applications\PMTool\Controllers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class LocationController extends \Library\BaseController {

  public function executeIndex(\Library\HttpRequest $rq) {
    
  }

  public function executeShowForm(\Library\HttpRequest $rq) {
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    //Check if a project needs to be selected in order to display this page
    if (!$sessionProject)
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::ProjectsSelectProject . "?onSuccess=" . \Library\Enums\ResourceKeys\UrlKeys::LocationShowForm);
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);
	
	//Get confirm msg for location deletion
    $confirm_msg = \Applications\PMTool\Helpers\PopUpHelper::getConfirmBoxMsg('{"targetcontroller":"location", "targetaction": "view", "operation": ["delete", "addUniqueCheck"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::confirm_message, $confirm_msg);
	
	//Fetch prompt box data from xml and pass to view as an array
    $prompt_msg = \Applications\PMTool\Helpers\PopUpHelper::getPromptBoxMsg('{"targetcontroller":"location", "targetaction": "showForm", "operation": ["promptEnterLocation"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::prompt_message, $prompt_msg);
	
	//Fetch alert box data
    /*$alert_msg = \Applications\PMTool\Helpers\PopUpHelper::getConfirmBoxMsg('{"targetcontroller":"location", "targetaction": "view", "operation": ["addUniqueCheck"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::confirm_message, $alert_msg);*/
	
    if ($rq->getData("mode") === "edit") {
      $this->page->addVar("location_editing_header", $this->resxData["location_legend_edit"]);
    } else {
      $this->page->addVar("location_editing_header", $this->resxData["location_legend_add"]);
    }
    //Which module?
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

  public function executeUploadList(\Library\HttpRequest $rq) {
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    //Check if a project needs to be selected in order to display this page
    if (!$sessionProject)
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::ProjectsSelectProject . "?onSuccess=" . \Library\Enums\ResourceKeys\UrlKeys::LocationUploadList);
	  
	//Fetch tooltip data from xml and pass to view as an array
    $tooltip_array = \Applications\PMTool\Helpers\PopUpHelper::getTooltipMsgForAttribute('{"targetcontroller":"location", "targetaction": "uploadList", "targetattr": ["question-location-headingH3"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::tooltip_message, $tooltip_array);
	
	//Fetch alert box data
    $alert_msg = \Applications\PMTool\Helpers\PopUpHelper::getConfirmBoxMsg('{"targetcontroller":"location", "targetaction": "uploadList", "operation": ["addUniqueCheck"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::confirm_message, $alert_msg);
	
	$this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);
	$this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $this->app()->router()->selectedRoute()->phpModules());
  }

  public function executeListAll(\Library\HttpRequest $rq) {
    //Get list of location stored in session
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    //Check if a project needs to be selected in order to display this page
    if (!$sessionProject)
      $this->Redirect(\Library\Enums\ResourceKeys\UrlKeys::ProjectsSelectProject . "?onSuccess=" . \Library\Enums\ResourceKeys\UrlKeys::LocationListAll);
	  
	//Fetch tooltip data from xml and pass to view as an array
    $tooltip_array = \Applications\PMTool\Helpers\PopUpHelper::getTooltipMsgForAttribute('{"targetcontroller":"location", "targetaction": "list", "targetattr": ["active-location-header","inactive-location-header"]}', $this->app->name());
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariables\Popup::tooltip_message, $tooltip_array);
    
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentProject, $sessionProject[\Library\Enums\SessionKeys::ProjectObject]);

    $this->_GetAndStoreLocationsInSession($sessionProject);
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $locations = $sessionProject[\Library\Enums\SessionKeys::ProjectLocations];
    $data = array(
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::module => strtolower($this->module()),
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::objects => $locations,
        \Applications\PMTool\Resources\Enums\ViewVariablesKeys::properties => \Applications\PMTool\Helpers\CommonHelper::SetPropertyNamesForDualList(strtolower($this->module()))
    );
    $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::data, $data);

    $modules = $this->app()->router()->selectedRoute()->phpModules();
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::active_list, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::active_list]);
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::inactive_list, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::inactive_list]);
    $this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariablesKeys::promote_buttons, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::promote_buttons]);
	$this->page->addVar(
            \Applications\PMTool\Resources\Enums\ViewVariables\Popup::tooltip_message_module, $modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::tooltip_msg]);
  }

  public function executeAdd(\Library\HttpRequest $rq) {
    $result = \Applications\PMTool\Helpers\LocationHelper::AddProjectLocation($this, $this->InitResponseWS());
    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
        "resx_key" => $this->action(),
        "step" => $result["dataId"] > 0 ? "success" : "error"
    ));
  }

  public function executeEdit(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());

    //Init PDO
    $location = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), new \Applications\PMTool\Models\Dao\Location());
    $result["data"] = $location;

    $manager = $this->managers->getManagerOf($this->module());
    $result_edit = $manager->edit($location, "location_id");

    //Clear the location and facility list from session for the connect PM
    if ($result_edit) {
      $locationMatch = $this->_GetLocationFromSession(intval($location->location_id()));
      $sessionProject[\Library\Enums\SessionKeys::ProjectLocations][$locationMatch["key"]] = $location;
      \Applications\PMTool\Helpers\ProjectHelper::SetUserSessionProject($this->app()->user(), $sessionProject);
    }

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
        "resx_key" => $this->action(),
        "step" => $result_edit ? "success" : "error"
    ));
  }
  /*
   * Preload location object and edit only fields set in request
   */
  public function executeMapEdit(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $db_result = false;
    //get location id from post
    $location_id = intval($this->dataPost["location_id"]);

    //load location by id from session
    $location_selected = $this->_GetLocationFromSession($location_id);

    $location = $location_selected["object"];

    //save location project id
    $oldProjectId = $location->project_id();
    if ($location !== NULL) {
      //Init PDO
      $location = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), $location);
      $result["data"] = $location;

      $manager = $this->managers->getManagerOf($this->module());
      $result_edit = $manager->edit($location, "location_id");
    }

    //Clear the location and facility list from session for the connect PM
    if ($result_edit) {
      //check if we have new project id so that we unset location from the current project or to update it if project isn't changed
      $newProjectId = $location->project_id();
      $locationMatch = $this->_GetLocationFromSession(intval($location->location_id()));
      if($oldProjectId != $newProjectId){
        unset($sessionProject[\Library\Enums\SessionKeys::ProjectLocations][$locationMatch["key"]]);
      } else {
        $sessionProject[\Library\Enums\SessionKeys::ProjectLocations][$locationMatch["key"]] = $location;
      }
      \Applications\PMTool\Helpers\ProjectHelper::SetUserSessionProject($this->app()->user(), $sessionProject);
    }

    $this->SendResponseWS(
      $result, array(
      "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
      "resx_key" => $this->action(),
      "step" => $result_edit ? "success" : "error"
    ));
  }


  public function executeDelete(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $db_result = FALSE;
    $location_id = intval($this->dataPost["location_id"]);

    //Check if the location to be deleted if the Location manager's
    $location_selected = $this->_GetLocationFromSession($location_id);
    //Load interface to query the database
    if ($location_selected["object"] !== NULL) {
      $manager = $this->managers->getManagerOf($this->module());
      $db_result = $manager->delete($location_selected["object"], "location_id");
      if ($db_result) {
        unset($sessionProject[\Library\Enums\SessionKeys::ProjectLocations][$location_selected["key"]]);
        \Applications\PMTool\Helpers\ProjectHelper::SetUserSessionProject($this->app()->user(), $sessionProject);
      }
    }

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
        "resx_key" => $this->action(),
        "step" => $db_result !== FALSE ? "success" : "error"
    ));
  }

  public function executeGetList(\Library\HttpRequest $rq = NULL, $sessionProject = NULL, $isAjaxCall = FALSE) {
    // Init result
    $result = \Applications\PMTool\Helpers\LocationHelper::GetLocationList($this, $sessionProject);
    if ($isAjaxCall) {
      $step_result = $result[\Library\Enums\SessionKeys::ProjectLocations] !== NULL ? "success" : "error";
      $this->SendResponseWS(
              $result, array(
          "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
          "resx_key" => $this->action(),
          "step" => $step_result
      ));
    }
  }

  public function executeGetItem(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $location_id = intval($this->dataPost["location_id"]);

    $location_selected = $this->_GetLocationFromSession($location_id);

    $result["location"] = $location_selected["object"];
    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
        "resx_key" => $this->action(),
        "step" => ($location_selected !== NULL) ? "success" : "error"
    ));
  }

  public function executeUpdateItems(\Library\HttpRequest $rq) {
    $result = \Applications\PMTool\Helpers\LocationHelper::UpdateLocations($this);

    $this->SendResponseWS(
            $result, array(
        "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
        "resx_key" => $this->action(),
        "step" => ($result["rows_affected"] === count($result["location_ids"])) ? "success" : "error"
    ));
  }

  public function executeIfLocationExists(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS(); // Init result
    //get current project
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    //prepare location
    $location = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), new \Applications\PMTool\Models\Dao\Location());

    //get locations of the current project
    $sessionLocations = $sessionProject[\Library\Enums\SessionKeys::ProjectLocations];

    $match = \Applications\PMTool\Helpers\CommonHelper::FindObjectByStringValue(
      $location->location_name(), "location_name",
      $sessionLocations
    );

    $result['record_count'] = (!$match || empty($match)) ? 0 : 1;

    $this->SendResponseWS(
      $result, array(
      "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
      "resx_key" => $this->action(),
      "step" => ($result['record_count'] > 0) ? "success" : "error"
    ));
  }
  
  public function executeIfAllLocationsExist(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS(); // Init result
	//get current project
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
	//get locations of the current project
    $sessionLocations = $sessionProject[\Library\Enums\SessionKeys::ProjectLocations];
	
	$postData = $this->dataPost();
	$location_names = \Applications\PMTool\Helpers\CommonHelper::StringToArray("\n", $postData["location_names"]);

	//Loop on the names
	$redundantLocs = array();
	foreach($location_names as $the_locname) {
	  $location = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject(array('location_name' => $the_locname), new \Applications\PMTool\Models\Dao\Location());
	  $match = \Applications\PMTool\Helpers\CommonHelper::FindObjectByStringValue(
	    $location->location_name(), "location_name",
	    $sessionLocations
	  );
	  if($match && !empty($match)) {
		array_push($redundantLocs, $the_locname);
	  }
	}
	
	
	$result['record_count'] = (empty($redundantLocs)) ? 0 : count($redundantLocs);
	$result['duplicate_locations'] = $redundantLocs;
	
	$this->SendResponseWS(
      $result, array(
      "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Location,
      "resx_key" => $this->action(),
      "step" => ($result['record_count'] > 0) ? "success" : "error"
    ));
  }

  private function _GetAndStoreLocationsInSession($sessionProject) {
    $lists = array();
    if (count($sessionProject[\Library\Enums\SessionKeys::ProjectLocations]) === 0 || !$sessionProject[\Library\Enums\SessionKeys::ProjectLocations]) {
      $this->executeGetList(NULL, $sessionProject, false);
    } else {
      //The locations are already in Session
    }
  }

  private function _GetLocationFromSession($location_id) {
    $locationMatch = array();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $locations = $sessionProject[\Library\Enums\SessionKeys::ProjectLocations];
    foreach (array_keys($locations) as $index => $key) {
      if (intval($locations[$key]->location_id()) === $location_id) {
        $locationMatch["object"] = $locations[$key];
        $locationMatch["key"] = $key;
        break;
      }
    }
    return $locationMatch;
  }

}
