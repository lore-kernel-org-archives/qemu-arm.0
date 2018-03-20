Received: by 10.28.91.67 with SMTP id p64csp3849019wmb;
        Tue, 20 Mar 2018 06:41:46 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs8eLPb5ITaXfiR5/VBhuChjwlEfupFva2SKm3L/nwasu/M9NJnRgyBDzDSHTRb+CSzZ7wv
X-Received: by 2002:a25:d752:: with SMTP id o79-v6mr9049361ybg.154.1521553306669;
        Tue, 20 Mar 2018 06:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553306; cv=none;
        d=google.com; s=arc-20160816;
        b=sF9UDGUOb5QmHfEmzDGdcGMJpd8bSzTtxCXVWPj0SqUISjm8ty4inHgSXEVPi8PeHV
         kib8c5cq+F2ES0iC+TulSqi+RoqlPvoimvClY1xiX00Y8jGA+BEyPkvvFDlQj0Umev1+
         F+ItFmctv9TQlWFsrMnsuoDb7d1S40jh8vVxF3zBpKYpqUcH2+TnRldAKybQBQcQ0Bvv
         OT5HHR4rwdlSShAJZCEQzQDXipeRWGCoiAjSrJm34jgqwZF8Jc2inzoSpodv9QkrycE4
         qlfmhX1YCGrUCOPdYp735tE95gPx18ONSMeXah3pasV91RoQE0Ov+cWthamjCUgxApqK
         HJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=o4nRWIPb9ruu30W/QmaR7hUnBzHJofdsGMUv+bXSGeo=;
        b=w2FoGHsUPothfrrXHHGnz1lUD9CwtmPI6WsZUBMU5R5sj6Fjn9hO5iB4XXpAqKhHCo
         K6FUAcWMvON1d+gZ+tV6yY0wOf+KjCc0pvcNvr2NT3Gj3Kd1cuqXmDRJQ2yZRKlFOJUM
         KJ9d4yHg+ZisZTKaCnNqIgJCAbHOUN173hlITbtkjsp9vftoUm7B51k0/IEDkrCpqGwL
         nDl3fH2K6zrCDNBGFsFjT20wZSIFCy7tviiVppUJGKlhWs4gTc3+CP4qc6mIw9WqMdiI
         2kS6xQcs1owgelFTHlCfmM+fAv/eLYuPVo9sobm29hPUT1pzIfomTSBmeq4tYRz3cdq8
         Z7TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z37si2029294qtj.105.2018.03.20.06.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHWM-000393-4Z
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:41:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW5-00036o-5P
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW4-00043H-5G
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eyHW3-0003s8-TZ; Tue, 20 Mar 2018 09:41:28 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eyHVs-00044O-QV; Tue, 20 Mar 2018 13:41:16 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Mar 2018 13:41:11 +0000
Message-Id: <20180320134114.30418-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320134114.30418-1-peter.maydell@linaro.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12 1/4] target/arm: Honour MDCR_EL2.TDE
 when routing exceptions due to BKPT/BRK
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 006iEOWdjvRe

The MDCR_EL2.TDE bit allows the exception level targeted by debug
exceptions to be set to EL2 for code executing at EL0.  We handle
this in the arm_debug_target_el() function, but this is only used for
hardware breakpoint and watchpoint exceptions, not for the exception
generated when the guest executes an AArch32 BKPT or AArch64 BRK
instruction.  We don't have enough information for a translate-time
equivalent of arm_debug_target_el(), so instead make BKPT and BRK
call a special purpose helper which can do the routing, rather than
the generic exception_with_syndrome helper.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/op_helper.c     |  8 ++++++++
 target/arm/translate-a64.c | 15 +++++++++++++--
 target/arm/translate.c     | 19 ++++++++++++++-----
 4 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0d2094f2be..34e8cc8904 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -47,6 +47,7 @@ DEF_HELPER_FLAGS_3(sel_flags, TCG_CALL_NO_RWG_SE,
                    i32, i32, i32, i32)
 DEF_HELPER_2(exception_internal, void, env, i32)
 DEF_HELPER_4(exception_with_syndrome, void, env, i32, i32, i32)
+DEF_HELPER_2(exception_bkpt_insn, void, env, i32)
 DEF_HELPER_1(setend, void, env)
 DEF_HELPER_2(wfi, void, env, i32)
 DEF_HELPER_1(wfe, void, env)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7a88fd2c92..4b123d2bd6 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -483,6 +483,14 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
     raise_exception(env, excp, syndrome, target_el);
 }
 
+/* Raise an EXCP_BKPT with the specified syndrome register value,
+ * targeting the correct exception level for debug exceptions.
+ */
+void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
+{
+    raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
+}
+
 uint32_t HELPER(cpsr_read)(CPUARMState *env)
 {
     return cpsr_read(env) & ~(CPSR_EXEC | CPSR_RESERVED);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 31ff0479e6..510951f7c7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -321,6 +321,18 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception_bkpt_insn(DisasContext *s, int offset,
+                                    uint32_t syndrome)
+{
+    TCGv_i32 tcg_syn;
+
+    gen_a64_set_pc_im(s->pc - offset);
+    tcg_syn = tcg_const_i32(syndrome);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
+    tcg_temp_free_i32(tcg_syn);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 static void gen_ss_advance(DisasContext *s)
 {
     /* If the singlestep state is Active-not-pending, advance to
@@ -1839,8 +1851,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             break;
         }
         /* BRK */
-        gen_exception_insn(s, 4, EXCP_BKPT, syn_aa64_bkpt(imm16),
-                           default_exception_el(s));
+        gen_exception_bkpt_insn(s, 4, syn_aa64_bkpt(imm16));
         break;
     case 2:
         if (op2_ll != 0) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ba6ab7d287..68f0c585f4 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1248,6 +1248,18 @@ static void gen_exception_insn(DisasContext *s, int offset, int excp,
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception_bkpt_insn(DisasContext *s, int offset, int syn)
+{
+    TCGv_i32 tcg_syn;
+
+    gen_set_condexec(s);
+    gen_set_pc_im(s, s->pc - offset);
+    tcg_syn = tcg_const_i32(syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
+    tcg_temp_free_i32(tcg_syn);
+    s->base.is_jmp = DISAS_NORETURN;
+}
+
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
@@ -8774,9 +8786,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             case 1:
                 /* bkpt */
                 ARCH(5);
-                gen_exception_insn(s, 4, EXCP_BKPT,
-                                   syn_aa32_bkpt(imm16, false),
-                                   default_exception_el(s));
+                gen_exception_bkpt_insn(s, 4, syn_aa32_bkpt(imm16, false));
                 break;
             case 2:
                 /* Hypervisor call (v7) */
@@ -11983,8 +11993,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         {
             int imm8 = extract32(insn, 0, 8);
             ARCH(5);
-            gen_exception_insn(s, 2, EXCP_BKPT, syn_aa32_bkpt(imm8, true),
-                               default_exception_el(s));
+            gen_exception_bkpt_insn(s, 2, syn_aa32_bkpt(imm8, true));
             break;
         }
 
-- 
2.16.2

