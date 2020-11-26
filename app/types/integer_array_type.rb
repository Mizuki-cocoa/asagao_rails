class IntegerArrayType < ActiveRecord::Type::Value
  def cast(value)
    return super([value.to_i]) if !value.kind_of?(Array)

    value.delete("")
    super(value.map(&:to_i))
  end
end
