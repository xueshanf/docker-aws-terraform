FROM xueshanf/awscli
MAINTAINER Xueshan Feng <sfeng@stanford.edu>

# See https://github.com/xueshanf/docker-aws-ses/blob/master/README.md

ENV TERRAFORM_VERSION 0.6.9

# Add git so we can commit status back to git repo.
RUN apk --update add git  && \
    curl -o /terraform.zip -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /terraform.zip -d /usr/bin && \
    rm /terraform.zip

VOLUME ["/terraform-root"]
WORKDIR /terraform-root
# Create a test file
ADD hello_world.tf /var/tmp/hello_world.tf

# Add a script: can be overriden
ADD terraform-wrapper.sh /terraform-wrapper.sh
RUN chmod 755 /terraform-wrapper.sh
ENTRYPOINT ["/terraform-wrapper.sh"]
CMD ["--help"]
