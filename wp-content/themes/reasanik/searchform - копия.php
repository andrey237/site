<form name="search" action="<?php echo home_url('/') ?>" method="get" class="search-form">

  <input class="input" type="text" value="<?php echo get_search_query() ?>" name="s" placeholder="Найти">

  <button type="submit" class="button">Поиск</button>

</form>