require "rails_helper"

describe IncomeTaxCalculator, type: :service do
  describe "calculates the tax for individual income at each tax bracket" do
    {
      10_000 => 1_050.00,
      35_000 => 5_033.00,
      100_000 => 22_877.50,
      220_000 => 64_877.50
    }.each do |annual_income, expected_income_tax|
      it "calculates the correct tax for annual income of #{annual_income}" do
        individual = IndividualIncomeTax.new(annual_income: annual_income)
        result = described_class.new.calculate(individual_income_tax: individual)
        expect(result).to eq(expected_income_tax)
      end
    end
  end
end