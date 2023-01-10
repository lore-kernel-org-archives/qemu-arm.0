Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316768ejc;
        Tue, 10 Jan 2023 08:44:38 -0800 (PST)
X-Received: by 2002:a05:600c:3b0a:b0:3d9:91cb:bbff with SMTP id m10-20020a05600c3b0a00b003d991cbbbffmr35019314wms.26.1673369077904;
        Tue, 10 Jan 2023 08:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369077; cv=none;
        d=google.com; s=arc-20160816;
        b=Gj9tvEa4Qm+3bbWEPA565Ci9ZzN1z6n2atjhe74k86W7pAapwDfFP7BKCpAcSqfssE
         3ZzbdPqFO68kLj7LWfZrK2TZacptX3JbqGbRfhPJpkSM1DASp8yR5/osvDwtNPcRjc2h
         BuJ3kEpRYE4M0XOok4lF/VJOWCljbxml1XozmqLFgDsah3SmAHQTMpnzQk1Yf3bwSnae
         bjIpcuAAm8/ujboX8ZUaoWc2qJ5JWegsml3EtS83o0Asl6M7A+GE30w8ek1msZKBrPzs
         DPpn4kgicbG4pvyxVx68mC7IzEVLEuTcmi7OKRuug9P6fjTcpfRRsxtpYzsSOUt1bUxM
         YMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KPo282/uew3iuzImHfNxHuSGZYMfkFiyRCBHN2R+reg=;
        b=SSq1GtQPj1HDb9K5JXnmhV5QJL7C6ymUOkjTE2miIZ7IX6IgG3GYNzl5+yyKA+0r99
         zIdnCfw/YCv9XPrU9S3oipLsR60bZTT65NTYNkdTgOQeParj4GqC2WpdRXYTIqVGlDcv
         7t1LBQn67zjPAuaCCZeXqHlZzlHhNxBOnNsQKJF4TRdJJt8r9MDX5CmV0QJsPPn/Bo7b
         SnFj0zCS9Z67Bo48+Dlj5VGCwrNdQm03rAzru0ca1AwYDmnlomCcCM0o8V5oFOOrAPm5
         3kSZAbaY22W/FyLnDXCnXDEugm6tVARP8pzocSbextsYwo/J7+CSm1M8KMcaRWmGSrsH
         HcRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrhy6Iw7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p22-20020a05600c359600b003d9e06412d7sor3156042wmq.39.2023.01.10.08.44.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qrhy6Iw7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPo282/uew3iuzImHfNxHuSGZYMfkFiyRCBHN2R+reg=;
        b=qrhy6Iw759H6bZICrx9tRM8mKmb8jMMnw3X84KMracRcoxgvKt+z+wJpSbexd1bLqU
         pLPDnLcFB93U4GKltHY5i2okbajMQhHKW1p3HrfHeyy87gl0zpI/TTn9NNHqZP/9DqgO
         Pul9nhnEEps5gNTZ34JSVxeo6q4Tas6hazG9DPuNGSAwQ5l0FnYsd8UTqg8exB6E4qzR
         KZxrX1nKP3jJS5mnI5oB1PiW27r7/h0KY61vneSxKMdR6QjOzcHmIN2sOe7FkTeRfvkX
         QVQm/hFCbEa+PoUBPXrZe3DJD06aMslLARl1dDIRCyPOgMRHEulXla+0PpQs4XgcwxR0
         y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPo282/uew3iuzImHfNxHuSGZYMfkFiyRCBHN2R+reg=;
        b=gr6LCrU3+pJt4SZdUFX2fFovHXx6YsB/Tdke558ipwbvCuJe3gtcP/PF7o5RcFdXOm
         4+L89pm2bGQtRp9ESk9hYsB6pZluMXVU8OknTNgZYzUgSZ0JTkS3EYiSzs4S5bPCQlYd
         qBEkl2bURki9U3zS9aU/XNNPOnQ/c1E2A/DlDiLxngj+6ae87KZllFSPwlpyzQOa60RZ
         WgcEaGKWgEmBs0++MbLgzGV+DWIQPg8uB24EXRrN4dJFjAs+GeYScFRAs7VK6SlkUUuN
         JWRPRBvmhcBatvUSb/kTpbGjyjb2tZMiq+ORwB+8ZBiny5I8wYcSOQ9av8UySVT0EnOI
         FW0g==
X-Gm-Message-State: AFqh2kpTfFBrK0dBD0eC4fxVhRWYpq3K9YGBlEGXDblgSdY0sjdlAZtu
	tJDTsF+gtjxkRwTXFz4bDEX+1bn6
X-Google-Smtp-Source: AMrXdXt8S3GJKiZmzYyQyopJp1IgN21n6HZEifW+v2c7deRR5IBMdGg9bQebV+JCGVDr3lEV1HWbYg==
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id bd17-20020a05600c1f1100b003d057ea319cmr49741887wmb.13.1673369077657;
        Tue, 10 Jan 2023 08:44:37 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c71358a42dsm26960870wmq.18.2023.01.10.08.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 05/18] target/arm: Move CPU QOM type definitions to "hw/arm/cpu.h"
Date: Tue, 10 Jan 2023 17:43:53 +0100
Message-Id: <20230110164406.94366-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uDsRKmH5tAiP

Units including "target/arm/cpu.h" can't be built once via meson's
softmmu_ss[] source set. Since this header depends on specific
definitions such the word size (32 or 64-bit), for ARM such units
must go to the per-target arm_ss[].

We want to expose few architectural definitions to hardware models.

Start by exposing the ARM CPU QOM types to files under hw/
via the new "hw/arm/cpu.h" header. Doing so, less HW models
will require access to "target/arm/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/cpu.h | 28 ++++++++++++++++++++++++++++
 target/arm/cpu-qom.h | 13 +------------
 target/arm/cpu.h     |  8 ++++----
 3 files changed, 33 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/arm/cpu.h

diff --git a/include/hw/arm/cpu.h b/include/hw/arm/cpu.h
new file mode 100644
index 0000000000..0c5d6ca2a8
--- /dev/null
+++ b/include/hw/arm/cpu.h
@@ -0,0 +1,28 @@
+/*
+ * ARM / Aarch64 CPU definitions
+ *
+ * This file contains architectural definitions consumed by hardware models
+ * implementations (files under hw/).
+ * Definitions not required to be exposed to hardware has to go in the
+ * architecture specific "target/arm/cpu.h" header.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef HW_ARM_CPU_H
+#define HW_ARM_CPU_H
+
+#include "hw/core/cpu.h"
+
+#define TYPE_ARM_CPU "arm-cpu"
+OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
+
+#define TYPE_AARCH64_CPU "aarch64-cpu"
+typedef struct AArch64CPUClass AArch64CPUClass;
+DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU, TYPE_AARCH64_CPU)
+
+#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
+#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
+
+#endif
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..b98904b6bc 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -21,16 +21,11 @@
 #define QEMU_ARM_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 struct arm_boot_info;
 
-#define TYPE_ARM_CPU "arm-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
-
-#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
-
 typedef struct ARMCPUInfo {
     const char *name;
     void (*initfn)(Object *obj);
@@ -57,12 +52,6 @@ struct ARMCPUClass {
     ResettablePhases parent_phases;
 };
 
-
-#define TYPE_AARCH64_CPU "aarch64-cpu"
-typedef struct AArch64CPUClass AArch64CPUClass;
-DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
-                       TYPE_AARCH64_CPU)
-
 struct AArch64CPUClass {
     /*< private >*/
     ARMCPUClass parent_class;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..52ac99cad3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef ARM_CPU_H
-#define ARM_CPU_H
+#ifndef TARGET_ARM_CPU_H
+#define TARGET_ARM_CPU_H
 
 #include "kvm-consts.h"
 #include "qemu/cpu-float.h"
@@ -26,6 +26,7 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#include "hw/arm/cpu.h"
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
@@ -2853,11 +2854,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
-#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
-#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
+#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
 #define cpu_list arm_cpu_list
 
-- 
2.38.1
