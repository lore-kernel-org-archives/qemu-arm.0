Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3898508wrx;
        Tue, 16 Apr 2019 06:02:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWTbePSO/zKprFP/ayG4kMoFhz+Bl4KI1IWibad6V/MOEViIDjqCiBWEhtmvRn/W+Djlln
X-Received: by 2002:adf:f14e:: with SMTP id y14mr52337621wro.276.1555419770475;
        Tue, 16 Apr 2019 06:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419770; cv=none;
        d=google.com; s=arc-20160816;
        b=UoB+XUOF52FWmjhuUQZX0qwR/Vljd+iJ9m6iUA/v2n9EFgTKtQOEdeeQGkK4w5cFtd
         siCAWPiDYP1WcLScy5O+Eeivi/+c6X5LiIJe7bSrUTO1+uxgVRyynyOUKy3INEdrchuK
         IRQ1NfpayZENUrhFYe/Je0P0bkNh6amTN2VFO7qh1DAhnVslVkxGlul7SPH97SHjAK+u
         SM8z9jTHcaXJ6W2aCcxqpPQpM9OHqWXvZR/il+VNlsMu49qUU9YeiDhGpVhL/Tlw08Um
         Bb7JoSyHOuu1MLJUANmuuqOF29GIGyG8+NXbBvYQNxqQ5iXxoP2q/WoA9vVaubtAIdGu
         qCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=aQ6wGPLx3WRt+frxzRIZZzBI6Q8JRULb0Aj0I2glCjQ=;
        b=y3cwzGZ5LNSUwqZ693iPSO1IIWB7mZkB7Xn0uYqg/BIvWStZHfKhBhdu+a24t3B3Nt
         iciv8utep+iINsovAlOLI+iH35ZEG82sZSKpt1pKxER36mffnAGDxL7V+29WF1ZKCsnt
         CThcb2KR7h1vt6H2cSTO6y4uowvkJiG9bXyqssczXrjfjrVLwHEsA/Sac8cPw/P88udE
         gqWWn7c/Xpo9DYpEz/u4QI2Dbi3YBuIW6HrdK6O0aW1MiAyTT1dumgYnd6UBWHvyLEo/
         enilMhftZ6ro6bWHl+AaG8iM9G7aRm/zQiI3BAg/kr8RXzyYGXi/Prq21VRwNmA7NbCm
         J0qg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFSebnJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si13541991wml.81.2019.04.16.06.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SFSebnJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNjd-0008VO-9H
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:02:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf8-0004d2-S5
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf7-0001Cg-AU
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:10 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:39474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNf6-000140-Sl
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:09 -0400
Received: by mail-wr1-x444.google.com with SMTP id j9so26919142wrn.6
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aQ6wGPLx3WRt+frxzRIZZzBI6Q8JRULb0Aj0I2glCjQ=;
	b=SFSebnJUN/iho+FW5EGiA9RNR+U2xEAyxH+PqywlPZ6RuQZA+uj8OamWP0T0+JSy/x
	1K8xn131gaWUzhse5YsoPxHFyoz94XWqQCIkLOdryUMd/LnJ0Qx+Gg5J1zmlp0pp/dlB
	48+qqlDaotJGJbGYllYWY+BrLsBSGIAme/wRSF37wQXVPmA9seipxy95ZCjmoXKY+JOH
	5G/FHS+wqj/hbgdseEXE0+MnakC8Hw7PQyWYrIhd0oDGOjiGblljgHKbfNy2k4hvP/FX
	1nmCQ3D95FhGwjE7+jAfLzIQNeD9airzZHOvEiBaQCZjck6eJtwa5EOvax4FFreuOVcT
	nQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aQ6wGPLx3WRt+frxzRIZZzBI6Q8JRULb0Aj0I2glCjQ=;
	b=bpnvc/nvmEpQy5Iil1lL8JPOf7UF7Ox/MZDoXmUXxQRl0raZTcIR5DUhekGELrRSME
	9DPRIBGTrRtS0smt6/BAhnNKfjMyHYrVW7+CcdtuU2w09T8xSHjS5xbH8uo0tqUEfVry
	m91QUSgNuUyePSbq6UjPNgB4ssDwMRBVqXzuPxaMIFgcAewNCfjrU20jE9ibbKCL6WT8
	dMv5R28QxFbVq78jbMqrISo9sgfCnL8RjeJWOfNiYM2RET0t+P9DadmBOR7j0SkLcVtO
	Su9dwosZKRRcfCinZ3hKe+u/3V8Q/iO/HMegu9fqiiOmV2DnwFdvWofW5pKN8uq8sQDg
	RdaQ==
X-Gm-Message-State: APjAAAUs2sHyF2P0KEFwqPNndUoKxPaE7O1yj0+jq32HnuBGFGFUUmra
	+0+axQzMl4ujFIC7dxax79WMbky74LA=
X-Received: by 2002:adf:efc1:: with SMTP id i1mr51644628wrp.199.1555419476820; 
	Tue, 16 Apr 2019 05:57:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:23 +0100
Message-Id: <20190416125744.27770-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-arm] [PATCH 05/26] target/arm: Honour M-profile FP enable bits
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
X-TUID: SQ0KdzaQ+5Tc

Like AArch64, M-profile floating point has no FPEXC enable
bit to gate floating point; so always set the VFPEN TB flag.

M-profile also has CPACR and NSACR similar to A-profile;
they behave slightly differently:
 * the CPACR is banked between Secure and Non-Secure
 * if the NSACR forces a trap then this is taken to
   the Secure state, not the Non-Secure state

Honour the CPACR and NSACR settings. The NSACR handling
requires us to borrow the exception.target_el field
(usually meaningless for M profile) to distinguish the
NOCP UsageFault taken to Secure state from the more
usual fault taken to the current security state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c    | 55 +++++++++++++++++++++++++++++++++++++++---
 target/arm/translate.c | 10 ++++++--
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a36f4b3d699..27e5f98bc73 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7561,6 +7561,25 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
+/*
+ * Return true if the v7M CPACR permits access to the FPU for the specified
+ * security state and privilege level.
+ */
+static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_priv)
+{
+    switch (extract32(env->v7m.cpacr[is_secure], 20, 2)) {
+    case 0:
+    case 2: /* UNPREDICTABLE: we treat like 0 */
+        return false;
+    case 1:
+        return is_priv;
+    case 3:
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
                             ARMMMUIdx mmu_idx, bool ignfault)
 {
@@ -8820,9 +8839,23 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_UNDEFINSTR_MASK;
         break;
     case EXCP_NOCP:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
-        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_NOCP_MASK;
+    {
+        /*
+         * NOCP might be directed to something other than the current
+         * security state if this fault is because of NSACR; we indicate
+         * the target security state using exception.target_el.
+         */
+        int target_secstate;
+
+        if (env->exception.target_el == 3) {
+            target_secstate = M_REG_S;
+        } else {
+            target_secstate = env->v7m.secure;
+        }
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, target_secstate);
+        env->v7m.cfsr[target_secstate] |= R_V7M_CFSR_NOCP_MASK;
         break;
+    }
     case EXCP_INVSTATE:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVSTATE_MASK;
@@ -12756,6 +12789,22 @@ int fp_exception_el(CPUARMState *env, int cur_el)
         return 0;
     }
 
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        /* CPACR can cause a NOCP UsageFault taken to current security state */
+        if (!v7m_cpacr_pass(env, env->v7m.secure, cur_el != 0)) {
+            return 1;
+        }
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY) && !env->v7m.secure) {
+            if (!extract32(env->v7m.nsacr, 10, 1)) {
+                /* FP insns cause a NOCP UsageFault taken to Secure */
+                return 3;
+            }
+        }
+
+        return 0;
+    }
+
     /* The CPACR controls traps to EL1, or PL1 if we're 32 bit:
      * 0, 2 : trap EL0 and EL1/PL1 accesses
      * 1    : trap only EL0 accesses
@@ -12943,7 +12992,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
         flags = FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
         if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
-            || arm_el_is_aa64(env, 1)) {
+            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)) {
             flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
         }
         flags = FIELD_DP32(flags, TBFLAG_A32, XSCALE_CPAR, env->cp15.c15_cpar);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index d56488ec847..bb539111179 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3398,8 +3398,14 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
      * for attempts to execute invalid vfp/neon encodings with FP disabled.
      */
     if (s->fp_excp_el) {
-        gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+                               s->fp_excp_el);
+        } else {
+            gen_exception_insn(s, 4, EXCP_UDEF,
+                               syn_fp_access_trap(1, 0xe, false),
+                               s->fp_excp_el);
+        }
         return 0;
     }
 
-- 
2.20.1

