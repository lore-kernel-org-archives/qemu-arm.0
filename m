Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4455294wrs;
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNn7r89bYv7jzqDYjsTuJS0jtsWlmUGw27RVhnQsXE09EBCCN5rlZJ2FQz2kPyBes/iOa/
X-Received: by 2002:a0c:e6ab:: with SMTP id j11mr13834812qvn.178.1566335291381;
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566335291; cv=none;
        d=google.com; s=arc-20160816;
        b=mO0NdXuABwiXAaFLCBwOcQwx036Y+1WVrP8nJpSwLHUJpu22nWPod2H8x+tcs3xrin
         xsuA55zYKn4IUkSjBippfki4Zm4QbEH9105vQnGi87ka/erEdeVthocMtS/l5PYatPvq
         bF/D7CHn82uh9Tpo0rwh0dxR0AGXPBeJccf0CR3BcQqXUY7i5o5EH8T0PDfEiMmOOVmi
         peRgmrA2/3rwywE1F0jvIAtQeuqqyUi/BaM/93ewYOUD5wOzkfDs+hJ7SAZQtzZtNBLO
         LZwgSvIpOTHpXpWM2z+ejeW1Nt1uFpASLt3EO6vHLgPLQEU+moLNLQ0MM/3kKJ/u/aRq
         VRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=PJKLZgNrZeIfcl9mOVKPSZ1nJWOZ0cTu6OQj4DvwKc4=;
        b=g5tB8mGpn7z/iuYFa/YH7s14Lls9gc9Hj9aFOiOgUlgCwHGWHab59jn6RW/8tc6VHL
         +FAka4Q6QmYxTSTjK3xe2Oz6JtBpM8lRdR7+15mFL6CPZ6voA+SQtUWQmg06HUnHQJRU
         EkqI0o1zdPZJfB/XZWkDqdMgAk2N4yoxSDOzJZvKU/pgT8maF/NPCQTBzwTPWntMfquR
         osUihkT1O2th6zLsdBznqxHS7C6ti7Uyo1Xdz/RyYLR3QePIylDQrRhSnttrUpV5/EH7
         bLY4Vy9iXUUtgyQv75bJxKqJmmYaKRNUoyq8iYR5H7gKOMJPIaEiFNy+sAIwshhWxEXh
         b/SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A7LQhaTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k35si12134250qta.219.2019.08.20.14.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 14:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A7LQhaTU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0BMQ-0000Ek-C2
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLi-0000BO-S8
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i0BLh-0008K7-Dn
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:26 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37076)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i0BLh-0008JP-7q
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 17:07:25 -0400
Received: by mail-pf1-x441.google.com with SMTP id 129so4112793pfa.4
 for <qemu-arm@nongnu.org>; Tue, 20 Aug 2019 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PJKLZgNrZeIfcl9mOVKPSZ1nJWOZ0cTu6OQj4DvwKc4=;
 b=A7LQhaTU8/N1jJ0gTMGQyzcaGPoEKpqeBGDEAgjZCDrGRxOYkbgUD2pIInVMHoNAg7
 rZqfPky8OALWBMvvm752Gqp52J+TBaxhI1DoRrc8Z3SP/3gMXqBwFcfLJpqjfPQ1MftZ
 CRJTs7H8Axs2nBwoisdZyXWhWlSwPGYF01fEIklPs2sPXh9HAgueXhwlXO/8x+RP4Qb9
 kkEh84w3afJIuwlyfvB6UKrIsfpZRw2hzmb6p4GgDCnMEfiW65kByBCuY8WwTaFFoNU0
 S9x4sRVlfIqUnSKa3O3aGODCRG4NDU/7MVmHYJGwV1xNGUglPSnobXCw3k1udJjI+efp
 WUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PJKLZgNrZeIfcl9mOVKPSZ1nJWOZ0cTu6OQj4DvwKc4=;
 b=qfsgh93/uF5V1JaJXXDfNxFNV94+0p3MZQ/TL15CVzj2Tc/rarAHc6rLgHrnZ46yUL
 4/zQEdlvlpzEu/5XfuHgpojOGAyTNiLnCNxsM/kHstLP06degCxf8RmV7WHDztOwFmXO
 1cPJjiZGdkABcB4ucL9Q3E5GhxExxRYAHxTxBnknEMcFJ7mlGrceiiQgN13xPBQCnV2r
 P+40WGFJHaIKnrjGVEufsxq3N15Ew0N9tfNZIPn+Y9SBf1TY53ByD94rouc2A96MM3oi
 wRBq1KW2SIkmRD9jn5BgRnNCTio1Tb3kbxUUDvOZMstlY+JDLPfuMok//EH+ux8gyzEB
 75rw==
X-Gm-Message-State: APjAAAXxd4RoWTHJWa6jGFMTYjlSZb9RXqNWElrmRd5kwzU3QsGv0rC3
 uzGemAjD+xvR6ypepuFQ5mSSzw==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr11071610pgc.409.1566335244166; 
 Tue, 20 Aug 2019 14:07:24 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k22sm21690743pfk.157.2019.08.20.14.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:07:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:07:04 -0700
Message-Id: <20190820210720.18976-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820210720.18976-1-richard.henderson@linaro.org>
References: <20190820210720.18976-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v5 01/17] target/arm: Split out
 rebuild_hflags_common
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZfE8mSFDuHcX

Create a function to compute the values of the TBFLAG_ANY bits
that will be cached.  For now, the env->hflags variable is not
used, and the results are fed back to cpu_get_tb_cpu_state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 29 ++++++++++++++++++-----------
 target/arm/helper.c | 26 +++++++++++++++++++-------
 2 files changed, 37 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0981303170..3dc52c032b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -231,6 +231,9 @@ typedef struct CPUARMState {
     uint32_t pstate;
     uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE.nRW */
 
+    /* Cached TBFLAGS state.  See below for which bits are included.  */
+    uint32_t hflags;
+
     /* Frequently accessed CPSR bits are stored separately for efficiency.
        This contains all the other bits.  Use cpsr_{read,write} to access
        the whole CPSR.  */
@@ -3136,15 +3139,18 @@ typedef ARMCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/* Bit usage in the TB flags field: bit 31 indicates whether we are
+/*
+ * Bit usage in the TB flags field: bit 31 indicates whether we are
  * in 32 or 64 bit mode. The meaning of the other bits depends on that.
  * We put flags which are shared between 32 and 64 bit mode at the top
  * of the word, and flags which apply to only one mode at the bottom.
+ *
+ * Unless otherwise noted, these bits are cached in env->hflags.
  */
 FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 28, 3)
 FIELD(TBFLAG_ANY, SS_ACTIVE, 27, 1)
-FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
+FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)     /* Not cached. */
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
 FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
@@ -3155,13 +3161,14 @@ FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
 
 /* Bit usage when in AArch32 state: */
-FIELD(TBFLAG_A32, THUMB, 0, 1)
-FIELD(TBFLAG_A32, VECLEN, 1, 3)
-FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)
+FIELD(TBFLAG_A32, THUMB, 0, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, VECLEN, 1, 3)         /* Not cached. */
+FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)      /* Not cached. */
 /*
  * We store the bottom two bits of the CPAR as TB flags and handle
  * checks on the other bits at runtime. This shares the same bits as
  * VECSTRIDE, which is OK as no XScale CPU has VFP.
+ * Not cached, because VECLEN+VECSTRIDE are not cached.
  */
 FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
 /*
@@ -3170,15 +3177,15 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
  * the same thing as the current security state of the processor!
  */
 FIELD(TBFLAG_A32, NS, 6, 1)
-FIELD(TBFLAG_A32, VFPEN, 7, 1)
-FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
+FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
+FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
 /* For M profile only, set if FPCCR.LSPACT is set */
-FIELD(TBFLAG_A32, LSPACT, 18, 1)
+FIELD(TBFLAG_A32, LSPACT, 18, 1)        /* Not cached. */
 /* For M profile only, set if we must create a new FP context */
-FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1)
+FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1) /* Not cached. */
 /* For M profile only, set if FPCCR.S does not match current security state */
-FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1)
+FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1) /* Not cached. */
 /* For M profile only, Handler (ie not Thread) mode */
 FIELD(TBFLAG_A32, HANDLER, 21, 1)
 /* For M profile only, whether we should generate stack-limit checks */
@@ -3190,7 +3197,7 @@ FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
 FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
-FIELD(TBFLAG_A64, BTYPE, 10, 2)
+FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 
 static inline bool bswap_code(bool sctlr_b)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e0d5398ab..f2c6419369 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11016,6 +11016,22 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 }
 #endif
 
+static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
+                                      ARMMMUIdx mmu_idx, uint32_t flags)
+{
+    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
+    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
+                       arm_to_core_mmu_idx(mmu_idx));
+
+    if (arm_cpu_data_is_big_endian(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
+    }
+    if (arm_singlestep_active(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+    }
+    return flags;
+}
+
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *pflags)
 {
@@ -11107,7 +11123,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         }
     }
 
-    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
+    flags = rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 
     /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
      * states defined in the ARM ARM for software singlestep:
@@ -11115,9 +11131,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
      *     0            x       Inactive (the TB flag for SS is always 0)
      *     1            0       Active-pending
      *     1            1       Active-not-pending
+     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
      */
-    if (arm_singlestep_active(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)) {
         if (is_a64(env)) {
             if (env->pstate & PSTATE_SS) {
                 flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
@@ -11128,10 +11144,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
         }
     }
-    if (arm_cpu_data_is_big_endian(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
-    }
-    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
 
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
-- 
2.17.1

