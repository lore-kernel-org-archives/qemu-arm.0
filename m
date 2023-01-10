Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316844ejc;
        Tue, 10 Jan 2023 08:44:43 -0800 (PST)
X-Received: by 2002:a05:600c:3b95:b0:3d9:baf2:315b with SMTP id n21-20020a05600c3b9500b003d9baf2315bmr22057068wms.11.1673369083294;
        Tue, 10 Jan 2023 08:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369083; cv=none;
        d=google.com; s=arc-20160816;
        b=A6CXzrHcdox6Yvyaml0tZxaWiQuIVq+bIYGB+e78mYKUdwP4Y97l0OYpVVsR/Dt8YT
         Z8B+UlQqTJiuo/vJ+4mmU7vDO9e3mfAfpZEYcSlHmxEy9YBckXEE7HGFeSHNvI6gEZo4
         LpHVmwGIhl0IsltWI5EoPi5K9oEcy6zyF2IVo5FbYv3sRp1cGzjEvfRzqBV1zHPS1wvI
         UoYK17ldv7nZJS1ZttuwVrrEFshbPupb3ainp21wgnctqvIw0dD/tMdxivwDjF6tALWf
         SXbmYUwur4CjHDxt6/O2ewDWoi1ppDG/8lv++9mni5HNkUAgFlqnXTdnOYVHJUNkG1mN
         0lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QOYDxSc6OXbzkAgjy4QYJseOLob50f8TeLldg9E4I/c=;
        b=BeLNSliSYlMcJKvUX5vESGPpiJBJdFuZU2AFCVHrUXvXFwoXMFyRsvmvFZ+2pw+WNd
         jJ/f8kIgNKt1M2+/tWBRLvRl6b3mFYHKL7Eb5ruS/TAbrUNKt9GVyPrarh9eiuHa4H2u
         2WzSGnuhEtEkyqo/0P+CCEFKPSElSkN8xuNCeExAmGR8iIz9EXsnh4PLlwal9AY4XrPQ
         Kx7QhFK4ieBqNgmvr3CceJPaHuJ0vh0uNBEo14PCS3VFYe7Iemmmsb5UXY3CgUu2tW5P
         pYOkHnflPb+NEgF5D62uzuiZD3n6XXhaeMf0t4I1Dkc+yABNx5zw1vMpqRBcxyJ3KUaJ
         OxcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmsiWHbe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z17-20020a05600c221100b003da01357357sor141501wml.25.2023.01.10.08.44.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KmsiWHbe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOYDxSc6OXbzkAgjy4QYJseOLob50f8TeLldg9E4I/c=;
        b=KmsiWHbeYo5WOPbJFMJP76T1tNWPGlZ4g1u5VBJ5+WJzyF+11Kam075gcfhp8+kjy6
         Z+ypXL8JuBBJWANd+TEay96n4x4on/bo8wo/z2PqGB2ko0+DqWmpIOiIDHSpOk/uEUlv
         uIWBdVci61nIhC5Cxc0jeuwKV9fUFNC7qDm1uAS5bk+6WEy2+QBKdtU5P3HM0sLDWNtL
         XG5hVc3aODiZazXjqsmkKSE9ZapAqws+2PMerBdlmxrN5iAmJh5JahFofYd8gU7Mzd1W
         bb08n47gOplHEYsfyUyPdykU4piOnW534o8kz/hEQR+0xmkdEX3BGLsFz3opZlPxQerd
         ZJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOYDxSc6OXbzkAgjy4QYJseOLob50f8TeLldg9E4I/c=;
        b=dv42KcB3Z576QU3BI4/+XcNT/Z09/b5T+jOocmeo2KUq0ONAtxPxqMaFyDC1eZI38y
         iWCK0bBkzql+RvvvkfKLg6PWjKq0OWxF3jvbzmmy/wypdGjEIYzF41Hi4GxAbmRxhTvm
         uix/mlmaR9hBx7SIpckroBo8CwJEzANbvMmEtHCp2MW0MEPnBMu9lt+/BPIEIdQdKNU5
         tFNvV3IdxuDrr584DyCRm7WxnlAYykST6QYOHvCBghmXOVQtrBeunhQXBwlUHoaIgE2F
         xaw/sYs71Nyf0JGZqCYY3AIdbeqeeQpVsCV/8muvHcgQcWP3s89yLaFM8DUaxwaDeZmK
         JrgQ==
X-Gm-Message-State: AFqh2kqMyt53lmocmoRNm8DY1nROvHNBcQTlXGuVaJCLUcHbE2+0T7UI
	gjtIZBF8h4eif5svc5B0XZWsnukf
X-Google-Smtp-Source: AMrXdXtYMrNcBbh3J2bgiIa2fBytAr2H6aM05PHZEjqii8DZA8K6iWRff02yTT7Cxi2LWHNaGkvIeg==
X-Received: by 2002:a05:600c:4f08:b0:3d9:efd1:214d with SMTP id l8-20020a05600c4f0800b003d9efd1214dmr6194442wmq.25.1673369083044;
        Tue, 10 Jan 2023 08:44:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm20873245wmc.13.2023.01.10.08.44.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:42 -0800 (PST)
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
Subject: [PATCH 06/18] target/arm: Move CPU definitions consumed by HW model to "hw/arm/cpu.h"
Date: Tue, 10 Jan 2023 17:43:54 +0100
Message-Id: <20230110164406.94366-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DLZ4Mt8QfY+c

Units including "target/arm/cpu.h" can't be built once via meson's
softmmu_ss[] source set. Since this header depends on specific
definitions such the word size (32 or 64-bit), for ARM such units
must go to the per-target arm_ss[].

We want to expose few architectural definitions to hardware models.

Expose the ARM architectural definitions used by hardware models,
in order to reduce the inclusion of "target/arm/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/cpu.h | 49 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu-qom.h | 15 --------------
 target/arm/cpu.h     | 34 ------------------------------
 3 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/include/hw/arm/cpu.h b/include/hw/arm/cpu.h
index 0c5d6ca2a8..6758bffe34 100644
--- a/include/hw/arm/cpu.h
+++ b/include/hw/arm/cpu.h
@@ -25,4 +25,53 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU, TYPE_AARCH64_CPU)
 #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
 #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 
+enum QemuPsciConduit {
+    QEMU_PSCI_CONDUIT_DISABLED = 0,
+    QEMU_PSCI_CONDUIT_SMC = 1,
+    QEMU_PSCI_CONDUIT_HVC = 2,
+};
+
+/* Meanings of the ARMCPU object's four inbound GPIO lines */
+#define ARM_CPU_IRQ 0
+#define ARM_CPU_FIQ 1
+#define ARM_CPU_VIRQ 2
+#define ARM_CPU_VFIQ 3
+
+#define GTIMER_PHYS     0
+#define GTIMER_VIRT     1
+#define GTIMER_HYP      2
+#define GTIMER_SEC      3
+#define GTIMER_HYPVIRT  4
+#define NUM_GTIMERS     5
+
+/* For M profile, some registers are banked secure vs non-secure;
+ * these are represented as a 2-element array where the first element
+ * is the non-secure copy and the second is the secure copy.
+ * When the CPU does not have implement the security extension then
+ * only the first element is used.
+ * This means that the copy for the current security state can be
+ * accessed via env->registerfield[env->v7m.secure] (whether the security
+ * extension is implemented or not).
+ */
+enum {
+    M_REG_NS = 0,
+    M_REG_S = 1,
+    M_REG_NUM_BANKS = 2,
+};
+
+#define ARM_AFF0_SHIFT 0
+#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
+#define ARM_AFF1_SHIFT 8
+#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
+#define ARM_AFF2_SHIFT 16
+#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
+#define ARM_AFF3_SHIFT 32
+#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
+#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
+
+#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
+#define ARM64_AFFINITY_MASK \
+    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
+#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
+
 #endif
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index b98904b6bc..d37037e214 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -68,19 +68,4 @@ void arm_gt_htimer_cb(void *opaque);
 void arm_gt_stimer_cb(void *opaque);
 void arm_gt_hvtimer_cb(void *opaque);
 
-#define ARM_AFF0_SHIFT 0
-#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
-#define ARM_AFF1_SHIFT 8
-#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
-#define ARM_AFF2_SHIFT 16
-#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
-#define ARM_AFF3_SHIFT 32
-#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
-#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
-
-#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
-#define ARM64_AFFINITY_MASK \
-    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
-#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
-
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 52ac99cad3..ab6fdecf48 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -72,21 +72,6 @@
 #define ARMV7M_EXCP_PENDSV  14
 #define ARMV7M_EXCP_SYSTICK 15
 
-/* For M profile, some registers are banked secure vs non-secure;
- * these are represented as a 2-element array where the first element
- * is the non-secure copy and the second is the secure copy.
- * When the CPU does not have implement the security extension then
- * only the first element is used.
- * This means that the copy for the current security state can be
- * accessed via env->registerfield[env->v7m.secure] (whether the security
- * extension is implemented or not).
- */
-enum {
-    M_REG_NS = 0,
-    M_REG_S = 1,
-    M_REG_NUM_BANKS = 2,
-};
-
 /* ARM-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
@@ -107,12 +92,6 @@ enum {
 #define offsetofhigh32(S, M) (offsetof(S, M) + sizeof(uint32_t))
 #endif
 
-/* Meanings of the ARMCPU object's four inbound GPIO lines */
-#define ARM_CPU_IRQ 0
-#define ARM_CPU_FIQ 1
-#define ARM_CPU_VIRQ 2
-#define ARM_CPU_VFIQ 3
-
 /* ARM-specific extra insn start words:
  * 1: Conditional execution bits
  * 2: Partial exception syndrome for data aborts
@@ -160,13 +139,6 @@ typedef struct ARMGenericTimer {
     uint64_t ctl; /* Timer Control register */
 } ARMGenericTimer;
 
-#define GTIMER_PHYS     0
-#define GTIMER_VIRT     1
-#define GTIMER_HYP      2
-#define GTIMER_SEC      3
-#define GTIMER_HYPVIRT  4
-#define NUM_GTIMERS     5
-
 #define VTCR_NSW (1u << 29)
 #define VTCR_NSA (1u << 30)
 #define VSTCR_SW VTCR_NSW
@@ -3323,12 +3295,6 @@ static inline bool arm_cpu_bswap_data(CPUARMState *env)
 void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
                           target_ulong *cs_base, uint32_t *flags);
 
-enum {
-    QEMU_PSCI_CONDUIT_DISABLED = 0,
-    QEMU_PSCI_CONDUIT_SMC = 1,
-    QEMU_PSCI_CONDUIT_HVC = 2,
-};
-
 #ifndef CONFIG_USER_ONLY
 /* Return the address space index to use for a memory access */
 static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
-- 
2.38.1
