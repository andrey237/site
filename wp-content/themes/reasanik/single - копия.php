<?php get_header();

while (have_posts())
{
  the_post(); ?>

  <h2><?php the_title() ?></h2>

  <p>Пост опубликован: <?php the_date('Y-m-d') ?> <?php the_time() ?></p>

  <?php the_content();

}?>

<?php comments_template(); ?>

<div class="navigation">
  <span class="previous-entries"><?php previous_post_link(' %link') ?></span>
  <span class="next-entries"><?php next_post_link('%link') ?></span>
</div>

<?php get_footer() ?>