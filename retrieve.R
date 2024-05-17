library(reschola) # remotes::install_github("petrbouchal/reschola", force = TRUE) # oprava pro starší LS
library(reschola) # remotes::install_github("scholaempirica/reschola")


# https://evaluace.opjak.cz/index.php/admin/remotecontrol

# ls_login(api_url = "https://evaluace.opjak.cz/index.php/admin/remotecontrol")
ls_login(api_url = "https://survey.petrbouchal.xyz/index.php/admin/remotecontrol")
ls_surveys()

# ls_responses(285817) - SŠ dotazník na LS OP JAK

resps <- ls_responses(646135, lang = "cs-informal")
saveRDS(resps, "resps.rds")
