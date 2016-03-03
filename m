Received: by 10.25.208.211 with SMTP id h202csp2659109lfg;
        Thu, 3 Mar 2016 04:11:38 -0800 (PST)
X-Received: by 10.141.2.11 with SMTP id e11mr2572497qhd.69.1457007098612;
        Thu, 03 Mar 2016 04:11:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f185si15162883qkb.71.2016.03.03.04.11.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 04:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abS6U-0002Ok-1c
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 07:11:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1abS6R-0002NZ-FM
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 07:11:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1abS6M-000638-So
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 07:11:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1abS6M-0005xL-Ll
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 07:11:30 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1abS6D-0000ev-KG; Thu, 03 Mar 2016 12:11:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nonngnu.org
Date: Thu,  3 Mar 2016 12:11:18 +0000
Message-Id: <1457007078-31387-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org,
	Christopher Covington <cov@codeaurora.org>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] linux-user: arm: Remove ARM_cpsr and similar
	#defines
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
X-TUID: 06TVkresOh3m

The #defines of ARM_cpsr and friends in linux-user/arm/target-syscall.h
can clash with versions in the system headers if building on an
ARM or AArch64 build (though this seems to be dependent on the version
of the system headers). The QEMU defines are not very useful (it's
not clear that they're intended for use with the target_pt_regs struct
rather than (say) the CPUARMState structure) and we only use them in one
function in elfload.c anyway. So just remove the #defines and directly
access regs->uregs[].

Reported-by: Christopher Covington <cov@codeaurora.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Christopher, can you check that this resolves your compile issues, please?

NB that I have not touched the similar code in bsd-user/elfload.c because
that's clearly dead code, since there's no bsd-user/arm support anyway.

 linux-user/arm/target_syscall.h | 20 +-------------------
 linux-user/elfload.c            | 19 ++++++++++---------
 2 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index ea863db..11077b7 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -4,29 +4,11 @@
 /* this struct defines the way the registers are stored on the
    stack during a system call. */
 
+/* uregs[0..15] are r0 to r15; uregs[16] is CPSR; uregs[17] is ORIG_r0 */
 struct target_pt_regs {
     abi_long uregs[18];
 };
 
-#define ARM_cpsr	uregs[16]
-#define ARM_pc		uregs[15]
-#define ARM_lr		uregs[14]
-#define ARM_sp		uregs[13]
-#define ARM_ip		uregs[12]
-#define ARM_fp		uregs[11]
-#define ARM_r10		uregs[10]
-#define ARM_r9		uregs[9]
-#define ARM_r8		uregs[8]
-#define ARM_r7		uregs[7]
-#define ARM_r6		uregs[6]
-#define ARM_r5		uregs[5]
-#define ARM_r4		uregs[4]
-#define ARM_r3		uregs[3]
-#define ARM_r2		uregs[2]
-#define ARM_r1		uregs[1]
-#define ARM_r0		uregs[0]
-#define ARM_ORIG_r0	uregs[17]
-
 #define ARM_SYSCALL_BASE	0x900000
 #define ARM_THUMB_SYSCALL	0
 
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 19dc7f5..ad014da 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -273,19 +273,20 @@ static inline void init_thread(struct target_pt_regs *regs,
     abi_long stack = infop->start_stack;
     memset(regs, 0, sizeof(*regs));
 
-    regs->ARM_cpsr = 0x10;
-    if (infop->entry & 1)
-        regs->ARM_cpsr |= CPSR_T;
-    regs->ARM_pc = infop->entry & 0xfffffffe;
-    regs->ARM_sp = infop->start_stack;
+    regs->uregs[16] = ARM_CPU_MODE_USR;
+    if (infop->entry & 1) {
+        regs->uregs[16] |= CPSR_T;
+    }
+    regs->uregs[15] = infop->entry & 0xfffffffe;
+    regs->uregs[13] = infop->start_stack;
     /* FIXME - what to for failure of get_user()? */
-    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
-    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
+    get_user_ual(regs->uregs[2], stack + 8); /* envp */
+    get_user_ual(regs->uregs[1], stack + 4); /* envp */
     /* XXX: it seems that r0 is zeroed after ! */
-    regs->ARM_r0 = 0;
+    regs->uregs[0] = 0;
     /* For uClinux PIC binaries.  */
     /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
-    regs->ARM_r10 = infop->start_data;
+    regs->uregs[10] = infop->start_data;
 }
 
 #define ELF_NREG    18
-- 
1.9.1

