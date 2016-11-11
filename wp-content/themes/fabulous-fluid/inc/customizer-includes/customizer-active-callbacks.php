<?php
/**
 * Active callbacks for Theme/Customzer Options
 *
 * @package Catch Themes
 * @subpackage Fabulous Fluid
 * @since Fabulous Fluid 1.1
 */

if( ! function_exists( 'fabulous_fluid_is_slider_active' ) ) :
	/**
	* Return true if slider is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_slider_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_slider_option' )->value();

		//return true only if previwed page on customizer matches the type of slider option selected
		return ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_demo_slider_inactive' ) ) :
	/**
	* Return true if demo slider is inactive
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_demo_slider_inactive( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable	= $control->manager->get_setting( 'featured_slider_option' )->value();

		$type = $control->manager->get_setting( 'featured_slider_type' )->value();

		//return true only if previwed page on customizer matches the type of slider option selected and is not demo slider
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && !( 'demo-featured-slider' == $type ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_page_slider_active' ) ) :
	/**
	* Return true if page slider is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_page_slider_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_slider_option' )->value();

		$type = $control->manager->get_setting( 'featured_slider_type' )->value();

		//return true only if previwed page on customizer matches the type of slider option selected and page slider
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && ( 'featured-page-slider' == $type ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_featured_content_active' ) ) :
	/**
	* Return true if featured content is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_featured_content_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_content_option' )->value();

		//return true only if previwed page on customizer matches the type of content option selected
		return ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_demo_featured_content_inactive' ) ) :
	/**
	* Return true if demo featured content is inactive
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_demo_featured_content_inactive( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable 	= $control->manager->get_setting( 'featured_content_option' )->value();

		$type = $control->manager->get_setting( 'featured_content_type' )->value();

		//return true only if previwed page on customizer matches the type of content option selected and is not demo content
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && !( 'demo-content' == $type ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_featured_page_content_active' ) ) :
	/**
	* Return true if page content is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_featured_page_content_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_content_option' )->value();

		$type = $control->manager->get_setting( 'featured_content_type' )->value();

		//return true only if previwed page on customizer matches the type of content option selected and page content
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && ( 'page-content' == $type ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_featured_grid_content_active' ) ) :
	/**
	* Return true if featured grid content is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_featured_grid_content_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_grid_content_option' )->value();

		//return true only if previwed page on customizer matches the type of content option selected
		return ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_demo_featured_grid_content_inactive' ) ) :
	/**
	* Return true if demo featured grid content is inactive
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_demo_featured_grid_content_inactive( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable 	= $control->manager->get_setting( 'featured_grid_content_option' )->value();

		$type = $control->manager->get_setting( 'featured_grid_content_type' )->value();

		//return true only if previwed page on customizer matches the type of content option selected and is not demo content
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && !( 'demo-content' == $type ) );
	}
endif;


if( ! function_exists( 'fabulous_fluid_is_featured_page_grid_content_active' ) ) :
	/**
	* Return true if page content is active
	*
	* @since  Fabulous Fluid 0.2
	*/
	function fabulous_fluid_is_featured_page_grid_content_active( $control ) {
		global $wp_query;

		$page_id = $wp_query->get_queried_object_id();

		// Front page display in Reading Settings
		$page_for_posts = get_option('page_for_posts');

		$enable = $control->manager->get_setting( 'featured_grid_content_option' )->value();

		$type = $control->manager->get_setting( 'featured_grid_content_type' )->value();

		//return true only if previwed page on customizer matches the type of content option selected and page content
		return ( ( $enable == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable == 'homepage' ) ) && ( 'page-content' == $type ) );
	}
endif;