<?php

/**
 *
 * @package		Basic MVC framework
 * @author		FWM DEV Team
 * @copyright	Copyright (c) 2015
 * @license		
 * @link		
 * @since		
 * @filesource
 */
// ------------------------------------------------------------------------

/**
 * Authenticate controller Class
 *
 * @package		Application/PMTool
 * @subpackage	Controllers
 * @category	FacilityController
 * @author		FWM DEV Team
 * @link		
 */

namespace Applications\PMTool\Controllers;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class FacilityController extends \Library\BaseController {

  /**
   * Method that adds a facility and returns the result of operation
   * 
   * @param \Library\HttpRequest $rq
   * @return JSON
   */
  public function executeAdd(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS();
    $dataPost = $this->dataPost();

    if($dataPost['facility_lat'] == "" or $dataPost['facility_long'] == ""){
      $latLng =  \Applications\PMTool\Helpers\MapHelper::GetCoordinatesToCenterOverARegion($this->app()->config());
      $dataPost['facility_lat'] = $latLng['lat'];
      $dataPost['facility_long'] = $latLng['lng'];
    }
    $facility = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($dataPost, new \Applications\PMTool\Models\Dao\Facility());
    $result["data"] = $facility;
    //Load interface to query the database
    $manager = $this->managers->getManagerOf($this->module());
    $result["dataId"] = $manager->add($facility);
    $facility->setFacility_id($result["dataId"]);
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetUserSessionProject($this->app()->user(), $facility->project_id());
    $sessionProject[\Library\Enums\SessionKeys::FacilityObject] = $facility;
    \Applications\PMTool\Helpers\ProjectHelper::UpdateUserSessionProject($this->app()->user(), $sessionProject);
    
    //Process DB result and send result
    if ($result["dataId"] > 0)
    {
      $result = $this->SendResponseWS(
              $result,
              array(
                  "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Facility, 
                  "resx_key" => $this->action(), "step" => $result["dataId"] > 0 ? "success" : "error"));
    }
  }

  /**
   * Method that edits a a facility and returns the result of operation
   * 
   * @param \Library\HttpRequest $rq
   * @return JSON
   */
  public function executeEdit(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS();

    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetUserSessionProject($this->app()->user(), $this->dataPost["project_id"]);
    //load facility from session project
    $facility = $sessionProject[\Library\Enums\SessionKeys::FacilityObject];
    //Load interface to query the database
    $manager = $this->managers->getManagerOf($this->module());
    $result_edit = $manager->edit(
        \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject(
            $this->dataPost(),$facility),
        "facility_id"
        );
    $result["dataId"] = $this->dataPost["facility_id"];

    if ($result_edit) {

      $sessionProject[\Library\Enums\SessionKeys::FacilityObject] = 
              \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), new \Applications\PMTool\Models\Dao\Facility());
      \Applications\PMTool\Helpers\ProjectHelper::UpdateUserSessionProject($this->app()->user(), $sessionProject);
    }
    $result = $this->SendResponseWS(
            $result,
            array(
                "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Facility, 
                "resx_key" => $this->action(), "step" => $result_edit ? "success" : "error"));
  }
  /**
   * Method that edits a facility based on request params and returns the result of operation
   *
   * @param \Library\HttpRequest $rq
   * @return JSON
   */
  public function executeMapEdit(\Library\HttpRequest $rq) {
    // Init result
    $result = $this->InitResponseWS();
    $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
    $db_result = false;

    //load facility for current project
    $facility = $sessionProject[\Library\Enums\SessionKeys::FacilityObject];

    if ($facility !== NULL) {
      //Init PDO
      $facility = \Applications\PMTool\Helpers\CommonHelper::PrepareUserObject($this->dataPost(), $facility);
      $result["data"] = $facility;

      $manager = $this->managers->getManagerOf($this->module());
      $result_edit = $manager->edit($facility, "facility_id");
    }

    //Clear the location and facility list from session for the connect PM
    if ($result_edit) {
      $sessionProject = \Applications\PMTool\Helpers\ProjectHelper::GetCurrentSessionProject($this->app()->user());
      $sessionProject[\Library\Enums\SessionKeys::FacilityObject] = $facility;
      \Applications\PMTool\Helpers\ProjectHelper::UpdateUserSessionProject($this->app()->user(), $sessionProject);
    }

    $this->SendResponseWS(
      $result, array(
      "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Facility,
      "resx_key" => $this->action(),
      "step" => $result_edit ? "success" : "error"
    ));
  }

  /**
   * Method that delete a facility and returns the result of operation
   * 
   * @param \Library\HttpRequest $rq
   * @return JSON
   */
  public function executeDelete(\Library\HttpRequest $rq) {
    //Delete is done in ProjectController->executeDelete (also see ProjectDal->delete)
  }
  /**
   * Method that retrieves a list of facilities for a project
   * 
   * @param \Library\HttpRequest $rq
   * @return JSON
   */
  public function executeGetList(\Library\HttpRequest $rq, $isNotAjaxCall = FALSE) {
    //The logic is found in ProjectController->executeGetList
  }

  public function executeGetItem(\Library\HttpRequest $rq) {
    $result = $this->InitResponseWS();

    $sessionProjects = \Applications\PMTool\Helpers\ProjectHelper::GetSessionProjects($this->user());

    $facilities = \Applications\PMTool\Helpers\CommonHelper::GetObjectListFromSessionArrayBySessionKey($sessionProjects,\Library\Enums\SessionKeys::FacilityObject);
    $facility = \Applications\PMTool\Helpers\CommonHelper::FindObjectByIntValue(intval($this->dataPost["facility_id"]),'facility_id',$facilities);

    $projects = \Applications\PMTool\Helpers\CommonHelper::GetObjectListFromSessionArrayBySessionKey($sessionProjects,\Library\Enums\SessionKeys::ProjectObject);
    $project = \Applications\PMTool\Helpers\CommonHelper::FindObjectByIntValue(intval($facility->project_id()),'project_id',$projects);
    $result['data'][0]['facility'] = $facility;
    $result['data'][0]['project'] = $project;

    $this->SendResponseWS(
      $result, array(
      "resx_file" => \Applications\PMTool\Resources\Enums\ResxFileNameKeys::Facility,
      "resx_key" => $this->action(),
      "step" => count($result['data'])>0 ? "success" : "error"
    ));
  }

}
