<!--Promt box: genrates a prompt box for selecting project-->
<div class="modal fade maplegend-modal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-upload">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="prompt_title"><?php echo $resx["h4_legend_heading"]; ?></h4>
      </div>

      <div class="modal-body">
        <li>
           <span class="map-info-icon-image">
               <img src="../Web/images/purple-stars_maps.png">
           </span>
           <span>
                <?php echo $resx["active_project"]; ?>
           </span>
         </li>
         <li>
           <span class="map-info-icon-image">
               <img src="../Web/images/wht-stars_maps.png">
           </span>
           <span>
                <?php echo $resx["inactive_project"]; ?>
           </span>
         </li>
             <li>
           <span class="map-info-icon-image1">
<!--           <div id="map-info-shape-icon"></div>-->
<img src="../Web/images/tmp_area_icon.png">
           </span>
           <span>
                <?php echo $resx["boundary"]; ?>
           </span>
         </li>
      </div>
      <div class="modal-footer">
        <button type="button" id="mlalert_ok" class="btn btn-primary confirmbuttons" data-bb-handler="cancel"><?php echo $resx["popup_ok_button"] ?></button>
      </div>

    </div>

  </div>
</div>
<!--Promt box-->