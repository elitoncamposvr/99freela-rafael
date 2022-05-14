public function add()
{
$data = array();
$u = new Users();
$u->setLoggedUser();
$company = new Companies($u->getCompany());
$data['company_name'] = $company->getName();
$data['user_email'] = $u->getEmail();

if ($u->hasPermission('inventory_add')) {
$products = new Products();

if (isset($_POST['product_name']) && !empty($_POST['product_name'])) {
$countfiles = count($_FILES['files']);

for ($i = 0; $i < $countfiles; $i++) { // File name $filename=$_FILES['files']['name'][$i]; // Location $target_file='upload/' . $filename; // file extension $file_extension=pathinfo( $target_file, PATHINFO_EXTENSION ); $file_extension=strtolower($file_extension); // Valid image extension $valid_extension=array("png", "jpeg" , "jpg" ); if (in_array($file_extension, $valid_extension)) { // Upload file if (move_uploaded_file( $_FILES['files']['tmp_name'][$i], $target_file )) { chmod($target_file, 0666); } } } $product_name=addslashes($_POST['product_name']); $aditional_info=addslashes($_POST['aditional_info']); $products->add($product_name, $aditional_info, $u->getCompany());

    header("Location: " . BASE_URL . "products");
    }
    $this->loadTemplate('products_add', $data);
    } else {
    header("Location: " . BASE_URL . "unauthorized");
    }
    }