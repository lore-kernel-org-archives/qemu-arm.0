Received: by 10.28.91.67 with SMTP id p64csp3703591wmb;
        Tue, 6 Mar 2018 04:56:35 -0800 (PST)
X-Google-Smtp-Source: AG47ELurjzL9PPEPocm3h2lZCMxcGtAvrIxCb6JgIWmd4Q9Q5xjOTXpcBHVPi6dufd/Wb4kCmqd6
X-Received: by 10.129.160.20 with SMTP id x20mr11527588ywg.473.1520340995815;
        Tue, 06 Mar 2018 04:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340995; cv=none;
        d=google.com; s=arc-20160816;
        b=cshRbIxzQoUWNJ3CcEplcMnmTU6dM/FZXdk3h13Skp7pmqrXhtcAzPKtBEz6e/VXD1
         AmeGDU1Y5va1aQ/stUOd4XROHZtTx1bgFTR20xrYOhqtLg0PqBU29nl9eSMWOT+4sFyI
         84NuhtanZFHqg4TtbGCi/4uCBHUos2ZxUwRPtcikoe+Mv0Fx2M0JGPH809DbzHGGc1nN
         ovor6byJoAj7+6bpwplV7xuM2OBSCbnoOZ567CIgHGOwdSv7CDXBjNtdLCwssnKHs3ye
         X8+T9RhMoeNq0Yxn9CdSe9jP9TCutPUIadGcD8/MMVTtAnQu+9OvBdl4Pc6+T3RH3rVh
         CToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cmm5ofVdvZsjmXVzFiVw1Rx7JV/kj/fnyczzDnJ6p7U=;
        b=ZMgOtvkyXVJrF9NvBTvZH6MAC05HIxdSfAWP16TZZYb7WsIvygjVscXDZjqNY44Lcr
         +DLCxal7T+DCVDzXgGEkTBQfKd34Tq4AqXX/bb6DqE/pY89+to8p9hIuZUZ3MBaKGs1W
         430DicK081kEjX0OzaMC0RUfSGgv3eT8KZWq7V5ECOuvn6MfK4t0bFgUSvBXm34VKwGN
         xiBGfIsPovrCugddSVSIL+SCEBe57u8c/DTNRv8GJ8iypGjcajwN2ljRg43beFyCcsaR
         y3hiT5aTFyrwusBqKVV0xHaA9jliP0r4oqDjDimfclX+2ZWc4aJ4osc45fm7XPUwaw2s
         DObg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j127-v6si53565yba.810.2018.03.06.04.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC8x-0000X3-5A
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC85-0008Pv-RQ
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC84-0004sS-P6
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC84-0004jX-IZ; Tue, 06 Mar 2018 07:55:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7t-0004Vw-MX; Tue, 06 Mar 2018 12:55:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:23 +0000
Message-Id: <20180306125526.27838-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180306125526.27838-1-peter.maydell@linaro.org>
References: <20180306125526.27838-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/6] target/arm: Add "-cpu max" support
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
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zfhEmtGL8oYO

Add support for "-cpu max" for ARM guests. This CPU type behaves
like "-cpu host" when KVM is enabled, and like a system CPU with
the maximum possible feature set otherwise. (Note that this means
it won't be migratable across versions, as we will likely add
features to it in future.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-qom.h |  2 ++
 target/arm/cpu.c     | 24 ++++++++++++++++++++++++
 target/arm/cpu64.c   | 21 +++++++++++++++++++++
 3 files changed, 47 insertions(+)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index a42495bac9..d135ff8e06 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -33,6 +33,8 @@ struct arm_boot_info;
 #define ARM_CPU_GET_CLASS(obj) \
     OBJECT_GET_CLASS(ARMCPUClass, (obj), TYPE_ARM_CPU)
 
+#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
+
 /**
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1a58a2c094..e46ddcc613 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1697,6 +1697,27 @@ static void pxa270c5_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000078;
 }
 
+#ifndef TARGET_AARCH64
+/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
+ * otherwise, a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
+ * this only needs to handle 32 bits.
+ */
+static void arm_max_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (kvm_enabled()) {
+        kvm_arm_set_cpu_features_from_host(cpu);
+    } else {
+        cortex_a15_initfn(obj);
+        /* In future we might add feature bits here even if the
+         * real-world A15 doesn't implement them.
+         */
+    }
+}
+#endif
+
 #ifdef CONFIG_USER_ONLY
 static void arm_any_initfn(Object *obj)
 {
@@ -1764,6 +1785,9 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
     { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
+#ifndef TARGET_AARCH64
+    { .name = "max",         .initfn = arm_max_initfn },
+#endif
 #ifdef CONFIG_USER_ONLY
     { .name = "any",         .initfn = arm_any_initfn },
 #endif
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4228713b19..9042d3dfd1 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -28,6 +28,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "kvm_arm.h"
 
 static inline void set_feature(CPUARMState *env, int feature)
 {
@@ -212,6 +213,25 @@ static void aarch64_a53_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
 }
 
+/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
+ * otherwise, a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
+ * this only needs to handle 64 bits.
+ */
+static void aarch64_max_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (kvm_enabled()) {
+        kvm_arm_set_cpu_features_from_host(cpu);
+    } else {
+        aarch64_a57_initfn(obj);
+        /* In future we might add feature bits here even if the
+         * real-world A57 doesn't implement them.
+         */
+    }
+}
+
 #ifdef CONFIG_USER_ONLY
 static void aarch64_any_initfn(Object *obj)
 {
@@ -247,6 +267,7 @@ typedef struct ARMCPUInfo {
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "max",                .initfn = aarch64_max_initfn },
 #ifdef CONFIG_USER_ONLY
     { .name = "any",         .initfn = aarch64_any_initfn },
 #endif
-- 
2.16.2

