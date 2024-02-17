class ChangeWorkingStyleToWork < ActiveRecord::Migration[6.1]
  def change
      change_column :works, :working_style, :string
  end
end
