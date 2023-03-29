# This file Contend all the tages
# created by sandeep kumar Patel

locals {
  ######################################################    
  # EC2 Section Block      
  # Main Server Creation Tags
  Resource_EC2_Main_server_tags = {
    Name         = "BMJ-Jenkins-Server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # Staging Server Creation Tags
  Resource_EC2_Staging_server_tags = {
    Name         = "WP-Staging-Server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # Live Server Creation Tags
  Resource_EC2_Live_server_tags = {
    Name         = "WP-Live-Server",
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  ######################################################
  # VPC Block
  # Main VPC Block Tags
  Resource_VPC = {
    Name         = "MyVPC"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # VPC Subnet Block Tags
  Resource_VPC_Subnet = {
    Name         = "Subnet-1"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # VPC InterNetGetway Block Tags
  Resource_VPC_InternetGateway = {
    Name         = "BMJ-IG"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # VPC Route Table Block Tags
  Resource_VPC_Route_table = {
    Name         = "BMJ-RT-1"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  ######################################################
  # SG block 
  # EC2 Main Jenkins Sever Block tags
  Resource_SG_Main_Server = {
    Name         = "All-Port-Allow"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # EC2 Main Staging Sever Block tags
  Resource_SG_Staging_Server = {
    Name         = "WP-Staging-server"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }

  # EC2 Main Live Sever Block tags
  Resource_SG_Live_Server = {
    Name         = "WP-Live-Server"
    Env          = "Dev",
    Owner_Name   = "Sandeep",
    category     = "Local_Dev",
    project_name = "BMJ_WP_Testing"
  }
  #####################################################################
}
