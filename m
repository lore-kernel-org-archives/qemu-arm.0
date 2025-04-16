Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3179571njc;
        Wed, 16 Apr 2025 01:17:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3920:b0:736:3c77:31fd with SMTP id d2e1a72fcca58-73c267ecd0bmr1234143b3a.23.1744791435568;
        Wed, 16 Apr 2025 01:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744791435; cv=none;
        d=google.com; s=arc-20240605;
        b=ggEjOkvU0bAEWQkAri7PNYPfS0QuSx+rKKHbPQf9jcUkoasHTkp6968ncNTHa4vOkZ
         exRvFWxRNHTeM+ewf+iD2IGnQUYqDY8WB7MzQo9c3Vw43Img+sSfNdKCi+JoogaV6iQc
         Ck8csZmghvuHxDvuIJsA07MouMYZX4vYrCPIbsmIUjfMBq9i9vChtPyi4sEFzdSTafrk
         n+0PuznT5qs34TJlUvqHR5yJ0r7djT47N4CHTgQY4S5vhsMoSNa+GQc4qCwJZ8UEwB5G
         OrPB3TujE2e0kmwPBwdK7s/3oH7yBivhzQ+fUZcQdrfjdJ+G5GJ7TPQmGUG6K3bzZUKV
         Clgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CZIwhkm1gYZydgV34GIP0NP1/+QooaD1oJOOb4q2f3I=;
        fh=c76fm3XX9ilpu0xIRplnnxztMEuTTppCraLiORRZCPg=;
        b=UWASsWP7TzT+C31RPjnCDOFTs02bSG4VGM39nRqzsQrLqJryg5S9czdpP47vysv9eP
         SrCNfTKxsKFNAZANkvXK5YL6H/fGJNG+jhCxnmoi87vYCDf/BIUzAwlL/RrWufSsPaIO
         jpjI0XX0ktTdTd6sW+V+j8lgBOEznKeKG/b1l1Ydhp0B5bfvbD+5RpA/uyTbdn5WuKbt
         KWudQDD/QVU8L5dLsrwa1hbAcnS32C6Do0WA6OkQPlt8I/PVCbrZyjuwFFErlbH97qJR
         lHai/ayd7OhxLOOEQdeGNdwQxTkT+9jecTkwtzdes/3YfOuEi02ANbvLiPjRqoCE03cC
         ct+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMDml5Zs;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-73bb1e4765dsor8656154b3a.7.2025.04.16.01.17.15
        (Google Transport Security);
        Wed, 16 Apr 2025 01:17:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BMDml5Zs;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791435; x=1745396235; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZIwhkm1gYZydgV34GIP0NP1/+QooaD1oJOOb4q2f3I=;
        b=BMDml5ZsB/FH2Kbycq0POP5NV6jDBaFy/82Du0pJ04wx++gj+XF4h7PzbmisH+pq3W
         EpRVrO2IyuhNhl8KquXz0ig7hs9qNgnuG7J1pOAQtfHk+UlLrM2nNtKJURzqq4UM+OiV
         Ohq3IVg+dR4XoF30660i18Rek1m6vqgEnzv/RzXcC5XdEbhwUfnvuxx9aSswTN3BaeB9
         12ql80y23t0Q5VjtVC4K91K2kWzNKk1eqmqYjI7XTtw6HUl2jwJ8anODOGigJVQPNfDH
         LXUx9b/VMIAF0kwWs56IB6XPCa07YyAw/QgF4poBXlsUiRzlctWtXMFCFd3GwLqf9KjR
         LpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791435; x=1745396235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZIwhkm1gYZydgV34GIP0NP1/+QooaD1oJOOb4q2f3I=;
        b=gwrclh54gBuA7z5dtNTW8hmRnMoRRaPt042nHlYm5xOE/zbZhj7SB4OoKN/PeMWUXL
         sau/OuN/AatgykL6motnpkP1q9d4wE5/TaJ7UfpTIWOpWYACeibqd2rTmhIrJ8PnbqO6
         HhVFAdrG5XchMbMfxxQdtZ9fV75PK1fCJO7hl/NIsgfLVtcp1XkdNWJuMt99uQQgjcEe
         iM3BvnNM1qLSgds/aVw9fNjYpU8sxNLOlV6pCvehA6uWPw3NeRlf25BOJMiScOryIID4
         eGqLGpoSCpkR43Spv3tsS8bfh/G6Fd3CAEajjzmVE5nuKNHE32x/i89RfpvAEksHzb7g
         tTuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMnCbc2/x0m8MpFqXhrysc4Qlp4iKD4Cn4hF0DJ2o6LwmXlbL5+4HVVC5zYct3PhQ8acGl8RjknnSmKP528432Rg==@linaro.org, AJvYcCWbH6tMa5oyJu+96AnUKcyFgSHB0R+MH2LD7H+WNH6r0DCxI5Dt5sWoLP83KR2GmdG591J1xdpi@linaro.org, AJvYcCWvUQ1ioLPnGp0HIrJef20v0E2ru9vzieBIzukDe9WO+2skeWsiZOSCu+9m4XoiC9aa9tc6DfAtQoqRvYFO@linaro.org, AJvYcCXuX8SM9/gSY37J5QeJjSOfEvynvQsnyGX7zn59TG8WO4+SRGTFEUkh7uAsjwgGO1nGqj8fxRLhuEIkSySOWlqLq+k=@linaro.org
X-Gm-Message-State: AOJu0YyJbptVjXlP9xWeqCbZNp8OBU9Aa5K77gDemzT82c+UpLYoQ8b7
	1xT6lRR+R+zXEpniXzKTNQA0Ldso7AcJosF433c5x1i7yL2mZMm1
X-Gm-Gg: ASbGncs+Tot4u/5zOIjoI+/Yzb3KuUwTRTuuTRIFX4xiTHeuQlxjGq/kMnLlJPCRe4n
	Z3J/rHiivCN7yfS/LQbjknzh0sFR5OIqRa7JfBYUdi0z3DBwrjFcKiSQmpIxQInJlzLC1LrMwtL
	HnDrxv/Peph+HJunam6m7WdAcGHLhdH+C289P1vuSNP9nsuKDZMYn/aTKI2xAFeNeffnJICF03i
	Ii4MQtpC30TpZw9vkgokeTzlmVuzEh1dCgV3EMwBk6djEkZReKf6xCnePxzgZuf4RvzvSg2ytw9
	aRVQ7TCI9KwI3jh92rI+AVFt+VWBGrybBzYs942QiuCQkmKYgaKpjjGwww==
X-Google-Smtp-Source: AGHT+IGgzIJ5eER9yj0z1vC7FNinP2KD441XkBQRF9R/Tll92nVYI2cqMr8iiCC2EUQts7Tm457VMw==
X-Received: by 2002:a05:6a21:3a8c:b0:1f5:852a:dd8a with SMTP id adf61e73a8af0-203b3fc053bmr1269534637.28.1744791434901;
        Wed, 16 Apr 2025 01:17:14 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:ee5a:e672:7d4c:d43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3263sm9839445b3a.38.2025.04.16.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:17:14 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 17/19] meson: Add wasm build in build scripts
Date: Wed, 16 Apr 2025 17:14:22 +0900
Message-Id: <835dfef61307a941cdb58331607c308238d37e00.1744787186.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744787186.git.ktokunaga.mail@gmail.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /tJyecNau5aA

has_int128_type is set to false on emscripten as of now to avoid errors by
libffi. Tests are disabled on emscripten because they rely on host
features that aren't supported by emscripten (e.g. fork and unix
socket).

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 configs/meson/emscripten.txt  |  8 ++++++++
 configure                     |  7 +++++++
 meson.build                   | 25 ++++++++++++++++++++-----
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.sh |  2 +-
 stubs/meson.build             |  4 ++++
 6 files changed, 41 insertions(+), 7 deletions(-)
 create mode 100644 configs/meson/emscripten.txt

diff --git a/configs/meson/emscripten.txt b/configs/meson/emscripten.txt
new file mode 100644
index 0000000000..4230e88005
--- /dev/null
+++ b/configs/meson/emscripten.txt
@@ -0,0 +1,8 @@
+[built-in options]
+c_args = ['-pthread']
+cpp_args = ['-pthread']
+objc_args = ['-pthread']
+# -sPROXY_TO_PTHREAD link time flag always requires -pthread even during
+# configuration so explicitly add the flag here.
+c_link_args = ['-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
+cpp_link_args = ['-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
diff --git a/configure b/configure
index 02f1dd2311..a1fe6e11cd 100755
--- a/configure
+++ b/configure
@@ -360,6 +360,10 @@ elif check_define __NetBSD__; then
   host_os=netbsd
 elif check_define __APPLE__; then
   host_os=darwin
+elif check_define EMSCRIPTEN ; then
+  host_os=emscripten
+  cpu=wasm32
+  cross_compile="yes"
 else
   # This is a fatal error, but don't report it yet, because we
   # might be going to just print the --help text, or it might
@@ -526,6 +530,9 @@ case "$cpu" in
     linux_arch=x86
     CPU_CFLAGS="-m64"
     ;;
+  wasm32)
+    CPU_CFLAGS="-m32"
+    ;;
 esac
 
 if test -n "$host_arch" && {
diff --git a/meson.build b/meson.build
index 41f68d3806..c9aa5016d6 100644
--- a/meson.build
+++ b/meson.build
@@ -50,9 +50,9 @@ genh = []
 qapi_trace_events = []
 
 bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
-supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
+supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux', 'emscripten']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64', 'wasm32']
 
 cpu = host_machine.cpu_family()
 
@@ -353,6 +353,8 @@ foreach lang : all_languages
       # endif
       #endif''')
     # ok
+  elif compiler.get_id() == 'emscripten'
+    # ok
   else
     error('You either need GCC v7.4 or Clang v10.0 (or XCode Clang v15.0) to compile QEMU')
   endif
@@ -470,7 +472,10 @@ endif
 # instead, we can't add -no-pie because it overrides -shared: the linker then
 # tries to build an executable instead of a shared library and fails.  So
 # don't add -no-pie anywhere and cross fingers. :(
-if not get_option('b_pie')
+#
+# Emscripten doesn't support -no-pie but meson can't catch the compiler
+# warning. So explicitly omit the flag for Emscripten.
+if not get_option('b_pie') and host_os != 'emscripten'
   qemu_common_flags += cc.get_supported_arguments('-fno-pie', '-no-pie')
 endif
 
@@ -514,6 +519,8 @@ ucontext_probe = '''
 supported_backends = []
 if host_os == 'windows'
   supported_backends += ['windows']
+elif host_os == 'emscripten'
+  supported_backends += ['wasm']
 else
   if host_os != 'darwin' and cc.links(ucontext_probe)
     supported_backends += ['ucontext']
@@ -2962,7 +2969,9 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
     return 0;
   }''', args: qemu_isa_flags))
 
-has_int128_type = cc.compiles('''
+# has_int128_type is set to false on Emscripten to avoid errors by libffi
+# during runtime.
+has_int128_type = host_os != 'emscripten' and cc.compiles('''
   __int128_t a;
   __uint128_t b;
   int main(void) { b = a; }''')
@@ -3774,6 +3783,8 @@ if have_block
   # os-win32.c does not
   if host_os == 'windows'
     system_ss.add(files('os-win32.c'))
+  elif host_os == 'emscripten'
+    blockdev_ss.add(files('os-wasm.c'))
   else
     blockdev_ss.add(files('os-posix.c'))
   endif
@@ -4456,7 +4467,11 @@ subdir('scripts')
 subdir('tools')
 subdir('pc-bios')
 subdir('docs')
-subdir('tests')
+# Tests are disabled on emscripten because they rely on host features that aren't
+# supported by emscripten (e.g. fork and unix socket).
+if host_os != 'emscripten'
+  subdir('tests')
+endif
 if gtk.found()
   subdir('po')
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 59d973bca0..45772484cc 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -34,7 +34,7 @@ option('fuzzing_engine', type : 'string', value : '',
 option('trace_file', type: 'string', value: 'trace',
        description: 'Trace file prefix for simple backend')
 option('coroutine_backend', type: 'combo',
-       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
+       choices: ['ucontext', 'sigaltstack', 'windows', 'wasm', 'auto'],
        value: 'auto', description: 'coroutine backend to use')
 
 # Everything else can be set via --enable/--disable-* option
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 3e8e00852b..0568385f00 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -80,7 +80,7 @@ meson_options_help() {
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
   printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
-  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
+  printf "%s\n" '                           auto/sigaltstack/ucontext/windows/wasm)'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
   printf "%s\n" '                           package'
   printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'
diff --git a/stubs/meson.build b/stubs/meson.build
index 63392f5e78..4fd4d362f9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -89,3 +89,7 @@ if have_system or have_user
   stub_ss.add(files('hotplug-stubs.c'))
   stub_ss.add(files('sysbus.c'))
 endif
+
+if host_os == 'emscripten'
+  stub_ss.add(files('emscripten.c'))
+endif
\ No newline at end of file
-- 
2.25.1
