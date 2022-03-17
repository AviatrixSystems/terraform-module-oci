variable "marketplace_source_images" {
  type = map(object({
    ocid = string
    is_pricing_associated = bool
    compatible_shapes = set(string)
  }))
  default = {
    main_mktpl_image = {
      ocid = "ocid1.image.oc1..aaaaaaaams7arhiyikfhpvo2kj35ky76csllxdnzijqw6ves4a5saaj63mva"
      is_pricing_associated = true
      compatible_shapes = []
    }
  }
}