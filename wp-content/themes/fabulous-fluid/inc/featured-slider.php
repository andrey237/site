<?php
/**
 * The template for displaying the Slider
 *
 * @package Catch Themes
 * @subpackage Fabulous Fluid
 * @since Fabulous Fluid 0.2
 */

if( !function_exists( 'fabulous_fluid_featured_slider' ) ) :
/**
 * Add slider.
 *
 * @uses action hook fabulous_fluid_before_content.
 *
 * @since Fabulous Fluid 0.2
 */
function fabulous_fluid_featured_slider() {
	global $wp_query;
	//fabulous_fluid_flush_transients();

	// get data value from options
	$enable_slider	= apply_filters( 'fabulous_fluid_get_option', 'featured_slider_option' );

	// Get Page ID outside Loop
	$page_id = $wp_query->get_queried_object_id();

	// Front page displays in Reading Settings
	$page_for_posts = get_option('page_for_posts');

	if ( $enable_slider == 'entire-site' || ( ( is_front_page() || ( is_home() && $page_for_posts != $page_id ) ) && $enable_slider == 'homepage' ) ) {
		if( ( !$featured_slider = get_transient( 'fabulous_fluid_featured_slider' ) ) ) {
			echo '<!-- refreshing cache -->';
			$transition_effect = apply_filters( 'fabulous_fluid_get_option', 'featured_slide_transition_effect' );

			$transition_length = apply_filters( 'fabulous_fluid_get_option', 'featured_slide_transition_length' );

			$transition_delay  = apply_filters( 'fabulous_fluid_get_option', 'featured_slide_transition_delay' );

			$slider_select      = apply_filters( 'fabulous_fluid_get_option', 'featured_slider_type' );

			$image_loader      = apply_filters( 'fabulous_fluid_get_option', 'featured_slider_image_loader' );

			$featured_slider = '
				<section id="feature-slider">
					<div class="wrapper">
						<div class="cycle-slideshow"
						    data-cycle-log="false"
						    data-cycle-pause-on-hover="true"
						    data-cycle-swipe="true"
						    data-cycle-fx="'. esc_attr( $transition_effect ) .'"
							data-cycle-speed="'. esc_attr( $transition_length ) * 1000 .'"
							data-cycle-timeout="'. esc_attr( $transition_delay ) * 1000 .'"
							data-cycle-loader="'. esc_attr( $image_loader ) * 1000 .'"
							data-cycle-slides="> a"
							data-cycle-pager="#per-slide-template"
    						>

    						<!-- prev/next links -->
						    <div class="cycle-prev"></div>
						    <div class="cycle-next"></div>';

						    $slides_number	= apply_filters( 'fabulous_fluid_get_option', 'featured_slide_number' );

							// Select Slider
							if ( $slider_select == 'demo-featured-slider' && function_exists( 'fabulous_fluid_demo_slider' ) ) {
								$featured_slider .=  fabulous_fluid_demo_slider();

								$slides_number = 5;
							}
							elseif ( $slider_select == 'featured-page-slider' ) {
								$featured_slider .=  fabulous_fluid_post_page_category_slider();
							}

			$featured_slider .= '

    					</div><!-- .cycle-slideshow -->

    					<!-- empty element for pager links -->
    					<div id="per-slide-template" class="center external slide-numbers-' . absint( $slides_number ) . '"></div>
					</div><!-- .wrapper -->
				</section><!-- #feature-slider -->';

			set_transient( 'fabulous_fluid_featured_slider', $featured_slider, 86940 );
		}
		echo $featured_slider;
	}
}
endif;
add_action( 'fabulous_fluid_after_header', 'fabulous_fluid_featured_slider', 20 );


if ( ! function_exists( 'fabulous_fluid_demo_slider' ) ) :
/**
 * This function to display featured posts slider
 *
 * @get the data value from customizer options
 *
 * @since Fabulous Fluid 0.2
 *
 */
function fabulous_fluid_demo_slider() {
	$excerpt_more_text	= apply_filters( 'fabulous_fluid_get_option', 'excerpt_more_text' );

	return '
	<a class="slider-box first" title="' . esc_html__( 'Slider Image 1', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" data-cycle-pager-template="<div class=\'thumbnail thumbnail-1\'><span class=\'cover\'></span><h2>' . esc_html__( 'Slider Image 1', 'fabulous-fluid' ) . '</h2><img src=\''.get_template_directory_uri().'/images/slider-img1.jpg\'></div>">
		<img src="' . get_template_directory_uri() . '/images/slider-img1.jpg" class="wp-post-image" alt="' . esc_html__( 'Slider Image 1', 'fabulous-fluid' ) . '" title="' . esc_html__( 'Slider Image 1', 'fabulous-fluid' ) . '">
		<div class="caption">
			<span class="vcenter">
				<span class="entry-title">' . esc_html__( 'Slider Image 1', 'fabulous-fluid' ) . '</span>

				<span class="entry-content">' . esc_html__( 'Slider Image 1 Content', 'fabulous-fluid' ) . '</span>

				<span class="more">' . esc_html__( 'Read More', 'fabulous-fluid' ) . '</span>
			</span><!-- .vcenter -->
		</div><!-- .caption -->
	</a><!-- .slider-box -->

	<a class="slider-box" title="' . esc_html__( 'Slider Image 2', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" data-cycle-pager-template="<div class=\'thumbnail thumbnail-2\'><span class=\'cover\'></span><h2>' . esc_html__( 'Slider Image 2', 'fabulous-fluid' ) . '</h2><img src=\''.get_template_directory_uri().'/images/slider-img2.jpg\'></div>">
		<img src="' . get_template_directory_uri() . '/images/slider-img2.jpg" class="wp-post-image" alt="' . esc_html__( 'Slider Image 2', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" title="' . esc_html__( 'Slider Image 2', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'">
		<div class="caption">
			<span class="vcenter">
				<span class="entry-title">' . esc_html__( 'Slider Image 2', 'fabulous-fluid' ) . '</span>

				<span class="entry-content">' . esc_html__( 'Slider Image 2 Content', 'fabulous-fluid' ) . '</span>

				<span class="more">' . esc_html__( 'Read More', 'fabulous-fluid' ) . '</span>
			</span><!-- .vcenter -->
		</div><!-- .caption -->
	</a><!-- .slider-box -->

	<a class="slider-box" title="' . esc_html__( 'Slider Image 3', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" href="'. esc_url( home_url( '/' ) ) .'" data-cycle-pager-template="<div class=\'thumbnail thumbnail-3\'><span class=\'cover\'></span><h2>' . esc_html__( 'Slider Image 3', 'fabulous-fluid' ) . '</h2><img src=\''.get_template_directory_uri().'/images/slider-img3.jpg\'></div>">
		<img src="' . get_template_directory_uri() . '/images/slider-img3.jpg" class="wp-post-image" alt="' . esc_html__( 'Slider Image 3', 'fabulous-fluid' ) . '" title="' . esc_html__( 'Slider Image 3', 'fabulous-fluid' ) . '">
		<div class="caption">
			<span class="vcenter">
				<span class="entry-title">' . esc_html__( 'Slider Image 3', 'fabulous-fluid' ) . '</span>

				<span class="entry-content">' . esc_html__( 'Slider Image 3 Content', 'fabulous-fluid' ) . '</span>

				<span class="more">' . esc_html__( 'Read More', 'fabulous-fluid' ) . '</span>
			</span><!-- .vcenter -->
		</div><!-- .caption -->
	</a><!-- .slider-box -->

	<a class="slider-box" title="' . esc_html__( 'Slider Image 4', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" data-cycle-pager-template="<div class=\'thumbnail thumbnail-4\'><span class=\'cover\'></span><h2>' . esc_html__( 'Slider Image 4', 'fabulous-fluid' ) . '</h2><img src=\''.get_template_directory_uri().'/images/slider-img4.jpg\'></div>">
		<img src="' . get_template_directory_uri() . '/images/slider-img4.jpg" class="wp-post-image" alt="' . esc_html__( 'Slider Image 4', 'fabulous-fluid' ) . '" title="' . esc_html__( 'Slider Image 4', 'fabulous-fluid' ) . '">
		<div class="caption">
			<span class="vcenter">
				<span class="entry-title">' . esc_html__( 'Slider Image 4', 'fabulous-fluid' ) . '</span>

				<span class="entry-content">' . esc_html__( 'Slider Image 4 Content', 'fabulous-fluid' ) . '</span>

				<span class="more">' . esc_html__( 'Read More', 'fabulous-fluid' ) . '</span>
			</span><!-- .vcenter -->
		</div><!-- .caption -->
	</a><!-- .slider-box -->

	<a class="slider-box" title="' . esc_html__( 'Slider Image 5', 'fabulous-fluid' ) . '" href="'. esc_url( home_url( '/' ) ) .'" data-cycle-pager-template="<div class=\'thumbnail thumbnail-5\'><span class=\'cover\'></span><h2>' . esc_html__( 'Slider Image 5', 'fabulous-fluid' ) . '</h2><img src=\''.get_template_directory_uri().'/images/slider-img5.jpg\'></div>">
		<img src="' . get_template_directory_uri() . '/images/slider-img5.jpg" class="wp-post-image" alt="' . esc_html__( 'Slider Image 5', 'fabulous-fluid' ) . '" title="' . esc_html__( 'Slider Image 5', 'fabulous-fluid' ) . '">
		<div class="caption">
			<span class="vcenter">
				<span class="entry-title">' . esc_html__( 'Slider Image 5', 'fabulous-fluid' ) . '</span>

				<span class="entry-content">' . esc_html__( 'Slider Image 5 Content', 'fabulous-fluid' ) . '</span>

				<span class="more">' . esc_html__( 'Read More', 'fabulous-fluid' ) . '</span>
			</span><!-- .vcenter -->
		</div><!-- .caption -->
	</a><!-- .slider-box -->
	';
}
endif; // fabulous_fluid_demo_slider


if ( ! function_exists( 'fabulous_fluid_post_page_category_slider' ) ) :
/**
 * This function to display featured posts/page/category slider
 *
 * @since Fabulous Fluid 1.0
 */
function fabulous_fluid_post_page_category_slider() {
	global $post;
	$type              = apply_filters( 'fabulous_fluid_get_option', 'featured_slider_type' );
	$quantity          = apply_filters( 'fabulous_fluid_get_option', 'featured_slide_number' );
	$excerpt_more_text = apply_filters( 'fabulous_fluid_get_option', 'excerpt_more_text' );
	$excerpt_length    = apply_filters( 'fabulous_fluid_get_option', 'excerpt_length' );
	$no_of_post        = 0; // for number of posts
	$post_list         = array(); // list of valid post ids
	$output            = '';

	$args = array(
		'post_type'           => 'any',
		'orderby'             => 'post__in',
		'ignore_sticky_posts' => 1 // ignore sticky posts
	);

	//Get valid number of posts
	if( 'featured-post-slider' == $type || 'featured-page-slider' == $type  ) {
		for( $i = 1; $i <= $quantity; $i++ ){
			$post_id = '';

			if( 'featured-post-slider' == $type ) {
				$post_id = apply_filters( 'fabulous_fluid_get_option', 'featured_slider_post_' . $i );
			}
			elseif( 'featured-page-slider' == $type ) {
				$post_id = apply_filters( 'fabulous_fluid_get_option', 'featured_slider_page_' . $i );
			}

			if ( $post_id && '' != $post_id ) {
				$post_list = array_merge( $post_list, array( $post_id ) );

				$no_of_post++;
			}
		}

		$args['post__in'] = $post_list;
	}
	elseif( 'featured-category-slider' == $type ) {
		$no_of_post = $quantity;

		$args['category__in'] = (array) apply_filters( 'fabulous_fluid_get_option', 'featured_slider_select_category' );
	}

	if ( 0 == $no_of_post ) {
		return;
	}

	$args['posts_per_page'] = $no_of_post;

	$get_featured_posts = new WP_Query( $args );

	$i=0;

	while ( $get_featured_posts->have_posts() ) {
		$get_featured_posts->the_post();

		$i++;

		$title_attribute = the_title_attribute( array( 'echo' => false ) );

		$classes = 'post post-' . $post->ID . ' slider-box';

		if ( $i == 1 ) {
			$classes .= ' first';
		}

		//Default value if there is no featurd image or first image
		$image_url = get_template_directory_uri() . '/images/no-featured-image-1680x720.jpg';
		$image     = '<img class="wp-post-image no-featured-image" src="'.get_template_directory_uri().'/images/no-featured-image-1680x720.jpg">';

		if ( has_post_thumbnail() ) {
			$image =  get_the_post_thumbnail( $post->ID, 'fabulous-fluid-slider', array( 'title' => $title_attribute, 'alt' => $title_attribute, 'class' => 'wp-post-image' ) );

			$image_url = get_the_post_thumbnail_url( $post->ID, 'fabulous-fluid-slider' );
		}
		else {
			//Get the first image in page, returns false if there is no image
			$first_image = fabulous_fluid_get_first_image( $post->ID, 'fabulous-fluid-slider', array( 'title' => $title_attribute, 'alt' => $title_attribute, 'class' => 'wp-post-image' ) );

			//Set value of image as first image if there is an image present in the page
			if ( '' != $first_image ) {
				$image = $first_image;

				$image_url = fabulous_fluid_get_first_image( $post->ID, 'fabulous-fluid-slider', '', true );
			}
		}

		$content = get_the_content();
		$content = apply_filters( 'the_content', $content );
		$content = strip_tags( str_replace( ']]>',']]&gt;', $content ) );
		if ( str_word_count( $content, 0 ) > $excerpt_length ) {
			$words   = str_word_count( $content, 2 );
			$pos     = array_keys( $words );
			$content = substr( $content, 0, $pos[$excerpt_length] );
		}

		$output .= '
		<a class="' . $classes . '" data-cycle-pager-template="<div class=\'thumbnail thumbnail-' . $i . '\'><span class=\'cover\'></span>' . the_title( '<h2>','</h2>', false ) . '<img src=\'' . esc_url( $image_url ) .'\'></div>" title="'. $title_attribute . '" href="' . esc_url( get_permalink() ) . '">';

			$output .=  $image;

			$output .= '
			<div class="caption">
				<span class="vcenter">
					' . the_title( '<span class="entry-title">','</span>', false ) . '

					<span class="entry-content">' . $content . '</span>

					<span class="more">' . esc_html( $excerpt_more_text ) . '</span>
				</span><!-- .vcenter -->
			</div><!-- .caption -->
		</a><!-- .slider-box -->';
	} //endwhile

	wp_reset_query();

	return $output;
}
endif; // fabulous_fluid_post_page_category_slider