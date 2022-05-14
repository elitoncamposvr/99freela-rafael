<!-- Breadcrumbs -->
<div class="breadcrumb">
    <span>Usuários</span>
</div>

<div class="content">

    <!-- Botões (Buttons) -->
    <div class="menu-data">
        <div>
            <a class="btn" href="<?php echo BASE_URL; ?>users/add">Novo Usuário</a>
        </div>
    </div>

    <!-- Cabeçalho da Tabela (Table Header) -->
    <div class="table-header">
        <div class="w-50">Email/Login</div>
        <div class="w-40 txt-center">Grupo de Permissões</div>
        <div class="w-10"></div>
    </div>

    <!-- Dados da Tabela (Table Data) -->
    <?php foreach ($users_list as $us) : ?>
        <div class="table-data">
            <div class="w-50 my-s mr-m"><?php echo $us['email']; ?></div>
            <div class="w-40 my-s mr-m txt-center"><?php echo $us['name']; ?></div>
            <div class="w-10 my-s flex">
                            <div><a class="table-icon" href="<?php echo BASE_URL; ?>users/edit/<?php echo $us['id']; ?>"><i class="fas fa-edit"></i></a></div>
                            <div><a class="table-icon" href="<?php echo BASE_URL; ?>users/delete/<?php echo $us['id']; ?>" onclick="return confirm('Deseja realmente excluir?')"><i class="fas fa-trash-alt"></i></a></div>
            </div>
        </div>
    <?php endforeach; ?>
</div>