<?php
class Products extends model
{
	public function getList($offset, $id_company)
	{
		$array = array();

		$sql = $this->db->prepare("SELECT * FROM products WHERE id_company = :id_company LIMIT $offset, 10");
		$sql->bindValue(":id_company", $id_company);
		$sql->execute();

		if ($sql->rowCount() > 0) {
			$array = $sql->fetchAll();
		}

		return $array;
	}

	public function getInfo($id, $id_company)
	{
		$array = array();

		$sql = $this->db->prepare("SELECT * FROM products WHERE id = :id AND id_company = :id_company");
		$sql->bindValue(":id", $id);
		$sql->bindValue("id_company", $id_company);
		$sql->execute();

		if ($sql->rowCount() > 0) {
			$array = $sql->fetch();
		}

		return $array;
	}

	public function getCount($id_company)
	{
		$r = 0;

		$sql = $this->db->prepare("SELECT COUNT(*) as c FROM products WHERE id_company = :id_company");
		$sql->bindValue('id_company', $id_company);
		$sql->execute();
		$row = $sql->fetch();

		$r = $row['c'];



		return $r;
	}


	public function add($product_name, $aditional_info, $id_company)
	{
		$sql = $this->db->prepare("INSERT INTO products SET product_name = :product_name, aditional_info = :aditional_info, id_company = :id_company");

		$sql->bindValue(":product_name", $product_name);
		$sql->bindValue(":aditional_info", $aditional_info);
		$sql->bindValue(":id_company", $id_company);
		$sql->execute();

		// $product_id = $this->db->lastInsertId();

		// $sql = $this->db->prepare("INSERT INTO products_img SET product_id = $product_id, img_name = :img_name");
		
		// $sql->execute();
	}

	// public function edit($id, $name_shipping_co, $social_reason, $contact_name, $cnpj, $state_registration, $phone, $whatsapp, $email, $website, $aditional_info, $address_zipcode, $address, $address2, $address_number, $address_neighb, $address_city, $address_state, $id_company)
	// {

	// 	$sql = $this->db->prepare("UPDATE shipping_company SET name_shipping_co = :name_shipping_co, social_reason = :social_reason, contact_name = :contact_name, cnpj = :cnpj, state_registration = :state_registration, phone = :phone, whatsapp = :whatsapp, email = :email, website = :website, aditional_info = :aditional_info, address_zipcode = :address_zipcode, address = :address, address2 = :address2, address_number = :address_number, address_neighb = :address_neighb, address_city = :address_city, address_state = :address_state WHERE id = :id AND id_company = :id_company");
	// 	$sql->bindValue(":id", $id);
	// 	$sql->bindValue(":name_shipping_co", $name_shipping_co);
	// 	$sql->bindValue(":social_reason", $social_reason);
	// 	$sql->bindValue(":contact_name", $contact_name);
	// 	$sql->bindValue(":cnpj", $cnpj);
	// 	$sql->bindValue(":state_registration", $state_registration);
	// 	$sql->bindValue(":phone", $phone);
	// 	$sql->bindValue(":whatsapp", $whatsapp);
	// 	$sql->bindValue(":email", $email);
	// 	$sql->bindValue(":website", $website);
	// 	$sql->bindValue(":aditional_info", $aditional_info);
	// 	$sql->bindValue(":address_zipcode", $address_zipcode);
	// 	$sql->bindValue(":address", $address);
	// 	$sql->bindValue(":address2", $address2);
	// 	$sql->bindValue(":address_number", $address_number);
	// 	$sql->bindValue(":address_neighb", $address_neighb);
	// 	$sql->bindValue(":address_city", $address_city);
	// 	$sql->bindValue(":address_state", $address_state);
	// 	$sql->bindValue(":id_company", $id_company);
	// 	$sql->execute();
	// }

	// public function delete($id, $id_company)
	// {
	// 	$sql = $this->db->prepare("DELETE FROM shipping_company WHERE id = :id AND id_company = :id_company");
	// 	$sql->bindValue(":id", $id);
	// 	$sql->bindValue(":id_company", $id_company);
	// 	$sql->execute();
	// }

	// public function searchShippingCompany($sp, $id_company)
	// {
	// 	$array = array();

	// 	$sql = $this->db->prepare("SELECT name_shipping_co, social_reason, contact_name, phone, id FROM shipping_company WHERE name_shipping_co LIKE '%$sp%' OR social_reason LIKE '%$sp%' ORDER BY name_shipping_co ASC");
	// 	$sql->bindValue(":name_shipping_co", $sp . '%');
	// 	$sql->bindValue(":social_reason", $sp . '%');
	// 	$sql->bindValue(":id_company", $id_company);
	// 	$sql->execute();

	// 	if ($sql->rowCount() > 0) {
	// 		$array = $sql->fetchAll();
	// 	}
	// 	return $array;
	// }
}
