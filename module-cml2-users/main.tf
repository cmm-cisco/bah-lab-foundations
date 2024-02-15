#
# This file is part of Cisco Modeling Labs
# Copyright (c) 2019-2023, Cisco Systems, Inc.
# All rights reserved.
#

locals {
  cfg = yamldecode(var.cfg)
}

resource "random_pet" "cml_password" {
  count = local.cfg.pod_count
}

resource "cml2_user" "pod_user" {
  count       = local.cfg.pod_count
  username    = "pod${count.index + 1}"
  password    = resource.random_pet.cml_password[count.index].id
  fullname    = "Pod ${count.index + 1} Student"
  description = "Pod ${count.index + 1} Student"
  email       = "pod${count.index + 1}@example.com"
  is_admin    = false
}
