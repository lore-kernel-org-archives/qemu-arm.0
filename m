Received: by 10.223.188.70 with SMTP id a6csp5086911wrh;
        Tue, 22 Aug 2017 08:29:57 -0700 (PDT)
X-Received: by 10.200.8.71 with SMTP id x7mr1478653qth.20.1503415797204;
        Tue, 22 Aug 2017 08:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415797; cv=none;
        d=google.com; s=arc-20160816;
        b=sE797+GKHB+kV4sjyyTDyxJW34RFU00XT0+UKUxDLPDH82+7DOMObOFXHP9vRl3Ac6
         SjsI0vkBFy5pmZOvbl7mEQ28YA3jd0mJPMK2lg9ZVok1su1faKr29B2ev7BLkIiMp8Sv
         1lgyzGwuLDMazjyzLziUzUlpvKTnOe7RBu5Jbq0LR6jvLiuFDAAhuTjZlchmU3fQSerY
         avu6nGQaOjkOgGiJvSILPRJmk/rE7aAnw74Ye9H+pbVsMYUSOC7LboXsCnIs3xujrm+5
         CBIVNms2Kb2Qawrdios6rcNdWMvHzhYf+jIcGcuy6KLTEWjO8AmxsAy/P5FeYO/qRb82
         ZVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fVOfcJdPdldiaFhC1Ifq+k8dD++CxupDyz2GFBgDA0M=;
        b=uDLGmohivd8yuc/MwsmwhhYKt6zoQW32iPbq31Q89w/GGopUqUgPVXBWvat8J3ORwI
         1xzkjkR9OvD1i7m3WCZ/mCwsGPzjZvvqBHP0vHmTMMSHBjBLftsvYvzHvBzdnCcYT5Cl
         RYfI6DJKWnzY5OQz6GVI5eE4kWVev8tXwMCj4/x26OQQvR642vOKgdZi8aTKy08eITAI
         WwBjkv5FRsfMd+20mx/jJtM/OQgOdJIXmaLABzBsoGP81zHMOf74qwY+4HY5us4qLeQW
         xuyiHxo31Ad3o0HzB/vbidLVYuyZkd/v2fQgXR/uUyEZmofmIk8TZbCdacCoLvQmadAt
         uRsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b188si14187638qke.61.2017.08.22.08.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:29:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB7o-000713-5Q
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:29:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAo2-0006mo-VC
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAo1-0003Pc-B9
	for qemu-devel@nongnu.org; Tue, 22 Aug 2017 11:09:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnq-0003E6-SR; Tue, 22 Aug 2017 11:09:15 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAno-0004mp-Ir; Tue, 22 Aug 2017 16:09:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:59 +0100
Message-Id: <1503414539-28762-21-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 20/20] target/arm: Implement BXNS,
 and banked stack pointers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DyoZyFRWOKg9

Implement the BXNS v8M instruction, which is like BX but will do a
jump-and-switch-to-NonSecure if the branch target address has bit 0
clear.

This is the first piece of code which implements "switch to the
other security state", so the commit also includes the code to
switch the stack pointers around, which is the only complicated
part of switching security state.

BLXNS is more complicated than just "BXNS but set the link register",
so we leave it for a separate commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 13 +++++++++
 target/arm/helper.h    |  2 ++
 target/arm/translate.h |  1 +
 target/arm/helper.c    | 79 ++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/machine.c   |  2 ++
 target/arm/translate.c | 42 ++++++++++++++++++++++++++-
 6 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3683537..5e7b68b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -419,7 +419,20 @@ typedef struct CPUARMState {
     } cp15;
 
     struct {
+        /* M profile has up to 4 stack pointers:
+         * a Main Stack Pointer and a Process Stack Pointer for each
+         * of the Secure and Non-Secure states. (If the CPU doesn't support
+         * the security extension then it has only two SPs.)
+         * In QEMU we always store the currently active SP in regs[13],
+         * and the non-active SP for the current security state in
+         * v7m.other_sp. The stack pointers for the inactive security state
+         * are stored in other_ss_msp and other_ss_psp.
+         * switch_v7m_security_state() is responsible for rearranging them
+         * when we change security state.
+         */
         uint32_t other_sp;
+        uint32_t other_ss_msp;
+        uint32_t other_ss_psp;
         uint32_t vecbase[2];
         uint32_t basepri[2];
         uint32_t control[2];
diff --git a/target/arm/helper.h b/target/arm/helper.h
index df86bf7..64afbac 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -63,6 +63,8 @@ DEF_HELPER_1(cpsr_read, i32, env)
 DEF_HELPER_3(v7m_msr, void, env, i32, i32)
 DEF_HELPER_2(v7m_mrs, i32, env, i32)
 
+DEF_HELPER_2(v7m_bxns, void, env, i32)
+
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 2fe144b..ef625ad 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -32,6 +32,7 @@ typedef struct DisasContext {
     int vec_len;
     int vec_stride;
     bool v7m_handler_mode;
+    bool v8m_secure; /* true if v8M and we're in Secure mode */
     /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
      * so that top level loop can generate correct syndrome information.
      */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b1ae73c..4489bbd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5875,6 +5875,12 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
     return 0;
 }
 
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
 void switch_mode(CPUARMState *env, int mode)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -6049,6 +6055,18 @@ static uint32_t v7m_pop(CPUARMState *env)
     return val;
 }
 
+/* Return true if we're using the process stack pointer (not the MSP) */
+static bool v7m_using_psp(CPUARMState *env)
+{
+    /* Handler mode always uses the main stack; for thread mode
+     * the CONTROL.SPSEL bit determines the answer.
+     * Note that in v7M it is not possible to be in Handler mode with
+     * CONTROL.SPSEL non-zero, but in v8M it is, so we must check both.
+     */
+    return !arm_v7m_is_handler_mode(env) &&
+        env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
+}
+
 /* Switch to V7M main or process stack pointer.  */
 static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
 {
@@ -6067,6 +6085,67 @@ static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
     }
 }
 
+/* Switch M profile security state between NS and S */
+static void switch_v7m_security_state(CPUARMState *env, bool new_secstate)
+{
+    uint32_t new_ss_msp, new_ss_psp;
+
+    if (env->v7m.secure == new_secstate) {
+        return;
+    }
+
+    /* All the banked state is accessed by looking at env->v7m.secure
+     * except for the stack pointer; rearrange the SP appropriately.
+     */
+    new_ss_msp = env->v7m.other_ss_msp;
+    new_ss_psp = env->v7m.other_ss_psp;
+
+    if (v7m_using_psp(env)) {
+        env->v7m.other_ss_psp = env->regs[13];
+        env->v7m.other_ss_msp = env->v7m.other_sp;
+    } else {
+        env->v7m.other_ss_msp = env->regs[13];
+        env->v7m.other_ss_psp = env->v7m.other_sp;
+    }
+
+    env->v7m.secure = new_secstate;
+
+    if (v7m_using_psp(env)) {
+        env->regs[13] = new_ss_psp;
+        env->v7m.other_sp = new_ss_msp;
+    } else {
+        env->regs[13] = new_ss_msp;
+        env->v7m.other_sp = new_ss_psp;
+    }
+}
+
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    /* Handle v7M BXNS:
+     *  - if the return value is a magic value, do exception return (like BX)
+     *  - otherwise bit 0 of the return value is the target security state
+     */
+    if (dest >= 0xff000000) {
+        /* This is an exception return magic value; put it where
+         * do_v7m_exception_exit() expects and raise EXCEPTION_EXIT.
+         * Note that if we ever add gen_ss_advance() singlestep support to
+         * M profile this should count as an "instruction execution complete"
+         * event (compare gen_bx_excret_final_code()).
+         */
+        env->regs[15] = dest & ~1;
+        env->thumb = dest & 1;
+        HELPER(exception_internal)(env, EXCP_EXCEPTION_EXIT);
+        /* notreached */
+    }
+
+    /* translate.c should have made BXNS UNDEF unless we're secure */
+    assert(env->v7m.secure);
+
+    switch_v7m_security_state(env, dest & 1);
+    env->thumb = 1;
+    env->regs[15] = dest & ~1;
+}
+
 static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 3cc94b4..1aca40d 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -257,6 +257,8 @@ static const VMStateDescription vmstate_m_security = {
     .needed = m_security_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.secure, ARMCPU),
+        VMSTATE_UINT32(env.v7m.other_ss_msp, ARMCPU),
+        VMSTATE_UINT32(env.v7m.other_ss_psp, ARMCPU),
         VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.primask[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6aa2d7c..e7966e2 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -994,6 +994,25 @@ static inline void gen_bx_excret_final_code(DisasContext *s)
     gen_exception_internal(EXCP_EXCEPTION_EXIT);
 }
 
+static inline void gen_bxns(DisasContext *s, int rm)
+{
+    TCGv_i32 var = load_reg(s, rm);
+
+    /* The bxns helper may raise an EXCEPTION_EXIT exception, so in theory
+     * we need to sync state before calling it, but:
+     *  - we don't need to do gen_set_pc_im() because the bxns helper will
+     *    always set the PC itself
+     *  - we don't need to do gen_set_condexec() because BXNS is UNPREDICTABLE
+     *    unless it's outside an IT block or the last insn in an IT block,
+     *    so we know that condexec == 0 (already set at the top of the TB)
+     *    is correct in the non-UNPREDICTABLE cases, and we can choose
+     *    "zeroes the IT bits" as our UNPREDICTABLE behaviour otherwise.
+     */
+    gen_helper_v7m_bxns(cpu_env, var);
+    tcg_temp_free_i32(var);
+    s->is_jmp = DISAS_EXIT;
+}
+
 /* Variant of store_reg which uses branch&exchange logic when storing
    to r15 in ARM architecture v7 and above. The source must be a temporary
    and will be marked as dead. */
@@ -11185,12 +11204,31 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                  */
                 bool link = insn & (1 << 7);
 
-                if (insn & 7) {
+                if (insn & 3) {
                     goto undef;
                 }
                 if (link) {
                     ARCH(5);
                 }
+                if ((insn & 4)) {
+                    /* BXNS/BLXNS: only exists for v8M with the
+                     * security extensions, and always UNDEF if NonSecure.
+                     * We don't implement these in the user-only mode
+                     * either (in theory you can use them from Secure User
+                     * mode but they are too tied in to system emulation.)
+                     */
+                    if (!s->v8m_secure || IS_USER_ONLY) {
+                        goto undef;
+                    }
+                    if (link) {
+                        /* BLXNS: not yet implemented */
+                        goto undef;
+                    } else {
+                        gen_bxns(s, rm);
+                    }
+                    break;
+                }
+                /* BLX/BX */
                 tmp = load_reg(s, rm);
                 if (link) {
                     val = (uint32_t)s->pc | 1;
@@ -11878,6 +11916,8 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     dc->vec_stride = ARM_TBFLAG_VECSTRIDE(tb->flags);
     dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(tb->flags);
     dc->v7m_handler_mode = ARM_TBFLAG_HANDLER(tb->flags);
+    dc->v8m_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+        regime_is_secure(env, dc->mmu_idx);
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.7.4

