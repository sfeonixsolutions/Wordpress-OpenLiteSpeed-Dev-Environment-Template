<?php
add_action('wp_enqueue_scripts', 'sfeonix_solutions_enqueue_styles');
function sfeonix_solutions_enqueue_styles()
{
	wp_enqueue_style('parent-style', get_template_directory_uri() . '/style.css');
}