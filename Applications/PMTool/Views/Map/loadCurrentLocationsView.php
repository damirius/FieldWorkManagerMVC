<?php if (!defined('__EXECUTION_ACCESS_RESTRICTION__')) exit('No direct script access allowed'); ?>
<div class="right-aside col-no-right-pad main col-lg-10 col-md-10 col-sm-10">
    <span class="h3"><?php echo $resx["h3_title"]; ?><span class="glyphicon glyphicon-chevron-right"></span> <?php
        if (isset($current_project)) {
            echo $current_project->project_name();
        } else {
            echo $resx["h3_no_project"];
        }
        ?></span>
    <span class="glyphicon glyphicon-question-sign" id="question-map-h3"></span>
    <div class="content-container container-fluid">
        <div class="row col-no-right-margin">
            <div class="col-xs-10">
                <?php require $form_modules[\Applications\PMTool\Resources\Enums\ViewVariablesKeys::map_module]; ?>
            </div>
            <div class="col-xs-2 map-info-col">
                <?php require $form_modules[\Applications\PMTool\Resources\Enums\ViewVariablesKeys::map_info_module]; ?>
            </div>
            <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Popup::popup_msg]; ?>
            <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Popup::popup_prompt_module]; ?>
            <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Map::popup_location_prompt_module]; ?>
            <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Map::popup_project_info]; ?>
            <?php require $form_modules[Applications\PMTool\Resources\Enums\ViewVariables\Map::popup_location_info]; ?>
        </div>
        <?php require $form_modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::tooltip_msg]; ?>
        <?php require $form_modules[\Applications\PMTool\Resources\Enums\PhpModuleKeys::popup_maplegend_proj_locations_module]; ?>
    </div>
    <input type="hidden" disabled id="locations-heading" value="<?php echo $resx['locations_heading']; ?>"/>
</div><!-- END RIGHT ASIDE MAIN -->