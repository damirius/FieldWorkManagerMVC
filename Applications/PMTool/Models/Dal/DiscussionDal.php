<?php

namespace Applications\PMTool\Models\Dal;

if (!defined('__EXECUTION_ACCESS_RESTRICTION__'))
  exit('No direct script access allowed');

class DiscussionDal extends \Library\DAL\BaseManager {

  public function selectByUserPair($current_user_id,$recipient_user_id, $task_id) {
    $sql = "SELECT d.* FROM discussion AS d WHERE d.task_id = :task_id AND :current_user_id IN (SELECT user_id FROM discussion_person AS dp WHERE d.`discussion_id` = dp.discussion_id) AND :recipient_user_id IN (SELECT user_id FROM discussion_person AS dp WHERE d.`discussion_id` = dp.discussion_id)";
    $sth = $this->dao->prepare($sql);
    $sth->bindValue(':current_user_id',$current_user_id,\PDO::PARAM_INT);
    $sth->bindValue(':recipient_user_id',$recipient_user_id,\PDO::PARAM_INT);
    $sth->bindValue(':task_id',$task_id,\PDO::PARAM_INT);
    $sth->execute();
    $sth->setFetchMode(\PDO::FETCH_CLASS | \PDO::FETCH_PROPS_LATE, '\Applications\PMTool\Models\Dao\Discussion');
    $discussion = $sth->fetch();
    $sth->closeCursor();
    return $discussion;
  }
}
