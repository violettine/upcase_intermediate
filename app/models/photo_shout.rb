class PhotoShout < ActiveRecord::Base
  has_attached_file :image, styles: {
    shout: '200x200>'
  }
  # Validate content type
  validates_attachment_content_type :image, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end
