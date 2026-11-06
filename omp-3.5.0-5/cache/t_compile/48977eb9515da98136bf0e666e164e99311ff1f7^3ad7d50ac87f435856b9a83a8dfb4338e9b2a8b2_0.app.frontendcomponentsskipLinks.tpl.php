<?php
/* Smarty version 4.5.5, created on 2026-11-06 13:41:51
  from 'app:frontendcomponentsskipLinks.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6aedd91feef985_82464799',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3ad7d50ac87f435856b9a83a8dfb4338e9b2a8b2' => 
    array (
      0 => 'app:frontendcomponentsskipLinks.tpl',
      1 => 1782879167,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6aedd91feef985_82464799 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="cmp_skip_to_content" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.description"),$_smarty_tpl ) );?>
">
	<a href="#pkp_content_main"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.main"),$_smarty_tpl ) );?>
</a>
	<a href="#siteNav"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.nav"),$_smarty_tpl ) );?>
</a>
	<?php if (!$_smarty_tpl->tpl_vars['requestedPage']->value || $_smarty_tpl->tpl_vars['requestedPage']->value === 'index') {?>
		<?php if ($_smarty_tpl->tpl_vars['activeTheme']->value && $_smarty_tpl->tpl_vars['activeTheme']->value->getOption('showDescriptionInPressIndex')) {?>
			<a href="#homepageAbout"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.about"),$_smarty_tpl ) );?>
</a>
		<?php }?>
		<?php if ($_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'count' ][ 0 ], array( $_smarty_tpl->tpl_vars['announcements']->value ))) {?>
			<a href="#homepageAnnouncements"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.announcements"),$_smarty_tpl ) );?>
</a>
		<?php }?>
	<?php }?>
	<a href="#pkp_content_footer"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.skip.footer"),$_smarty_tpl ) );?>
</a>
</div>
<?php }
}
