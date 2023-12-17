    Ensure that your Git repository is configured with the appropriate remotes (e.g., origin).
    The script assumes that you have the necessary permissions to push branches and create pull requests in your Git repository.
    Adjust paths and configurations based on your actual setup.

This script creates a new branch, pushes it to the remote repository, and creates a pull request. After merging the pull request, you can manually trigger Terraform apply. Automating Terraform apply as part of the script is possible but requires careful consideration due to the potential impact on the infrastructure. It's recommended to use a CI/CD system for more advanced scenarios.



./continuous_delivery.sh v1.1.0

