#!/bin/bash

npx tailwindcss -i theme/css/tailwind.css -o tailwind.css -c tailwind.config.js

gollum --allow-uploads=dir --template-dir=templates --h1-title  --css --adapter rugged --no-edit

