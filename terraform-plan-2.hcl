
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

 # module.consul_cluster.data.template_file.compute_instance_template_self_link will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "compute_instance_template_self_link"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = (known after apply)
    }

 # module.consul_cluster.google_compute_firewall.allow_inbound_dns[0] will be created
  + resource "google_compute_firewall" "allow_inbound_dns" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "consul-server-rule-external-dns-access"
      + network            = "default"
      + priority           = 1000
      + project            = "hc-c858ec7b69a3402a8f35fd287c2"
      + self_link          = (known after apply)
      + source_tags        = [
          + "nomad-client",
          + "nomad-server",
        ]
      + target_tags        = [
          + "consul-server",
        ]

      + allow {
          + ports    = [
              + "8600",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "8600",
            ]
          + protocol = "udp"
        }
    }

 # module.consul_cluster.google_compute_firewall.allow_inbound_http_api[0] will be created
  + resource "google_compute_firewall" "allow_inbound_http_api" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "consul-server-rule-external-api-access"
      + network            = "default"
      + priority           = 1000
      + project            = "hc-c858ec7b69a3402a8f35fd287c2"
      + self_link          = (known after apply)
      + source_tags        = [
          + "nomad-client",
          + "nomad-server",
        ]
      + target_tags        = [
          + "consul-server",
        ]

      + allow {
          + ports    = [
              + "8500",
            ]
          + protocol = "tcp"
        }
    }

 # module.consul_cluster.google_compute_firewall.allow_intracluster_consul will be created
  + resource "google_compute_firewall" "allow_intracluster_consul" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "consul-server-rule-cluster"
      + network            = "default"
      + priority           = 1000
      + project            = "hc-c858ec7b69a3402a8f35fd287c2"
      + self_link          = (known after apply)
      + source_tags        = [
          + "consul-server",
        ]
      + target_tags        = [
          + "consul-server",
        ]

      + allow {
          + ports    = [
              + "8300",
              + "8400",
              + "8301",
              + "8302",
              + "8500",
              + "8600",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "8301",
              + "8302",
              + "8600",
            ]
          + protocol = "udp"
        }
    }

 # module.consul_cluster.google_compute_instance_template.consul_server_public[0] will be created
  + resource "google_compute_instance_template" "consul_server_public" {
      + can_ip_forward          = false
      + id                      = (known after apply)
      + machine_type            = "g1-small"
      + metadata                = {
          + "cluster-size" = "3"
        }
      + metadata_fingerprint    = (known after apply)
      + metadata_startup_script = <<-EOT
            #!/bin/bash
            # This script is meant to be run in the Startup Script of each Compute Instance while it's booting. The script uses the
            # run-consul script to configure and start Consul in server mode. Note that this script assumes it's running in a Compute
            # Instance built from the Packer template in examples/consul.json in the Consul GCP Module.
            
            set -e
            
            # Send the log output from this script to user-data.log, syslog, and the console
            # Inspired by https://alestic.com/2010/12/ec2-user-data-output/
            exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
            
            # These variables are passed in via Terraform template interplation
            /opt/consul/bin/run-consul --server --cluster-tag-name "consul-server"
        EOT
      + name                    = (known after apply)
      + name_prefix             = "consul-server"
      + project                 = "hc-c858ec7b69a3402a8f35fd287c2"
      + region                  = (known after apply)
      + self_link               = (known after apply)
      + tags                    = [
          + "consul-server",
        ]
      + tags_fingerprint        = (known after apply)

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + disk {
          + auto_delete  = true
          + boot         = true
          + device_name  = (known after apply)
          + disk_size_gb = 30
          + disk_type    = "pd-standard"
          + interface    = (known after apply)
          + mode         = (known after apply)
          + source_image = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/images/nomad-consul-ubuntu18-2022-02-23-015110"
          + type         = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = "default"
          + stack_type         = (known after apply)
          + subnetwork         = (known after apply)
          + subnetwork_project = "hc-c858ec7b69a3402a8f35fd287c2"

          + access_config {
              + nat_ip                 = (known after apply)
              + network_tier           = (known after apply)
              + public_ptr_domain_name = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
              + "https://www.googleapis.com/auth/devstorage.read_only",
              + "https://www.googleapis.com/auth/userinfo.email",
            ]
        }
    }

 # module.consul_cluster.google_compute_region_instance_group_manager.consul_server will be created
  + resource "google_compute_region_instance_group_manager" "consul_server" {
      + base_instance_name               = "consul-server"
      + distribution_policy_target_shape = (known after apply)
      + distribution_policy_zones        = (known after apply)
      + fingerprint                      = (known after apply)
      + id                               = (known after apply)
      + instance_group                   = (known after apply)
      + name                             = "consul-server-ig"
      + project                          = "hc-c858ec7b69a3402a8f35fd287c2"
      + region                           = "us-west1"
      + self_link                        = (known after apply)
      + status                           = (known after apply)
      + target_size                      = 3
      + wait_for_instances               = false
      + wait_for_instances_status        = "STABLE"

      + update_policy {
          + instance_redistribution_type = (known after apply)
          + max_surge_fixed              = (known after apply)
          + max_surge_percent            = (known after apply)
          + max_unavailable_fixed        = (known after apply)
          + max_unavailable_percent      = (known after apply)
          + minimal_action               = (known after apply)
          + replacement_method           = (known after apply)
          + type                         = (known after apply)
        }

      + version {
          + instance_template = (known after apply)
        }
    }

 # module.nomad_clients.data.template_file.compute_instance_template_self_link will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "compute_instance_template_self_link"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = (known after apply)
    }

 # module.nomad_clients.google_compute_instance_template.nomad_public[0] will be created
  + resource "google_compute_instance_template" "nomad_public" {
      + can_ip_forward          = false
      + id                      = (known after apply)
      + machine_type            = "g1-small"
      + metadata                = {
          + "cluster-size" = "2"
        }
      + metadata_fingerprint    = (known after apply)
      + metadata_startup_script = <<-EOT
            #!/bin/bash
            # This script is meant to be run in the Startup Script of each Compute Instance while it's booting. The script uses the
            # run-consul script to configure and start Consul in client mode and the run-nomad script to configure and start Nomad
            # in client mode. Note that this script assumes it's running in a Compute Instance built from the Packer template in
            # examples/nomad-consul-image/nomad-consul.json.
            
            set -e
            
            # Send the log output from this script to user-data.log, syslog, and the console
            # Inspired by https://alestic.com/2010/12/ec2-user-data-output/
            exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
            
            # These variables are passed in via Terraform template interplation
            /opt/consul/bin/run-consul --client --cluster-tag-name "consul-server"
            /opt/nomad/bin/run-nomad --client
            
        EOT
      + name                    = (known after apply)
      + name_prefix             = "nomad-client"
      + project                 = (known after apply)
      + region                  = (known after apply)
      + self_link               = (known after apply)
      + tags                    = [
          + "nomad-client",
        ]
      + tags_fingerprint        = (known after apply)

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + disk {
          + auto_delete  = true
          + boot         = true
          + device_name  = (known after apply)
          + disk_size_gb = 30
          + disk_type    = "pd-standard"
          + interface    = (known after apply)
          + mode         = (known after apply)
          + source_image = "nomad-consul-ubuntu18-2022-02-23-015110"
          + type         = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = "default"
          + stack_type         = (known after apply)
          + subnetwork         = (known after apply)
          + subnetwork_project = (known after apply)

          + access_config {
              + nat_ip                 = (known after apply)
              + network_tier           = (known after apply)
              + public_ptr_domain_name = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
              + "https://www.googleapis.com/auth/userinfo.email",
            ]
        }
    }

 # module.nomad_clients.google_compute_region_instance_group_manager.nomad will be created
  + resource "google_compute_region_instance_group_manager" "nomad" {
      + base_instance_name               = "nomad-client"
      + distribution_policy_target_shape = (known after apply)
      + distribution_policy_zones        = (known after apply)
      + fingerprint                      = (known after apply)
      + id                               = (known after apply)
      + instance_group                   = (known after apply)
      + name                             = "nomad-client-ig"
      + project                          = (known after apply)
      + region                           = "us-west1"
      + self_link                        = (known after apply)
      + status                           = (known after apply)
      + target_size                      = 2
      + wait_for_instances               = false
      + wait_for_instances_status        = "STABLE"

      + update_policy {
          + instance_redistribution_type = (known after apply)
          + max_surge_fixed              = (known after apply)
          + max_surge_percent            = (known after apply)
          + max_unavailable_fixed        = (known after apply)
          + max_unavailable_percent      = (known after apply)
          + minimal_action               = (known after apply)
          + replacement_method           = (known after apply)
          + type                         = (known after apply)
        }

      + version {
          + instance_template = (known after apply)
        }
    }

 # module.nomad_servers.data.template_file.compute_instance_template_self_link will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "compute_instance_template_self_link"  {
      + id       = (known after apply)
      + rendered = (known after apply)
      + template = (known after apply)
    }

 # module.nomad_servers.google_compute_instance_template.nomad_public[0] will be created
  + resource "google_compute_instance_template" "nomad_public" {
      + can_ip_forward          = false
      + id                      = (known after apply)
      + machine_type            = "g1-small"
      + metadata                = {
          + "cluster-size" = "3"
        }
      + metadata_fingerprint    = (known after apply)
      + metadata_startup_script = <<-EOT
            #!/bin/bash
            # This script is meant to be run in the Startup Script of each Compute Instance while it's booting. The script uses the
            # run-consul script to configure and start Consul in client mode and then the run-nomad script to configure and start
            # Nomad in server mode. Note that this script assumes it's running in a Google Image built from the Packer template in
            # examples/nomad-consul-image/nomad-consul.json.
            
            set -e
            
            # Send the log output from this script to user-data.log, syslog, and the console
            # Inspired by https://alestic.com/2010/12/ec2-user-data-output/
            exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
            
            /opt/consul/bin/run-consul --client --cluster-tag-name "consul-server"
            /opt/nomad/bin/run-nomad --server --num-servers "3"
        EOT
      + name                    = (known after apply)
      + name_prefix             = "nomad-server"
      + project                 = (known after apply)
      + region                  = (known after apply)
      + self_link               = (known after apply)
      + tags                    = [
          + "nomad-server",
        ]
      + tags_fingerprint        = (known after apply)

      + confidential_instance_config {
          + enable_confidential_compute = (known after apply)
        }

      + disk {
          + auto_delete  = true
          + boot         = true
          + device_name  = (known after apply)
          + disk_size_gb = 30
          + disk_type    = "pd-standard"
          + interface    = (known after apply)
          + mode         = (known after apply)
          + source_image = "nomad-consul-ubuntu18-2022-02-23-015110"
          + type         = (known after apply)
        }

      + network_interface {
          + ipv6_access_type   = (known after apply)
          + name               = (known after apply)
          + network            = "default"
          + stack_type         = (known after apply)
          + subnetwork         = (known after apply)
          + subnetwork_project = (known after apply)

          + access_config {
              + nat_ip                 = (known after apply)
              + network_tier           = (known after apply)
              + public_ptr_domain_name = (known after apply)
            }
        }

      + scheduling {
          + automatic_restart   = true
          + on_host_maintenance = "MIGRATE"
          + preemptible         = false
        }

      + service_account {
          + email  = (known after apply)
          + scopes = [
              + "https://www.googleapis.com/auth/compute.readonly",
              + "https://www.googleapis.com/auth/userinfo.email",
            ]
        }
    }

 # module.nomad_servers.google_compute_region_instance_group_manager.nomad will be created
  + resource "google_compute_region_instance_group_manager" "nomad" {
      + base_instance_name               = "nomad-server"
      + distribution_policy_target_shape = (known after apply)
      + distribution_policy_zones        = (known after apply)
      + fingerprint                      = (known after apply)
      + id                               = (known after apply)
      + instance_group                   = (known after apply)
      + name                             = "nomad-server-ig"
      + project                          = (known after apply)
      + region                           = "us-west1"
      + self_link                        = (known after apply)
      + status                           = (known after apply)
      + target_size                      = 3
      + wait_for_instances               = false
      + wait_for_instances_status        = "STABLE"

      + update_policy {
          + instance_redistribution_type = (known after apply)
          + max_surge_fixed              = (known after apply)
          + max_surge_percent            = (known after apply)
          + max_unavailable_fixed        = (known after apply)
          + max_unavailable_percent      = (known after apply)
          + minimal_action               = (known after apply)
          + replacement_method           = (known after apply)
          + type                         = (known after apply)
        }

      + version {
          + instance_template = (known after apply)
        }
    }

 # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_http[0] will be created
  + resource "google_compute_firewall" "allow_inbound_http" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-client-rule-external-http-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_tags        = [
          + "consul-server",
          + "nomad-server",
        ]
      + target_tags        = [
          + "nomad-client",
        ]

      + allow {
          + ports    = [
              + "4646",
            ]
          + protocol = "tcp"
        }
    }

 # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0] will be created
  + resource "google_compute_firewall" "allow_inbound_rpc" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-client-rule-external-rpc-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_tags        = [
          + "nomad-server",
        ]
      + target_tags        = [
          + "nomad-client",
        ]

      + allow {
          + ports    = [
              + "4647",
            ]
          + protocol = "tcp"
        }
    }

 # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0] will be created
  + resource "google_compute_firewall" "allow_inbound_serf" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-client-rule-external-serf-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_tags        = [
          + "nomad-server",
        ]
      + target_tags        = [
          + "nomad-client",
        ]

      + allow {
          + ports    = [
              + "4648",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "4648",
            ]
          + protocol = "udp"
        }
    }

 # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_http[0] will be created
  + resource "google_compute_firewall" "allow_inbound_http" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-server-rule-external-http-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [
          + "73.109.72.170/32",
        ]
      + source_tags        = [
          + "consul-server",
          + "nomad-client",
        ]
      + target_tags        = [
          + "nomad-server",
        ]

      + allow {
          + ports    = [
              + "4646",
            ]
          + protocol = "tcp"
        }
    }

 # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0] will be created
  + resource "google_compute_firewall" "allow_inbound_rpc" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-server-rule-external-rpc-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_tags        = [
          + "consul-server",
          + "nomad-client",
        ]
      + target_tags        = [
          + "nomad-server",
        ]

      + allow {
          + ports    = [
              + "4647",
            ]
          + protocol = "tcp"
        }
    }

 # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0] will be created
  + resource "google_compute_firewall" "allow_inbound_serf" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "nomad-server-rule-external-serf-access"
      + network            = "default"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_tags        = [
          + "consul-server",
          + "nomad-client",
        ]
      + target_tags        = [
          + "nomad-server",
        ]

      + allow {
          + ports    = [
              + "4648",
            ]
          + protocol = "tcp"
        }
      + allow {
          + ports    = [
              + "4648",
            ]
          + protocol = "udp"
        }
    }

Plan: 15 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + consul_server_cluster_tag_name    = "consul-server"
  + consul_server_instance_group_name = "consul-server-ig"
  + consul_server_instance_group_url  = (known after apply)
  + gcp_project                       = "hc-c858ec7b69a3402a8f35fd287c2"
  + gcp_region                        = "us-west1"
  + nomad_client_cluster_size         = 2
  + nomad_client_cluster_tag_name     = "nomad-client"
  + nomad_client_instance_group_id    = (known after apply)
  + nomad_client_instance_group_name  = "nomad-client-ig"
  + nomad_client_instance_group_url   = (known after apply)
  + nomad_server_cluster_size         = 3
  + nomad_server_cluster_tag_name     = "nomad-server"
  + nomad_server_instance_group_id    = (known after apply)
  + nomad_server_instance_group_name  = "nomad-server-ig"
  + nomad_server_instance_group_url   = (known after apply)

─────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
