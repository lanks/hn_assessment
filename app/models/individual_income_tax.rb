class IndividualIncomeTax
  include ActiveModel::Model
  
  COUNTRIES = { nz: 0, au: 1 }.freeze

  attr_accessor :annual_income, :annual_income_tax, :country

  validates :annual_income, numericality: { greater_than: 0 }, allow_nil: true
  validates :annual_income_tax, numericality: true, allow_nil: true
  validates :country, inclusion: { in: COUNTRIES.keys.map(&:to_s) }, allow_nil: false


  def country_enum
    COUNTRIES
  end

  def country_value
    COUNTRIES[@country.to_sym]
  end

  def self.countries
    COUNTRIES
  end

  def annual_income=(value)
    @annual_income = value&.to_f
  end

  def annual_income_tax=(value)
    @annual_income_tax = value&.to_f
  end
end