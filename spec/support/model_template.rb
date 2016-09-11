class ModelTemplate
  extend ActiveModel::Callbacks

  define_model_callbacks :update

  def update
    run_callbacks :update do
      touch
    end
  end

  def touch
    @updated_at = nil
    true
  end

  def updated_at
    @updated_at ||= Time.now
  end
end
