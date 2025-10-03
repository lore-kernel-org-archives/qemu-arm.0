Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A80ECCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:19:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gcp-0004LX-1B; Fri, 03 Oct 2025 10:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcl-0004JW-HZ
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:08 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gcS-0000MA-RI
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:07 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b57bf560703so1697262a12.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759501117; x=1760105917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Av0b4w51KjBkrgO+Sf3v3FDDHs9Dpny2C0CPcpUwJwo=;
 b=xp7Gy3ZVDpB5RPgEPNBuhspkUNFyz92G4ujt6Uoyj08nhO2pge1M4W4CJObtlYQ/Yp
 CwT7Cxe3a6zZQu6ijM9H1E60zRMQL9QPDEC8OSTCjmGfEM4rJz3rYlNPhbyKvmK1ZE+X
 hhfXCZI+EIKLwjRh07F+9N9meR2plV6lxMaBhE3sEYUkNe1WRo51V6TihJdPVT36bsZW
 /vlvZbdYsYFreJ3fuDuPdpi5LjffqWFjmrQAudMK5Cbybe3UIQYPdaPdtXTfOJFSyPRY
 M/lhjl21i6eyJEvr0lthbL3KG//cHhrEC5HGxWXvHiwRvWb6GeOBTjOwKeCsWRrxaEfb
 eE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759501117; x=1760105917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Av0b4w51KjBkrgO+Sf3v3FDDHs9Dpny2C0CPcpUwJwo=;
 b=sPOy7njEOu450dsHPo9P+JO3EJI9yKe5KukS/if/zlqkmKUlWcbqdL2x86mUrFv6af
 pGS2m32hPWKLGPVWBB/5nHisQiqiOX77ofU5p/fSq62lf46OwjoAszCRJuSnyYsDjXAp
 lCmuV64zf9xVwu8xoCZXdaBgRBNTMY+LIuFd6f6dG3lFya9B97k3cGdWHw3Sc8eLlV2+
 gIVdp9cslDyYjLVn8QQH4h6RWz0/Fy0uWxujjKmbKVBvrofBz7+90kM76kq3KxCNkTT3
 sPdCDC6zFqO7I7yEwBfGW3O3kIw8vh5lFz9S1PmNrwXl2y4uo+xKpIVPNKmjtT0QhZgr
 T9Fg==
X-Gm-Message-State: AOJu0Yy9Lv7GY96C80LX1jmO81dX4GOc8mD7SS9IoAxgqDaLAMEh1Al4
 7Gm/+64yfSDyZnoaOQ+iOojN8GToNswOOxk7x9SypqfmJdUn8X8jq08WleKhWaUgoKZNVWfDP93
 z1Qg8
X-Gm-Gg: ASbGncvlFF6VIBaT6kLbghlg6r2RfFIto+pUZ3ITz087ZPkKz3J3iqTPwuz2WVoomxH
 pHD4AhWw0QWb1h4JOENP8lw2R4XB1HnocRD/fWRE8YItQ7oo8lCE0pDpCCXdvRLUt8IZJcZaoGG
 oyVLwyRj8yib+06uVowSX5MnyosM0T9vPdhGnYBupdGt93yUXPwloAt9EXBxLRl5JUx8t2pQCQL
 30NquEJCQzEoFnVyTzTyRuEpZjK4NGVF4bxZjF4kRuyvnqH1djiwrKpxGK0JiA9e8fAGJFm+Hed
 42FJ0L0uOuvXztT2sv1ehTi0OQTwP0gOSQAqdibGm5F7uJ2TPzh82mP9Zk83jW5HhkEBv5FTfl8
 y2Q6LmxedRc/2bGeswyxh2WyOuZG4tFg9RdXbfWFFtVNGMSQoeATYcNsbBz/Mu3wn6XQ=
X-Google-Smtp-Source: AGHT+IEFK70Onc6rTTcd0gZl8vdEKB0vu7pZJRc7zPQ4F1RR7HmgY5MP1+l2uq1psPIAkBJnLvqhIg==
X-Received: by 2002:a17:902:f612:b0:280:4b60:5570 with SMTP id
 d9443c01a7336-28e9a65167emr38681875ad.52.1759501116947; 
 Fri, 03 Oct 2025 07:18:36 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm51759645ad.102.2025.10.03.07.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:18:36 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 3/9] tests/functional: Provide GDB to the functional tests
Date: Fri,  3 Oct 2025 14:18:14 +0000
Message-Id: <20251003141820.85278-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003141820.85278-1-gustavo.romero@linaro.org>
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The probe of GDB is done in 'configure' and the full path is passed to
meson.build via the -Dgdb=option.

Meson then can pass the location of GDB to the functional tests via an
environment variable: QEMU_TEST_GDB.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 configure                     | 2 ++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 2 ++
 tests/functional/meson.build  | 6 ++++++
 4 files changed, 12 insertions(+)

diff --git a/configure b/configure
index 78445cbb4b..21d1679f58 100755
--- a/configure
+++ b/configure
@@ -2003,6 +2003,8 @@ if test "$skip_meson" = no; then
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
   test "$plugins" = yes && meson_option_add "-Dplugins=true"
   test "$tcg" != enabled && meson_option_add "-Dtcg=$tcg"
+  test -n "$gdb_bin" && meson_option_add "-Dgdb=$gdb_bin"
+
   run_meson() {
     NINJA=$ninja $meson setup "$@" "$PWD" "$source_path"
   }
diff --git a/meson_options.txt b/meson_options.txt
index fff1521e58..5bb41bcbc4 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -36,6 +36,8 @@ option('trace_file', type: 'string', value: 'trace',
 option('coroutine_backend', type: 'combo',
        choices: ['ucontext', 'sigaltstack', 'windows', 'wasm', 'auto'],
        value: 'auto', description: 'coroutine backend to use')
+option('gdb', type: 'string', value: '',
+       description: 'Path to GDB')
 
 # Everything else can be set via --enable/--disable-* option
 # on the configure script command line.  After adding an option
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 0ebe6bc52a..f4bd21220e 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -58,6 +58,7 @@ meson_options_help() {
   printf "%s\n" '  --enable-ubsan           enable undefined behaviour sanitizer'
   printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
   printf "%s\n" '                           firmware]'
+  printf "%s\n" '  --gdb=VALUE              Path to GDB'
   printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
   printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
   printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
@@ -323,6 +324,7 @@ _meson_option_parse() {
     --disable-fuzzing) printf "%s" -Dfuzzing=false ;;
     --enable-gcrypt) printf "%s" -Dgcrypt=enabled ;;
     --disable-gcrypt) printf "%s" -Dgcrypt=disabled ;;
+    --gdb=*) quote_sh "-Dgdb=$2" ;;
     --enable-gettext) printf "%s" -Dgettext=enabled ;;
     --disable-gettext) printf "%s" -Dgettext=disabled ;;
     --enable-gio) printf "%s" -Dgio=enabled ;;
diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 2a0c5aa141..725630d308 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -77,6 +77,12 @@ foreach speed : ['quick', 'thorough']
     test_env.set('PYTHONPATH', meson.project_source_root() / 'python:' +
                                meson.current_source_dir())
 
+    # Define the GDB environment variable if gdb is available.
+    gdb = get_option('gdb')
+    if gdb != ''
+      test_env.set('QEMU_TEST_GDB', gdb)
+    endif
+
     foreach test : target_tests
       testname = '@0@-@1@'.format(target_base, test)
       if fs.exists('generic' / 'test_' + test + '.py')
-- 
2.34.1


