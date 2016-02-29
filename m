Received: by 10.25.208.211 with SMTP id h202csp1191903lfg;
        Mon, 29 Feb 2016 08:47:32 -0800 (PST)
X-Received: by 10.55.76.134 with SMTP id z128mr20497671qka.90.1456764452007;
        Mon, 29 Feb 2016 08:47:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9si26537725qhc.10.2016.02.29.08.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Feb 2016 08:47:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaQyp-0001z0-Ee
	for alex.bennee@linaro.org; Mon, 29 Feb 2016 11:47:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aaQyn-0001x8-JX
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:47:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aaQyj-00029Q-Hw
	for qemu-arm@nongnu.org; Mon, 29 Feb 2016 11:47:29 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aaQyg-00028d-Op; Mon, 29 Feb 2016 11:47:22 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aaQye-0005ME-2t; Mon, 29 Feb 2016 16:47:20 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 29 Feb 2016 16:47:18 +0000
Message-Id: <1456764438-30015-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] target-arm: Correct handling of writes to CPSR
	mode bits from gdb in usermode
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
X-TUID: 0BEw7LsUAlv6

In helper.c the expression
  (env->uncached_cpsr & CPSR_M) != CPSR_USER
is always true; the right hand side was supposed to be ARM_CPU_MODE_USR
(an error in commit cb01d391).

Since the incorrect expression was always true, this just meant that
commit cb01d391 had no effect.

However simply changing the RHS here would reveal a logic error: if
the mode is USR we wish to completely ignore the attempt to set the
mode bits, which means that we must clear the CPSR_M bits from mask
to avoid the uncached_cpsr bits being updated at the end of the
function.

Move the condition into the correct place in the code, fix its RHS
constant, and add a comment about the fact that we must be doing a
gdbstub write if we're in user mode.

Fixes: https://bugs.launchpad.net/qemu/+bug/1550503
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 18c8296..935f13b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5490,9 +5490,16 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
     env->daif |= val & CPSR_AIF & mask;
 
     if (write_type != CPSRWriteRaw &&
-        (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
         ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
-        if (bad_mode_switch(env, val & CPSR_M, write_type)) {
+        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR) {
+            /* Note that we can only get here in USR mode if this is a
+             * gdb stub write; for this case we follow the architectural
+             * behaviour for guest writes in USR mode of ignoring an attempt
+             * to switch mode. (Those are caught by translate.c for writes
+             * triggered by guest instructions.)
+             */
+            mask &= ~CPSR_M;
+        } else if (bad_mode_switch(env, val & CPSR_M, write_type)) {
             /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
              * v7, and has defined behaviour in v8:
              *  + leave CPSR.M untouched
-- 
1.9.1

