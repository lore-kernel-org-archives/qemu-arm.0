Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8306157ejb;
        Wed, 4 Jan 2023 14:01:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6j/IRken8ytD6VnMV1ZcytDXM3X6Hs2LKPqJviCXBogPdQG219qVM93mms7OnK+mdr22e
X-Received: by 2002:a05:6000:810:b0:29f:9832:ff96 with SMTP id bt16-20020a056000081000b0029f9832ff96mr5164012wrb.2.1672869712178;
        Wed, 04 Jan 2023 14:01:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672869712; cv=none;
        d=google.com; s=arc-20160816;
        b=wT+y2YBMR5jU5FL1cR2UtZ8DUDrqfQB6JEFV4Z9mvwXbRDs0XgLtK5j+wjjZnojXtT
         EGT1g8wI+XGCGSM25zViq+IXzJaZxVOQL7RIe0W697H2JLcdTKD4+x0BOZb9q3AI17hT
         aSzkNNFeFtj9DHtgXtFJWOlu2W/F4G0yhBpFFuvwm8f5gZ+RvoNWsTXGSM2+82E6iDYB
         POb/+Mk3ZkDCyeGDyTmTlKpASoR44TYMVc9Hb/9NF+tTBr18uXVWWQ3FLImw1Uv5NCnx
         ZSRke1BoUTiD6kCOAUBGFq3Cbkc/i9Hd5W2w3hwUz8x/hHn7oBpFGFB7QFZwWD7055Bg
         5SRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=RZOkRBcfaK8MnzrGHwDzXj5qZHLrjI+hPrtZF9o7CSc=;
        b=uXUb7076fhhOV9b09I0V0U6ztcDbXb0HE10mfJmLbVBn9Z+mKhT+D99U4eEZGjEMvL
         oNtlRj1iXkcFSyU7VgjQutm3kIjoNR6i4YavypPQ/45mz4xaTEnTLlmdRq8qYXqKwkMW
         lMpofQN7o+7zDwc8MCKnIcY+gGznqVW7oDzZluqROKX6uhjfl7dQ6qS0k99TQnS7AZKI
         fw5IPabcCnlTr/w3nh5PbpGCu1tK/l2xlWSmi25u+Gc8+iENpgU8+3repc4U2Nix1wcy
         +aFW8J9AmvyQk4JJO/QobdmBHarBeYG0EguU0wBasLWk5RoSeCXY+Vuh7lyGVwUgq2xP
         oOag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=YUcISFps;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out1.suse.de (smtp-out1.suse.de. [195.135.220.28])
        by mx.google.com with ESMTPS id bd8-20020a05600c1f0800b003c6efd69cf3si89282wmb.100.2023.01.04.14.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 14:01:52 -0800 (PST)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) client-ip=195.135.220.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=YUcISFps;
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of farosas@suse.de designates 195.135.220.28 as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C0C124D80D;
	Wed,  4 Jan 2023 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1672869711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZOkRBcfaK8MnzrGHwDzXj5qZHLrjI+hPrtZF9o7CSc=;
	b=YUcISFpsEI8dzmxzT/WF6fxfHiSsWmWowF1cnGBF+JO0noKOylaBRGIWU23ubE6TcqdkjU
	Iw/EkSeaHRDMuQnfUbJ/0kW16YoWsoXn1dzXWiYfg1Qw0gsunr3FU6pt9cgbRZDETfqtnU
	Z+pRrI2I+pQUZJdNZ7Ndg9b9KnGNBqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1672869711;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZOkRBcfaK8MnzrGHwDzXj5qZHLrjI+hPrtZF9o7CSc=;
	b=Ip819iGkRc1RVhGrjzQjSRgOpidcxmCC5tCxHnbjnpAsaoaJRpP+iY9tOPD28SSRd68+jk
	Vo6hhiZjp1EgRGDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17E221342C;
	Wed,  4 Jan 2023 22:01:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IG0lNEz3tWPwJAAAMHmgww
	(envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:01:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH 22/27] target/arm: Move hflags code into the tcg directory
Date: Wed,  4 Jan 2023 18:58:30 -0300
Message-Id: <20230104215835.24692-23-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AAAppTsLfmHm

The hflags are used only for TCG code, so introduce a new file
hflags.c to keep that code.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/boot.c              |   5 +-
 target/arm/arm-powerctl.c  |   8 +-
 target/arm/helper.c        | 337 +-----------------------------------
 target/arm/internals.h     |   3 +
 target/arm/tcg-stubs.c     |  10 ++
 target/arm/tcg/hflags.c    | 344 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |   1 +
 7 files changed, 369 insertions(+), 339 deletions(-)
 create mode 100644 target/arm/tcg/hflags.c

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..54b9dbd994 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "sysemu/tcg.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -827,7 +828,9 @@ static void do_cpu_reset(void *opaque)
                 info->secondary_cpu_reset_hook(cpu, info);
             }
         }
-        arm_rebuild_hflags(env);
+        if (tcg_enabled()) {
+            arm_rebuild_hflags(env);
+        }
     }
 }
 
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..a00624876c 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -15,6 +15,7 @@
 #include "arm-powerctl.h"
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
+#include "sysemu/tcg.h"
 
 #ifndef DEBUG_ARM_POWERCTL
 #define DEBUG_ARM_POWERCTL 0
@@ -127,9 +128,10 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
         target_cpu->env.regs[0] = info->context_id;
     }
 
-    /* CP15 update requires rebuilding hflags */
-    arm_rebuild_hflags(&target_cpu->env);
-
+    if (tcg_enabled()) {
+        /* CP15 update requires rebuilding hflags */
+        arm_rebuild_hflags(&target_cpu->env);
+    }
     /* Start the new CPU at the requested address */
     cpu_set_pc(target_cpu_state, info->entry);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a536d77611..ed4a76ccdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -241,7 +241,7 @@ int sme_exception_el(CPUARMState *env, int el)
 }
 
 /* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
-static bool sme_fa64(CPUARMState *env, int el)
+bool sme_fa64(CPUARMState *env, int el)
 {
     if (!cpu_isar_feature(aa64_sme_fa64, env_archcpu(env))) {
         return false;
@@ -1834,7 +1834,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
     }
 }
 
-static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
+int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 57, 2);
@@ -2545,339 +2545,6 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
     return arm_mmu_idx_el(env, arm_current_el(env));
 }
 
-static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
-                                           ARMMMUIdx mmu_idx,
-                                           CPUARMTBFlags flags)
-{
-    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
-    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
-
-    if (arm_singlestep_active(env)) {
-        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
-    }
-    return flags;
-}
-
-static CPUARMTBFlags rebuild_hflags_common_32(CPUARMState *env, int fp_el,
-                                              ARMMMUIdx mmu_idx,
-                                              CPUARMTBFlags flags)
-{
-    bool sctlr_b = arm_sctlr_b(env);
-
-    if (sctlr_b) {
-        DP_TBFLAG_A32(flags, SCTLR__B, 1);
-    }
-    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
-    }
-    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
-
-    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
-    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_v7m_is_handler_mode(env)) {
-        DP_TBFLAG_M32(flags, HANDLER, 1);
-    }
-
-    /*
-     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
-     * is suppressing them because the requested execution priority
-     * is less than 0.
-     */
-    if (arm_feature(env, ARM_FEATURE_V8) &&
-        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
-        DP_TBFLAG_M32(flags, STACKCHECK, 1);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
-        DP_TBFLAG_M32(flags, SECURE, 1);
-    }
-
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    int el = arm_current_el(env);
-
-    if (arm_sctlr(env, el) & SCTLR_A) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_el_is_aa64(env, 1)) {
-        DP_TBFLAG_A32(flags, VFPEN, 1);
-    }
-
-    if (el < 2 && env->cp15.hstr_el2 &&
-        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
-        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
-    }
-
-    if (env->uncached_cpsr & CPSR_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
-    /*
-     * The SME exception we are testing for is raised via
-     * AArch64.CheckFPAdvSIMDEnabled(), as called from
-     * AArch32.CheckAdvSIMDOrFPEnabled().
-     */
-    if (el == 0
-        && FIELD_EX64(env->svcr, SVCR, SM)
-        && (!arm_is_el2_enabled(env)
-            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
-        && arm_el_is_aa64(env, 1)
-        && !sme_fa64(env, el)) {
-        DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
-    }
-
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
-                                        ARMMMUIdx mmu_idx)
-{
-    CPUARMTBFlags flags = {};
-    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr(env, mmu_idx);
-    uint64_t sctlr;
-    int tbii, tbid;
-
-    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
-
-    /* Get control bits for tagged addresses.  */
-    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
-    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
-
-    DP_TBFLAG_A64(flags, TBII, tbii);
-    DP_TBFLAG_A64(flags, TBID, tbid);
-
-    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
-        int sve_el = sve_exception_el(env, el);
-
-        /*
-         * If either FP or SVE are disabled, translator does not need len.
-         * If SVE EL > FP EL, FP exception has precedence, and translator
-         * does not need SVE EL.  Save potential re-translations by forcing
-         * the unneeded data to zero.
-         */
-        if (fp_el != 0) {
-            if (sve_el > fp_el) {
-                sve_el = 0;
-            }
-        } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
-        }
-        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-    }
-    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
-        int sme_el = sme_exception_el(env, el);
-        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
-
-        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
-        if (sme_el == 0) {
-            /* Similarly, do not compute SVL if SME is disabled. */
-            int svl = sve_vqm1_for_el_sm(env, el, true);
-            DP_TBFLAG_A64(flags, SVL, svl);
-            if (sm) {
-                /* If SVE is disabled, we will not have set VL above. */
-                DP_TBFLAG_A64(flags, VL, svl);
-            }
-        }
-        if (sm) {
-            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
-            DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
-        }
-        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
-    }
-
-    sctlr = regime_sctlr(env, stage1);
-
-    if (sctlr & SCTLR_A) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
-    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
-    }
-
-    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
-        /*
-         * In order to save space in flags, we record only whether
-         * pauth is "inactive", meaning all insns are implemented as
-         * a nop, or "active" when some action must be performed.
-         * The decision of which action to take is left to a helper.
-         */
-        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
-            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
-        }
-    }
-
-    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
-        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
-        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
-            DP_TBFLAG_A64(flags, BT, 1);
-        }
-    }
-
-    /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
-    if (!(env->pstate & PSTATE_UAO)) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_E10_1:
-        case ARMMMUIdx_E10_1_PAN:
-            /* TODO: ARMv8.3-NV */
-            DP_TBFLAG_A64(flags, UNPRIV, 1);
-            break;
-        case ARMMMUIdx_E20_2:
-        case ARMMMUIdx_E20_2_PAN:
-            /*
-             * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
-             * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
-             */
-            if (env->cp15.hcr_el2 & HCR_TGE) {
-                DP_TBFLAG_A64(flags, UNPRIV, 1);
-            }
-            break;
-        default:
-            break;
-        }
-    }
-
-    if (env->pstate & PSTATE_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
-    if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
-        /*
-         * Set MTE_ACTIVE if any access may be Checked, and leave clear
-         * if all accesses must be Unchecked:
-         * 1) If no TBI, then there are no tags in the address to check,
-         * 2) If Tag Check Override, then all accesses are Unchecked,
-         * 3) If Tag Check Fail == 0, then Checked access have no effect,
-         * 4) If no Allocation Tag Access, then all accesses are Unchecked.
-         */
-        if (allocation_tag_access_enabled(env, el, sctlr)) {
-            DP_TBFLAG_A64(flags, ATA, 1);
-            if (tbid
-                && !(env->pstate & PSTATE_TCO)
-                && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
-                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
-            }
-        }
-        /* And again for unprivileged accesses, if required.  */
-        if (EX_TBFLAG_A64(flags, UNPRIV)
-            && tbid
-            && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF0)
-            && allocation_tag_access_enabled(env, 0, sctlr)) {
-            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
-        }
-        /* Cache TCMA as well as TBI. */
-        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
-    }
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
-}
-
-static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    if (is_a64(env)) {
-        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-    } else if (arm_feature(env, ARM_FEATURE_M)) {
-        return rebuild_hflags_m32(env, fp_el, mmu_idx);
-    } else {
-        return rebuild_hflags_a32(env, fp_el, mmu_idx);
-    }
-}
-
-void arm_rebuild_hflags(CPUARMState *env)
-{
-    env->hflags = rebuild_hflags_internal(env);
-}
-
-/*
- * If we have triggered a EL state change we can't rely on the
- * translator having passed it to us, we need to recompute.
- */
-void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
-}
-
-/*
- * If we have triggered a EL state change we can't rely on the
- * translator having passed it to us, we need to recompute.
- */
-void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
-{
-    int el = arm_current_el(env);
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
-}
-
-void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
-{
-    int fp_el = fp_exception_el(env, el);
-    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
-
-    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
-}
-
-static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
-{
-#ifdef CONFIG_DEBUG_TCG
-    CPUARMTBFlags c = env->hflags;
-    CPUARMTBFlags r = rebuild_hflags_internal(env);
-
-    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
-        fprintf(stderr, "TCG hflags mismatch "
-                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
-                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
-                c.flags, c.flags2, r.flags, r.flags2);
-        abort();
-    }
-#endif
-}
-
 static bool mve_no_pred(CPUARMState *env)
 {
     /*
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3493b5cc88..6f14dd8f51 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1094,6 +1094,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx);
 int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx);
+int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx);
 
 /* Determine if allocation tags are available.  */
 static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
@@ -1384,4 +1385,6 @@ static inline uint64_t arm_mdcr_el2_eff(CPUARMState *env)
     ((1 << (1 - 1)) | (1 << (2 - 1)) |                  \
      (1 << (4 - 1)) | (1 << (8 - 1)) | (1 << (16 - 1)))
 
+void assert_hflags_rebuild_correctly(CPUARMState *env);
+bool sme_fa64(CPUARMState *env, int el);
 #endif
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index a28960d88a..df5154b79b 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "internals.h"
 
 void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
 {
@@ -25,3 +26,12 @@ void arm_reset_sve_state(CPUARMState *env)
 {
     g_assert_not_reached();
 }
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
+
+void assert_hflags_rebuild_correctly(CPUARMState *env)
+{
+}
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
new file mode 100644
index 0000000000..f16dba4fe4
--- /dev/null
+++ b/target/arm/tcg/hflags.c
@@ -0,0 +1,344 @@
+/*
+ * ARM hflags
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/helper-proto.h"
+
+static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
+                                           ARMMMUIdx mmu_idx,
+                                           CPUARMTBFlags flags)
+{
+    DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
+    DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
+
+    if (arm_singlestep_active(env)) {
+        DP_TBFLAG_ANY(flags, SS_ACTIVE, 1);
+    }
+    return flags;
+}
+
+static CPUARMTBFlags rebuild_hflags_common_32(CPUARMState *env, int fp_el,
+                                              ARMMMUIdx mmu_idx,
+                                              CPUARMTBFlags flags)
+{
+    bool sctlr_b = arm_sctlr_b(env);
+
+    if (sctlr_b) {
+        DP_TBFLAG_A32(flags, SCTLR__B, 1);
+    }
+    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+    }
+    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+
+    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
+    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_v7m_is_handler_mode(env)) {
+        DP_TBFLAG_M32(flags, HANDLER, 1);
+    }
+
+    /*
+     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
+     * is suppressing them because the requested execution priority
+     * is less than 0.
+     */
+    if (arm_feature(env, ARM_FEATURE_V8) &&
+        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+        DP_TBFLAG_M32(flags, STACKCHECK, 1);
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
+        DP_TBFLAG_M32(flags, SECURE, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    int el = arm_current_el(env);
+
+    if (arm_sctlr(env, el) & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_el_is_aa64(env, 1)) {
+        DP_TBFLAG_A32(flags, VFPEN, 1);
+    }
+
+    if (el < 2 && env->cp15.hstr_el2 &&
+        (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
+        DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
+    }
+
+    if (env->uncached_cpsr & CPSR_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
+    /*
+     * The SME exception we are testing for is raised via
+     * AArch64.CheckFPAdvSIMDEnabled(), as called from
+     * AArch32.CheckAdvSIMDOrFPEnabled().
+     */
+    if (el == 0
+        && FIELD_EX64(env->svcr, SVCR, SM)
+        && (!arm_is_el2_enabled(env)
+            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
+        && arm_el_is_aa64(env, 1)
+        && !sme_fa64(env, el)) {
+        DP_TBFLAG_A32(flags, SME_TRAP_NONSTREAMING, 1);
+    }
+
+    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
+                                        ARMMMUIdx mmu_idx)
+{
+    CPUARMTBFlags flags = {};
+    ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
+    uint64_t tcr = regime_tcr(env, mmu_idx);
+    uint64_t sctlr;
+    int tbii, tbid;
+
+    DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
+
+    /* Get control bits for tagged addresses.  */
+    tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
+    tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
+
+    DP_TBFLAG_A64(flags, TBII, tbii);
+    DP_TBFLAG_A64(flags, TBID, tbid);
+
+    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
+        int sve_el = sve_exception_el(env, el);
+
+        /*
+         * If either FP or SVE are disabled, translator does not need len.
+         * If SVE EL > FP EL, FP exception has precedence, and translator
+         * does not need SVE EL.  Save potential re-translations by forcing
+         * the unneeded data to zero.
+         */
+        if (fp_el != 0) {
+            if (sve_el > fp_el) {
+                sve_el = 0;
+            }
+        } else if (sve_el == 0) {
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
+        }
+        DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
+    }
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))) {
+        int sme_el = sme_exception_el(env, el);
+        bool sm = FIELD_EX64(env->svcr, SVCR, SM);
+
+        DP_TBFLAG_A64(flags, SMEEXC_EL, sme_el);
+        if (sme_el == 0) {
+            /* Similarly, do not compute SVL if SME is disabled. */
+            int svl = sve_vqm1_for_el_sm(env, el, true);
+            DP_TBFLAG_A64(flags, SVL, svl);
+            if (sm) {
+                /* If SVE is disabled, we will not have set VL above. */
+                DP_TBFLAG_A64(flags, VL, svl);
+            }
+        }
+        if (sm) {
+            DP_TBFLAG_A64(flags, PSTATE_SM, 1);
+            DP_TBFLAG_A64(flags, SME_TRAP_NONSTREAMING, !sme_fa64(env, el));
+        }
+        DP_TBFLAG_A64(flags, PSTATE_ZA, FIELD_EX64(env->svcr, SVCR, ZA));
+    }
+
+    sctlr = regime_sctlr(env, stage1);
+
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
+    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
+        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+    }
+
+    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
+        /*
+         * In order to save space in flags, we record only whether
+         * pauth is "inactive", meaning all insns are implemented as
+         * a nop, or "active" when some action must be performed.
+         * The decision of which action to take is left to a helper.
+         */
+        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB)) {
+            DP_TBFLAG_A64(flags, PAUTH_ACTIVE, 1);
+        }
+    }
+
+    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
+        /* Note that SCTLR_EL[23].BT == SCTLR_BT1.  */
+        if (sctlr & (el == 0 ? SCTLR_BT0 : SCTLR_BT1)) {
+            DP_TBFLAG_A64(flags, BT, 1);
+        }
+    }
+
+    /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
+    if (!(env->pstate & PSTATE_UAO)) {
+        switch (mmu_idx) {
+        case ARMMMUIdx_E10_1:
+        case ARMMMUIdx_E10_1_PAN:
+            /* TODO: ARMv8.3-NV */
+            DP_TBFLAG_A64(flags, UNPRIV, 1);
+            break;
+        case ARMMMUIdx_E20_2:
+        case ARMMMUIdx_E20_2_PAN:
+            /*
+             * Note that EL20_2 is gated by HCR_EL2.E2H == 1, but EL20_0 is
+             * gated by HCR_EL2.<E2H,TGE> == '11', and so is LDTR.
+             */
+            if (env->cp15.hcr_el2 & HCR_TGE) {
+                DP_TBFLAG_A64(flags, UNPRIV, 1);
+            }
+            break;
+        default:
+            break;
+        }
+    }
+
+    if (env->pstate & PSTATE_IL) {
+        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
+    }
+
+    if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
+        /*
+         * Set MTE_ACTIVE if any access may be Checked, and leave clear
+         * if all accesses must be Unchecked:
+         * 1) If no TBI, then there are no tags in the address to check,
+         * 2) If Tag Check Override, then all accesses are Unchecked,
+         * 3) If Tag Check Fail == 0, then Checked access have no effect,
+         * 4) If no Allocation Tag Access, then all accesses are Unchecked.
+         */
+        if (allocation_tag_access_enabled(env, el, sctlr)) {
+            DP_TBFLAG_A64(flags, ATA, 1);
+            if (tbid
+                && !(env->pstate & PSTATE_TCO)
+                && (sctlr & (el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
+                DP_TBFLAG_A64(flags, MTE_ACTIVE, 1);
+            }
+        }
+        /* And again for unprivileged accesses, if required.  */
+        if (EX_TBFLAG_A64(flags, UNPRIV)
+            && tbid
+            && !(env->pstate & PSTATE_TCO)
+            && (sctlr & SCTLR_TCF0)
+            && allocation_tag_access_enabled(env, 0, sctlr)) {
+            DP_TBFLAG_A64(flags, MTE0_ACTIVE, 1);
+        }
+        /* Cache TCMA as well as TBI. */
+        DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
+    }
+
+    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+}
+
+static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    if (is_a64(env)) {
+        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+    } else if (arm_feature(env, ARM_FEATURE_M)) {
+        return rebuild_hflags_m32(env, fp_el, mmu_idx);
+    } else {
+        return rebuild_hflags_a32(env, fp_el, mmu_idx);
+    }
+}
+
+void arm_rebuild_hflags(CPUARMState *env)
+{
+    env->hflags = rebuild_hflags_internal(env);
+}
+
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it to us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_m32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_m32(env, fp_el, mmu_idx);
+}
+
+/*
+ * If we have triggered a EL state change we can't rely on the
+ * translator having passed it to us, we need to recompute.
+ */
+void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
+{
+    int el = arm_current_el(env);
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
+}
+
+void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
+{
+    int fp_el = fp_exception_el(env, el);
+    ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, el);
+
+    env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
+}
+
+inline void assert_hflags_rebuild_correctly(CPUARMState *env)
+{
+#ifdef CONFIG_DEBUG_TCG
+    CPUARMTBFlags c = env->hflags;
+    CPUARMTBFlags r = rebuild_hflags_internal(env);
+
+    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
+        fprintf(stderr, "TCG hflags mismatch "
+                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
+                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                c.flags, c.flags2, r.flags, r.flags2);
+        abort();
+    }
+#endif
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 83320f158e..048620db9d 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -26,6 +26,7 @@ arm_ss.add(files(
   'cpregs.c',
   'crypto_helper.c',
   'debug_helper.c',
+  'hflags.c',
   'iwmmxt_helper.c',
   'm_helper.c',
   'mve_helper.c',
-- 
2.35.3
