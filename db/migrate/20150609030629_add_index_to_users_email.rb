class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true #给 users表的 email添加唯一索引，可以直接编辑users的迁移文件，但是需要先rollback
  end
end
