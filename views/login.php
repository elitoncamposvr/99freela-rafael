<!DOCTYPE html>
<html lang="pt-br" />

<head>
  <title>Entrar no Sistema</title>

  <!-- Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- App CSS -->
  <link rel="stylesheet" href="<?php echo BASE_URL; ?>assets/css/login.css" />
</head>

<body>
  <div class="logo-header">
    <img src="https://app.nubank.com.br/images/new-logo-white.svg" alt="">
  </div>
  <div class="container">

    <div class="modal">
      <form method="post">
        <h1>Faça seu login</h1>
        <div class="inputs-field">
          <label for="email">E-mail</label>
          <div class="inputs-field--input">
            <input type="email" name="email" id="email" required autofocus>
          </div>
        </div>
        <div class="inputs-field">
          <label for="password">Senha</label>
          <div class="inputs-field--input">
            <input type="password" name="password" id="password" required>
          </div>
        </div>
        <div class="btn-field">
          <button type="submit">
            entrar
          </button>
        </div>
      </form>
    </div>
  </div>
</body>

</html>