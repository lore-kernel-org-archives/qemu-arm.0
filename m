Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986376lfq;
        Tue, 29 Sep 2020 15:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzakRVZghsLc6U1AsW5kI390l2xAzLG7LES1FuniDdaK0R3FhDFfXRtXEXA7blVGFueOmU6
X-Received: by 2002:a17:906:af53:: with SMTP id ly19mr5953235ejb.503.1601419490014;
        Tue, 29 Sep 2020 15:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419490; cv=none;
        d=google.com; s=arc-20160816;
        b=mAC2Bs3A45gGz4UrI0PYd9g+eSIpeZrCO+iG8kzeK4ZY2kPhr6DpqgAbGl9kfxY5E8
         twBuej7CRNuFvXNKZChb5X9S4WP9JiRz7CNGlu7iG5B7YUJaU+lWH275DOwc+6Dp6+n0
         I5jFHk4GBgsKWlliVDv6nTzz3vHNkEaEt6liH7HJKZqgyolfYdHTXnk7gH7hFeqdgCgJ
         xmRHyRrjsUNlt6XU1swrC0xWVBJMxygFkLj8LudLI9YEHmCLD46xxEJitFSS8U8ifdJX
         Hx1evP3eQlb3Z5QsO7ChI6gMo96BaHepPcp3r5rBwFP0Az5PIa7hop2kIa7/kVSGkzTy
         eG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p7uLIKQXb5D6cyBHRbAjul4kYmamhdwITN6LVBpYWc0=;
        b=UFFsg/scrrip+3Yn7jI+5tooQUyqdgfBjRFet52yBsHfTO8kuosWliKjrgjU/v6fIp
         rS35jtFBCiV4wekUJdP57rIqVGWhLc96WjwSveET2Ky1XVGINXQs2bZzmvq71hd6BFKW
         IFtIPP/hGF7OB8CmcVrBtZJom37YI5pl2X7aLfdMJaxOPsC1VpRtRGoOnRDJrd5dPeon
         5TMs+TIFmH3FmEw6FbJhXgx5Q+srWQwa0ReOKXRFW1mzhRIXIDPgowqpzwwCjkWXjpVE
         j3wnTrdOa+boWab0ufgwIGnJP7SwJ/KtHBfPYm47CcFnkFMiVdfkeHNC0jmne5zny3w6
         ffEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=axBcAQaa;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r17si3584666ejx.452.2020.09.29.15.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=axBcAQaa;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7uLIKQXb5D6cyBHRbAjul4kYmamhdwITN6LVBpYWc0=;
	b=axBcAQaa1krl7wzEP495/zfuF8S1n/nYosJqWTKwM0myUN2qXhbXzb9WcRI00tU0I7PLBn
	MTx2GO4Khk+EhWDEJhiIpXiGjvz4jyNfNKqDpWuOjoB+G2W0Sf5OzwuzXrJH2CxJsTamAp
	0si2w7Hyw5KHFq2jrXorJn5goxJ6eME=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-HC62kJclO_2_fZk0BH5Geg-1; Tue, 29 Sep 2020 18:44:45 -0400
X-MC-Unique: HC62kJclO_2_fZk0BH5Geg-1
Received: by mail-wm1-f72.google.com with SMTP id u5so2420501wme.3
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7uLIKQXb5D6cyBHRbAjul4kYmamhdwITN6LVBpYWc0=;
        b=cmp3SuNswKLnrKgJu938OY5DXHDfml0nuT3HweRxi/w9vr1FUaIRKe8RKLfFcHC0fZ
         7Kkr65nHNAdsZdJoB7gfvXDmpgCeSKQKRmQx414KYlvYbz2GLre7/ax9wuw2aJwPbkmA
         uxyAbr+38MHH9b/mg8sB0GvISZrDbqTG9PHCAVRI3xlbtw945Kc6YmPIjoVL/+Lnqaqz
         0niGdReFLCHVl3QjsAzl19eQd1Wvcw/30FkhtzGmrBjTkuEv4vxm/OHmH6C4qrpilZPQ
         8jnPJsuBbHJk3jJMGZ7eE7lcUeoh7C44/LAz8BmxJJ7YSZabe6DTHEZVlKEuE8vI5lqa
         +ZZQ==
X-Gm-Message-State: AOAM5335KkgnSlF0QSmkCFc7DbXO+8KTTA0NLJc81fLeAnnhOMS5KtFS
	ObFUWZY/xf0HQu9KG3nV/Rigq/Ka2C/MlK7MblRLMhc5Fezygj24i/gY0wQ66aRLMo0Tg4mvZSK
	AgjbTRscrbK4V1d9q
X-Received: by 2002:a1c:7215:: with SMTP id n21mr7195516wmc.154.1601419483962;
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
X-Received: by 2002:a1c:7215:: with SMTP id n21mr7195501wmc.154.1601419483746;
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id 70sm7516873wme.15.2020.09.29.15.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 09/12] target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
Date: Wed, 30 Sep 2020 00:43:52 +0200
Message-Id: <20200929224355.1224017-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: GDlnylXqdomc

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
---
 target/arm/cpu.h           | 12 -------
 target/arm/cpu_tcg.c       |  4 ++-
 target/arm/helper.c        |  7 ----
 target/arm/m_helper-stub.c | 73 ++++++++++++++++++++++++++++++++++++++
 target/arm/meson.build     |  4 ++-
 5 files changed, 79 insertions(+), 21 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6036f61d60..c5f4c1b181 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2117,12 +2117,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
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
@@ -2228,13 +2222,7 @@ int armv7m_nvic_raw_execution_priority(void *opaque);
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
index 00b0e08f33..563b0e82bc 100644
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
@@ -602,9 +604,9 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 #ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_v7m_cpu_do_interrupt;
+    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
 #endif
 
-    cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 88bd9dd35d..5196a17bdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12653,13 +12653,6 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
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
     if (arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/m_helper-stub.c b/target/arm/m_helper-stub.c
new file mode 100644
index 0000000000..6d751424e8
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
index f5de2a77b8..f6a88297a8 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -21,7 +21,6 @@ arm_ss.add(files(
   'gdbstub.c',
   'helper.c',
   'iwmmxt_helper.c',
-  'm_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
@@ -30,9 +29,12 @@ arm_ss.add(files(
   'vfp_helper.c',
   'cpu_tcg.c',
 ))
+arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('m_helper.c'), if_false: files('m_helper-stub.c'))
+
 arm_ss.add(zlib)
 
 arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
+arm_ss.add(when: 'CONFIG_TCG', if_false: files('m_helper-stub.c'))
 
 arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
 
-- 
2.26.2
