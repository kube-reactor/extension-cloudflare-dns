#
#=========================================================================================
# Initialization
#
#
# Project Directories
#
export __cloudflare_dns_extension_dir="${2}"

if [ "${DNS_PROVIDER:-}" == "cloudflare" ]; then
  export __cloudflare_dns_terraform_dir="${__cloudflare_dns_extension_dir}/terraform"
  export __cloudflare_dns_project_dir="${__cloudflare_dns_terraform_dir}/dns"

  export CLOUDFLARE_API_TOKEN="${CLOUDFLARE_API_TOKEN:-}"
  export CLOUDFLARE_DOMAIN="${CLOUDFLARE_DOMAIN:-}"

  if [[ ! "$CLOUDFLARE_API_TOKEN" ]] && [[ ! "$CLOUDFLARE_DOMAIN" ]]; then
    emergency "To provision Cloudflare resources, you must specify CLOUDFLARE_API_TOKEN and CLOUDFLARE_DOMAIN environment variables"
  fi

  export TF_VAR_root_domain="$CLOUDFLARE_DOMAIN"
fi
