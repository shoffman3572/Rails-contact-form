# db/migrate/20251030000100_create_contacts.rb
class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :name,   null: false
      t.string :email,  null: false
      t.text   :message, null: false
      t.string :nickname # honeypot for spam (hidden field)

      t.timestamps
    end

    add_index :contacts, :created_at
  end
end
