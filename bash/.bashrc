# NOTE: Assumes config is symlinked to ~/config
# Include all files under /parts that don't start with or contain '.'
for f in ~/config/bash/parts/*; do
  if [[ ${f} =~ parts/[^\.]+$ ]]; then
    source $f
  fi
done
