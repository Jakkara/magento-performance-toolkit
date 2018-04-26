#!/bin/bash
# Author: Marko Martinović
# http://www.magemeter.com/about

# Prints command traces
set -x

# Path to Apache jMeter executable
JMETER_PATH=""

# Path to benchmark.jmx file:
# * Magento 1.x => /path/to/magento/root/dev/tools/performance_toolkit
# * Magento 2.x => /path/to/magento2/root/setup/performance-toolkit
JMX_PATH="."

# Path to where you want benchmark results saved
REPORT_SAVE_PATH="."

# Adjust as desired and depending on your Magento installation:
HOST="localhost"    # Magento installation base url
PORT="80"			# Port used
BASE_PATH="/"       # Magento base path if installed in subdirector
RAMP_PERIOD="300"   # How long until maximum number of users reached
ORDERS="0"          # Adjust if you want orders created during tests
USERS="100"         # Maximum number of users
LOOPS="1"           # Number of loops each user will go through
VIEW_PRODUCT_ADD_TO_CART_PERCENT="62"
VIEW_CATALOG_PERCENT="30"
GUEST_CHECKOUT_PERCENT="4"
CUSTOMER_CHECKOUT_PERCENT="4"
CUSTOMER_PASSWORD="123123q"
URL_SUFFIX=".html"
ADMIN_PATH="admin"          # Path for Magento admin
ADMIN_USER="admin"          # Magento admin user
ADMIN_PASSWORD="123123q"    # Magento admin password
WEBSITE_ID="1"
THINK_TIME_DEVIATION="1000"
THINK_TIME_DELAY_OFFSET="2000"

#### DO NOT EDIT PAST THIS POINT ####

${JMETER_PATH}/jmeter -n -t ${JMX_PATH}/benchmark.jmx \
    -Jhost=${HOST} \
    -Jport=${PORT} \
    -Jbase_path=${BASE_PATH} \
    -Jreport_save_path=${REPORT_SAVE_PATH} \
    -Jramp_period=${RAMP_PERIOD} \
    -Jorders=${ORDERS} \
    -Jusers=${USERS} \
    -Jview_product_add_to_cart_percent=${VIEW_PRODUCT_ADD_TO_CART_PERCENT} \
    -Jview_catalog_percent=${VIEW_CATALOG_PERCENT} \
    -Jguest_checkout_percent=${GUEST_CHECKOUT_PERCENT} \
    -Jcustomer_checkout_percent=${CUSTOMER_CHECKOUT_PERCENT} \
    -Jloops=${LOOPS} \
    -Jcustomer_password=${CUSTOMER_PASSWORD} \
    -Jurl_suffix=${URL_SUFFIX} \
    -Jadmin_path=${ADMIN_PATH} \
    -Jadmin-user=${ADMIN_USER} \
    -Jadmin-password=${ADMIN_PASSWORD} \
    -Jwebsite_id=${WEBSITE_ID} \
    -Jthink_time_deviation=${THINK_TIME_DEVIATION} \
    -Jthink_time_delay_offset=${THINK_TIME_DELAY_OFFSET} \
    -l ${REPORT_SAVE_PATH}/results.csv \
    -Djmeter.save.saveservice.output_format=csv \
    -Djmeter.save.saveservice.print_field_names=true
