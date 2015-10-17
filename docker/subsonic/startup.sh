#!/bin/bash

service subsonic start
tail -F /var/subsonic/subsonic_sh.log
