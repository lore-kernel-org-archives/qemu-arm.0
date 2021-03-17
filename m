Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp228301lfg;
        Wed, 17 Mar 2021 02:32:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Q5K8t6e8CAI4htLJeT499OPhbrHbnMdi7mgAlxH9D/o/Skrkx2+KyYDQa0NpC7JxJCyU
X-Received: by 2002:a25:5042:: with SMTP id e63mr3293246ybb.263.1615973578453;
        Wed, 17 Mar 2021 02:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615973578; cv=none;
        d=google.com; s=arc-20160816;
        b=BRFGrg1DZelk+ctF8aZ+9C5gPZWbAUQP8n7hC2L182qwhaEeQPrNzOjJ7bnIvPPLH1
         FxtAj0k4e8NgqjaPp7KuS9UJC3rqRMICACMbEsJjtVxzeOYxBWRS+k3rVA8iepZsftij
         HJJjXtkvpm8WZNddXMkKWPYiAPUyj/cYhePeQrFWK33XZQibTTrW2qjtrM7P7n+cbm1l
         YW1+rrAkTc+93lfOcHdP8QLPXyOoqONXHax8oUs1n6FLaSSlXop81jznlkjeB7ZDO2wi
         s2A5MZev++hYRZU8M2cTyGc/Q26IcsPNqEEL6lvKoL0vQ6nAfrr0k7U2tRAHgdnfOo1W
         OlFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=69KRFSXYjzFlJT+Yhq6KsYSkZCWp63z+0u1KJALVHNA=;
        b=FRLSAWf/nx0cg9/hhLwBCCEEnOIqxW7AiWWaMHDylvn0uFAg1aXkBJNjkJ7W+6Peba
         FW3UxhSr7RR27L18OYWlVhoEjl0UfbkgSRcipBRpmQBuYN78QxZyQIYkYC/oBgOW6xOI
         UfsEMGm6dkk9CYvvoBi3TrpmcnhOdS7MGGtUfctZJMFg/Klll8Q3I0rjKmB+CnAhxgwQ
         J2YcjlRFMKLQi7eyLjeYCcJPo2zNP3Q4jJx9q9p+QgsxZBQaSwKgpZ+XWd2UGh0BRiXR
         kKS48RsumJB4fsxNYo8QbCrhErDqWuzwNNjWTahAKKgfbky+48LU3JTMRbU9vtnz9l3e
         uLbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K6Z9UjHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o139si20448258ybg.199.2021.03.17.02.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Mar 2021 02:32:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K6Z9UjHE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMSXx-0004t8-Pc
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 05:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTy-0001nl-5f
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:51 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:45337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lMSTv-00014O-UM
 for qemu-arm@nongnu.org; Wed, 17 Mar 2021 05:28:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u18so472312plc.12
 for <qemu-arm@nongnu.org>; Wed, 17 Mar 2021 02:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69KRFSXYjzFlJT+Yhq6KsYSkZCWp63z+0u1KJALVHNA=;
 b=K6Z9UjHEZYHee0gFfJmGGCucD9CZzFrEKcarXyT4TXAo+E3rSf0FAOW8Iavko+tTSh
 kCGYxou/IKR+nL4CHNnPkzELpxp3K5DAfZTpgP3muHYxOXIZo0sBdQWUa2e4tuL3+MZd
 zHbsER/bGfrgYU1IeemiJPueLSeUKvhXdgqKf622ucyILlYNXvHV7X0hOtX3sr82EKD4
 65D0ALDt7cA3IgQDEKCwKmMa5SmQC0u7HWMMBGB5pXD5kdJlKm3AO8EKvVu++xJYLFzK
 jZesvDwvf8+YTTGLd4btO6qHTenIcDs/tXUSLKb7Vx55+9atgSt35W7BbrMi8bPmmfAr
 RAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69KRFSXYjzFlJT+Yhq6KsYSkZCWp63z+0u1KJALVHNA=;
 b=SywhbCun8brnUuHk8DIUoeErd5JTZm6yVT7ae059g3t9ajQrQ4BRklgwMJNaz533Lv
 JIhPbsd1qzzVf1FUXd+ZxlL+5omtSA3R1zyt4HfVu4pXBWfkADeQaEpnuzsN60gfxA9p
 l9BThO691uE1FegeQIXeXZKdhOQv3OVL4f3Oue5naWg+BDUAYQ5oQzTHmjzRzNqNIBRf
 xcnd862/RPRFENdIOQcPeDKHWb8HiMi3ofptiJZKRS9Ol8GKth2pFCf5gAXz2tWP4iBl
 NYABwTuKXQxBWbh7JPi0dMnKvi4DsBMLPnpocaYh/tnp9Us6XeVmnC/SmsgfT80gRva/
 dXWA==
X-Gm-Message-State: AOAM533I5iwofTXoubVWIjsB52ypacktcRhjYWtgsAyc60jFf7TSDU3j
 ByK5aNhHtMra5QeBSIimybBi
X-Received: by 2002:a17:902:f1c2:b029:e4:6c23:489f with SMTP id
 e2-20020a170902f1c2b02900e46c23489fmr3813518plc.62.1615973326296; 
 Wed, 17 Mar 2021 02:28:46 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id r30sm18630163pgu.86.2021.03.17.02.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 02:28:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: dgilbert@redhat.com, quintela@redhat.com, drjones@redhat.com,
 richard.henderson@linaro.org
Subject: [RFC PATCH v2 2/5] Add basic MTE support to KVM guest
Date: Wed, 17 Mar 2021 09:28:21 +0000
Message-Id: <dc2ef2000f73aa9aded5d97b417289083bf52aa7.1615972140.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615972140.git.haibo.xu@linaro.org>
References: <cover.1615972140.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=haibo.xu@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9YixwbZNN0iB

Enable the virt machine feature "mte" to work with
KVM guest. This feature is still hiden from the user
in this patch, and will be available in a later patch.

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 hw/arm/virt.c      | 22 +++++++++++-----------
 target/arm/cpu.c   |  2 +-
 target/arm/kvm.c   |  9 +++++++++
 target/arm/kvm64.c |  7 +++++++
 4 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..76658b93a3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1988,18 +1988,18 @@ static void machvirt_init(MachineState *machine)
         }
 
         if (vms->mte) {
+            /*
+             * The property exists only if MemTag is supported.
+             * If it is, we must allocate the ram to back that up.
+             */
+            if (!object_property_find(cpuobj, "tag-memory")) {
+                error_report("MTE requested, but not supported "
+                             "by the guest CPU");
+                exit(1);
+            }
+
             /* Create the memory region only once, but link to all cpus. */
-            if (!tag_sysmem) {
-                /*
-                 * The property exists only if MemTag is supported.
-                 * If it is, we must allocate the ram to back that up.
-                 */
-                if (!object_property_find(cpuobj, "tag-memory")) {
-                    error_report("MTE requested, but not supported "
-                                 "by the guest CPU");
-                    exit(1);
-                }
-
+            if (!tag_sysmem && !kvm_enabled()) {
                 tag_sysmem = g_new(MemoryRegion, 1);
                 memory_region_init(tag_sysmem, OBJECT(machine),
                                    "tag-memory", UINT64_MAX / 32);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408..47bf817b61 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1847,7 +1847,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                cpu->secure_memory);
     }
 
-    if (cpu->tag_memory != NULL) {
+    if (cpu->tag_memory != NULL && !kvm_enabled()) {
         cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
                                cpu->tag_memory);
         if (has_secure) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..3403e621ac 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -32,6 +32,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "hw/arm/virt.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -274,6 +275,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    if (kvm_check_extension(s, KVM_CAP_ARM_MTE) &&
+        object_dynamic_cast(OBJECT(ms), TYPE_VIRT_MACHINE) &&
+        VIRT_MACHINE(ms)->mte) {
+            if (kvm_vm_enable_cap(s, KVM_CAP_ARM_MTE, 0)) {
+                error_report("Failed to enable KVM_CAP_ARM_MTE cap");
+            }
+    }
+
     return ret;
 }
 
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index dff85f6db9..73a191f8e1 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -500,6 +500,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
      */
     int fdarray[3];
     bool sve_supported;
+    bool mte_supported;
     uint64_t features = 0;
     uint64_t t;
     int err;
@@ -646,6 +647,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     }
 
     sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    mte_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_MTE) > 0;
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 
@@ -659,6 +661,11 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         ahcf->isar.id_aa64pfr0 = t;
     }
+    if (mte_supported) {
+        t = ahcf->isar.id_aa64pfr1;
+        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
+        ahcf->isar.id_aa64pfr1 = t;
+    }
 
     /*
      * We can assume any KVM supporting CPU is at least a v8
-- 
2.17.1

