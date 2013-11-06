source /local64/etc/profile.local

# set CPU count global. This can be overwrite from the compiler script (ffmpeg-autobuild.bat)
cpuCount=1
while true; do
  case $1 in
--cpuCount=* ) cpuCount="${1#*=}"; shift ;;
    -- ) shift; break ;;
    -* ) echo "Error, unknown option: '$1'."; exit 1 ;;
    * ) break ;;
  esac
done

cd $LOCALBUILDDIR
if [ -f "libiconv-1.14/compile1.done" ]; then
    echo -------------------------------------------------
    echo "libiconv-1.14 is already compiled"
    echo -------------------------------------------------
    else 
		if [ -d "libiconv-1.14" ]; then rm -r libiconv-1.14; fi
		wget -c http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
		tar xzf libiconv-1.14.tar.gz
		rm libiconv-1.14.tar.gz
		cd libiconv-1.14
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --enable-shared=no --enable-static=yes LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		make -j $cpuCount
		make install
		echo "finish" > compile1.done
		
		if [ -f "$LOCALDESTDIR/lib/libiconv.a" ]; then
			echo -
			echo -------------------------------------------------
			echo "build libiconv-1.14 done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build libiconv-1.14 failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

cd $LOCALBUILDDIR
if [ -f "gettext-0.18.3.1-runtime/compile.done" ]; then
    echo -------------------------------------------------
    echo "gettext-0.18.3.1-runtime is already compiled"
    echo -------------------------------------------------
    else 
		wget -c http://ftp.gnu.org/pub/gnu/gettext/gettext-0.18.3.1.tar.gz
		tar xzf gettext-0.18.3.1.tar.gz
		mv gettext-0.18.3.1 gettext-0.18.3.1-runtime
		cd gettext-0.18.3.1-runtime
		cat gettext-tools/woe32dll/gettextlib-exports.c | grep -v rpl_opt > gettext-tools/woe32dll/gettextlib-exports.c.new
		mv gettext-tools/woe32dll/gettextlib-exports.c.new gettext-tools/woe32dll/gettextlib-exports.c
		CFLAGS="-mms-bitfields -mthreads -O2" ./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --enable-threads=win32 --enable-relocatable LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -DPTW32_STATIC_LIB" 
		cd gettext-runtime
		make -j $cpuCount
		make install
		cd ..
		echo "finish" > compile.done
		
		if [ -f "$LOCALDESTDIR/lib/libasprintf.a" ]; then
			echo -
			echo -------------------------------------------------
			echo "build gettext-0.18.3.1-runtime done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build gettext-0.18.3.1-runtime failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi
		
cd $LOCALBUILDDIR
if [ -f "gettext-0.18.3.1-static/compile.done" ]; then
    echo -------------------------------------------------
    echo "gettext-0.18.3.1-static is already compiled"
    echo -------------------------------------------------
    else 
		tar xzf gettext-0.18.3.1.tar.gz
		rm gettext-0.18.3.1.tar.gz
		mv gettext-0.18.3.1 gettext-0.18.3.1-static
		cd gettext-0.18.3.1-static
		CFLAGS="-mms-bitfields -mthreads -O2" ./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --enable-threads=win32 --enable-relocatable --disable-shared LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		make -j $cpuCount
		install gettext-tools/src/*.exe $LOCALDESTDIR/bin
		install gettext-tools/misc/autopoint $LOCALDESTDIR/bin
		echo "finish" > compile.done
		
		if [ -f "$LOCALDESTDIR/bin/msgmerge.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "build gettext-0.18.3.1-static done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build gettext-0.18.3.1-static failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

cd $LOCALBUILDDIR
if [ -f "libiconv-1.14/compile2.done" ]; then
    echo -------------------------------------------------
    echo "libiconv-1.14 is already compiled"
    echo -------------------------------------------------
    else 
		wget -c http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.14.tar.gz
		tar xzf libiconv-1.14.tar.gz
		rm libiconv-1.14.tar.gz
		cd libiconv-1.14
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --enable-shared=no --enable-static=yes LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		make clean
		make -j $cpuCount
		make install
		echo "finish" > compile2.done
		
		if [ -f "$LOCALDESTDIR/lib/libiconv.a" ]; then
			echo -
			echo -------------------------------------------------
			echo "build libiconv-1.14 done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build libiconv-1.14 failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

source /local32/etc/profile.local

# set CPU count global. This can be overwrite from the compiler script (ffmpeg-autobuild.bat)
cpuCount=6
while true; do
  case $1 in
--cpuCount=* ) cpuCount="${1#*=}"; shift ;;
    -- ) shift; break ;;
    -* ) echo "Error, unknown option: '$1'."; exit 1 ;;
    * ) break ;;
  esac
done

cd $LOCALBUILDDIR
if [ -f "fftw-3.2.2/compile.done" ]; then
    echo -------------------------------------------------
    echo "fftw-3.2.2 is already compiled"
    echo -------------------------------------------------
    else 
		wget -c ftp://ftp.fftw.org/pub/fftw/fftw-3.2.2.tar.gz
		tar xf fftw-3.2.2.tar.gz
		rm fftw-3.2.2.tar.gz
		cd fftw-3.2.2
		#sed -i 's/.\/configure --disable-shared --enable-maintainer-mode --enable-threads $*/ /g' bootstrap.sh
		#sed -i 's/configur*/ /g' bootstrap.sh
		./configure --host=x86_64-pc-mingw32 --prefix=/local32 --with-our-malloc16 --with-windows-f77-mangling --enable-shared --enable-threads --with-combined-threads --enable-portable-binary --enable-float --enable-sse LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++" 
		make -j $cpuCount
		make install
		echo "finish" > compile.done
		
		if [ -f "$LOCALDESTDIR/bin/fftwf-wisdom.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "build fftw-3.2.2 done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build fftw-3.2.2 failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

cd $LOCALBUILDDIR
if [ -f "fltk-1.3.2/compile.done" ]; then
    echo -------------------------------------------------
    echo "fltk-1.3.2 is already compiled"
    echo -------------------------------------------------
    else 
		wget -c http://fltk.org/pub/fltk/1.3.2/fltk-1.3.2-source.tar.gz
		tar xzf fltk-1.3.2-source.tar.gz
		rm fltk-1.3.2-source.tar.gz
		cd fltk-1.3.2
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++" 
		make -j $cpuCount
		make install
		echo "finish" > compile.done
		
		if [ -f "$LOCALDESTDIR/bin/fluid.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "build fltk-1.3.2 done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build fltk-1.3.2 failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

cd $LOCALBUILDDIR
if [ -f "OpenEXR-Master/compile.done" ]; then
    echo -------------------------------------------------
    echo "OpenEXR is already compiled"
    echo -------------------------------------------------
    else 
		git clone https://github.com/openexr/openexr.git OpenEXR-git
		cd OpenEXR-git
		cd IlmBase
		./bootstrap
		sed -i 's/#if !defined (_WIN32) &&!(_WIN64) && !(HAVE_PTHREAD)/#if true/g' IlmThread/IlmThread.cpp
		sed -i 's/#if !defined (_WIN32) && !(_WIN64) && !(HAVE_PTHREAD)/#if true/g' IlmThread/IlmThreadMutex.cpp
		sed -i 's/#if !defined (_WIN32) && !(_WIN64) && !(HAVE_PTHREAD)/#if true/g' IlmThread/IlmThreadSemaphore.cpp
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --disable-threading --disable-posix-sem LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		make -j $cpuCount
		make install
		cd ..

		cd OpenEXR
		./bootstrap
		sed -i 's/#define ZLIB_WINAPI/\/\/#define ZLIB_WINAPI/g' IlmImf/ImfZipCompressor.cpp
		sed -i 's/#define ZLIB_WINAPI/\/\/#define ZLIB_WINAPI/g' IlmImf/ImfPxr24Compressor.cpp
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --disable-threading --disable-posix-sem --disable-ilmbasetest LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		cd IlmImf
		g++ -I/local32/include -I/local32/include/OpenEXR -mms-bitfields -mthreads -mtune=pentium3 -static -static-libgcc -static-libstdc++ -I/local32/include -L/local32/lib -mthreads  b44ExpLogTable.cpp -lHalf -o b44ExpLogTable
		cd ..
		make -j $cpuCount
		make install
		cd ..
	
		sed -i 's/Libs: -L${libdir} -lImath -lHalf -lIex -lIexMath -lIlmThread/Libs: -L${libdir} -lImath -lHalf -lIex -lIexMath -lIlmThread -lstdc++/' "$PKG_CONFIG_PATH/IlmBase.pc"
		sed -i 's/Libs: -L${libdir} -lIlmImf/Libs: -L${libdir} -lIlmImf -lstdc++/' "$PKG_CONFIG_PATH/OpenEXR.pc"
		
		cd OpenEXR_Viewers
		./bootstrap 
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR --enable-shared=no --enable-static=yes --disable-threading --disable-posix-sem LDFLAGS="-L$LOCALDESTDIR/lib -mthreads -static -static-libgcc -static-libstdc++ -DPTW32_STATIC_LIB" 
		make -j $cpuCount
		make install
		
		cd ..
		echo "finish" > compile.done
		
		if [ -f "$LOCALDESTDIR/bin/exrdisplay.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "build OpenEXR done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build OpenEXR failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi

cd $LOCALBUILDDIR
if [ -f "ImageMagick-git/configure" ]; then
	cd ImageMagick-git
	if git checkout master &&
		git fetch origin master &&
		[ `git rev-list HEAD...origin/master --count` != 0 ] &&
		git merge origin/master
	then
		rm -r $LOCALDESTDIR/bin/magick16
		rm -r $LOCALDESTDIR/bin/magick32
		
		sed -i 's/AC_PREREQ(2.69)/AC_PREREQ(2.68)/' "configure.ac"
		sed -i 's/m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.69],,/m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.68],,/' "aclocal.m4"
		
		make clean
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR/bin/magick16 --enable-hdri --enable-shared=no --with-quantum-depth=16
		make -j $cpuCount
		make install
		
		make clean
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR/bin/magick32 --enable-hdri --enable-shared=no --with-quantum-depth=32
		make -j $cpuCount
		make install
		
		if [ -f "$LOCALDESTDIR/bin/magick32/magick.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "ImageMagick done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build ImageMagick failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
	else
		echo -------------------------------------------------
		echo "ImageMagick is already up to date"
		echo -------------------------------------------------
	fi
    else 
		git clone https://github.com/trevor/ImageMagick.git ImageMagick-git
		cd ImageMagick-git
		
		sed -i 's/AC_PREREQ(2.69)/AC_PREREQ(2.68)/' "configure.ac"
		sed -i 's/m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.69],,/m4_if(m4_defn([AC_AUTOCONF_VERSION]), [2.68],,/' "aclocal.m4"
		
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR/bin/magick16 --enable-hdri --enable-shared=no --with-quantum-depth=16
		make -j $cpuCount
		make install
		
		make clean
		./configure --host=x86_64-pc-mingw32 --prefix=$LOCALDESTDIR/bin/magick32 --enable-hdri --enable-shared=no --with-quantum-depth=32
		make -j $cpuCount
		make install
		
		if [ -f "$LOCALDESTDIR/bin/magick32/magick.exe" ]; then
			echo -
			echo -------------------------------------------------
			echo "ImageMagick done..."
			echo -------------------------------------------------
			echo -
			else
				echo -------------------------------------------------
				echo "build ImageMagick failed..."
				echo "delete the source folder under '$LOCALBUILDDIR' and start again"
				read -p "first close the batch window, then the shell window"
				sleep 15
		fi
fi