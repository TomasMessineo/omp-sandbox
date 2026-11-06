<?php
/* Smarty version 4.5.5, created on 2026-11-06 13:41:51
  from 'app:frontendpageserror.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6aedd91fe98067_81323407',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '916a6e850608cab8524b085e5d20d84c8af47266' => 
    array (
      0 => 'app:frontendpageserror.tpl',
      1 => 1782879665,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/breadcrumbs.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_6aedd91fe98067_81323407 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="page page_error">
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>$_smarty_tpl->tpl_vars['pageTitle']->value), 0, false);
?>
	<h1>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['pageTitle']->value),$_smarty_tpl ) );?>

	</h1>
	<div class="description">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['errorMsg']->value,'params'=>$_smarty_tpl->tpl_vars['errorParams']->value),$_smarty_tpl ) );?>

	</div>
	<?php if ($_smarty_tpl->tpl_vars['backLink']->value) {?>
		<div class="cmp_back_link">
			<a href="<?php echo $_smarty_tpl->tpl_vars['backLink']->value;?>
"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['backLinkLabel']->value),$_smarty_tpl ) );?>
</a>
		</div>
	<?php }?>
</div>

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
