Received: by 10.25.208.211 with SMTP id h202csp852522lfg;
        Mon, 15 Feb 2016 09:30:43 -0800 (PST)
X-Received: by 10.140.43.37 with SMTP id d34mr21513945qga.51.1455557443689;
        Mon, 15 Feb 2016 09:30:43 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d70si35187270qhd.60.2016.02.15.09.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:30:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMyx-00059E-64
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:30:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrf-0000db-Kl
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMre-0007rE-BR
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:11 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrd-0007mW-QI; Mon, 15 Feb 2016 12:23:10 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrR-0000xV-TH; Mon, 15 Feb 2016 17:22:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:49 +0000
Message-Id: <1455556977-3644-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 03/11] target-arm: Raw CPSR writes should skip
	checks and bank switching
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: peA4Q4kqhfuh

Raw CPSR writes should skip the architectural checks for whether
we're allowed to set the A or F bits and should also not do
the switching of register banks if the mode changes. Handle
this inside cpsr_write(), which allows us to drop the "manually
set the mode bits to avoid the bank switch" code from all the
callsites which are using CPSRWriteRaw.

This fixes a bug in 32-bit KVM handling where we had forgotten
the "manually set the mode bits" part and could thus potentially
trash the register state if the mode from the last exit to userspace
differed from the mode on this exit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c    | 5 +++--
 target-arm/kvm64.c     | 1 -
 target-arm/machine.c   | 2 --
 target-arm/op_helper.c | 5 ++++-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 828822b..d1919bb 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5234,7 +5234,7 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
      * In a V8 implementation, it is permitted for privileged software to
      * change the CPSR A/F bits regardless of the SCR.AW/FW bits.
      */
-    if (!arm_feature(env, ARM_FEATURE_V8) &&
+    if (write_type != CPSRWriteRaw && !arm_feature(env, ARM_FEATURE_V8) &&
         arm_feature(env, ARM_FEATURE_EL3) &&
         !arm_feature(env, ARM_FEATURE_EL2) &&
         !arm_is_secure(env)) {
@@ -5281,7 +5281,8 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     env->daif &= ~(CPSR_AIF & mask);
     env->daif |= val & CPSR_AIF & mask;
 
-    if ((env->uncached_cpsr ^ val) & mask & CPSR_M) {
+    if (write_type != CPSRWriteRaw &&
+        ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
         if (bad_mode_switch(env, val & CPSR_M)) {
             /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.
              * We choose to ignore the attempt and leave the CPSR M field
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 08c2c81..e8527bf 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -722,7 +722,6 @@ int kvm_arch_get_registers(CPUState *cs)
     if (is_a64(env)) {
         pstate_write(env, val);
     } else {
-        env->uncached_cpsr = val & CPSR_M;
         cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
     }
 
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 0fc7df0..03a73d9 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -173,8 +173,6 @@ static int get_cpsr(QEMUFile *f, void *opaque, size_t size)
         return 0;
     }
 
-    /* Avoid mode switch when restoring CPSR */
-    env->uncached_cpsr = val & CPSR_M;
     cpsr_write(env, val, 0xffffffff, CPSRWriteRaw);
     return 0;
 }
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 543d33a..4881e34 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -779,7 +779,10 @@ void HELPER(exception_return)(CPUARMState *env)
 
     if (!return_to_aa64) {
         env->aarch64 = 0;
-        env->uncached_cpsr = spsr & CPSR_M;
+        /* We do a raw CPSR write because aarch64_sync_64_to_32()
+         * will sort the register banks out for us, and we've already
+         * caught all the bad-mode cases in el_from_spsr().
+         */
         cpsr_write(env, spsr, ~0, CPSRWriteRaw);
         if (!arm_singlestep_active(env)) {
             env->uncached_cpsr &= ~PSTATE_SS;
-- 
1.9.1

