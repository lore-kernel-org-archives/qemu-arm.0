Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE78FB44A6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:33:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Cv-0000YG-I0; Fri, 24 Apr 2026 00:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cp-00006S-M9
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:56 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cn-000382-RY
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:55 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-42ff0576868so619399fac.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005111; x=1777609911; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24k+WndXoiq0k6mJkQd6Ra7B0sSV6OLr1icDt0ng834=;
 b=kU7sPBwodQMFdtmJRcBilF9YkaV306Q+DDBoRU/t8WfgdYHOzfoohqjavXO4bMb+Ud
 dj1zAnuU28DsW5yYx9/UH/1JBL28sUzFu7v+rHJNEBzyqFFCRFkogEc2yh9cfbKedexY
 fd5I/ODAopzmbHFEAeA870axtJRidUB8ZKbfdRmHP7bZoXLfedbu84q+iO4c0fSKrHd5
 XBEQNaTNsZR6nN7oH6KBKU1ooHAvdMBiHYBnnSxtRLIS+lAaV5AmOo5Nz9ERUT5LUv3n
 6gYmJwiV7zBi/AqKxmhkrxDr3/IlxCrLbbXP7EZifNl92PmCBWQny0qHC4ud3D7tUlTJ
 WNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005111; x=1777609911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=24k+WndXoiq0k6mJkQd6Ra7B0sSV6OLr1icDt0ng834=;
 b=jM9FX0OJ38zuAn+WAOuV9zy4xr7rPnEh8FcLqFEiABqUwQ0PmAwdB6kGRyFNPxmt4m
 AWOrswFpJOxn4mrWp/wYUEh8nKaOChvAN6iLWoDdZdbTU8Eq796pOgqk85NMwpYpzRlS
 b92JUvgn6rckvN9si+8cg4hu4dVOZ04tmdrqxAy5d4ov1a24VM1hR+arfovF8abWyQin
 bAgtPMy2+1o2vBrux4TCCzSFyoI5sMRT99cE2KEViRcoM0FzFBfAN4sOIfmFEN4/LxrR
 EUknhlPQlWrxRu0/O3U08f+wDW4OxITfCRUFcrCu4DWKcw6WQ1mANkp5oKVCqXARbVTa
 N5tg==
X-Gm-Message-State: AOJu0Yxio4VgBYS3oixgcP8qce8vF3km33oyI0lSlrQKwqMtc4MOPjxi
 VRXlkwNy8lpGDaD/BNoExoquywcw50jcbg2OgQTCeBbeCnwKVMEArTH7FmYN41ZsBoY=
X-Gm-Gg: AeBDievMwERCs6Qhn6uKsX61izOuGDgEb/q9uyQMDYxKeWFg1kcZte0VBFhiEBjSV/W
 AtG/MGiuNBnfN9GqSOz9JuLx2ZfzuLMpTRvrvdttTcXPKQLgd7l06kFD74X/e+Ky7h4iSNq5m8o
 Ws+n6rsF6Oeb9RGnzHEjbA13YFHnA0M7Do4WJeXMJq3ZWRY15r/4NSozptEzjFE4M9727k2XQSH
 EGJYmYnT05V0CRaaIg4EREOwKrIUopjUdaRWqForzxxMSspmV3gBHD4WR2zRA8r5oNv6eaRBABw
 g/Nv+eYal+uh45wr4QRQcWwUDAwOEYSrDtTDH69jpfOJ50X9Pegw8aijX28tW/ivwpka7E/3/v/
 Ez6FR84TygbpCxppjP+Q6dXunHRuaF4TeSGQIJPB1GD95MS1VhIkbrkzxEs2NUNhX+V9jL+piwn
 B29MjxA3z143Q8i6bF0yAPtoxPLE1yNXQkUqUFkQLqqpgBX7yA3wn3PJjILq0hytZAe2tWehvS
X-Received: by 2002:a05:6870:304a:b0:42d:c200:4204 with SMTP id
 586e51a60fabf-42dc2007ab8mr8791166fac.18.1777005110929; 
 Thu, 23 Apr 2026 21:31:50 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 21/40] target/arm: Split vector-type.h from cpu.h
Date: Fri, 24 Apr 2026 14:29:55 +1000
Message-ID: <20260424043014.46305-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
index e78bc1737d..c0c13d37b9 100644
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


