<?php
namespace Applications\PMTool\Models\Dao;if ( ! defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed');
class Technician extends \Library\Entity{  public     $technician_id,    $technician_name,    $technician_phone,    $technician_email,    $technician_active;
  const     TECHNICIAN_ID_ERR = 0,    TECHNICIAN_NAME_ERR = 1,    TECHNICIAN_PHONE_ERR = 2,    TECHNICIAN_EMAIL_ERR = 3,    TECHNICIAN_ACTIVE_ERR = 4;
  // SETTERS //  public function setTechnician_id($technician_id) {      $this->technician_id = $technician_id;  }
  public function setTechnician_name($technician_name) {      $this->technician_name = $technician_name;  }
  public function setTechnician_phone($technician_phone) {      $this->technician_phone = $technician_phone;  }
  public function setTechnician_email($technician_email) {      $this->technician_email = $technician_email;  }
  public function setTechnician_active($technician_active) {      $this->technician_active = $technician_active;  }
  // GETTERS //  public function technician_id() {    return $this->technician_id;  }
  public function technician_name() {    return $this->technician_name;  }
  public function technician_phone() {    return $this->technician_phone;  }
  public function technician_email() {    return $this->technician_email;  }
  public function technician_active() {    return $this->technician_active;  }
}