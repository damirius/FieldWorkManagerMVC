<section id="top_header">
  <section id="branding">
    <figure class="logo"><img src="<?php echo $this->app->relative_path . $this->app->logoImageUrl; ?>"></figure>
    <p class="brand"><?php echo $resx_menu_left["brand"]; ?></p>
  </section>
  <ul id="pm_info">
    <li>
      <p id="pm_name">
        <span class="glyphicon glyphicon-cog"></span>
        <span><?php echo $pm['pm_name']; ?></span>
      </p>
      <ul>
          <li><a id="view_pm_info" class="btn btn-default" role="button" data-pm-id="<?php echo $pm['pm_id']; ?>">Edit Info</a></li>
        <li><a href="<?php echo $logout_url; ?>" role="button"><?php echo $resx_menu_left["logout_link_text"]; ?></a></li>
      </ul>
    </li>
  </ul>
</section>
<div class="clearfix"></div>