<div class="content-container container-fluid">
  <div class="row col-no-right-margin">
    <div  class="col-lg-5 col-md-5">
      <a id="refresh-chat" href="#"><span class="glyphicon glyphicon-refresh"></span></a> <span class="h4"><?php echo $resx['h4_taskcomm_leftcol'] ?></span>
      <div>
        <textarea  class="upload_list" name="task_comm_message" type="text"></textarea>
        <?php require $form_modules[Applications\PMTool\Resources\Enums\PhpModuleKeys::upload_file]; ?>
        <div class="list-panel upload_list chatbox" name="task_comm_chatbox" id="task-comm-chatbox"></div>
      </div>
    </div>
    <div class="col-lg-1 col-md-1">
      <div class="buttons">
        <?php
        if ($comm_with_name !== '')
          require $form_modules["communications_button_module"];
        ?>
      </div>
    </div>
  </div>
</div>