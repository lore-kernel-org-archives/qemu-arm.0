Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2884948ocg;
        Mon, 10 Oct 2022 20:23:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zmwusDtmf8UNZMSJ2TjmtRxvOqGllxjmFzue5OI6UNecKJD1TmpdJUv2bT43jsZF9b3hy
X-Received: by 2002:ad4:5f47:0:b0:4ac:b8de:1484 with SMTP id p7-20020ad45f47000000b004acb8de1484mr17422820qvg.77.1665458626202;
        Mon, 10 Oct 2022 20:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458626; cv=none;
        d=google.com; s=arc-20160816;
        b=CT6i2R8+pIxUNA8KKr+yO+fLTepN3hZZQ4K9o6i7G2Lnn7Lr0FSxcKfx12jS+f2/4U
         q5KWsgqUNXag4LBpERN6C/0h0VQxt72Pp0vhUu6D+wV4n8gksT7REhxwjb9Bvel/qCer
         hQoSwCu/M9yoL2UVOB+31tcoxdRU1zEFT505xnn6nlGr/LcMpFnEA5TGCT94PVJbL6Jd
         3uBd+afKLsxFMJfnWJLII9SCOICGHDWpjlZ9cab+ixYRhdk477rMjvf+VPGpQ7d06e76
         d3V2vnw1ErMdqOVyfOrvpB/xR6qLeLxhE2cvs6qOBFRj6z1zL2OzYAmmJBEktabmxqnA
         FQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mWDabj8SgVJfh97qu1fcwAspA+xawk95sTUJ2LXWBU0=;
        b=PS5WevZIparMw8G7bEz9GfBRT9sAPXiJXWL1Jv3KnIofKPME1zXIbDJHKXJcZBlVXY
         uBMpCw5KWJixo5+ogM5iiqm8++NF8mE/VaikxMcwHSZA8U0FCTZ2bq46xSblJpzqiOKp
         hUkfKfA9wc+ieLPaaRtR/gxoXNgCNQMhdnLRz40mEBKTkTn6KNaX6cIv2OOlUQmfuLfq
         j9rcHtiTCKSYSHR3BqfcnrykP6sQjyQDQbPSGZ0CyKJ7r/TyRfF6yR47ZuCask/Wuu02
         ehxR7VeyjqJ1Jj+2IrRBAsGHIkt7qQVxtu4nRbeBnEtrTtx8AJPhJmEHWl/eSqA/6xme
         fJ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xhwy+Zx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10-20020a05622a104a00b0039a372fbaaasi2542888qte.32.2022.10.10.20.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xhwy+Zx7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5rt-0008Dg-N1
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nn-0002Fp-BG
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:31 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nd-000304-2p
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:29 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so14737397pjq.3
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mWDabj8SgVJfh97qu1fcwAspA+xawk95sTUJ2LXWBU0=;
 b=Xhwy+Zx7mB1Fo5Xh0Hs5juMXdyr0PvRVPOOeV9zCxYUuFgh8QcJCDSDOdxka634t73
 KUaxzpi3kP5jQtZ6qcExrECAsehIXzwhUClvGGHsKkyHTWNuaMlVTTHrOhdmlCAysGWM
 A6tLEa4AKtDRPOla5EKuJr9NSMrLVE0X0cwld1B+vTIuZqpbo2JzJwupAkKl9ATew5lC
 2h4v3YRN/B/dbcrSnBrQqYG3Cw/1HiYsi7nC627cBLSipjFwX8d4XSkoEioaGPotR/IB
 ba4tQya40ce7tHprv366XUuGh+4/Z8MHrdW0uGjdOCQbn9x+zq8FlJUqC1gc2v+D9AjO
 M+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWDabj8SgVJfh97qu1fcwAspA+xawk95sTUJ2LXWBU0=;
 b=hAm9Szuqe4j6T9pxeIdY7Hg4TURGuHfKkkdM+3NYplmbuITTyfFYG5Dz937Uuz9EDq
 x0jWRk++gNS5/Ul87wz8rGMmBfx/0TboRbD590EaaRQhsP1gwTZdsoMapI+UeSwa51Kl
 T/mrf8bwqh6T13aT1imtaAUDTu3/qeC7qeFlwdkTpGUOpUj7RUf+lJNSnvPulccP8jTq
 x92bxsiwROZid1Pos7Du8xNWr7HUfkVmE1ZOJv/7wFOasUpiwytQrKfFRO1+Jnq2CARA
 FcIdK1Z9LY5VeOcdzb+9q3tG9klvfMbKjw+xOVXDR5FLCWMnI5SRMetX9hZMGSNSpA7c
 CaXw==
X-Gm-Message-State: ACrzQf3if4wv3f9d61oUu6NUcj6M7v1I7WPICS0KpuWsXUi06mh5NAUe
 ag+LpSzj4UEwaSVrGZqqnOxNoQ==
X-Received: by 2002:a17:90a:a401:b0:20a:da56:b073 with SMTP id
 y1-20020a17090aa40100b0020ada56b073mr24874910pjp.1.1665458359771; 
 Mon, 10 Oct 2022 20:19:19 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 04/24] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Mon, 10 Oct 2022 20:18:51 -0700
Message-Id: <20221011031911.2408754-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xpyXeCQ4Blja

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       |  7 ++++++-
 target/arm/ptw.c       | 19 +++++++++++++++++--
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index f4338fd10e..a5b27db275 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -45,6 +45,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a34d496c5b..f93060e6d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2905,8 +2905,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
  * EL2 EL2&0 +PAN
  * EL2 (aka NS PL2)
  * EL3 (aka S PL1)
+ * Physical (NS & S)
  *
- * for a total of 8 different mmu_idx.
+ * for a total of 10 different mmu_idx.
  *
  * R profile CPUs have an MPU, but can use the same set of MMU indexes
  * as A profile. They only need to distinguish EL0 and EL1 (and
@@ -2971,6 +2972,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2d182d62e5..a977d09c6d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -179,6 +179,11 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        /* No translation for physical address spaces. */
+        return true;
+
     default:
         g_assert_not_reached();
     }
@@ -2280,10 +2285,17 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
 {
     uint8_t memattr = 0x00;    /* Device nGnRnE */
     uint8_t shareability = 0;  /* non-sharable */
+    int r_el;
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
-        int r_el = regime_el(env, mmu_idx);
+    switch (mmu_idx) {
+    case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        break;
 
+    default:
+        r_el = regime_el(env, mmu_idx);
         if (arm_el_is_aa64(env, r_el)) {
             int pamax = arm_pamax(env_archcpu(env));
             uint64_t tcr = env->cp15.tcr_el[r_el];
@@ -2332,6 +2344,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
             shareability = 2; /* outer sharable */
         }
         result->cacheattrs.is_s2_format = false;
+        break;
     }
 
     result->f.phys_addr = address;
@@ -2536,6 +2549,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2544,6 +2558,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1

