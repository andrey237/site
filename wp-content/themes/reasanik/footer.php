		</div>
  </main>

  <footer>
    <div class="container">
      <!-- <ul id="footer-menu" class="hor-menu">
        <?php //wp_list_pages('title_li='); ?>
      </ul> -->

      <?php wp_nav_menu(array(
                'theme_location' => 'footer-menu',
                'container' => false,
                'menu_id' => 'footer-menu',
                'menu_class' => 'hor-menu',
        )); ?>
    </div>
  </footer>

	<?php wp_footer(); ?>
</body>
</html>