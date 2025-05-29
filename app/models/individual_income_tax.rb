class IndividualIncomeTax
  include ActiveModel::Model

  attr_accessor :annual_income, :annual_income_tax

  validates :annual_income, numericality: { greater_than: 0 }, allow_nil: true
  validates :annual_income_tax, numericality: true, allow_nil: true
  

  def annual_income=(value)
    @annual_income = value&.to_f
  end

  def annual_income_tax=(value)
    @annual_income_tax = value&.to_f
  end
end