echo "Step 1 : Start"
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

####################
### System
echo "Step 2 : Set System Constants"
ROOT=""
WINDOWS_ROOT="/mnt/c"

echo "Step 3 : Check Links"
PF=ProgramFiles
PFX86=ProgramFilesX86
if [ -d ${WINDOWS_ROOT} ]
then
	if [ ! -d ${WINDOWS_ROOT}/${PF} ]
	then
		echo -e "\tln -s ${WINDOWS_ROOT}/Program\ Files ${WINDOWS_ROOT}/${PF}"
		ln -s ${WINDOWS_ROOT}/Program\ Files ${WINDOWS_ROOT}/${PF}
	fi
	if [ ! -d ${WINDOWS_ROOT}/${PFX86} ]
	then
		echo -e "\tln -s ${WINDOWS_ROOT}/Program\ Files\ \(x86\) ${WINDOWS_ROOT}/${PFX86}"
		ln -s ${WINDOWS_ROOT}/Program\ Files\ \(x86\) ${WINDOWS_ROOT}/${PFX86}
	fi
fi

echo "Step 4 : Set Constants"
####################
### Applications
VIM_HOME="${WINDOWS_ROOT}/${PFX86}/Vim/vim82"

#VULKAN_SDK="${HOME}/local/bin/VulkanSDK/1.2.162.0"
#VK_SDK_PATH="${VULKAN_SDK}"
#VK_LAYER_PATH="${VK_SDK_PATH}/Bin"
#export VULKAN_SDK VK_SDK_PATH VK_LAYER_PATH
#VK_ICD_FILENAMES=vulkansdk/macOS/share/vulkan/icd.d/MoltenVK_icd.json
#VK_LAYER_PATH=vulkansdk/macOS/share/vulkan/explicit_layer.d

PYTHON_LACUNA="${HOME}/work/Lacuna/install/bin/x64/python"
PYTHON_DASH="${HOME}/work/csgauto/dashlegacy/install/bin/x64/python"
PYTHON_373="${HOME}/local/bin/python373"
PYTHON_380="${HOME}/local/bin/python380"
PYTHON_381="${HOME}/local/bin/python381"
PYTHON_384="${HOME}/local/bin/python384"
PYTHON_390="${HOME}/local/bin/python39"
PYTHON_EXE="/usr/bin/python3"
PYTHON=${PYTHON_DASH}
cmds_py="exec(\"import sys\npath=sys.argv[1].split(':')\npath_add=sys.argv[2].split(':')\nfor pa in path_add:\n\tif not pa in path:\n\t\tpath.append(pa)\nprint((':').join(path))\")"

if [ ! -f ${PYTHON_EXE} ]
then
	echo "Step 4a: NOT Using python"
else
	if [ -f ".profile.py" ]
	then
		echo "Step 4b: Using profile.py"
	else
		echo "Step 4b: Using cmds_py"
	fi
fi

echo "Step 5 : Set Environment Variables"
echo "Step 5a: Set PATH"
####################
### PATH
PATH_ORIG="${PATH}"
PATH="."
APATH=.
FILES="
	${HOME}/local/sbin
	${HOME}/local/bin
	${HOME}/local/bin/doxygen
	${HOME}/local/bin/Graphviz/bin
	${HOME}/local/bin/GetGnuWin32/gnuwin32/bin
	${ROOT}/bin
	${ROOT}/sbin
	${ROOT}/usr/bin
	${ROOT}/usr/sbin
	${VIM_HOME}
	${VK_SDK_PATH}/Bin
	${PYTHON}
	${PYTHON}/Scripts
	${WINDOWS_ROOT}/${PF}/Git
	${WINDOWS_ROOT}/${PF}/Git/bin
	${WINDOWS_ROOT}/${PF}/Git/cmd
	${WINDOWS_ROOT}/${PF}/7-Zip
	${WINDOWS_ROOT}/${PFX86}/WinMerge
	${WINDOWS_ROOT}/Windows/System32
	${WINDOWS_ROOT}/Windows/SysWOW64
"
if [ ! -f ${PYTHON_EXE} ]
then
	PATH="${PATH}:/bin:/usr/bin:${HOME}/local/sbin/functions"
	for f in ${FILES}
	do
		. fAddPath  PATH "${f}"
	done
else
	for f in ${FILES}
	do
		APATH="${APATH}:${f}"
	done

	if [ -f ".profile.py" ]
	then
		PATH=$(${PYTHON_EXE} .profile.py ${PATH} ${APATH})
	else
		PATH=$(${PYTHON_EXE} -c "${cmds_py}" ${PATH} ${APATH})
	fi
fi
export PATH

####################
# INCLUDE
#. fPrePath  INCLUDE "."
#. fAddPath  INCLUDE "${HOME}/local/include"
#export INCLUDE

####################
### LIB
#. fPrePath  LIB "."
#. fAddPath  LIB "${HOME}/local/lib"
#export LIB

echo "Step 5b: Set CDPATH"
####################
### CDPATH
CDPATH="."
APATH="${HOME}"
FILES="
	${HOME}/local
	${HOME}/work
	${HOME}/work/csgauto
	${HOME}/work/csgauto/dash2
	${WINDOWS_ROOT}/Share/Lacuna
"
if [ ! -f ${PYTHON_EXE} ]
then
	for f in ${FILES}
	do
		. fAddPath CDPATH "${f}"
	done
else
	for f in ${FILES}
	do
		APATH="${APATH}:${f}"
	done

	if [ -f ".profile.py" ]
	then
		CDPATH=$(${PYTHON_EXE} .profile.py ${CDPATH} ${APATH})
	else
		CDPATH=$(${PYTHON_EXE} -c "${cmds_py}" ${CDPATH} ${APATH})
	fi
fi
export CDPATH

echo "Step 5c: Set LD_LIBRARY_PATH"
####################
### LD_LIBRARY_PATH
LD_LIBRARY_PATH_ORIG="${LD_LIBRARY_PATH}"
LD_LIBRARY_PATH="."
ALD_LIBRARY_PATH=.
FILES="
	${HOME}/local/lib
	${VK_SDK_PATH}/Lib
"
if [ ! -f ${PYTHON_EXE} ]
then
	LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/bin:/usr/bin:${HOME}/local/sbin/functions"
	for f in ${FILES}
	do
		. fAddPath  LD_LIBRARY_PATH "${f}"
	done
else
	for f in ${FILES}
	do
		ALD_LIBRARY_PATH="${ALD_LIBRARY_PATH}:${f}"
	done

	if [ -f ".profile.py" ]
	then
		LD_LIBRARY_PATH=$(${PYTHON_EXE} .profile.py ${LD_LIBRARY_PATH} ${ALD_LIBRARY_PATH})
	else
		LD_LIBRARY_PATH=$(${PYTHON_EXE} -c "${cmds_py}" ${LD_LIBRARY_PATH} ${ALD_LIBRARY_PATH})
	fi
fi
export LD_LIBRARY_PATH

echo "Step 6 : Set Aliases"
####################
### Aliases
#{ Do not work with current ubuntu
#alias gvim="gvim.exe"
#alias gvim="${VIM_HOME}/gvim.exe"
#alias gvim="/mnt/c/ProgramFilesX86/Vim/vim82/gvim.exe"
#alias git="${WINDOWS_ROOT}/${PF}/Git/bin/git.exe"
#alias gitgui="${WINDOWS_ROOT}/${PF}/Git/cmd/git-gui.exe"
#alias gitk="${WINDOWS_ROOT}/${PF}/Git/cmd/gitk.exe"
#}
alias gvim="${WINDOWS_ROOT}/Program\ Files\ \(x86\)/Vim/vim82/gvim.exe"
alias git="${WINDOWS_ROOT}/Program\ Files/Git/bin/git.exe"
alias gitgui="${WINDOWS_ROOT}/Program\ Files/Git/cmd/git-gui.exe"
alias gitk="${WINDOWS_ROOT}/Program\ Files/Git/cmd/gitk.exe"
alias winmerge="WinMergeU.exe"

# There are several python installations; ubuntu(V352), python(V37), python(V38), DASH(V381)
alias python37="${PYTHON_373}/python.exe"
alias pip37="${PYTHON_373}/Scripts/pip.exe"

alias python38="${PYTHON_380}/python.exe"
alias pip38="${PYTHON_380}/Scripts/pip.exe"
alias python38v="./venv/Scripts/python.exe"
alias pip38v="./venv/Scripts/pip.exe"

alias python381="${PYTHON_381}/python.exe"
alias pip381="${PYTHON_381}/Scripts/pip.exe"

alias python384="${PYTHON_384}/python.exe"
alias pip384="${PYTHON_384}/Scripts/pip.exe"

alias python39="${PYTHON_390}/python.exe"
alias pip39="${PYTHON_390}/Scripts/pip.exe"

alias pythonDash="${PYTHON_DASH}/python.exe"
alias pipDash="${PYTHON_DASH}/Scripts/pip.exe"

alias pythonLacuna="${PYTHON_LACUNA}/python.exe"
alias pipLacuna="${PYTHON_LACUNA}/Scripts/pip.exe"

alias python="${PYTHON}/python.exe"
alias pip="${PYTHON}/Scripts/pip.exe"

alias dot="dot.exe"

echo "Step 7 : Settings"
####################
### Settings
PS1="\! > "

HISTCONTROL=ignoreboth:erasedups
VERSION_CONTROL="numbered-existing"
VERSION_CONTROL="simple"
VERSION_CONTROL="numbered"
VERSION_WIDTH=2
export VERSION_CONTROL VERSION_WIDTH HISTCONTROL

set -o vi
echo "Step 8 : End"
/bin/uname -a
#lsb_release -a

