class IncomeTaxRate
  attr_reader :income_range, :tax_rate

  def initialize(income_range:, tax_rate:)
    @income_range = income_range
    @tax_rate = tax_rate
  end
end