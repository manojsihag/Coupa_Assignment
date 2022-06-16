# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'apache'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'apache::default'

# Specify a custom source for a single cookbook:
cookbook 'apache', '~> 0.1.0', git: 'git@https://github.com/manojsihag/Coupa_Assignment.git', branch: 'main'