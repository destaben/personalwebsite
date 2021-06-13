data "archive_file" "init" {
  type        = "zip"
  source_dir  = "website/"
  output_path = "website.zip"
}

resource "null_resource" "gastby_build" {
  triggers = {
    src_hash = data.archive_file.init.output_sha
  }

  provisioner "local-exec" {
    command = "npm install && node_modules/.bin/gatsby build --no-colors"
  }
}