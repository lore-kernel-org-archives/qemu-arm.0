Received: by 10.80.166.35 with SMTP id d32csp557669edc;
        Mon, 10 Oct 2016 08:32:05 -0700 (PDT)
X-Received: by 10.200.52.219 with SMTP id x27mr31337763qtb.67.1476113525819;
        Mon, 10 Oct 2016 08:32:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si9692259qto.35.2016.10.10.08.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Oct 2016 08:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btcYf-0002ZX-5c
	for alex.bennee@linaro.org; Mon, 10 Oct 2016 11:32:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1btcSy-00065r-GQ
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 11:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1btcSx-0006v4-EK
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 11:26:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1btcSx-0006sP-7V; Mon, 10 Oct 2016 11:26:11 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1btcSp-0000P6-Ne; Mon, 10 Oct 2016 16:26:03 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Oct 2016 16:26:03 +0100
Message-Id: <1476113163-24578-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] Fix masking of PC lower bits when doing
 exception returns
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
Cc: Jerome Forissier <jerome.forissier@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IHrciK/sYYJ9

In commit 9b6a3ea7a699594 store_reg() was changed to mask
both bits 0 and 1 of the new PC value when in ARM mode.
Unfortunately this broke the exception return code paths
when doing a return from ARM mode to Thumb mode: in some
of these we write a new CPSR including new Thumb mode
bit via gen_helper_cpsr_write_eret(), and then use store_reg()
to write the new PC. In this case if the new CPSR specified
Thumb mode then masking bit 1 of the PC is incorrect
(these code paths correspond to the v8 ARM ARM pseudocode
function AArch32.ExceptionReturn(), which always aligns the
new PC appropriately for the new instruction set state).

Instead of using store_reg() in exception-return code paths,
call a new store_pc_exc_ret() which stores the raw new PC
value to env->regs[15], and then mask it appropriately in
the subsequent helper_cpsr_write_eret() where the new
env->thumb state is available.

This fixes a bug introduced by 9b6a3ea7a699594 which caused
crashes/hangs or otherwise bad behaviour for Linux when
userspace was using Thumb.

Reported-by: Jerome Forissier <jerome.forissier@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This brings our handling of misaligned branch targets
into compliance for ARMv7, I think. For ARMv8 there is
one final corner case: interworking branches (BX,
pseudocode BXWritePC) which select a misaligned ARM
address are entirely UNPREDICTABLE in v7 but in v8 are
CONSTRAINED UNPREDICTABLE to either force the address into
alignment or generate a PC Alignment fault when executing
from the address. I favour the second as more efficient
but am not implementing it right now...
---
 target-arm/op_helper.c |  7 +++++++
 target-arm/translate.c | 29 ++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index be27b21..cd94216 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -479,6 +479,13 @@ void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
     cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
 
+    /* Generated code has already stored the new PC value, but
+     * without masking out its low bits, because which bits need
+     * masking depends on whether we're returning to Thumb or ARM
+     * state. Do the masking now.
+     */
+    env->regs[15] &= (env->thumb ? ~1 : ~3);
+
     arm_call_el_change_hook(arm_env_get_cpu(env));
 }
 
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 8df24bf..164b52a 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4363,26 +4363,35 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
     s->is_jmp = DISAS_UPDATE;
 }
 
-/* Generate an old-style exception return. Marks pc as dead. */
-static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+/* Store value to PC as for an exception return (ie don't
+ * mask bits). The subsequent call to gen_helper_cpsr_write_eret()
+ * will do the masking based on the new value of the Thumb bit.
+ */
+static void store_pc_exc_ret(DisasContext *s, TCGv_i32 pc)
 {
-    TCGv_i32 tmp;
-    store_reg(s, 15, pc);
-    tmp = load_cpu_field(spsr);
-    gen_helper_cpsr_write_eret(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
-    s->is_jmp = DISAS_JUMP;
+    tcg_gen_mov_i32(cpu_R[15], pc);
+    tcg_temp_free_i32(pc);
 }
 
 /* Generate a v6 exception return.  Marks both values as dead.  */
 static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
 {
+    store_pc_exc_ret(s, pc);
+    /* The cpsr_write_eret helper will mask the low bits of PC
+     * appropriately depending on the new Thumb bit, so it must
+     * be called after storing the new PC.
+     */
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
     tcg_temp_free_i32(cpsr);
-    store_reg(s, 15, pc);
     s->is_jmp = DISAS_JUMP;
 }
 
+/* Generate an old-style exception return. Marks pc as dead. */
+static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
+{
+    gen_rfe(s, pc, load_cpu_field(spsr));
+}
+
 static void gen_nop_hint(DisasContext *s, int val)
 {
     switch (val) {
@@ -9366,6 +9375,8 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                             } else if (i == rn) {
                                 loaded_var = tmp;
                                 loaded_base = 1;
+                            } else if (rn == 15 && exc_return) {
+                                store_pc_exc_ret(s, tmp);
                             } else {
                                 store_reg_from_load(s, i, tmp);
                             }
-- 
2.7.4

