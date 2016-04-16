class Bolha < ActiveRecord::Base

  #validations
  validates :title, :l_name, :r_name, :l_image, :r_image, :content, presence: true

  # PaperClip
  has_attached_file :l_image, :styles => {
    :large => "512x512" ,
    :medium => "200x200" ,
    :small => "168x168",
    :thumb => "40x40",
    :tiny => "32x32"
    },
    :url  => "/images/bolhas/:id-:basename.:style.:extension",
    :path => ":rails_root/public/images/bolhas/:id-:basename.:style.:extension",
    :default_url => :set_default_url

    validates_attachment_content_type :l_image, :content_type => /\Aimage\/.*\Z/
    validates_attachment_size :l_image, :less_than => 10.megabytes

    has_attached_file :r_image, :styles => {
      :large => "512x512" ,
      :medium => "200x200" ,
      :small => "168x168",
      :thumb => "40x40",
      :tiny => "32x32"
      },
      :url  => "/img/bolhas/:id-:basename.:style.:extension",
      :path => ":rails_root/public/img/bolhas/:id-:basename.:style.:extension",
      :default_url => :set_default_url

      validates_attachment_content_type :l_image, :content_type => /\Aimage\/.*\Z/
      validates_attachment_size :l_image, :less_than => 10.megabytes



  # Se o usuário não tiver foto carrega esta imagem
  def set_default_url
    "/img/missing.jpeg"
  end
end
