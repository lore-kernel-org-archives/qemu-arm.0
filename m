Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA3ECCD182
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:06:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hQ-0006qI-Tq; Wed, 01 Oct 2025 22:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hG-0006oZ-2r
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48gu-0004hw-Ef
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:05:29 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-271067d66fbso4241655ad.3
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370701; x=1759975501; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Knh+dOfLjacsTDZZt9NezpnCzhWm4W386c3sZeiF8sE=;
 b=v3uyYZZwNFEwoUYItjhO/gOxU/TM5EFmdRmUxcwu65HybFYswyKrRzDR8Hg8FgAzN6
 k98ToJZOUWXVdY48Lv5AU7GzcqwCZ+F4/8ib4VPj3qPuAH2IdThQN9ZGaCVZnSfsq+Eq
 50V2jW2cF1WV5n0MA07IVghemODvUxuMXvl7Qp6HmuqpPBqLPNldJd7x7lOdVt2OP5si
 SHJmrwwvs2etDNC3urUk6ve1PLKCb75Lzt2z8+3fQWWRL6CbjwX9gvDK14hygFb4owEE
 ip3Wrbq4RaPeCbj58hV/VmjWLCetx51NvynaLP/tS44gJMv9tEZmHqT1PJ3/g4O0EYzA
 voyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370701; x=1759975501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Knh+dOfLjacsTDZZt9NezpnCzhWm4W386c3sZeiF8sE=;
 b=EjPbQBHo1JBj6wBWkbsC2idhxpEE3z3azK/IWKmMBLpS0gT5zJxlCslYU/lJ4SSKUY
 DEAJyHnfmG9xBITNPblbO5dRYk5tS5mZmgb0kJteDzoN863mh27dssJJJ+L1syABPs5o
 Aj2RMGJ6pcivFBn0Rd7oZByqSbz6O4hrEAzONrpw3JmCNKqUrmikyHEtv5yFnMXfu5oQ
 9zrhaz7Acgzp7CB+ouW/7QV7vXeYJrr2DKPy9X+ksdg66322bYtG67WbzbE1B1m6q3ew
 6zn6yPibfDgmh4Sf4rwnJK0t9nHobeZ7tRsxsY+PKnKcWLPpwL4LNdjJ6QClEWvVp3W3
 so4w==
X-Gm-Message-State: AOJu0YyAvpLaAl5f9e9QXqVTIELRbh2NvAG790H8N69WsirkGtKNIDOk
 HNKkj7aeJoB9Q6Re+NH+/pivZSrZt0e5dSjDPKCzKSdULtpSP3odtTUJX5skpqzVI/M=
X-Gm-Gg: ASbGncuYY5oO+5yxnB1ixoW84HnzsZMwRR5X6JCHIVbTOH5B4/SOYVM69H25HnkpnY7
 t+HAqwbuxd7gtRn7jq7aSq2QBfeRo3zjQjqG671rG2YLQJ5mbL/h2SW5MPxxIRRhFSlDsevJ1+x
 b34yNFpLnRJtJC6Zj7hXdxE1qCNhY2yYOBuvoAY5mIjcL7MgGyIiYmJOuV8yBVnmzx1cZVAINV7
 hI0hqNIOqnx/e86ej5kDpwN1UBPV20vQ6YgmTzQ/X2dg5GCX4UFq6bkMfWwt6G5cWZYal+jIIOA
 C30odQecg79zh2/iKUDADOIKoEtMRWpOL25z6V3VOowyxLR16QKIZDsZ4eeoLcT4XBA8bm/jdKi
 /snNs08pmeJI6/f8iipGusO/T9RhyItahjwEzOapvT7460OZsl/fx0MDcYQIjCjdFJec=
X-Google-Smtp-Source: AGHT+IHpIm8sX48sV9VHyMtAiBK8uZbM3UvO5gh/NBT0mKmcCfo5CPQaeahBX6iY3qrkqenwJLW4ng==
X-Received: by 2002:a17:902:db07:b0:24e:95bb:88b1 with SMTP id
 d9443c01a7336-28e7f2eec89mr77298595ad.34.1759370701140; 
 Wed, 01 Oct 2025 19:05:01 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:05:00 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 3/9] tests/functional: Provide GDB to the functional tests
Date: Thu,  2 Oct 2025 02:04:26 +0000
Message-Id: <20251002020432.54443-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                     | 2 ++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 2 ++
 tests/functional/meson.build  | 6 ++++++
 4 files changed, 12 insertions(+)

diff --git a/configure b/configure
index 0f7eb95586..7226ddd589 100755
--- a/configure
+++ b/configure
@@ -1984,6 +1984,8 @@ if test "$skip_meson" = no; then
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


