Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71619E9129D
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 04:24:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voDM7-0004Ju-Cq; Thu, 05 Feb 2026 23:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM5-0004In-Em
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:05 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voDM2-0003Pu-HB
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 23:22:05 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-3530e7b3dc2so1390093a91.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 20:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770351721; x=1770956521; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msDy34BXNBauha6BX6yiPrC2FkV4a2ByUqGrOK5VCFU=;
 b=r3EJKRlOfCw78gptDtHTZjogy4jUyP8Xn4K9HL1R4RQ2QGfkP+hLSlfSSL9QsGI2zH
 4hKRQX0LmtjOke669hJ5QjwLIWpKrnlTq/N31it76eFS1mSOK7VZsS6Xa5soMpqKT9EP
 VfC9hsLum2qgkZJUaTEWpynA7y/54Kto5+MVfeOo2BOTD+FZvoHAtKVeHnFS1T+RtJS8
 WWuIHl1Ie96/8WP6r9wZF1xi0aVPXFu3J83sbAscY++k9WUsIzuAMVb6H6Gyj/U2iXQQ
 Sp0QaynGsjBD+3m1jaF/qr1m8Lw54iRI15zGX12ji2ngY9tdl+hJmqK5KyLRbqyNB8Gx
 daAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770351721; x=1770956521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=msDy34BXNBauha6BX6yiPrC2FkV4a2ByUqGrOK5VCFU=;
 b=pn6wYjmFkHhWCthjdLLnZz9IV6VQDzBYpgg9L9TeUn6GQ8jnTPv/YqCLbfpyCwicS3
 7ZhqWWeyYPaVVNGgcz230sFbB/e29AvE8RW7C2DCXKbpI8kstpKpBtnVZxUTzK77Kvul
 Y3kcZJSGkGzD2FB5me5pWk2KLhx7NscApcWZOeCX2njKLXJK9XF0DTKGc+1SUKd+4isS
 PMKlch1AePocJ4L6HbPpXCV4DnAewRiyullE4DQsr90+c/CJBpQspYYeb1KeA++bymg5
 qDNxA6sM6tDa9znqXy5b0ul4NfdBucu1+yEe4+4bjwCuVCrEkKj/Z+4pwyJLhbE5vCsV
 efHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRi18cipCyiK5Lr/0KN0ulTJqbFiUOOelbJmTdGjwAPcYl9jC1ZVKLJsCzWd8mKLLU97Lre20eaw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6EpWLvDma3WF4UCTSeIDbt2d7oU7TltMQLeiaporkfyLXoR47
 BLi8w44+zR6rK+2i/n9zcWtofDCA5LA4P4Ot9zczU0WAizK0vYykPow/noZ1d9iB4ig=
X-Gm-Gg: AZuq6aKsCU8f3E74PbiFF339e1lWkxYRACz6RrswnaVwK0eawMs8XBO+FwJpEV2SIqi
 a1taYt/++JtJKMsEIW8uPhb2xC9AU+qPMhgu5pBGVSDmw2jyhiOEqBJoSN86scDAGEAWiVOS9Ns
 PyW8LFRP93SaRTD4+XoVxl7FV+7RoEAb0vh+2Ct1IfiGKIvpXl/P1hsODxptsE+4L0bCvU0/vsr
 KCYL6sSBI1+uhXQUFpBq91wY/PPJEkcM0pp0GcODCLIxsC5/r1UlY/vXeYkeF89M8qddZaw/hCH
 f/XNSRr0tKxcybJTRnvWDgueKlKo/N66Ku911EOhtym72OQM/RiP6UUnYS8GpKBeJOPqykqEOHL
 eEUAf1dTizbSPNnFzOeRCGYRXiOw0zY6rSf1tHpxtnoAHgIusidnDj0ihRJwaeutEN4zgOyUJpN
 Jff6XoD6X6tU9PWIyYMUFb4A3g9HyQoYGFIbvHVNdrK7WzTOxVoRgi0+sgD+1AO+IX
X-Received: by 2002:a17:90b:1650:b0:339:ec9c:b275 with SMTP id
 98e67ed59e1d1-354b3c41871mr1384005a91.6.1770351721024; 
 Thu, 05 Feb 2026 20:22:01 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8244168fdf5sm926914b3a.17.2026.02.05.20.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 20:22:00 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 01/12] target/arm/arm-qmp-cmds.c: make compilation unit
 common
Date: Thu,  5 Feb 2026 20:21:39 -0800
Message-ID: <20260206042150.912578-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

Move gic_cap_kvm_probe to target/arm/kvm.c to remove #ifdef CONFIG_KVM.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/kvm_arm.h      |  3 +++
 target/arm/arm-qmp-cmds.c | 27 +++------------------------
 target/arm/kvm-stub.c     |  5 +++++
 target/arm/kvm.c          | 21 +++++++++++++++++++++
 target/arm/meson.build    |  2 +-
 5 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 6a9b6374a6d..cc0b374254e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -11,6 +11,7 @@
 #ifndef QEMU_KVM_ARM_H
 #define QEMU_KVM_ARM_H
 
+#include "qapi/qapi-types-misc-arm.h"
 #include "system/kvm.h"
 #include "target/arm/cpu-qom.h"
 
@@ -263,4 +264,6 @@ void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
 
 void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level);
 
+void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3);
+
 #endif
diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 45df15de782..83ec95c290f 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -43,29 +43,6 @@ static GICCapability *gic_cap_new(int version)
     return cap;
 }
 
-static inline void gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
-{
-#ifdef CONFIG_KVM
-    int fdarray[3];
-
-    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
-        return;
-    }
-
-    /* Test KVM GICv2 */
-    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
-        v2->kernel = true;
-    }
-
-    /* Test KVM GICv3 */
-    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
-        v3->kernel = true;
-    }
-
-    kvm_arm_destroy_scratch_host_vcpu(fdarray);
-#endif
-}
-
 GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
 {
     GICCapabilityList *head = NULL;
@@ -74,7 +51,9 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
     v2->emulated = true;
     v3->emulated = true;
 
-    gic_cap_kvm_probe(v2, v3);
+    if (kvm_enabled()) {
+        arm_gic_cap_kvm_probe(v2, v3);
+    }
 
     QAPI_LIST_PREPEND(head, v2);
     QAPI_LIST_PREPEND(head, v3);
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index c93462c5b9b..ea67deea520 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -124,3 +124,8 @@ bool kvm_arm_cpu_post_load(ARMCPU *cpu)
 {
     g_assert_not_reached();
 }
+
+void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3e35570f15f..ded582e0da0 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2580,3 +2580,24 @@ void arm_cpu_kvm_set_irq(void *arm_cpu, int irq, int level)
     }
     kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
 }
+
+void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
+{
+    int fdarray[3];
+
+    if (!kvm_arm_create_scratch_host_vcpu(fdarray, NULL)) {
+        return;
+    }
+
+    /* Test KVM GICv2 */
+    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V2)) {
+        v2->kernel = true;
+    }
+
+    /* Test KVM GICv3 */
+    if (kvm_device_supported(fdarray[1], KVM_DEV_TYPE_ARM_VGIC_V3)) {
+        v3->kernel = true;
+    }
+
+    kvm_arm_destroy_scratch_host_vcpu(fdarray);
+}
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 462c71148d2..1a1bcde2601 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -16,7 +16,7 @@ arm_common_ss.add(files(
   'mmuidx.c',
 ))
 
-arm_system_ss.add(files(
+arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
-- 
2.47.3


