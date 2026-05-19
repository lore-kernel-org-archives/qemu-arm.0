Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65993CD5BAB
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:48:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLjb-0002GM-AI; Tue, 19 May 2026 10:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjY-0001uc-SD
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjW-00084B-EE
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so40061765e9.3
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202065; x=1779806865; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2B+NBXajc/QmvN9GPFw1CKwqetwZlIhbn6ldsGmgu/E=;
 b=Dj07LmIbCiuErAxqe/N4LmkWIbl+WDqv/+uBUgWuvcKsl5H11LXMlZjUAcxd0/MGBF
 5GwtfKtxx5KZIT8+wnUFFMRBIBbR9HPcjZIUPYzgOGlZiY4wCIjZGwfkOXXyRbaPAExG
 7DDlfAQctOubCoXotZpBnzPBcyxyXxrWylSjNn6cB+KiYHheTivNeX5ll3jQ20X3tpYv
 8axUp/L/uuo05gjdZJ/5C71mLI/7EyAyfCT7NV6Rb3lgM9G3lRMS7b6uKF3O77ekMYLh
 enFI+Pai09enHQnnRUX7tVf+N4EzcOPXcSVe+QzQw7YDoYdOC0Hxf9nmrvZcvqqAsTM3
 5qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202065; x=1779806865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2B+NBXajc/QmvN9GPFw1CKwqetwZlIhbn6ldsGmgu/E=;
 b=OuHjhdr9X8fcgLDyyI3Ub0q5ewMvuZ4n5awc4TYZ3OGWIXlfLsP9bkoHnnky8+3xNh
 I6el4rTYhouNviZEO1f3aY4BUU4h54DEJMZkAhP2ddjykcIhLqcC4cKoius5jDUZ9GuB
 guTmLA0m5ZGSJZkSAC9X/As/sAr0F5LL8YPC15hV4MeCB4R93iTi4sNUj+uRywvoK6dX
 F/kOrFTynWsnvgoNIvFvhynR6d9MesCz5+q4q7dpL1u1qkSwpGga0Myuyndvw0nmFN5B
 Zms/VKLd3yXp3cjrpWSVC7k3p/NwnNjeTLovJgQPQzOiOK6BzvJCTYBs5p2b8n4cLTO7
 Aoxw==
X-Gm-Message-State: AOJu0YyFcTXqjC01WiqEqIBLSRJfELo2B79GnpY7+smP5Hr9bDX/asVL
 e/YVeytB7BqkVHhX2StmxMBvhgf+oz6vC6zMMAOFmbd5FT+ME0h0+I7w4KgWCA6EC/cQBIW4C7f
 klMqaL08=
X-Gm-Gg: Acq92OF+3ssa+Qas1SG+WuyblHcUCfNziu5WPFgtaYSLWtEYexiWdsI6Qw6UCflgc/2
 LTSG4R5YiERtyscxZSfKHZPOF8R3B7bKbpP2n1LK0RXMjImFj40RC9JY+g6Gf8eh9x/04HNSkV9
 Wgb5q9y3Y+hYxCguZD1UKKagaVR3HfwNZ3KINUT6cmWNFsos3+keHIfu3BXxCcCr9QdmJIfkavh
 l8hcKLaastJBq21Zmo0KVKiUjjLWwomJt9Kxn2uzPiEOR68C0Inhofm4cZKIYyEOnPHBpT/fG5/
 K1mqtU268FfFSBwQfj5B4H5WNkEZ47cvHz7+JxqdNupCLhi8S/DfHa5Lin+BxvRPpJ1ILtJF5Ik
 /x9m9Uo2TEwVVaBGmekZ4g//XGdjIVUOKeDb3pi6h/Nnl5k6Q42p6kXXmgGlY0HGZZSnqLimiLL
 f17j/v2CoRXjddtC4cXxePPkF4/KcE9p7KPE1F22WcqOmo/fqftgTkSboCILie84ydSKEXRI5aZ
 Ajve/00U9g=
X-Received: by 2002:a05:600c:4692:b0:48a:592c:e632 with SMTP id
 5b1f17b1804b1-48fe6325f18mr318049835e9.16.1779202064513; 
 Tue, 19 May 2026 07:47:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c834besm353962775e9.3.2026.05.19.07.47.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:47:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 16/18] target/arm: Define 'max' CPU type in cpu-max.c
Date: Tue, 19 May 2026 16:45:51 +0200
Message-ID: <20260519144553.91483-17-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rather than having the 32-bit 'max' CPU type defined in
cpu32.c and the 64-bit counter part in cpu64.c, unify the
code in a single place in cpu-max.c. Define stubs for
aarch64_host_initfn() and aarch64_max_tcg_initfn() in the
32-bit binary.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/internals.h   |  1 +
 target/arm/cpu-max.c     | 65 ++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c       | 21 +------------
 target/arm/tcg/cpu32.c   | 29 ------------------
 target/arm/tcg/stubs32.c | 10 +++++++
 5 files changed, 77 insertions(+), 49 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c95f3d63138..ccada1c9018 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1759,6 +1759,7 @@ void aarch64_add_pauth_properties(Object *obj);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
 void aarch64_aa32_a57_init(Object *obj, bool aa32_only);
+void aarch64_host_initfn(Object *obj);
 
 /* Return true if the gdbstub is presenting an AArch64 CPU */
 static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 6fc54ebe74e..8cf8edc6535 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -8,7 +8,10 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "system/hw_accel.h"
 #include "system/kvm.h"
+#include "system/qtest.h"
+#include "system/tcg.h"
 #include "target/arm/internals.h"
 #include "target/arm/cpregs.h"
 
@@ -178,3 +181,65 @@ void aa32_max_features(ARMCPU *cpu)
 
     FIELD_DP32_IDREG(isar, ID_DFR1, HPMN0, 1);         /* FEAT_HPMN0 */
 }
+
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
+ * this only needs to handle 32 bits, and need not care about KVM.
+ */
+static void cpu_max_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+#ifdef TARGET_AARCH64
+    const bool aarch64_enabled = true;
+#else
+    const bool aarch64_enabled = false;
+#endif /* !TARGET_AARCH64 */
+
+    if (hwaccel_enabled()) {
+        assert(aarch64_enabled);
+        /*
+         * When hardware acceleration enabled, '-cpu max' is
+         * identical to '-cpu host'
+         */
+        aarch64_host_initfn(obj);
+        return;
+    }
+
+    if (tcg_enabled() || qtest_enabled()) {
+        aarch64_aa32_a57_init(obj, !aarch64_enabled);
+    }
+
+    if (!aarch64_enabled) {
+        aa32_max_features(cpu);
+#ifdef CONFIG_USER_ONLY
+        /*
+         * Break with true ARMv8 and add back old-style VFP short-vector
+         * support. Only do this for user-mode, where -cpu max is the default,
+         * so that older v6 and v7 programs are more likely to work without
+         * adjustment.
+         */
+        cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+#endif
+    } else if (tcg_enabled()) {
+        assert(aarch64_enabled);
+        /*
+         * '-cpu max' for TCG: we currently do this as
+         * "A57 with extra things"
+         */
+        aarch64_max_tcg_initfn(obj);
+    }
+}
+
+static const ARMCPUInfo arm_max_cpu = {
+    .name = "max",
+    .initfn = cpu_max_initfn,
+};
+
+static void arm_max_cpu_register_types(void)
+{
+    arm_cpu_register(&arm_max_cpu);
+}
+
+type_init(arm_max_cpu_register_types)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 499d154dace..28167355773 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -791,7 +791,7 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
 }
 #endif
 
-static void aarch64_host_initfn(Object *obj)
+void aarch64_host_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
@@ -818,28 +818,9 @@ static void aarch64_host_initfn(Object *obj)
     }
 }
 
-static void aarch64_max_initfn(Object *obj)
-{
-    if (hwaccel_enabled()) {
-        /* When hardware acceleration enabled, '-cpu max' is identical to '-cpu host' */
-        aarch64_host_initfn(obj);
-        return;
-    }
-
-    if (tcg_enabled() || qtest_enabled()) {
-        aarch64_aa32_a57_init(obj, false);
-    }
-
-    /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-    if (tcg_enabled()) {
-        aarch64_max_tcg_initfn(obj);
-    }
-}
-
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
-    { .name = "max",                .initfn = aarch64_max_initfn },
 #if defined(CONFIG_KVM) || defined(CONFIG_HVF) || defined(CONFIG_WHPX)
     { .name = "host",               .initfn = aarch64_host_initfn },
 #endif
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index a2f730451fb..8220d785f5b 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -711,32 +711,6 @@ static void sa1110_initfn(Object *obj)
     cpu->reset_sctlr = 0x00000070;
 }
 
-#ifndef TARGET_AARCH64
-/*
- * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
- * this only needs to handle 32 bits, and need not care about KVM.
- */
-static void arm_max_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    /* Cortex-A57 advertising none of the aarch64 features */
-    aarch64_aa32_a57_init(obj, true);
-
-    aa32_max_features(cpu);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * Break with true ARMv8 and add back old-style VFP short-vector support.
-     * Only do this for user-mode, where -cpu max is the default, so that
-     * older v6 and v7 programs are more likely to work without adjustment.
-     */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-#endif
-}
-#endif /* !TARGET_AARCH64 */
-
 static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm926",      .initfn = arm926_initfn },
     { .name = "arm946",      .initfn = arm946_initfn },
@@ -760,9 +734,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "ti925t",      .initfn = ti925t_initfn },
     { .name = "sa1100",      .initfn = sa1100_initfn },
     { .name = "sa1110",      .initfn = sa1110_initfn },
-#ifndef TARGET_AARCH64
-    { .name = "max",         .initfn = arm_max_initfn },
-#endif
 };
 
 static void arm_tcg_cpu_register_types(void)
diff --git a/target/arm/tcg/stubs32.c b/target/arm/tcg/stubs32.c
index 3945dc49e5e..78f819ef6ff 100644
--- a/target/arm/tcg/stubs32.c
+++ b/target/arm/tcg/stubs32.c
@@ -22,3 +22,13 @@ void aarch64_translate_code(CPUState *cs, TranslationBlock *tb,
 {
     g_assert_not_reached();
 }
+
+void aarch64_host_initfn(Object *obj)
+{
+    g_assert_not_reached();
+}
+
+void aarch64_max_tcg_initfn(Object *obj)
+{
+    g_assert_not_reached();
+}
-- 
2.53.0


