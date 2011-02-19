require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  setup do
    @invoice = {
      :terms => 'Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor.',
      :notes => 'Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor.',
      :status => 'draft',
      :client_id => clients(:one).id
    }
  end
  
  test "test @invoice should be valid" do
    assert Invoice.new(@invoice).valid?
  end
  
  # Return user with keys specified in exclude as nil
  def invoice_without(exclude)
    invoice = @invoice
    exclude.each do |e|
      invoice[e] = nil
    end
    
    invoice
  end
  
  # -----------------------------------------------------------------------------------
  
  test "should not accept status other than the valid ones" do
    status = 'draft', 'sent', 'paid'
    invoice = Invoice.new(invoice_without [:status])
    
    status.each do |status|
      invoice.status = status
      assert invoice.valid?, "#{status} should be valid"
    end
    
    invalid_status = 'unpaid', 'invalid'
    invalid_status.each do |status|
      invoice.status = status
      assert invoice.invalid?, "#{status} should not be valid"
    end
    
    invoice.status = nil
    assert invoice.invalid?, "should accept blank status"
  end
end
