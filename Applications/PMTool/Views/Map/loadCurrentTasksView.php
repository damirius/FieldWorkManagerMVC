<?php if (!defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed'); ?>
<div class="right-aside col-no-right-pad main col-lg-10 col-md-10 col-sm-10">
    <span class="h3"><?php echo $resx["h3_title"]; ?><span class="glyphicon glyphicon-chevron-right"></span> <?php
        if (isset($current_project)) {
            echo $current_project->project_name();
        } else {
            echo $resx["h3_no_project"];
        }
        ?><span class="glyphicon glyphicon-chevron-right"></span> <?php
        if (isset($current_task)) {
            echo $current_task->task_name();
        } else {
            echo $resx["h3_no_task"];
        }
        ?>
    </span>
    <span class="glyphicon glyphicon-question-sign" id="question-map-h3"></span>
    <div class="content-container container-fluid">
        <div class="row col-no-right-margin">
            <div class="col-lg-10 col-md-10">
                <?php require $form_modules[\Applications\PMTool\Resources\Enums\ViewVariablesKeys::map_module]; ?>
            </div>
            <div class="col-lg-2 col-md-2">
                <?php require $form_modules[\Applications\PMTool\Resources\Enums\ViewVariablesKeys::map_info_module]; ?>
            </div>
          <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Popup::popup_msg]; ?>
          <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Map::popup_project_info]; ?>
          <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Map::popup_task_location_info]; ?>
        </div>
        <?php require $form_modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::tooltip_msg]; ?>
        <?php require $form_modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::popup_maplegend_task_locations_module]; ?>
    </div>
    <input type="hidden" disabled id="tasks-heading" value="<?php echo $resx['tasks_heading']; ?>"/>
    <input type="hidden" disabled id="other-locations-heading" value="<?php echo $resx['other_locations_heading']; ?>"/>
</div><!-- END RIGHT ASIDE MAIN -->