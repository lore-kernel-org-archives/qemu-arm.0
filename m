Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B31FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFA7-0006pt-9Q; Wed, 29 Apr 2026 20:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9v-0006mp-EY
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:39 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9t-0006Lu-Tn
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82f33d28c1dso205861b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508496; x=1778113296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=PO+VjProXmd4LEkzPinzT5kScRz3RgqsEuTGNk+2rlfb0voYr/NawWV05+AMDVd52l
 bPRibzsbPlURP7QyAWLfEz2JdLpJx/+MdZRfd3hKHYciBlSoMaufpbUneVl9Mq/+tlRG
 76IL2vcLp/SgeJyyJhHYwi/4fZfqnXUJ3y7w7qwThADRDHgP0UoJ2W6jhToYdAXgMlJU
 1VJpjZC2EMPavneiuT/2lKfVWfbpuOAQlB171p5Hz/61PsTbSG5NSecTkR7g4HBfi5aJ
 nBThL+jqz9TmiiOpEz0gBzU9o3pahALEVdmbB4f+g+dmoR/kZGiJHZ3tB1PwxHO6D2pT
 2+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508496; x=1778113296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=HrHylp51sIDaRK8bTv7dicb1bWaGSQl4VZnlFH/egibwUjqTEO30OaFNr0mv1LIhau
 7CtTmOdXq97StneRoZkRUWILZSSKxFdC023BS0axSrfkp3NoqQvlTLz/XsQdevSRj0IO
 xkWyRLHNRsJKX8nRCVvMmwEix+bBro9Xzdnbaqgz7UXwQee0M+U/NkQXtKSS9oA8SIUI
 uXU3m59OzyeSZiISR7h08WJZJWAMWzWxSxO1AEL75X3kYJw1GBkM0a+naUPD7gIdQaDB
 po0EpCvpubq+M3fRje9cq7rirm5gpFetOoVOI7TDm2A1EwGd3TDIcsH55t4XqhwYcIPp
 9CaQ==
X-Gm-Message-State: AOJu0YxUS/38WAGzWvoNKzxzokLtU9FbMA4Xpr8IxRG/vPcKrnFti1S4
 vfJk/KUVF8ZSZ10ZwmvHe4AtvxWJxfHLTcUws1PtyawBWMqyzEjbwfB0f8TLVB5rT8Q=
X-Gm-Gg: AeBDievK6KvSr3skv/nUYuuUXJCO5mZ6B0JEhNSiQWTuf0T62pSOXwkzL17cJRmSB9C
 HcFKneKHWjMcMTremo79+NjgxFrVlD+oBXSRIpAO+rMovGh8Sfbpd1Pc3GCpCipa/eE5FDzv+el
 0EvwBtdIeaPxjjux1rTjmtuVO6jXfnvgPDV7m1kfhd4kJdLUQXeRuPWtEsSBJpbkvdSM/ANJId8
 mzSvfu0JzwhoVVy2MJPZFKX23yAg6fP9HRmLF4NDHYs6otyZegl5MXmyfGn3iZD+3+ilY52tCYL
 iigIkhLlVYs2BN6zgNuZBMsOjzpYHsbl4zJp06JhQbqGjSxQc4CmAQm1t4JCtYlSd5jEw+oEryJ
 5sw6ZvacTC0ZnVGxtHpS0++jWfRImJbSlbqBS6LXni8kJQ/JRFVDjdAkMn0xaAFUnJYtl1Bg7p4
 YynpTBMd7AhvXHOwEJuh9Emal4U66jVAbEddOuvB/F
X-Received: by 2002:a05:6a00:27a4:b0:82c:7767:5bb2 with SMTP id
 d2e1a72fcca58-834fdc40e50mr749879b3a.21.1777508496409; 
 Wed, 29 Apr 2026 17:21:36 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 20/47] target/arm: Move vectors_overlap to vec_internal.h
Date: Thu, 30 Apr 2026 10:20:19 +1000
Message-ID: <20260430002046.59739-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

We will shortly need this outside of sme_helper.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 8 ++++++++
 target/arm/tcg/sme_helper.c   | 6 ------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 68b1116171..b906d2a2e6 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -21,6 +21,7 @@
 #define TARGET_ARM_VEC_INTERNAL_H
 
 #include "fpu/softfloat.h"
+#include "vector-type.h"
 
 typedef struct CPUArchState CPUARMState;
 
@@ -457,6 +458,13 @@ static inline void depositn(uint64_t *p, unsigned pos,
     }
 }
 
+/* Determine if [x, x+nx) overlaps [y, y+ny). */
+static inline bool vectors_overlap(ARMVectorReg *x, unsigned nx,
+                                   ARMVectorReg *y, unsigned ny)
+{
+    return !(x + nx <= y || y + ny <= x);
+}
+
 #define DO_3OP(NAME, FUNC, TYPE) \
 void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
                   float_status * stat, uint32_t desc)                      \
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 16b96890cc..7ef6f5d71b 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -34,12 +34,6 @@
 #define HELPER_H "tcg/helper-sme-defs.h"
 #include "exec/helper-info.c.inc"
 
-static bool vectors_overlap(ARMVectorReg *x, unsigned nx,
-                            ARMVectorReg *y, unsigned ny)
-{
-    return !(x + nx <= y || y + ny <= x);
-}
-
 void helper_set_svcr(CPUARMState *env, uint32_t val, uint32_t mask)
 {
     aarch64_set_svcr(env, val, mask);
-- 
2.43.0


