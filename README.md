# Enterprise Azure Virtual Desktop (AVD) - Azure AD Joined

This project provides a comprehensive Terraform solution for deploying an enterprise-grade Azure Virtual Desktop (AVD) environment with session hosts joined directly to Azure AD, eliminating the need for traditional Active Directory Domain Services.

## Architecture Overview

This solution deploys a scalable and secure AVD environment, including:

*   **Resource Group:** A dedicated resource group to contain all AVD components.
*   **Networking:** A Virtual Network (VNet) with a dedicated subnet for AVD session hosts and an associated Network Security Group (NSG).
*   **AVD Core Components:** Host Pool, Workspace, and Application Group (Desktop or RemoteApp).
*   **Session Hosts (VMs):** Windows 10/11 Enterprise multi-session virtual machines, joined to Azure AD, with the AVD agent installed and registered with the Host Pool.
*   **Monitoring (Temporarily Disabled):** A Log Analytics Workspace for collecting AVD diagnostics and performance data.

## Prerequisites

Before deploying this solution, ensure you have the following:

*   **Azure Subscription:** An active Azure subscription.
*   **Azure CLI:** Installed and configured (`az login`).
*   **Terraform:** Installed ([https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)).
*   **Permissions:** Sufficient permissions in your Azure subscription to create resource groups, virtual networks, virtual machines, and AVD resources.
*   **Azure AD Connect (Optional but Recommended):** If you plan to sync on-premises AD users/groups to Azure AD for AVD access, ensure Azure AD Connect is configured.
*   **Azure AD Join Configuration:** Ensure your Azure AD tenant is configured to allow devices to be Azure AD Joined. Users will need permissions to join devices to Azure AD.

## Deployment Steps

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd avd_enterprise_no_domain
    ```

2.  **Review and Customize Variables:**
    Open the `variables.tf` and `terraform.tfvars` files in the root directory. Customize the values as needed for your deployment (e.g., resource names, locations, VM sizes, image SKUs, admin credentials).

    **Important:** Provide strong, secure passwords for `session_host_admin_password` in `terraform.tfvars`.

3.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

4.  **Review the Plan:**
    ```bash
    terraform plan
    ```

5.  **Apply the Changes:**
    ```bash
    terraform apply
    ```

6.  **Verify Deployment:**
    After the deployment completes, verify the created resources in the Azure portal. You should see the AVD Host Pool, Workspace, Application Group, and the deployed session host VMs registered to the Host Pool.

## Configuration

The `variables.tf` and `terraform.tfvars` files are the primary places to customize your deployment. Key variables include:

*   `resource_group_name`: The name of the Azure Resource Group.
*   `location`: The Azure region for resource deployment.
*   `tags`: Global tags to apply to all resources.
*   `vnet_name`, `vnet_address_space`, `avd_subnet_name`, `avd_subnet_address_prefixes`: Networking configuration.
*   `host_pool_name`, `host_pool_type`, `load_balancer_type`, `personal_desktop_assignment_type`, `host_pool_friendly_name`, `host_pool_description`, `host_pool_max_session_limit`, `host_pool_custom_rdp_properties`: AVD Host Pool configuration.
*   `workspace_name`, `workspace_friendly_name`, `workspace_description`: AVD Workspace configuration.
*   `application_group_name`, `application_group_friendly_name`, `application_group_description`, `application_group_type`: AVD Application Group configuration.
*   `session_host_vm_count`, `session_host_vm_size`, `session_host_image_publisher`, `session_host_image_offer`, `session_host_image_sku`, `session_host_image_version`: Session Host VM configuration.
*   `session_host_admin_username`, `session_host_admin_password`: Local administrator credentials for session hosts.
*   `log_analytics_workspace_name` (Temporarily Commented Out): Log Analytics Workspace for monitoring.

## Module Breakdown

*   **`modules/avd_networking/`**: Deploys the Virtual Network, Subnet, and Network Security Group for the AVD environment.
*   **`modules/avd_core/`**: Deploys the core AVD components: Host Pool, Workspace, and Application Group.
*   **`modules/avd_session_hosts/`**: Deploys the AVD session host Virtual Machines, configures them for Azure AD Join, and registers them with the Host Pool.
*   **`modules/avd_monitoring/`**: (Temporarily Disabled) Deploys a Log Analytics Workspace for AVD diagnostics and monitoring.

## Important Notes

*   **Azure AD Join:** This solution relies on Azure AD Join for session hosts. Ensure your Azure AD tenant is properly configured for this, and that the users accessing AVD have permissions to join devices to Azure AD.
*   **User Assignments:** After deployment, you will need to manually assign users or groups to the AVD Application Group or Desktop Application Group in the Azure portal to grant them access to the AVD environment.
*   **Custom Images:** For production environments, consider using custom AVD images for optimized performance and pre-installed applications.
*   **Scaling:** This solution provides a fixed number of session hosts. For dynamic scaling, consider implementing AVD Autoscale solutions.