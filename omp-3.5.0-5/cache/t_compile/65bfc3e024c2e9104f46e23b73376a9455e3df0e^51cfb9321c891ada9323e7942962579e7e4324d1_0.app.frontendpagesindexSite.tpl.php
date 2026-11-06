<?php
/* Smarty version 4.5.5, created on 2026-11-06 13:37:11
  from 'app:frontendpagesindexSite.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6aedd8077ff6f4_75047770',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '51cfb9321c891ada9323e7942962579e7e4324d1' => 
    array (
      0 => 'app:frontendpagesindexSite.tpl',
      1 => 1782879167,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:frontend/components/header.tpl' => 1,
    'app:frontend/components/highlights.tpl' => 1,
    'app:frontend/objects/announcements_list.tpl' => 1,
    'app:frontend/components/footer.tpl' => 1,
  ),
),false)) {
function content_6aedd8077ff6f4_75047770 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<div class="page_index_site">

	<?php if ($_smarty_tpl->tpl_vars['highlights']->value->count()) {?>
		<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/highlights.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('highlights'=>$_smarty_tpl->tpl_vars['highlights']->value), 0, false);
?>
	<?php }?>

	<?php if ($_smarty_tpl->tpl_vars['about']->value) {?>
		<div class="about_site">
			<?php echo $_smarty_tpl->tpl_vars['about']->value;?>

		</div>
	<?php }?>

	<?php $_smarty_tpl->_subTemplateRender("app:frontend/objects/announcements_list.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('numAnnouncements'=>$_smarty_tpl->tpl_vars['numAnnouncementsHomepage']->value), 0, false);
?>

	<div class="presses">
		<h2>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"context.contexts"),$_smarty_tpl ) );?>

		</h2>
		<?php if (!call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'count' ][ 0 ], array( $_smarty_tpl->tpl_vars['presses']->value ))) {?>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"site.noPresses"),$_smarty_tpl ) );?>

		<?php } else { ?>
			<ul>
				<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['presses']->value, 'press');
$_smarty_tpl->tpl_vars['press']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['press']->value) {
$_smarty_tpl->tpl_vars['press']->do_else = false;
?>
					<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "url", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('press'=>$_smarty_tpl->tpl_vars['press']->value->getPath()),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
					<?php $_smarty_tpl->_assignInScope('thumb', $_smarty_tpl->tpl_vars['press']->value->getLocalizedData('pressThumbnail'));?>
					<?php $_smarty_tpl->_assignInScope('description', $_smarty_tpl->tpl_vars['press']->value->getLocalizedDescription());?>
					<li<?php if ($_smarty_tpl->tpl_vars['thumb']->value) {?> class="has_thumb"<?php }?>>
						<?php if ($_smarty_tpl->tpl_vars['thumb']->value) {?>
							<div class="thumb">
								<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value;?>
">
									<img src="<?php echo $_smarty_tpl->tpl_vars['pressesFilesPath']->value;
echo $_smarty_tpl->tpl_vars['press']->value->getId();?>
/<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['thumb']->value['uploadName'],"url" ));?>
"<?php if ($_smarty_tpl->tpl_vars['thumb']->value['altText']) {?> alt="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['thumb']->value['altText'] )) ?? null)===null||$tmp==='' ? '' ?? null : $tmp);?>
"<?php }?>>
								</a>
							</div>
						<?php }?>

						<div class="body">
							<h3>
								<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value;?>
" rel="bookmark">
									<?php echo $_smarty_tpl->tpl_vars['press']->value->getLocalizedName();?>

								</a>
							</h3>
							<?php if ($_smarty_tpl->tpl_vars['description']->value) {?>
								<div class="description">
									<?php echo $_smarty_tpl->tpl_vars['description']->value;?>

								</div>
							<?php }?>
							<ul class="links">
								<li class="view">
									<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value;?>
">
										<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"site.pressView"),$_smarty_tpl ) );?>

									</a>
								</li>
							</ul>
						</div>
					</li>
				<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
			</ul>
		<?php }?>
	</div>

</div><!-- .page -->

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
