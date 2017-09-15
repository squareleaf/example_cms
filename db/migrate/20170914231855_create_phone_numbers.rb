class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number
      t.boolean :primary
      t.integer :type
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end

    remove_column :contacts, :phone
  end
end
