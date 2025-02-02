
function cloudflare_dns_records () {
  for host in $(dns_hosts); do
    for ip in $(dns_ip); do
      echo "$host - $ip"
    done
  done

  for host in $(dns_hosts); do
    for hostname in $(dns_hostname); do
      echo "$host - $hostname"
    done
  done
}

function save_dns_records_cloudflare () {
  echo "saving dns records - cloudflare"
  cloudflare_dns_records
  #provisioner_create cloudflare_dns "${__cloudflare_dns_project_dir}"
}

function remove_dns_records_cloudflare () {
  cloudflare_dns_records
  #provisioner_destroy cloudflare_dns "${__cloudflare_dns_project_dir}"
}
