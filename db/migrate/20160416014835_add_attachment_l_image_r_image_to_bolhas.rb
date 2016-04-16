class AddAttachmentLImageRImageToBolhas < ActiveRecord::Migration
  def self.up
    change_table :bolhas do |t|
      t.attachment :l_image
      t.attachment :r_image
    end
  end

  def self.down
    remove_attachment :bolhas, :l_image
    remove_attachment :bolhas, :r_image
  end
end
