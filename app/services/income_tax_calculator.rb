class IncomeTaxCalculator
  INCOME_TAX_RATES = {
    nz: [
      IncomeTaxRate.new(income_range: (0..15_600), tax_rate: 0.105),
      IncomeTaxRate.new(income_range: (15_600..53_500), tax_rate: 0.175),
      IncomeTaxRate.new(income_range: (53_500..78_100), tax_rate: 0.30),
      IncomeTaxRate.new(income_range: (78_100..180_000), tax_rate: 0.33),
      IncomeTaxRate.new(income_range: (180_000..Float::INFINITY), tax_rate: 0.39)
    ], au: [
      IncomeTaxRate.new(income_range: (0..18_200), tax_rate: 0.0),
      IncomeTaxRate.new(income_range: (18_200..45_000), tax_rate: 0.16),
      IncomeTaxRate.new(income_range: (45_000..135_000), tax_rate: 0.30),
      IncomeTaxRate.new(income_range: (135_000..190_000), tax_rate: 0.37),
      IncomeTaxRate.new(income_range: (190_000..Float::INFINITY), tax_rate: 0.45)
    ]
  }
  def initialize
  end

  def calculate(individual_income_tax:)
    annual_income_tax = 0
    country_tax_rates = INCOME_TAX_RATES[individual_income_tax.country.to_sym]
    country_tax_rates.each do |income_tax_rate|
      # Break if this is the outside the tax bracket
      break if individual_income_tax.annual_income < income_tax_rate.income_range.min
      # Calculate and add the income tax for this tax bracket
      annual_income_tax += calculate_tax_bracket(income_tax_rate: income_tax_rate, individual_income_tax: individual_income_tax)
    end
    return annual_income_tax
  end

  private
  def calculate_tax_bracket(income_tax_rate:, individual_income_tax:)
    # Work out the taxable amount for this tax bracket
    taxable_amount = 
      individual_income_tax.annual_income > income_tax_rate.income_range.max ? 
        (income_tax_rate.income_range.max - income_tax_rate.income_range.min) : 
        (individual_income_tax.annual_income - income_tax_rate.income_range.min)
    # Calculate the amount
    return taxable_amount * income_tax_rate.tax_rate        
  end
end