Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3907332wrx;
        Tue, 16 Apr 2019 06:09:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdNOgWBIGVIrI8peUTnbKSHrru+qyKCCnKDEPNxhu6rm4U0ECxAzDT3G+71PFZ9TW++039
X-Received: by 2002:a1c:4cf:: with SMTP id 198mr26459001wme.125.1555420172105;
        Tue, 16 Apr 2019 06:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420172; cv=none;
        d=google.com; s=arc-20160816;
        b=Asm86RHCjWn9rJ5VU3sX9wp+3SFJ/lYt2S62TpfpueQb7PqKVUiEWSzq/BmW6uAL+X
         3n0iyX1zybK5kZdcmkKgd2Divml7/d5sGUmLO5NUYRQE9HDFUCS1B+zZagBv/b9uMrpy
         XxW6KSwHrSMjLWeeen1R6uYgoo7PcGJgckXYSpNA76RByvsJgbeTuiZGfKo1hEKVGQAI
         IAJXxmbSYsI9Uj3d8V0IKrwybyfen2M27hiik1R9x5Ck4/hTT79D7dN47QHKHTQ366fp
         a8l6A+hQCdwNg4boD5/NEvZPGKuaSmPdXoY3KDVIvlIlZOdSlHkzdrGuXG1Efdfy/pWW
         XbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kfoRBt6+//K1FzvR7+mnI5hRYcOyIhwq+7x6ajOGyyg=;
        b=khdjNZfSh8+4BgxnzJzug9Lzok1qd3bK+eI2HV48c04vZ/+kPQU3gyyPmGFjsjdNHo
         ao3rNWcwl3fHrpW472EMeUPV5q1p7ak7+x3+AWErEVBAEI7yO9muLWaikUP6NyjbSAV0
         M5oVjF/+cFEWLC/sAmqtuhj6bBNJOBrik/pyEpiWLgKGZfJUehUAXqpLb5eoZWY3U61O
         4XbssdQL67GSn9pOi40p/fdrUXw+ImMAI6UZD8+4OLzvGtE2SOWjca5WS0k2gHiDbT5h
         Ymtr+tnmeonzZiha22wn+jiXcwQshzMxp4mAQHI807PVNXpp6ktCoPlgVPYR6OXdyaCc
         I2Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbZ1IQHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si13205114wme.56.2019.04.16.06.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbZ1IQHC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNq7-0005hb-2A
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:09:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfY-00055t-K5
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfW-0001VI-Nj
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:36 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfU-0001QZ-Jf
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:34 -0400
Received: by mail-wm1-x341.google.com with SMTP id w15so25306695wmc.3
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kfoRBt6+//K1FzvR7+mnI5hRYcOyIhwq+7x6ajOGyyg=;
	b=wbZ1IQHCG3XSS2zbIsdSHH7pT58E0st7gTwaOmW8lKu7/XCnZozsZe89jX7OjG8IjN
	PJCb+IRdvej/B7moHwoeuF78vZw6MOyY7ceiDa311SGt6hLoVydLgkkAD0/rtm162dWh
	+wpHF1PXfMFmbN+c7pvpqgFavA54AvhEu+lHZzsHwq5yzWTHIVHA1ai/TSWoVjoNtsfC
	t7npjurSsnvMbXzx6utWEgdBfTBGtFnqnmJOT5ZfEAlR473sEVmt5rmdEuKvuNPNBOpa
	WxHCgBCDU54+tXFx28pZX1HqLeGeebfTsO8olNfJrYaKi1fhdlfXF2jh45e5Zx0vTir4
	53kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kfoRBt6+//K1FzvR7+mnI5hRYcOyIhwq+7x6ajOGyyg=;
	b=TdgCS1j5vfFL5KJt4YS1s0Q5fmwxbP16j6i3Iv+XLy3jtFvY8OlrrOXfkaSgalPRRX
	YzJepvVXjCGnSeUvkcE6Du/2OxB1o2uHueEOXq8PN1HDuhI0THgNOAKz96dQHdwBFcD8
	/n1J4s2PNA7d4QssDdtqMGhkK4PSyRiTO9Wwd1iqhrI9rMhs2Oj8b9RSHVV1xyjAGTUO
	NjnThOB/2rvFTeuTQxPycgRlpF4JEn8ugJITXUgEAmjxn82y1LNvXh6/9GHYuhn4JPBN
	OQ+Ao+xB5AgW5oVc7i1ie6w19jx2MDUPaPcLOboPewMc6sHCVFVOtIp6hQcMcg0A1z+G
	7k8A==
X-Gm-Message-State: APjAAAUK6qnE6YgYusb7ws3GaOULaTYyT8rBZzq/9XnlgqfEy7r0C8bz
	h3jblTkbWNkF8E7GWjoxTZ9ZgZxwJ7I=
X-Received: by 2002:a1c:f204:: with SMTP id s4mr26600673wmc.51.1555419506406; 
	Tue, 16 Apr 2019 05:58:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:37 +0100
Message-Id: <20190416125744.27770-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-arm] [PATCH 19/26] target/arm: Activate M-profile floating
 point context when FPCCR.ASPEN is set
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
X-TUID: KLrh0zZvgSA8

The M-profile FPCCR.ASPEN bit indicates that automatic floating-point
context preservation is enabled. Before executing any floating-point
instruction, if FPCCR.ASPEN is set and the CONTROL FPCA/SFPA bits
indicate that there is no active floating point context then we
must create a new context (by initializing FPSCR and setting
FPCA/SFPA to indicate that the context is now active). In the
pseudocode this is handled by ExecuteFPCheck().

Implement this with a new TB flag which tracks whether we
need to create a new FP context.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  2 ++
 target/arm/translate.h |  1 +
 target/arm/helper.c    | 13 +++++++++++++
 target/arm/translate.c | 29 +++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 95924303dd5..500e0ab4c5d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3154,6 +3154,8 @@ FIELD(TBFLAG_A32, NS, 6, 1)
 FIELD(TBFLAG_A32, VFPEN, 7, 1)
 FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
 FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
+/* For M profile only, set if we must create a new FP context */
+FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1)
 /* For M profile only, set if FPCCR.S does not match current security state */
 FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1)
 /* For M profile only, Handler (ie not Thread) mode */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 26b2c29bb57..59b9dbd0136 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -41,6 +41,7 @@ typedef struct DisasContext {
     bool v8m_secure; /* true if v8M and we're in Secure mode */
     bool v8m_stackcheck; /* true if we need to perform v8M stack limit checks */
     bool v8m_fpccr_s_wrong; /* true if v8M FPCCR.S != v8m_secure */
+    bool v7m_new_fp_ctxt_needed; /* ASPEN set but no active FP context */
     /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
      * so that top level loop can generate correct syndrome information.
      */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 539da192e4e..2feb3f664fe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13427,6 +13427,19 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
     }
 
+    if (arm_feature(env, ARM_FEATURE_M) &&
+        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
+        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
+         (env->v7m.secure &&
+          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
+        /*
+         * ASPEN is set, but FPCA/SFPA indicate that there is no active
+         * FP context; we must create a new FP context before executing
+         * any FP insn.
+         */
+        flags = FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
+    }
+
     *pflags = flags;
     *cs_base = 0;
 }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a4fb811d6f2..6829f975e65 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3437,6 +3437,33 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
             /* Don't need to do this for any further FP insns in this TB */
             s->v8m_fpccr_s_wrong = false;
         }
+
+        if (s->v7m_new_fp_ctxt_needed) {
+            /*
+             * Create new FP context by updating CONTROL.FPCA, CONTROL.SFPA
+             * and the FPSCR.
+             */
+            TCGv_i32 control, fpscr;
+            uint32_t bits = R_V7M_CONTROL_FPCA_MASK;
+
+            fpscr = load_cpu_field(v7m.fpdscr[s->v8m_secure]);
+            gen_helper_vfp_set_fpscr(cpu_env, fpscr);
+            tcg_temp_free_i32(fpscr);
+            /*
+             * We don't need to arrange to end the TB, because the only
+             * parts of FPSCR which we cache in the TB flags are the VECLEN
+             * and VECSTRIDE, and those don't exist for M-profile.
+             */
+
+            if (s->v8m_secure) {
+                bits |= R_V7M_CONTROL_SFPA_MASK;
+            }
+            control = load_cpu_field(v7m.control[M_REG_S]);
+            tcg_gen_ori_i32(control, control, bits);
+            store_cpu_field(control, v7m.control[M_REG_S]);
+            /* Don't need to do this for any further FP insns in this TB */
+            s->v7m_new_fp_ctxt_needed = false;
+        }
     }
 
     if (extract32(insn, 28, 4) == 0xf) {
@@ -13360,6 +13387,8 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         regime_is_secure(env, dc->mmu_idx);
     dc->v8m_stackcheck = FIELD_EX32(tb_flags, TBFLAG_A32, STACKCHECK);
     dc->v8m_fpccr_s_wrong = FIELD_EX32(tb_flags, TBFLAG_A32, FPCCR_S_WRONG);
+    dc->v7m_new_fp_ctxt_needed =
+        FIELD_EX32(tb_flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED);
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.20.1

