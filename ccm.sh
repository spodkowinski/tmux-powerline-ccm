# Outputs CCM cluster and status

TMUX_POWERLINE_SEG_CCM_EMOJI_UP_DEFAULT="✓"
TMUX_POWERLINE_SEG_CCM_EMOJI_DOWN_DEFAULT="•"

run_segment() {
   which ccm > /dev/null || return 0
   local status=`ccm status`
   re="Cluster: '([^']+)'"
   if [[ $status =~ $re ]]; then
      local cluster=${BASH_REMATCH[1]};
   fi

   re="node[0-9]+: UP"
   if [[ $status =~ $re ]]; then
      local emoji=$TMUX_POWERLINE_SEG_CCM_EMOJI_UP_DEFAULT
   else
      local emoji=$TMUX_POWERLINE_SEG_CCM_EMOJI_DOWN_DEFAULT
   fi

   if [[ -n $cluster ]]; then
      echo "$emoji $cluster"
   fi
   return 0
}
