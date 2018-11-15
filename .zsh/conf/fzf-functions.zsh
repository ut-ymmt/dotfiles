# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ^r - select-hisroty
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# fssh - ssh to ec2
function fssh() {
  readonly TARGET_AWS_PROFILE=$1
  readonly TARGET_EC2_TAG_NAME=$2
  targets=$(show-ec2 $TARGET_AWS_PROFILE $TARGET_EC2_TAG_NAME | fzf --multi --exit-0)
  ip_list=()
  for t in $targets;do
    echo $t
    ip_list+=($(echo $t | awk '{print $3}'))
  done

  mulssh $(echo $ip_list)
}
