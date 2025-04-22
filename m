Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2137163njd;
        Mon, 21 Apr 2025 22:30:22 -0700 (PDT)
X-Received: by 2002:a17:902:ce86:b0:223:37ec:63d5 with SMTP id d9443c01a7336-22c535a7e80mr208799785ad.28.1745299822269;
        Mon, 21 Apr 2025 22:30:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745299822; cv=none;
        d=google.com; s=arc-20240605;
        b=PC6s6Hk+9z92IEvK7XJJxEV7dWJ3k7rxV2IxB7TpNGhjt9laSc95c07pCaNZYrnHNw
         PgbXLZzoCS2V+c7x2NxEHchN6UvVnXYzEjMdzDOQovd/NA9VPApbTwjjyHtsAl9sv1ad
         3+0p96cBQtAvKhY3YPSs/XaN8hWAWiJQJRvfQPbaqgevm0rAYKagNA24SrgMmJKhdyU/
         PjpMs7qqMI4O7G8ZqR4Zy15N/OtMzAdv+bwEMtCIpTa3d6qZOwl5S+TvgXLqrd7qYgVN
         QOFiOmWBbP54eyF2pnHK6t8FzVYzTTbhXoSTXgxAa2NRtXy2T9RGIGfor2lhzW4tY7t7
         qsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bR9tjJsEvQbCR1Whb3KG+MPH3ySGS1KrwXPV7+RU2DI=;
        fh=mdxRFmQHZ5B1rlKfspdd1A8VS+P8h2s9u6w4qsJCT6c=;
        b=Hqyo7XPLn8Ci+5bhSZLp/85FerSga8Ot+eBz9iratcVNRRQloE61VixS0gEGSxXDkF
         AKNaLCh7CEYEvlPZ1d7+U7+9qXvN/51dtEHtXO8IyuLtCChkaGTWruiLwLxJ/3HpDbFW
         1bLEdR1KwpZ/MfJRcSaZU0b4T6ECjWstDl0hr8YNAfQpV0JrG9QzFILIcSdJsM8wo99e
         V2r3fpRm7EYqMe+JZyPmI8x0aXdp53XjjZk9dpBm6W5LmfXy4jcNgGMd8qAiUzEfhbnK
         DL0y98Kg/PrWjaYzIqYuzk+MP38VT8cQQNNzgohzNn54cXJtGKSPPo+1XycRUNr1iLiY
         aiBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="VXFap/uY";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22c50bdf0c7sor70336465ad.5.2025.04.21.22.30.22
        (Google Transport Security);
        Mon, 21 Apr 2025 22:30:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="VXFap/uY";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745299822; x=1745904622; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR9tjJsEvQbCR1Whb3KG+MPH3ySGS1KrwXPV7+RU2DI=;
        b=VXFap/uYwFRmzudBudLI1/Ni3QV8lIO/rJaRtFJiOxRg3XWLOnPr0f8pMle43EA62Z
         IVki72FICMG421B3Cy46gJsBnemFJHq7UxZfF8CVXbALc3QtYkRg+49umVYKoMnsPgXg
         1tn0gvTU1pOpmfpnmL3a281BAuYFKX1hhcY7GAMbLNDSuFPqMLL43bpoD4QP30+xMeJH
         NPnJCT1hNHifa4wXF23fOwWMMVOEvNkLaQNm8litqJMopPbGYMHcAvqVF2XTp9wEaqWx
         X+fBknuYiEHHTCsImuy/k39KwV/ljTMj/nNgYpSL31/LwpeHu49BQaRtHUNqat9wY7xO
         t6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745299822; x=1745904622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR9tjJsEvQbCR1Whb3KG+MPH3ySGS1KrwXPV7+RU2DI=;
        b=Ug1TAGQJ8Qwsn7oF+r/0mCa41Qk1eZDXyRJhhblrEzttzgIHteBmdVnZ9DLrishXi5
         uQqJRHjQyCltonXz6CzusL0A/lNteIL7U4NRIjT2gqT96khnD1rlcL7bxelzv1bob5Fp
         4aYyfZYkkvmRquhIv7CXlOliflrIPD6iQpObOkG3nQO5ocuIlJgx/iqrFfYe8WRHJhm3
         yoEQjpbQ6Q53YALckdpEct7UnHkAeuqmbtTzc2uLnGHtPsxRX4WAMk+GepyHE0TVGuzt
         dbxSB+H+pOEZp1TKc2NqwaRU+emo4a6GE2+n1VaRl4xn4ZChZBAhQOSsitcPDbLV/yRr
         zbdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa+o3h/S1VAVY++t0Tqp5eHC5dgC8TmveuGWFWALzQ/HzHaaJwiSTeITXqR5ePBRU7zp59foiI@linaro.org, AJvYcCUcbHEUpG7tneQ+tBFiSppdOafXlacwYgG4we3Z+SZutF9cA7khyjcMOrPhc6ruEBzAifuXYo0D9EL3nxus/KiMjQ==@linaro.org, AJvYcCVXJgqatFEH9xx2M05oImnMirWG9KCEXzYe8/ZIDFOtTsYaTEhmDxMMYWgGqhfD8ypI2EMNT+bf4U5UvzPa@linaro.org, AJvYcCVwSEhpQdFrbSkVo4TjynK6UIRRQEr+BjoHwp7IV7N/xFgsfGAPAbZ1K8WwfSt3bmf9ut4HBWpOqNKroYEKOBLJXag=@linaro.org
X-Gm-Message-State: AOJu0Yzcg8xhWiwofhlz+cPiCZnHTBTF+MJqH7QBs6P3ph8KLKEipfgn
	BPkGF0UPhDmNMGOcqJypwAASjYyKvRlOyhw+VAIfqcKFQPNGJbAW
X-Gm-Gg: ASbGnct5z9tZ6QxOwYt5+J9kzOu2boH+paJPRrbXwV3pPEjKoyhB1xupDu7fQxgd0oT
	LdGondZbi6vpfgi9IA5ZKwqz5O0AOvuTezjNy1pYVSWdKzag6zGhwMQx01ZZ9GdMvSXbYHWQShs
	5eIOxqybjIiC3YmrdYFmnc0fIZ/CDsILke0+eHO6xQ33ZmFoRWC1WhmK5Pt7QQyb0gT+29tvUIA
	lJ5mXqhw2kvjeGb6Me+13aBetDMiPsxI4HDw5iaygT1nwt79pDEYyHmacQa6IDnz1pRyKR9t9+u
	KLNbXxJNphJOMhMhQ+at2BlTf3wORK/1TLbuZqZoLKj0/DdVQliR9JoW/I/+qaKl86upxA==
X-Google-Smtp-Source: AGHT+IHWjB+vgR42QzHXmmAa0NzXDyG4fgHjHTbVtmEiLwNlQYswMdR3+qkU+j/iMWiwq0zWpii8HA==
X-Received: by 2002:a17:902:f64c:b0:223:5379:5e4e with SMTP id d9443c01a7336-22c53285b05mr227915295ad.10.1745299821428;
        Mon, 21 Apr 2025 22:30:21 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:e142:4a4f:1ebb:3ca4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4483sm75692085ad.118.2025.04.21.22.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 22:30:20 -0700 (PDT)
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
Subject: [PATCH v2 18/20] meson: Add wasm build in build scripts
Date: Tue, 22 Apr 2025 14:27:22 +0900
Message-Id: <de1f868d4b3b036c2d6373b707157e364609b2b8.1745295397.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745295397.git.ktokunaga.mail@gmail.com>
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rKl8ll+N+HVD

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

V2:
- In meson.build, added a check to ensure TCI is enabled for the wasm build.
- Split the MAINTAINERS file change that adds emscripten.txt from the
  previous 19th patch into this commit.

diff --git a/MAINTAINERS b/MAINTAINERS
index 72319f804e..0fb7fd79b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -625,6 +625,7 @@ S: Maintained
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
index 41f68d3806..a7bffd76d0 100644
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
@@ -3774,6 +3787,8 @@ if have_block
   # os-win32.c does not
   if host_os == 'windows'
     system_ss.add(files('os-win32.c'))
+  elif host_os == 'emscripten'
+    blockdev_ss.add(files('os-wasm.c'))
   else
     blockdev_ss.add(files('os-posix.c'))
   endif
@@ -4456,7 +4471,11 @@ subdir('scripts')
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
2.25.1
