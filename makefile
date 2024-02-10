
.PHONY: deploy-vm check-credentials ansible-deploy-vm


# Define variables
VMWARE_CREDS_FILE := vmware_credentials.yml

# Define targets
deploy-vm: check-credentials ansible-deploy-vm

# Check if VMware credentials file exists
check-credentials:
    test -f $(VMWARE_CREDS_FILE) || (echo "Error: VMware credentials file not found!" && exit 1)

# Run Ansible playbook to deploy VM
ansible-deploy-vm:
    ansible-playbook -i inventory.ini deploy_vm.yml
