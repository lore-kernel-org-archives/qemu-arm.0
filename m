Received: by 10.25.208.211 with SMTP id h202csp849027lfg;
        Mon, 15 Feb 2016 09:23:14 -0800 (PST)
X-Received: by 10.55.79.86 with SMTP id d83mr22058870qkb.22.1455556994456;
        Mon, 15 Feb 2016 09:23:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l92si35245455qge.92.2016.02.15.09.23.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:23:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMrh-0000gO-Rm
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:23:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMre-0000bP-II
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrd-0007qN-M1
	for qemu-arm@nongnu.org; Mon, 15 Feb 2016 12:23:10 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrb-0007mW-Ja; Mon, 15 Feb 2016 12:23:07 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrR-0000xZ-VH; Mon, 15 Feb 2016 17:22:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:50 +0000
Message-Id: <1455556977-3644-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 04/11] linux-user: Use restrictive mask when
	calling cpsr_write()
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
X-TUID: 0YDkQ259GPXR

When linux-user code is calling cpsr_write(), use a restrictive
mask to ensure we are limiting the set of CPSR bits we update.
In particular, don't allow the mode bits to be changed.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/main.c   | 3 ++-
 linux-user/signal.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 1269470..c467fa7 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4446,7 +4446,8 @@ int main(int argc, char **argv, char **envp)
 #elif defined(TARGET_ARM)
     {
         int i;
-        cpsr_write(env, regs->uregs[16], 0xffffffff, CPSRWriteByInstr);
+        cpsr_write(env, regs->uregs[16], CPSR_USER | CPSR_EXEC,
+                   CPSRWriteByInstr);
         for(i = 0; i < 16; i++) {
             env->regs[i] = regs->uregs[i];
         }
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 82f81c7..962111c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -1611,7 +1611,7 @@ setup_return(CPUARMState *env, struct target_sigaction *ka,
 	env->regs[13] = frame_addr;
 	env->regs[14] = retcode;
 	env->regs[15] = handler & (thumb ? ~1 : ~3);
-        cpsr_write(env, cpsr, 0xffffffff, CPSRWriteByInstr);
+        cpsr_write(env, cpsr, CPSR_IT | CPSR_T, CPSRWriteByInstr);
 }
 
 static abi_ulong *setup_sigframe_v2_vfp(abi_ulong *regspace, CPUARMState *env)
-- 
1.9.1

