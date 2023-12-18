Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp723269eji;
        Mon, 18 Dec 2023 03:35:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhzAa0dRNU/cGLdX8uY2OpwMpgO73NovJrEjlGfSP9q3HbZAkWx9swPnCcaW/RAU3WfCsx
X-Received: by 2002:a05:620a:1130:b0:77f:aeb2:e4fb with SMTP id p16-20020a05620a113000b0077faeb2e4fbmr3971495qkk.125.1702899320896;
        Mon, 18 Dec 2023 03:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702899320; cv=none;
        d=google.com; s=arc-20160816;
        b=gVGKPbLTGcPN0JYctFzwURl973jhaYdLEAcsZQhLloCXeX758PFw/ZvvoOFSuPID3C
         lcvnZEaceiSk6zLbxuonoD2RFVZ6R8lIr0IRcM9grSffWnvpjmZ9+ly9n8nNSUj/kVrG
         179EjA6Lg980qvkGYyf6HFhqSwZMcBUAiNQOksxku1Mvk6cN7l86PdAZPVmdTKe9Fl/q
         3WLtfQQtnAzVrrO+xG8ASk5pord58AtQ9qYWPJLIgn/gJdwOEwynhRQSkeixvGF+ZFSO
         Yvan38FmqgW+yiBk3/sG/apXkodb8Q99hoc5BzvbKHVq+sANUcxWRG4181j1MTeutjaV
         0ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cYCrqAaacsYEAAVJfs5Gs2kxchvzBs7yOp3ceTvCjY4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=oSWpDSWKL59ylnkRNJRkQOHej4JTvuG2hBYh6kDqyYCsyLJRdgLPxxjEfgtsSygZ87
         Pltgf4DydHHw1mFXcpK51RgCmTo6+8D8FIoC8VJtKrYy041faz19psymztvkRh7t0nFw
         gpKjzKHXhxCppeAz/XwadOhGg8GbQNpcN3aOk2iTrH0UzE1TgidDUIxnYq+2J9zAjimM
         SwiRER7Ko0whAwzAsF+69cpTyIF2cBS9+1MI557ZZQagyqXSN/a0s4Gm6YeeR+hsnwf/
         eT/loFZRJ+MPhA22Sfo7Cp/mzRenV1UiY4AklirqKwbus1nEaDELwnAXpShgW4bCE8l4
         dLiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui8tXAAY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs33-20020a05620a472100b0077d7db62ccfsi24374956qkb.231.2023.12.18.03.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 03:35:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ui8tXAAY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFBsJ-00075r-13; Mon, 18 Dec 2023 06:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBsH-00072c-0p
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFBs8-0003N8-P7
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 06:33:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33663adf953so823865f8f.3
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 03:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702899199; x=1703503999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cYCrqAaacsYEAAVJfs5Gs2kxchvzBs7yOp3ceTvCjY4=;
 b=Ui8tXAAYenOMm2X9JOcKIspCG4CnO4j2mPh8/RbYGVc8o7c3K1B9rHL1xLpt2xnyJE
 UnpfvGkiArrEz0DAF6XP5BgxUDa/3Zfwg1+U+tFhhA2Do12CLUNj6qvzBN1JH1ITLr/O
 UhLq3ymO7LhxqeNtiWUJnOSf2aJ4iGshVevKiZn+tYzTg6r987xIS3/aqY1SBv+nzr3B
 CKGFbE6w4hSOkb4Ilxfe78E3SflYfvg5KThRdFTTgRTwVkrvWZW0QVo6eot8I3Zv0bpn
 aRyRGCQRFAq0OSY4eDgcCcOptOvsHeFX8ezTIMySUaM88AjLbX4p9Jxed6Io7pehYT6y
 071g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702899199; x=1703503999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYCrqAaacsYEAAVJfs5Gs2kxchvzBs7yOp3ceTvCjY4=;
 b=UMUAAC2qji+N7Ka63KTA8onKaIt6Hj6MaUOSLhKKiKpT0cvyzFFSgd3PwzZxLZLH1j
 75QjVNtn4SjwY17FSJpZoy07e17y0FcAEtstIVY8HRBYxPCwqglc1LLs7pCmMC43orKB
 sDlq6SaUnYZEcc02LXWeedz4inY6rlJzA2/wqqkprThhovGjyToboWTlqqnTHqzxLXHv
 I9uB6sO3gJOHYPCj16TCAqqlW1zn3Bf0V1ytOIVrfVzTIl1maxMbbAdrNXAhcyozD/0S
 envi2rzF8yLApmvR8ixNOJTiZMEOGaGO60T5bHFb8YgQEBv/PXnOHR5xFNYlar3WaPTm
 yf1Q==
X-Gm-Message-State: AOJu0Yy4stBh3VCmYBldw4UKL+J5Br9ZwO1V575Y+HZ5DjGPuygNPl/I
 7pMOWefDOQ2v8mgr9LQ5aBuqbNujvp7mQllE9DQ=
X-Received: by 2002:a5d:62c3:0:b0:336:5dbd:78f0 with SMTP id
 o3-20020a5d62c3000000b003365dbd78f0mr2321301wrv.111.1702899199371; 
 Mon, 18 Dec 2023 03:33:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b003366da509ecsm671193wro.85.2023.12.18.03.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 03:33:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 26/35] target/arm: Implement FEAT_NV2 redirection of sysregs
 to RAM
Date: Mon, 18 Dec 2023 11:32:56 +0000
Message-Id: <20231218113305.2511480-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218113305.2511480-1-peter.maydell@linaro.org>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HFU4be65H/np

FEAT_NV2 requires that when HCR_EL2.{NV,NV2} == 0b11 then accesses by
EL1 to certain system registers are redirected to RAM.  The full list
of affected registers is in the table in rule R_CSRPQ in the Arm ARM.
The registers may be normally accessible at EL1 (like ACTLR_EL1), or
normally UNDEF at EL1 (like HCR_EL2).  Some registers redirect to RAM
only when HCR_EL2.NV1 is 0, and some only when HCR_EL2.NV1 is 1;
others trap in both cases.

Add the infrastructure for identifying which registers should be
redirected and turning them into memory accesses.

This code does not set the correct syndrome or arrange for the
exception to be taken to the correct target EL if the access via
VNCR_EL2 faults; we will do that in the next commit.

Subsequent commits will mark up the relevant regdefs to set their
nv2_redirect_offset, and if relevant one of the two flags which
indicates that the redirect happens only for a particular value of
HCR_EL2.NV1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h            | 12 +++++++
 target/arm/cpu.h               |  4 +++
 target/arm/tcg/translate.h     |  6 ++++
 target/arm/tcg/hflags.c        |  6 ++++
 target/arm/tcg/translate-a64.c | 58 ++++++++++++++++++++++++++++++++++
 5 files changed, 86 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index cb795bed75b..b6fdd0f3eb4 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -826,6 +826,11 @@ typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
 
 #define CP_ANY 0xff
 
+/* Flags in the high bits of nv2_redirect_offset */
+#define NV2_REDIR_NV1 0x4000 /* Only redirect when HCR_EL2.NV1 == 1 */
+#define NV2_REDIR_NO_NV1 0x8000 /* Only redirect when HCR_EL2.NV1 == 0 */
+#define NV2_REDIR_FLAG_MASK 0xc000
+
 /* Definition of an ARM coprocessor register */
 struct ARMCPRegInfo {
     /* Name of register (useful mainly for debugging, need not be unique) */
@@ -867,6 +872,13 @@ struct ARMCPRegInfo {
      * value encodes both the trap register and bit within it.
      */
     FGTBit fgt;
+
+    /*
+     * Offset from VNCR_EL2 when FEAT_NV2 redirects access to memory;
+     * may include an NV2_REDIR_* flag.
+     */
+    uint32_t nv2_redirect_offset;
+
     /*
      * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e60b4f34fe4..bc4fa95ea35 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3244,6 +3244,10 @@ FIELD(TBFLAG_A64, ATA0, 31, 1)
 FIELD(TBFLAG_A64, NV, 32, 1)
 FIELD(TBFLAG_A64, NV1, 33, 1)
 FIELD(TBFLAG_A64, NV2, 34, 1)
+/* Set if FEAT_NV2 RAM accesses use the EL2&0 translation regime */
+FIELD(TBFLAG_A64, NV2_MEM_E20, 35, 1)
+/* Set if FEAT_NV2 RAM accesses are big-endian */
+FIELD(TBFLAG_A64, NV2_MEM_BE, 36, 1)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 9e13c4ef7b6..93be745cf33 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -150,6 +150,10 @@ typedef struct DisasContext {
     bool nv1;
     /* True if NV enabled and HCR_EL2.NV2 is set */
     bool nv2;
+    /* True if NV2 enabled and NV2 RAM accesses use EL2&0 translation regime */
+    bool nv2_mem_e20;
+    /* True if NV2 enabled and NV2 RAM accesses are big-endian */
+    bool nv2_mem_be;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
@@ -165,6 +169,8 @@ typedef struct DisasContext {
     int c15_cpar;
     /* TCG op of the current insn_start.  */
     TCGOp *insn_start;
+    /* Offset from VNCR_EL2 when FEAT_NV2 redirects this reg to memory */
+    uint32_t nv2_redirect_offset;
 } DisasContext;
 
 typedef struct DisasCompare {
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index d2b352663e8..8e5d35d9227 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -307,6 +307,12 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
         if (hcr & HCR_NV2) {
             DP_TBFLAG_A64(flags, NV2, 1);
+            if (hcr & HCR_E2H) {
+                DP_TBFLAG_A64(flags, NV2_MEM_E20, 1);
+            }
+            if (env->cp15.sctlr_el[2] & SCTLR_EE) {
+                DP_TBFLAG_A64(flags, NV2_MEM_BE, 1);
+            }
         }
     }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6909c9df30d..128bff4b445 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2134,6 +2134,7 @@ static void handle_sys(DisasContext *s, bool isread,
     bool nv_trap_to_el2 = false;
     bool nv_redirect_reg = false;
     bool skip_fp_access_checks = false;
+    bool nv2_mem_redirect = false;
     TCGv_ptr tcg_ri = NULL;
     TCGv_i64 tcg_rt;
     uint32_t syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
@@ -2166,6 +2167,21 @@ static void handle_sys(DisasContext *s, bool isread,
         return;
     }
 
+    if (s->nv && s->nv2 && ri->nv2_redirect_offset) {
+        /*
+         * Some registers always redirect to memory; some only do so if
+         * HCR_EL2.NV1 is 0, and some only if NV1 is 1 (these come in
+         * pairs which share an offset; see the table in R_CSRPQ).
+         */
+        if (ri->nv2_redirect_offset & NV2_REDIR_NV1) {
+            nv2_mem_redirect = s->nv1;
+        } else if (ri->nv2_redirect_offset & NV2_REDIR_NO_NV1) {
+            nv2_mem_redirect = !s->nv1;
+        } else {
+            nv2_mem_redirect = true;
+        }
+    }
+
     /* Check access permissions */
     if (!cp_access_ok(s->current_el, ri, isread)) {
         /*
@@ -2181,6 +2197,12 @@ static void handle_sys(DisasContext *s, bool isread,
              * the EL2 register's accessfn.
              */
             nv_redirect_reg = true;
+            assert(!nv2_mem_redirect);
+        } else if (nv2_mem_redirect) {
+            /*
+             * NV2 redirect-to-memory takes precedence over trap to EL2 or
+             * UNDEF to EL1.
+             */
         } else if (s->nv && arm_cpreg_traps_in_nv(ri)) {
             /*
              * This register / instruction exists and is an EL2 register, so
@@ -2254,6 +2276,40 @@ static void handle_sys(DisasContext *s, bool isread,
         assert(!(ri->type & ARM_CP_RAISES_EXC));
     }
 
+    if (nv2_mem_redirect) {
+        /*
+         * This system register is being redirected into an EL2 memory access.
+         * This means it is not an IO operation, doesn't change hflags,
+         * and need not end the TB, because it has no side effects.
+         *
+         * The access is 64-bit single copy atomic, guaranteed aligned because
+         * of the definition of VCNR_EL2. Its endianness depends on
+         * SCTLR_EL2.EE, not on the data endianness of EL1.
+         * It is done under either the EL2 translation regime or the EL2&0
+         * translation regime, depending on HCR_EL2.E2H. It behaves as if
+         * PSTATE.PAN is 0.
+         */
+        TCGv_i64 ptr = tcg_temp_new_i64();
+        MemOp mop = MO_64 | MO_ALIGN | MO_ATOM_IFALIGN;
+        ARMMMUIdx armmemidx = s->nv2_mem_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
+        int memidx = arm_to_core_mmu_idx(armmemidx);
+
+        if (s->nv2_mem_be) {
+            mop |= MO_BE;
+        }
+
+        tcg_gen_ld_i64(ptr, tcg_env, offsetof(CPUARMState, cp15.vncr_el2));
+        tcg_gen_addi_i64(ptr, ptr,
+                         (ri->nv2_redirect_offset & ~NV2_REDIR_FLAG_MASK));
+        tcg_rt = cpu_reg(s, rt);
+        if (isread) {
+            tcg_gen_qemu_ld_i64(tcg_rt, ptr, memidx, mop);
+        } else {
+            tcg_gen_qemu_st_i64(tcg_rt, ptr, memidx, mop);
+        }
+        return;
+    }
+
     /* Handle special cases first */
     switch (ri->type & ARM_CP_SPECIAL_MASK) {
     case 0:
@@ -14062,6 +14118,8 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->nv = EX_TBFLAG_A64(tb_flags, NV);
     dc->nv1 = EX_TBFLAG_A64(tb_flags, NV1);
     dc->nv2 = EX_TBFLAG_A64(tb_flags, NV2);
+    dc->nv2_mem_e20 = EX_TBFLAG_A64(tb_flags, NV2_MEM_E20);
+    dc->nv2_mem_be = EX_TBFLAG_A64(tb_flags, NV2_MEM_BE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1

