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
 * Template controller Class
 *
 * @package		Application/PMTool
 * @subpackage	Controllers
 * @category	TemplateController
 * @author		FWM DEV Team
 * @link
 */
namespace Applications\PMTool\Controllers;
if ( ! defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed');

class ServiceProviderController extends \Library\BaseController {

  public function executeIndex(\Library\HttpRequest $rq) {
  }

  public function executeServiceDiscussion(\Library\HttpRequest $rq) {
    $discussionId = $rq->getData("discussion_id");
    $currentUserObject = $this->user->getAttribute(\Library\Enums\SessionKeys::UserConnected);
    $data["username"] = $rq->getData("username");
    $data["pwd"] = $rq->getData("password");
    $data["encrypted_pwd"] = true;
    //check if user is already logged in and if username and password aren't sent through url
    if($currentUserObject instanceof \Applications\PMTool\Models\Dao\User && !isset($data["username"]) && !isset($data["pwd"])) {

    } else {
      $authProvider = new \Applications\PMTool\AuthProvider($this->app->config->get("encryption_key"), $this->managers->getManagerOf('Login'));
      $authProvider->prepareUser($data);
      if($authProvider->getUser() instanceof \Library\Interfaces\IUser) {
        $this->app->auth->authenticate($authProvider->getUser());
        $this->user->setAttribute(\Library\Enums\SessionKeys::UserTypeObject,$authProvider->getUserType());
        if ($authProvider->getUser()) {
          $user = $this->app->user;
          $routes = array_filter($this->app->router->routes(), function ($route) use ($user) {
            return (count($route->role()) == 0) || in_array($user->getRole(), $route->role());
          });
          \Applications\PMTool\Helpers\UserHelper::SaveRoutes($user, $routes);
          switch ($authProvider->getUser()->getType()) {
            case 'technician_id':
              break;
            case 'pm_id':
              \Applications\PMTool\Helpers\PmHelper::StoreSessionPm($this, $authProvider->getUserType(), true);
              break;
          }
        }
      }
      $currentUserObject = $this->user->getAttribute(\Library\Enums\SessionKeys::UserConnected);
    }

    $discussionArray = \Applications\PMTool\Helpers\DiscussionHelper::GetDiscussionByIdFromDB($this, $discussionId);
    $user = \Applications\PMTool\Helpers\CommonHelper::FindObjectByIntValue(intval($currentUserObject->user_id()),'user_id',$discussionArray[\Library\Enums\SessionKeys::DiscussionPeople]);
    //check if logged in user is the part of this discussion
    if($user) {
      \Applications\PMTool\Helpers\DiscussionHelper::SetCurrentDiscussion($this->user, $discussionArray[\Library\Enums\SessionKeys::DiscussionObj], $discussionArray[\Library\Enums\SessionKeys::DiscussionPeople]);
      $currentDiscussion = $discussionArray;

      if($currentDiscussion){
        $manager = $this->managers()->getManagerOf('User');
        $discussion_person = \Applications\PMTool\Helpers\CommonHelper::FindObjectByIntValue(1,'discussion_person_is_author',$currentDiscussion[\Library\Enums\SessionKeys::DiscussionPeople]);
        $discussion_user_type = $manager->selectUserTypeObjectByUserId($discussion_person->user_id());
        if($discussion_user_type) {
          $currentDiscussion['comm_with'] = $discussion_user_type;
          $currentDiscussion['comm_type'] = \Applications\PMTool\Helpers\UserHelper::FindUserTypeFromObject($discussion_user_type);
        }
        $this->page->addVar(\Applications\PMTool\Resources\Enums\ViewVariablesKeys::currentDiscussion, $currentDiscussion);
      }


    } else {
      \Applications\PMTool\Helpers\DiscussionHelper::UnsetCurrentDiscussion($this->user);
    }
    $modules = $this->app()->router()->selectedRoute()->phpModules();
    $this->page->addVar(
      \Applications\PMTool\Resources\Enums\ViewVariablesKeys::form_modules, $modules);

  }

}