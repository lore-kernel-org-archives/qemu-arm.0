Received: by 10.25.21.96 with SMTP id l93csp2053466lfi;
        Tue, 21 Jun 2016 10:10:02 -0700 (PDT)
X-Received: by 10.55.159.72 with SMTP id i69mr29582593qke.29.1466529000463;
        Tue, 21 Jun 2016 10:10:00 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e8si7605272qte.108.2016.06.21.10.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 10:10:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFPBX-0004Hz-QJ
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 13:09:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54341)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBK-000471-MK
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bFPBI-00045N-J5
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 13:09:45 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBI-00044f-BY; Tue, 21 Jun 2016 13:09:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bFPBB-00025a-St; Tue, 21 Jun 2016 18:09:37 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 Jun 2016 18:09:33 +0100
Message-Id: <1466528974-12183-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 5/6] target-arm: Make page size a runtime
 setting
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v7BmRlqrhRco

Rather than defining TARGET_PAGE_BITS to always be 10,
switch to using a value picked at runtime. This allows us
to use 4K pages for modern ARM CPUs (and in particular all
64-bit CPUs) without having to drop support for the old
ARMv5 CPUs which had 1K pages.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.c | 24 ++++++++++++++++++++++++
 target-arm/cpu.h |  9 +++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index ce8b8f4..d807b3f 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -576,6 +576,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     ARMCPU *cpu = ARM_CPU(dev);
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
     CPUARMState *env = &cpu->env;
+    int pagebits;
 
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
@@ -631,6 +632,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_THUMB_DSP);
     }
 
+    if (arm_feature(env, ARM_FEATURE_V7) &&
+        !arm_feature(env, ARM_FEATURE_M) &&
+        !arm_feature(env, ARM_FEATURE_MPU)) {
+        /* v7VMSA drops support for the old ARMv5 tiny pages, so we
+         * can use 4K pages.
+         */
+        pagebits = 12;
+    } else {
+        /* For CPUs which might have tiny 1K pages, or which have an
+         * MPU and might have small region sizes, stick with 1K pages.
+         */
+        pagebits = 10;
+    }
+    if (!set_preferred_target_page_bits(pagebits)) {
+        /* This can only ever happen for hotplugging a CPU, or if
+         * the board code incorrectly creates a CPU which it has
+         * promised via minimum_page_size that it will not.
+         */
+        error_setg(errp, "This CPU requires a smaller page size than the "
+                   "system is using");
+        return;
+    }
+
     if (cpu->reset_hivecs) {
             cpu->reset_sctlr |= (1 << 13);
     }
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 7938ddc..073f91f 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1767,10 +1767,11 @@ bool write_cpustate_to_list(ARMCPU *cpu);
 #if defined(CONFIG_USER_ONLY)
 #define TARGET_PAGE_BITS 12
 #else
-/* The ARM MMU allows 1k pages.  */
-/* ??? Linux doesn't actually use these, and they're deprecated in recent
-   architecture revisions.  Maybe a configure option to disable them.  */
-#define TARGET_PAGE_BITS 10
+/* ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
+ * have to support 1K tiny pages.
+ */
+#define TARGET_PAGE_BITS_VARY
+#define TARGET_PAGE_BITS_MIN 10
 #endif
 
 #if defined(TARGET_AARCH64)
-- 
1.9.1

