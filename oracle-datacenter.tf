// Copyright (c) 2017, 2020, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Mozilla Public License v2.0

variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "region" {
}

variable "private_key" {
}

variable "fingerprint" {
}

variable "private_key_password" {
}

variable "TFC_CONFIGURATION_VERSION_GIT_BRANCH" {
  // https://www.terraform.io/docs/cloud/run/run-environment.html#environment-variables
}

locals {
  script_dir = "packer-desktop/scripts"
}

provider "oci" {
  region           = var.region
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key      = var.private_key
  private_key_password = var.private_key_password
}

variable "ad_region_mapping" {
  type = map(string)

  default = {
    # The only availability domain in Frankfurt which allows for creating Micro instance
    # This could change over time!!!
    eu-frankfurt-1 = 2
  }
}

# get latest Ubuntu Linux 20.04 Minimal image
# https://docs.cloud.oracle.com/en-us/iaas/images/ubuntu-2004/
data "oci_core_images" "ubuntu-20-04-minimal" {
  compartment_id = oci_identity_compartment.client_workspace.id
  filter {
    name = "display_name"
    values = ["^Canonical-Ubuntu-20.04-Minimal-([\\.0-9-]+)$"]
    regex  = true
  }
  sort_by = "TIMECREATED"
  sort_order = "DESC"
}

output "ubuntu-18-04-minimal-latest-name" {
  value = data.oci_core_images.ubuntu-20-04-minimal.0.display_name
}

resource "oci_identity_compartment" "client_workspace" {
    compartment_id = var.tenancy_ocid
    description = "Named after corresponding Terraform workspace"
    name = "${var.TFC_CONFIGURATION_VERSION_GIT_BRANCH}-branch"
}

data "oci_identity_tenancy" "te" {
  tenancy_id = var.tenancy_ocid
}

locals {
  tenancy_name = data.oci_identity_tenancy.te.name
  home_region_key = data.oci_identity_tenancy.te.home_region_key
}

output "compartment" {
  value = "${local.home_region_key}/${local.tenancy_name}/${oci_identity_compartment.client_workspace.name}"
}

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.ad_region_mapping[var.region]
}


