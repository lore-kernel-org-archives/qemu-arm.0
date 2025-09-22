Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72704CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 05:46:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ZMc-00089k-Bx; Mon, 22 Sep 2025 01:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZMV-00083O-KD
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:21 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZML-0004uh-L9
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:15 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-267facf9b58so28802365ad.2
 for <qemu-arm@nongnu.org>; Sun, 21 Sep 2025 22:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758519907; x=1759124707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6597SlNNvp2+Kx/YZgVhVqlqizhj7ztCNH2v/Gmt3HA=;
 b=YkhLJCiTOYLispt9r5nYCc89KskKhCLkhOJeQhuf7RpdvJLtwyzqIfSZbD+Fou5BDS
 qkCKVm3I0ozbDPg+daNINNS3wkrHsGJ7lTkFG+SETR744QUlqKuy8AEEjkCmTpWzIoje
 4oesJaGB8fmyCMWcK7Ryz4ZFoYKFWFO0089YDS5pOqu6PJ/c8NoSNqC3H0CMC4IuUtZH
 9eHexKh75bHJ8jyFMMNx7BYwcE0B4mo3dm5tRpdeqwE7EkVb2oNMwuyqIcJGm0O2xKS6
 E9rIASCNGycvDU0ZLj8hNAdJ1hSFhPK34tQlTureWQqya56a77QgsGoPZf4uK/qvJOWH
 4CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758519907; x=1759124707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6597SlNNvp2+Kx/YZgVhVqlqizhj7ztCNH2v/Gmt3HA=;
 b=cdfLjxCSpXECy+uqWAeFTNoVc28CG1WcV7y3eDQ/dK25Bfu6ugbGhwElkNvEhMJ7iw
 7usOcLxGBdE11NfXXgqyc5Jcbafb/5GJf/FwWwnZ7wxY241KVh/WZ0JnlA74s3oZtAnc
 I7z/wHD7M6fks1UOPFHgVJplZI+DgyHJo4TgoOswvsnp25ZERuGzH+7Zql5Ub5Fiq+kp
 6rSfhwTp0rUujC0Svp2fJeKkPsstkd6oyNAez+D3N3rqvqbRH3wB+7L2rqJZSZ5qZCjk
 m6EB7sA2O2Z2SsQ6ZqrjmlMLE5jWQGLQlZolAit2NITH5unLpWFn2wOVzzuzNNywnJq7
 fDrA==
X-Gm-Message-State: AOJu0Ywjg4DbLpq1Dg6pojHVx3oC7wDd1DvHMf5NTAgahg1kNZ0DxznV
 bazmKK2gqUw77DMdpjFiVpRc4bhQGNDk9mCID5uOCaApnBXx80COLIgJbpuAwSvxmms=
X-Gm-Gg: ASbGncucqQ3Yh1IfQzR+Rnh3t1YlYiQUW/l6i82kfP53RiDUeKYVKxN23hCfpe5t0Ui
 DzvRfy81cE/DocmNBLKK7GntqFARBHENpLhVfS97dDSqRndCrXqwqj+6KkD/Gow9CKVTFuzMftK
 58ghsQHoSsTtn8lmgKOVLsKweuVZ6uNmsh1wziOR9FjbTy+ZO06EHJS78QXXExtpnlod6qpoYrS
 7iTu8k9L270sJTAynSi4QoBpAuR4WYuUjSNCW58nWcRHxZ+yARsAbD/yFFXXAx5CzuR2rHudzgO
 tiq41ZEi9VcfMbcw/jvPzgk9ST0ptHyffm2PgQ5YR0Ay6nLIGtmVOv9kcIt4bkZTultUo8JUMyn
 OMmL+gcyl2ZDQqZ+zPL2F4JiQ4fNjFFj6eI/LVUiOlsTVqKAaNHoq1OQGtNW/DjAXIr6DZIqz
X-Google-Smtp-Source: AGHT+IG9jxvg65RwoQOWsTZ3WbOLcMpEmewwz081Vv3UOdEYX5gplS3TkA5tRp7lo4ugn22uMJExgw==
X-Received: by 2002:a17:902:f645:b0:269:a4c5:f442 with SMTP id
 d9443c01a7336-269ba527e9emr160722005ad.47.1758519906724; 
 Sun, 21 Sep 2025 22:45:06 -0700 (PDT)
Received: from gromero0.. (200-162-224-93.static-corp.ajato.com.br.
 [200.162.224.93]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b551c279cd5sm7691377a12.3.2025.09.21.22.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 22:45:06 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v3 2/4] tests/functional: Provide GDB to the functional tests
Date: Mon, 22 Sep 2025 05:43:49 +0000
Message-Id: <20250922054351.14289-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922054351.14289-1-gustavo.romero@linaro.org>
References: <20250922054351.14289-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x632.google.com
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

The probe of gdb is done in 'configure' and the full path is passed to
meson.build via the -Dgdb=option.

Meson then can pass the location of GDB to the test via an environment
variable: QEMU_TEST_GDB.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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


