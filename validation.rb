module Validation
  def validated?(code)
    code.length == 4 &&
      code.uniq.length == 4 &&
      code.all? { |i| "0123456789".include?(i) }
  end
end