Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2423CCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:00:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBF-00057L-EY; Wed, 08 Oct 2025 17:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cA9-0004Kr-TN
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9D-0006hS-2U
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-b55640a2e33so161311a12.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960590; x=1760565390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iq3OAeD6sXFj+ZhBz9kaPvsScw2upOaorX+smCRSY5s=;
 b=fWhiObXJRLZlUg/SHwCrFsNJKFuNqx0D5z4vEpiMOOcVXsRRN0im9B2vlDxiZgiZjW
 /HZGqt3txbfy0i2Swy+wao4pNxYUkjqjt9+CjnxawuYBuASV+/ThiaoDEdrFz64mat6+
 kHJXNBjCdtyArkBgdCR+P96iaHoW1UDq502km2gXM2iBETyHLHUKcQ+y6btP63gAb6im
 ec2yg9K1AKMuRq3+VAUImc/ojutF9eaxfoj/rVm091W0e6rD+JwohW1JR44/ldsoxFZC
 O9UiCEc/WCQG+JH8agAekYchjn1+orXihOMfeHFgmNIO7QAif1OcpK+I3YiKtWD1XU86
 nx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960590; x=1760565390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iq3OAeD6sXFj+ZhBz9kaPvsScw2upOaorX+smCRSY5s=;
 b=fPn1VVzVOQpP5yL1zBWGS9ItepVloy3FDzgyN3sQK/mYzoPf0q4Xf2HC7Wr3QdI2F2
 iKzCpYxi1ALZu+ACfVNP6YNAnWmZ7RlvyL+mm5DJ7Ee6qeW/cmJCBsG0yVNaYrcL2TRR
 XK2FjtkyafZfc05syOCsdf1nDo60bYl7FcOqTzYSJOk3MwZFhG7j+39UFQ3F/9B7dqU7
 Kpi3B/f7Rp2UJm7ilJpQxzref2Bg0scUPdNCiwo0SD+R721YnmxIG9YwEAM5jTG9PwFS
 zENPpowVLnhtAcKP7fB8DP5eiidxAh2WrTjra7YrJyvA6/+h8og16puePQb33dumKyw5
 hMhg==
X-Gm-Message-State: AOJu0YxPThyawOKzN7nbYRsnspkOVpuKmtQ0FYlMQe2tLAGZOk1AFO3c
 8efyhmEDkzn57ytnia54hDqF7jeaTQRlG+ymFfG6f9pcFdu1WlD2RMS0QBrhqQMijmxLDooQ2hq
 Ok3euVXE=
X-Gm-Gg: ASbGncuvv1vvv8FMG8bgXoBE7B5SMZnOO53v4uldpjV5I91gmrUoIZ7y0qCSiAJ3iBA
 P+1K629OFw76KKc2VuqpAM7jWenXUGxVonfu/3IfgPa39CEPjfeuzl2M8yGZBxNtXNAYweO6t9f
 qxJFdOVx4trLQaX5k8/WTcZG8fQm7qyL0x04uArwEBzAcLX/XGHMYrEbdWNdEeRXsDprh7tlZWp
 TyTutkd0n3fW1C4N9vK0m6K6hO8KWr7Y5V4j0miyGy6OcSDKXPDHjscgpIEpi2+/XaXV4a90F/6
 CUq8YeabtZvu1L+3mABx79ut5pZ6iFck2hqxCTk5/i/tTu/RxM+NGRkA57SX3iB22VXuFkSzR27
 FdJjS8h5sUzmTbBeyX7cDOlGonb4gfO2yxrUV7HE/72imOokpKM1Nj4GAycGH9zt5Fg8=
X-Google-Smtp-Source: AGHT+IHiWq7ojIoncac74qyk3rJbfyFXSIajI4PZhcy/fJGiHEVqC7FhuHLuzEXYI+t8kHHFY8Y8Lw==
X-Received: by 2002:a17:902:f641:b0:27e:edd9:576e with SMTP id
 d9443c01a7336-290273ef199mr57700945ad.30.1759960589722; 
 Wed, 08 Oct 2025 14:56:29 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 23/73] target/arm: Remove unused env argument from
 regime_is_user
Date: Wed,  8 Oct 2025 14:55:23 -0700
Message-ID: <20251008215613.300150-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  2 +-
 target/arm/helper.c    |  2 +-
 target/arm/ptw.c       | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 819ada7a5d..d0d976cbb0 100644
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
index a55161ef40..aed245fd86 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9450,7 +9450,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         ds = extract64(tcr, 59, 1);
 
         if (e0pd && cpu_isar_feature(aa64_e0pd, cpu) &&
-            regime_is_user(env, mmu_idx)) {
+            regime_is_user(mmu_idx)) {
             epd = true;
         }
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1080b6d69d..d6d4bf3b23 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1000,7 +1000,7 @@ static int ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx,
                          int ap, int domain_prot)
 {
    return ap_to_rw_prot_is_user(env, mmu_idx, ap, domain_prot,
-                                regime_is_user(env, mmu_idx));
+                                regime_is_user(mmu_idx));
 }
 
 /*
@@ -1026,7 +1026,7 @@ static int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
 
 static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 {
-    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
+    return simple_ap_to_rw_prot_is_user(ap, regime_is_user(mmu_idx));
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
@@ -1412,7 +1412,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                       ARMSecuritySpace in_pa, ARMSecuritySpace out_pa)
 {
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool have_wxn;
     int wxn = 0;
 
@@ -1574,7 +1574,7 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         if ((u_perm & (PAGE_RWX | PAGE_GCS)) && regime_is_pan(mmu_idx)) {
             p_perm &= ~(PAGE_READ | PAGE_WRITE);
         }
-        perm = regime_is_user(env, mmu_idx) ? u_perm : p_perm;
+        perm = regime_is_user(mmu_idx) ? u_perm : p_perm;
     }
 
     if (in_pa != out_pa) {
@@ -2421,7 +2421,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env,
     uint32_t mask;
     uint32_t base;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, ptw->in_space)) {
         /* MPU disabled.  */
@@ -2588,7 +2588,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env,
     ARMCPU *cpu = env_archcpu(env);
     int n;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     bool secure = arm_space_is_secure(ptw->in_space);
 
     result->f.phys_addr = address;
@@ -2808,7 +2808,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * memory system to use a subpage.
      */
     ARMCPU *cpu = env_archcpu(env);
-    bool is_user = regime_is_user(env, mmu_idx);
+    bool is_user = regime_is_user(mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -3689,7 +3689,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         break;
     }
 
-    result->f.attrs.user = regime_is_user(env, mmu_idx);
+    result->f.attrs.user = regime_is_user(mmu_idx);
 
     /*
      * Fast Context Switch Extension. This doesn't exist at all in v8.
-- 
2.43.0


