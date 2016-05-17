Received: by 10.25.208.137 with SMTP id h131csp1760528lfg;
        Tue, 17 May 2016 05:14:35 -0700 (PDT)
X-Received: by 10.140.42.79 with SMTP id b73mr885456qga.11.1463487275585;
        Tue, 17 May 2016 05:14:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h70si1953754qke.130.2016.05.17.05.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 05:14:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2dtS-0006TE-0b
	for alex.bennee@linaro.org; Tue, 17 May 2016 08:14:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2dtM-0006Ks-C0
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:14:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2dtH-0002zK-BE
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:14:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57109)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2dtH-0002z1-4l; Tue, 17 May 2016 08:14:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2dtE-0007TD-5i; Tue, 17 May 2016 13:14:20 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 17 May 2016 13:14:18 +0100
Message-Id: <1463487258-27468-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] target-arm: Don't try to set ESR IL bit in
 arm_cpu_do_interrupt_aarch64()
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HTzxjdjN7wdo

Remove some incorrect code from arm_cpu_do_interrupt_aarch64()
which attempts to set the IL bit in the syndrome register based
on the value of env->thumb. This is wrong in several ways:
 * IL doesn't indicate Thumb-vs-ARM, it indicates instruction
   length (which may be 16 or 32 for Thumb and is always 32 for ARM)
 * not every syndrome format uses IL like this -- for some IL is
   always set, and for some it is always clear
 * the code is changing esr_el[new_el] even for interrupt entry,
   which is not supposed to modify ESR_ELx at all

Delete the code, and instead rely on the syndrome value in
env->exception.syndrome having already been set up with the
correct value of IL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index d652c01..df65e68 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6349,9 +6349,6 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         env->elr_el[new_el] = env->pc;
     } else {
         env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
-        if (!env->thumb) {
-            env->cp15.esr_el[new_el] |= 1 << 25;
-        }
         env->elr_el[new_el] = env->regs[15];
 
         aarch64_sync_32_to_64(env);
-- 
1.9.1

