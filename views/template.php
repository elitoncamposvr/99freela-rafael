<!DOCTYPE html>
<html>

<head>
	<meta charset='utf-8'>
	<meta lang="pt-br">
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<title>SysDoc - Painel de controle</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<link href="<?php echo BASE_URL; ?>assets/css/main.css" rel="stylesheet">
</head>

<body>

	<div class="container">

		<div class="aside">
			<div class="logo-field">
				<img src="https://app.nubank.com.br/images/new-logo-white.svg" alt="Logo">
			</div>
			<nav>
				<div class="nav-item">
					<a href="<?php echo BASE_URL; ?>">
						<div class="icon">
							<i class="fas fa-home fa-lg"></i>
						</div>
						<span>
							Dashboard
						</span>
					</a>
				</div>
				<div class="nav-item">
					<a href="<?php echo BASE_URL; ?>products">
						<div class="icon">
							<i class="fas fa-address-book fa-lg"></i>
						</div>
						<span>
							Cadastros
						</span>
					</a>
				</div>
				<div class="nav-item">
					<a href="<?php echo BASE_URL; ?>users">
						<div class="icon">
							<i class="fas fa-user fa-lg"></i>
						</div>
						<span>
							Usuários
						</span>
					</a>
				</div>
				<div class="nav-item">
					<a href="<?php echo BASE_URL; ?>settings">
						<div class="icon">
							<i class="fas fa-cog fa-lg"></i>
						</div>
						<span>
							Configurações
						</span>
					</a>
				</div>
				<div class="nav-item">
					<a href="<?php echo BASE_URL; ?>login/logout">
						<div class="icon">
							<i class="fas fa-sign-out-alt fa-lg"></i>
						</div>
						<span>
							Sair
						</span>
					</a>
				</div>
			</nav>
		</div>

		<main>
			<div class="main-content">
				<?php $this->loadViewInTemplate($viewName, $viewData); ?>
			</div>
		</main>

	</div>
</body>

</html>