Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071462wrv;
        Wed, 31 Jul 2019 13:38:44 -0700 (PDT)
X-Received: by 2002:a17:902:9b94:: with SMTP id y20mr121977987plp.260.1564605524071;
        Wed, 31 Jul 2019 13:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605524; cv=none;
        d=google.com; s=arc-20160816;
        b=Ap5OIOpiW7oovnGB5w4CwYQz2RmDCH5nutRYTe+NhW4F3eybjvPCa+W11sFLorBmkO
         4BC5VlbV4NRue3yv/eMUAu7crHmoLDUKHMR0GwReycneyD+nvu2HpjQzmGyCn1GVonrO
         V8qT0WYfbFe/27cgjymI9pWlgYoWjOMq3Fc3MN6Rr7UVGU5q0+4LpUW4442z3hz8twH+
         fUyBvDFrHgeOK5tYk4Nf5OivwA/GfgcCBpswSz71Tl4BDtrGGv/Es9mnFPieudisYlMS
         Vwo4IJvcuOKGLxWUo11tKK5y0Pn96Nt+uiM/+SslcMtgrEtDECyC3UzbejNiZjwRYGH1
         G8Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gkdd1xo9dAf4K2ZLEThkLYxs4H8KbbboSDJfUHi98zc=;
        b=XlH15fqyJiGNujWFpht+zYGbUA3c5Kb5UoRUy6hCqp0kAk8bToI8FXRa0hYDljMZSp
         4gO9WF9JfiXHcdQS7at2014iS4Tmw4/FPUX4Hevq+ZApPavZWUDfwuPssjbS6SCZdQXv
         EsXCEsQxuC/yJgTEZOmpdjeY8DzhvQFr56ygR+HbM7y1IbOf8NrrC+yWFjxLKYFZHAUY
         5x1bkQWcbiIGehGERLt8BCS5vzzIQitlP8acRDduOS/kCgaTdw47DVCtbEZRyGhIrW1D
         pdh66OQR1US6+2CY/Wl3UXYcZi0F96FSHKFjCKPgzL9UPYMTAC+tLMvm6nmS9sBfTzRs
         KK6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDbaISIZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a3sor50499055pfo.61.2019.07.31.13.38.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDbaISIZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkdd1xo9dAf4K2ZLEThkLYxs4H8KbbboSDJfUHi98zc=;
        b=ZDbaISIZ3zgNqxZlEnpBUY3V2zdR9HW9CR1WHtGeWAaHAYFzmG1zEiUvprFlqdWgBF
         OoDezKag3b/3idd6mx+ISvn38e2INhCTTjhgRgA+fb6OzEVxk99vZjc/n6f2Fkrtt4MP
         NdvOAY9UqpPnTLAdnqnZmP01d4tCo5Nr8TW04LgZrHetRTTiu8Xjt6e2i9kNZVlrDjRp
         QaxgMB3oG/u5BZp4G516V1v9Mh3ICvJJQTvv3F4m1EQn/ME1w9Cxsl83+cUjn0UQJEIu
         U0hyfSgyExKgrah2yP6hc33PXurZbRsvoO3umB0UXjfv16/TJZde8QSaqIVi5NEce9Wb
         HZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkdd1xo9dAf4K2ZLEThkLYxs4H8KbbboSDJfUHi98zc=;
        b=kRPLbY/dH9zOvk2wnPOBum1XG+no/MAfWxqU3ci8vKlNYcYRPFDFBw223I7FFg08wn
         aAxDuhgSLXUf1Fq4IL+cYw6z16cmfkOU/7hnHp7KdZBUa/OUG8qayio1TD91cFIsLC8A
         ECjFilKqHCJQQN+ylQR6rN69INham8dunW7z3RSgbivccP/FWMU6G4qyLafjgbXrT0es
         LrHDoBIOo2aZreMJDPp/CXMLFFscw1sRiLGE3QysgCWmVdpE9dSYTTbCUFWgZc3gFzKK
         qyBr+8Zh3cLejSok00fyt7t096zt3L+f1Fz05Uh2QiMqKfS3+GbQ16A1dmmathw9c+F6
         oztg==
X-Gm-Message-State: APjAAAU4UyqMHOvPouv5jVPhjXeulpE6/t58R3QTQ5uZXUlfh3Y7uU09
	kPk3Bb1WFGcHyOMnNc/V/vGycG2E
X-Google-Smtp-Source: APXvYqxI9PkBPDFz1O+ZDnSIrP/QU7NtnsaAm7mvEC2zO8tOn+kFG6lKJgv2UTEXdcZ5Uzot5HIbqw==
X-Received: by 2002:a62:198d:: with SMTP id 135mr48906850pfz.169.1564605523502;
        Wed, 31 Jul 2019 13:38:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 23/32] target/arm: Update arm_mmu_idx for VHE
Date: Wed, 31 Jul 2019 13:38:04 -0700
Message-Id: <20190731203813.30765-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fQW2xBYxzJrJ

This covers initial generation in arm_mmu_idx, and reconstruction
in core_to_arm_mmu_idx.  As a conseqeuence, we also need a bit in
TBFLAGS in order to make the latter reliable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  2 ++
 target/arm/helper.c | 42 +++++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b5300f9014..64cda8dbea 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3153,6 +3153,8 @@ FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
 FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
+/* For A profile only, if EL2 is AA64 and HCR_EL2.E2H is set.  */
+FIELD(TBFLAG_ANY, E2H, 22, 1)
 
 /* Bit usage when in AArch32 state: */
 FIELD(TBFLAG_A32, THUMB, 0, 1)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5472424179..578dcfefbf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11257,21 +11257,29 @@ int fp_exception_el(CPUARMState *env, int cur_el)
 
 ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
 {
+    bool e2h;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         return mmu_idx | ARM_MMU_IDX_M;
     }
 
     mmu_idx |= ARM_MMU_IDX_A;
+    if (mmu_idx & ARM_MMU_IDX_S) {
+        return mmu_idx;
+    }
+
+    e2h = (env->cp15.hcr_el2 & HCR_E2H) != 0;
+    if (!arm_el_is_aa64(env, 2)) {
+        e2h = false;
+    }
+
     switch (mmu_idx) {
     case 0 | ARM_MMU_IDX_A:
-        return ARMMMUIdx_EL10_0;
+        return e2h ? ARMMMUIdx_EL20_0 : ARMMMUIdx_EL10_0;
     case 1 | ARM_MMU_IDX_A:
         return ARMMMUIdx_EL10_1;
     case ARMMMUIdx_E2:
-    case ARMMMUIdx_SE0:
-    case ARMMMUIdx_SE1:
-    case ARMMMUIdx_SE3:
-        return mmu_idx;
+        return e2h ? ARMMMUIdx_EL20_2 : ARMMMUIdx_E2;
     default:
         g_assert_not_reached();
     }
@@ -11299,24 +11307,28 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
 
 ARMMMUIdx arm_mmu_idx(CPUARMState *env)
 {
+    bool e2h, sec;
     int el;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
     }
 
+    sec = arm_is_secure_below_el3(env);
+    e2h = (env->cp15.hcr_el2 & HCR_E2H) != 0;
+    if (!arm_el_is_aa64(env, 2)) {
+        e2h = false;
+    }
+
     el = arm_current_el(env);
     switch (el) {
     case 0:
-        /* TODO: ARMv8.1-VHE */
+        return sec ? ARMMMUIdx_SE0 : e2h ? ARMMMUIdx_EL20_0 : ARMMMUIdx_EL10_0;
     case 1:
-        return (arm_is_secure_below_el3(env)
-                ? ARMMMUIdx_SE0 + el
-                : ARMMMUIdx_EL10_0 + el);
+        return sec ? ARMMMUIdx_SE1 : ARMMMUIdx_EL10_1;
     case 2:
-        /* TODO: ARMv8.1-VHE */
         /* TODO: ARMv8.4-SecEL2 */
-        return ARMMMUIdx_E2;
+        return e2h ? ARMMMUIdx_EL20_2 : ARMMMUIdx_E2;
     case 3:
         return ARMMMUIdx_SE3;
     default:
@@ -11428,6 +11440,14 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 
     flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
 
+    /*
+     * Include E2H in TBFLAGS so that core_to_arm_mmu_idx can
+     * reliably determine E1&0 vs E2&0 regimes.
+     */
+    if (arm_el_is_aa64(env, 2) && (env->cp15.hcr_el2 & HCR_E2H)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, E2H, 1);
+    }
+
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
      *  SS_ACTIVE   PSTATE.SS   State
-- 
2.17.1
