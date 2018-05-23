module FlashesHelper
  FLASH_CLASSES = { alert: 'danger', notice: 'success', warning: 'warning' }.freeze

  def flash_class(key)
    FLASH_CLASSES[key.to_sym]
  end

  def user_facing_flashes
    flash.to_hash.slice(*FLASH_CLASSES.keys.map(&:to_s))
  end
end
