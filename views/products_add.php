<!-- Breadcrumbs -->
<div class="breadcrumb">
    <span>Produtos</span>
</div>

<div class="content">

    <!-- Botões (Buttons) -->
    <div class="menu-data">
        <div>
            <a class="btn" href="<?php echo BASE_URL; ?>products/add">Novo Produto</a>
        </div>
    </div>


    <!-- Formulário - Dados Pessoais (Form - Personal Data) -->
    <form method="POST" autocomplete="off">
        <div class="flex w-100">
            <div class="w-50 my-s mr-m">
                <label for="product_name">Nome do Produto</label>
                <input class="w-100" type="text" name="product_name" id="product_name" autofocus>
            </div>
            <div class="w-50 my-s mr-m">
                <div>
                    <label for="">Imagem do Produto</label>
                </div>
                <div class="input-file">
                    <label for="files" class="input-file--img">ENVIAR IMAGEM</label>
                    <input class="product-img" type="file" name="files[]" id="files">
                </div>
            </div>
        </div>

        <div class="w-100">
            <label for="aditional_info">Observações</label>
            <textarea name="aditional_info" id="aditional_info" class="w-100"></textarea>
        </div>

        <!-- Botões (Button) -->
        <div class="w-100 txt-center my-el">
            <button type="submit">
                Adicionar Produto
            </button>
        </div>
    </form>
</div>