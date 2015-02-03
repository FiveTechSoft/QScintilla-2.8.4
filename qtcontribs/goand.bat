PATH=c:\qt\tools\mingw491_32\bin;C:\qt\5.4\android_armv7\bin;C:\harbour\bin\
SET QT_PLUGIN_PATH=C:\Qt\5.4\android_armv7\plugins
SET HB_WITH_QT=C:\qt\5.4\android_armv7\include
rem HB_QT_MAJOR_VER can probably become deprecated in next
rem Harbour/qtcontribs releases.
SET HB_QT_MAJOR_VER=5

set NDK=C:\hb32\android\ndk
set QT=C:\Qt\5.4\android_armv7\include
set LVL=9
set CPU=arm
rem set set CPU=x86
rem set set CPU=mips
set CCOMP=4.8
set PLATFORM=android-%LVL%
set HOST_CPU=windows-x86_64
set SYSROOT=%NDK%\platforms\%PLATFORM%\arch-%CPU%
 
if "%CPU%" == "arm"  set TCHAIN=arm-linux-androideabi
if "%CPU%" == "mips" set TCHAIN=mipsel-linux-android
if "%CPU%" == "x86"  set TCHAIN=x86
 
set HB_PLATFORM=android
set HB_COMPILER=gccarm
set HB_CCPREFIX=%NDK%\toolchains\%TCHAIN%-%CCOMP%\prebuilt\%HOST_CPU%\bin\%TCHAIN%-
 
set HB_BUILD_3RDEXT=no
set HB_WITH_QT=%QT%
 
set HB_USER_CFLAGS=
set HB_USER_DFLAGS=
set HB_USER_LDFLAGS=
set HB_USER_CFLAGS=%HB_USER_CFLAGS% --sysroot=%SYSROOT%
set HB_USER_DFLAGS=%HB_USER_DFLAGS% --sysroot=%SYSROOT%
set HB_USER_LDFLAGS=%HB_USER_LDFLAGS% --sysroot=%SYSROOT% -lm
set HB_USER_CFLAGS=%HB_USER_CFLAGS% --sysroot=%SYSROOT% -I%NDK%\sources\cxx-stl\gnu-libstdc++\4.8\include -I%NDK%\sources\cxx-stl\gnu-libstdc++\4.8\libs\armeabi-v7a\include -I%NDK%\platforms\android-9\arch-arm\usr\include

del hbqt\.hbmk\*.* -s
hbmk2 qtcontribs.hbp -I..\QScintilla-gpl-2.8.4\Qt4Qt5
