module FlashesHelper
  FLASH_CLASSES = { alert: 'danger', notice: 'success', warning: 'warning' }.with_indifferent_access

  def flash_class(key)
    FLASH_CLASSES[key]
  end

  def user_facing_flashes
    flash.to_hash.slice(*FLASH_CLASSES.keys)
  end
end
