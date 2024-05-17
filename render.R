library(quarto)
library(purrr)

quarto_render("_template.qmd", execute_params = list(blah = "that", id = 999))

render_by_id <- function(id) {
  quarto_render("template.qmd", execute_params = list(id = id),
                output_file = paste0("report_", id))
}

resps <- readRDS("resps.rds")
ids <- unique(resps$id)

for (id in ids) {
  render_by_kraj(id)
}

purrr::walk(ids, render_by_kraj)


quarto_render("template.qmd", execute_params = list(blah = "that", id = 999), metadata = list(title = "Hahaha", author = "Whoever"))
render_by_id_with_title <- function(id) {

  id_report <- paste("Respondent", id)

  quarto_render("template.qmd", execute_params = list(id = id_report),
                output_file = paste0("report_", id, ".html"), metadata = list(title = id))
}

render_by_id_with_title(333)
