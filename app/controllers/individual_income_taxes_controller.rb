class IndividualIncomeTaxesController < ApplicationController
  def new
    @individual_income_tax = IndividualIncomeTax.new(country: :nz)
  end

  def create
    @individual_income_tax = IndividualIncomeTax.new(individual_income_tax_params)
    if @individual_income_tax.valid?
      calculator = IncomeTaxCalculator.new
      @individual_income_tax.annual_income_tax = calculator.calculate(individual_income_tax: @individual_income_tax)
    end
    render "new"
  end

  private
  def individual_income_tax_params
    params.require(:individual_income_tax).permit(:annual_income, :country)
  end
end