#!/usr/bin/env bash

# ========================================================================
# 全局版本信息及基础信息定义
# ========================================================================
DB_Info=('MySQL 5.1.73' 'MySQL 5.5.62' 'MySQL 5.6.51' 'MySQL 5.7.44' 'MySQL 8.0.39' 'MySQL 8.4.2' 'MariaDB 5.5.68' 'MariaDB 10.4.34' 'MariaDB 10.5.26' 'MariaDB 10.6.19' 'MariaDB 10.11.9')
PHP_Info=('PHP 5.2.17' 'PHP 5.3.29' 'PHP 5.4.45' 'PHP 5.5.38' 'PHP 5.6.40' 'PHP 7.0.33' 'PHP 7.1.33' 'PHP 7.2.34' 'PHP 7.3.33' 'PHP 7.4.33' 'PHP 8.0.30' 'PHP 8.1.29' 'PHP 8.2.23' 'PHP 8.3.11' 'PHP 8.4.22' 'PHP 8.5.7')
Apache_Info=('Apache 2.2.34' 'Apache 2.4.62')

# ========================================================================
# 核心彩色文本打印函数 (核心注册，防止 command not found)
# ========================================================================
Color_Text() { echo -e " \e[0;$2m$1\e[0m"; }
Echo_Red() { echo $(Color_Text "$1" "31"); }
Echo_Green() { echo $(Color_Text "$1" "32"); }
Echo_Yellow() { echo $(Color_Text "$1" "33"); }
Echo_Blue() { echo $(Color_Text "$1" "34"); }

# ========================================================================
# 数据库选择菜单 (11个版本选项)
# ========================================================================
Database_Selection()
{
    if [ -z ${DBSelect} ]; then
        DBSelect="2"
        Echo_Yellow "You have 11 options for your DataBase install."
        echo "1: Install ${DB_Info[0]}"
        echo "2: Install ${DB_Info[1]} (Default)"
        echo "3: Install ${DB_Info[2]}"
        echo "4: Install ${DB_Info[3]}"
        echo "5: Install ${DB_Info[4]}"
        echo "6: Install ${DB_Info[5]}"
        echo "7: Install ${DB_Info[6]}"
        echo "8: Install ${DB_Info[7]}"
        echo "9: Install ${DB_Info[8]}"
        echo "10: Install ${DB_Info[9]}"
        echo "11: Install ${DB_Info[10]}"
        echo "0: DO NOT Install MySQL/MariaDB"
        read -p "Enter your choice (1-11 or 0): " DBSelect
    fi

    case "${DBSelect}" in
    1) echo "You will install ${DB_Info[0]}" ;;
    2)
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[1]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[1]} from Source."; Bin="n" ;;
                *) Bin="n" ;;
            esac
        else
            echo "Default install ${DB_Info[1]} from Source."; Bin="n"
        fi
        ;;
    3)
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[2]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[2]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[2]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[2]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    4)
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[3]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[3]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[3]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[3]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    5)
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" || "${DB_ARCH}" = "aarch64" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[4]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[4]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[4]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[4]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    6)
        echo "You will install ${DB_Info[5]}"
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" || "${DB_ARCH}" = "aarch64" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[5]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[5]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[5]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[5]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    7)
        echo "You will install ${DB_Info[6]}"
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[6]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[6]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[6]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[6]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    8)
        echo "You will install ${DB_Info[7]}"
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[7]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[7]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[7]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[7]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    9)
        echo "You will install ${DB_Info[8]}"
        if [[ "${DB_ARCH}" = "x86_64" || "${DB_ARCH}" = "i686" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[8]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[8]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[8]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[8]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    10)
        echo "You will install ${DB_Info[9]}"
        if [[ "${DB_ARCH}" = "x86_64" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[9]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[9]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[9]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[9]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    11)
        echo "You will install ${DB_Info[10]}"
        if [[ "${DB_ARCH}" = "x86_64" ]]; then
            if [ -z ${Bin} ]; then read -p "Using Generic Binaries [y/n]: " Bin; fi
            case "${Bin}" in
                [yY][eE][sS]|[yY]) echo "You will install ${DB_Info[10]} Using Generic Binaries."; Bin="y" ;;
                [nN][oO]|[nN]) echo "You will install ${DB_Info[10]} from Source."; Bin="n" ;;
                *) if [ "${CheckMirror}" != "n" ]; then echo "Default install ${DB_Info[10]} Using Generic Binaries."; Bin="y"; else echo "Default install ${DB_Info[10]} from Source."; Bin="n"; fi ;;
            esac
        else Bin="n"; fi
        ;;
    0) echo "Do not install MySQL/MariaDB!" ;;
    *) echo "No input,You will install ${DB_Info[1]}"; DBSelect="2" ;;
    esac

    if [ "${Bin}" != "y" ] && [[ "${DBSelect}" =~ ^[5-6]|[8-9]|1[0-1]$ ]] && [ $(awk '/MemTotal/ {printf( "%d\n", $2 / 1024 )}' /proc/meminfo) -le 1024 ]; then
        echo "Memory less than 1GB, can't install MySQL 8.0 or MairaDB 10.3+!"
        exit 1
    fi

    if [[ "${DBSelect}" =~ ^[789]|1[0-1]$ ]]; then
        MySQL_Bin="/usr/local/mariadb/bin/mysql"
        MySQL_Config="/usr/local/mariadb/bin/mysql_config"
        MySQL_Dir="/usr/local/mariadb"
    elif [[ "${DBSelect}" =~ ^[123456]$ ]]; then
        MySQL_Bin="/usr/local/mysql/bin/mysql"
        MySQL_Config="/usr/local/mysql/bin/mysql_config"
        MySQL_Dir="/usr/local/mysql"
    fi

    if [[ "${DBSelect}" != "0" ]]; then
        if [ -z ${DB_Root_Password} ]; then
            echo "==========================="
            DB_Root_Password="root"
            Echo_Yellow "Please setup root password of MySQL."
            read -p "Please enter: " DB_Root_Password
            if [ "${DB_Root_Password}" = "" ]; then
                echo "NO input,password will be generated randomly."
                DB_Root_Password="lnmp.org#$RANDOM"
            fi
        fi
        echo "MySQL root password: ${DB_Root_Password}"
        echo "==========================="

        if [ -z ${InstallInnodb} ]; then
            InstallInnodb="y"
            Echo_Yellow "Do you want to enable or disable the InnoDB Storage Engine?"
            read -p "Default enable,Enter your choice [Y/n]: " InstallInnodb
        fi

        case "${InstallInnodb}" in
            [yY][eE][sS]|[yY]) echo "You will enable the InnoDB Storage Engine"; InstallInnodb="y" ;;
            [nN][oO]|[nN]) echo "You will disable the InnoDB Storage Engine!"; InstallInnodb="n" ;;
            *) echo "No input,The InnoDB Storage Engine will enable."; InstallInnodb="y" ;;
        esac
    fi
}

# ========================================================================
# 魔改版 PHP 选择菜单 (完全硬编码解耦文本，100% 防止数组越界雪崩)
# ========================================================================
PHP_Selection()
{
    if [ -z ${PHPSelect} ]; then
        echo "==========================="
        PHPSelect="5"
        Echo_Yellow "You have 16 options for your PHP install."
        echo "1: Install PHP 5.2.17"
        echo "2: Install PHP 5.3.29"
        echo "3: Install PHP 5.4.45"
        echo "4: Install PHP 5.5.38"
        echo "5: Install PHP 5.6.40 (Default)"
        echo "6: Install PHP 7.0.33"
        echo "7: Install PHP 7.1.33"
        echo "8: Install PHP 7.2.34"
        echo "9: Install PHP 7.3.33"
        echo "10: Install PHP 7.4.33"
        echo "11: Install PHP 8.0.30"
        echo "12: Install PHP 8.1.29"
        echo "13: Install PHP 8.2.23"
        echo "14: Install PHP 8.3.11"
        echo "15: Install PHP 8.4.22"
        echo "16: Install PHP 8.5.7"
        read -p "Enter your choice (1-16): " PHPSelect
    fi

    case "${PHPSelect}" in
    1)
        echo "You will install PHP 5.2.17"
        if [[ "${DBSelect}" = 0 ]]; then echo "You didn't select MySQL/MariaDB can't select PHP 5.2.17!"; exit 1; fi
        ;;
    2) echo "You will install PHP 5.3.29" ;;
    3) echo "You will Install PHP 5.4.45" ;;
    4) echo "You will install PHP 5.5.38" ;;
    5) echo "You will install PHP 5.6.40" ;;
    6) echo "You will install PHP 7.0.33" ;;
    7) echo "You will install PHP 7.1.33" ;;
    8) echo "You will install PHP 7.2.34" ;;
    9) echo "You will install PHP 7.3.33" ;;
    10) echo "You will install PHP 7.4.33" ;;
    11) echo "You will install PHP 8.0.30" ;;
    12) echo "You will install PHP 8.1.29" ;;
    13) echo "You will install PHP 8.2.23" ;;
    14) echo "You will install PHP 8.3.11" ;;
    15) echo "You will install PHP 8.4.22" ;;
    16) echo "You will install PHP 8.5.7" ;;
    *) echo "No input,You will install PHP 5.6.40"; PHPSelect="5" ;;
    esac
}

# ========================================================================
# 内存优化分配器选择菜单
# ========================================================================
MemoryAllocator_Selection()
{
    if [ -z ${SelectMalloc} ]; then
        echo "==========================="
        SelectMalloc="1"
        Echo_Yellow "You have 3 options for your Memory Allocator install."
        echo "1: Don't install Memory Allocator. (Default)"
        echo "2: Install Jemalloc"
        echo "3: Install TCMalloc"
        read -p "Enter your choice (1, 2 or 3): " SelectMalloc
    fi

    case "${SelectMalloc}" in
    1) echo "You will install not install Memory Allocator." ;;
    2) echo "You will install JeMalloc" ;;
    3) echo "You will Install TCMalloc" ;;
    *) echo "No input,You will not install Memory Allocator."; SelectMalloc="1" ;;
    esac

    if [ "${SelectMalloc}" = "1" ]; then
        MySQL51MAOpt=''; MySQLMAOpt=''; NginxMAOpt=''
    elif [ "${SelectMalloc}" = "2" ]; then
        MySQL51MAOpt='--with-mysqld-ldflags=-ljemalloc'
        MySQLMAOpt='[mysqld_safe]\nmalloc-lib=/usr/lib/libjemalloc.so'
        NginxMAOpt="--with-ld-opt='-ljemalloc'"
    elif [ "${SelectMalloc}" = "3" ]; then
        MySQL51MAOpt='--with-mysqld-ldflags=-ltcmalloc'
        MySQLMAOpt='[mysqld_safe]\nmalloc-lib=/usr/lib/libtcmalloc.so'
        NginxMAOpt='--with-google_perftools_module'
    fi
}

Dispaly_Selection()
{
    Database_Selection
    PHP_Selection
    MemoryAllocator_Selection
}

# ========================================================================
# 基础依赖与下载源劫持函数
# ========================================================================
Download_Files()
{
    local URL=$1
    local FileName=$2
    
    # 核心劫持：强制将高版本官方 PHP 分发源重定向至官网，不走 LNMP 404 镜像站
    if [[ "${FileName}" == "php-8.4.22.tar.gz" ]]; then URL="https://www.php.net/distributions/php-8.4.22.tar.gz"
    elif [[ "${FileName}" == "php-8.5.7.tar.gz" ]]; then URL="https://www.php.net/distributions/php-8.5.7.tar.gz"; fi
    
    if [ -s "${FileName}" ]; then echo "${FileName} [found]"
    else echo "Notice: ${FileName} not found!!!download now..."; wget -c --progress=dot -e dotbytes=20M --prefer-family=IPv4 --no-check-certificate ${URL}; fi
}

Tar_Cd()
{
    local FileName=$1
    local DirName=$2
    local extension=${FileName##*.}
    cd ${cur_dir}/src
    [[ -d "${DirName}" ]] && rm -rf ${DirName}
    echo "Uncompress ${FileName}..."
    if [ "$extension" == "gz" ] || [ "$extension" == "tgz" ]; then tar zxf "${FileName}"
    elif [ "$extension" == "bz2" ]; then tar jxf "${FileName}"
    elif [ "$extension" == "xz" ]; then tar Jxf "${FileName}"
    fi
    if [ -n "${DirName}" ]; then echo "cd ${DirName}..."; cd ${DirName}; fi
}

# ========================================================================
# 系统硬件环境探测函数
# ========================================================================
Get_OS_Bit()
{
    if [[ `getconf WORD_BIT` = '32' && `getconf LONG_BIT` = '64' ]] ; then Is_64bit='y'; ARCH='x86_64'; DB_ARCH='x86_64'
    else Is_64bit='n'; ARCH='i386'; DB_ARCH='i686'; fi
    if uname -m | grep -Eqi "arm|aarch64"; then
        Is_ARM='y'
        if uname -m | grep -Eqi "armv7|armv6"; then ARCH='armhf'
        elif uname -m | grep -Eqi "aarch64"; then ARCH='aarch64'; DB_ARCH='aarch64'
        else ARCH='arm'; fi
    fi
}

Get_Dist_Name()
{
    if grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then DISTRO='Debian'; PM='apt'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then DISTRO='Ubuntu'; PM='apt'
    elif grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then DISTRO='CentOS'; PM='yum'
    else DISTRO='Debian'; PM='apt'; fi # 针对新发行版默认强制保底设置为现代 Apt
    Get_OS_Bit
}

Check_LNMPConf()
{
    if [ ! -s "${cur_dir}/lnmp.conf" ]; then Echo_Red "lnmp.conf was not exsit!"; exit 1; fi
}

Print_APP_Ver() { echo "Preparing variables for compilation..."; }
Print_Sys_Info() { echo "LNMP V2.1 Environment Initializing..."; }
Check_WSL() { isWSL="n"; }
Check_Docker() { isDocker="n"; }
Check_Openssl() { isOpenSSL3="y"; }
