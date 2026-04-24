Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00413FB44A6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:32:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8DB-000172-C0; Fri, 24 Apr 2026 00:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cu-0000XK-JQ
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:01 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Cr-0003A5-OA
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:59 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-42fb77499edso1293558fac.2
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005116; x=1777609916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VvhMkH32psM3D8lph3Pv20uEhqe8qrK6g7LCI4lgg/I=;
 b=kErJXbt2hlwvbYYGo2PyowW7yavTggaYl+IpQ4MiDfPgREim6T1lQ1Tb+bNocNIY3r
 5CekK/psCBjs0EFZcHEh8RQqvPAgpH76BrRRJJkQIvF1T4jMFmdaVwLUYNm4Bnuad/g1
 IzPJptCkq9i8vyqwzN3S8FKVJonYrJBLIWP13aBwZYoCZZETU/lWGdx/z5vMtVHRqoh/
 pBIqpdB8KsD11ad81tETfxEYnQzeHfcizzoyDBb2SJWprVQctQmpW6nrwrAbB1687CvX
 RTYcv191PG3Pv7QOdCMe1QfTUBYBGqR0eO/TrFQD9AGE0sVHgDR3Dk5bYda90HHaRcpW
 8+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005116; x=1777609916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VvhMkH32psM3D8lph3Pv20uEhqe8qrK6g7LCI4lgg/I=;
 b=omt80j08Ot+YSEPv+7X21An18hN71gmOgNODTkZQfr2JQrS+PotpQ4iqeY90Dqw38D
 ezBVpYiH69dFBYmoKc2A5337cAihaZDpZ+UsDHDzM4WKzYaT9f5s6Xofpm0z5Xp2Vu8+
 bCyTf3pgbxvRAvjzUQ6hgyExrZ5756YUCiCTeCvFCbqUl25OMGMXZabmZoeZ7Kkzx76r
 K95tnzF1uZ1OKCyhQ4Xi/rS0W45xIOtty78HKlZ72largSuP4ahl4ij1wUQ893AM5PLp
 J//Oyi747bxHbQs1uZEEjanJ4SaHwK1mu42Gl5pFVsHRNV/i5ZAv7qw8qbiobendU3il
 Ryuw==
X-Gm-Message-State: AOJu0YwpLtWSh7cHG3GJy8huT4ilAb867QzYTbQYrAWiGp7sib0UPGWb
 DTNs5DFc+39tVHs2h+ZCmgWP/Ht08Cc4qzWiqjD5ORGKWsIeUUV98jqNYIk1DvRMcxs=
X-Gm-Gg: AeBDievrPJZe+7ffrwufR4zX3fhnPVKdXekamzipi8yGdKAO0AfCyHNjsP4X/iaKIy3
 TA39AB9mumK7QzpGm7E8+VOtfUmcUXBsdYGx3pTcdbXWNE8kxd910zN/6yVCvJUmo61bLyOTI5j
 LBLjDh2r2s6uWqGyhEK4rfNuYXcX0JeL9i9lR5qqQ0uC/dgoAkelczF/awXGvHsH6UgkOL2Py4l
 f/VP7CSz4tgji2pDap+nYXHmM9FUaDcSbZEOYW6r6CdJtvps8Xb+/6BCnp3yL0ZH0ghWiLF5uP2
 O12rJAJm6TufQE3x6rBYyqc1ixHUcFCaWWiJUWqPA12dNl5re1NDjIF7escXp/Xav45CUDVxx3W
 Xzo20OxduAYHw+bxLKbDq9KCPQKznzXycFVgIwJyRTsvuDisd38t5k/USxBdOxv+MiNwaHhU7xO
 zVvhwhZZKJefMwM/xr1SVh3/6Tjdv4qjPztIDeCfWoUXU+HTLARbHGSu0gFWbSlw==
X-Received: by 2002:a05:6871:e405:b0:42f:beec:92d3 with SMTP id
 586e51a60fabf-42fbeeca16bmr7202572fac.14.1777005116502; 
 Thu, 23 Apr 2026 21:31:56 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 22/40] target/arm: Move vectors_overlap to vec_internal.h
Date: Fri, 24 Apr 2026 14:29:56 +1000
Message-ID: <20260424043014.46305-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
index b647399b18..dbc098d49a 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -21,6 +21,7 @@
 #define TARGET_ARM_VEC_INTERNAL_H
 
 #include "fpu/softfloat.h"
+#include "vector-type.h"
 
 typedef struct CPUArchState CPUARMState;
 
@@ -461,6 +462,13 @@ static inline void depositn(uint64_t *p, unsigned pos,
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
index ab5999c592..0055e97a2b 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -33,12 +33,6 @@
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


