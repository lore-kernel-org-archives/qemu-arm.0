Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86C9CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPc-0007t5-IE; Sat, 16 May 2026 20:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOp-0007FJ-0w
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-00052c-N3
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:29 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82fa8d6425bso476933b3a.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977823; x=1779582623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=opBm/S535v4Ty+xC7WxtAukQhhjB8CfH0eL1l6AuAIZeqOOs0PvRmmvAW1WyeVNylY
 M+tteDrpU3YrIswcGwH4WXIb1GdkneoXZ2Ss648U9zcuuyA03Clmv6dAQxb1maqZTjFN
 Q4Yr8rtZBEv8SYuGl8/hyavRbHSxvOColzTBsUB8rO0wE1yoJ0eTRWmAjud2nboUgviC
 k2itjvlLpC+k9tEh0PFTko+bTyY1g8OOl6hNPJlCOLl1gXEQR+fDJcijPw0ygWqjrLqm
 Gb7rhWENZD3UE/jX05UkIZyDevCMjc6Cr/jul70RLQHq/9j4NLsmYs70ExJW/m9phmpl
 DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977823; x=1779582623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=EoJlPsboWT7JsnvcVGxyAZckp2n/VdBchhWXztN903dmbqzn9IyN5tJ64Yz5/HFvEd
 8O4meGV5O6MPyRjo6vfJfP5wn4y2B2jS5DeJp7StIjsywsXIaTcEatw2hKW3a3HKMkkb
 tCxbqO8jffTjQ2iXna149J45UpFyUpfJNDAqracHtB0R7mSz43Kb+3xcAavf6ss4DnJf
 nElbQbXQoQhMuTpO+GDhjBBil4AMJZD/2HZv0XSfsPpduelqf1VKI/5IOJ3XJZQ5ZN3B
 9/mpBMxS9boIafI/xq3IHcV6KmR64kc4mWUJW5XFStQ1iZf1lvoi76+fm5ZVV7rC7AbJ
 euiA==
X-Gm-Message-State: AOJu0YxrxWB07p6P/qwEFbs6WY/i8XoJ5GwPNIJCiGh4FvEJxejpzuHy
 TmkU6izHXuE7PNz4fFl7HUTgxb+GGcljocMzBE/fD4KB7rwI3ky9aU9GXEOo/uScSgg=
X-Gm-Gg: Acq92OHRL0oEOvNr+YIdDyb1nkygMlxeyt2wklHOA9aQgcYQnBjSGrAG8UAdnf3rq3j
 4V2O05rIuuldyYOoACuZSysALESoZp3AYH8t/MRavMxPumFvlrDmMiinfkQFSDlBlqshxMWOkvn
 BgcfnzBRG1W/2F20yAjYiQVT9syZ/EZt/1RT1abfg60SyDHMsxAPKYVA7JcbRVXphyTKwahv2/7
 JkOFm9fJoi30WzuUalx3GDRSBR9nTEYuUg0YwmPVTtYzV0lqYGmRFFPQkBSe2EePEGrysKBLGtp
 NFnKz99REVYfN34uHYRyIeL43iSaD9T0TLXY2dCo5x81AIIpFzfShhO0ITDPKY/Qzle6nvBo4+H
 GOP/qsr3DB3jlcdqUJiGUF/4U4lwIDIsPX/8DwmZPfaKvRjru/tCr7txl6ezblcbTLl95qXs+oM
 yXKxC/6PtWD2srUCEpouUtctqizuaF
X-Received: by 2002:a05:6a00:3695:b0:83e:b443:965e with SMTP id
 d2e1a72fcca58-83f33c32a19mr9737704b3a.3.1778977822585; 
 Sat, 16 May 2026 17:30:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 22/63] target/arm: Move vectors_overlap to vec_internal.h
Date: Sat, 16 May 2026 17:29:21 -0700
Message-ID: <20260517003002.321430-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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


