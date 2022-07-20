#  Copyright 2020, 2021 Aviatrix Systems, Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

locals {
  option = format("%s/aviatrix_controller_init.py",
    path.module
  )
  argument = format("'%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s' '%s'",
    var.avx_controller_public_ip, var.avx_controller_private_ip, var.avx_controller_admin_email,
    var.avx_controller_admin_password, var.oci_tenancy_id, var.oci_user_id,
    var.oci_compartment_id, var.oci_api_key_path, var.account_email, var.access_account_name,
    var.aviatrix_customer_id, var.controller_version
  )
}
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "Python3.9 -W ignore ${local.option} ${local.argument}"
  }
}
