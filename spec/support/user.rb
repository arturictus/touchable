class User
  extend ActiveModel::Callbacks

  define_model_callbacks :update
  include Touchable

  def update
    run_callbacks :update do
      touch
    end
  end

  def touch
  end
end
