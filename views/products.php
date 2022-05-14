<!-- Breadcrumbs -->
<div class="breadcrumb">
    <span>Produtos</span>
</div>

<div class="content">
<?php $message;?>
    <!-- Botões (Buttons) -->
    <div class="menu-data">
        <div>
            <a class="btn" href="<?php echo BASE_URL; ?>products/add">Novo Produto</a>
        </div>
    </div>

    <!-- Cabeçalho da Tabela (Table Header) -->
    <div class="table-header">
        <div class="w-50">Nome do Produto</div>
        <div class="w-40 txt-center"></div>
        <div class="w-10"></div>
    </div>
    <!-- Dados da Tabela (Table Data) -->
    <?php foreach ($products_list as $products) : ?>
        <div class="table-data">
            <div class="w-50 my-s mr-m"><?php echo $products['product_name']; ?></div>
            <div class="w-40 my-s mr-m txt-center"></div>
            <div class="w-10 my-s flex">
                            <div><a class="table-icon" href="<?php echo BASE_URL; ?>users/edit/<?php echo $products['id']; ?>"><i class="fas fa-edit"></i></a></div>
                            <div><a class="table-icon" href="<?php echo BASE_URL; ?>users/delete/<?php echo $products['id']; ?>" onclick="return confirm('Deseja realmente excluir?')"><i class="fas fa-trash-alt"></i></a></div>
            </div>
        </div>
    <?php endforeach; ?>
</div>