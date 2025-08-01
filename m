Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6441C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 23:28:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhzA7-0000HV-Pz; Fri, 01 Aug 2025 19:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8r-0007Mr-7D
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:25 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhz8m-0005uX-Q1
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 19:26:24 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b34a78bb6e7so1717319a12.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754090779; x=1754695579; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9U0/wZZ+X7jDvuQEIrxHKhigwEtRJDRddgS55lpDeU=;
 b=St6knFFhJCwkMFMCngmqznZ4KRlU3zhf+dzRVK3L5vazfmwEcM1N6gD4xMRtmJfo7i
 wei5fGmplGK8AG0HddMtSIxEBavZK/NYf9p2uRDF8cX2NRqigfpczASQ0Z6ZEt74kSOA
 e5xYxaNigRP/nohR58b1/JSqeQrKTaq0tfW2C3xw+/vn5xn+MdQ/lOxJfupD6Xn/4HxR
 H6muJoYvEkJBbZl1TYg2kDfOZubg96kepLPIcSMNZI9b5yf6Fgu7wFPxmrqVogCltPHy
 RUjaliUDeSEDR9L9WtcdBjDxO7DS+F5/fXWHw5Jj7wz5Xm6o4HXidDrReN08ji1MWUU2
 Zz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754090779; x=1754695579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9U0/wZZ+X7jDvuQEIrxHKhigwEtRJDRddgS55lpDeU=;
 b=Xs/NmySSFmJ8ABkaIwowO/mpXocPnJO98JsqUpS/xk3c33aJZVvskXKelQoVf0DiNP
 LP7my7dOKoRNQ+SxkJP6+ftQaz9Oha1K7pUW1TrzS08nshkwtydopteulA3D+P/n4C/B
 XWGlCxJLvC3o2Jg+jarUcDzuAa9OpvZdv71iGwpmLhXMURaO8nrpxw0waSN96OtU0yt3
 bErlNGkXyD+4rcM0ieUogw/WaemjnDUaF+7B+unv4hjIetqVKqyKxM2HNhHzXIzpk/dZ
 gKp9YCUsAExYOmTKnxtREqsnxRqwkL0ijOAJ1/sc0kYxPMrPjZdk/MogTMnptSLPEdyj
 5WLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMtZinFfeDVt/y74L++FA8njHlggqz2xsBFsEDzxXY3BEpWl5BPOdwnVa6QTj5oM9xN9maARO2cw==@nongnu.org
X-Gm-Message-State: AOJu0Yw4xfYCNowAGWM+gvEKqzzwE31gG6mWty84crM6NP1Q7BlVIEIm
 EbIPKdFYbJ3fQtwU1iykF/skq9e0TH/9+JCLlAmCLK4grFYI8k22mzEuF7g3O6Arnuw=
X-Gm-Gg: ASbGncu5S/SxiM9jgJ7js8gujzoN2GAoLV+vDY1nRprP911dC/9vQ/eG9VdA2UF6SIg
 cieWc6jJ2J1JDZXStKuS7nV63syfm0WgjxXR9qJpbf97F4Ae2DbtQkh7/dFZTQWBamlSrvrul7F
 TU1iZXLJyG903sG0dhFypVC6FZiqLOPYvFEwMeJIrubZVbq2J76tG0d5NaXOzcPV7tqen5/7jqA
 kpWF9Gprza8R40j89uN6sGcllZ97O/QtSeshmO36knx2wZyCmjFFamIs0ReMWkyMvJvY4Ez2AWO
 u2Uf4z/jPj9sHjC/qyxL3L4yKDc44hzmkbYBjE+IshCZt9zG6sWG+XA2u3iUF5wbqgLN/jGXPeS
 PY+dG5orilCwfh/iVFWDzKfHl/msaIsha
X-Google-Smtp-Source: AGHT+IF/vnn68CcYXEE0AE13dkjncBtcvUR2x+JgWDfb4zuyEK5q0EJoxjiUk/ZYSKqFIUZ8ZtSKKw==
X-Received: by 2002:a17:90a:e7d2:b0:31e:e88b:ee0d with SMTP id
 98e67ed59e1d1-321161f2e04mr2205199a91.9.1754090779125; 
 Fri, 01 Aug 2025 16:26:19 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6d3asm5628217a91.23.2025.08.01.16.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 16:26:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, richard.henderson@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liwei1518@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 03/11] semihosting/guestfd: compile once for system/user
Date: Fri,  1 Aug 2025 16:26:01 -0700
Message-ID: <20250801232609.2744557-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
References: <20250801232609.2744557-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We move relevant code to semihosting/arm-compat-semi.c, and add
functions to query CONFIG_ARM_COMPATIBLE_SEMIHOSTING at runtime.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/semihosting/guestfd.h      |  7 -------
 include/semihosting/semihost.h     |  2 ++
 semihosting/arm-compat-semi-stub.c | 19 +++++++++++++++++++
 semihosting/arm-compat-semi.c      | 26 ++++++++++++++++++++++++++
 semihosting/guestfd.c              | 26 +++++---------------------
 semihosting/meson.build            | 11 ++++++-----
 6 files changed, 58 insertions(+), 33 deletions(-)
 create mode 100644 semihosting/arm-compat-semi-stub.c

diff --git a/include/semihosting/guestfd.h b/include/semihosting/guestfd.h
index 3d426fedab3..a7ea1041ea0 100644
--- a/include/semihosting/guestfd.h
+++ b/include/semihosting/guestfd.h
@@ -35,13 +35,6 @@ typedef struct GuestFD {
     };
 } GuestFD;
 
-/*
- * For ARM semihosting, we have a separate structure for routing
- * data for the console which is outside the guest fd address space.
- */
-extern GuestFD console_in_gf;
-extern GuestFD console_out_gf;
-
 /**
  * alloc_guestfd:
  *
diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
index b03e6375787..231dc890395 100644
--- a/include/semihosting/semihost.h
+++ b/include/semihosting/semihost.h
@@ -33,6 +33,8 @@ typedef enum SemihostingTarget {
  * Return true if guest code is allowed to make semihosting calls.
  */
 bool semihosting_enabled(bool is_user);
+bool semihosting_arm_compatible(void);
+void semihosting_arm_compatible_init(void);
 
 SemihostingTarget semihosting_get_target(void);
 const char *semihosting_get_arg(int i);
diff --git a/semihosting/arm-compat-semi-stub.c b/semihosting/arm-compat-semi-stub.c
new file mode 100644
index 00000000000..bfa3681e267
--- /dev/null
+++ b/semihosting/arm-compat-semi-stub.c
@@ -0,0 +1,19 @@
+/*
+ * Stubs for platforms different from ARM
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "semihosting/semihost.h"
+#include <glib.h>
+
+bool semihosting_arm_compatible(void)
+{
+    return false;
+}
+
+void semihosting_arm_compatible_init(void)
+{
+    g_assert_not_reached();
+}
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 40dc778529d..3f653c6e7a9 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -101,6 +101,13 @@ static int gdb_open_modeflags[12] = {
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
 };
 
+/*
+ * For ARM semihosting, we have a separate structure for routing
+ * data for the console which is outside the guest fd address space.
+ */
+static GuestFD console_in_gf;
+static GuestFD console_out_gf;
+
 #ifndef CONFIG_USER_ONLY
 
 /**
@@ -353,6 +360,25 @@ static const uint8_t featurefile_data[] = {
     SH_EXT_EXIT_EXTENDED | SH_EXT_STDOUT_STDERR, /* Feature byte 0 */
 };
 
+bool semihosting_arm_compatible(void)
+{
+    return true;
+}
+
+void semihosting_arm_compatible_init(void)
+{
+    /* For ARM-compat, the console is in a separate namespace. */
+    if (use_gdb_syscalls()) {
+        console_in_gf.type = GuestFDGDB;
+        console_in_gf.hostfd = 0;
+        console_out_gf.type = GuestFDGDB;
+        console_out_gf.hostfd = 2;
+    } else {
+        console_in_gf.type = GuestFDConsole;
+        console_out_gf.type = GuestFDConsole;
+    }
+}
+
 /*
  * Do a semihosting call.
  *
diff --git a/semihosting/guestfd.c b/semihosting/guestfd.c
index d3241434c51..e8f236c690c 100644
--- a/semihosting/guestfd.c
+++ b/semihosting/guestfd.c
@@ -12,35 +12,20 @@
 #include "gdbstub/syscalls.h"
 #include "semihosting/semihost.h"
 #include "semihosting/guestfd.h"
-#ifndef CONFIG_USER_ONLY
-#include CONFIG_DEVICES
-#endif
 
 static GArray *guestfd_array;
 
-#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
-GuestFD console_in_gf;
-GuestFD console_out_gf;
-#endif
-
 void qemu_semihosting_guestfd_init(void)
 {
     /* New entries zero-initialized, i.e. type GuestFDUnused */
     guestfd_array = g_array_new(FALSE, TRUE, sizeof(GuestFD));
 
-#ifdef CONFIG_ARM_COMPATIBLE_SEMIHOSTING
-    /* For ARM-compat, the console is in a separate namespace. */
-    if (use_gdb_syscalls()) {
-        console_in_gf.type = GuestFDGDB;
-        console_in_gf.hostfd = 0;
-        console_out_gf.type = GuestFDGDB;
-        console_out_gf.hostfd = 2;
-    } else {
-        console_in_gf.type = GuestFDConsole;
-        console_out_gf.type = GuestFDConsole;
+    if (semihosting_arm_compatible()) {
+        semihosting_arm_compatible_init();
+        return;
     }
-#else
-    /* Otherwise, the stdio file descriptors apply. */
+
+    /* Out of ARM, the stdio file descriptors apply. */
     guestfd_array = g_array_set_size(guestfd_array, 3);
 #ifndef CONFIG_USER_ONLY
     if (!use_gdb_syscalls()) {
@@ -54,7 +39,6 @@ void qemu_semihosting_guestfd_init(void)
     associate_guestfd(0, 0);
     associate_guestfd(1, 1);
     associate_guestfd(2, 2);
-#endif
 }
 
 /*
diff --git a/semihosting/meson.build b/semihosting/meson.build
index 77200a7f27b..bb0db323937 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -1,17 +1,18 @@
-specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
-  'guestfd.c',
-))
-
 common_ss.add(when: 'CONFIG_SEMIHOSTING', if_false: files('stubs-all.c'))
-user_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files('user.c'))
+user_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
+  'user.c',
+  'guestfd.c'))
 system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'config.c',
   'console.c',
+  'guestfd.c',
   'uaccess.c',
   'syscalls.c',
 ), if_false: files(
   'stubs-system.c',
 ))
+system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-- 
2.47.2


