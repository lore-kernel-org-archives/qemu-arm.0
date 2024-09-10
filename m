Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1254495njb;
        Tue, 10 Sep 2024 05:35:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxTs3+8i8BoSJ3djZy9oT43qyzKa4gNnRwmDIQV6LPhFc9+jDZfJ+Ytbt8n5HS1TTdVqOzw4N2KXYj4Q==@linaro.org
X-Received: by 2002:a2e:1311:0:b0:2ef:2d80:b8ff with SMTP id 38308e7fff4ca-2f751eaf367mr91272481fa.6.1725971739028;
        Tue, 10 Sep 2024 05:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971738; cv=none;
        d=google.com; s=arc-20160816;
        b=1CWenWDHm1huElIDkoNmnJr+Kb1/9OXk79XNNMOKulsqPkFIIMZkr3E7DoaLIFsx3z
         xLCtMhYR8/rmOE7a69sKNbU9oO+ZkiiY26iazGEZ/QbQROcjhuiNGsj12YdSRSOm2WDt
         SFVPEruuIluXOlYJgHXvG9+lJG7T8xmplYtcbCwgZ3pVLB2MAF/QZzpYnFYrfB74Jw3w
         JpPzr4cAu8lrml++e/CLLA+677yc1OSD5N/WV6y5aVgYJaFPhxJpppcnoyVAZw7+fq+t
         KP0Wc9WRYut1mmWgcOWfbuse7ET5TQUIqtENhw70ut5nUK0hBnQg//mljHN8ZQyHOEcb
         HF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=rTW6DB2vc7KmJQ4SGCbEmjnkV7PiKuK8fmowFe7ncik=;
        fh=MmnysmgdizgiPvsBzM3i3BewMW86n5GjPOGklHmhi50=;
        b=Flqrhb++PqEVk0oWjen/1LjOS1ja2Hh5Hd5bz53MO3kVCfGPYf1r/agzXfZqg1TiI0
         iux56C6DjjxYE4P1kxQTjiSscprW3Ys2e6yKsTNftnUydAepp51AiqphPC644rUQ0qbo
         GF1NcLz0nyVrGPd4T8lvf7FP4nbrjNVyH9bTM7GN7BzxvcUJhJQYVnQES8QQF6yPuS8x
         nx2QKZUqyWwmZYeSVW8IqjOywxlhGyXntY8h03Trlykn26ZnW3hoExW1tGmavmQM7480
         PWIOIKFK+FnpOdBFXZCvyh75JGX3DMnskfOi5Ooerltvj4TRJDgh7r+71/HftX00HPpP
         Ipeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVU14Wn+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c3ebd76d70sor1170192a12.9.2024.09.10.05.35.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 05:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVU14Wn+;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725971738; x=1726576538; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rTW6DB2vc7KmJQ4SGCbEmjnkV7PiKuK8fmowFe7ncik=;
        b=zVU14Wn+Jmk/b1Jgnmhbsn2CU6nYsrlh7tfbgjb2zyE99OMl+/Zq2pf/KpiNRKTzX4
         0qhjZs0TPVlROnpfmYHfIDjqpBeuRDLVE/ZhlBu+VY1wjJfje3RZtjS5SmZpSZZqZOUy
         10Nd8LKUjY/bSg1zzivRQ4yfnXmyWpnkQ4RM7BYSnUdCcMpOc9djcQn66LHMofLI05eL
         1APrlGzCHd3qnMEZbs8EBThBCPx6KaQdiToDoJRJMmJ4l4NLuGjt4RoQwBYApNf98Qlr
         euZDaH401KPC7ps1KGQTzWmiaCDNfLrUuIzLA1wuaVsh1SA8X4vsp3QpSb/ecuG+ErWU
         /PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971738; x=1726576538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTW6DB2vc7KmJQ4SGCbEmjnkV7PiKuK8fmowFe7ncik=;
        b=CHhmWH7l9pQ/XPoi0fK0rjVVsCrIVU7hK/MbzU1ULuc5kpuXSnHRjuk25EpXymk+dk
         vJ3s2KrFxwFEPsXw/d5OI7PZUbhw1KvR8K9YomuIrZsh4u1wtK55k+J/4ufr95ZXKxHx
         9L9jfWqd8ZEQgfeQJFcXrVOSJzF6gDShOGqr+6TmHNLA7KSe0bxDkSfbp6jxj/WgnCyt
         bLSf/IfZu2UicgDHznd7SVPHdhkG5r+aS3JovpUC4UpA/H/ziSbdFLQgatmn40I+HZsE
         F9Mv7NvIVnftNQt9cQUit+SmJ0NZ4af6d0+7KB1KTa74OnMOIlpmjDm4hFxBSW2Y+cIJ
         9ZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxDD59zlk5fPO2dBNJiSn20xCsSbnKKruTqQxyxaLFXRcC86Qzq9yOfYoOmne3iIwocMOTvEglP5smVQ==@linaro.org
X-Gm-Message-State: AOJu0YxjVpBso6fvSGKZFdpG3hqriO8Zs4ZCzuoAfSLHTywM2rzlGQJp
	IHRYbaW+ij/oOJEx3GEImje0+SKLClQp+ow6Qx/NXCZmhug2jXLzXJBz056tU7taggijOsH+AZq
	K/968Zg==
X-Google-Smtp-Source: AGHT+IFNbMcnT433HCIsXxMp3sRrRiFp8P3Pm3LdplWrUdMZC6CsPSVMf+n/5T1/ZxDKtSzmMgd2Rw==
X-Received: by 2002:a05:6402:350f:b0:5c0:c10c:7c1d with SMTP id 4fb4d7f45d1cf-5c3e9742e8fmr7604704a12.23.1725971738072;
        Tue, 10 Sep 2024 05:35:38 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-234.109.242.225.tellas.gr. [109.242.225.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4242994a12.3.2024.09.10.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:35:37 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 10 Sep 2024 15:35:09 +0300
Subject: [PATCH v10 3/9] configure, meson: detect Rust toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-rust-pl011-v10-3-85a89ee33c40@linaro.org>
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
In-Reply-To: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>, 
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mailer: b4 0.15-dev-c2c95
X-Developer-Signature: v=1; a=openpgp-sha256; l=10503;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=hOhk5Oy02nnSK1uZVkNHltHu7gBfzMIt71sTA+argnc=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgprQTBEQUFvQmR5bkhjSDkrQ2RBQnl5WmlBR
 2JnUFF1Z0lwenhrdGdVRkxhVSsxNXFkV09qS2Mwcmh4eUJPY2hMCmFvcnYwWWc0eVlrQ013UUFB
 UW9BSFJZaEJNeGNHMDVFb0ZiemgzQWRFSGNweDNCL2ZnblFCUUptNEQwTEFBb0oKRUhjcHgzQi9
 mZ25RMjZnUC8wdkxqc0lOSEZ0WXlTbE1CVUozaHlnck55d1V6YytuNm9XbG9Talp6YzRpTVllbw
 o3eDdNdVJzbTN0aXh0Z1hwcE9sQk5oSXFyazdYTDB4UkNIQUNrem5WNmJsK1lLL0RXc2tWK1N5T
 mM5MXBLcmJkCnlxaktpcW9sZmZMeTRWSWN2dGpkUkx4clIvNlI1RDAyZUlSUDcyQUhlamFVMmdW
 SHlCeldmMXdhKzFZVGMyQnUKVzhFaU5ra3Qza0swUjdSeTBKSkpnMXJpWTJ6U2Z4aXpPbWNCSHd
 1VUtDTEUxVmJ0OSt1WHlYbWdCUDNHVDVYVwpHaHNqV2l5MmgrckdORGI4WGxlYU5KTUc5QlpYOU
 FLbWZtU2RIWkFyOFJuOTBzZEpjWFNYR1dqV0EyNGtCTDZWCjR6S2gvdFQwZWpqaGZ0K012MHk5Z
 TNoaHlwTzVTbGlOTzI2cnhyQmlnSVM1cEpUbXJOY1NXZS9mNmpseGRBR3EKOTBKVmN5MDRSNHBy
 T3p0VTREVkVNLzdJcHhlWjBvYm00U1ZITFkySHh5dElDY0JVSFo5eXlvaUhmZXl0YVVjaQpoZWJ
 wL3doWlpvWTgrN00zMDJnenZRVzFqYzRBd0Exa0hiZnpXSFBqMGR0TnFCTytvOERkWGVSeGgvbF
 Q0QllnCmNZVGFWMzVIWUIzVFRzdVBoQ25KY0dHMTVTTlJ3encwK2pKeDZZUlRIRFhRVEt3VVpaZ
 nRKZEhmRW5kOFU3ZzgKdkNXSThrM09iblZNdGl2djZFTW1vV3h1cjhlbExFM2NHVkpGRVJPZkJv
 NjdjRDB2bG5KNkV0NnlHdDZnMnVZWApqMlk5ZmMyTjZjY3Y0T05ySG5LZ2pOS1k1V3VYMFhZSnN
 zU2pOY1ZhbmE3c0l1NWk4c0Z3ZzBqTmpPYTcKPXpreUsKLS0tLS1FTkQgUEdQIE1FU1NBR0UtLS
 0tLQo=
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: oBPWYUtNll5N

From: Paolo Bonzini <pbonzini@redhat.com>

Include the correct path and arguments to rustc in the native
and cross files (native compilation is needed for procedural
macros).

Based on the host architecture and OS, the compiler and optionally the argument
to --cpu, the Rust target triple can be detected automatically for either a
native or a cross compiler.

In general, it is only a matter of translating the architecture and OS, and
adding a machine to form the triple, but there are some special cases (e.g.
detecting soft vs. hard floating point on ARM) and some inconsistencies.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 meson.build |   5 +-
 2 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 019fcbd0ef7b07e7b0280b358099cae72c73aa98..4a011ff60bb8f351b3ee8d038a35a249dc297831 100755
--- a/configure
+++ b/configure
@@ -207,6 +207,8 @@ for opt do
   ;;
   --objcc=*) objcc="$optarg"
   ;;
+  --rustc=*) RUSTC="$optarg"
+  ;;
   --cpu=*) cpu="$optarg"
   ;;
   --extra-cflags=*)
@@ -252,6 +254,8 @@ python=
 download="enabled"
 skip_meson=no
 use_containers="yes"
+rust="auto"
+rust_target_triple=""
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 gdb_arches=""
 
@@ -310,6 +314,7 @@ objcopy="${OBJCOPY-${cross_prefix}objcopy}"
 ld="${LD-${cross_prefix}ld}"
 ranlib="${RANLIB-${cross_prefix}ranlib}"
 nm="${NM-${cross_prefix}nm}"
+readelf="${READELF-${cross_prefix}readelf}"
 strip="${STRIP-${cross_prefix}strip}"
 widl="${WIDL-${cross_prefix}widl}"
 windres="${WINDRES-${cross_prefix}windres}"
@@ -317,6 +322,8 @@ windmc="${WINDMC-${cross_prefix}windmc}"
 pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
+rustc="${RUSTC-rustc}"
+
 check_define() {
 cat > $TMPC <<EOF
 #if !defined($1)
@@ -425,6 +432,7 @@ fi
 # Please keep it sorted and synchronized with meson.build's host_arch.
 host_arch=
 linux_arch=
+raw_cpu=$cpu
 case "$cpu" in
   aarch64)
     host_arch=aarch64
@@ -636,6 +644,8 @@ for opt do
   ;;
   --objcc=*)
   ;;
+  --rustc=*)
+  ;;
   --make=*)
   ;;
   --install=*)
@@ -755,8 +765,14 @@ for opt do
   ;;
   --container-engine=*) container_engine="$optarg"
   ;;
+  --rust-target-triple=*) rust_target_triple="$optarg"
+  ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
+  --enable-rust) rust=enabled
+  ;;
+  --disable-rust) rust=disabled
+  ;;
   # everything else has the same name in configure and meson
   --*) meson_option_parse "$opt" "$optarg"
   ;;
@@ -859,6 +875,7 @@ Advanced options (experts only):
                            at build time [$host_cc]
   --cxx=CXX                use C++ compiler CXX [$cxx]
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
+  --rustc=RUSTC            use Rust compiler RUSTC [$rustc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
@@ -869,8 +886,9 @@ Advanced options (experts only):
   --python=PYTHON          use specified python [$python]
   --ninja=NINJA            use specified ninja [$ninja]
   --static                 enable static build [$static]
-  --without-default-features default all --enable-* options to "disabled"
-  --without-default-devices  do not include any device that is not needed to
+  --rust-target-triple=TRIPLE  compilation target for Rust code [autodetect]
+  --without-default-features   default all --enable-* options to "disabled"
+  --without-default-devices    do not include any device that is not needed to
                            start the emulator (only use if you are including
                            desired devices in configs/devices/)
   --with-devices-ARCH=NAME override default configs/devices
@@ -1139,6 +1157,132 @@ EOF
 fi
 
 ##########################################
+# detect rust triple
+
+if test "$rust" != disabled && has "$rustc" && $rustc -vV > "${TMPDIR1}/${TMPB}.out"; then
+  rust_host_triple=$(sed -n 's/^host: //p' "${TMPDIR1}/${TMPB}.out")
+else
+  if test "$rust" = enabled; then
+    error_exit "could not execute rustc binary \"$rustc\""
+  fi
+  rust=disabled
+fi
+if test "$rust" != disabled && test -z "$rust_target_triple"; then
+  # arch and os generally matches between meson and rust
+  rust_arch=$host_arch
+  rust_os=$host_os
+  rust_machine=unknown
+  rust_osvariant=
+
+  # tweak rust_os if needed; also, machine and variant depend on the OS
+  android=no
+  case "$host_os" in
+  darwin)
+    # e.g. aarch64-apple-darwin
+    rust_machine=apple
+    ;;
+
+  linux)
+    # detect android/glibc/musl
+    if check_define __ANDROID__; then
+      rust_osvariant=android
+      android=yes
+    else
+      cat > $TMPC << EOF
+#define _GNU_SOURCE
+#include <features.h>
+#ifndef __USE_GNU
+error using musl
+#endif
+EOF
+      if compile_object; then
+        rust_osvariant=gnu
+      else
+        rust_osvariant=musl
+      fi
+    fi
+
+    case "$host_arch" in
+    arm)
+      # e.g. arm-unknown-linux-gnueabi, arm-unknown-linux-gnueabihf
+      write_c_skeleton
+      compile_object
+      if $READELF -A $TMPO | grep Tag_API_VFP_args: > /dev/null; then
+        rust_osvariant=${rust_osvariant}eabihf
+      else
+        rust_osvariant=${rust_osvariant}eabi
+      fi
+      ;;
+
+    mips64)
+      # e.g. mips64-unknown-linux-gnuabi64
+      rust_osvariant=${rust_osvariant}abi64
+      ;;
+    esac
+    ;;
+
+  netbsd)
+    # e.g. arm-unknown-netbsd-eabihf
+    test "$host_arch" = arm && rust_osvariant=eabihf
+    ;;
+
+  sunos)
+    rust_machine=pc
+    rust_os=solaris
+    ;;
+
+  windows)
+    # e.g. aarch64-pc-windows-gnullvm, x86_64-pc-windows-gnu (MSVC not supported)
+    rust_machine=pc
+    if test "$host_arch" = aarch64; then
+      rust_osvariant=gnullvm
+    else
+      rust_osvariant=gnu
+    fi
+    ;;
+  esac
+
+  # now tweak the architecture part, possibly based on pre-canonicalization --cpu
+  case "$host_arch" in
+  arm)
+    # preserve ISA version (armv7 etc.) from $raw_cpu if passed via --cpu
+    rust_arch=$raw_cpu
+    test "$rust_arch" = arm && test "$rust_os" != linux && rust_arch=armv7
+    ;;
+
+  mips|mips64)
+    # preserve ISA version (mipsisa64r6 etc.) and include endianness
+    rust_arch=${raw_cpu%el}
+    test "$bigendian" = no && rust_arch=${rust_arch}el
+    ;;
+
+  riscv32|riscv64)
+    # e.g. riscv64gc-unknown-linux-gnu, but riscv64-linux-android
+    test "$android" = no && rust_arch=${rust_arch}gc
+    ;;
+
+  sparc64)
+    if test "$rust_os" = solaris; then
+      rust_arch=sparcv9
+      rust_machine=sun
+    fi
+    ;;
+
+  x86_64)
+    # e.g. x86_64-unknown-linux-gnux32
+    test "$raw_cpu" = x32 && rust_osvariant=${rust_osvariant}x32
+    ;;
+  esac
+
+  if test "$android" = yes; then
+    # e.g. aarch64-linux-android
+    rust_target_triple=$rust_arch-$rust_os-$rust_osvariant
+  else
+    rust_target_triple=$rust_arch-$rust_machine-$rust_os${rust_osvariant+-$rust_osvariant}
+  fi
+fi
+
+##########################################
 # functions to probe cross compilers
 
 container="no"
@@ -1604,6 +1748,9 @@ if test "$container" != no; then
     echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
+if test "$rust" != disabled; then
+  echo "RUST_TARGET_TRIPLE=$rust_target_triple" >> $config_host_mak
+fi
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
@@ -1735,12 +1882,20 @@ if test "$skip_meson" = no; then
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
   test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
+  if test "$rust" != disabled; then
+    if test "$rust_host_triple" != "$rust_target_triple"; then
+      echo "rust = [$(meson_quote $rustc --target "$rust_target_triple")]" >> $cross
+    else
+      echo "rust = [$(meson_quote $rustc)]" >> $cross
+    fi
+  fi
   echo "ar = [$(meson_quote $ar)]" >> $cross
   echo "dlltool = [$(meson_quote $dlltool)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
   echo "pkgconfig = [$(meson_quote $pkg_config)]" >> $cross
   echo "pkg-config = [$(meson_quote $pkg_config)]" >> $cross
   echo "ranlib = [$(meson_quote $ranlib)]" >> $cross
+  echo "readelf = [$(meson_quote $readelf)]" >> $cross
   if has $sdl2_config; then
     echo "sdl2-config = [$(meson_quote $sdl2_config)]" >> $cross
   fi
@@ -1770,6 +1925,9 @@ if test "$skip_meson" = no; then
     echo "# Automatically generated by configure - do not modify" > $native
     echo "[binaries]" >> $native
     echo "c = [$(meson_quote $host_cc)]" >> $native
+    if test "$rust" != disabled; then
+      echo "rust = [$(meson_quote $rustc)]" >> $cross
+    fi
     mv $native config-meson.native
     meson_option_add --native-file
     meson_option_add config-meson.native
@@ -1788,6 +1946,7 @@ if test "$skip_meson" = no; then
   test "$pie" = no && meson_option_add -Db_pie=false
 
   # QEMU options
+  test "$rust" != "auto" && meson_option_add "-Drust=$rust"
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi" "-Db_lto=$cfi"
   test "$docs" != auto && meson_option_add "-Ddocs=$docs"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
diff --git a/meson.build b/meson.build
index 47a9c04e322a2171daf188eb62b7b4ad941c9ea8..065739ccb7300f4f0d487602485802f9f68fb095 100644
--- a/meson.build
+++ b/meson.build
@@ -4304,8 +4304,9 @@ else
 endif
 summary_info += {'Rust support':      have_rust}
 if have_rust
-  summary_info += {'rustc version':      rustc.version()}
-  summary_info += {'rustc':      ' '.join(rustc.cmd_array())}
+  summary_info += {'rustc version':   rustc.version()}
+  summary_info += {'rustc':           ' '.join(rustc.cmd_array())}
+  summary_info += {'Rust target':     config_host['RUST_TARGET_TRIPLE']}
 endif
 option_cflags = (get_option('debug') ? ['-g'] : [])
 if get_option('optimization') != 'plain'

-- 
2.45.2
