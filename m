Received: by 10.223.172.38 with SMTP id v35csp3224052wrc;
        Fri, 22 Sep 2017 08:14:28 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBAx+0CG0k5eeE3Y1ajo97Fiihu324ezZ5NuipUrQyZclBBPSwYcTikrSXpdWxlZuGDGydg
X-Received: by 10.200.51.237 with SMTP id d42mr9147572qtb.25.1506093268344;
        Fri, 22 Sep 2017 08:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506093268; cv=none;
        d=google.com; s=arc-20160816;
        b=yRRoycyNLFH1PvWO2k2EAsAv+nyXunYwWr7N6DL70drnqoz0dVUDbHQNAd0ii8P4sg
         L9l5KC/HEEiknGzs0+UpRhctAWr4ltMs6Bz2y1eOKoFHHNC5mRoTqtzD70ESob9j5OyE
         D38SnF2qKE1fcSP6KuMrCBEc2LOsVM2Q0RvJR8PRnnD41ifJAHZdtAm0Gmyrc5Ou77us
         vYUYG59FH4Opy1O4+WFvIM2ZuURlo9DtqzZhC/HvhmvHncP84486jews5uE4OEFOmfy6
         oGA7Q1LA3wtP78oR9KaGRmhJv/zXGC76+g4dkKsuaycyrMGt0eymkOeF38BJoQyyC9V4
         ZE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=JTSY1yCbKXv0l7tT7enzEnUly7oxJmImYn3jwCpbj98=;
        b=Q6RtWU73PuPfT0uJ7YpbySZtfJXhhVmV91M4EB/RrciNANQF359mPl0NzSFj+bH4w7
         1GHRivqn/yPtpZHIqBqSPQLoCXvm+QZr6h+IserPX6bqtvVb+5WuG0PcUDtX70maeYEW
         2JToh6Xm05hNW6pPlINzlJPNIRjRQXeJ7NbCRBmhr3lz1Pnc9/ze/uXVQOmT3ZIGNIHg
         7paKBrAzwROTgmcprvWmIILeEbVwiaJ+Kwc4P10RcD7Snz2/OnGgtviXTDBl477zKAUG
         WdHqylRo84rILRzKc5jWuAG3sYjl8xf+0/g2h8Roov5VpqRaCl8HjKDwgpxzXRol6wRp
         FS5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m101si36380qkh.312.2017.09.22.08.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPer-0004AR-Vj
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:14:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQh-00087E-Q1
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQg-0004JN-N4
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37588)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQg-0004EW-Ek; Fri, 22 Sep 2017 10:59:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQc-0007G2-7Y; Fri, 22 Sep 2017 15:59:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:05 +0100
Message-Id: <1506092407-26985-19-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 18/20] target/arm: Implement BLXNS
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
X-TUID: AMYyh3opydv6

Implement the BLXNS instruction, which allows secure code to
call non-secure code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate.c | 17 +++++++++++++--
 4 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 64afbac..2cf6f74 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -64,6 +64,7 @@ DEF_HELPER_3(v7m_msr, void, env, i32, i32)
 DEF_HELPER_2(v7m_mrs, i32, env, i32)
 
 DEF_HELPER_2(v7m_bxns, void, env, i32)
+DEF_HELPER_2(v7m_blxns, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index fd9a7e8..1746737 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -60,6 +60,7 @@ static inline bool excp_is_internal(int excp)
 FIELD(V7M_CONTROL, NPRIV, 0, 1)
 FIELD(V7M_CONTROL, SPSEL, 1, 1)
 FIELD(V7M_CONTROL, FPCA, 2, 1)
+FIELD(V7M_CONTROL, SFPA, 3, 1)
 
 /* Bit definitions for v7M exception return payload */
 FIELD(V7M_EXCRET, ES, 0, 1)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8df819d..30dc2a9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5890,6 +5890,12 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     g_assert_not_reached();
 }
 
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    /* translate.c should never generate calls here in user-only mode */
+    g_assert_not_reached();
+}
+
 void switch_mode(CPUARMState *env, int mode)
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
@@ -6182,6 +6188,59 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     env->regs[15] = dest & ~1;
 }
 
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    /* Handle v7M BLXNS:
+     *  - bit 0 of the destination address is the target security state
+     */
+
+    /* At this point regs[15] is the address just after the BLXNS */
+    uint32_t nextinst = env->regs[15] | 1;
+    uint32_t sp = env->regs[13] - 8;
+    uint32_t saved_psr;
+
+    /* translate.c will have made BLXNS UNDEF unless we're secure */
+    assert(env->v7m.secure);
+
+    if (dest & 1) {
+        /* target is Secure, so this is just a normal BLX,
+         * except that the low bit doesn't indicate Thumb/not.
+         */
+        env->regs[14] = nextinst;
+        env->thumb = 1;
+        env->regs[15] = dest & ~1;
+        return;
+    }
+
+    /* Target is non-secure: first push a stack frame */
+    if (!QEMU_IS_ALIGNED(sp, 8)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "BLXNS with misaligned SP is UNPREDICTABLE\n");
+    }
+
+    saved_psr = env->v7m.exception;
+    if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK) {
+        saved_psr |= XPSR_SFPA;
+    }
+
+    /* Note that these stores can throw exceptions on MPU faults */
+    cpu_stl_data(env, sp, nextinst);
+    cpu_stl_data(env, sp + 4, saved_psr);
+
+    env->regs[13] = sp;
+    env->regs[14] = 0xfeffffff;
+    if (arm_v7m_is_handler_mode(env)) {
+        /* Write a dummy value to IPSR, to avoid leaking the current secure
+         * exception number to non-secure code. This is guaranteed not
+         * to cause write_v7m_exception() to actually change stacks.
+         */
+        write_v7m_exception(env, 1);
+    }
+    switch_v7m_security_state(env, dest & 1);
+    env->thumb = 1;
+    env->regs[15] = dest & ~1;
+}
+
 static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
                                 bool spsel)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ab1a12a..53694bb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1013,6 +1013,20 @@ static inline void gen_bxns(DisasContext *s, int rm)
     s->base.is_jmp = DISAS_EXIT;
 }
 
+static inline void gen_blxns(DisasContext *s, int rm)
+{
+    TCGv_i32 var = load_reg(s, rm);
+
+    /* We don't need to sync condexec state, for the same reason as blxns.
+     * We do however need to set the PC, because the blxns helper reads it.
+     * The blxns helper may throw an exception.
+     */
+    gen_set_pc_im(s, s->pc);
+    gen_helper_v7m_blxns(cpu_env, var);
+    tcg_temp_free_i32(var);
+    s->base.is_jmp = DISAS_EXIT;
+}
+
 /* Variant of store_reg which uses branch&exchange logic when storing
    to r15 in ARM architecture v7 and above. The source must be a temporary
    and will be marked as dead. */
@@ -11221,8 +11235,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
                         goto undef;
                     }
                     if (link) {
-                        /* BLXNS: not yet implemented */
-                        goto undef;
+                        gen_blxns(s, rm);
                     } else {
                         gen_bxns(s, rm);
                     }
-- 
2.7.4

