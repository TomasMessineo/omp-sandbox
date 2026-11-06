<?php
/* Smarty version 4.5.5, created on 2026-11-06 13:38:07
  from 'app:frontendpagesuserLogin.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.5',
  'unifunc' => 'content_6aedd83fd13b90_68375547',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'bd04826a47a63ab4c25ca20ffc3b42835fcab481' => 
    array (
      0 => 'app:frontendpagesuserLogin.tpl',
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
function content_6aedd83fd13b90_68375547 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("app:frontend/components/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('pageTitle'=>"user.login"), 0, false);
?>

<div class="page page_login">
	<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/breadcrumbs.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array('currentTitleKey'=>"user.login"), 0, false);
?>
	<h1>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login"),$_smarty_tpl ) );?>

	</h1>

	<p>
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.requiredField"),$_smarty_tpl ) );?>

	</p>
		<?php if ($_smarty_tpl->tpl_vars['loginMessage']->value) {?>
		<p>
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['loginMessage']->value),$_smarty_tpl ) );?>

		</p>
	<?php }?>

	<form class="cmp_form cmp_form login" id="login" method="post" action="<?php echo $_smarty_tpl->tpl_vars['loginUrl']->value;?>
" role="form">
		<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['csrf'][0], array( array(),$_smarty_tpl ) );?>


		<?php if ($_smarty_tpl->tpl_vars['error']->value) {?>
			<div class="pkp_form_error">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>$_smarty_tpl->tpl_vars['error']->value,'reason'=>$_smarty_tpl->tpl_vars['reason']->value),$_smarty_tpl ) );?>

			</div>
		<?php }?>

		<input type="hidden" name="source" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( (($tmp = $_smarty_tpl->tpl_vars['source']->value ?? null)===null||$tmp==='' ? '' ?? null : $tmp) ));?>
" />

		<fieldset class="fields">
			<legend class="pkp_screen_reader"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login"),$_smarty_tpl ) );?>
</legend>
			<div class="username">
				<label>
					<span class="label">
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.usernameOrEmail"),$_smarty_tpl ) );?>

						<span class="required" aria-hidden="true">*</span>
						<span class="pkp_screen_reader">
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.required"),$_smarty_tpl ) );?>

						</span>
					</span>
					<input type="text" name="username" id="username" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( (($tmp = $_smarty_tpl->tpl_vars['username']->value ?? null)===null||$tmp==='' ? '' ?? null : $tmp) ));?>
" required aria-required="true" autocomplete="username">
				</label>
			</div>
			<div class="password">
				<label>
					<span class="label">
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.password"),$_smarty_tpl ) );?>

						<span class="required" aria-hidden="true">*</span>
						<span class="pkp_screen_reader">
							<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.required"),$_smarty_tpl ) );?>

						</span>
					</span>
					<input type="password" name="password" id="password" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( (($tmp = $_smarty_tpl->tpl_vars['password']->value ?? null)===null||$tmp==='' ? '' ?? null : $tmp) ));?>
" password="true" maxlength="32" required aria-required="true" autocomplete="current-password">
					<a href="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"login",'op'=>"lostPassword"),$_smarty_tpl ) );?>
">
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.forgotPassword"),$_smarty_tpl ) );?>

					</a>
				</label>
			</div>
			<div class="remember checkbox">
				<label>
					<input type="checkbox" name="remember" id="remember" value="1" checked="$remember">
					<span class="label">
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.rememberUsernameAndPassword"),$_smarty_tpl ) );?>

					</span>
				</label>
			</div>

						<?php if ($_smarty_tpl->tpl_vars['recaptchaPublicKey']->value) {?>
				<fieldset class="recaptcha_wrapper">
					<div class="fields">
						<div class="recaptcha">
							<div class="g-recaptcha" data-sitekey="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['recaptchaPublicKey']->value ));?>
">
							</div><label for="g-recaptcha-response" style="display:none;" hidden>Recaptcha response</label>
						</div>
					</div>
				</fieldset>
			<?php }?>

						<?php if ($_smarty_tpl->tpl_vars['altchaEnabled']->value) {?>
				<fieldset class="altcha_wrapper">
					<div class="fields">
						<altcha-widget challengejson='<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'json_encode' ][ 0 ], array( $_smarty_tpl->tpl_vars['altchaChallenge']->value ));?>
' floating></altcha-widget>
					</div>
				</fieldset>
			<?php }?>

			<div class="buttons">
				<button class="submit" type="submit">
					<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login"),$_smarty_tpl ) );?>

				</button>

				<?php if (!$_smarty_tpl->tpl_vars['disableUserReg']->value) {?>
					<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', 'registerUrl', null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('page'=>"user",'op'=>"register",'source'=>$_smarty_tpl->tpl_vars['source']->value),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
					<a href="<?php echo $_smarty_tpl->tpl_vars['registerUrl']->value;?>
" class="register">
						<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login.registerNewAccount"),$_smarty_tpl ) );?>

					</a>
				<?php }?>
			</div>
		</fieldset>
	</form>
</div><!-- .page -->

<?php $_smarty_tpl->_subTemplateRender("app:frontend/components/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
}
}
