Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44098CD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtGd-0006LL-6B; Fri, 15 May 2026 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGb-0006AU-8T
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtGY-0004AG-ND
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:11:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so51292435e9.3
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854309; x=1779459109; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GDq9BvT/lOkobiXtw67j1Qf1XHuz8YPQ+o7ed/CVvtA=;
 b=VHqmwn08CuQHhvCcRCkrIsCxpdrZEIcri5m1yy2vBVBga6BIVETCsiyF5viV3SsgSg
 GRzxvEGhZvV0qqYe0remhXBft0D6NIQPA30E+V9Fvx62rb/eX+BnjWRXMhxPF9XApGm1
 Jg2vMQIvA6p3R2KVvywSSq2SsnUFikKMnGdN9tTLiU8QqspvAQTJBKH0RZzIc24iptmM
 l5jkvJ2O4WkBebB+l/YtOAXFWGJhSsVlUNCR40csMidEFFVvHaJC3M9XWAIQATddo3KE
 XYhLtP8+Oaa5PlaBUJ9w22uvFgel9HRtPERrlRF6ZvlWHq5nmDeHy026+A4acRw+VaHz
 pqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854309; x=1779459109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GDq9BvT/lOkobiXtw67j1Qf1XHuz8YPQ+o7ed/CVvtA=;
 b=MHMC6Rf0yrfAqH7HSk6sutbTVuU2Pk4kjyalY3hdPtcfvORam89yxvrUQzuC0y2c+k
 iyX0FArbER6ttMg3dpyWmDAIa9BL5oTuGLPrM0JZcM1MnPvFnZOPuSifFMmfN42FwMh7
 JpeVZx4nBPrlZE8sEq3qUGwlLk1Lq6gCJiO4ai2dBl4HHwfRT1MDznunhd1RqYBmSwyq
 66poI8EUUL3hDKLX2o/gFYkGDV9e93dHeks8+qCGnTsEyitmyDkepPs+NJXwCK79p2Q1
 jccs50zhx8mJMFXg97G+DzWRATrLONUsIa11kQPFoyQD/f20GFSSGhHnMwEI9yNT0pKf
 TRCw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ts9NE4Dtn3KQOP2vTEHguXEs6BItoFept8Tdltu13ycLLLIrI1gcIqNDKSvAyFmYPRImmc9M6lA==@nongnu.org
X-Gm-Message-State: AOJu0YxFLUOadszKEtXNZMIEy6RJjVwlsQDzQH0Bx/dUPCJZPvbdP304
 HeTPYHU8Vs+fUHo1JVl4jXwIljwaogdlPjh42yRaG7/12JZgPKk1DRMMd583z2pz1Fg=
X-Gm-Gg: Acq92OEk6n9oloBFwrs86L54imbprahpwcv+/4mnYnQ89P7ekyVDqz4Il80eEf23tJX
 rErj8hdf/Lgp7ZqXmoqzc6Guntv46m7YM8sQmalDmj00xOGFsBmD1h5cVN10Q/fPdSrA8Pmuy8s
 5mhN2qTTf52mEph2319ctQWrh+9qwUP3Tde4N/SXT7pHxF3LixAV7e1J9+ojLFQaZsLlmaoyKs+
 WCoOMdlA3i6cz2LPY595jhd+lCeDDfXqCkXWLT7lA7KEd5oDSG2DJpDrVrXIdqZubL44enzIjnW
 esitu5L0kgcmxHg+HcBtH5xjWNjMz46Abn+XI82XP2nnei3a9HOpdakn0FUfCIdKbILXwMzEz73
 LNSRi1WSVlijYiAx6tDNfZAFOygln1On/JikcdsL0WVr8wJxZxKmZwkNN0+gixzSNJuo/8zJF/d
 81LENdkRMS1xxcZ2x9TL5vTJpmhXqLQAV5fNS+mK5/UZj3X+ZseGybO7Lp/iMi8KVXDnR9vfuM
X-Received: by 2002:a05:600c:354d:b0:48f:e230:72fa with SMTP id
 5b1f17b1804b1-48fe662ffbfmr52036585e9.31.1778854309211; 
 Fri, 15 May 2026 07:11:49 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19a0csm15051893f8f.20.2026.05.15.07.11.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:11:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 10/20] target/arm: Restrict IDAU interface to TCG namespace
Date: Fri, 15 May 2026 16:10:21 +0200
Message-ID: <20260515141032.3271-11-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Emphasis the IDAU interface is restricted to TCG by
moving the header under target/arm/tcg/. Move the
definition to cpu-v7m.c which also contains v7/v8
hardware (NVIC), keeping only CPU types in cpu32.c.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/armv7m.h     |  2 +-
 include/hw/misc/tz-msc.h    |  2 +-
 target/arm/{ => tcg}/idau.h |  4 ++--
 hw/arm/armv7m.c             |  2 +-
 target/arm/cpu.c            |  2 +-
 target/arm/ptw.c            |  2 +-
 target/arm/tcg/cpu-v7m.c    | 11 +++++++++++
 target/arm/tcg/cpu32.c      |  8 --------
 8 files changed, 18 insertions(+), 15 deletions(-)
 rename target/arm/{ => tcg}/idau.h (97%)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 98ad08db036..70555962bb9 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -13,7 +13,7 @@
 #include "hw/core/sysbus.h"
 #include "hw/intc/armv7m_nvic.h"
 #include "hw/misc/armv7m_ras.h"
-#include "target/arm/idau.h"
+#include "target/arm/tcg/idau.h"
 #include "qom/object.h"
 #include "hw/core/clock.h"
 
diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
index 07112d8caa3..6cf4c6b09eb 100644
--- a/include/hw/misc/tz-msc.h
+++ b/include/hw/misc/tz-msc.h
@@ -51,7 +51,7 @@
 #define TZ_MSC_H
 
 #include "hw/core/sysbus.h"
-#include "target/arm/idau.h"
+#include "target/arm/tcg/idau.h"
 #include "qom/object.h"
 
 #define TYPE_TZ_MSC "tz-msc"
diff --git a/target/arm/idau.h b/target/arm/tcg/idau.h
similarity index 97%
rename from target/arm/idau.h
rename to target/arm/tcg/idau.h
index 0ef5251971d..e5736ad848d 100644
--- a/target/arm/idau.h
+++ b/target/arm/tcg/idau.h
@@ -25,8 +25,8 @@
  * connected to the CPU using a link property.
  */
 
-#ifndef TARGET_ARM_IDAU_H
-#define TARGET_ARM_IDAU_H
+#ifndef TARGET_ARM_TCG_IDAU_H
+#define TARGET_ARM_TCG_IDAU_H
 
 #include "qom/object.h"
 
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index a29eab6c915..68a1cbd6316 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -20,7 +20,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
-#include "target/arm/idau.h"
+#include "target/arm/tcg/idau.h"
 #include "target/arm/cpu.h"
 #include "target/arm/cpu-features.h"
 #include "target/arm/cpu-qom.h"
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 31e0a12a986..76f5909e902 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -24,7 +24,6 @@
 #include "qemu/log.h"
 #include "exec/page-vary.h"
 #include "system/whpx.h"
-#include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "cpu.h"
@@ -42,6 +41,7 @@
 #include "hw/intc/arm_gicv5_stream.h"
 #ifdef CONFIG_TCG
 #include "hw/intc/armv7m_nvic.h"
+#include "target/arm/tcg/idau.h"
 #endif /* CONFIG_TCG */
 #endif /* !CONFIG_USER_ONLY */
 #include "system/tcg.h"
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8706dd59dd6..a4842a4b62b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,7 +17,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "idau.h"
+#include "target/arm/tcg/idau.h"
 
 typedef struct S1Translate {
     /*
diff --git a/target/arm/tcg/cpu-v7m.c b/target/arm/tcg/cpu-v7m.c
index dc249ce1f14..02abd831e6a 100644
--- a/target/arm/tcg/cpu-v7m.c
+++ b/target/arm/tcg/cpu-v7m.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
+#include "target/arm/tcg/idau.h"
 #include "internals.h"
 
 #if !defined(CONFIG_USER_ONLY)
@@ -40,6 +41,16 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return ret;
 }
 
+static const TypeInfo arm_v8m_types[] = {
+    {
+        .name = TYPE_IDAU_INTERFACE,
+        .parent = TYPE_INTERFACE,
+        .class_size = sizeof(IDAUInterfaceClass),
+    }
+};
+
+DEFINE_TYPES(arm_v8m_types)
+
 #endif /* !CONFIG_USER_ONLY */
 
 static void cortex_m0_initfn(Object *obj)
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 2127d456ad6..73d21c6cf7d 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -12,7 +12,6 @@
 #include "cpu.h"
 #include "accel/tcg/cpu-ops.h"
 #include "internals.h"
-#include "target/arm/idau.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/core/boards.h"
 #endif
@@ -899,17 +898,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 #endif
 };
 
-static const TypeInfo idau_interface_type_info = {
-    .name = TYPE_IDAU_INTERFACE,
-    .parent = TYPE_INTERFACE,
-    .class_size = sizeof(IDAUInterfaceClass),
-};
-
 static void arm_tcg_cpu_register_types(void)
 {
     size_t i;
 
-    type_register_static(&idau_interface_type_info);
     for (i = 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
         arm_cpu_register(&arm_tcg_cpus[i]);
     }
-- 
2.53.0


