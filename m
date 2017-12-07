Received: by 10.223.159.74 with SMTP id f10csp5603503wrg;
        Thu, 7 Dec 2017 10:17:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbl6iSD+GCOQlYOUs7yxVs1xsBerqumhV16mxFgS2c7dtVv/ZSqGwy44Q6lqQDOgAJq9j7D
X-Received: by 10.129.93.6 with SMTP id r6mr21090596ywb.95.1512670632163;
        Thu, 07 Dec 2017 10:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670632; cv=none;
        d=google.com; s=arc-20160816;
        b=M0QaP+W0RLdrIf/APr1Zfht8DIvDOv4UO1iZ2H5RVfkAwcEqCxXUWCBmp6b+7Rcbj5
         Uoc8ZuLJh58uAGnDuCa5F6pXafXmtPxKD3Np1Pkf2kHp0ZnPRoT2PzwX8vQhgysnwVI3
         SlmlrsyizvzXQP1NpTCUYMG61BKL8kGs4HgfrbyKywphfNzL7O8RAVvRzKnE7rnVo5OS
         fcZOJkB78KI9Qs/MgtE47eo06dTiZgexGYf3GMh04skVf5XWkcqr3tcrQEReSKHf8rcA
         OvYy6Qe3Li2Zot6cwwBf7LjoE/wAHlrZMVt5xPgTEBcX/Iwemqp4ge6MGbRJkUDv29/w
         J+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=AycHsIRaG0/Tbl3bGwvTv1KREHsLLnG8IgJjSRf9kao=;
        b=gOdy2BUq+bS0k3rzSoQGsfGIAbYiZR4HjZLrSd7MZ1Dca42vM13ev20Lt0wZgGU5GD
         BjSmI45TnIMTYVCeT+DfBGPUq9iKZiWn6jjfKZlTGqT2HubNTApEcPhKgEntsQ92IypE
         JcYk23JN3H/vbz0KhqSMiPERXh3uZZ7CkaOsyy0bQAar4Odrm0YNT18K+ZufFZANj3bG
         D7jEML/QzKgSYtrLUnCIxNVyHyrHef3mK1leOy6OfWOwdP3MG49nqI9T7XT4KHRLEJ/U
         8zAolev3EJEEHO5YLC4k4VcpJ1oZ2P70O+RR3Y/o9K7anyM2DOejINBneWYmM+GASOZA
         Q4vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si1228776ywa.484.2017.12.07.10.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0jP-0000xi-KP
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:17:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hP-0008KO-CM
	for qemu-devel@nongnu.org; Thu, 07 Dec 2017 13:15:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hO-0006ov-7A
	for qemu-devel@nongnu.org; Thu, 07 Dec 2017 13:15:07 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hH-0006li-0J; Thu, 07 Dec 2017 13:14:59 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hF-000825-4U; Thu, 07 Dec 2017 18:14:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:51 +0000
Message-Id: <1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max" support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VB6PVoJh5y0a

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
index a42495b..d135ff8 100644
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
index 9304277..190da97 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1628,6 +1628,27 @@ static void pxa270c5_initfn(Object *obj)
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
@@ -1691,6 +1712,9 @@ static const ARMCPUInfo arm_cpus[] = {
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
index 670c07a..38dcf32 100644
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
@@ -240,6 +260,7 @@ typedef struct ARMCPUInfo {
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
+    { .name = "max",                .initfn = aarch64_max_initfn },
 #ifdef CONFIG_USER_ONLY
     { .name = "any",         .initfn = aarch64_any_initfn },
 #endif
-- 
2.7.4

