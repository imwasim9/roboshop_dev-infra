variable "project_name"{
    default = "roboshop"
}

variable "environment"{
    default = "dev"
}

variable "sg_names"{
    default = [
        # databases
        "mongodb", "redis", "mysql", "rabbitmq",
        # backend
        "catalogue", "user", "shipping", "cart", "payment",
        # frontend
        "frontend",
        # bastion
        "bastion"

    ]
}
