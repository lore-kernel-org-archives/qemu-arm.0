Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599731lfo;
        Sun, 31 Jan 2021 03:51:10 -0800 (PST)
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr13072522wry.184.1612093870061;
        Sun, 31 Jan 2021 03:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093870; cv=none;
        d=google.com; s=arc-20160816;
        b=UHGK9yWXlbLLiuMHfdmFGsf0hTo9q6Rkf3d1zFW4CWHC09xqS5B+2ndRa3upmXhHJR
         ZmXfKDc7IWYeh0fS4kh7gI4XKRdp0SncfaPBv4fnDOz5CL/NKNzKC8mo0RounZAqggfx
         wMHgPQB/Svu742mLKU7R8CnUdjH6S0tBDnBjJguqxZkWod87ZyoSWsjUq6ArhvP5Th+x
         UfE/E3veDmxWkwzekPrg0WxzIOfP+4t+fOquOQ0/XUVW8fD8JMj8eoqu0rg5SjskCL5p
         d66M+sz/nLqRpJdZHP6jx45vatj5eetnGd+gdKZOp4k8c7DBeUb8Jrv7/cT3eWX6cR4b
         5r+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9aLdl19C96C3GXRdvC9mwI7cbyJbYzl+Xi4/pdqV71I=;
        b=wre5/GYWTZZBorRVo6T1bmKdYNxWaVk31WdiX8S/l4+/pip890HC04sNy9Zw59BzNI
         FiGkJNVChchrc4F1pkuWSUGrRp6io0sQBpjWBI0sTVFRVtTHwCS0DkHr9LpWvw4RwWAH
         WWgXprZisanEqgG4N/2gp2rC7/HzDoIjbm7iVgS4IlrbYCNAuY9nh0RTR3OMUAwUciQA
         EW3s3tmuQQ0ay/uv0wwuMH6aWH/G2A29jyhQaXnduqXjkzXvaSqdn7oXuQH6J437tcHH
         RM7qh/Khj7LeMshNywIHmTihtQpGq+sd9gxzsfG6b+2lnYyy14a0e5gl8VT1ijv9UGIb
         7sLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sRiuwmAL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18sor6851841wmk.27.2021.01.31.03.51.09
        (Google Transport Security);
        Sun, 31 Jan 2021 03:51:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sRiuwmAL;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9aLdl19C96C3GXRdvC9mwI7cbyJbYzl+Xi4/pdqV71I=;
        b=sRiuwmALg9U8wrF+nK7mVUs+HXcy3GG/kZwoT3Ky0fRx9392Xk6PlerBKMECc3uHhq
         +yEZaCAi2myKtOwXsL10XN5dYu8Q4lK7UBTHJ3cMuwjgLxM9+XSiRL3YrTJPe0l8/a/u
         h+naApUI8PLoHdg3NlxtwFO6hG3iOnqc8AADrzk3ryeB4Xm5F4S0d8qwaf5oc8cZ5hAR
         YgxVZapFmkxXd0HX5bwBqbhZkgHKgaJzj/4J7yPtjueODMnIOooBfdV/qgcFB8zCxzv5
         EUR/LB1cNPPQXtqQGokgkIe/EGWziL1d1OtZbsb2cxJwAnHXJ/H+ySW/Hl2kSIvnb2Es
         KUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=9aLdl19C96C3GXRdvC9mwI7cbyJbYzl+Xi4/pdqV71I=;
        b=MHUUim1f+K6CDTicmz6iAPqpZY/faPL7Dmn9gqXsR0OfsYDnmOm0e/BRmGIXRSzYqz
         zqCL0TIQTNJj6EmaxiaCgtCReP4vHy1wq8TqAVvuXj0seNyin1YNav5MB+p0i8iUY8jF
         H+MSshC/6nqLRzv5sgAR+2Bcd16t440RO+DNTvhhmFyOvu6r15n7/wx8zZMUy+K3Q7PY
         gWiCmgYLRxjUG7I1OPIzEbVzplHyhSXpmsviqB/l0egDED+P1YBI7kkirD42wC2EZuLH
         amvcXDJ4ucby6Mz+/HjPRkw8ot3T0Yw1IhOYutesmCJkXgxLiVaGqxWJQYCANIazv9u1
         wvag==
X-Gm-Message-State: AOAM5311bOKb8E+k2SV2EkIrruiBiHaZABU5cSGkihoVH/Y4UeOIfyc5
	kID9R9PPjGsYBEeQxQipeyM=
X-Google-Smtp-Source: ABdhPJwEOUHvqTzGHiWAoaq4Jn7Z8VpdizCzuGier0I9RK/FHNRiq3u4Ge8nQolOUjmT1NuInZpoKw==
X-Received: by 2002:a05:600c:4f48:: with SMTP id m8mr1541406wmq.12.1612093869810;
        Sun, 31 Jan 2021 03:51:09 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id c62sm3325143wme.16.2021.01.31.03.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:51:09 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 08/11] target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
Date: Sun, 31 Jan 2021 12:50:19 +0100
Message-Id: <20210131115022.242570-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dB6+VvTkRVJk

From: Thomas Huth <thuth@redhat.com>

We've already got the CONFIG_ARM_V7M switch, but it currently can
not be disabled yet. The m_helper.c code should not be compiled
into the binary if the switch is not enabled. We also have to
provide some stubs in a separate file to make sure that we still
can link the other code without CONFIG_ARM_V7M.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190903154810.27365-4-thuth@redhat.com>
[PMD: Keep m_helper-stub.c but extend it, rewrite the rest]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Rewrite since v3, therefore removed Richard R-b tag.
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.h           | 12 -------
 target/arm/cpu_tcg.c       |  4 ++-
 target/arm/helper.c        |  7 ----
 target/arm/m_helper-stub.c | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build     |  4 ++-
 5 files changed, 79 insertions(+), 21 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d080239863c..0bd0e51e498 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2281,12 +2281,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 /* Interface between CPU and Interrupt controller.  */
 #ifndef CONFIG_USER_ONLY
 bool armv7m_nvic_can_take_pending_exception(void *opaque);
-#else
-static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
-{
-    return true;
-}
-#endif
 /**
  * armv7m_nvic_set_pending: mark the specified exception as pending
  * @opaque: the NVIC
@@ -2392,13 +2386,7 @@ int armv7m_nvic_raw_execution_priority(void *opaque);
  * @secure: the security state to test
  * This corresponds to the pseudocode IsReqExecPriNeg().
  */
-#ifndef CONFIG_USER_ONLY
 bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure);
-#else
-static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
-{
-    return false;
-}
 #endif
 
 /* Interface for defining coprocessor registers.
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98544db2df3..3e1c9b40353 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -15,6 +15,7 @@
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
 
+#ifndef CONFIG_USER_ONLY
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
@@ -38,6 +39,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return ret;
 }
+#endif /* CONFIG_USER_ONLY */
 
 static void arm926_initfn(Object *obj)
 {
@@ -666,9 +668,9 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 #ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
+    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 #endif
 
-    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 47e266d7e64..fe3d0291f9c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12825,13 +12825,6 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
diff --git a/target/arm/m_helper-stub.c b/target/arm/m_helper-stub.c
new file mode 100644
index 00000000000..6d751424e86
--- /dev/null
+++ b/target/arm/m_helper-stub.c
@@ -0,0 +1,73 @@
+/*
+ * ARM V7M related stubs.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "internals.h"
+
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    g_assert_not_reached();
+}
+
+uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
+{
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
+{
+    g_assert_not_reached();
+}
+
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    g_assert_not_reached();
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
+{
+    g_assert_not_reached();
+}
+
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    g_assert_not_reached();
+}
+
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    g_assert_not_reached();
+}
+
+#ifndef CONFIG_USER_ONLY
+
+bool armv7m_nvic_can_take_pending_exception(void *opaque)
+{
+    g_assert_not_reached();
+}
+
+void arm_v7m_cpu_do_interrupt(CPUState *cs)
+{
+    g_assert_not_reached();
+}
+
+#endif /* CONFIG_USER_ONLY */
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 15b936c1010..6c6081966cd 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -21,7 +21,6 @@
   'gdbstub.c',
   'helper.c',
   'iwmmxt_helper.c',
-  'm_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
@@ -32,6 +31,9 @@
 ))
 arm_ss.add(zlib)
 
+arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
+arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
+
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
-- 
2.26.2
