mkdir -p build_android
cd build_android
#looping for each complier
for CC in "/opt/elear-solutions/toolchain_aarch64_v8a_21/bin/aarch64-linux-android-clang" "/opt/elear-solutions/toolchain_armeabi_v7a_19/bin/arm-linux-androideabi-clang" "/opt/elear-solutions/toolchain_x86_19/bin/i686-linux-android-clang" "/opt/elear-solutions/toolchain_x86_64_21/bin/x86_64-linux-android-clang"
do

  #Setting output dir
  case "$CC" in
     "/opt/elear-solutions/toolchain_aarch64_v8a_21/bin/aarch64-linux-android-clang")
        MY_OUT_DIR="arm64-v8a"
        ;;
     "/opt/elear-solutions/toolchain_armeabi_v7a_19/bin/arm-linux-androideabi-clang")
        MY_OUT_DIR="armeabi-v7a"
        ;;
     "/opt/elear-solutions/toolchain_x86_19/bin/i686-linux-android-clang")
        MY_OUT_DIR="x86"
        ;;
     "/opt/elear-solutions/toolchain_x86_64_21/bin/x86_64-linux-android-clang")
        MY_OUT_DIR="x86_64"
        ;;
  esac

  # Generating all the static libs
  mkdir -p $MY_OUT_DIR
  cd $MY_OUT_DIR
  CC=$CC cmake ../..
  make
  cd ..
done
