Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp712142wrp;
        Sat, 21 Sep 2019 08:05:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCk3QZtabhgQbOIM4Y+2ufAE5F0HHi79cMAN2j+tEVNOsbNS/75stMMO5+m/WCtrX+nIET
X-Received: by 2002:a17:906:d216:: with SMTP id w22mr23657412ejz.14.1569078315734;
        Sat, 21 Sep 2019 08:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569078315; cv=none;
        d=google.com; s=arc-20160816;
        b=JdmN/H/5e1qWa1QX+nISBYrP76J0wDO25aJGl0IKmsafPzuh0zwrgcX7+zYxyiE52w
         0QANrOxOcpFWEC+VEtePRS9KuJbGPMNpTJsFNC21utlrSu5rFpYS5npuQEPIKpDwD3er
         HQ8FQ9GQeRK6/UlyUsNQVep/SFDHJG2I5Cb6eaDkbEuXUfqW4VsmTtxRb84mMM2wEZfY
         rYfu6Lbr8TFpcAXkk+mFcMbajQoJFwQC4v2TKvknUbud7sZFEgpfJoBVmSJpLO8LMoDB
         8yRGt4XxbBWW3SXkX6Nfw1/1L+FrqiMcVpi5uNpPHPJGfD30Wb73tlMsx+8xT3x2C/+z
         UA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=1Ord4hq0McIiSyIY/RPxMwmTzmN/Tl35umNHpn/Wb/Q=;
        b=PlSZO1Ikz/96iv5TQNrsfqlPr23KoUu82522hvRLfVGqzrokRrp32ztyiEJMFfW6aM
         4H2xtTYRmzeiZPKkBJmsiM1EB58k8fJk7G60DqpBwHW1axZHnEUj1EKlILV0v1uORBNX
         YhDrEuxBJz8xzZ/3gDvclyDZ4uAvbClJ+mUBbYOuU0LMDU+d+sDLurMOwM9gnKKJKdwJ
         Hf30iHqg+XjKIbVXqrCBa0sBVCDBuBIBxozb6KIRSl57Q13dm/nPH4AVGRMEKYHCrcGr
         Tm+yD6YCDvuRXsoQGhKfd8nCcVIwVslHAW7AihApGkZZCgK6lCsviF9W9CyKu9B5hhth
         1UXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b35si3348907edb.204.2019.09.21.08.05.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 08:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBgwk-0004ei-62
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 11:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iBgw3-0004KF-Pc
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iBgw2-0003D2-H1
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 11:04:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iBgw2-0003Cr-A5; Sat, 21 Sep 2019 11:04:30 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87CF23082B45;
 Sat, 21 Sep 2019 15:04:29 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16C1160920;
 Sat, 21 Sep 2019 15:04:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/4] target/arm: Make cpu_register() and set_feature()
 available for other files
Date: Sat, 21 Sep 2019 17:04:17 +0200
Message-Id: <20190921150420.30743-2-thuth@redhat.com>
In-Reply-To: <20190921150420.30743-1-thuth@redhat.com>
References: <20190921150420.30743-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Sat, 21 Sep 2019 15:04:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bjm2r/G+nzQu

Move the common set_feature() and unset_feature() functions from cpu.c and
cpu64.c to internals.h, and make cpu_register() (renamed to arm_cpu_register())
available from there, too, so we can register CPUs also from other files
in the future.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/arm/cpu.c       | 20 ++------------------
 target/arm/cpu64.c     | 17 +----------------
 target/arm/internals.h | 18 ++++++++++++++++++
 3 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 2399c14471..f1f9eecdc8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -614,16 +614,6 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 
 #endif
 
-static inline void set_feature(CPUARMState *env, int feature)
-{
-    env->features |= 1ULL << feature;
-}
-
-static inline void unset_feature(CPUARMState *env, int feature)
-{
-    env->features &= ~(1ULL << feature);
-}
-
 static int
 print_insn_thumb1(bfd_vma pc, disassemble_info *info)
 {
@@ -2515,12 +2505,6 @@ static void arm_max_initfn(Object *obj)
 
 #endif /* !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64) */
 
-struct ARMCPUInfo {
-    const char *name;
-    void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
-};
-
 static const ARMCPUInfo arm_cpus[] = {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
     { .name = "arm926",      .initfn = arm926_initfn },
@@ -2681,7 +2665,7 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 }
 
-static void cpu_register(const ARMCPUInfo *info)
+void arm_cpu_register(const ARMCPUInfo *info)
 {
     TypeInfo type_info = {
         .parent = TYPE_ARM_CPU,
@@ -2722,7 +2706,7 @@ static void arm_cpu_register_types(void)
     type_register_static(&idau_interface_type_info);
 
     while (info->name) {
-        cpu_register(info);
+        arm_cpu_register(info);
         info++;
     }
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d7f5bf610a..5239ba5529 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "internals.h"
 #include "qemu/module.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
@@ -29,16 +30,6 @@
 #include "kvm_arm.h"
 #include "qapi/visitor.h"
 
-static inline void set_feature(CPUARMState *env, int feature)
-{
-    env->features |= 1ULL << feature;
-}
-
-static inline void unset_feature(CPUARMState *env, int feature)
-{
-    env->features &= ~(1ULL << feature);
-}
-
 #ifndef CONFIG_USER_ONLY
 static uint64_t a57_a53_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
@@ -396,12 +387,6 @@ static void aarch64_max_initfn(Object *obj)
     }
 }
 
-struct ARMCPUInfo {
-    const char *name;
-    void (*initfn)(Object *obj);
-    void (*class_init)(ObjectClass *oc, void *data);
-};
-
 static const ARMCPUInfo aarch64_cpus[] = {
     { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
     { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 232d963875..e71196ed5f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1046,4 +1046,22 @@ void arm_log_exception(int idx);
 
 #endif /* !CONFIG_USER_ONLY */
 
+static inline void set_feature(CPUARMState *env, int feature)
+{
+    env->features |= 1ULL << feature;
+}
+
+static inline void unset_feature(CPUARMState *env, int feature)
+{
+    env->features &= ~(1ULL << feature);
+}
+
+struct ARMCPUInfo {
+    const char *name;
+    void (*initfn)(Object *obj);
+    void (*class_init)(ObjectClass *oc, void *data);
+};
+
+void arm_cpu_register(const ARMCPUInfo *info);
+
 #endif
-- 
2.18.1

