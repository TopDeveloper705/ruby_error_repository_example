class ErrorSerializer
  def self.serialize(error)
    {
      code: error.error_code,
      message: error.readable_message
    }
  end
end
