Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3908142wrx;
        Tue, 16 Apr 2019 06:10:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYa5Uba9O3di0WEogHPPEAd7S6v+4d6qBAsps7/PcMba1+o+yMfHus6Sci0W5gqxcC7hXi
X-Received: by 2002:a5d:4987:: with SMTP id r7mr33733311wrq.280.1555420209397;
        Tue, 16 Apr 2019 06:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420209; cv=none;
        d=google.com; s=arc-20160816;
        b=Xeq26m2JrIUNSBn6h6fGy87WoDR2vfCH5pvXz3lhlcrw6hdA6rNQpI7baGBsV6n2ws
         LBKUlfhDnWWXuBK3uYjxsumgy2be/jAZfUwe5uYfrdbbhA8wY/rxqwSQel9iz0IkIrJR
         beBwaCCxNq8GJm/JynQECslHvcH1WCGxVUmn+WV8r9AglD8oc0Zneip8mq1YlGzCV6sC
         +TbHnCryumij0dAQ8Ni05CASLTkv5xr+8RpKHOx82Jy7YuleMCu6FGMAGQSfMOo90sAB
         iXZl+ZbkBcPpwsDrq5bHA3ScSdPlDhtAvEVhCtXsmAz/THnPFBaNNFn6isgkRX7pXUze
         91aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=KKWm6gZFAyj+LJquTLC2CU4eM0/C0INvFXmEW6XbIt4=;
        b=X3yrcOQXp4nkMKOUIxUn9jW+jtM86daMfL2K8lLzucxY6+uLcIzlvWQ6WD2WuE8281
         1TVNEOAsRQPlI7qxHxTx52qrL2ErngICe7N+1kzbUpgBchRMrQ8CYXrBh1GpYV8oYm5g
         JMhFKKVPjEIh6xiqusu7TLGdWyJj8CjbGn4ypdMvva2jPt3aJ+N58y9XQB6HYw+uUpuH
         cNORvTcVSZi9L5o/29/IUNzIfJ1COmu7BjdDzmOtqSudst3MDGo/SMA/cQyZrde/jV3X
         YItgF4wSXuEJAqa3HI3dpC6jN7Xga6pWTbzNwZVXhEbiGfyKyWAbrY53dnjNdmGmy2TN
         hXOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJlrEG1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si13001140wmc.143.2019.04.16.06.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fJlrEG1P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNqi-0006BF-9y
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:10:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfc-0005BD-PI
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfa-0001YV-MP
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:40 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfY-0001U5-Ml
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id g3so26914157wrx.9
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KKWm6gZFAyj+LJquTLC2CU4eM0/C0INvFXmEW6XbIt4=;
	b=fJlrEG1PxldDdz0NpNggkqwEfZxZmidN4DaNYt9JKqKYa8fKa9u3Ecav8KXq8slLAs
	j71jJw62HJKieu/mYH1Xx9QvhhHiZfnjkVWGikmSqMJxzcn8BrmvdLNSvNooy4p3uaOf
	/jmonvoFhuxWo/jJibtwZm0ZLw/yEbxndldo0Nu5HdWTeIyqGCseDjUE50JjFCjACEKk
	RJX81OZK7gM5Tx251r7F1l4ZCfUCuBla2OyhsDu6ytu0SNQcf8s9tgK6voxuA/Ielvwt
	TYPbc7MCIqXI1DwKL5/BvEcjrX5uDP0V62SQ0e23mvL/sx8rznq1ZUuVYxjO2K0AEIHL
	CdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KKWm6gZFAyj+LJquTLC2CU4eM0/C0INvFXmEW6XbIt4=;
	b=mbee48DYnhfTuLQFihz4y/T/q7MCuwMt77XrF9eQ8m8lthT04U+v4Qm5F3h11EvEkS
	ZAYBL+RWQeAYlLLGJuVW16c0xlMstZdLPKriTCWfs54rWSAUPv2rNNuJjMA077FWycow
	FHnQdwkVvJaP8eUMuWbvQHz/dnTtt+AyBBC7ir9tgbTMdFhEy2aRrX9ia7oBxw/bHssV
	jSHYklPnzyUn05AsdF0bAL23j1OblGqS3FOyxjV4wJIHZmEUR9pXwYUQM+wiIZqXQ3A+
	FOPYvNeli0PsEbu40RmKH9PYPIFCSjtpgIfYAQDvPzDztbdbvwPdS0r11zLQ83FAd49h
	TVeg==
X-Gm-Message-State: APjAAAVz2hgqoZgDq486FxXLJgtOzxUi5Az9BjfU+xt5oyCMEVhSRlTT
	KO9wQ5yH0WwbyUZoU6NAP07KIOXbvjc=
X-Received: by 2002:adf:b6a4:: with SMTP id j36mr50715615wre.55.1555419512552; 
	Tue, 16 Apr 2019 05:58:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:42 +0100
Message-Id: <20190416125744.27770-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 24/26] target/arm: Implement VLSTM for v7M CPUs
 with an FPU
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cWTG5+8hUUNU

Implement the VLSTM instruction for v7M for the FPU present case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  2 +
 target/arm/helper.h    |  2 +
 target/arm/helper.c    | 84 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c | 15 +++++++-
 4 files changed, 102 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8fd6551c6cd..eac194b4d5f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -58,6 +58,8 @@
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
 #define EXCP_STKOF          19   /* v8M STKOF UsageFault */
 #define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
+#define EXCP_LSERR          21   /* v8M LSERR SecureFault */
+#define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
 /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
 
 #define ARMV7M_EXCP_RESET   1
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0a3a80528c7..62051ae6d51 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -71,6 +71,8 @@ DEF_HELPER_3(v7m_tt, i32, env, i32, i32)
 
 DEF_HELPER_1(v7m_preserve_fp_state, void, env)
 
+DEF_HELPER_2(v7m_vlstm, void, env, i32)
+
 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c56746aafa2..ad049b2d9bc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7389,6 +7389,12 @@ void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
     g_assert_not_reached();
 }
 
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
 uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 {
     /* The TT instructions can be used by unprivileged code, but in
@@ -8405,6 +8411,74 @@ static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
     }
 }
 
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    /* fptr is the value of Rn, the frame pointer we store the FP regs to */
+    bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+    bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
+
+    assert(env->v7m.secure);
+
+    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
+        return;
+    }
+
+    /* Check access to the coprocessor is permitted */
+    if (!v7m_cpacr_pass(env, true, arm_current_el(env) != 0)) {
+        raise_exception_ra(env, EXCP_NOCP, 0, 1, GETPC());
+    }
+
+    if (lspact) {
+        /* LSPACT should not be active when there is active FP state */
+        raise_exception_ra(env, EXCP_LSERR, 0, 1, GETPC());
+    }
+
+    if (fptr & 7) {
+        raise_exception_ra(env, EXCP_UNALIGNED, 0, 1, GETPC());
+    }
+
+    /*
+     * Note that we do not use v7m_stack_write() here, because the
+     * accesses should not set the FSR bits for stacking errors if they
+     * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_STACK
+     * or AccType_LAZYFP). Faults in cpu_stl_data() will throw exceptions
+     * and longjmp out.
+     */
+    if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
+        bool ts = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK;
+        int i;
+
+        for (i = 0; i < (ts ? 32 : 16); i += 2) {
+            uint64_t dn = *aa32_vfp_dreg(env, i / 2);
+            uint32_t faddr = fptr + 4 * i;
+            uint32_t slo = extract64(dn, 0, 32);
+            uint32_t shi = extract64(dn, 32, 32);
+
+            if (i >= 16) {
+                faddr += 8; /* skip the slot for the FPSCR */
+            }
+            cpu_stl_data(env, faddr, slo);
+            cpu_stl_data(env, faddr + 4, shi);
+        }
+        cpu_stl_data(env, fptr + 0x40, vfp_get_fpscr(env));
+
+        /*
+         * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
+         * leave them unchanged, matching our choice in v7m_preserve_fp_state.
+         */
+        if (ts) {
+            for (i = 0; i < 32; i += 2) {
+                *aa32_vfp_dreg(env, i / 2) = 0;
+            }
+            vfp_set_fpscr(env, 0);
+        }
+    } else {
+        v7m_update_fpccr(env, fptr, false);
+    }
+
+    env->v7m.control[M_REG_S] &= ~R_V7M_CONTROL_FPCA_MASK;
+}
+
 static bool v7m_push_stack(ARMCPU *cpu)
 {
     /* Do the "set up stack frame" part of exception entry,
@@ -9165,6 +9239,8 @@ static void arm_log_exception(int idx)
             [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
             [EXCP_STKOF] = "v8M STKOF UsageFault",
             [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
+            [EXCP_LSERR] = "v8M LSERR UsageFault",
+            [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
         };
 
         if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
@@ -9339,6 +9415,14 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_STKOF_MASK;
         break;
+    case EXCP_LSERR:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        env->v7m.sfsr |= R_V7M_SFSR_LSERR_MASK;
+        break;
+    case EXCP_UNALIGNED:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNALIGNED_MASK;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.secure);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 04988efca7c..db478b779a9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11817,7 +11817,20 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 if (!s->v8m_secure || (insn & 0x0040f0ff)) {
                     goto illegal_op;
                 }
-                /* Just NOP since FP support is not implemented */
+
+                if (arm_dc_feature(s, ARM_FEATURE_VFP)) {
+                    TCGv_i32 fptr = load_reg(s, rn);
+
+                    if (extract32(insn, 20, 1)) {
+                        /* VLLDM */
+                    } else {
+                        gen_helper_v7m_vlstm(cpu_env, fptr);
+                    }
+                    tcg_temp_free_i32(fptr);
+
+                    /* End the TB, because we have updated FP control bits */
+                    s->base.is_jmp = DISAS_UPDATE;
+                }
                 break;
             }
             if (arm_dc_feature(s, ARM_FEATURE_VFP) &&
-- 
2.20.1

