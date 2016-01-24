#!/bin/bash
if [ "X$1" = "Xtest" ];
then 
  # run helo_world test
  terraform apply /var/tmp
else
  # workdir is /terraform-root
  /usr/bin/terraform "$@"
fi
