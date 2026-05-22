Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E56CD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:08:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXz4-0000mu-5P; Fri, 22 May 2026 18:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxv-0007l9-6z
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxs-0008KD-Kk
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:34 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3684a6f3b0bso3933820a91.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487410; x=1780092210; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7LrqnCZWislAjdzjKOxxr1dhsIsKTHY94bIvQqnEMg=;
 b=i3+3pyg1IqFkhe4cmv+5izlUOFLyHjcPaKvZCPsJX3vFoekIYxmFGurcS2xpeZtQcP
 BNldijV4gqgcYbPjuRBLcuqIsTLbKc2GwZiazXQF+zkwN1P80rKoLSqUnHE3qZsTq5se
 qHCwztSSaX4bfPWtNSuWRd1vs4MqF2+N/gWYNim4F/EfFVB027gvHe2+cFikWKuT3F8g
 Ppj8S9IPq568GmCBqx8xHkmnaEMWXrOo6GvvdecKKTeRvKWdihuQ/lP18GeSojDK8K3z
 hegNntbhdXRZ9Aq5s1cbQPrwjin/nIcXrgl6vpSuPMuDZz30rVd5gWG54C40Cbbx2GVF
 O3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487410; x=1780092210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J7LrqnCZWislAjdzjKOxxr1dhsIsKTHY94bIvQqnEMg=;
 b=hCiEnSy41p+obdR1Ibht/fw+zPnEOfBAFkPvB1Vr1CbiCH6tFPKbWVwueuwEPNKfRB
 V7GF/l+rLq0rVSUSVH9maq78Le9AAEH4d4/QISkynJ+DQIS8eHJzxhXtYivzSEsAt4Mg
 nvLuuQfCCj6KYoWWWOQPDtw9j5U3rjMEDVqPtjQR2RccXzvhG/KwbboQPTGQO18+o+sT
 lD8bNz7/rXBsjW13TdfOPEaJbjHut34XeUo9BxQAykbvL210k+a/Cqf2hqHEi0z/avF8
 huDTwRGfOsT9IrRjSqi6BpV9Ju4NTJHZo3NERnCcLJVkrxbi2fWysYL8Q9Abh1KpqBAY
 hGZA==
X-Gm-Message-State: AOJu0YwMM1FBaafACZ4O1UdHVSAyDY5hxHqcAk47+rJLgBpaIRDrB1Ha
 qIE3uY3LQ+GZ/mn/smBhA0L1zZ/WwLze2RfWcGswdVuUGHE7nQIl+3ckf6ELTgLQOEU=
X-Gm-Gg: Acq92OEAuSam+sPsFz6WzEPbTrjHbMeZd7ZxixFrWPQRdY8BsNvc/2uUjKrALPItWSB
 Z13/V8B0mqL+5dXmmEPeHdfgHEn/TXYb23vnSLaEiQFip86GYtixxsRnZTgWOlCBrrtnnIr7zFz
 fkyidLh1xCdS58ID7GbX5w73xyecK/1QzE59NMPnc/aU3SnfumwNtjmRB2YMmmK/+PTRDo0MsSp
 mxWlPFZ0Dd9hEZD34shCo7shClIntmKUYqOFiINDcHkktiDy+DxiACcdxMRlvQfAqOq5GoyDAq7
 xpfyGmUfR5occ7EILY+yBl9qg8GO7357FXWU37dZyOJ1lrE4ADPD/FNS5K3xo7Qf9ZvNEpGJaya
 coLH8FowwS9N/Lit1cTk0MeaTCRzi6Gf2qvBOa5bb58doRAk7D6hrDnolkK1YtyomZKpV2KqytI
 dJMsSwVzMBh09UfnVmCULqE+2krcd2
X-Received: by 2002:a17:90b:1d44:b0:369:7944:d723 with SMTP id
 98e67ed59e1d1-36a6bb5a6bfmr3524077a91.4.1779487410430; 
 Fri, 22 May 2026 15:03:30 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 23/64] target/arm: Move vectors_overlap to vec_internal.h
Date: Fri, 22 May 2026 15:02:25 -0700
Message-ID: <20260522220306.235200-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
index 758e3db1c3..84f7f15228 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -21,6 +21,7 @@
 #define TARGET_ARM_VEC_INTERNAL_H
 
 #include "fpu/softfloat.h"
+#include "vector-type.h"
 
 typedef struct CPUArchState CPUARMState;
 
@@ -463,6 +464,13 @@ static inline void depositn(uint64_t *p, unsigned pos,
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


