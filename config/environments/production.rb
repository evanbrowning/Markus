# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true # set this to false, if you want automatic reload of changed code

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new
#
config.log_level = :info	# set log-level (:debug, :info, :warn, :error, :fatal)

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = true # set to false to turn off traces
config.action_view.debug_rjs			     = true
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store # place where to put cached files is configured in config/environment.rb
config.action_controller.allow_forgery_protection    = true

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
config.action_mailer.raise_delivery_errors = false

###################################################################
# MarkUs SPECIFIC CONFIGURATION
#   - use "/" as path separator no matter what OS server is running
###################################################################

###################################################################
# Set the course name here
COURSE_NAME         = "CSC108 Fall 2009: Introduction to Computer Programming"

###################################################################
# MarkUs relies on external user authentication: An external script
# (ideally a small C program) is called with username and password
# piped to stdin of that program (first line is username, second line
# is password).
#
# If and only if it exits with a return code of 0, the username/password
# combination is considered valid and the user is authenticated. Moreover,
# the user is authorized, if it exists as a user in MarkUs.
#
# That is why MarkUs does not allow usernames/passwords which contain
# \n or \0. These are the only restrictions.
VALIDATE_FILE = "#{RAILS_ROOT}/config/dummy_validate.sh"

###################################################################
# Authentication Settings
###################################################################
# Set this to true/false if you want to use an external authentication scheme
# that sets the REMOTE_USER variable.

REMOTE_USER_AUTH = false

###################################################################
# This is where the logout button will redirect to when clicked.
# Set this to one of the three following options:
#
# "DEFAULT" - MarkUs will use its default logout routine.
# A logout link will be provided.
#
# The DEFAULT option should not be used if REMOTE_USER_AUTH is set to true,
# as it will not result in a successful logout.
#
# -----------------------------------------------------------------------------
#
# "http://address.of.choice" - Logout will redirect to the specified URI.
#
# If REMOTE_USER_AUTH is set to true, it would be possible
# to specify a custom address which would log the user out of the authentication
# scheme.
# Choosing this option with REMOTE_USER_AUTH is set to false will still properly
# log the user out of MarkUs.
#
# -----------------------------------------------------------------------------
#
# "NONE" - Logout link will be hidden.
#
# It only recommended that you use this if REMOTE_USER_AUTH is set to true
# and do not have a custom logout page.
#
# If you are using HTTP's basic authentication, you probably want to use this
# option.

LOGOUT_REDIRECT = "DEFAULT"

###################################################################
# File storage (Repository) settings
###################################################################
# Options for Repository_type are 'svn' and 'memory' for now
# 'memory' is by design not persistent and only used for testing MarkUs
REPOSITORY_TYPE = "svn" # use Subversion as storage backend

###################################################################
# Directory where Repositories will be created. Make sure MarkUs is allowed
# to write to this directory
REPOSITORY_STORAGE = "#{RAILS_ROOT}/data/prod/repos"

###################################################################
# Directory where converted PDF files will be stored as JPEGs. Make sure MarkUs
# is allowed to write to this directory
PDF_STORAGE = "#{RAILS_ROOT}/data/prod/pdfs"

###################################################################
# Directory where the Automated Testing Repositories will be created.
# Make sure MarkUs is allowed to write to this directory
TEST_FRAMEWORK_REPOSITORY = "#{RAILS_ROOT}/data/prod/automated_tests"

###################################################################
# Set this to true or false if you want to be able to display and annotate
# PDF documents within the browser.
PDF_SUPPORT = true

###################################################################
# In order for markus to display pdfs, it converts them to jpg format via
# ImageMagick first. The conversion process is very expensive and can quickly
# eat up all available RAM and swap memory available to the server causing it
# to crash. The solution to this is to set a limit on how much RAM ImageMagick
# is allowed to use, forcing it to use the hard-disk for all the needs exceeding
# the allowance.
#
# Using hard-disk memory for conversion is significantly slower than using RAM.
# Increasing the memory allowance will help speed up conversion speeds.
#
# Caution: setting the allowance too high will result in ImageMagick using all
# the server RAM and will crash it. Be sure that you can afford the memory you
# allow.
#
# The maximum amount of megabytes that the ImageMagick pdf conversion process
# may use. This setting is NOT a limit on MarkUs's total memory use. It only
# limits the ImageMagick conversion process.
#
# 100 mbs should be enough to quickly convert most submissions around 10 pages
# long.
#
# This setting doesn't matter unless PDF_SUPPORT is set to true
PDF_CONV_MEMORY_ALLOWANCE = 100

###################################################################
# Change this to 'REPOSITORY_EXTERNAL_SUBMITS_ONLY = true' if you
# are using Subversion as a storage backend and the instructor wants his/her
# students to submit to the repositories by command-line only. Set this
# to true if you plan to let students submit via the standard subversion
# client.
REPOSITORY_EXTERNAL_SUBMITS_ONLY = false

###################################################################
# This config setting only makes sense, if you are using
# 'REPOSITORY_EXTERNAL_SUBMITS_ONLY = true'. If you have Apache httpd
# configured so that the repositories created by MarkUs will be available to
# the outside world, this is the URL which internally "points" to the
# REPOSITORY_STORAGE directory configured earlier. Hence, Subversion
# repositories will be available to students for example via URL
# http://www.example.com/markus/svn/Repository_Name. Make sure the path
# after the hostname matches your <Location> directive in your Apache
# httpd configuration
REPOSITORY_EXTERNAL_BASE_URL = "http://www.example.com/markus/svn"

###################################################################
# This setting is important for two scenarios:
# First, if MarkUs should use Subversion repositories created by a
# third party, point it to the place where it will find the Subversion
# authz file. In that case, MarkUs would need at least read access to
# that file.
# Second, if MarkUs is configured with REPOSITORY_EXTERNAL_SUBMITS_ONLY
# set to 'true', you can configure as to where MarkUs should write the
# Subversion authz file.
REPOSITORY_PERMISSION_FILE = REPOSITORY_STORAGE + "/svn_authz"

###################################################################
# This setting configures if MarkUs is reading Subversion
# repositories' permissions only OR is admin of the Subversion
# repositories. In the latter case, it will write to
# REPOSITORY_SVN_AUTHZ_FILE, otherwise it doesn't. Change this to
# 'false' if repositories are created by a third party.
IS_REPOSITORY_ADMIN = true

###################################################################
# Set this to the desired default language MarkUs should load if
# nothing else tells it otherwise. At the moment valid values are
# 'en', 'fr'. Please make sure that proper locale files are present
# in config/locales.
MARKUS_DEFAULT_LANGUAGE = 'en'

###################################################################
# Session Timeouts
###################################################################
USER_STUDENT_SESSION_TIMEOUT        = 1800 # Timeout for student users
USER_TA_SESSION_TIMEOUT             = 1800 # Timeout for grader users
USER_ADMIN_SESSION_TIMEOUT          = 1800 # Timeout for admin users

###################################################################
# CSV upload order of fields (usually you don't want to change this)
###################################################################
# Order of student CSV uploads
USER_STUDENT_CSV_UPLOAD_ORDER = [:user_name, :last_name, :first_name]
# Order of graders CSV uploads
USER_TA_CSV_UPLOAD_ORDER  = [:user_name, :last_name, :first_name]

###################################################################
# Logging Options
###################################################################
# If set to true then the rotation of the logfiles will be defined
# by MARKUS_LOGGING_ROTATE_INTERVAL instead of the size of the file
MARKUS_LOGGING_ROTATE_BY_INTERVAL = false
# Set the maximum size file that the logfiles will have before rotating
MARKUS_LOGGING_SIZE_THRESHOLD = 1024000000
# Sets the interval which rotations will occur if
# MARKUS_LOGGING_ROTATE_BY_INTERVAL is set to true,
# possible values are: 'daily', 'weekly', 'monthly'
MARKUS_LOGGING_ROTATE_INTERVAL = 'daily'
# Name of the logfile that will carry information, debugging and
# warning messages
MARKUS_LOGGING_LOGFILE = "log/info_#{RAILS_ENV}.log"
# Name of the logfile that will carry error and fatal messages
MARKUS_LOGGING_ERRORLOGFILE = "log/error_#{RAILS_ENV}.log"
# This variable sets the number of old log files that will be kept
MARKUS_LOGGING_OLDFILES = 10

#####################################################################
# Markus Session Store configuration
# see config/initializers/session_store.rb
#####################################################################
SESSION_COOKIE_NAME = '_markus_session'
SESSION_COOKIE_SECRET = '650d281667d8011a3a6ad6dd4b5d4f9ddbce14a7d78b107812dbb40b24e234256ab2c5572c8196cf6cde6b85942688b6bfd337ffa0daee648d04e1674cf1fdf6'
SESSION_COOKIE_EXPIRE_AFTER = 3.weeks
SESSION_COOKIE_HTTP_ONLY = true
SESSION_COOKIE_SECURE = false

###################################################################
# END OF MarkUs SPECIFIC CONFIGURATION
###################################################################
