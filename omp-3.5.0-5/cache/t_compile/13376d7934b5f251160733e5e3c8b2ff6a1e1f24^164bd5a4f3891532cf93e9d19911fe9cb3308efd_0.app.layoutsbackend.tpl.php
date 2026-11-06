<?php
/* Smarty version 4.5.5, created on 2026-11-06 13:16:38
  from 'app:layoutsbackend.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6aedd336556139_51998703',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '164bd5a4f3891532cf93e9d19911fe9cb3308efd' => 
    array (
      0 => 'app:layoutsbackend.tpl',
      1 => 1782879665,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
    'app:controllers/notification/notificationOptions.tpl' => 1,
  ),
),false)) {
function content_6aedd336556139_51998703 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/var/www/html/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.replace.php','function'=>'smarty_modifier_replace',),));
$_smarty_tpl->_loadInheritance();
$_smarty_tpl->inheritance->init($_smarty_tpl, false);
?>
<!DOCTYPE html>
<html lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
" xml:lang="<?php echo smarty_modifier_replace($_smarty_tpl->tpl_vars['currentLocale']->value,"_","-");?>
">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['defaultCharset']->value ));?>
" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?php echo preg_replace('!<[^>]*?>!', ' ', (string) call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['title'][0], array( array('value'=>$_smarty_tpl->tpl_vars['pageTitle']->value),$_smarty_tpl ) ));?>
</title>
	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_header'][0], array( array('context'=>"backend"),$_smarty_tpl ) );?>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_stylesheet'][0], array( array('context'=>"backend"),$_smarty_tpl ) );?>

	<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['load_script'][0], array( array('context'=>"backend"),$_smarty_tpl ) );?>

	<style type="text/css">
		/* Prevent flash of unstyled content in some browsers */
		[v-cloak] { display: none; }
	</style>
</head>
<body class="pkp_page_<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) ?? null)===null||$tmp==='' ? "index" ?? null : $tmp);?>
 pkp_op_<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedOp']->value )) ?? null)===null||$tmp==='' ? "index" ?? null : $tmp);?>
" dir="<?php echo (($tmp = call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['currentLocaleLangDir']->value )) ?? null)===null||$tmp==='' ? "ltr" ?? null : $tmp);?>
">

	<?php echo '<script'; ?>
 type="text/javascript">
		// Initialise JS handler.
		$(function() {
			$('body').pkpHandler(
				'$.pkp.controllers.SiteHandler',
				{
					<?php $_smarty_tpl->_subTemplateRender("app:controllers/notification/notificationOptions.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
				});
		});
	<?php echo '</script'; ?>
>
	<div id="app" class="app" v-cloak>
		<pkp-spinner-full-screen></pkp-spinner-full-screen>
		<vue-announcer class="sr-only"></vue-announcer>
		<pkp-announcer class="sr-only"></pkp-announcer>
		<modal-manager></modal-manager>
		<header class="app__header" role="banner">
			<pkp-skip-link></pkp-skip-link>
			<?php if ($_smarty_tpl->tpl_vars['availableContexts']->value) {?>
				<dropdown class="app__headerAction app__contexts">
					<template #button>
						<icon icon="Sitemap" class="h-7 w-7"></icon>
						<span class="-screenReader"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"context.contexts"),$_smarty_tpl ) );?>
</span>
					</template>
					<ul>
						<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['availableContexts']->value, 'availableContext');
$_smarty_tpl->tpl_vars['availableContext']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['availableContext']->value) {
$_smarty_tpl->tpl_vars['availableContext']->do_else = false;
?>
							<?php if (!$_smarty_tpl->tpl_vars['currentContext']->value || $_smarty_tpl->tpl_vars['availableContext']->value->name !== $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('name')) {?>
								<li>
									<a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['availableContext']->value->url ));?>
" class="pkpDropdown__action">
										<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['availableContext']->value->name ));?>

									</a>
								</li>
							<?php }?>
						<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
					</ul>
				</dropdown>
			<?php }?>
			<?php if ($_smarty_tpl->tpl_vars['currentContext']->value) {?>
				<a class="app__contextTitle" href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"index"),$_smarty_tpl ) );?>
">
					<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('name') ));?>

				</a>
			<?php } elseif ($_smarty_tpl->tpl_vars['siteTitle']->value) {?>
				<a class="app__contextTitle" href="<?php echo $_smarty_tpl->tpl_vars['baseUrl']->value;?>
">
					<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['siteTitle']->value ));?>

				</a>
			<?php } else { ?>
				<div class="app__contextTitle">
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.software"),$_smarty_tpl ) );?>

				</div>
			<?php }?>
			<?php if ($_smarty_tpl->tpl_vars['currentUser']->value) {?>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['call_hook'][0], array( array('name'=>"Template::Layout::Backend::HeaderActions"),$_smarty_tpl ) );?>

				<top-nav-actions></top-nav-actions>
			<?php }?>
		</header>

		<div class="app__body">
			<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_19963377076aedd33653eb99_16623835', "menu");
?>

			<main id="app-main" class="app__main">
				<div class="app__page width<?php if ($_smarty_tpl->tpl_vars['pageWidth']->value) {?> width--<?php echo $_smarty_tpl->tpl_vars['pageWidth']->value;
}?>">
					<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_9812584436aedd336543283_83665186', "breadcrumbs");
?>


					<?php 
$_smarty_tpl->inheritance->instanceBlock($_smarty_tpl, 'Block_5815615216aedd336552848_35922225', "page");
?>


				</div>
			</main>
		</div>
		<div
			aria-live="polite"
			aria-atomic="true"
			class="app__notifications"
			ref="notifications"
			role="status"
		>
			<transition-group name="app__notification">
				<notification v-for="notification in notifications" :key="notification.key" :type="notification.type" :can-dismiss="true" @dismiss="dismissNotification(notification.key)">
					{{ notification.message }}
				</notification>
			</transition-group>
		</div>
		<transition name="app__loading">
			<div
				v-if="isLoading"
				class="app__loading"
				role="alert"
			>
				<div class="app__loading__content">
					<spinner></spinner>
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.loading"),$_smarty_tpl ) );?>

				</div>
			</div>
		</transition>
	</div>

	<?php echo '<script'; ?>
 type="text/javascript">
		pkp.registry.init('app', <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['pageComponent']->value ));?>
, <?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['state']->value ));?>
);
	<?php echo '</script'; ?>
>
</body>
</html>
<?php }
/* {block "menu"} */
class Block_19963377076aedd33653eb99_16623835 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'menu' => 
  array (
    0 => 'Block_19963377076aedd33653eb99_16623835',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

				<?php if ((isset($_smarty_tpl->tpl_vars['currentContext']->value)) && (isset($_smarty_tpl->tpl_vars['currentUser']->value)) && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'count' ][ 0 ], array( $_smarty_tpl->tpl_vars['currentUser']->value->getRoles($_smarty_tpl->tpl_vars['currentContext']->value->getId()) )) > 0) {?>
					<pkp-side-nav :links="menu" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.navigation.site"),$_smarty_tpl ) );?>
">
					</pkp-side-nav>
				<?php }?>
			<?php
}
}
/* {/block "menu"} */
/* {block "breadcrumbs"} */
class Block_9812584436aedd336543283_83665186 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'breadcrumbs' => 
  array (
    0 => 'Block_9812584436aedd336543283_83665186',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
?>

						<?php if ($_smarty_tpl->tpl_vars['breadcrumbs']->value) {?>
							<nav class="app__breadcrumbs" role="navigation" aria-label="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.breadcrumbLabel"),$_smarty_tpl ) );?>
">
								<ol>
									<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['breadcrumbs']->value, 'breadcrumb', false, NULL, 'breadcrumbs', array (
  'last' => true,
  'iteration' => true,
  'total' => true,
));
$_smarty_tpl->tpl_vars['breadcrumb']->do_else = true;
if ($_from !== null) foreach ($_from as $_smarty_tpl->tpl_vars['breadcrumb']->value) {
$_smarty_tpl->tpl_vars['breadcrumb']->do_else = false;
$_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['iteration']++;
$_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['last'] = $_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['iteration'] === $_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['total'];
?>
										<?php $_smarty_tpl->_assignInScope('_format', mb_strtolower((string) (($tmp = $_smarty_tpl->tpl_vars['breadcrumb']->value['format'] ?? null)===null||$tmp==='' ? 'text' ?? null : $tmp), 'UTF-8'));?>

										<?php if ($_smarty_tpl->tpl_vars['_format']->value === 'text') {?>
											<?php $_smarty_tpl->_assignInScope('_name', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['breadcrumb']->value['name'] )));?>
										<?php } else { ?>
											<?php $_smarty_tpl->_assignInScope('_name', call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['breadcrumb']->value['name'] )));?>
										<?php }?>

										<li>
											<?php if ((isset($_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['last']) ? $_smarty_tpl->tpl_vars['__smarty_foreach_breadcrumbs']->value['last'] : null)) {?>
												<span aria-current="page">
													<?php echo $_smarty_tpl->tpl_vars['_name']->value;?>

												</span>
											<?php } else { ?>
												<a href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['breadcrumb']->value['url'] ));?>
">
													<?php echo $_smarty_tpl->tpl_vars['_name']->value;?>

												</a>
												<span class="app__breadcrumbsSeparator" aria-hidden="true"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"navigation.breadcrumbSeparator"),$_smarty_tpl ) );?>
</span>
											<?php }?>
										</li>
									<?php
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
								</ol>
							</nav>
						<?php }?>
					<?php
}
}
/* {/block "breadcrumbs"} */
/* {block "page"} */
class Block_5815615216aedd336552848_35922225 extends Smarty_Internal_Block
{
public $subBlocks = array (
  'page' => 
  array (
    0 => 'Block_5815615216aedd336552848_35922225',
  ),
);
public function callBlock(Smarty_Internal_Template $_smarty_tpl) {
}
}
/* {/block "page"} */
}
