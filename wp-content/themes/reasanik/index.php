<?php get_header();

while (have_posts())
{
  the_post(); ?>

  <h2>
    <a href="<?php the_permalink() ?>" ><?php the_title() ?></a>
  </h2>

  <p>Пост опубликован: <?php the_date('Y-m-d') ?> <?php the_time() ?></p>

  <?php the_content();

}?>

<div class="navigation">
  <span class="previous-entries"><?php next_posts_link('Вперед') ?></span>
  <span class="next-entries"><?php previous_posts_link('Назад') ?></span>
</div>

<!-- 
      <div class="wrap-frame">

        <div class="inside-left-top corner"></div>
        <div class="inside-right-top corner"></div>
        <div class="outside-left-top corner"></div>
        <div class="outside-right-top corner"></div>
        <div class="outside-left-bottom corner"></div>
        <div class="outside-right-bottom corner"></div>
        <div class="inside-left-bottom corner"></div>
        <div class="inside-right-bottom corner"></div>
        <a class="frame" href="index.php?view=item&amp;item=<?php //echo $image;?>">
          <div class="image-container">
            <image src="images/gallery/thumbs/<?php //echo $image;?>" alt="<?php //echo $image;?>">
          </div>
          <div class="foreground image-container">
            <image src="images/gallery/thumbs/effect/<?php //echo $image;?>" alt="<?php //echo $image;?>">
          </div>
        </a>

      </div>

      <div class="form-container">

        <form class="block" action="" method="post" enctype="multipart/form-data">
          <input type="hidden" name="MAX_FILE_SIZE" value="1000000" />
          <input type="file" name="file">
          <input class="button" type="submit" value="Загрузить">
        </form>

        <form class="block admin-form" action="" method="post">
          <input type="text" placeholder="Пользователь" name="user">
          <input type="password" placeholder="Пароль" name="password">
          <input class="button" type="submit" value="Войти" name="login">
        </form>

      </div>
 -->

<?php get_footer() ?>