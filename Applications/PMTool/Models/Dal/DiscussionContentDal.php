<?php

namespace Applications\PMTool\Models\Dal;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class DiscussionContentDal extends \Library\DAL\BaseManager {

  public function selectDiscussionThread($person_ids, $time) {
    $sql = "SELECT dc.* FROM discussion_content dc WHERE dc.`discussion_person_id` IN (";
    $i=0;
    $param_array = $sqlIds = array();
    foreach($person_ids as $id) {
      $sqlIds[]=":id".$i;
      $param_array[":id".$i]=$id;
      $i++;
    }
    $sql.=implode(',',$sqlIds).")";
    if($time!==false) {
      $sql.= " AND `discussion_content_time` > :time";
      $param_array[':time'] = $time;
    }
    $sql.=" ORDER BY dc.`discussion_content_time` DESC;";
    $sth = $this->dao->prepare($sql);
    $sth->execute($param_array);
    $sth->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, '\Applications\PMTool\Models\Dao\Discussion_content');
    $thread = $sth->fetchAll();
    $sth->closeCursor();
    return $thread;
  }

}
