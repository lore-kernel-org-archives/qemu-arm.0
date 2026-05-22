Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0B8CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:04:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXyc-0008Ku-58; Fri, 22 May 2026 18:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxv-0007lO-NY
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxs-0008Jl-ME
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-365d8e43759so4093337a91.0
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487410; x=1780092210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZgO8gjp8txrPFhSZcF1i35Zr8JFj4IafZd1otTkFRY=;
 b=e9xPzY89HrtMWCUmrgRkkSW+tiM5IDuszxaiZbImHTqnHv3GKQPxg+E4xDavppwIIV
 MhxHk21KwXAPwZSa7XwLdtiiTgoMI6GrY3D1jHra2p/rUDUA5IegNhk9yLHKeI4jvwWf
 HoStyUZgdhtHFrghDGyqAfwb9srAo4VyzZEfWVkAPxtgRNVNvHb0HuUYbxl+R04w2KKT
 JTsqdx3uuetKUFBTc3wYJOM2uMuqz7fg6kC3UwtXCGBwcJIFZ3EQY8IlLDeVnU8yLWIR
 p/Aj5NPodUWGMQaEuCDdms4bRhb5/HGplRX8kyNFf52lQwmXqd5QIIizKRo+6Lf9OfIT
 F8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487410; x=1780092210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5ZgO8gjp8txrPFhSZcF1i35Zr8JFj4IafZd1otTkFRY=;
 b=sbfRbdG9307/w0bdesl3VDj9Y+7NqYayc2spQTFW3C6B7YhDEffIdD/lTAx6ez5Kev
 cVFuJbwdB6mdMqzfekzNwNXa/gkjIWhBgRIPc58OBEOipfx34Bu4oHEMkrdNMCEF8QZv
 eICFNLNbTPCa6BCqc9GoM1sIicVp1kNh49Q4Y8IiF8suxrZKLPBIw26Yb7M5UY0ham4u
 XezObm+ghk2/GaNbSo5qhM4ZVK0o3kjMZT5RSf6CvhITiAC/gmtZGmeni1gPPEhAq0h9
 3n0hC/XhjPPeeooTfi6u/H7ZKhg6rQPhwggHc05PLHQSCaWOS37WlgKL19nuuFclEv57
 pP3A==
X-Gm-Message-State: AOJu0YzyRqm6k6bQK8N8BE4+oQsk3IiJPlPKAaQRp9/1F37XvqWdYZbW
 d6GNYT9zobR2QcohOqiAJnAHdniv71/P6lhb4HgP8UReez/k7q72+HaspH2/2/zLjZA=
X-Gm-Gg: Acq92OFyetc4DMFxJnfZM/MfBjfzdZWIxKZjZW8i3FuvsNsiE6Qrg89R9t0MFoQwA8K
 jO4eV8ZPkPXuUce5Ov0ksxxFeGU1hUeUf5oMxVJ2cBbWgrPsbrnXsB5sTkx/fO9P/pBx27YpDwf
 yYPGrBL9R4zlI5RFrAYub+/8vk3RuDPo1gxY+UKuZ6nOp7fdbTCnXojUH4JNwIhmKpoNoYy6X73
 sj4OnM/u54zeDGfG2Qf6MmSJOWvIUnsshEjfEoiJoDN/d847BgPhF/uJeWmV5RmGJEj4i1ZlC9s
 CmQO3jR8u7KtdABgRuxzSmLo36T/I+V5gKb8rRkvZoU6Jaki7fW2bwnvQrrwKxzsidBCprtgK3j
 Ykonhk+mMnpE1kc/xnM4mZX9wwk1J04SIGpVcnuEJaESohN3x4qD0N7kWSyqUP49rOmIZ2uu9OY
 pbNamZ2tJJGxgJADII8LbnDUq78bbZ
X-Received: by 2002:a17:90a:e70d:b0:369:3c3d:f899 with SMTP id
 98e67ed59e1d1-36a6ba28e3bmr3811530a91.2.1779487409653; 
 Fri, 22 May 2026 15:03:29 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 22/64] target/arm: Split vector-type.h from cpu.h
Date: Fri, 22 May 2026 15:02:24 -0700
Message-ID: <20260522220306.235200-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

We want to be able to reference ARMVectorType etc from
common code, so move it out of cpu.h.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h         | 38 +---------------------------------
 target/arm/vector-type.h | 44 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 37 deletions(-)
 create mode 100644 target/arm/vector-type.h

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2a93de4132..85552b573c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -35,6 +35,7 @@
 #include "target/arm/cpu-sysregs.h"
 #include "target/arm/mmuidx.h"
 #include "hw/intc/arm_gicv5_types.h"
+#include "target/arm/vector-type.h"
 
 #define EXCP_UDEF            1   /* undefined instruction */
 #define EXCP_SWI             2   /* software interrupt */
@@ -140,43 +141,6 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
-/* Define a maximum sized vector register.
- * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
- * For 64-bit, this is a 2048-bit SVE register.
- *
- * Note that the mapping between S, D, and Q views of the register bank
- * differs between AArch64 and AArch32.
- * In AArch32:
- *  Qn = regs[n].d[1]:regs[n].d[0]
- *  Dn = regs[n / 2].d[n & 1]
- *  Sn = regs[n / 4].d[n % 4 / 2],
- *       bits 31..0 for even n, and bits 63..32 for odd n
- *       (and regs[16] to regs[31] are inaccessible)
- * In AArch64:
- *  Zn = regs[n].d[*]
- *  Qn = regs[n].d[1]:regs[n].d[0]
- *  Dn = regs[n].d[0]
- *  Sn = regs[n].d[0] bits 31..0
- *  Hn = regs[n].d[0] bits 15..0
- *
- * This corresponds to the architecturally defined mapping between
- * the two execution states, and means we do not need to explicitly
- * map these registers when changing states.
- *
- * Align the data for use with TCG host vector operations.
- */
-
-#define ARM_MAX_VQ    16
-
-typedef struct ARMVectorReg {
-    uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
-} ARMVectorReg;
-
-/* In AArch32 mode, predicate registers do not exist at all.  */
-typedef struct ARMPredicateReg {
-    uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
-} ARMPredicateReg;
-
 /* In AArch32 mode, PAC keys do not exist at all.  */
 typedef struct ARMPACKey {
     uint64_t lo, hi;
diff --git a/target/arm/vector-type.h b/target/arm/vector-type.h
new file mode 100644
index 0000000000..d94c0d986e
--- /dev/null
+++ b/target/arm/vector-type.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef TARGET_ARM_VECTOR_TYPE_H
+#define TARGET_ARM_VECTOR_TYPE_H
+
+/*
+ * Define a maximum sized vector register.
+ * For 32-bit, this is a 128-bit NEON/AdvSIMD register.
+ * For 64-bit, this is a 2048-bit SVE register.
+ *
+ * Note that the mapping between S, D, and Q views of the register bank
+ * differs between AArch64 and AArch32.
+ * In AArch32:
+ *  Qn = regs[n].d[1]:regs[n].d[0]
+ *  Dn = regs[n / 2].d[n & 1]
+ *  Sn = regs[n / 4].d[n % 4 / 2],
+ *       bits 31..0 for even n, and bits 63..32 for odd n
+ *       (and regs[16] to regs[31] are inaccessible)
+ * In AArch64:
+ *  Zn = regs[n].d[*]
+ *  Qn = regs[n].d[1]:regs[n].d[0]
+ *  Dn = regs[n].d[0]
+ *  Sn = regs[n].d[0] bits 31..0
+ *  Hn = regs[n].d[0] bits 15..0
+ *
+ * This corresponds to the architecturally defined mapping between
+ * the two execution states, and means we do not need to explicitly
+ * map these registers when changing states.
+ *
+ * Align the data for use with TCG host vector operations.
+ */
+
+#define ARM_MAX_VQ    16
+
+typedef struct ARMVectorReg {
+    uint64_t d[2 * ARM_MAX_VQ] QEMU_ALIGNED(16);
+} ARMVectorReg;
+
+/* In AArch32 mode, predicate registers do not exist at all.  */
+typedef struct ARMPredicateReg {
+    uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
+} ARMPredicateReg;
+
+#endif
-- 
2.43.0


