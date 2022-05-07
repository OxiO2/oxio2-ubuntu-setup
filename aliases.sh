#!/bin/bash


alias cmdbatt='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'

