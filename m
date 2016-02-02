Received: by 10.25.159.19 with SMTP id i19csp799463lfe;
        Tue, 2 Feb 2016 10:21:17 -0800 (PST)
X-Received: by 10.140.223.9 with SMTP id t9mr18215349qhb.65.1454437277524;
        Tue, 02 Feb 2016 10:21:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p59si2045790qge.124.2016.02.02.10.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 10:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQfZk-00049E-Tz
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 13:21:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQfZO-0003VX-9I
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 13:20:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQfZN-0002wR-6I
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 13:20:54 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57168)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQfZL-0002tV-5H; Tue, 02 Feb 2016 13:20:51 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQfZC-0002g6-PY; Tue, 02 Feb 2016 18:20:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  2 Feb 2016 18:20:42 +0000
Message-Id: <1454437242-10262-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH] target-arm: Don't report presence of EL2 if it
	doesn't exist
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
X-TUID: wouKw8QCVAot

We already modify the processor feature bits to not report EL3
support to the guest if EL3 isn't enabled for the CPU we're emulating.
Add similar support for not reporting EL2 unless it is enabled.
This is necessary because real world guest code running at EL3
(trusted firmware or bootloaders) will query the ID registers to
determine whether it should start a guest Linux kernel in EL2 or EL3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
When full EL2 arrives and we have the CPU property for it then
this will expand a bit to look like the 'if (!cpu->has_el3)'
condition just above it.

 target-arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 6c34476..0cc075d 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -650,6 +650,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_aa64pfr0 &= ~0xf000;
     }
 
+    if (!arm_feature(env, ARM_FEATURE_EL2)) {
+        /* Disable the hypervisor feature bits in the processor feature
+         * registers if we don't have EL2. These are id_pfr1[15:12] and
+         * id_aa64pfr0_el1[11:8].
+         */
+        cpu->id_aa64pfr0 &= ~0xf00;
+        cpu->id_pfr1 &= ~0xf000;
+    }
+
     if (!cpu->has_mpu) {
         unset_feature(env, ARM_FEATURE_MPU);
     }
-- 
1.9.1

