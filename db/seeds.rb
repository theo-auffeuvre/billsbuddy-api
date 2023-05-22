

User.destroy_all
Company.destroy_all
UserCompany.destroy_all
Customer.destroy_all
Invoice.destroy_all

# Create Users
puts 'Creating Users...'

user1 = User.create!(
  name: 'John Doe',
  username: 'johndoe',
  email: 'j.doe@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

user2 = User.create!(
  name: 'Jane Doe',
  username: 'janedoe',
  email: 'ja.doe@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

# Create Companies
puts 'Creating Companies...'

company1 = Company.create!(
  name: 'Company 1',
  siret: '12345678912345',
  address: '1 rue de la Paix',
  zipcode: '75001',
  city: 'Paris',
  country: 'France'
)

company2 = Company.create!(
  name: 'Company 2',
  siret: '12345678912345',
  address: '1 rue de la Paix',
  zipcode: '75001',
  city: 'Paris',
  country: 'France'
)

# Create UserCompanies
UserCompany.create!(user: user1, company: company1)
UserCompany.create!(user: user1, company: company2)
UserCompany.create!(user: user2, company: company1)

# Create Customers
puts 'Creating Customers...'

customer1 = Customer.create!(
  name: 'Customer 1',
  email: 'customer1@gmail.com',
  phone: '0123456789',
  siret: '12345678912345',
  address: '1 rue de la Paix',
  additional_address: 'Appartement 1',
  zipcode: '75001',
  city: 'Paris',
  country: 'France',
  intracom_vat_number: 'FR123456789123',
  company: company1
)

customer2 = Customer.create!(
  name: 'Customer 2',
  email: 'customer2@gmail.com',
  phone: '0123456789',
  siret: '12345678912345',
  address: '1 rue de la Paix',
  additional_address: 'Appartement 1',
  zipcode: '75001',
  city: 'Paris',
  country: 'France',
  intracom_vat_number: 'FR123456789123',
  company: company1
)

# Create Invoices
puts 'Creating Invoices...'

invoice1 = Invoice.create!(
  title: 'Invoice 1',
  issue_date: Date.today,
  payment_due: "30",
  customer: customer1
)

invoice2 = Invoice.create!(
  title: 'Invoice 2',
  issue_date: Date.today,
  payment_due: "30",
  customer: customer2
)

# Create delivery addresses
puts 'Creating Delivery Addresses...'

delivery_address1 = DeliveryAddress.create!(
  address: '1 rue de la Paix',
  zipcode: '75001',
  city: 'Paris',
  country: 'France',
  invoice: invoice1
)

delivery_address2 = DeliveryAddress.create!(
  address: '1 rue de la Paix',
  zipcode: '75001',
  city: 'Paris',
  country: 'France',
  invoice: invoice2
)

# Create products
puts 'Creating Products...'

product1 = Product.create!(
  type: 'Product',
  designation: 'Description 1',
  qty: 1,
  unit: "unit",
  price: 10,
  vat_pourcentage: 20,
  invoice: invoice1
)




# Create Invoices

