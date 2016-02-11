Received: by 10.25.159.19 with SMTP id i19csp402986lfe;
        Thu, 11 Feb 2016 11:24:17 -0800 (PST)
X-Received: by 10.55.78.84 with SMTP id c81mr58503559qkb.85.1455218657415;
        Thu, 11 Feb 2016 11:24:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18si11110732qkb.8.2016.02.11.11.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 11:24:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52934 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTwqe-0003Rx-Ru
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 14:24:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpT-0001Qb-IP
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aTwpS-0006XF-JP
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 14:23:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTwpP-0006W4-Tn; Thu, 11 Feb 2016 14:23:00 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aTweb-0007NW-OA; Thu, 11 Feb 2016 19:11:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 19:11:49 +0000
Message-Id: <1455217909-28317-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 4/4] target-arm: UNDEF in the UNPREDICTABLE
	SRS-from-System case
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hp0kKyGFpSog

Make get_r13_banked() raise an exception at runtime for the
corner case of SRS from System mode, so that we can UNDEF it;
this brings us in to line with the ARM ARM's set of permitted
CONSTRAINED UNPREDICTABLE choices.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/op_helper.c | 8 ++++++++
 target-arm/translate.c | 9 +++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 05f97a7..8183108 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -474,6 +474,14 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
 #if defined(CONFIG_USER_ONLY)
     g_assert_not_reached();
 #endif
+    if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_SYS) {
+        /* SRS instruction is UNPREDICTABLE from System mode; we UNDEF.
+         * Other UNPREDICTABLE and UNDEF cases were caught at translate time.
+         */
+        raise_exception(env, EXCP_UDEF, syn_uncategorized(),
+                        exception_target_el(env));
+    }
+
     if ((env->uncached_cpsr & CPSR_M) == mode) {
         return env->regs[13];
     } else {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 7bceb05..e69145d 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7590,10 +7590,7 @@ static void gen_srs(DisasContext *s,
      * -- not a valid mode number
      * -- a mode that's at a higher exception level
      * -- Monitor, if we are Non-secure
-     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
-     * "current mode is System" we will write a garbage SPSR.
-     * (This is because we don't have access to our current mode here
-     * and would have to do a runtime check to UNDEF for System.)
+     * For the UNPREDICTABLE cases we choose to UNDEF.
      */
     if (s->current_el == 1 && !s->ns) {
         gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
@@ -7639,6 +7636,9 @@ static void gen_srs(DisasContext *s,
 
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(mode);
+    /* get_r13_banked() will raise an exception if called from System mode */
+    gen_set_condexec(s);
+    gen_set_pc_im(s, s->pc - 4);
     gen_helper_get_r13_banked(addr, cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     switch (amode) {
@@ -7688,6 +7688,7 @@ static void gen_srs(DisasContext *s,
         tcg_temp_free_i32(tmp);
     }
     tcg_temp_free_i32(addr);
+    s->is_jmp = DISAS_UPDATE;
 }
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
-- 
1.9.1

