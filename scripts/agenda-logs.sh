#!/bin/bash

cd ~/projects/agenda-fleet/agenda-fleet-admin/
git log --since=2024-01-01 >/tmp/agenda-fleet-admin.log
cd ../agenda-fleet-mobile-3
git log --since=2024-01-01 >/tmp/agenda-fleet-mobile3.log
cd ../agenda-fleet-client-portal2/
git log --since=2024-01-01 >/tmp/agenda-fleet-client-portal2.log
