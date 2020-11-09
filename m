Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3669392lfb;
        Mon, 9 Nov 2020 06:19:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH7CGLGNKF10ye8gY6Nd9zUXvnfkKr5wJiX9OWv7tNRLgzE/qdSjqRjIy7EgFtjtAgRBsN
X-Received: by 2002:ae9:e20b:: with SMTP id c11mr13235864qkc.137.1604931575638;
        Mon, 09 Nov 2020 06:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931575; cv=none;
        d=google.com; s=arc-20160816;
        b=B/VIZ6zRYeB1eUult+8IZPv9KLraGPJyN2sKspV2Y4WLkvM/1zGr7oIdNdw7NacFlO
         3eqbEuvN24VasxWYXpL8cIHl7FFPWF296hjCkvC0AfjoDSv/AOZqT2nBtdMmwJk1eXGP
         fDrtf52q0D2FPNZLmjbomgmRShoxeTXXSXDUSiyQ6FLn4t7ZYUHv1HDU7sodzAAUdU4a
         T5Zzo43sDPzP8nJd4GmA8uJvDRt0jmymFyfNxI+2j61V4aKrzT+fDu59BvFfkWWBdTM0
         cteebEMO8QSUx5GD2ld6vVDVXvcPQxHzdyViDrIB6ekGG3NadijhFZsmSatPG8Gey/YO
         zfnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=6l4TI2RhKAyRsmg47pSx+m/4KWM9HsrC6TN0TWFjumE=;
        b=at5xJuAVk7+aO8Acf2CRNclKLezJjWuMGInGSvMUtwk0wIn8eE/TaDeqJKUpU3ycd1
         zh46CY+Zzb+QDtYDlaGmAP/e08QM0CvVJObcd0pbFGuxMTIuHlMKMKPtibrAvsFpU/2j
         jDoFpiHETMbzAVjB2RyktaZKI/S5i6laIRplWii9/k+gLbZVnl7wD70nIK9JPcWqOeFX
         hViTHQMC++Rwfrt7A97H4Pz5vmLR5iAKrRpu9KoAhObtRL3cjiSqAe7QZ7GZ7Lf9x8gF
         ZZ/t/n4r8lCnvgpbVW4eQzIZ4CQuH3ZkewSPf7QPQKP9bFrPzuNw3WV4S5gFkwrRFWp5
         Sdzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j17si5102456qkg.289.2020.11.09.06.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc818-0004yH-VT
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sj-0003Oa-Dh; Mon, 09 Nov 2020 09:10:53 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60198
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sg-0002qV-Nw; Mon, 09 Nov 2020 09:10:53 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 972CB6061B;
 Mon,  9 Nov 2020 15:10:24 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 15/17] target/arm: add ARMv8.4-SEL2 extension
Date: Mon,  9 Nov 2020 16:10:18 +0200
Message-Id: <20201109141020.27234-15-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwwaMIYjD/SH

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This adds handling for the SCR_EL3.EEL2 bit.

A translation block flag is added in A32 mode to route exceptions
correctly from AArch32 S-EL1 to (AArch64) S-EL2.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c       |  2 +-
 target/arm/cpu.h       | 11 ++++++++---
 target/arm/helper.c    | 21 ++++++++++++++++++---
 target/arm/translate.c |  6 ++++--
 target/arm/translate.h |  1 +
 5 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 48b34080ce..5bfffd5fe8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -476,7 +476,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
              * masked from Secure state. The HCR and SCR settings
              * don't affect the masking logic, only the interrupt routing.
              */
-            if (target_el == 3 || !secure) {
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
                 unmasked = true;
             }
         } else {
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc22693626..20c15534d3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2061,7 +2061,10 @@ static inline bool arm_is_secure(CPUARMState *env)
 static inline bool arm_is_el2_enabled(CPUARMState *env)
 {
     if (arm_feature(env, ARM_FEATURE_EL2)) {
-        return !arm_is_secure_below_el3(env);
+        if (arm_is_secure_below_el3(env)) {
+            return (env->cp15.scr_el3 & SCR_EEL2) != 0;
+        }
+        return true;
     }
     return false;
 }
@@ -2108,7 +2111,8 @@ static inline bool arm_el_is_aa64(CPUARMState *env, int el)
         return aa64;
     }
 
-    if (arm_feature(env, ARM_FEATURE_EL3)) {
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        ((env->cp15.scr_el3 & SCR_NS) || !(env->cp15.scr_el3 & SCR_EEL2))) {
         aa64 = aa64 && (env->cp15.scr_el3 & SCR_RW);
     }
 
@@ -3264,7 +3268,7 @@ typedef ARMCPU ArchCPU;
  * We put flags which are shared between 32 and 64 bit mode at the top
  * of the word, and flags which apply to only one mode at the bottom.
  *
- *  31          20    18    14          9              0
+ *  31          20    19    14          9              0
  * +--------------+-----+-----+----------+--------------+
  * |              |     |   TBFLAG_A32   |              |
  * |              |     +-----+----------+  TBFLAG_AM32 |
@@ -3313,6 +3317,7 @@ FIELD(TBFLAG_A32, HSTR_ACTIVE, 16, 1)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 17, 1)
+FIELD(TBFLAG_A32, EEL2, 18, 1)
 
 /*
  * Bit usage when in AArch32 state, for M-profile only.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8a2e759ee6..f3edbca709 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -532,6 +532,9 @@ static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* This will be EL1 NS and EL2 NS, which just UNDEF */
@@ -2029,6 +2032,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= SCR_API | SCR_APK;
         }
+        if (cpu_isar_feature(aa64_sel2, cpu)) {
+            valid_mask |= SCR_EEL2;
+        }
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
@@ -3387,13 +3393,16 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (ri->opc2 & 4) {
-        /* The ATS12NSO* operations must trap to EL3 if executed in
+        /* The ATS12NSO* operations must trap to EL3 or EL2 if executed in
          * Secure EL1 (which can only happen if EL3 is AArch64).
          * They are simply UNDEF if executed from NS EL1.
          * They function normally from EL2 or EL3.
          */
         if (arm_current_el(env) == 1) {
             if (arm_is_secure_below_el3(env)) {
+                if (env->cp15.scr_el3 & SCR_EEL2) {
+                    return CP_ACCESS_TRAP_UNCATEGORIZED_EL2;
+                }
                 return CP_ACCESS_TRAP_UNCATEGORIZED_EL3;
             }
             return CP_ACCESS_TRAP_UNCATEGORIZED;
@@ -3656,7 +3665,7 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
-    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
+    if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & (SCR_NS|SCR_EEL2))) {
         return CP_ACCESS_TRAP;
     }
     return CP_ACCESS_OK;
@@ -5755,12 +5764,15 @@ static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
     /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
-     * At Secure EL1 it traps to EL3.
+     * At Secure EL1 it traps to EL3 or EL2.
      */
     if (arm_current_el(env) == 3) {
         return CP_ACCESS_OK;
     }
     if (arm_is_secure_below_el3(env)) {
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_TRAP_EL2;
+        }
         return CP_ACCESS_TRAP_EL3;
     }
     /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
@@ -12897,6 +12909,9 @@ static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
     }
     flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
+    if (arm_is_secure_below_el3(env) && (env->cp15.scr_el3 & SCR_EEL2)) {
+        flags = FIELD_DP32(flags, TBFLAG_A32, EEL2, 1);
+    }
 
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 29ea1eb781..5f8e684cf4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2780,9 +2780,10 @@ static bool msr_banked_access_decode(DisasContext *s, int r, int sysm, int rn,
         }
         if (s->current_el == 1) {
             /* If we're in Secure EL1 (which implies that EL3 is AArch64)
-             * then accesses to Mon registers trap to EL3
+             * then accesses to Mon registers trap to Secure EL2 if it exists
+             * otherwise EL3.
              */
-            exc_target = 3;
+            exc_target = s->sel2 ? 2 : 3;
             goto undef;
         }
         break;
@@ -8800,6 +8801,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->sctlr_b = FIELD_EX32(tb_flags, TBFLAG_A32, SCTLR_B);
         dc->hstr_active = FIELD_EX32(tb_flags, TBFLAG_A32, HSTR_ACTIVE);
         dc->ns = FIELD_EX32(tb_flags, TBFLAG_A32, NS);
+        dc->sel2 = FIELD_EX32(tb_flags, TBFLAG_A32, EEL2);
         dc->vfp_enabled = FIELD_EX32(tb_flags, TBFLAG_A32, VFPEN);
         if (arm_feature(env, ARM_FEATURE_XSCALE)) {
             dc->c15_cpar = FIELD_EX32(tb_flags, TBFLAG_A32, XSCALE_CPAR);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df..bf3624791b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -32,6 +32,7 @@ typedef struct DisasContext {
     uint8_t tbid;      /* TBI1|TBI0 for data */
     uint8_t tcma;      /* TCMA1|TCMA0 for MTE */
     bool ns;        /* Use non-secure CPREG bank on access */
+    bool sel2;      /* Secure EL2 enabled (only used in AArch32) */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
     int sve_len;     /* SVE vector length in bytes */
-- 
2.29.2

