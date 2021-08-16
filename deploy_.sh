#!/usr/bin/env sh



###########################################################################################################################################################################################################################################################################################################################################################################################



# str or $(curl https://domain tld/path/to/file )
# get *** " API_TOKEN " *** FROM https://dash.cloudflare.com/profile/api-tokens

CF_API_TOKEN=''

# https://domain tld/path/to/file

INDEX_JS_LINK=''

# https://domain tld/path/to/file

PACKAGE_JS_LINK=''

# https://domain tld/path/to/file

TOML_LINK=''

# https://domain tld/path/to/file
# build(for testing perposes) or publish

TRIGGER_CMD='publish'


SHELL_MSG_FIRST='   ⟩⟩⟩ CF_Wrangler Deployer Exicution Started … '
SHELL_MSG_WARN='  ⟩⟩⟩ Attention   :::   This Is Just A Deployer If CF_WORKER Isnt Working Properly Than Check Ur Own Code Before Argument'
SHELL_MSG1='  ⟩⟩⟩ Installing Required Dependsys …'
SHELL_MSG2='   ⟩⟩⟩ Cloning Wrangler Repo From GitHub … '
SHELL_MSG3='   ⟩⟩⟩ Fetched Index.Js ✓ '
SHELL_MSG4='   ⟩⟩⟩ Fetched Package.Json ✓'
SHELL_MSG5='   ⟩⟩⟩ Fetched Wrangler.Toml ✓ '
SHELL_MSG_LAST='   ⟩⟩⟩ Exicution Complete ,  U Can *** Delete The App , Now *** … '



ECHO_1() {
  
  echo ; \
  echo ; \
  echo ; \
  echo $@ ; \
  echo ; \
  echo ; \
  echo
  
}



ECHO_2() {
  
  echo $@ ; \
  echo ; \
  echo ; \
  echo
  
}



refresh() {
  
  apk -qq update ; \
  apk -qq upgrade
  
}

func_1() {
  
  apk -qq add \
    curl \
    git \
    npm \
    tzdata \
    wget
} &> /dev/null
  
func_2() {
  
  cd && \
  git clone \
    https://github.com/cloudflare/wrangler/ && \
  cd ~/wrangler/npm/ && \
    npm install && \
      cd && \
  rm -rf ~/wrangler
  
} &> /dev/null

func_3() {
  
  mkdir ~/.wrangler/config/
  echo "api_token = '${CF_API_TOKEN}'" > ~/.wrangler/config/default.toml && \
  ~/.wrangler/bin/wrangler whoami
  
}


func_4() {
  
  cd && \
    curl ${INDEX_JS_LINK} > ./index && \
    curl ${PACKAGE_JS_LINK} > ./package.json && \
    curl ${TOML_LINK} > ./wrangler.toml && \
    ls -a ~/
  
} 



func_5() {
  
  cd && \
    ./.wrangler/bin/wrangler ${TRIGGER_CMD}
  
}



ECHO_1 $SHELL_MSG_FIRST && \
  sleep 3 && \
ECHO_2 $SHELL_MSG_WARN && \
  sleep 9 && \
refresh && \
  sleep 3 && \
ECHO_2 $SHELL_MSG1 && \
  func_1 && \
    refresh > /dev/null && \
    sleep 3 && \
ECHO_2 $SHELL_MSG2 && \
  func_2 > /dev/null && \
    refresh && \
    sleep 3 && \
  func_3 && \
  func_5 && \
ECHO_1 $SHELL_MSG_LAST





###########################################################################################################################################################################################################################################################################################################################################################################################
