Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5C0F436BD
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 16:43:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDmI2-0003N5-Ef; Fri, 17 Apr 2026 12:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmI1-0003Ml-Cr
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wDmHz-0004rN-OF
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 12:43:33 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso11131115e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 09:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776444210; x=1777049010; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mnj1sUSGnQtu/nyeEQy5Pwcrz7WuG7Co9e+aKnd+EfA=;
 b=dqNyJVL8zRxEVKRVcz1044UmKq58C8986kveyz9Sfw/VG4ldkfKPTZSMqXLgc95519
 a5fvbkugTXmysQsD2vuN7o/0PNeWvDn74qYzEdq7eUoheILLAaQODwoFs725WEh69ZhO
 wUVRgwGu3j6XbdP7ne19KUEdB8Ojxhu5ZpiqF10ROq7sWsD1KA2rhDRjfQ0BsVd9VHqp
 VIJrxT9IEPjeOouBO0kVKkB4RCqmu58XvDaxid6khRJ+ijCq359oI89F3Tki4LHeS93U
 YZINKfLCu19GC+KIOCSsUP5zMkt43lfAVOv3+0fbmMo6hCR1vYVZ1sluXfRd/pbwP8Ik
 b2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776444210; x=1777049010;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mnj1sUSGnQtu/nyeEQy5Pwcrz7WuG7Co9e+aKnd+EfA=;
 b=RsJt4BdnCgVf38z6H894Q9YfKaF7uBl2Qw/WqGafF4TVyZiwRdJ/C91k1mdKSKJmms
 T/fdqePs1nlsPD3cNvmc0X0i9KM1KPL2sI8tbzquN/uTGVe5IJrIftUnEk6xtFxpir2n
 T1rsH1M7L6wdoluAmCQYN9jr0iohO9/Yr594L5yCwCnlB2wdLZCYcobv2MK+FiKqSLoy
 2Oo+Phv/Mx3iJk+ClQkNB5yOtFNkT6uLb+SOurzjoYq/an2/OKwsI+Sv3URHSFRlgFCy
 sAaZ1TTnedGWYFdJlFipu4JXd/BEvgS5+qFGTX1DA90mI8Amd6ihfThmdP244vi1EBtD
 Kqbg==
X-Gm-Message-State: AOJu0YxZ5tAS/7XDSSKOFgeAKs2fgaWV6sZvDwWNGiXPqzKcinExfOkl
 zjBsgfcCw4YaupJ+mNNlMXJF/n99Ltug3ylR4iHQiriiF1Og65tuM5zCBl5273Iqo4s=
X-Gm-Gg: AeBDievKx1SoFliy8hN0aA2RPSPJdXvDh4it2M4sPN20eEyx6IcULLjpFOtssdjZDUo
 9L17GY+DWmjHPsYej3Xc2j4QJsuxpg5emqmNDhC3b6s+wAdPnqKjbT9fdM35r0ciOuwHMTBM5Gq
 68I75E2MQgm1trxhV3O6tv5A6TOhHbiCc6JHYG6/GfmgO6mTmbKQn0qOO/xQJsSMJXWfRh+0TCh
 0xsyzT/kQRWsSmhpMnV3UcS0RGtQO5iUPGNvTeQDvr2VS/SufuB3Gf9iGWhXaLSl6tu/bLkKaPd
 AIJuUpddWN5BjQdwxzlFRWAsNcTwYqlr+SEUKHcTWdvXFFxVR9qwfNk68C5bg+ud3YZnA+A4/SA
 dhCcPHZcDxxD1nRK12HEpD3PBtcq161gvRy0GcatAlUYsCOMS5wrFTryKtu+J3IRXuqoTURD70h
 j3dK6pn1Aq51aHp6epmEtCHbAFb7MBL6EbHRZdsAPJeH6f
X-Received: by 2002:a05:600c:444a:b0:487:1520:d107 with SMTP id
 5b1f17b1804b1-488fb793580mr48989795e9.31.1776444209860; 
 Fri, 17 Apr 2026 09:43:29 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e591cesm8147138f8f.36.2026.04.17.09.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 09:43:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8AAE55F954;
 Fri, 17 Apr 2026 17:43:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/7] tests/tcg: introduce a lib dir for aarch64 system tests
Date: Fri, 17 Apr 2026 17:43:21 +0100
Message-ID: <20260417164328.1009132-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260417164328.1009132-1-alex.bennee@linaro.org>
References: <20260417164328.1009132-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

We are about to add some more helpers but lets start by adding a
simple wrapper for reading and writing system registers.

Do note the subtle switch of ordering for write_sysreg() which matches
the change the kernel made sometime in 2021 (see 272a067df in linux.git).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/lib/sysregs.h    | 22 ++++++++++++++++++++++
 tests/tcg/aarch64/system/vtimer.c         | 23 ++++-------------------
 tests/tcg/aarch64/Makefile.softmmu-target |  3 ++-
 3 files changed, 28 insertions(+), 20 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/lib/sysregs.h

diff --git a/tests/tcg/aarch64/system/lib/sysregs.h b/tests/tcg/aarch64/system/lib/sysregs.h
new file mode 100644
index 00000000000..b1c465e0746
--- /dev/null
+++ b/tests/tcg/aarch64/system/lib/sysregs.h
@@ -0,0 +1,22 @@
+/*
+ * AArch64 system register helpers
+ *
+ * Based on the helpers from Linux
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#define __stringify_1(x...) #x
+#define __stringify(x...)   __stringify_1(x)
+
+#define read_sysreg(r) ({                                           \
+            uint64_t __val;                                         \
+            asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
+            __val;                                                  \
+})
+
+#define write_sysreg(v, r) do {                     \
+        uint64_t __val = (uint64_t)(v);             \
+        asm volatile("msr " __stringify(r) ", %x0"  \
+                 : : "rZ" (__val));                 \
+} while (0)
diff --git a/tests/tcg/aarch64/system/vtimer.c b/tests/tcg/aarch64/system/vtimer.c
index 7d725eced34..b6bde49ce30 100644
--- a/tests/tcg/aarch64/system/vtimer.c
+++ b/tests/tcg/aarch64/system/vtimer.c
@@ -8,22 +8,7 @@
 
 #include <stdint.h>
 #include <minilib.h>
-
-/* grabbed from Linux */
-#define __stringify_1(x...) #x
-#define __stringify(x...)   __stringify_1(x)
-
-#define read_sysreg(r) ({                                           \
-            uint64_t __val;                                         \
-            asm volatile("mrs %0, " __stringify(r) : "=r" (__val)); \
-            __val;                                                  \
-})
-
-#define write_sysreg(r, v) do {                     \
-        uint64_t __val = (uint64_t)(v);             \
-        asm volatile("msr " __stringify(r) ", %x0"  \
-                 : : "rZ" (__val));                 \
-} while (0)
+#include "sysregs.h"
 
 int main(void)
 {
@@ -31,9 +16,9 @@ int main(void)
 
     ml_printf("VTimer Test\n");
 
-    write_sysreg(cntvoff_el2, 1);
-    write_sysreg(cntv_cval_el0, -1);
-    write_sysreg(cntv_ctl_el0, 1);
+    write_sysreg(1, cntvoff_el2);
+    write_sysreg(-1, cntv_cval_el0);
+    write_sysreg(1, cntv_ctl_el0);
 
     ml_printf("cntvoff_el2=%lx\n", read_sysreg(cntvoff_el2));
     ml_printf("cntv_cval_el0=%lx\n", read_sysreg(cntv_cval_el0));
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f7a7d2b800f..c7f44803c73 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -4,6 +4,7 @@
 
 AARCH64_SRC=$(SRC_PATH)/tests/tcg/aarch64
 AARCH64_SYSTEM_SRC=$(AARCH64_SRC)/system
+AARCH64_SYSTEM_LIB=$(AARCH64_SRC)/system/lib
 
 VPATH+=$(AARCH64_SYSTEM_SRC)
 
@@ -24,7 +25,7 @@ LINK_SCRIPT=$(AARCH64_SYSTEM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT)
 TESTS+=$(AARCH64_TESTS) $(MULTIARCH_TESTS)
 EXTRA_RUNS+=$(MULTIARCH_RUNS)
-CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
+CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC) -I $(AARCH64_SYSTEM_LIB)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 config-cc.mak: Makefile
-- 
2.47.3


