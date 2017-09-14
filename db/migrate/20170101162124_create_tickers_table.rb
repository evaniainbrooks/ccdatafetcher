class CreateTickersTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :tickers do |t|
      t.string :symbol
      t.string :name
			t.float :price
			t.float :volume
			t.float :market_cap
			t.string :currency
			t.float :percent_change_1h
			t.float :percent_change_24h
			t.float :percent_change_7d
      t.timestamps
    end
	end

  def self.down

  end
end
