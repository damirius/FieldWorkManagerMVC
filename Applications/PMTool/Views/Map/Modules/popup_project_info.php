<!--Prompt box: genrates a project info prompt box-->
<div class="modal fade prompt-modal" id="project-info-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <?php
  if (isset($prompt_message) && !empty($prompt_message)) {
    foreach($prompt_message as $the_msg){
      ?>
      <input type="hidden" id="promptmsg-<?php echo $the_msg['promptmsg']['operation'] ?>" value="<?php echo $the_msg['promptmsg']['value'] ?>" />
      <?php
    }
  }

  ?>
  <div class="modal-dialog modal-upload">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="prompt_title"><?php echo $resx['project_window_title']; ?></h4>
      </div>

      <div class="modal-body">
        <label for="project_name"><?php echo $resx['project_window_project_name']; ?></label>
        <input class="form-control" type="text" id="project_name-modal" name="project_name">
        <label for="facility_name"><?php echo $resx['project_window_project_name_facility_name']; ?></label>
        <input class="form-control" type="text" id="facility_name-modal" name="facility_name">
        <label for="latitude"><?php echo $resx['project_window_latitude']; ?></label>
        <input class="form-control" type="text" id="latitude-modal" name="latitude">
        <label for="longitude"><?php echo $resx['project_window_longitude']; ?></label>
        <input class="form-control" type="text" id="longitude-modal" name="longitude">
        <a href="#" id="zoom-modal"><span class="glyphicon glyphicon-zoom-in"></span> <?php echo $resx['project_window_zoom']; ?></a>
        <a href="#" id="edit-boundary-modal"><span class="glyphicon glyphicon-pencil"></span> <?php echo $resx['project_window_edit_boundary']; ?></a>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary confirmbuttons modal-update"><?php echo $resx['project_window_edit_update']; ?></button>
        <button type="button" class="btn btn-default confirmbuttons" data-dismiss="modal"><?php echo $resx['project_window_edit_cancel']; ?></button>
      </div>

    </div>
  </div>
</div>
<!--Promt box-->