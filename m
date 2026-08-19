Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154D9C5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 19:00:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwlWQ-0003R6-VE; Wed, 19 Aug 2026 15:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwlWP-0003QW-86
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:00:21 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wwlWM-0000Sa-VC
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 15:00:20 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-47de008b020so141402f8f.1
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787166017; x=1787770817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CyLMKJhOTMdG0j0ut/RGezjH2K50Eg1CaICWQOW4q3c=;
 b=q/ibiOBn73sbNDwGSF+ZJCMIHSk8LIXFSs6PX8qZhEmqXh483RxlZ7HwXUeTaMVRm9
 F6vy3Lc5Eo8xzACCYPsqBx2xtzZBNCZcrONe2e/s6f032li56cnVBGjNrBD26w2qZkLr
 4sgQb0rGbY9An+2C+OSklll16vt/hU4JQj/qxw0FSalAvpfJ3218VuelwR8vk1Eo70p+
 qw21dJOK80rVYdD/ne/4iKG9aVSgu68CJUqJgJ7WLXXUKqrMpHK17Vg6ZOofQ3RznhcD
 estq/DWfoU9X3R4x80u2mzgEwbKKjXA17UuJ496G3huqsYmd84AJzuD5gIGhwpTMJhp3
 dhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787166017; x=1787770817;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CyLMKJhOTMdG0j0ut/RGezjH2K50Eg1CaICWQOW4q3c=;
 b=nq61B5kXyOUvbEUB/nUvK2i31ubq7aeiv2KNAbqmGK6BcE1IyuUsVCGGu7H7kxr655
 2whpKG1Y+/X4WB0MPhysAckKbzJ9HpNhTyoLF2H5+XVuUquJEgZceHeUbq+lYiQpnPDa
 TtMm6U4g2tVEWDq8BiDClxQPx1kKNgc5Hs+fxPaXXCjq0qdwiqhyrKP4zQphAolL5ZaR
 G8NvMO5KzK1YrSWuU0wHIzArDzZJjwBNuqDMr/Jb3R+7VM6ba16Xsnn4GwMLOiyEm89z
 QE11ptQUNMsxbgN1My4LatRTngD3LG3Z7N9qjt1zVtM87dhjEUe8q0vPZEh+RFE0T2o6
 iC1w==
X-Gm-Message-State: AFuF++lb6Axy5/8V39vybf3XCrNVg1I/IGZB4nUuhuoB0k6Lbytl4pp/
 IIa/LnkDfdLILnerAjkCyz8d5Q8v35BNQqunk5rS2eJB5qqVlJ2boptAocXX9JgRfJnco/D2v6s
 W8jwP
X-Gm-Gg: AR+sD13OS3spd7VSQT2lELmMnavArQQpddVwDxD9XWFz9NztL3uJh1gOLn772PSWkKM
 OIbJTMc3gNzFKEKSqsJHJFW4Sg03UlCfiu9ZnhOj1LhiffTtjdiF0XbPLTS8kSPtYAM5WJNXIub
 rY5t/T1D/nYCF+S2km2P5pOmu60NDxFpKHeX4YoeyJu0dbvliSYbZHbjqunvsBJ9ewCc5VJpZpK
 +yEAw1WPE0FID7QLWl7zqHn9cB7QRynj9KQZKeIchX+bdNg+X4NnS0qtD+eObk+N61xs8zhzQea
 Bd6QMUnQiYt0s0HyVLr0bRUxzsRKFc7pEvrAD16FJJtuvTYocOGz7aYwURB0UhsociZIML/dNn9
 Pzv4s6grHk7QYZ88+rh/URSf5wlqM0A/qULd48ZFXecey0G+yk0qEOk3kfNmQQhpwNmgMWtd44U
 AmfvkSd/ZcsPl1Hj8Jc3FRiiZJ2K2q9LA5m5jUD/6luwbpsVOPZzJ2lLF5XNOccHQCom1q9oGAO
 MnwDGv6cqcf/wZNFcPB0YXFHN5PvdxeOC+1ZizjLtTlCy8qPOHpehQQ3gq9WGnGeS8P+A==
X-Received: by 2002:a5d:6f01:0:b0:46b:70db:2113 with SMTP id
 ffacd0b85a97d-482b74dc7a7mr2175210f8f.0.1787166016892; 
 Wed, 19 Aug 2026 12:00:16 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1441753sm8256770f8f.5.2026.08.19.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 12:00:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] target/arm: Don't enforce alignment faults on Device memory
 for SCTLR.U == 0
Date: Wed, 19 Aug 2026 20:00:15 +0100
Message-ID: <20260819190015.3555218-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

We enforce that we take alignment faults for unaligned accesses
when the MMU is disabled or the access is to Device memory. This
is correct for the new-style unaligned accesses rules that were
introduced in ARMv6 when SCTLR.U == 1 and then became the only
option from ARMv7 (where SCTLR.U is RES1). However, it isn't
right for the old ARMv4 and ARMv5 setup (and ARMv6 when SCTLR.U = 0).

We don't emulate the v4/v5 alignment rules (which notably include
"for unaligned LDR, do an aligned load and rotate"); but taking an
alignment fault is definitely wrong and isn't what QEMU has
traditionally done.  Restrict this behaviour to when SCTLR.U is 1.

(The other place we enable alignment checks on Device memory is in
ptw.c, but we only set TLB_CHECK_ALIGNED for LPAE translations, which
are guaranteed to be v7 or later.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/hflags.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 0716ca98fd..5047b7b697 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -47,6 +47,18 @@ static bool aprofile_require_alignment(CPUARMState *env, int el, uint64_t sctlr)
         return false;
     }
 
+    /*
+     * Pre-v6 had a completely different model for unaligned accesses,
+     * which doesn't include taking unaligned faults for Device memory.
+     * v6 has the new model only when SCTLR.U is set. Later architecture
+     * versions repurpose the SCTLR bit for something else, so we mustn't
+     * test it except for actual v6 CPUs.
+     */
+    if (!arm_feature(env, ARM_FEATURE_V6) ||
+        (!arm_feature(env, ARM_FEATURE_V7) && !(sctlr & SCTLR_U))) {
+        return false;
+    }
+
     /*
      * With VMSA, if translation is disabled, then the default memory type
      * is Device(-nGnRnE) instead of Normal, which requires that alignment
-- 
2.43.0


