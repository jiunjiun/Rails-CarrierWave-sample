class UploadPhoto < ActiveRecord::Base

    mount_uploader :file, PhotoUploader

    before_save :update_banner_attributes

    private

    def update_banner_attributes
        if file.present? && file_changed?
            self.name         = file.file.filename
            self.size         = file.file.size
            self.content_type = file.file.content_type
        end
    end
end
