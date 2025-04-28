Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5784036njd;
        Sun, 27 Apr 2025 23:42:03 -0700 (PDT)
X-Received: by 2002:a17:903:228a:b0:224:1220:7f40 with SMTP id d9443c01a7336-22dbf4dd7ccmr144438555ad.3.1745822523066;
        Sun, 27 Apr 2025 23:42:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745822523; cv=none;
        d=google.com; s=arc-20240605;
        b=YkVFBYd4VIlb1o8Yz6ydXjVCxtv6CnNlxrvyeUX3d/Y4XxjF0dYFw8Sh3WR+xyuOKS
         CftVwEG3OkY7Qb/hmvH5N1mB55E/ipaZttugKLgRO64D4CbgmgBGlJiwoWCdAVezisUR
         vVz+acRUfsv0I5Myf9AExrEhGMiWAZARevqKAsKlufLkZQkbFwi9/VJE2i0RlVNM+NG7
         EW5I/1y3Q+Wug0dcVJPddFDmh7mBI8PcY76BmyXAcrbDborC0QMwKsafH8F4B2KVi8Pj
         y0/NjKGj2Spjsq4w/8hUItKwNr/hWCsvhunwzrXJU8gLw8nOphJSRq/AhbR6ZoEYSnJN
         Gcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=USb/0rtkWR/VNf4TYcjMJuPMpxbofqqsc6ztVaeb2OQ=;
        fh=V8AomNeo5R+kfVpPKQYot2gP3c5/Q4I/t5psieJhXUg=;
        b=NacN1fp/0eBN1HVGKNNIm9MqAPjHe4HtC+9MKtRHqOwY/h9teZJi15oiz4hbtI1/co
         fTDY29zM8hggNZ8mxX5kItEy/m2GbISbi7BwZYW5pdiI6ZSvERfZCAs+9uihlcXB7SuX
         wDF5ZnPn+TafRvfyTh/bT6ioLNgFl7o7gvOiKbMfM3or/0Xwd4CujevjTgjkpoD4Rh8z
         8Uq2s+OHPpfzwgYZYBxPmGA31diO0mG+tD1qVrgUTGjwpbFV67m4eljpPmcL92RH8DD6
         VGZSZy1Qp38vqi+OxFAUTcKIKNcSIYQtKW2572gri4xsT6k5U/X0YAVTzuwiv/dTLg0N
         A7ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QThrFFK7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22db4d6da33sor56548245ad.2.2025.04.27.23.42.02
        (Google Transport Security);
        Sun, 27 Apr 2025 23:42:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QThrFFK7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745822522; x=1746427322; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USb/0rtkWR/VNf4TYcjMJuPMpxbofqqsc6ztVaeb2OQ=;
        b=QThrFFK7eLBOr9EoPbCufywLaRMg3bTBvrBKSbPO8Debn5g8DdpIRp6013hvWH4Qc/
         3bmDSPD7CPd3Wq3W+i2AnpuSAEk7S8QaeSw2wxSQjwmOy9XoTtTj1m6eWakz1rJVyC6M
         rcR3nN+Q8mmhi8lr8A6V8vHPtJs1EUXkmmfwrXFdPsE00DJkIScsO+fMXKxGc69zf7nC
         fKgCc4Or2IRG+KATgFftAjrsgmS4UHX91ZjMdkLfzfel5d8gNEaQgu+i64n9Sk3Wppl+
         7ChxWppYoDu9HW9973hO3yfGc0a+p0HcVgCr8NDs08RpTHwfzz8C3Mrm+UMeOFVmF6SC
         3Mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822522; x=1746427322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=USb/0rtkWR/VNf4TYcjMJuPMpxbofqqsc6ztVaeb2OQ=;
        b=KFobazxaBnDWzKsoyTZUcpK/oLe0HYeXBY9lgsM35gKMbq5XMOvKHcPUZ7t9XqoBYi
         bkzlMQcxuOTtx49rl1tJvkzy44nyxmLehTjpPzSI+7t61ktiUABStJwM2k/zkMLAE5uN
         arW7eB91QN9z1vQ5/kej8S+mmyK3c/WO4f9E8z3pvFniDlLqUU3FHJl6bU8961lVqUzP
         9CPutjlcyJNEOIG1pqkaZcqgNG6IKH1Smk4GvqWvFcsJiKqo7OSBcStIiVRzANC9HN1a
         2CxDvAVnYOQ1vF+coqxfYNcnRVGKapqG2mAegEF06gUjVsCyi+1IkJwytssAJv02fzoH
         jDrw==
X-Forwarded-Encrypted: i=1; AJvYcCUjO7AYFRTrACUm0wJohzsbk8vYDTM5lJCRy72d74Sw3p6krxQzXtwM7zqdER7DHWsjuGxnZzWk@linaro.org, AJvYcCVyha+YolO4pPlaKv/H4Bhqp+z4FceTMwWg0EdB4wcNX0KYc2eA6NKNFpscQwq4Y4z6e7yaAiU8hqy/Lixh0HndeQ==@linaro.org, AJvYcCW9wG2ug72GRJZ81sN6ReZjWLMv4jD2VWc4P/SORmawwlq5KlF2JPhgpIBps5QqyJ0nh/SqNNxhhxHSJ14MjyMe/2c=@linaro.org, AJvYcCXikfxzMCyOc5Sk8FSL5pvA1BXkJx6e6AvQhET8ZhDeapFgdxi4V9QzUUtc/tVYlYGED4C0IA4OHCgU9lVj@linaro.org
X-Gm-Message-State: AOJu0YzZjFsqvU26OFEMCqHMS4mGbhJ8HI/ll7Epn5WNOBoszG/wYOpT
	pnxzvmTw1idLovM3xloXS9r94A7maY13uR0wC0jFQCBCx/3pF+CX
X-Gm-Gg: ASbGnctuHP39NL8zACScOijEKYXSSjPY2Uv7MVhY3TyAuoCJDILOdeL81PvIAHDRles
	6tadrMhoTuHsHb3mKZqZvLUwuBEjvpE3ar7sP7C72SzPHjMu0/rscaXPFrKelLpLe9m7TfPu8UB
	MTHmJ+iu7dVYqdtIRK3+2K/f4C5AGmV69Bc6ugUVHc9X+H+t6n930Wk4WLPBjANwZh/y1skBw/C
	zWLzRWwvUVJog00Jr7L3bRmArNHALYb94ZtS1+SFWG+906z9AsrxhvsyYi3hgmRCv+SKUi7BTKF
	2ebQ0YoTAEU9uMeu91SG1s8srooQ53h70T7AHw==
X-Google-Smtp-Source: AGHT+IGs82alOJyqw/R0MDNRSsdHpo1AL/wVENeH0XecRcGHGHg3g5++dzGdl1co7KKMCDtqIoUxog==
X-Received: by 2002:a17:902:db0f:b0:224:1d1c:8837 with SMTP id d9443c01a7336-22dbf5ea85amr162001735ad.19.1745822522442;
        Sun, 27 Apr 2025 23:42:02 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:bcb:2cf3:f1b5:b7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbe328sm74721215ad.88.2025.04.27.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:42:01 -0700 (PDT)
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
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v3 18/20] meson: Add wasm build in build scripts
Date: Mon, 28 Apr 2025 15:39:07 +0900
Message-ID: <ad03b3b180335f59e785e930968077bf15c46260.1745820062.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745820062.git.ktokunaga.mail@gmail.com>
References: <cover.1745820062.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: L2bXmI4ipJyX

has_int128_type is set to false on emscripten as of now to avoid errors by
libffi. Tests are disabled on emscripten because they rely on host
features that aren't supported by emscripten (e.g. fork and unix
socket).

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 MAINTAINERS                   |  1 +
 configs/meson/emscripten.txt  |  8 ++++++++
 configure                     |  7 +++++++
 meson.build                   | 29 ++++++++++++++++++++++++-----
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.sh |  2 +-
 6 files changed, 42 insertions(+), 7 deletions(-)
 create mode 100644 configs/meson/emscripten.txt

diff --git a/MAINTAINERS b/MAINTAINERS
index 750afd44c5..dd5a97ac36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -634,6 +634,7 @@ S: Maintained
 F: include/system/os-wasm.h
 F: os-wasm.c
 F: util/coroutine-wasm.c
+F: configs/meson/emscripten.txt
 
 Alpha Machines
 --------------
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
index 000309cf61..de12241c62 100755
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
index bcb9d39a38..fc38b02cee 100644
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
@@ -902,6 +909,10 @@ if get_option('tcg').allowed()
     if not get_option('tcg_interpreter')
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
+  elif host_arch == 'wasm32'
+    if not get_option('tcg_interpreter')
+      error('WebAssembly host requires --enable-tcg-interpreter')
+    endif
   elif get_option('tcg_interpreter')
     warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
@@ -2962,7 +2973,9 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
     return 0;
   }''', args: qemu_isa_flags))
 
-has_int128_type = cc.compiles('''
+# has_int128_type is set to false on Emscripten to avoid errors by libffi
+# during runtime.
+has_int128_type = host_os != 'emscripten' and cc.compiles('''
   __int128_t a;
   __uint128_t b;
   int main(void) { b = a; }''')
@@ -3777,6 +3790,8 @@ if have_block
   # os-win32.c does not
   if host_os == 'windows'
     system_ss.add(files('os-win32.c'))
+  elif host_os == 'emscripten'
+    blockdev_ss.add(files('os-wasm.c'))
   else
     blockdev_ss.add(files('os-posix.c'))
   endif
@@ -4515,7 +4530,11 @@ subdir('scripts')
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
-- 
2.43.0
