#!/bin/bash

cd F18
source scripts/set_ah.sh
set F18_DEBUG=1

cd ..
cd F18_v3
source scripts/set_debug_path.sh

harbour --version

echo "Source dir: `pwd`"


