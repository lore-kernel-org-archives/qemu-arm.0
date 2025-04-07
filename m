Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426506njd;
        Mon, 7 Apr 2025 07:48:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad0:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-739e711a95amr16045625b3a.16.1744037291240;
        Mon, 07 Apr 2025 07:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037291; cv=none;
        d=google.com; s=arc-20240605;
        b=k9UBpE9QqBUHgHKj11TROwlP3v6Y6g4yQHLNvV5FeNgm43W/7HKkeYHcbahMnkQZjp
         qOEVbVseZfSDsvA/nBB8b5KB92pTAUFGRs8UOLMB3BjXPoUJPBh2fOblPSmyewhr1KMs
         vNILFi/Bo18AovgRuj1Y0QmGgvhp/kU2wlsppTleNmT5nB1YE389krWKSPBcbYVpPfP6
         4oQkkkHVg0iSdeT7jfWqMQgfAJQ17MhJF5q25DxpltfzrG4UrKfAKDsmjNZshS4NVpJN
         qvIViQ5nrLWJUGs+eRTk2hV5zAQX9pGvjVlm+j6wrVTzRCzwyZkCi1EVPKOxMQeAQPXy
         7Igw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eS7eXR/+DdOMAXfY7Q+DNRv1hMrXf+iqTPbLWHVDLlk=;
        fh=XfhpurMQll4IN3H754zjXP6IQEBRNGw1MgqvaHS6eNw=;
        b=WOUp6667DPDdDa8xWuGHEbOWrnCmd3Y3lId5A9wIVtjL0i/3sEU8J6ULoGSPFLBRky
         XENCc4NZVWocarO6KegoGTfWW+49EobcW7E7yv+sCDk81UM57CjFXqvnwS1GhFX6dLmt
         YvBWhkDkOsJ3G5gT+jE7gbza7x/h/ggBD7jU2m1yM3qthD93q/2H1K/1U5VWPKQYH8qa
         OsJNpwarNyT3khDFcfKoAXMEiG2MmqQmtncfL17Xmtx1keNvZBr5ayjcnf6sME+/tJZ1
         Mr/+v5gL7SAmgHZsqX624Szo85QIPHhNVf+ocEvGG5dTqoau0sLbxNUCBZk5FQMeDzzh
         5dMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKAnpOEZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739dab0b232sor4600171b3a.0.2025.04.07.07.48.11
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKAnpOEZ;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037291; x=1744642091; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS7eXR/+DdOMAXfY7Q+DNRv1hMrXf+iqTPbLWHVDLlk=;
        b=kKAnpOEZzbeniR55FWQzt6sZ7pl2TVpcki1mpPKt73tWlyBc/FDvjakPDRSB7pgO2N
         4JvVi3ZiDFge1bvvaMUaGprzeJCnk2MSI0B7G5WCGhnx3wItzGTr+IQ7aBOveGGh/pvR
         QtKgObZeP0tI5l5Fs0/W0rDcl458Jt8bI/D5Rg/l3LBd6T+E0j4a2Ae35kmKdQ9Q/z1f
         bYIWO9x5GIzxCLgnArPuBrC6BUixLt0iqOH47Pc7bHuzF05iu8MmAUzCaABDa8YvKPFr
         vxmEqZTcWKyjXMiQQ0zrmoj1IsqP9iBSbeuk3Pk4Egl4+nd5CIGpnDBDbN+TOUhKZbmk
         AAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037291; x=1744642091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS7eXR/+DdOMAXfY7Q+DNRv1hMrXf+iqTPbLWHVDLlk=;
        b=As5xkvAY3n6A0h9j5Y5ire5KbUWn1anlRw9v/ty2eUjNzejD5xcHoQMXnn7PRsygFY
         NFCU10c/JlK8rx4OKMx2rzRfWcQD9EUS5D6PNrYNgp+EL1+H3pWI2tk7gUeFO7BwuNbs
         I1vW5z3lv7t5XpGJvw/kWm56ifsnGZ9Th4sVpqOtjVlnMVpcJMlVPll8q+98pHdhp4by
         EaSLJYKOV9XEkZP0bHjOiLAcIOVNm7W3mSZFcF/6Qyit8WHGKQF64+AqNfZy6Epndg5E
         Qz1QCVhh5tG2a0lzDz4J5q4LOqZ3Gkem7Jb8NYUgVGKen50UgfwV/zajQs3JutwCufYT
         vq4A==
X-Forwarded-Encrypted: i=1; AJvYcCUXskTfGLJikJYH9b6y3zkOVpTI3Gw7QkZQOglZTGf06qUxb3ZaODeGm6q4pOWLVVXPyvQMPCnd@linaro.org, AJvYcCV/0Ih29flnkOKtNpZEWuVt2qkmy7CM9QLwjivpGDy/uKRPbsb4vsMTJvReX0hC0E1uhhrtoaWlVAVhfAuh@linaro.org, AJvYcCXkvQA/1syyRtFgLtPm0t45WIW18QqderUVWs1rrbIe159hAxLzm0SlPxBqCtIpt65IN5LBbi4dsG6cxKzLfoGOREM=@linaro.org
X-Gm-Message-State: AOJu0Yy2p26wbmg2V4wVsf3znrRMLfJVLoL3uNqZijlCcUVC5I7ZXmv+
	GD5Ps+JfbBGnYLLy2RHOJRy6LQ4eMJrsNc5GxkHJbNb3M20MoqwU
X-Gm-Gg: ASbGnctBhsUn9FYkZXulqGHdPL83O1f2goBxr6+WUmeYyIrSzZG0+gYnZCK4FMoBxxd
	/NlmLAqlQar4gdJVAV/r9aP8QNl6XEVY0Dl6SHu5AoAHDZoXnM1mCMuDwFUCRVArQTN7lHY+rr3
	0SIhUAJA5UE1Nwa+3dNg7YAWsa/U+WUyQHAcyNPTT0xAgKX6Que5tTwoSrk9cT1PRJ15BwkP1BT
	ld9j2OuqKNnQuOSCFpeg0W+6tS8JC2a6qMRPvC8PQKMa90rqb4WSyteeYIwrTW38iD9NFJ1W/wU
	WmksAxR1HKRlUzTQvMapWZxcziZCDb8/zXuU6uj18LNUGlXwJyeTGTKMLdarCw==
X-Google-Smtp-Source: AGHT+IEBJV8PXN2+xgPpGnGGxW+rcmF9NYagYDrP8jIyQSc8TCL+FbPaJa4t0px/C7vZ0Fzdop2MCQ==
X-Received: by 2002:a05:6a00:1411:b0:732:5164:3cc with SMTP id d2e1a72fcca58-739e711fcf5mr16357894b3a.19.1744037290570;
        Mon, 07 Apr 2025 07:48:10 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:10 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 05/10] meson: Add wasm build in build scripts
Date: Mon,  7 Apr 2025 23:45:56 +0900
Message-Id: <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BRS9EjOqtjH2

has_int128_type is set to false on emscripten as of now to avoid errors by
libffi. And tests aren't integrated with Wasm execution environment as of
now so this commit disables tests.

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 configs/meson/emscripten.txt  |  6 ++++++
 configure                     |  7 +++++++
 meson.build                   | 14 ++++++++++----
 meson_options.txt             |  2 +-
 scripts/meson-buildoptions.sh |  2 +-
 5 files changed, 25 insertions(+), 6 deletions(-)
 create mode 100644 configs/meson/emscripten.txt

diff --git a/configs/meson/emscripten.txt b/configs/meson/emscripten.txt
new file mode 100644
index 0000000000..054b263814
--- /dev/null
+++ b/configs/meson/emscripten.txt
@@ -0,0 +1,6 @@
+[built-in options]
+c_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
+cpp_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
+objc_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
+c_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
+cpp_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
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
index 41f68d3806..bcf1e33ddf 100644
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
@@ -514,6 +516,8 @@ ucontext_probe = '''
 supported_backends = []
 if host_os == 'windows'
   supported_backends += ['windows']
+elif host_os == 'emscripten'
+  supported_backends += ['fiber']
 else
   if host_os != 'darwin' and cc.links(ucontext_probe)
     supported_backends += ['ucontext']
@@ -2962,7 +2966,7 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
     return 0;
   }''', args: qemu_isa_flags))
 
-has_int128_type = cc.compiles('''
+has_int128_type = host_os != 'emscripten' and cc.compiles('''
   __int128_t a;
   __uint128_t b;
   int main(void) { b = a; }''')
@@ -4456,7 +4460,9 @@ subdir('scripts')
 subdir('tools')
 subdir('pc-bios')
 subdir('docs')
-subdir('tests')
+if host_os != 'emscripten'
+  subdir('tests')
+endif
 if gtk.found()
   subdir('po')
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 59d973bca0..6d73aafe91 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -34,7 +34,7 @@ option('fuzzing_engine', type : 'string', value : '',
 option('trace_file', type: 'string', value: 'trace',
        description: 'Trace file prefix for simple backend')
 option('coroutine_backend', type: 'combo',
-       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
+       choices: ['ucontext', 'sigaltstack', 'windows', 'auto', 'fiber'],
        value: 'auto', description: 'coroutine backend to use')
 
 # Everything else can be set via --enable/--disable-* option
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 3e8e00852b..cbba2f248c 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -80,7 +80,7 @@ meson_options_help() {
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
   printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
-  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
+  printf "%s\n" '                           auto/fiber/sigaltstack/ucontext/windows)'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
   printf "%s\n" '                           package'
   printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'
-- 
2.25.1
