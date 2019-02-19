echo "Step 1: Start"
if [ -f ~/.bashrc ]
then
	. ~/.bashrc
fi

####################
### System
echo "Step 2: Set System Constants"
ROOT=""
WINDOWS_ROOT="/mnt/c"

echo "Step 3: Check Links"
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

echo "Step 4: Set Constants"
####################
### Applications
VIM_HOME="${WINDOWS_ROOT}/${PFX86}/Vim/vim81"
PYTHON_DASH="${HOME}/work/Lacuna/install/bin/x64/python"
PYTHON_HOME="${HOME}/local/bin/python37"
PYTHON_EXE="/usr/bin/python3"
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

echo "Step 5: Set Environment Variables"
echo "Step 5a: Set PATH"
####################
### PATH
PATH_ORIG="${PATH}"
PATH="."
if [ ! -f ${PYTHON_EXE} ]
then
	PATH="${PATH}:/bin:/usr/bin:${HOME}/local/sbin/functions"
	. fAddPath  PATH "${HOME}/local/sbin"
	. fAddPath  PATH "${HOME}/local/bin"
	. fAddPathX PATH "${ROOT}/bin"
	. fAddPath  PATH "${ROOT}/usr/bin"
	. fAddPath  PATH "${ROOT}/usr/sbin"
	. fAddPath  PATH "${VIM_HOME}"
	. fAddPath  PATH "${PYTHON_DASH}"
	. fAddPath  PATH "${PYTHON_DASH}/Scripts"
	. fAddPath  PATH "${WINDOWS_ROOT}/Windows/System32"
	. fAddPath  PATH "${WINDOWS_ROOT}/Windows/SysWOW64"
	. fAddPath  PATH "${WINDOWS_ROOT}/${PF}/Git"
	. fAddPath  PATH "${WINDOWS_ROOT}/${PF}/Git/bin"
	. fAddPath  PATH "${WINDOWS_ROOT}/${PF}/Git/cmd"
	. fAddPath  PATH "${WINDOWS_ROOT}/${PF}/7-Zip"
	. fAddPath  PATH "${WINDOWS_ROOT}/${PFX86}/WinMerge"
else
	APATH="${HOME}/local/sbin"
	APATH="${APATH}:${HOME}/local/bin"
	APATH="${APATH}:${ROOT}/bin"
	APATH="${APATH}:${ROOT}/sbin"
	APATH="${APATH}:${ROOT}/usr/bin"
	APATH="${APATH}:${ROOT}/usr/sbin"
	APATH="${APATH}:${VIM_HOME}"
	APATH="${APATH}:${PYTHON_DASH}"
	APATH="${APATH}:${PYTHON_DASH}/Scripts"
	APATH="${APATH}:${WINDOWS_ROOT}/${PF}/Git"
	APATH="${APATH}:${WINDOWS_ROOT}/${PF}/Git/bin"
	APATH="${APATH}:${WINDOWS_ROOT}/${PF}/Git/cmd"
	APATH="${APATH}:${WINDOWS_ROOT}/${PF}/7-Zip"
	APATH="${APATH}:${WINDOWS_ROOT}/${PFX86}/WinMerge"
	APATH="${APATH}:${WINDOWS_ROOT}/Windows/System32"
	APATH="${APATH}:${WINDOWS_ROOT}/Windows/SysWOW64"
	APATH="${APATH}:${WINDOWS_ROOT}/JOE"
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
if [ ! -f ${PYTHON_EXE} ]
then
	. fAddPath CDPATH "${HOME}"
	. fAddPath CDPATH "${HOME}/local"
	. fAddPath CDPATH "${HOME}/work"
	. fAddPath CDPATH "${HOME}/work/Lacuna"
	. fAddPath CDPATH "${WINDOWS_ROOT}"
	. fAddPath CDPATH "${WINDOWS_ROOT}/Share/Lacuna"
else
	APATH="${HOME}"
	APATH="${APATH}:${HOME}/local"
	APATH="${APATH}:${HOME}/work"
	APATH="${APATH}:${HOME}/work/Lacuna"
	APATH="${APATH}:${WINDOWS_ROOT}/Share/Lacuna"

	if [ -f ".profile.py" ]
	then
		CDPATH=$(${PYTHON_EXE} .profile.py ${CDPATH} ${APATH})
	else
		CDPATH=$(${PYTHON_EXE} -c "${cmds_py}" ${CDPATH} ${APATH})
	fi
fi
export CDPATH

echo "Step 6: Set Aliases"
####################
### Aliases
alias gvim="gvim.exe"
alias winmerge="WinMergeU.exe"
# This picks up python in DASH
alias python="python.exe"
# There are 3 python installations; ubuntu(V352), python(V37), DASH(V361)
alias python37="${PYTHON_HOME}/python.exe"
alias pip37="${PYTHON_HOME}/Scripts/pip.exe"
alias virtualenv37="${PYTHON_HOME}/Scripts/virtualenv.exe"
alias gitgui="${WINDOWS_ROOT}/${PF}/Git/cmd/git-gui.exe"

echo "Step 7: Settings"
####################
### Settings
PS1="\! > "

VERSION_CONTROL="numbered-existing"
VERSION_CONTROL="simple"
VERSION_CONTROL="numbered"
VERSION_WIDTH=2
export VERSION_CONTROL VERSION_WIDTH

set -o vi
echo "Step 8: End"
/bin/uname -a
