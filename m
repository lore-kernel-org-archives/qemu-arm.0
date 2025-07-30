Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBA2C87FC9
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 22:07:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEx1-0003Dt-7H; Wed, 30 Jul 2025 18:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwW-0001Bz-Aa
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhEwR-0002Z2-AH
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 18:06:34 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-24022261323so15235105ad.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 15:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753913190; x=1754517990; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BFKbQ//LgI79f1zxRYycYxEHuzsaGiAZjs584Y89tXI=;
 b=TERUefhssIQU2adeKZZgxDshEFwxQz1ax9DkiC0kgOcVCawT66vI394+a+EA9DAqo4
 rX4FStYU+6LaQfMlAlra4VvUCtydJhwNB6l6C4cseEtVUvedlXKC/YUjvU0DcBQuPbR1
 /ff0NLdWOsXsbi5z/BeLlKZ7eMQbGenE0GkGaFtiY6D2RtC64foeUm+W3Ctyp0lr6chE
 dZviMpXm+jIDrJEfeTinvoPtuW09QwaXtkQkqemJzSim04EQownPHmhJ8612ap9pEcnL
 YzKyOFcTDhNsRW2vPItP2cMl4V38bnBzv4w5UP99X/rbjSSNO3NV7lqnRddi7lV659yT
 3Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753913190; x=1754517990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BFKbQ//LgI79f1zxRYycYxEHuzsaGiAZjs584Y89tXI=;
 b=dkOXSEY1M4bfAUhza33BsVocB59QcuXECd/qw8mUhuKPjgLnp/Hvu1MR23LL/kz56i
 whfJuR4xoJzgrD6IuN0uAZ+ZXgTcwDV6h2dmc6PqPpf2YY6ixTUYuQ3JlxAiXJLN0uwS
 O6fIWkzDnmRcUMom5OiwNOxjYr0UzbgBIt2RnI8Ri2WKqvOQyu9ws+a1QRG1II3cMGTy
 vSgTqm40/ywt9ErVbvRu7++lqB2siQ/u6b3gSsmub/TPT94anWXyO1HiXbdJ/Ff3GzrP
 W7nx5/73uFNxCTtQ8L8Rh0y2OwMbqmwJDMXkewOvVKgmcV1V4YbyimzCAh7ehyNy04iZ
 sCWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj528HH5VgQH25J0Ef930sAIuhAKqirJlzfw2AWJo+/MJG2mvGZQSezs2SeTPrRqmM7VhSy+KSeg==@nongnu.org
X-Gm-Message-State: AOJu0YwfbpvXz+Ikqq/7q47D1Z41SBzon3SXuqdgv6t9hZysfl/1zXsS
 ttktWDzeEI5UH88+hruEWo/ZJwJ+OHfUDiiESK4lyr3Hkl8n2pI25dgnzZNaz1c36dM=
X-Gm-Gg: ASbGncvyEsl/qierVdsFK50mUiNCjGtYow7HPjsTYHe1D3OPMyj3rfsHoo1uOjO9I1r
 gpgsIbkGf9QglfEG1pStZWxkmkgpVWqSFAg3s1IIYMFobRXjIf7U6qCdTtb+dEHixN+bdmTkRWm
 t+cUmRfxV7V2njmBSpPJGbI4BIaW7Ry0F17f4hSzyyFVT6HeJQ/nbz5ArjTlQN0IZB9P4z+EBXR
 4E329JDsK8O26R+1fYjKZQ4pmtna+p7/Q5Q4/rf7DlBiefj6xH2VUdZYGEgNPo4NFi1zBpbS7uS
 WblLEu75VpXl32yhncwjAGyiRItmhBOSmU6q0wr2Bggwvxrdu55JQsPqUzPy4FJvYHXqzE+sJ7h
 nTAtwwdR2xReviub1zNlgeg==
X-Google-Smtp-Source: AGHT+IGZ1yYndVG9K2s8R/mLJl7MuT4SvFdUntXEkA/Q3Ye5zDqHpH0ZPp6sQY0Ctr+3x7XGeEL/JQ==
X-Received: by 2002:a17:903:90c:b0:231:9817:6ec1 with SMTP id
 d9443c01a7336-2409689f466mr71269985ad.17.1753913189930; 
 Wed, 30 Jul 2025 15:06:29 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899d272sm981535ad.135.2025.07.30.15.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 15:06:29 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 02/10] semihosting/guestfd: compile once for system/user
Date: Wed, 30 Jul 2025 15:06:13 -0700
Message-ID: <20250730220621.1142496-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

We move relevant code to semihosting/arm-compat-semi.c, and add
functions to query CONFIG_ARM_COMPATIBLE_SEMIHOSTING at runtime.

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
index 40dc778529d..33614108094 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -101,6 +101,13 @@ static int gdb_open_modeflags[12] = {
     GDB_O_RDWR | GDB_O_CREAT | GDB_O_APPEND,
 };
 
+/*
+ * For ARM semihosting, we have a separate structure for routing
+ * data for the console which is outside the guest fd address space.
+ */
+GuestFD console_in_gf;
+GuestFD console_out_gf;
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


