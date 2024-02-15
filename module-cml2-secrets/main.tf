#
# This file is part of Cisco Modeling Labs
# Copyright (c) 2019-2023, Cisco Systems, Inc.
# All rights reserved.
#

locals {
  cfg = yamldecode(var.cfg)
}

data "conjur_secret" "conjur_secret" {
  for_each = toset(local.cfg.secrets)
  name     = each.value
}
