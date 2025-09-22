Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C465ACAC5AA
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lc5-00051P-Jy; Mon, 22 Sep 2025 14:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc0-0004xx-Sz
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:09 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbu-0004DP-7v
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:08 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-77ee6e252e5so2905382b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566999; x=1759171799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAb6+Aq27R5lfF6i22+yMOePpYluMFIXVFkejY5YFmQ=;
 b=K+xcvytt/v/pB3ZjTCpUCYX8FUjhKbeLN/801RXn/qlcwsTe0TVcaWdmKn+I9JyLR0
 kyzmb+/VrePCaaUGCbZEFjNJ/h4TdfNHNpEQUrYJBOVG3l975YZ6nTTy4jsxQVEcQBpK
 rXmSWg9LjWvjlyqKz9fYUzNnMbDxVnN2u0pH3TGAjiRSNzkaoFW2MzuHNZtmgci/h8lS
 vNOwPHvYIsTORjVX/GcNaBs0ehsD4q2vlBAsGoESS38oBft2Dygs2sagyguCDtiXksHD
 lnR0rXLPIa0ry63p5n4BxoZsYoqgEpE+EV38dx+xvcMus1dg5XajmGntFav7Yw/FR1KJ
 Msow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566999; x=1759171799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAb6+Aq27R5lfF6i22+yMOePpYluMFIXVFkejY5YFmQ=;
 b=JlJIakrgcYgROCE5oXgwTQfW3xX6LQGM2w1WIdpLcomG4IUwIdL2jYPqLpvrXIYKyr
 ydJ/AJTeqxxROM/zeY0irVGU59B2djzHK83qoAvJwFRac7vDqhwAn48REH+0s20bRs0A
 RhqtsMWQuH1QObMa8zPKrHfx/QicvzadKrp0c+8ho9hIS98fAMxrXMq7fwVg+ZSL99kD
 LvZ2vXe56duQee55vyxDlSnsx4i+opnxaNNzRYPFtHfw1hEKNR3678ku5vCNv9lOMB4N
 hYyhgQtTKHZqsIO+tixNLEn7lqy8/mmBwuPUPPkDWbktW1Ce+W533VMFNPS3//2w3WZ2
 M+kw==
X-Gm-Message-State: AOJu0Yy0IIjUoWsd1JQRcuEjQzFIfe+wI3rvzJF/YQ9Dd4QE4lVZCmZK
 ixfTJssmtCE2E64ZIK7HzWtyRFbzqZ0TUzKs8URoI1F2lUYpUcoTx55P3Z+zD5gnzMU=
X-Gm-Gg: ASbGncs46rnuH4HjnJCcMwxDnEzCAYOvK1qdZW3o7ZHrIvRBLJaZ9OPf09KfiehY1YS
 2CoTA1ECGQzAG5YBL+eFUlLS5h956QMimYKWm4h1MC9opStkS88h2+R6fw7b+9ro/qxiU+4ILi0
 lD4in2O1iOFqCMI1/Egp171zlFEcrDtSLRlQgqW2WvVTks1N1mAjUysDuBmPk2zGP5fChNItCJZ
 KlwXJcqyJM8bqmcChjfLK5b8FzsI21ewMtcIqJ9DA1ikaFoPjyLYgqWg23SUz1CekefruP5cPLm
 MK+KHqe+RTFmuzMKMyXU/JomlDtzS2rPW/xlKyH4p38EU8qg3gFEp5qDM9d+T1H6KWWmvrG/WQh
 oiZ9413L2jG8bcAV14GlDj5lp6NSU
X-Google-Smtp-Source: AGHT+IHpJHbqUdgQDdsEHYZFOdXkyIpiKSDebNTtcNRNzsU4VJVecd0cHhW/l49fX8k7ZvV9el8vZg==
X-Received: by 2002:a05:6a00:4fc9:b0:772:4319:e7df with SMTP id
 d2e1a72fcca58-77e4f9b4bb7mr14653248b3a.30.1758566999571; 
 Mon, 22 Sep 2025 11:49:59 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 26/76] target/arm: Remove unused env argument from
 regime_is_user
Date: Mon, 22 Sep 2025 11:48:34 -0700
Message-ID: <20250922184924.2754205-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 +-
 target/arm/helper.c    |  2 +-
 target/arm/ptw.c       | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b180499ecf..ad5584eb0b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1032,7 +1032,7 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
     return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 }
 
-static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
+static inline bool regime_is_user(ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
     case ARMMMUIdx_E10_0:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 83a675cc22..c0e808a9e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9436,7 +9436,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
 
         if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
-            regime_is_user(env, mmu_idx)) {
+            regime_is_user(mmu_idx)) {
             epd = true;
         }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index db51e55cd2..b72c1fc348 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -964,7 +964,7 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                          int ap, int domain_prot)
 {
    return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
-                                regime_is_user(env, mmu_idx));
+                                regime_is_user(mmu_idx));
 }
 
 /*
@@ -990,7 +990,7 @@ static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 
 static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 {
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(mmu_idx));
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
@@ -1376,7 +1376,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool have_wxn;
     int wxn = 0;
 
@@ -1538,7 +1538,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
-        perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
+        perm = regime_is_user(mmu_idx) ? u_perm : p_perm;
     }
 
     if (in_pa != out_pa) {
@@ -2389,7 +2389,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
     uint32_t mask;
     uint32_t base;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         /* MPU disabled.  */
@@ -2556,7 +2556,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     ARMCPU *cpu = env_archcpu(env);
     int n;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool secure = arm_space_is_secure(ptw->in_space);
 
     result->f.phys_addr = address;
@@ -2776,7 +2776,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * memory system to use a subpage.
      */
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -3656,7 +3656,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    result->f.attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.user = regime_is_user(mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
-- 
2.43.0


