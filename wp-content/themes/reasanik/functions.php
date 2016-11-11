<?php

function reasanik_enqueue_styles()
{
  wp_register_style('reasanik-normalize', get_template_directory_uri() . '/css/normalize.css');
  wp_register_style('reasanik-main-style', get_template_directory_uri() . '/css/style.css');

  wp_enqueue_style('reasanik-normalize');
  wp_enqueue_style('reasanik-main-style');
  wp_enqueue_style('reasanik-style', get_stylesheet_uri());
}

add_action('wp_enqueue_scripts', 'reasanik_enqueue_styles');

function reasanik_enqueue_scripts ()
{
  wp_register_script('html5-shim', 'http://html5shim.googlecode.com/svn/trunk/html5.js');
  wp_enqueue_script('html5-shim');
}

add_action('wp_enqueue_scripts', 'reasanik_enqueue_scripts');

// if (function_exists('add_theme_support'))
// {
//   add_theme_support('menus');
// }

function reasanik_register_nav_menus()
{
  register_nav_menus(array(
    'header-menu' => ' Верхнее меню',
    'footer-menu' => ' Нижнее меню',
  ));
}