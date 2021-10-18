
resource "google_api_gateway_api" "api" {
  provider = google-beta
  api_id = var.api_id
  display_name = var.api_gateway_display_name
}

resource "google_api_gateway_api_config" "api_cfg" {
  provider = google-beta
  api = google_api_gateway_api.api.api_id
  api_config_id = var.api_config_id

  openapi_documents {
    document {
      path = var.open_api_document_filename
      contents = filebase64(var.open_api_document_file_path)
    }
  }
}

resource "google_api_gateway_gateway" "api_gw" {
  provider = google-beta
  api_config = google_api_gateway_api_config.api_cfg.id
  gateway_id = var.api_gateway_id
}


