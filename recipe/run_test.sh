#!/usr/bin/env bash

# Fetch the Python version.
PYTHON_VER=`python -c "import sys; print('{}.{}'.format(sys.version_info.major,sys.version_info.minor))"`

if [[ "${PYTHON_VER}" != "3.8" ]]; then
    ipcluster start --daemonize=True;
    # Give some time for the cluster to start up.
    sleep 20;
fi

# Run the test suite
python -c "import pygmo; pygmo.test.run_test_suite(); pygmo.mp_island.shutdown_pool(); pygmo.mp_bfe.shutdown_pool()"
