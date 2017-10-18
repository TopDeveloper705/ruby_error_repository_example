class BaseError < ::StandardError
  def readable_message
    "#{error_name}: #{message}"
  end

  def error_code
    self.class.name.demodulize.underscore.to_sym
  end

  private

  def error_name
    self.class.name.demodulize.titleize.humanize
  end
end
