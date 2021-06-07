Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3673024lfa;
        Mon, 7 Jun 2021 09:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBALG8GD1uWN+HsA7GoBaGx0Bg7/Y09d0NA9CZnWvz2sEgw4lMvJVrOgg6OOWnW+2ogpcu
X-Received: by 2002:a9d:542:: with SMTP id 60mr14573888otw.143.1623085173892;
        Mon, 07 Jun 2021 09:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085173; cv=none;
        d=google.com; s=arc-20160816;
        b=z5UVv5j9JJ/Kib8Vz/1hkQj6mWpwFvCIz3fWfC34XzB/QugFYZ3ll5Uppt+pIsPLVD
         HjA6Xk0nbgLDNAx6DUKGXqg2GRzTXmF4fOA2JxSFLh2yJNQxX78Wgg+I4hA1RCDwbYJV
         1MWbSTnyD0vNV2ZYu7c3o7aguN772wXSVMOMxabTBchDBOZgn/ps8GgTfeA+aFDMB7Sx
         x+R9uiFtE6GHY38+L1nZsoBLmZpEC8PDiF6AZDtVOnv8b5lhLpJaeX/feo7PKMri/K+8
         34yRgktG1nHgzeFNJNHtBd+Rjm5pSUidvbzebHleCtyWOLbSOB4p6vXiRGjVmasmQ7gA
         vOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d0cq2glmaOXLFFMAcMfsHZ1d9+vbQKJMxSiU/M7kWqw=;
        b=gEqC9QzGyvKH3ET+h931nveBCyje/0fLvalqV1xnbCXBx1q3XdISRwDfNOugd2wBRz
         lzWHfJJF8QDxNsFdTv8mClmeyBUTS7mb2kdwYehN81xF/H7n+a5ROjOE+LtmiEmi2iCI
         LiHI2e4Tma3vxIJrcGHvd44DL0msLWDOBSiPz3Gbe5F6VTqBobODTQ+Q2PYjA/RN0iwF
         6cotAN1ITWBe1/lCV+X+drZL4AWmFBkFbw8ptLNVQdRnuWpylSGID9VnzF2GUjfUuYwl
         dDpPKFKvSyQ+laCPrLf/kQUWWnynpie90rWbvY0TAnlW1yRkRRnmwVtTOkfWie2NTNts
         WGKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZuUBspD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si9375522otu.241.2021.06.07.09.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 09:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pZuUBspD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIb7-00071u-3h
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 12:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa6-0006xe-Mh
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa4-0007r7-30
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a11so16558132wrt.13
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d0cq2glmaOXLFFMAcMfsHZ1d9+vbQKJMxSiU/M7kWqw=;
 b=pZuUBspDQnoaGEZ7RQoaMpW2nH3luK/HfKTdB2xn4D22GUbz5EuXZGVqyTjf5LeXGy
 skyWX3gNhS+YlorF7UeuVTZJlm9VgJpbxW/sX1gDgYtWNv09TNkOSLEzhHVNPWmDe9oP
 2YXz6CfCzlAdhwaBl1Qug9EQRHJt+k1ZgT7fWPuD/CPLnrXbOX8R55ozob99ghDiIioY
 IBrV/oLzI8ixpzmoQL4ZGjtHl3kHftjEsh9ghHk2Rz/plYYoNu1bAY6VKV7UDM1kHaWC
 4AQkd2vVnjqBPLtHCxNdbIQ0e2yIbZYt6+jC7UbNK+bqUv/6kwU+r7p8Zff6uPNEJX1K
 gUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d0cq2glmaOXLFFMAcMfsHZ1d9+vbQKJMxSiU/M7kWqw=;
 b=h9HlgIJF40wVAVGhk0HeX7wPUyqX+bIfXPRvdkXLhVZynev0dqT5f17QxUyXtt6TxE
 aatWBjLND9qq59YFv6ImWNbKPWzP9786FWkT8g/t0zc7AQmjTyb2WWC/KcphC49wJDJk
 ij/vcZrfxJ8zf1LdZvNBGymSeh0EhlJ/GLC8ubckeiGJnINnuzp5eo5I6spLQoS5p6Q8
 DJTYoSHa++/hndqKv9P4SFl+glIITO+aLpST8Hnqd6WtqrKIIiB+51IrK+ockWG/jXoV
 WP0XB5IDC4hlpElaXxdgrAvNxRbvK6tf2757wF1m6WMuhkr1ElNAOGuTUvvap3NiZJvg
 UgaA==
X-Gm-Message-State: AOAM530NEkh1xJmQh6ourgQmRADrjp//FnwDMXwroDw7eWp5TxsCZmph
 Jkhtu0uMxul7l0SpC4IbX+hJPQErzXUh0bak
X-Received: by 2002:a5d:6111:: with SMTP id v17mr8369421wrt.20.1623085106737; 
 Mon, 07 Jun 2021 09:58:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 03/55] target/arm: Handle VPR semantics in existing code
Date: Mon,  7 Jun 2021 17:57:29 +0100
Message-Id: <20210607165821.9892-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x/P3cOMEWQpw

When MVE is supported, the VPR register has a place on the exception
stack frame in a previously reserved slot just above the FPSCR.
It must also be zeroed in various situations when we invalidate
FPU context.

Update the code which handles the stack frames (exception entry and
exit code, VLLDM, and VLSTM) to save/restore VPR.

Update code which invalidates FP registers (mostly also exception
entry and exit code, but also VSCCLRM and the code in
full_vfp_access_check() that corresponds to the ExecuteFPCheck()
pseudocode) to zero VPR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c         | 54 +++++++++++++++++++++++++++++------
 target/arm/translate-m-nocp.c |  5 +++-
 target/arm/translate-vfp.c    |  9 ++++--
 3 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 074c5434550..7a1e35ab5b6 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -378,7 +378,7 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
             uint32_t shi = extract64(dn, 32, 32);
 
             if (i >= 16) {
-                faddr += 8; /* skip the slot for the FPSCR */
+                faddr += 8; /* skip the slot for the FPSCR/VPR */
             }
             stacked_ok = stacked_ok &&
                 v7m_stack_write(cpu, faddr, slo, mmu_idx, STACK_LAZYFP) &&
@@ -388,6 +388,11 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
         stacked_ok = stacked_ok &&
             v7m_stack_write(cpu, fpcar + 0x40,
                             vfp_get_fpscr(env), mmu_idx, STACK_LAZYFP);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            stacked_ok = stacked_ok &&
+                v7m_stack_write(cpu, fpcar + 0x44,
+                                env->v7m.vpr, mmu_idx, STACK_LAZYFP);
+        }
     }
 
     /*
@@ -410,16 +415,19 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
     env->v7m.fpccr[is_secure] &= ~R_V7M_FPCCR_LSPACT_MASK;
 
     if (ts) {
-        /* Clear s0 to s31 and the FPSCR */
+        /* Clear s0 to s31 and the FPSCR and VPR */
         int i;
 
         for (i = 0; i < 32; i += 2) {
             *aa32_vfp_dreg(env, i / 2) = 0;
         }
         vfp_set_fpscr(env, 0);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            env->v7m.vpr = 0;
+        }
     }
     /*
-     * Otherwise s0 to s15 and FPSCR are UNKNOWN; we choose to leave them
+     * Otherwise s0 to s15, FPSCR and VPR are UNKNOWN; we choose to leave them
      * unchanged.
      */
 }
@@ -1044,6 +1052,7 @@ static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
 void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 {
     /* fptr is the value of Rn, the frame pointer we store the FP regs to */
+    ARMCPU *cpu = env_archcpu(env);
     bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
     bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
     uintptr_t ra = GETPC();
@@ -1092,9 +1101,12 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
             cpu_stl_data_ra(env, faddr + 4, shi, ra);
         }
         cpu_stl_data_ra(env, fptr + 0x40, vfp_get_fpscr(env), ra);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            cpu_stl_data_ra(env, fptr + 0x44, env->v7m.vpr, ra);
+        }
 
         /*
-         * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
+         * If TS is 0 then s0 to s15, FPSCR and VPR are UNKNOWN; we choose to
          * leave them unchanged, matching our choice in v7m_preserve_fp_state.
          */
         if (ts) {
@@ -1102,6 +1114,9 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
                 *aa32_vfp_dreg(env, i / 2) = 0;
             }
             vfp_set_fpscr(env, 0);
+            if (cpu_isar_feature(aa32_mve, cpu)) {
+                env->v7m.vpr = 0;
+            }
         }
     } else {
         v7m_update_fpccr(env, fptr, false);
@@ -1112,6 +1127,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 
 void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
 {
+    ARMCPU *cpu = env_archcpu(env);
     uintptr_t ra = GETPC();
 
     /* fptr is the value of Rn, the frame pointer we load the FP regs from */
@@ -1144,7 +1160,7 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
             uint32_t faddr = fptr + 4 * i;
 
             if (i >= 16) {
-                faddr += 8; /* skip the slot for the FPSCR */
+                faddr += 8; /* skip the slot for the FPSCR and VPR */
             }
 
             slo = cpu_ldl_data_ra(env, faddr, ra);
@@ -1155,6 +1171,9 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
         }
         fpscr = cpu_ldl_data_ra(env, fptr + 0x40, ra);
         vfp_set_fpscr(env, fpscr);
+        if (cpu_isar_feature(aa32_mve, cpu)) {
+            env->v7m.vpr = cpu_ldl_data_ra(env, fptr + 0x44, ra);
+        }
     }
 
     env->v7m.control[M_REG_S] |= R_V7M_CONTROL_FPCA_MASK;
@@ -1298,7 +1317,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
                     uint32_t shi = extract64(dn, 32, 32);
 
                     if (i >= 16) {
-                        faddr += 8; /* skip the slot for the FPSCR */
+                        faddr += 8; /* skip the slot for the FPSCR and VPR */
                     }
                     stacked_ok = stacked_ok &&
                         v7m_stack_write(cpu, faddr, slo,
@@ -1309,11 +1328,19 @@ static bool v7m_push_stack(ARMCPU *cpu)
                 stacked_ok = stacked_ok &&
                     v7m_stack_write(cpu, frameptr + 0x60,
                                     vfp_get_fpscr(env), mmu_idx, STACK_NORMAL);
+                if (cpu_isar_feature(aa32_mve, cpu)) {
+                    stacked_ok = stacked_ok &&
+                        v7m_stack_write(cpu, frameptr + 0x64,
+                                        env->v7m.vpr, mmu_idx, STACK_NORMAL);
+                }
                 if (cpacr_pass) {
                     for (i = 0; i < ((framesize == 0xa8) ? 32 : 16); i += 2) {
                         *aa32_vfp_dreg(env, i / 2) = 0;
                     }
                     vfp_set_fpscr(env, 0);
+                    if (cpu_isar_feature(aa32_mve, cpu)) {
+                        env->v7m.vpr = 0;
+                    }
                 }
             } else {
                 /* Lazy stacking enabled, save necessary info to stack later */
@@ -1536,13 +1563,16 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     v7m_exception_taken(cpu, excret, true, false);
                 }
             }
-            /* Clear s0..s15 and FPSCR; TODO also VPR when MVE is implemented */
+            /* Clear s0..s15, FPSCR and VPR */
             int i;
 
             for (i = 0; i < 16; i += 2) {
                 *aa32_vfp_dreg(env, i / 2) = 0;
             }
             vfp_set_fpscr(env, 0);
+            if (cpu_isar_feature(aa32_mve, cpu)) {
+                env->v7m.vpr = 0;
+            }
         }
     }
 
@@ -1771,7 +1801,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                     uint32_t faddr = frameptr + 0x20 + 4 * i;
 
                     if (i >= 16) {
-                        faddr += 8; /* Skip the slot for the FPSCR */
+                        faddr += 8; /* Skip the slot for the FPSCR and VPR */
                     }
 
                     pop_ok = pop_ok &&
@@ -1790,6 +1820,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 if (pop_ok) {
                     vfp_set_fpscr(env, fpscr);
                 }
+                if (cpu_isar_feature(aa32_mve, cpu)) {
+                    pop_ok = pop_ok &&
+                        v7m_stack_read(cpu, &env->v7m.vpr,
+                                       frameptr + 0x64, mmu_idx);
+                }
                 if (!pop_ok) {
                     /*
                      * These regs are 0 if security extension present;
@@ -1799,6 +1834,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                         *aa32_vfp_dreg(env, i / 2) = 0;
                     }
                     vfp_set_fpscr(env, 0);
+                    if (cpu_isar_feature(aa32_mve, cpu)) {
+                        env->v7m.vpr = 0;
+                    }
                 }
             }
         }
diff --git a/target/arm/translate-m-nocp.c b/target/arm/translate-m-nocp.c
index d47eb8e1535..365810e582d 100644
--- a/target/arm/translate-m-nocp.c
+++ b/target/arm/translate-m-nocp.c
@@ -173,7 +173,10 @@ static bool trans_VSCCLRM(DisasContext *s, arg_VSCCLRM *a)
         btmreg++;
     }
     assert(btmreg == topreg + 1);
-    /* TODO: when MVE is implemented, zero VPR here */
+    if (dc_isar_feature(aa32_mve, s)) {
+        TCGv_i32 z32 = tcg_const_i32(0);
+        store_cpu_field(z32, v7m.vpr);
+    }
     return true;
 }
 
diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index 22a619eb2c5..c3504bd3b86 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -180,8 +180,8 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
 
         if (s->v7m_new_fp_ctxt_needed) {
             /*
-             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA
-             * and the FPSCR.
+             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA,
+             * the FPSCR, and VPR.
              */
             TCGv_i32 control, fpscr;
             uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
@@ -189,6 +189,11 @@ static bool full_vfp_access_check(DisasContext *s, bool ignore_vfp_enabled)
             fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
             gen_helper_vfp_set_fpscr(cpu_env, fpscr);
             tcg_temp_free_i32(fpscr);
+            if (dc_isar_feature(aa32_mve, s)) {
+                TCGv_i32 z32 = tcg_const_i32(0);
+                store_cpu_field(z32, v7m.vpr);
+            }
+
             /*
              * We don't need to arrange to end the TB, because the only
              * parts of FPSCR which we cache in the TB flags are the VECLEN
-- 
2.20.1

