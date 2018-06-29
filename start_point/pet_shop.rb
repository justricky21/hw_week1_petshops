def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets_sold)
  return pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop,pet_breed)
  by_breed = []
  for pets in pet_shop[:pets]
    if pets[:breed] == pet_breed
      by_breed.push(pets)
    end
  end
  return by_breed
end

def find_pet_by_name(pet_shop,name)
  for pets in pet_shop[:pets]
    if pets[:name] == name
      return pets
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop,name)
  for pets in pet_shop[:pets]
    if pets[:name] == name
      pet_shop[:pets].delete(pets)
    end
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customers)
  return customers[:cash]
end

def remove_customer_cash(customer,cash)
  return customer[:cash] -= cash
end

def customer_pet_count(customers)
  return customers[:pets].count
end

def add_pet_to_customer(customers,new_pet)
  return customers[:pets].push(new_pet)
end

def customer_can_afford_pet(customers,pet)
  return customers[:cash] >= pet[:price]
end

def sell_pet_to_customer(pet_shop,pet,customers)
  if pet != nil && customer_can_afford_pet(customers,pet)
    remove_customer_cash(customers,pet[:price])
    remove_pet_by_name(pet_shop,pet)
    add_pet_to_customer(customers,pet)
    add_or_remove_cash(pet_shop,pet[:price])
    increase_pets_sold(pet_shop,1)
  end
end
