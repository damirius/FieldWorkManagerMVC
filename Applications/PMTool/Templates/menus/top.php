<section id="top_header">
  <div id="branding">
    <figure class="logo"><img src="<?php echo $this->app->relative_path . $this->app->logoImageUrl; ?>"></figure>
<!--    <p class="brand"><?php // echo $resx_menu_left["brand"]; ?></p>-->
  </div>
  <div id="pm_info">
    <span id="pm_name" class="top-right-option">
      <?php echo $resx_menu_left["p_user_name_label"]; ?><?php echo $pm['pm_name']; ?>
    </span>
     <span id="ft_comm" class="top-right-option mobile-glyph">
      <a class="glyphicon"  title="<?php echo $resx_menu_left["ft_comm"]; ?>">
          <img src="../Web/images/glyphicons-246-chat.png">
      </a>
    </span>
          <span id="ft_map" class="top-right-option mobile-glyph">
      <a class="glyphicon" title="<?php echo $resx_menu_left["ft_map"]; ?>">
          <img src="../Web/images/glyphicons-503-map.png">
      </a>
    </span>
          <span id="ft_notes" class="top-right-option mobile-glyph">
      <a class="glyphicon" title="<?php echo $resx_menu_left["ft_notes"]; ?>">
          <img src="../Web/images/glyphicons-151-edit.png">
      </a>
    </span>     
    <span id="view_info" class="top-right-option">
      <a class="glyphicon glyphicon-user" title="<?php echo $resx_menu_left["pm_view_info"]; ?>"></a>
    </span>
    <span id="pm_logout" class="top-right-option">
      <a class="glyphicon glyphicon-log-out" title="<?php echo $resx_menu_left["logout_link_text"]; ?>" href="<?php echo $logout_url; ?>" ></a>
    </span>
  </div>
</section>
<div class="clearfix"></div>