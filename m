Received: by 10.28.91.67 with SMTP id p64csp1200963wmb;
        Thu, 8 Mar 2018 05:06:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELuDkccuIRm7TrwrO3e3tmIXmD5VhypaLmLckjlQ2AHQyR+qRmyT2jxEi9PdiKnGXm+3Q+Ak
X-Received: by 10.46.113.17 with SMTP id m17mr17987492ljc.114.1520514391356;
        Thu, 08 Mar 2018 05:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520514391; cv=none;
        d=google.com; s=arc-20160816;
        b=S0cj/e3b3FpQtu0PhluYemnZ1VIaoJT9TpLoGB7U/qFz//o27PkjwxpgMI4wL0WRbW
         mvlUMhh3i+wSgSkJts1E1YPaL0RhnnCS1OQTiPbk0uWIt5xTIVzt+RF1lEmCBd9XN8Ec
         alKvmoBJUhDLPvkfwIGik+rbEyKHYMPPKdTH2/Ql/6QMdPS+yX2UaDlAhh7fJmpTLbx3
         J5AXOwxQ4QoAjxJNNA0vwP78BLmxkIv1vcHdvxF30gTyi6jcLkJxh/L0VzSFs0Hw+Nhz
         0gK9WPb+h2NkzTv7I1UTBbuwqLtIs6w2Ra2ALvyELTF15o/WvqPGpNoWkDA7XiVfC8Kw
         kgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=cmm5ofVdvZsjmXVzFiVw1Rx7JV/kj/fnyczzDnJ6p7U=;
        b=LMK0GoNP/2mPiXfejsYL2XH+AEh0IH+eKJARTSt0NnmBUoFw9kFi2m3uIdV1Jg658b
         Wy57ngpXHvWT1M0shUkfHi8toOU+3wfGQFgDqyEaS0DINjE0nA3PDBabgG/Ke5nYoOmA
         ntdggoavsom/iS1Rw0nVssXM8c5/K4+ARk+b5s0h0hGpNERaLMpftlk22NRMzvpyfEbi
         FC1CTMEaGwi4f2JaswHN7kzIb5fvz0x+Pc9zRW4q9vWWrBVObM7yvsu2tYFQ3SfnvyjQ
         Rr/6CpTtjpq5SBjnhME2eZd0bhkZdczwlrijgGHaFnrLwgv1zlel3boHh5rNjhPr0xyt
         k02g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id w187si7512393lff.443.2018.03.08.05.06.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Mar 2018 05:06:31 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etvFe-0005yt-45; Thu, 08 Mar 2018 13:06:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 3/6] target/arm: Add "-cpu max" support
Date: Thu,  8 Mar 2018 13:06:23 +0000
Message-Id: <20180308130626.12393-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180308130626.12393-1-peter.maydell@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
X-TUID: 7bl4ik+J06Yc

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
