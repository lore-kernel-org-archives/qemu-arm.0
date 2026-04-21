Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67062F588C9
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3SW-0000I6-C5; Tue, 21 Apr 2026 01:15:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rg-00084r-Tc
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:52 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rd-0006bx-NF
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2a871daa98fso25129795ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748484; x=1777353284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NN6xt2iu0Bo8EfnYcUGgF0JIURAXR/oqDeZBep1wYU=;
 b=pi2H9zOWQaLJr/dpsFaSjfNvrdRkZMVUw5qCDdZ5TPvyZLYPRllX9OjlRaEZwwVGy8
 qN7bCmAZKd0C0Hp4awmVwkA1coiIaldRuhpcBEgblW3L47xn+KZj+wXIbIV+54lTrj0g
 XXs1lynd9mpx74IO61Tp4rQh17DBo6qHZenMZf7eqCXgWsFqy/QMPI5VY2MY/qxjCKAZ
 HSUdD2r6tGN2/ZxRwf3AS5Uqeh9KrsZTkn29BAIPweSixS8eKk/sG23pgpf2z2PcfeGz
 dh8Y0VtfIe0HgzKbnUyaJ10BznoIYnIkyoavqkpQ1GB5ztiLe+dvkLe0Upn01OH4N/Dq
 rtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748484; x=1777353284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0NN6xt2iu0Bo8EfnYcUGgF0JIURAXR/oqDeZBep1wYU=;
 b=Th1/H7jCqcMDTG4WecPHDfIcDe/9NLqMdrTSh7vVPw9UdqAMuamsM2aNcouAK9XqPC
 Vt3XJJhG1T+OPcNbO3pizJz1znU8dT+/3Vi5EPMZ/dlIvMOK+wNMR/kKzAa/UFu/w/bA
 Osk5VqInCB5xBmZ5lSwWR22sG3Mj3mxh+eVNWv6JDyHqP2m6sbSmvzeUA1Hh/Hho1GLM
 li5Jlq4XORDCltJLK/OuKjmnkLtKcCwpwrIFMrWGapr7GRVUFdTpM9Xk+AXEVsL6k2Cf
 rsqZonLezesyp+xyESsPFTdMoTUCmqgg5oCcvloaMB5nk2ZvNpea6TcjTAAghDDBS2r2
 PFJA==
X-Gm-Message-State: AOJu0YzsQMBl8agegcsn80ppVSJ2PrqxwXfd6TpPAWga0EUdyI4VwB1M
 sDmWzVjBBn2BnKZ0V0PYPvAIW/Jj3zezM/QECSLghCCXkyZDWgB9OPezhq2rkVzhl6Y=
X-Gm-Gg: AeBDievkKLt1a/JwN7AMlKvfboDPoZUGcOZ2YitfcTIHpbR3hfBADPx2uxE4wiShwBg
 wkd0qyqvIqQGiGi9wjCPTlVeTai7o0gWp8Ot7pZUwg0ffRbOCR9XhxYtSBV6egj54zH07tc5NHO
 0RDNm3CiVCRDH9UKHucOXPOCAYxzxNuHLANGR2gMlykCdJna++w+cG2BwHnpLHosbRobZESH7iM
 vDTi+cu6pCPGBsPe2AJ9aty6Kz3KguaBhEyA49D7/0xGz7HRmP+J6zkrgXY2l/mX2+DKyxMRsRH
 Qz1nBZlefG19E9o9y31wTfacqT2vIzRHOks05bHqWCneXtrwRAAcVktRmfXPpn9RRmo5E1oolqc
 2/ntRKdCOvFQAM1cLoApWhqbw/AdzcR8TwR8j24VSxNGptaW5XuGvDdFrq19zU0HGVVox/F+h+M
 bozC9KtlzZxGvruCmQkuJalmD1JOlI1sad0b9YKYnI
X-Received: by 2002:a17:902:f08d:b0:2b2:4ded:954e with SMTP id
 d9443c01a7336-2b5f9f2f6ebmr115034335ad.24.1776748484217; 
 Mon, 20 Apr 2026 22:14:44 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/37] target/arm: Move vectors_overlap to vec_internal.h
Date: Tue, 21 Apr 2026 15:13:31 +1000
Message-ID: <20260421051346.41106-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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


