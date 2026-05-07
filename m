Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41068CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:49:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OX-0000TZ-Ff; Thu, 07 May 2026 19:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OU-0000PU-6O
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:38 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OS-00015n-FD
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:37 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7dbe437b072so720037a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197474; x=1778802274; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=N60e+rhs64XQOAfjXQeI7o9bTGr9rQBK4IzRCD/8pmayjWY9NishpVc9DVYhYnysu/
 qndCciYIiz215BD4TQpxmllSZBzzuicXOUpMfYY97+65bBMotee1rFOajU/qHTZRuTW0
 JN9RCAfCmr8CXpvdfPvWsut41ThcoW2Q9U7KQ+NkIVkMySrsdpM9rehPqRs8vtrWsNhE
 sT6UzIjBzYcI81xhuZw1Pg4T1XM/7qrS9vtNHDQTSi7HATmAKoL7SPtCiPYjta2/0QDh
 e0/CPqwrUrq9hiTfkngaBdtwkF5cOR2pB2adpUC3aU1OcbWhGIFBUvbxcG0p+FtrxPBz
 zC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197474; x=1778802274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zWru1QCIwOGhRVfqONB531T6JUAP9Yz4VcrPsm570nM=;
 b=HgGWW9/P/rcUGHkO9Uj0cYvcVfzG9qhgd1ycSMsvA0T6MAHUtjGASuv7ja55t0NodP
 +vW7tC2GknlOR25F2VHixWxnAo3UgY7VPC/5jRwJTacpR77nH6U33RPUifYEcjRnp9Zo
 Ab88M1XyFk5JzOjcDwVMvlkLsmiN3JlCqGDISNsL9TuGh9GaAByl07aEoLWf4u+/SMAj
 yPi+ZBzf1U5j0KEonwlXwd0hCYGIAdRiOmUvmslwRGt2fvlJw/UC1NGqS5PWmvyuuE/J
 VOzzXt4U3j9jXIcc7ZlWXxKvcxb7aGMOkgHn+xwy85OD/xCgI1vkJytAElGN+MniA3mj
 R0DA==
X-Gm-Message-State: AOJu0Yy2Rk4y2TyROdYdN1TPo4k2CHsLmC77DLxOVo0Rjd8eQKWrcG6K
 FsaHW8KQk1n6kWzlkTSt94+gKXSAKVkvoKR7ufeFcnbBp/2S5TrcQJ6fdFe6RAyMdJ8=
X-Gm-Gg: AeBDievkByd7zKmxjiPmIMhsG1VXyCqMy40WX9Onq1j3thARASWrI7Ct2mjqypeMeh8
 vUrw75jMvBhixsIOG9JcZgJ6EldSLBcP3ElnuCNE4mgW30B5wCU02zh45tHMXIHwGfs3ylCMa2S
 RXfslHJd0UeX3/Czx+3FWEhGgG1QLnT0IjGxeKzoSzzjHSYCKCEc1SNz7RQh6JeY+b1n40KekmU
 e7S2Vd+5BU0YAf2R2FWWREfzLLfQ896cZS0S4LRvqlQWHTN0RCKjVI4hfRycOQUdkBONltOwpTY
 eWkDDF3Oahp8Zj8iOz04MEUvO2Rd0s/i4nYW1dL9G3rqQtv2jCzfpQo2EL++F33PEzvDoR6Byr3
 vIgnhum3t3J/T86bFOSAD7tyjkGWs9+Ti2Fr7xy4+dZVSg30SG+msYZeTm3OumiKcRdgEKSVtEC
 kV/y7mfjPiiGXZ4BDuKbcaWEVpyB1DGas1FEpAiz10YLIRLf/BPu6g+T7M
X-Received: by 2002:a05:6830:b82:b0:7d7:e6cb:836f with SMTP id
 46e09a7af769-7e1df02641bmr6481206a34.19.1778197474276; 
 Thu, 07 May 2026 16:44:34 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 21/60] target/arm: Move vectors_overlap to vec_internal.h
Date: Thu,  7 May 2026 18:43:34 -0500
Message-ID: <20260507234413.643512-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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


