Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB09FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:22:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9y-0006om-Uu; Wed, 29 Apr 2026 20:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9t-0006ia-Eh
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:37 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9r-0006LP-Gf
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c70fb6aa323so81482a12.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508494; x=1778113294; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrSHe2pSUEldMpAJy/2lSu6qSshUDn+eo1q5ZmiBL48=;
 b=S4YdfPe2C7I6+Zx8Ho4paYXoUP1tVt2MNps+KqQZR0K/yxEOV1KeNUYOnddk9oYowZ
 uayswb6MFgZtdeuKzycnkvFL7Z3t2/xrK+tWPZlFLXRUnknT6Bc078gPoidIOWBow3RT
 oJNIwCh9nMMYL/Q8xJ2hK3HmMhaLsdHQr3NlG6ngqhdr/AGFcSl+Ne2f/YHS42UjPXmG
 2YFdgVT+zm37kEgBZ63ipJk4Gp1Gpgd6TCdyQ5xBO9A+t/avAvAVF0EWcn3A8O2pdICl
 84Pkjiv/XkrxFdVoF+Le2gS8SbJP1BogN2rxfcAvBV6b73FamQ/m+CGOt+fCRmmxpSL5
 Obsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508494; x=1778113294;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rrSHe2pSUEldMpAJy/2lSu6qSshUDn+eo1q5ZmiBL48=;
 b=nA+ZQQkLzIQkqhunHSLyaLijffqriSpBLjTsWezlDQtMeGZUJ0gdrJAox+xJfb6bS4
 AkWr9gCJVyN2JUJtRw66zJHMmRuNbxtZvsnYKNS7BK60xOO851KxoKlIIlO4RXXvmhhm
 p/NKRXOtsQcU/whJHSVju8VRtE/s7GH0PXAFJubUnKSfOw6CzLsxWaQFt5IzBwkJGsQL
 LeRXBnrIiht8oHnfUDasRjwRtPNgmN4baIzSAf33hUhOEVqzcu1Qp5IHgggeMWO6Ojju
 XbcztmNP6yhdZVcKYo7AgZMDURf9Ly6dz/LEC9WhBrYxKPOK5Okz0y3c9G2E/41OeAue
 CSfw==
X-Gm-Message-State: AOJu0YwHa/ITqLr/4c4a2pinhqmD5ZWVWwnHU+4acOaFspOxH3bUUyqO
 AtvMBvd3t/IYkz6TMPeAeZYhHJE4bUBiOgcDc+C6rlc8Lpl9xPTATbtn4V5Al39pIjs=
X-Gm-Gg: AeBDiev67B57nMVDxFptdoOHFQ3HNEof1YP8Gd6KCNncSkIYlgNneEwqh4DK7NaGUtV
 sLqdnG2Pc5JEq/czA+04diELRKA3k5IXnbpouvgYM7a/sHTL4oW9+aP4ytOWDfaIaQU19CFdLC8
 vZ4UmbTmM153zBWCW2uBa0pHtj0WOyFdsX5ZoApfCXsz5F/iEVyKqnGcMyxXkWmbZQP74yWVHuP
 7+YbDOaO1HjUnrKPSjBcgT5U5xheClQ1PkG2axjHSUFzivJ/gLZwsQ1TRH3/wu/3oBDeiTa0kZf
 4WOjO1wJhHkk+vEC9wbEgBuZ2oDfLib1+7oqUI0HLz99/cemDU1VfAqKEDORuJMD3Gm1gkGOHT+
 MPBDvNGScC3h2kJyGRa5O72Ao86dFSK+I4pYbYE4AbGx2GgSdWgDYCQ5m7zdtO+covjofQILnum
 HD+9UJaz6QwXL2bpxc3WVtB5xpuwl+bJOnriP9FuuXpms8lJ0153w=
X-Received: by 2002:a05:6a20:7291:b0:3a2:dabf:fef7 with SMTP id
 adf61e73a8af0-3a3cf77f633mr640317637.26.1777508493994; 
 Wed, 29 Apr 2026 17:21:33 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 19/47] target/arm: Split vector-type.h from cpu.h
Date: Thu, 30 Apr 2026 10:20:18 +1000
Message-ID: <20260430002046.59739-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
index 5d051e1d2d..f986602722 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -35,6 +35,7 @@
 #include "target/arm/gtimer.h"
 #include "target/arm/cpu-sysregs.h"
 #include "target/arm/mmuidx.h"
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


