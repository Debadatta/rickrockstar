module Admin
  class ProductsController < Admin::BaseController

    crudify :product, :xhr_paging => true

  end
end
