Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp837873lfc;
        Sun, 7 Feb 2021 19:50:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5XskX/ZWvVN+8qc4OdwYqPzRt25ABIdhwtn6bPSFYG9rYmOgMT0Dq2+ododumbuwpTqCG
X-Received: by 2002:a25:4981:: with SMTP id w123mr22602722yba.123.1612756200711;
        Sun, 07 Feb 2021 19:50:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612756200; cv=none;
        d=google.com; s=arc-20160816;
        b=FdBOsj3fjawCfqvG93widUCmN6K0t7X3aDgea7mHoYGeS4U+AUJDPcaJqpe0guRsn6
         94cgmoHdyCM18j3tCtxma/bXJiTnt293fSb6Lva77H7Df1t4iJj7yruAaDdYoegwyaAs
         vxa2ii791cLaNExvVHiH0eGQo/aPG5EcA36cpaBLN86zAR+y5hspkb50E0Q9xDzVzjNo
         kkyqHnq6Ihx92iePXosPq0QjfezJdErrjJPnzkVparhZdqj90MW8peTJ0IW8DDZTbYBf
         LAa1gsghHmvHf3zrDgDxR8xpfkkC/ZPVDGCVKqC+NA3OI1HgU1Fz1NLTwk1d64lxuyH0
         1oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I7kX52+i6GRyy+3lYBjqHTFyTQeUgleV90lSPDfFuBI=;
        b=ARRpptw7qxoqv3+tnOTvKkMcXNwdMqoQ6YWq+yozDpXe8TC3O0+p/YqAVSsUS2GQXQ
         1lMd2fu82ZJkHUm+prFVKKT93PBe6FaIJ4+dkTitb5po4NbI7ZCp/sJNU0j5bozzEL5U
         8dJNjEfvg3oUUESpWqHzqpkyTiEi+a5TTN/dGykmUP7DraebhyJ51qAe2pRUFfwcjRat
         j1P2ToZ5VN7b5U7vD0Qwylz60M2mYtgeiPiSN3lSzWU7SiQJ7EZMaaQhOdFACnbPh8gK
         2GTmOCTqzN2vrb4qKSPda0+ddDQctSph5qpuF5q1Z9N7Z7f8ftZjbzskm+39Bp/LeXmW
         0IAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qxtw6Swo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a39si13435961ybi.296.2021.02.07.19.50.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Feb 2021 19:50:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qxtw6Swo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l8xYl-0004il-Ux
	for alex.bennee@linaro.org; Sun, 07 Feb 2021 22:50:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6G-0007g8-V3
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:33 -0500
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:35396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001ih-Kr
 for qemu-arm@nongnu.org; Sun, 07 Feb 2021 22:20:32 -0500
Received: by mail-il1-x129.google.com with SMTP id o7so6946218ils.2
 for <qemu-arm@nongnu.org>; Sun, 07 Feb 2021 19:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I7kX52+i6GRyy+3lYBjqHTFyTQeUgleV90lSPDfFuBI=;
 b=qxtw6SwooIdn9ov3wbboEkGG84GD/5rSi1t5TkmrylFDjzUCD9rOmJ2KRjR4lXdiUq
 7j05tdtRIcDmVjQnqYaVM3uPil+UwKZI424v2Y4q1idO+6HCXKz3Eh9X0RikaQ/RAoTg
 hT70RTMvlL/tW816z5z8v1uPSAb0GY/kHoXCq+BH8WWRfvsuXs1tWdso2N9amh07tlRd
 3wvSOxjGLJZ912SRUe+FmBYjEPmwpxeSSNa2spdOP7OAbph/3bAXb5fsFTN6QrTqed+T
 Zv0g7GMEFAfGa1cGzRjosPpGAi6gc46aK+7GLXE1n4QvgC1i3yMAACjH4LfxUJDjionZ
 WE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7kX52+i6GRyy+3lYBjqHTFyTQeUgleV90lSPDfFuBI=;
 b=YU+xd9K3P8HAH/ygsKGz9CVWkzU7P673W7XbePX7EF5jwBduOA/kjWKxKc8kq2nbNh
 GUh2wIz8Xz9fFwfA6aNnpRRwwJR8gDdvrwhe6A2EkfFopEw9+j6sNejMywz/6CkeKWqw
 7YUT5GjtK5oZ4xMI1YYzrSRvev6W69r7/b67CBMYv74p75STPHypZKNt/OJ9M6Ox6bze
 Js9A4P5dML7cwEYbTO55RURVranPC+qW4gg24EaBHOEtI4pxpKjp6v+b5alifBDGI4Ip
 kXg/SFKHH7zaToN5Pa8NyZkNG6xweURSkK1Q5+ouRoPDoHD3Sy1mz9cJ9iQLUUdi0arS
 h0gw==
X-Gm-Message-State: AOAM5327PMWPbFfKKqDmJ+nksCIfp6GCWx6fFXOedpWWvh3XL2ijTzfF
 wqRClW4t5tVXbP4zIj+ld6gi
X-Received: by 2002:a05:6e02:1343:: with SMTP id
 k3mr13906775ilr.102.1612754427727; 
 Sun, 07 Feb 2021 19:20:27 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:27 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 2/5] Add basic MTE support to KVM guest
Date: Mon,  8 Feb 2021 03:20:03 +0000
Message-Id: <9c4507258ffe9cea4aeb5e19ef8475cb65230c3d.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612747873.git.haibo.xu@linaro.org>
References: <cover.1612747873.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x129.google.com
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
X-TUID: QX/VFnj4Fl07

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
index 399da73454..623d5e9397 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1974,18 +1974,18 @@ static void machvirt_init(MachineState *machine)
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
index 40142ac141..50f3223944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1831,7 +1831,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                cpu->secure_memory);
     }
 
-    if (cpu->tag_memory != NULL) {
+    if (cpu->tag_memory != NULL && !kvm_enabled()) {
         cpu_address_space_init(cs, ARMASIdx_TagNS, "cpu-tag-memory",
                                cpu->tag_memory);
         if (has_secure) {
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ffe186de8d..33630b2b70 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -32,6 +32,7 @@
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
+#include "hw/arm/virt.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
@@ -272,6 +273,14 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
index 3c37fc4fb6..23f34034db 100644
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

