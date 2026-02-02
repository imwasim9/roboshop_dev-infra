resource "aws_ssm_parameter" "sg_id"{
    count = length(var.sg_names)
    name = "/${var.project_name}/${var.environment}/${var.sg_names[count.index]}_sg_id"
    type = "String" # type value should be in quotes here
    value = module.sg[count.index].sg_id
}