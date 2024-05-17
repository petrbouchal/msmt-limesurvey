library(quarto)
library(purrr)

quarto_render("template.qmd", execute_params = list(blah = "that", id = 999))

render_by_id <- function(id) {
  quarto_render("template.qmd", execute_params = list(id = id),
                output_file = paste0("report_", id, ".html"))
}

resps <- readRDS("resps.rds")
ids <- unique(resps$id)

for (id in ids) {
  render_by_id(id)
}

purrr::walk(ids, render_by_kraj)


quarto_render("template.qmd", execute_params = list(blah = "that", id = 999), metadata = list(title = "Hahaha", author = "Whoever"))

render_by_id_with_title <- function(id) {

  id_respondent <- paste("Respondent", id)

  quarto_render("template.qmd", execute_params = list(id = id,
                                                      respondent = id_respondent),
                output_file = paste0("report_", id, ".html"))
}

render_by_id_with_title(333)
