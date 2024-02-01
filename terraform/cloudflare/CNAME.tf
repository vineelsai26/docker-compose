resource "cloudflare_record" "algo" {
  name    = "algo"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "algo-47m.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "archive1" {
  name    = "archive1"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-1.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "archive2" {
  name    = "archive2"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-2.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "archive3" {
  name    = "archive3"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-3.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "archive4" {
  name    = "archive4"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "portfolio-archive-4.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "balance" {
  name    = "balance"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "balance-sheet-generator.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "material" {
  name    = "material"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "material-design-icons.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "repo" {
  name    = "repo"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = data.terraform_remote_state.aws_prod.outputs.repo_cloudfront_distribution_domain_name
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "stats_github" {
  name    = "stats.github"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "sudoku" {
  name    = "sudoku"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "sudoku-web.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "tictactoe" {
  name    = "tictactoe"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "tic-tac-toe-web.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "www" {
  name    = "www"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "cname.vercel-dns.com"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "icons" {
  name    = "icons"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "skill-icons.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "collab" {
  name    = "collab"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "collab-aem.pages.dev"
  zone_id = var.zone_id
  comment = var.default_comment
}

resource "cloudflare_record" "acm_repo" {
  name    = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_name
  proxied = false
  ttl     = 1
  type    = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_type
  value   = data.terraform_remote_state.aws_prod.outputs.repo_acm_resource_record_value
  zone_id = var.zone_id
  comment = var.default_comment
}
