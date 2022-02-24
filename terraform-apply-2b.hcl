mmodule.consul_cluster.google_compute_firewall.allow_inbound_http_api[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-external-api-access]
mmodule.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_http[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-http-access]
mmodule.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_http[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-http-access]
mmodule.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-rpc-access]
mmodule.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-serf-access]
mmodule.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-serf-access]
mmodule.consul_cluster.google_compute_firewall.allow_inbound_dns[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-external-dns-access]
mmodule.nomad_servers.google_compute_instance_template.nomad_public[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/nomad-server20220223200856183500000003]
mmodule.nomad_clients.google_compute_instance_template.nomad_public[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/nomad-client20220223200856143800000002]
mmodule.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-rpc-access]
mmodule.consul_cluster.google_compute_firewall.allow_intracluster_consul: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-cluster]
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001]
mmodule.nomad_clients.google_compute_region_instance_group_manager.nomad: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-client-ig]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig]
mmodule.nomad_servers.google_compute_region_instance_group_manager.nomad: Refreshing state... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-server-ig]

Note:m Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the
last "terraform apply":

  # module.consul_cluster.google_compute_firewall.allow_inbound_dns[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_dns" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-external-dns-access"
        name                    = "consul-server-rule-external-dns-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (2 unchanged blocks hidden)
    }

  # module.consul_cluster.google_compute_firewall.allow_inbound_http_api[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_http_api" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-external-api-access"
        name                    = "consul-server-rule-external-api-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.consul_cluster.google_compute_firewall.allow_intracluster_consul has changed
  ~ resource "google_compute_firewall" "allow_intracluster_consul" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/consul-server-rule-cluster"
        name                    = "consul-server-rule-cluster"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (2 unchanged blocks hidden)
    }

  # module.consul_cluster.google_compute_instance_template.consul_server_public[0] has changed
  ~ resource "google_compute_instance_template" "consul_server_public" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001"
        name                    = "consul-server20220223200855958800000001"
        tags                    = [
            "consul-server",
        ]
        # (8 unchanged attributes hidden)

      ~ disk {
          + mlabels            = {}
          + mresource_policies = []
            # (9 unchanged attributes hidden)
        }



        # (3 unchanged blocks hidden)
    }

  # module.consul_cluster.google_compute_region_instance_group_manager.consul_server has changed
  ~ resource "google_compute_region_instance_group_manager" "consul_server" {
        id                               = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig"
        name                             = "consul-server-ig"
      ~ mstatus                           = [
          ~ {
              ~ is_stable      = false -> true
                # (2 unchanged elements hidden)
            },
        ]
      + mtarget_pools                     = []
        # (11 unchanged attributes hidden)


        # (2 unchanged blocks hidden)
    }

  # module.nomad_clients.google_compute_instance_template.nomad_public[0] has changed
  ~ resource "google_compute_instance_template" "nomad_public" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/nomad-client20220223200856143800000002"
        name                    = "nomad-client20220223200856143800000002"
        tags                    = [
            "nomad-client",
        ]
        # (8 unchanged attributes hidden)

      ~ disk {
          + mlabels            = {}
          + mresource_policies = []
            # (9 unchanged attributes hidden)
        }



        # (3 unchanged blocks hidden)
    }

  # module.nomad_clients.google_compute_region_instance_group_manager.nomad has changed
  ~ resource "google_compute_region_instance_group_manager" "nomad" {
        id                               = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-client-ig"
        name                             = "nomad-client-ig"
      ~ mstatus                           = [
          ~ {
              ~ is_stable      = false -> true
                # (2 unchanged elements hidden)
            },
        ]
      + mtarget_pools                     = []
        # (11 unchanged attributes hidden)


        # (2 unchanged blocks hidden)
    }

  # module.nomad_servers.google_compute_instance_template.nomad_public[0] has changed
  ~ resource "google_compute_instance_template" "nomad_public" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/nomad-server20220223200856183500000003"
        name                    = "nomad-server20220223200856183500000003"
        tags                    = [
            "nomad-server",
        ]
        # (8 unchanged attributes hidden)

      ~ disk {
          + mlabels            = {}
          + mresource_policies = []
            # (9 unchanged attributes hidden)
        }



        # (3 unchanged blocks hidden)
    }

  # module.nomad_servers.google_compute_region_instance_group_manager.nomad has changed
  ~ resource "google_compute_region_instance_group_manager" "nomad" {
        id                               = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-server-ig"
        name                             = "nomad-server-ig"
      ~ mstatus                           = [
          ~ {
              ~ is_stable      = false -> true
                # (2 unchanged elements hidden)
            },
        ]
      + mtarget_pools                     = []
        # (11 unchanged attributes hidden)


        # (2 unchanged blocks hidden)
    }

  # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_http[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_http" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-http-access"
        name                    = "nomad-client-rule-external-http-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_rpc" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-rpc-access"
        name                    = "nomad-client-rule-external-rpc-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.nomad_clients.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_serf" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-client-rule-external-serf-access"
        name                    = "nomad-client-rule-external-serf-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (2 unchanged blocks hidden)
    }

  # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_http[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_http" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-http-access"
        name                    = "nomad-server-rule-external-http-access"
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (11 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_rpc[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_rpc" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-rpc-access"
        name                    = "nomad-server-rule-external-rpc-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (1 unchanged block hidden)
    }

  # module.nomad_servers.module.firewall_rules.google_compute_firewall.allow_inbound_serf[0] has changed
  ~ resource "google_compute_firewall" "allow_inbound_serf" {
        id                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/firewalls/nomad-server-rule-external-serf-access"
        name                    = "nomad-server-rule-external-serf-access"
      + msource_ranges           = []
      + msource_service_accounts = []
      + mtarget_service_accounts = []
        # (10 unchanged attributes hidden)

        # (2 unchanged blocks hidden)
    }


Unless you have made equivalent changes to your configuration, or ignored the
relevant attributes using ignore_changes, the following plan may include
actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  ~ update in-place
+/- create replacement and then destroy
 <= read (data resources)

Terraform will perform the following actions:

  # module.consul_cluster.data.template_file.compute_instance_template_self_link will be read during apply
  # (config refers to values not yet known)
 <= data "template_file" "compute_instance_template_self_link"  {
      ~ mid       = "cf1be695ebc88ab41725f736e0fbe7d355006665b5573a6519fd72ea45c4f4f3" -> (known after apply)
      ~ mrendered = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001" -> (known after apply)
      ~ mtemplate = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001" -> (known after apply)
    }

  # module.consul_cluster.google_compute_instance_template.consul_server_public[0] must be replaced
+/- resource "google_compute_instance_template" "consul_server_public" {
      ~ mid                      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001" -> (known after apply)
      ~ mmetadata_fingerprint    = "7jnIvAB1TyU=" -> (known after apply)
      ~ mname                    = "consul-server20220223200855958800000001" -> (known after apply)
      + mregion                  = (known after apply)
      ~ mself_link               = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001" -> (known after apply)
        tags                    = [
            "consul-server",
        ]
      + mtags_fingerprint        = (known after apply)
        # (6 unchanged attributes hidden)

      + confidential_instance_config {
          + menable_confidential_compute = (known after apply)
        }

      ~ disk {
          ~ mdevice_name       = "persistent-disk-0" -> (known after apply)
          ~ minterface         = "SCSI" -> (known after apply)
          - mlabels            = {} -> null
          ~ mmode              = "READ_WRITE" -> (known after apply)
          - mresource_policies = [] -> null
          ~ msource_image      = "projects/hc-c858ec7b69a3402a8f35fd287c2/global/images/nomad-consul-ubuntu18-2022-02-23-015110" -> "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/images/nomad-consul-ubuntu18-2022-02-23-015110"
          ~ mtype              = "PERSISTENT" -> (known after apply)
            # (4 unchanged attributes hidden)
        }

      ~ network_interface {
          + mipv6_access_type   = (known after apply)
          ~ mname               = "nic0" -> (known after apply)
          ~ mnetwork            = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/networks/default" -> "default"
          - mqueue_count        = 0 -> null
          + mstack_type         = (known after apply)
          + msubnetwork         = (known after apply)
          + msubnetwork_project = "hc-c858ec7b69a3402a8f35fd287c2" # forces replacement

          ~ access_config {
              + mnat_ip                 = (known after apply)
              ~ mnetwork_tier           = "PREMIUM" -> (known after apply)
              + mpublic_ptr_domain_name = (known after apply)
            }
        }

      ~ scheduling {
          - mmin_node_cpus       = 0 -> null
            # (3 unchanged attributes hidden)
        }

      ~ service_account {
          ~ memail  = "default" -> (known after apply)
            # (1 unchanged attribute hidden)
        }
    }

  # module.consul_cluster.google_compute_region_instance_group_manager.consul_server will be updated in-place
  ~ resource "google_compute_region_instance_group_manager" "consul_server" {
        id                               = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig"
        name                             = "consul-server-ig"
        # (13 unchanged attributes hidden)


      ~ version {
          ~ minstance_template = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001" -> (known after apply)
        }
        # (1 unchanged block hidden)
    }

mPlan: 1 to add, 1 to change, 1 to destroy.

Changes to Outputs:
  + mgcp_zone = "us-west1-a"
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Creating...
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Still creating... [10s elapsed]
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Creation complete after 12s [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223222354085900000001]
mmodule.consul_cluster.data.template_file.compute_instance_template_self_link: Reading... [id=cf1be695ebc88ab41725f736e0fbe7d355006665b5573a6519fd72ea45c4f4f3]
mmodule.consul_cluster.data.template_file.compute_instance_template_self_link: Read complete after 0s [id=bd518444f2d254e873c672105258b2194c0b2542df0e66380c83020ac8589e06]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Modifying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Still modifying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2...instanceGroupManagers/consul-server-ig, 10s elapsed]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Still modifying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2...instanceGroupManagers/consul-server-ig, 20s elapsed]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Still modifying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2...instanceGroupManagers/consul-server-ig, 30s elapsed]
mmodule.consul_cluster.google_compute_region_instance_group_manager.consul_server: Modifications complete after 32s [id=projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig]
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0] (deposed object 343244b9): Destroying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2/global/instanceTemplates/consul-server20220223200855958800000001]
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Still destroying... [id=projects/hc-c858ec7b69a3402a8f35fd287c2...onsul-server20220223200855958800000001, 10s elapsed]
mmodule.consul_cluster.google_compute_instance_template.consul_server_public[0]: Destruction complete after 11s
m
Apply complete! Resources: 1 added, 1 changed, 1 destroyed.
m
Outputs:

consul_server_cluster_tag_name = "consul-server"
consul_server_instance_group_name = "consul-server-ig"
consul_server_instance_group_url = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/consul-server-ig"
gcp_project = "hc-c858ec7b69a3402a8f35fd287c2"
gcp_region = "us-west1"
gcp_zone = "us-west1-a"
nomad_client_cluster_size = 2
nomad_client_cluster_tag_name = "nomad-client"
nomad_client_instance_group_id = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-client-ig"
nomad_client_instance_group_name = "nomad-client-ig"
nomad_client_instance_group_url = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-client-ig"
nomad_server_cluster_size = 3
nomad_server_cluster_tag_name = "nomad-server"
nomad_server_instance_group_id = "projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-server-ig"
nomad_server_instance_group_name = "nomad-server-ig"
nomad_server_instance_group_url = "https://www.googleapis.com/compute/v1/projects/hc-c858ec7b69a3402a8f35fd287c2/regions/us-west1/instanceGroupManagers/nomad-server-ig"
