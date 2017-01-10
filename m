Received: by 10.25.205.13 with SMTP id d13csp367299lfg;
        Tue, 10 Jan 2017 10:44:31 -0800 (PST)
X-Received: by 10.200.39.212 with SMTP id x20mr4010827qtx.109.1484073871732;
        Tue, 10 Jan 2017 10:44:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i88si1934369qtb.138.2017.01.10.10.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 10:44:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cR1PL-0005sF-5I
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 13:44:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cR1P9-0005oN-RE
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 13:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cR1P9-0002KU-2C
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 13:44:19 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cR1P8-0002Gi-Rk; Tue, 10 Jan 2017 13:44:18 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cR1P0-0002ye-HL; Tue, 10 Jan 2017 18:44:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jan 2017 18:44:08 +0000
Message-Id: <1484073849-32666-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
References: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/3] target/arm: Handle VIRQ and VFIQ in
 arm_cpu_do_interrupt_aarch32()
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
X-TUID: cCu+HSzWNBy7

To run a VM in 32-bit EL1 our AArch32 interrupt handling code
needs to be able to cope with VIRQ and VFIQ exceptions.
These behave like IRQ and FIQ except that we don't need to try
to route them to Monitor mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8dcabbf..dc90986 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6403,6 +6403,20 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         }
         offset = 4;
         break;
+    case EXCP_VIRQ:
+        new_mode = ARM_CPU_MODE_IRQ;
+        addr = 0x18;
+        /* Disable IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I;
+        offset = 4;
+        break;
+    case EXCP_VFIQ:
+        new_mode = ARM_CPU_MODE_FIQ;
+        addr = 0x1c;
+        /* Disable FIQ, IRQ and imprecise data aborts.  */
+        mask = CPSR_A | CPSR_I | CPSR_F;
+        offset = 4;
+        break;
     case EXCP_SMC:
         new_mode = ARM_CPU_MODE_MON;
         addr = 0x08;
-- 
2.7.4

