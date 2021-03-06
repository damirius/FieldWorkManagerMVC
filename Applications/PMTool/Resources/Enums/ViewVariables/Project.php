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
 * Project Class
 *
 * @package		Applications/PMTool
 * @subpackage	Resources/Enum
 * @category	Project
 * @author		FWM DEV Team
 * @link		
 */


namespace Applications\PMTool\Resources\Enums\ViewVariables;
if ( ! defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed');

class Project {
  //Modules keys
  const project_tabs_open = "project_tabs_open";
  const tabs_close = "tabs_close";
  
  const project_info_lists = "project_info_lists";
  const facility_info_lists = "facility_info_lists";
  const client_info_lists = "client_info_lists";

  const project_form = "project_form";
  const facility_form = "facility_form";
  const client_form = "client_form";

  const project_buttons = "project_buttons";
  const promote_buttons_module = "promote_buttons_module";


  //popup confirm msgs
  const popup_msg_module = "popup_msg_module";

  //prompt msg
  const popup_prompt_module = "popup_prompt_module";
  const popup_address = "popup_address";
  //Data keys

  
}

?>
