import os
import pathlib
import sys


print_it = False

if print_it:
	HOME = '/mnt/c/Users/jcnarlo/jcnarlo'
	ROOT = ''
	WINDOWS_ROOT = '/mnt/c'
	PF = r'Program Files'
	PFX86 = r'Program Files (x86)'
	PF = r'ProgramFiles'
	PFX86 = r'ProgramFilesX86'
	VIM_HOME = f'{WINDOWS_ROOT}/{PFX86}/Vim/vim81'
	PYTHON_DASH = f'{HOME}/work/Lacuna/install/bin/x64/python'

	PATH = '.'
	APATH = f'{HOME}/local/sbin'
	APATH = f'{APATH}:{HOME}/local/bin'
	APATH = f'{APATH}:{ROOT}/bin'
	APATH = f'{APATH}:{ROOT}/sbin'
	APATH = f'{APATH}:{ROOT}/usr/bin'
	APATH = f'{APATH}:{ROOT}/usr/sbin'
	APATH = f'{APATH}:{VIM_HOME}'
	APATH = f'{APATH}:{PYTHON_DASH}'
	APATH = f'{APATH}:{PYTHON_DASH}/Scripts'
	APATH = f'{APATH}:{WINDOWS_ROOT}/{PF}/7-Zip'
	APATH = f'{APATH}:{WINDOWS_ROOT}/{PFX86}/WinMerge'
	APATH = f'{APATH}:{WINDOWS_ROOT}/Windows/System32'
	APATH = f'{APATH}:{WINDOWS_ROOT}/Windows/SysWOW64'
	APATH = f'{APATH}:{WINDOWS_ROOT}/JOE'

	path0 = PATH
	path1 = path0.split(':')
	spath_add = APATH.strip()
	add_to_path = spath_add.split(':')
else:
	path0 = sys.argv[1]
	path1 = path0.split(':')
	spath_add = sys.argv[2].strip()
	add_to_path = spath_add.split(':')
if print_it:
#{
	print(f'argv: {sys.argv}', flush=True)
	print(f'path1={path1}', flush=True)
	print(f'add_to_path={add_to_path}', flush=True)
	print('', flush=True)
#}

for _atp in add_to_path:
#{
	if print_it:
		print(f'_atp={_atp}', flush=True)
	atp = None
	if False:
	#{
		if _atp.startswith('/mnt/c'):
			atp = _atp.replace('/mnt/c', 'C:')
		else:
			atp = _atp
	#}
	else:
	#{
		atp = _atp
	#}
	if print_it:
		print(f'check_dir={atp}', flush=True)

	p = pathlib.Path(atp)
	if print_it:
	#{
		if p.exists():
			print(f'pathlib TRUE {p}')
		else:
			print(f'pathlib FALSE {p}')
	#}

	#if True or os.path.exists(atp):
	if os.path.exists(atp):
	#{
		if print_it:
			print(f'Exist {atp}', flush=True)
		found = False
		for p in path1:
		#{
			if atp == p:
			#{
				if print_it:
					print(f'Skipping {atp}', flush=True)
				found = True
				break
			#}
		#}
		if not found:
		#{
			if False:
				if atp.startswith('C:'):
					atp = atp.replace('C:', '/mnt/c')
				else:
					atp = atp
			if print_it:
				print(f'Adding {atp}', flush=True)
			path1.append(atp)
		#}
	#}
	else:
	#{
		if print_it:
			print(f'NOT Exist {atp}', flush=True)
	#}
	if print_it:
		print('', flush=True)
#}

path0 = ':'.join(path1)
print(path0)
