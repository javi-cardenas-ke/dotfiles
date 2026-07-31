# FPATH="/opt/homebrew/share/zsh-completions:${FPATH}"

# autoload -Uz compinit && compinit

# source "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
# bindkey '^[OA' history-substring-search-up
# bindkey '^[OB' history-substring-search-down

# source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# eval "$(starship init zsh)"

# source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Zsh completions
autoload -Uz compinit
if [ "$(find ~/.zcompdump -mtime +1 2>/dev/null)" ]; then
    compinit -i
else
    compinit -C -i  # -C skips the security scan using the cached dump
fi

# Zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Generated for envman. Do not edit. Go from webi
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH=$PATH:$HOME/.local/opt/go/bin

# Aliases
alias k="kubectl"
alias kgp="kubectl get pods -A -o wide" # get all pods info
alias kgs="kubectl get svc" # get all services info
alias kl="kubectl logs" # get the pod logs
alias ka="kubectl apply -f" # apply a yaml file
alias kp="kubectl port-forward" # port forward a pod

alias mk="minikube"
alias z="zed"

alias javi="cd && cd repos/javi-cardenas/"
alias dotfiles="cd && cd repos/javi-cardenas/dotfiles"
alias boot="cd && cd repos/javi-cardenas/bootdotdev"

alias ke="cd && cd repos/javi-cardenas-ke/"
alias lib="cd && cd repos/javi-cardenas-ke/ke-libraries"
alias actions="cd && cd repos/javi-cardenas-ke/ke-actions"
alias nova="cd && cd repos/javi-cardenas-ke/hei-nova"
alias dotfiles="cd ~/repos/javi-cardenas/dotfiles && zed ."

source <(kubectl completion zsh)
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=x86_64-linux-musl-gcc
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=x86_64-linux-musl-gcc
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


export CLUSTER_RG=rg-nova5-app-dev-cus
export CLUSTER_NAME=aks-nova5-nvak8s-dev-cus

kinvoke() {
        az aks command invoke -g $CLUSTER_RG -n $CLUSTER_NAME --command "kubectl $*"
}

# set -euo pipefail

# kinvoke() {
#   if [[ -z "${CLUSTER_NAMESPACE:-}" ]]; then
#     az aks command invoke \
#       -g "$CLUSTER_RESOURCE_GROUP" \
#       -n "$CLUSTER_NAME" \
#       --command "kubectl $(printf '%q ' "$@")"
#   else
#     az aks command invoke \
#       -g "$CLUSTER_RESOURCE_GROUP" \
#       -n "$CLUSTER_NAME" \
#       --command "kubectl -n "$CLUSTER_NAMESPACE" $(printf '%q ' "$@")"
#   fi
# }


# while [[ $# -gt 0 ]]; do
#   case "$1" in
#     --cluster-resource-group|-g)
#       CLUSTER_RESOURCE_GROUP="$2"
#       shift 2
#       ;;

#     --cluster-name|-c)
#       CLUSTER_NAME="$2"
#       shift 2
#       ;;

#     --namespace|-n)
#       CLUSTER_NAMESPACE="$2"
#       shift 2
#       ;;

#     -h|--help)
#       echo "Usage: $0 [--cluster-resource-group <rg>] [--cluster-name <name>] [--namespace <name>] kubectl-command"
#       echo "Usage: export CLUSTER_RESOURCE_GROUP=<rg> CLUSTER_NAME=<name> CLUSTER_NAMESPACE=<name> && $0 kubectl-command"
#       exit 0
#       ;;

#     *)
#       # echo "Unknown option: $1"
#       # exit 1
#       break
#       ;;
#   esac
# done

# if [[ -z "${CLUSTER_RESOURCE_GROUP:-}" || -z "${CLUSTER_NAME:-}" ]]; then
#   echo "Missing required arguments"
#   echo "Usage: $0 [--cluster-resource-group <rg>] [--cluster-name <name>] [--namespace <name>] kubectl-command"
#   echo "Usage: export CLUSTER_RESOURCE_GROUP=<rg> CLUSTER_NAME=<name> CLUSTER_NAMESPACE=<name> && $0 kubectl-command"
#   exit 1
# fi

# kinvoke "$@"
