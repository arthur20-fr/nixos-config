

#TODO add better usage
usage(){
  echo ">> Usage: ./nix.sh <command>"
  echo "Commandes :"
  echo "rebuild | home | help | format"
}

cmd_rebuild_home(){
  echo ">> home-manager switch"
  home-manager switch --flake .
}

cmd_rebuild_flake(){
  echo ">> nixos-rebuild switch --flake ."
  sudo nixos-rebuild switch --flake .

}

format(){
  echo ">> Formating the config"
  echo ">> nix run nixpkgs#nixfmt-tree"
  nix run nixpkgs#nixfmt-tree
}

main(){
  if [ $# -eq 0 ]; then
    echo toto
    usage
    exit 1
  fi

  command="$1"

  case "$command" in

    #TODO add more (GC nix garbage collect, add args to rebuild, home)
    rebuild) cmd_rebuild_flake ;;
    home) cmd_rebuild_home ;;
    format) format ;;
    -h|--help|help) usage ;;

    *)
      echo ">> Not implemented yet :<"
      usage
      exit 1
    ;;

  esac
}


main "$@"
