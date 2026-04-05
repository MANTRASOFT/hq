#!/bin/bash
# Open VS Code projects on their dedicated Cinnamon workspaces
# Usage: workspaces

declare -A WORKSPACE_MAP
WORKSPACE_MAP[2]="/home/pascal/projects/agenda-fleet/agenda-fleet-mobile-3"
WORKSPACE_MAP[3]="/home/pascal/projects/agenda-fleet/agenda-fleet-admin"
WORKSPACE_MAP[4]="/home/pascal/projects/agenda-fleet/agenda-fleet-backend-2"
WORKSPACE_MAP[5]="/home/pascal/projects/agenda-fleet/agenda-fleet-tower-uws"
WORKSPACE_MAP[6]="/home/pascal/projects/mantrasoft"
WORKSPACE_MAP[7]="/home/pascal/projects/giga-fleet"

for ws in "${!WORKSPACE_MAP[@]}"; do
  project="${WORKSPACE_MAP[$ws]}"
  name=$(basename "$project")

  # Launch VS Code with the project
  code "$project" &

  # Wait for the window to appear
  for i in $(seq 1 30); do
    wid=$(wmctrl -l | grep "$name" | head -1 | awk '{print $1}')
    if [ -n "$wid" ]; then
      break
    fi
    sleep 0.5
  done

  if [ -n "$wid" ]; then
    # wmctrl workspaces are 0-indexed
    target=$((ws - 1))
    wmctrl -i -r "$wid" -t "$target"
    echo "Moved $name to workspace $ws"
  else
    echo "Warning: could not find window for $name"
  fi
done
