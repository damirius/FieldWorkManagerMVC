<?php

namespace Applications\PMTool\Models\Dal;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class TaskFormDal extends \Library\DAL\BaseManager {

  //  public function add($item) {  }

  //  public function edit($object, $where_filter_id) {  }

  public function deleteByFilters($object, $filters) {
    $tableName = \Applications\PMTool\Helpers\CommonHelper::GetShortClassName($object);
    $queryArray = array();
    $deleteQuery = "DELETE FROM `$tableName` WHERE ";
    foreach($filters as $filterName=>$filterValue) {
      $queryArray[]= "`$filterName` = :$filterName";
    }
    $query = implode(" AND ",$queryArray);
    $deleteQuery .= $query;
    $sth = $this->dao->prepare($deleteQuery);
    foreach($filters as $filterName=>$filterValue) {
      $sth->bindValue(":$filterName",$filterValue,\PDO::PARAM_STR);
    }
    try {
      $sth->execute();
      $sth->closeCursor();
      return true;
    } catch (Exception $exc) {
      return false;
    }
  }

  //used for deleting all relations between child tasks of the project and user/master forms by project id and user/master form id
  public function deleteByProjectAndFilters($object, $filters, $projectId) {
    $tableName = \Applications\PMTool\Helpers\CommonHelper::GetShortClassName($object);
    $queryArray = array();
    $query = "";
    foreach($filters as $filterName=>$filterValue) {
      $queryArray[]= "`$filterName` = '$filterValue'";
    }
    $query = implode(" AND ",$queryArray);
    try {
      $sql = $this->dao->query("DELETE tf.* FROM `$tableName` tf JOIN `task` t ON t.`task_id` = tf.`task_id` WHERE $query AND t.`project_id` = '$projectId';");
      $sql->closeCursor();
      return true;
    } catch (Exception $exc) {
      return false;
    }
  }

}
