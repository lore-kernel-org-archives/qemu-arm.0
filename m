Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4553862wrv;
        Mon, 5 Aug 2019 17:06:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLtuk82cWl+ZAsy38KT1ndFzk/2N/OSkscpI2+O5ieHBqbTuFgH2prU7wN89YDD2+MYVZg
X-Received: by 2002:a17:906:27c7:: with SMTP id k7mr554347ejc.91.1565049981489;
        Mon, 05 Aug 2019 17:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565049981; cv=none;
        d=google.com; s=arc-20160816;
        b=LVOe+K00sjR0/xEjhDuAY21iOfYqMb1lZpoZippEhi6v9E8ZKgp2Wiz4aDIIPTc5AB
         rrd/Ef9DId+UNXpyhMrdFmJNfpjVihoZ5suKHw9LlKgxOwxdOZ6rqXwkB6n7yIyrwQiG
         UcbG7X+ZM4ANKTM3oG0wXiqctYuz7Z/5fwKpmMw5KtOrODWAJ0zirv6HPsF/RWSNb2+7
         4oFvT22PNrVkcxX7FkqPZsMLo3NG6DzopD1cP3eq88AnOM2913Ijm61lD44jLBAhxWwh
         6Ua5uhus63XmFGmWkNWyiOUa97++zDYUzyOd81Gb+sNIRu9BlMEyxtuS4h4t8IcMDEfE
         fpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=q3fMzXTaQgWcqA1jzonJJWI6KonpSOhpHjOAjFnriUA=;
        b=wUWi4RUhXjvPac79O1xv7oRiQBa813TGjvpiyqtsSxlvaCDbhR9UwT0beU+Wu1l+XO
         UEfdxNf6tzAWO1ainjidOP7T/RTBZ7eI5JGDHS4Rohowh7j+l6X3k42AOmamVVRWXV2l
         Jy4snqDxFiTE+FsoLdTNP1PWykvz29xA7/01+zs+/Xp5C/CitUguOsGRMcNdXNRKO8Iq
         qW7TQvUPTSH3roXciBptajE1nmgYpVxwKPK3vXxhc4AsuEZSdtu83jJDLV+X/1BON2he
         QQOl4IXg9GMEJgof8m9LiGhkFko2+/oRWw04hNEF7N7kJWxWBsdYfQDplCREiKU1jbX0
         Biww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Td4dCOby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si26967289ejx.231.2019.08.05.17.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 17:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Td4dCOby;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1humzc-0006zr-FA
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 20:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33651)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1humyZ-0003wa-5w
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1humyW-0008E5-Gg
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:15 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1humyW-0008DV-84
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 20:05:12 -0400
Received: by mail-pg1-x541.google.com with SMTP id t132so40543204pgb.9
 for <qemu-arm@nongnu.org>; Mon, 05 Aug 2019 17:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3fMzXTaQgWcqA1jzonJJWI6KonpSOhpHjOAjFnriUA=;
 b=Td4dCObyB69MfMWp17LHApSABP0W0K4ZGlODyP4AmFxjtqmrTvO67Ruz5m4Q6DONd8
 7BjOREVdhEvqq1JMYGAHLq0eA88cEmuBlFRiqdfapooPJbFLRRL/gVyl9PTbLsMAl/L+
 MBD0+P1dunAy67o4plvvXMbZAMGZp8FDDbf1B3efhhvNHJWk82sr8blyEXY/WsE8RvgW
 yFqecIcPi/3ukofzCYO8k1U8v4pJRJpeDQ3m32t7srv5iVtZoU9u/CdLZuamxyOg9RE5
 Q4maoKamugRV/7K/zzxm8LCX37AvlQFuPTRp44J+nVyfBaMdQTr3YMwmmhrSJU574hPp
 Vp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3fMzXTaQgWcqA1jzonJJWI6KonpSOhpHjOAjFnriUA=;
 b=WMdJkRDmq8TnypKLsjnHqfo304J7iimdGCs5JZJi0jDjklB0N9OfvF1YwYurzmqp31
 FeiRs7wdjqCxILoG6Zbz2meMZauDnb/4S1Yaq9NkD+rej5defCLF9+VFUxsIAKa9Pgfc
 Zo8nj2VhUvtoBGlxQFSwgCBpjofeoZZ4HmtTC4L8QSDfCnw5vD47TFiwhuisnuspGSus
 2pnW+mdnre9L9lxezImx2i0dzvHanrRP0XU/yyguD09DNISPQBnD5X7C+snfyQOb0RVa
 3hugZesnV/m+vhVeci4iQ0Q8HOdMJg62b8gWopL+uPwiJ8YP84DSA9HdfB5UbIR7zFHY
 eRHw==
X-Gm-Message-State: APjAAAUsN7F9OXsr8fazaTkjqWNZALeydsmit9ix7p4YFDQdqCYFiv9D
 j426pQTujMwyfSeR6oOzZg/8Qw==
X-Received: by 2002:a17:90a:8591:: with SMTP id
 m17mr309706pjn.100.1565049910997; 
 Mon, 05 Aug 2019 17:05:10 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i3sm92149782pfo.138.2019.08.05.17.05.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 17:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 17:05:04 -0700
Message-Id: <20190806000506.10833-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806000506.10833-1-richard.henderson@linaro.org>
References: <20190806000506.10833-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v4 1/3] target/arm: Split out recompute_hflags et
 al
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
X-TUID: 1qQ1GbfbHq36

Create functions to compute the values of the a64 and a32 hflags,
as well as one to compute the values that are shared between them.
For now, the env->hflags variable is not used, and the results are
fed back to cpu_get_tb_cpu_state.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not cache VECLEN, VECSTRIDE, VFPEN.
    Move HANDLER and STACKCHECK to rebuild_hflags_a32.
v4: Do not cache XSCALE_CPAR now that it overlaps VECSTRIDE.
---
 target/arm/cpu.h       |  35 +++--
 target/arm/helper.h    |   3 +
 target/arm/internals.h |   3 +
 target/arm/helper.c    | 322 ++++++++++++++++++++++++-----------------
 4 files changed, 218 insertions(+), 145 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 94c990cddb..c13633e6a0 100644
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
@@ -3130,27 +3133,31 @@ typedef ARMCPU ArchCPU;
 
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
@@ -3159,15 +3166,15 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
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
@@ -3179,7 +3186,7 @@ FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
 FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
-FIELD(TBFLAG_A64, BTYPE, 10, 2)
+FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
 FIELD(TBFLAG_A64, TBID, 12, 2)
 
 static inline bool bswap_code(bool sctlr_b)
@@ -3264,6 +3271,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
         *opaque);
 
+/**
+ * arm_rebuild_hflags:
+ * Rebuild the cached TBFLAGS for arbitrary changed processor state.
+ */
+void arm_rebuild_hflags(CPUARMState *env);
+
 /**
  * aa32_vfp_dreg:
  * Return a pointer to the Dn register within env in 32-bit mode.
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 132aa1682e..3919acbe63 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -91,6 +91,9 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
 DEF_HELPER_2(get_user_reg, i32, env, i32)
 DEF_HELPER_3(set_user_reg, void, env, i32, i32)
 
+DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, i32)
+DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, i32)
+
 DEF_HELPER_1(vfp_get_fpscr, i32, env)
 DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..db6f010798 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -992,6 +992,9 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data);
 
+uint32_t rebuild_hflags_a32(CPUARMState *env, int el);
+uint32_t rebuild_hflags_a64(CPUARMState *env, int el);
+
 static inline int exception_target_el(CPUARMState *env)
 {
     int target_el = MAX(1, arm_current_el(env));
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b74c23a9bc..43b7c41f11 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11013,165 +11013,219 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
 }
 #endif
 
-void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
-                          target_ulong *cs_base, uint32_t *pflags)
+static uint32_t common_hflags(CPUARMState *env, int el, ARMMMUIdx mmu_idx,
+                              int fp_el, uint32_t flags)
 {
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    int current_el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, current_el);
-    uint32_t flags = 0;
-
-    if (is_a64(env)) {
-        ARMCPU *cpu = env_archcpu(env);
-        uint64_t sctlr;
-
-        *pc = env->pc;
-        flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
-
-        /* Get control bits for tagged addresses.  */
-        {
-            ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-            ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-            int tbii, tbid;
-
-            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
-            if (regime_el(env, stage1) < 2) {
-                ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
-                tbid = (p1.tbi << 1) | p0.tbi;
-                tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
-            } else {
-                tbid = p0.tbi;
-                tbii = tbid & !p0.tbid;
-            }
-
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
-            flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
-        }
-
-        if (cpu_isar_feature(aa64_sve, cpu)) {
-            int sve_el = sve_exception_el(env, current_el);
-            uint32_t zcr_len;
-
-            /* If SVE is disabled, but FP is enabled,
-             * then the effective len is 0.
-             */
-            if (sve_el != 0 && fp_el == 0) {
-                zcr_len = 0;
-            } else {
-                zcr_len = sve_zcr_len_for_el(env, current_el);
-            }
-            flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
-            flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
-        }
-
-        sctlr = arm_sctlr(env, current_el);
-
-        if (cpu_isar_feature(aa64_pauth, cpu)) {
-            /*
-             * In order to save space in flags, we record only whether
-             * pauth is "inactive", meaning all insns are implemented as
-             * a nop, or "active" when some action must be performed.
-             * The decision of which action to take is left to a helper.
-             */
-            if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
-            }
-        }
-
-        if (cpu_isar_feature(aa64_bti, cpu)) {
-            /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
-            if (sctlr & (current_el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-                flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
-            }
-            flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
-        }
-    } else {
-        *pc = env->regs[15];
-        flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
-        flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_stride);
-        flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
-        flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
-        flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
-        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
-            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
-        }
-        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
-        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
-            flags = FIELD_DP32(flags, TBFLAG_A32,
-                               XSCALE_CPAR, env->cp15.c15_cpar);
-        }
-    }
-
-    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
-
-    /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
-     * states defined in the ARM ARM for software singlestep:
-     *  SS_ACTIVE   PSTATE.SS   State
-     *     0            x       Inactive (the TB flag for SS is always 0)
-     *     1            0       Active-pending
-     *     1            1       Active-not-pending
-     */
-    if (arm_singlestep_active(env)) {
-        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
-        if (is_a64(env)) {
-            if (env->pstate & PSTATE_SS) {
-                flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
-            }
-        } else {
-            if (env->uncached_cpsr & PSTATE_SS) {
-                flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
-            }
-        }
-    }
+    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
+    flags = FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
+                       arm_to_core_mmu_idx(mmu_idx));
     if (arm_cpu_data_is_big_endian(env)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
     }
-    flags = FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
+    if (arm_singlestep_active(env)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
+    }
+    return flags;
+}
+
+uint32_t rebuild_hflags_a32(CPUARMState *env, int el)
+{
+    uint32_t flags = 0;
+    ARMMMUIdx mmu_idx;
+    int fp_el;
+
+    flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
+    flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
 
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
     }
 
-    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
-     * suppressing them because the requested execution priority is less than 0.
+    mmu_idx = arm_mmu_idx(env);
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         arm_feature(env, ARM_FEATURE_M) &&
-        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
           (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         flags = FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
     }
 
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) != env->v7m.secure) {
-        flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+    fp_el = fp_exception_el(env, el);
+    return common_hflags(env, el, mmu_idx, fp_el, flags);
+}
+
+uint32_t rebuild_hflags_a64(CPUARMState *env, int el)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
+    ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
+    int fp_el = fp_exception_el(env, el);
+    uint32_t flags = 0;
+    uint64_t sctlr;
+    int tbii, tbid;
+
+    flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
+
+    /* Get control bits for tagged addresses.  */
+    /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+    if (regime_el(env, stage1) < 2) {
+        ARMVAParameters p1 = aa64_va_parameters_both(env, -1, stage1);
+        tbid = (p1.tbi << 1) | p0.tbi;
+        tbii = tbid & ~((p1.tbid << 1) | p0.tbid);
+    } else {
+        tbid = p0.tbi;
+        tbii = tbid & !p0.tbid;
     }
 
-    if (arm_feature(env, ARM_FEATURE_M) &&
-        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
-        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
-         (env->v7m.secure &&
-          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
-        /*
-         * ASPEN is set, but FPCA/SFPA indicate that there is no active
-         * FP context; we must create a new FP context before executing
-         * any FP insn.
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
+    flags = FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
+
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        int sve_el = sve_exception_el(env, el);
+        uint32_t zcr_len;
+
+        /* If SVE is disabled, but FP is enabled,
+         * then the effective len is 0.
          */
-        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+        if (sve_el != 0 && fp_el == 0) {
+            zcr_len = 0;
+        } else {
+            zcr_len = sve_zcr_len_for_el(env, el);
+        }
+        flags = FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
+        flags = FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
     }
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-
-        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
-            flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+    if (el == 0) {
+        /* FIXME: ARMv8.1-VHE S2 translation regime.  */
+        sctlr = env->cp15.sctlr_el[1];
+    } else {
+        sctlr = env->cp15.sctlr_el[el];
+    }
+    if (cpu_isar_feature(aa64_pauth, cpu)) {
+        /*
+         * In order to save space in flags, we record only whether
+         * pauth is "inactive", meaning all insns are implemented as
+         * a nop, or "active" when some action must be performed.
+         * The decision of which action to take is left to a helper.
+         */
+        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
         }
     }
 
-    *pflags = flags;
+    if (cpu_isar_feature(aa64_bti, cpu)) {
+        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
+        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, BT, 1);
+        }
+    }
+
+    return common_hflags(env, el, mmu_idx, fp_el, flags);
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    env->hflags = (is_a64(env)
+                   ? rebuild_hflags_a64(env, el)
+                   : rebuild_hflags_a32(env, el));
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, uint32_t el)
+{
+    tcg_debug_assert(!is_a64(env));
+    env->hflags = rebuild_hflags_a32(env, el);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, uint32_t el)
+{
+    tcg_debug_assert(is_a64(env));
+    env->hflags = rebuild_hflags_a64(env, el);
+}
+
+void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
+                          target_ulong *cs_base, uint32_t *pflags)
+{
+    int current_el = arm_current_el(env);
+    uint32_t flags;
+    uint32_t pstate_for_ss;
+
     *cs_base = 0;
+    if (is_a64(env)) {
+        *pc = env->pc;
+        flags = rebuild_hflags_a64(env, current_el);
+        flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
+        pstate_for_ss = env->pstate;
+    } else {
+        *pc = env->regs[15];
+        flags = rebuild_hflags_a32(env, current_el);
+        flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
+        flags = FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_bits);
+        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
+        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
+            flags = FIELD_DP32(flags, TBFLAG_A32, XSCALE_CPAR,
+                               env->cp15.c15_cpar);
+        } else {
+            flags = FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len);
+            flags = FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
+                               env->vfp.vec_stride);
+        }
+        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
+            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
+            flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
+        }
+
+        /* TODO: Perhaps cache these bits too?  */
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
+                != env->v7m.secure) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
+            }
+
+            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+                 (env->v7m.secure &&
+                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+                /*
+                 * ASPEN is set, but FPCA/SFPA indicate that there is no
+                 * active FP context; we must create a new FP context
+                 * before executing any FP insn.
+                 */
+                flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+            }
+
+            bool is_secure = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
+                flags = FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
+            }
+        }
+
+        pstate_for_ss = env->uncached_cpsr;
+    }
+
+    /*
+     * The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
+     * states defined in the ARM ARM for software singlestep:
+     *  SS_ACTIVE   PSTATE.SS   State
+     *     0            x       Inactive (the TB flag for SS is always 0)
+     *     1            0       Active-pending
+     *     1            1       Active-not-pending
+     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
+     */
+    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)
+        && (pstate_for_ss & PSTATE_SS)) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
+    }
+
+    *pflags = flags;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.17.1

