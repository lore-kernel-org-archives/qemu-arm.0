Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B79C79FAF
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Jan 2026 18:16:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vcp88-0001PD-Bi; Mon, 05 Jan 2026 13:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7T-00017H-Ft
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:57 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vcp7O-00036o-NU
 for qemu-arm@nongnu.org; Mon, 05 Jan 2026 13:15:53 -0500
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-88a2d21427dso1431986d6.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767636939; x=1768241739; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K1wY6K4tRJI0JdX7e3qGoxLV7SdshDJLqi/7D/etC/8=;
 b=MBMpY++6eUtNy4bW2jPjejI9aIJk9nLUzi72FcD5SdqBPIyUKfSBpQNFsyEsKoGtvG
 yHgt/XBf5Oh9GxZn0LaRpC+zb2c0nx56XwYhmA+ihl6/KEjul8q/RvuzUovvY59+o6iG
 5kNNkQBiWm5TWHuT037sUHuDtTCVw6YgbDtjaCWxjD5fEC2U/W8S35PVSGiMvUGpLFX1
 q/v+dZsUfzvu9LKdNv05MsRn7Lfv65qTaOUtyWK/33mM/m9+8Srx8S034ZpEBPpuvKX9
 McOwKQWdTvMt8PjVbNWKz1Mr0hw8CvtuwqE/a+rXcaDpijMN+ssKD/YGZKE4t1DOp5+1
 FHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767636939; x=1768241739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K1wY6K4tRJI0JdX7e3qGoxLV7SdshDJLqi/7D/etC/8=;
 b=UuUZZ+q+i2Kcwfu45mfu0g5vNBlGKEqfZow1upD4gLDreOzwQkHH2mwK7tSBXflwzM
 Plwcm/qnOMk3m9qsr/5pYktf9t48Wk0wEAwaFaf+72E/Mf0kfU6Z2DfveSpDS+2R0fAX
 197dnEv1hqDOJMnCvHLFC0LU6+n/+77lHrmQ8HZj/Cln6/hFNTmm5pjlIQLFEvKnM8jp
 P2wY7iKMR5I6+cW6njDFLMLTKXwP9Q2IvxKXGKIWqPevxSrEa5cVJzOQfTVeeMot87CU
 HYZkpDQGbfiuxKmaX4YiTgRak2YlnrQvX/wmY2XsIZAmQGwxsRMyvsFJiRUCzgf21dN5
 93FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULNca5Y5VrojP2gqvi+UyFL223KOMVPG9qNpg1S/sqdDbaCK51BPAW7ZPKat9AXHwxoT2YDJie4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yy2UZtH1qAqb1ix4Q4eorwA55MNdbTSsvgM83/4ODHRDCphoHUU
 VCVFVremInyQXPrvAf6mvD7AWlxSPeQuj99aHXyXYOkDJ4IDemkMXt3f
X-Gm-Gg: AY/fxX6Ctu/xG40YEsThbA7MgDE07PGaKJPkhQSRhY80p7BV0bCi0q9mNx4riMehvAW
 aA+pAWtalLwuohUXO1M0+2JkIl/Wz973jIlW26ZgB3ZAaX0z4ilRdclvH4zvesYbDAx/QqMAt3c
 KeR2SuNnuY8/+uccA4XPU80HjyTmzRQaV7NEgDIQflX8AZv9KzSLpmdEoB0JLii8XK3wzwLvbq5
 o5sl5TadWzWLGpi2u0T7IeDeCUJmLi/SJZzrNd2VaYJtpxTAytKoAleyGLUprfst8RM9fEFyILD
 IBwxsdgK5NdoUEaZ5/SXqGHyymKVWJsaxHyNbd91Dw3t7wv5fXhvFZP6xsdBHRraM4UxVXQwK5C
 tvl0G2DLZyzcgLWxOdo8f2x9GN9OX+vO5n1PI86ek0sP9xhPOrQxUQiTN+rgfWfB0/pYpHG3NPT
 Rmv5AIwTRa1e/a4IarV4rjUa/A
X-Google-Smtp-Source: AGHT+IHu4Z0N0QvrVyu3+3zXUr8imkbQtAqNuzklhU5BCVSRMP+UIRmcQkpjkNCjnmFEOD9FaTMIqQ==
X-Received: by 2002:a05:6214:540b:b0:880:5279:98eb with SMTP id
 6a1803df08f44-89075ee422fmr6137026d6.44.1767636938361; 
 Mon, 05 Jan 2026 10:15:38 -0800 (PST)
Received: from [192.168.1.204] ([185.213.193.254])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907540e24csm3855706d6.25.2026.01.05.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 10:15:38 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Mon, 05 Jan 2026 11:14:58 -0700
Subject: [PATCH RFC v3 09/12] target/arm: added mtx to translation logic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-feat-mte4-v3-9-86a0d99ef2e4@gmail.com>
References: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
In-Reply-To: <20260105-feat-mte4-v3-0-86a0d99ef2e4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Laurent Vivier <laurent@vivier.eu>, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767636923; l=5998;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=zAdkFwmk5od3EWhS9syG704jByQ4Vosg39i2u0hIl5o=;
 b=+yhPulw8RtzISRacRkwfr5ieKJ8Ggx22lAf+XU5bThizmwSlyF/fYLsCQxqDnUZgMuSuD4zjL
 X7o8Z12kJmlASzvMuMf5HNz8WcIfoSP5rS2f3gmrXFvoai9sEaoaohL
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf29.google.com
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

Added translation logic to ignore canonicity mismatch in tag bits during
translation step if canonical tag checking is active.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/helper.c    | 16 +++++++++++++++-
 target/arm/internals.h |  2 ++
 target/arm/ptw.c       | 28 +++++++++++++++++++++++++---
 3 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4086423b6f..5e8b5b1bc5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9579,6 +9579,16 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
     return env->cp15.sctlr_el[el];
 }
 
+int aa64_va_parameter_mtx(uint64_t tcr, ARMMMUIdx mmu_idx)
+{
+    if (regime_has_2_ranges(mmu_idx)) {
+        return extract64(tcr, 60, 2);
+    } else {
+        /* Replicate the single MTX bit so we always have 2 bits.  */
+        return extract64(tcr, 33, 1) * 3;
+    }
+}
+
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
@@ -9703,7 +9713,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
     bool epd, hpd, tsz_oob, ds, ha, hd, pie = false;
-    bool aie = false;
+    bool aie, mtx = false;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -9740,6 +9750,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
         hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
+        mtx = extract64(tcr, 33, 1) && cpu_isar_feature(aa64_mte4, cpu);
     } else {
         bool e0pd;
 
@@ -9755,6 +9766,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 12, 2);
             hpd = extract64(tcr, 41, 1);
             e0pd = extract64(tcr, 55, 1);
+            mtx = extract64(tcr, 60, 1) && cpu_isar_feature(aa64_mte4, cpu);
         } else {
             tsz = extract32(tcr, 16, 6);
             gran = tg1_to_gran_size(extract32(tcr, 30, 2));
@@ -9762,6 +9774,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             sh = extract32(tcr, 28, 2);
             hpd = extract64(tcr, 42, 1);
             e0pd = extract64(tcr, 56, 1);
+            mtx = extract64(tcr, 61, 1) && cpu_isar_feature(aa64_mte4, cpu);
         }
         ps = extract64(tcr, 32, 3);
         ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
@@ -9861,6 +9874,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .gran = gran,
         .pie = pie,
         .aie = aie,
+        .mtx = mtx,
     };
 }
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 31d37b80fb..e3e36300f8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1395,6 +1395,7 @@ typedef struct ARMVAParameters {
     ARMGranuleSize gran : 2;
     bool pie        : 1;
     bool aie        : 1;
+    bool mtx:1;
 } ARMVAParameters;
 
 /**
@@ -1410,6 +1411,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data,
                                    bool el1_is_aa32);
 
+int aa64_va_parameter_mtx(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx);
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 9f864fe837..f95034a2a8 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1939,7 +1939,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
      * validation to do here.
      */
     if (inputsize < addrsize) {
-        uint64_t top_bits = sextract64(address, inputsize,
+        /*
+         * If MTX is enabled, bits 56-59 aren't checked for canonicity
+         * during translation, since they will later be checked during
+         * the tag check step.
+         */
+        uint64_t masked_address = address;
+        if (param.mtx) {
+            masked_address = deposit64(address, 56, 4, param.select * 0xf);
+        }
+        uint64_t top_bits = sextract64(masked_address, inputsize,
                                            addrsize - inputsize);
         if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
@@ -3487,15 +3496,28 @@ static bool get_phys_addr_disabled(CPUARMState *env,
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
-            int addrtop, tbi;
+            int addrtop, tbi, mtx;
+            bool bit55;
 
             tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
+            mtx = aa64_va_parameter_mtx(tcr, mmu_idx);
             if (access_type == MMU_INST_FETCH) {
                 tbi &= ~aa64_va_parameter_tbid(tcr, mmu_idx);
             }
-            tbi = (tbi >> extract64(address, 55, 1)) & 1;
+            bit55 = extract64(address, 55, 1);
+            tbi = (tbi >> bit55) & 1;
+            mtx = (mtx >> bit55) & 1;
             addrtop = (tbi ? 55 : 63);
 
+            /*
+             * With MTX enabled, bits 56-59 are not checked according to
+             * AArch64.S1DisabledOutput.
+             */
+            if (cpu_isar_feature(aa64_mte4, env_archcpu(env)) && mtx &&
+                access_type != MMU_INST_FETCH) {
+                address = deposit64(address, 56, 4, ((mmu_idx) && bit55) * 0xF);
+            }
+
             if (extract64(address, pamax, addrtop - pamax + 1) != 0) {
                 fi->type = ARMFault_AddressSize;
                 fi->level = 0;

-- 
2.52.0


