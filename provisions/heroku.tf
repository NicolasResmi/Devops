# Create Heroku apps for staging and production
resource "heroku_app" "staging" {
  name = "cloud-cours"
  region = "eu"
}

resource "heroku_app" "production" {
  name = "clourd-cours-prod"
  region = "eu"
}

# Create a Heroku pipeline
resource "heroku_pipeline" "test-app" {
  name = "test-app"
}

# Couple apps to different pipeline stages
resource "heroku_pipeline_coupling" "staging" {
  app      = "${heroku_app.staging.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage    = "staging"
}

resource "heroku_pipeline_coupling" "production" {
  app      = "${heroku_app.production.name}"
  pipeline = "${heroku_pipeline.test-app.id}"
  stage    = "production"
}