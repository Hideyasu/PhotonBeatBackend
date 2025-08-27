# Solid Cable configuration
# Ensure that the database migrations path exists
Rails.application.config.after_initialize do
  if Rails.env.production? && defined?(SolidCable)
    # Ensure proper database connection for cable
    cable_db_config = Rails.application.config_for(:database)["cable"]
    if cable_db_config
      SolidCable::Record.connects_to(database: { writing: :cable, reading: :cable })
    end
  end
end