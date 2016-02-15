Received: by 10.25.208.211 with SMTP id h202csp849130lfg;
        Mon, 15 Feb 2016 09:23:26 -0800 (PST)
X-Received: by 10.140.97.202 with SMTP id m68mr21552074qge.102.1455557005940;
        Mon, 15 Feb 2016 09:23:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47si35245200qge.79.2016.02.15.09.23.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:23:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMrs-000117-Vs
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:23:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrh-0000gE-D5
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrg-0007sS-9q
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:13 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrd-0007mW-Fk; Mon, 15 Feb 2016 12:23:09 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrR-0000xN-PT; Mon, 15 Feb 2016 17:22:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:47 +0000
Message-Id: <1455556977-3644-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 01/11] target-arm: Give CPSR setting on 32-bit
	exception return its own helper
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
X-TUID: 4qEpPfoUBdbF

The rules for setting the CPSR on a 32-bit exception return are
subtly different from those for setting the CPSR via an instruction
like MSR or CPS. (In particular, in Hyp mode changing the mode bits
is not valid via MSR or CPS.) Split the exception-return case into
its own helper for setting CPSR, so we can eventually handle them
differently in the helper function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.h    | 1 +
 target-arm/op_helper.c | 6 ++++++
 target-arm/translate.c | 6 +++---
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target-arm/helper.h b/target-arm/helper.h
index c98e9ce..ea13202 100644
--- a/target-arm/helper.h
+++ b/target-arm/helper.h
@@ -57,6 +57,7 @@ DEF_HELPER_2(pre_smc, void, env, i32)
 DEF_HELPER_1(check_breakpoints, void, env)
 
 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
+DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)
 
 DEF_HELPER_3(v7m_msr, void, env, i32, i32)
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 538887c..e3ddd5a 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -425,6 +425,12 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
     cpsr_write(env, val, mask);
 }
 
+/* Write the CPSR for a 32-bit exception return */
+void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
+{
+    cpsr_write(env, val, CPSR_ERET_MASK);
+}
+
 /* Access to user mode registers from privileged modes.  */
 uint32_t HELPER(get_user_reg)(CPUARMState *env, uint32_t regno)
 {
diff --git a/target-arm/translate.c b/target-arm/translate.c
index e69145d..413f7de 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4094,7 +4094,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
     TCGv_i32 tmp;
     store_reg(s, 15, pc);
     tmp = load_cpu_field(spsr);
-    gen_set_cpsr(tmp, CPSR_ERET_MASK);
+    gen_helper_cpsr_write_eret(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
     s->is_jmp = DISAS_JUMP;
 }
@@ -4102,7 +4102,7 @@ static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
 /* Generate a v6 exception return.  Marks both values as dead.  */
 static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
 {
-    gen_set_cpsr(cpsr, CPSR_ERET_MASK);
+    gen_helper_cpsr_write_eret(cpu_env, cpsr);
     tcg_temp_free_i32(cpsr);
     store_reg(s, 15, pc);
     s->is_jmp = DISAS_JUMP;
@@ -9094,7 +9094,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 if (exc_return) {
                     /* Restore CPSR from SPSR.  */
                     tmp = load_cpu_field(spsr);
-                    gen_set_cpsr(tmp, CPSR_ERET_MASK);
+                    gen_helper_cpsr_write_eret(cpu_env, tmp);
                     tcg_temp_free_i32(tmp);
                     s->is_jmp = DISAS_JUMP;
                 }
-- 
1.9.1

