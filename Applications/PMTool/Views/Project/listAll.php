<?php if (!defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed'); ?>
<div class="right-aside col-no-right-pad main col-lg-10 col-md-10 col-sm-10">
  <div class="project_list">
    <!--          <h3>  -->
    <h3>Current Project 
      <span class="glyphicon glyphicon-chevron-right"></span>
      <?php
      if (isset($current_project)) {
        echo $current_project->project_name();
      } else {
        echo '<span class="noCP">' . $resx["h3_no_project"] . '</span>';
      }
      ?>
    </h3>
    <div class="content-container container-fluid">
      <div class="row col-no-right-margin">
        <div class="col-lg-5 col-md-5">
            <span class="h4"><?php echo $resx["h3_projects_active"]; ?></span>
            <span class="glyphicon glyphicon-info-sign" id="active-project-header"></span>
          <?php require $active_list_module; ?>              
        </div>
        <div class="col-lg-1 col-md-1">
        <?php require $promote_buttons_module; ?>
        </div>
        <div  class="col-lg-5 col-md-5">
          <span class="h4"><?php echo $resx["h3_projects_inactive"]; ?></span>
            <span class="glyphicon glyphicon-question-sign" id="inactive-project-header"></span>
          <?php require $inactive_list_module; ?>
        </div>
        <?php
		require $tooltip_message_module;
        require $popup_msg_module;
		require $prompt_msg_module;
        ?>
      </div>
    </div>
  </div>
</div><!-- END RIGHT ASIDE MAIN -->