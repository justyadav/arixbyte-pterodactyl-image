#!/bin/bash
cd /home/container

# Output current Python version for the Pterodactyl console
python --version

# Replace Pterodactyl's {{VARIABLE}} syntax with standard bash ${VARIABLE}
MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))

# Print the startup command to the console
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Execute the startup command
eval ${MODIFIED_STARTUP}
