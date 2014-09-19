<?php
/**
 *
 * @package		Basic MVC framework
 * @author		FWM DEV Team
 * @copyright	Copyright (c) 2014
 * @license		
 * @link		
 * @since		
 * @filesource
 */
// ------------------------------------------------------------------------

/**
 * ViewVariablesKeys Class
 *
 * @package		Applications/PMTool
 * @subpackage	Resources/Enum
 * @category	ViewVariablesKeys
 * @author		FWM DEV Team
 * @link		
 */


namespace Applications\PMTool\Resources\Enums;
if ( ! defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed');

class ViewVariablesKeys {
  //Generic keys
  const data = "data";
  const module = "module";
  const objects = "objects";
  const properties = "properties";
  const property_id = "prop_id";
  const property_name = "prop_name";
  const property_active = "prop_active";


  const active_list = "active_list_module";
  const inactive_list = "inactive_list_module";
  
  const currentProject = "current_project";
  
  //Project's views variables
  const form_modules = "form_modules"; 
  const projects = "projects"; 
  
  //Location's views variables
  
}

?>