#!/usr/bin/env python3
import os
import shutil
file_map = {
    'bashmarks.sh': '.bashmarks.sh',
    'bashrc': '.bashrc',
    'gitconfig': '.gitconfig',
    'pip.conf': '.pip/pip.conf',
    'tmux.conf': '.tmux.conf',
    'vimrc': '.vimrc',
    }

deb_install_list = [
    'curl',
    'tmux',
    'silversearcher-ag',
    'software-properties-common'
]


class DebianConfig():
    def __init__(self):
        self.home_dir = os.environ['HOME']
        self.cur_dir = os.getcwd()
        self.config_dir = os.path.join(self.home_dir, self.cur_dir, 'configs')
        self.sample_dir = os.path.join(self.home_dir, self.cur_dir, 'samples')
        self.backup_dir = os.path.join(self.home_dir, self.cur_dir, 'backups')


    def file_softlink(self):
        '''
        系统中本来存在的文件称为origin_file,
        本git仓库中的配置文件称为config_file,
        软连接文件称为link_file
        '''
        for config_file, link_file in file_map.items():
            origin_file = os.path.join(self.home_dir, link_file)
            origin_file_dir = os.path.dirname(origin_file)
            config_file = os.path.join(self.config_dir, config_file)

            '''
            判断file_map中配置的文件夹是否存在, 如果不存在, 则创建一个
            '''
            if not os.path.isdir(origin_file_dir):
                os.makedirs(origin_file_dir)
                print("Create directory %s" %origin_file_dir)

            if not os.path.isfile(origin_file):
                os.symlink(config_file, origin_file)

    def vim_install(self):
        vimplug_dl = 'curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

        os.system(vimplug_dl)

    def deb_install(self):
        pass

    '''
    检查系统中是否已经存在某些配置文件, 如果存在,
    则把这个配置文件移动到backups文件夹内
    '''
    def backup(self):
        for _, link_file in file_map.items():
            origin_file = os.path.join(self.home_dir, link_file)
            if os.path.isfile(origin_file):
                shutil.move(origin_file, self.backup_dir)
                print("File %s has been move to %s" %(origin_file, self.backup_dir))
                


if __name__ == '__main__':
    config = DebianConfig()
    config.backup()
    config.file_softlink()
