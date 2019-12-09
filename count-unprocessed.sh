#! /bin/sh

ls /content/transfer | egrep -v 'camelLock' | wc -l
