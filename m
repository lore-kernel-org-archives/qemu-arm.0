Received: by 10.25.208.211 with SMTP id h202csp1578215lfg;
        Tue, 1 Mar 2016 03:53:01 -0800 (PST)
X-Received: by 10.140.97.71 with SMTP id l65mr25500957qge.91.1456833181074;
        Tue, 01 Mar 2016 03:53:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r185si202276qhr.129.2016.03.01.03.53.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 03:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aairM-0003vX-Jq
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 06:53:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aairK-0003tP-Qx
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 06:52:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aairK-0000Gs-2s
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 06:52:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aairI-0000GX-1Z; Tue, 01 Mar 2016 06:52:56 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aairG-0005jl-4s; Tue, 01 Mar 2016 11:52:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  1 Mar 2016 11:52:51 +0000
Message-Id: <1456833171-31900-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-arm@nongnu.org,
	Hunter Laux <hunterlaux@gmail.com>, patches@linaro.org
Subject: [Qemu-arm] [PATCH] linux-user: arm: Handle (ignore) EXCP_YIELD in
	ARM cpu_loop()
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
X-TUID: n/dcxP21aHmK

The new-in-ARMv8 YIELD instruction has been implemented to throw
an EXCP_YIELD back up to the QEMU main loop. In system emulation
we use this to decide to schedule a different guest CPU in SMP
configurations. In usermode emulation there is nothing to do,
so just ignore it and resume the guest.

This prevents an abort with "unhandled CPU exception 0x10004"
if the guest process uses the YIELD instruction.

Reported-by: Hunter Laux <hunterlaux@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 700724e..64b0058 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -871,6 +871,9 @@ void cpu_loop(CPUARMState *env)
             if (do_kernel_trap(env))
               goto error;
             break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
         error:
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
@@ -1061,6 +1064,9 @@ void cpu_loop(CPUARMState *env)
         case EXCP_SEMIHOST:
             env->xregs[0] = do_arm_semihosting(env);
             break;
+        case EXCP_YIELD:
+            /* nothing to do here for user-mode, just resume guest code */
+            break;
         default:
             EXCP_DUMP(env, "qemu: unhandled CPU exception 0x%x - aborting\n", trapnr);
             abort();
-- 
1.9.1

