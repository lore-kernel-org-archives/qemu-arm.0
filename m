Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58F9CD4F54
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:53:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3Gm-0005fL-Bb; Fri, 29 May 2026 15:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3Gb-00053V-Ck
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:13 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1wT3GZ-0005bG-Fg
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:53:13 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7e615b4c2a7so2073195a34.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780084390; x=1780689190; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=P9vcQsGYUow+REMAsX6whxxeUVOLdzVNMd+75Ix9S9s=;
 b=pHm9yvECCeTPdA5//t0f2pzZL6asiSJtbf0L3+ltuwBqyapDEYAdgv5U1g8XtE9cKV
 /i39UiI8r0jScrzCqniqQKgVJtAf4wr5sm2LfCH5GQ493yIbb3DLjKYXh+7hgwvCg439
 3hOgIPB5+tPeLQN8wAqdxSs4lLXafdVJ4RV5C6QtmCx8Kve09nQVaRkGqSlVLju2b9OU
 b0Pm9+oRAeLe41nGZSp5VbncvAjr4IiMBDWaBJZtkqVT4y4cniNjzYlhoQqainPt/9K5
 tIWYEoOv0EAkxL6h8fv/MZ7jG41k2SgCozmLWEarg7NNgz+VJpRb9CMCxjfGa7UGpson
 KMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084390; x=1780689190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P9vcQsGYUow+REMAsX6whxxeUVOLdzVNMd+75Ix9S9s=;
 b=I9Pq5G16NBmGuncnhkYPZRsLIR/gbTJh0eCo8AFDbjMIvUzrGmIjHt79Fes2RD7m2Y
 mLgNnJe7B4Z2LTIwuUOByDcgrHrqHh++b8Sr1bBvWrgDxVAORjttx4/hBqU83q1Avtwb
 ybbOevkgX/hpcb2wgapq8DN9DuTGlPDI3WdU+GbWYfp+NAd6oPmRMhuSRiUCZxLjvpUR
 1thC5en/BTISGn4atpJUv/8fQSFDwKvdIfgPVkErfwDQaq+gz7Uh16Bgsl8dGXu9me7q
 Xszdpj6D1fRcQBHiWd3dvB2kIGpex9oGBKgL2OX5J9XBylsS7bPMG8jBOh8wToSBcBd1
 Hdyw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+SURm6TCeBTzSmNIaPbI2+XcN0QBdyiT0gvmRs6eiWZQs9Kc6PMaV8Z3caZoBaokNphpSPK9fL6A==@nongnu.org
X-Gm-Message-State: AOJu0YxQYIBeVoZJEIkrIfUqsKpl2vVasLJ7tvq3qIrhj59aoSs3hkFz
 GR2DUhcVGxlkNbK6mNCmu2bbovgnkTXQsVYXWNOK1ywmK5UVSkfCco9v
X-Gm-Gg: Acq92OFpF/vIJYQjrqqGuD+vIOEHILcNWvgHI3jvc+CfKuth62GtQL7NjYoXWmp4nOb
 IxpNV0qw1ctwuS0+4QgekB+eeu4Qua2nauPDig4+kil94b8icop8Hts3V6HFfR2sYjQEqqDEDHp
 ZwW7qY9OxAQDYy8+z8egSj3W9ghMEvz82T0Mnpj8/335bKWVX7Lrw6S1JGTxAjjViHqTgOuYk84
 ghoGYlBeCwDwIgkouXOQ6y1I+PPswumiu0JKAXmbODhg7GJCRXjy2HdXoFE08cegy2TLS/W6Bb4
 cXc0p0Lr1yP+juVzlVkKpbuqkDarE2UTgYBaOZnMSe1y4sFNSl5mUB8wEt4t5Fgu87pM80pGMCL
 L764Yr28BP5dtqSQJMLfVMlQkxl2CkaTdVdZAltOZPoEPoAW5nxELUt3IDIpI2hBvrRQDzGdM4L
 Ri6ne/tE4TFeNiILskGwXauIUncl+3qyCVFLNDS00rLT0=
X-Received: by 2002:a05:6820:168f:b0:69b:56e5:e4ce with SMTP id
 006d021491bc7-69e1038ec57mr396066eaf.37.1780084390227; 
 Fri, 29 May 2026 12:53:10 -0700 (PDT)
Received: from [10.21.163.79] ([146.74.94.63])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69e06587eecsm1626692eaf.0.2026.05.29.12.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 12:53:09 -0700 (PDT)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Fri, 29 May 2026 12:52:51 -0700
Subject: [PATCH v7 11/15] target/arm: skip tag bit bounds check if MTX is
 on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-feat-mte4-v7-11-ccbd3c14eb3c@gmail.com>
References: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
In-Reply-To: <20260529-feat-mte4-v7-0-ccbd3c14eb3c@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780084373; l=5285;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=IZ61zED50gBFn/PGhlxkZeDoDl0hStihhPseolkq5Us=;
 b=Zu5DHA0GS+3Jttn3qugbbVTLlUtMk1olwHkqT6UOFpgAxEdt2J4T7qHHNTu6oZg20qXf2GWTy
 hspkKtbCo/2D0gojQjQJ/tSeaV0lRQCEMhoj8LCMig7kvrjnTXtQdjl
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=brookmangabriel@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Virtual address canonicity checks should ignore mismatch in tag bits
during translation step if MTX is set. This mismatch is checked during
the tag check instead, in that case.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c    |  6 +++++-
 target/arm/internals.h |  1 +
 target/arm/ptw.c       | 35 ++++++++++++++++++++++++++++++-----
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 902eac767b..768a8e977d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9747,7 +9747,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
-    bool aie = false;
+    bool mtx, aie = false;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -9784,6 +9784,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
         hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
+        mtx = extract64(tcr, 33, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
     } else {
         bool e0pd;
 
@@ -9799,6 +9800,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
             e0pd = extract64(tcr, 55, 1);
+            mtx = extract64(tcr, 60, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
@@ -9806,6 +9808,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
             e0pd = extract64(tcr, 56, 1);
+            mtx = extract64(tcr, 61, 1) && cpu_isar_feature(aa64_mte_mtx, cpu);
         }
         ps = extract64(tcr, 32, 3);
         ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
@@ -9905,6 +9908,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .gran = gran,
         .pie = pie,
         .aie = aie,
+        .mtx = mtx,
     };
 }
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 51d7f09889..d8f68270a1 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1420,6 +1420,7 @@ typedef struct ARMVAParameters {
     ARMGranuleSize gran : 2;
     bool pie        : 1;
     bool aie        : 1;
+    bool mtx        : 1;
 } ARMVAParameters;
 
 /**
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6cb0fe5645..8b54018c98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1951,9 +1951,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        uint64_t top_bits = sextract64(address, inputsize,
-                                           addrsize - inputsize);
-        if (-top_bits != param.select) {
+        /*
+         * If MTX is enabled, bits 56-59 aren't checked for canonicity
+         * during translation, since they will later be checked during
+         * the tag check step.
+         */
+
+        uint64_t cmp_mask = MAKE_64BIT_MASK(inputsize, addrsize - inputsize);
+
+        if (param.mtx) {
+            cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
+        }
+        if ((address ^ -param.select) & cmp_mask) {
             /* The gap between the two regions is a Translation fault */
             goto do_translation_fault;
         }
@@ -3514,15 +3523,31 @@ static bool get_phys_addr_disabled(CPUARMState *env,
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
             int addrtop, tbi;
+            bool bit55;
 
             tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
             if (access_type == MMU_INST_FETCH) {
                 tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
             }
-            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            bit55 = extract64(address, 55, 1);
+            tbi = (tbi >> bit55) & 1;
             addrtop = (tbi ? 55 : 63);
 
-            if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
+            /*
+             * With MTX enabled, bits 56-59 are not checked according to
+             * AArch64.S1DisabledOutput.
+             */
+            uint64_t cmp_mask = MAKE_64BIT_MASK(pamax, addrtop - pamax + 1);
+
+            if (access_type != MMU_INST_FETCH &&
+                cpu_isar_feature(aa64_mte_mtx, env_archcpu(env))) {
+                int mtx = aa64_va_parameter_mtx(tcr, mmu_idx);
+                if (mtx & (1 << bit55)) {
+                    cmp_mask &= ~MAKE_64BIT_MASK(56, 4);
+                }
+            }
+
+            if (address & cmp_mask) {
                 fi->type = ARMFault_AddressSize;
                 fi->level = 0;
                 fi->stage2 = false;

-- 
2.54.0


