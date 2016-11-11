<!DOCTYPE html>
<html <?php language_attributes() ?>>
<head>

  <meta charset="<?php bloginfo('charset') ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title><?php bloginfo('name') ?> <?php wp_title() ?></title>

  <?php wp_head() ?>

</head>

<body <?php body_class() ?> >

  <header>
    <div class="container">

      <a href="<?php echo get_option('home') ?>" id="logo">
        <!-- <b>company</b>
        <div>
          <span class="first-part">reasa</span><span>nik</span>
        </div> -->
        <img src="<?php bloginfo('template_url'); ?>/images/logo.png" alt="<?php bloginfo('name') ?>">
      </a>

      <nav>
        <!-- <ul id="main-menu" class="hor-menu">
          <?php //wp_list_pages('title_li='); ?>
        </ul> -->

        <?php wp_nav_menu(array(
                'theme_location' => 'header-menu',
                'container' => false,
                'menu_id' => 'main-menu',
                'menu_class' => 'hor-menu',
        )); ?>
      </nav>

    </div>
  </header>
<!-- 
  <div id="messages">
    <p class="warning"></p>
  </div>
 -->

  <?php //get_search_form(); ?>

  <main>
    <div class="container">