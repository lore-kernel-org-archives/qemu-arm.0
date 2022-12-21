Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5018489ejb;
        Wed, 21 Dec 2022 01:29:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvgchcXxyWiBFg2+VKf/szK+aJoeHCDbMF8U3wVShy3BAABwe4Iv9EM7iiKvk5TW3pwFnl5
X-Received: by 2002:ad4:4a0d:0:b0:4c7:595c:9940 with SMTP id m13-20020ad44a0d000000b004c7595c9940mr1374124qvz.51.1671614992463;
        Wed, 21 Dec 2022 01:29:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671614992; cv=none;
        d=google.com; s=arc-20160816;
        b=n5CP4i7UFwXr/HCIWioTHohKzlqCpNKotoeXTu8ebZYdqQ392kzt6q9m1A0SoRyzBJ
         SS+hKKI2UwWX3f7uJ+A2zDLOCSs+L5iFLMelOQYj4BeddAV7HFf3A13bwhTSOq3FicUY
         NbztetX44/wJbdvVzGVPAdP7mBouzxXJOVOfOw/06ZP/3Apa1JrabFdFomBvWxj62z/D
         VGoL1eABBBt//GUMyvKGcKOK69mmu9LY44Zi/2/Q+pi/gJZqNbNitG4i3nbWcEXEJY/X
         FmchKVXF52xpf0SHm5yjfAascfn59omcboSlW/+RRvzdJcG76f2hZRv5Z4FfuyhIx/x4
         4hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=iPRoYXaja06B9PlGybQ9NK2t6zih+GCtUa/jyKYNfmM=;
        b=qIbKXuCocaiqO5XqMCv7+BTpxPq9YOOAcdGb506XZxuK3ZlfhJh6eZHgGGtRYuI66h
         f5wdtEm7zPgkneQkyMstsFZE2ZbSOyXUZitxVy/yeFVBdpvI23wPa4mY7R0alrYp8udJ
         WzTI7ZKOWwRIpUJBXblxSdGRFdL5gW33XH1zn/ZTEZDrkZVRFhC/l7yHNZ4KWK0bE8az
         fmkslILP4rcBal0yytIv2lW2mPzU+nHe1m3T5hcBiyTctbPSF6+D36j1khpr4B1B2RZ5
         5LRdwKTlCLQbrT9IZurvG1iqHZig4QIov3SI6WmQbmNG4rToiDIRvgf5uPjoJh2BQSn0
         E3zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22-20020a05620a445600b006fed5747979si6531405qkp.334.2022.12.21.01.29.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 01:29:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7vPF-0005hG-3c; Wed, 21 Dec 2022 04:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7vPD-0005g7-GQ; Wed, 21 Dec 2022 04:28:55 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7vPB-0004fv-95; Wed, 21 Dec 2022 04:28:55 -0500
Received: from localhost.localdomain
 (dynamic-095-117-119-107.95.117.pool.telefonica.de [95.117.119.107])
 by csgraf.de (Postfix) with ESMTPSA id A91016080695;
 Wed, 21 Dec 2022 10:28:51 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 1/2] hw/arm/virt: Consolidate GIC finalize logic
Date: Wed, 21 Dec 2022 10:28:49 +0100
Message-Id: <20221221092850.61332-2-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221221092850.61332-1-agraf@csgraf.de>
References: <20221221092850.61332-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I4Bgm3qCMFH2

Up to now, the finalize_gic_version() code open coded what is essentially
a support bitmap match between host/emulation environment and desired
target GIC type.

This open coding leads to undesirable side effects. For example, a VM with
KVM and -smp 10 will automatically choose GICv3 while the same command
line with TCG will stay on GICv2 and fail the launch.

This patch combines the TCG and KVM matching code paths by making
everything a 2 pass process. First, we determine which GIC versions the
current environment is able to support, then we go through a single
state machine to determine which target GIC mode that means for us.

After this patch, the only user noticable changes should be consolidated
error messages as well as TCG -M virt supporting -smp > 8 automatically.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
---
 hw/arm/virt.c         | 199 ++++++++++++++++++++++--------------------
 include/hw/arm/virt.h |  15 ++--
 2 files changed, 113 insertions(+), 101 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 04eb6c201d..7b54387958 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1820,6 +1820,85 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     }
 }
 
+static VirtGICType finalize_gic_version_do(const char *accel_name,
+                                           VirtGICType gic_version,
+                                           int gics_supported,
+                                           unsigned int max_cpus)
+{
+    /* Convert host/max/nosel to GIC version number */
+    switch (gic_version) {
+    case VIRT_GIC_VERSION_HOST:
+        if (kvm_enabled()) {
+            /* For KVM, -cpu host means -cpu max */
+            return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
+                                           gics_supported, max_cpus);
+        }
+
+        error_report("gic-version=host requires KVM");
+        exit(1);
+        break;
+    case VIRT_GIC_VERSION_MAX:
+        if (gics_supported & VIRT_GIC_VERSION_4_MASK) {
+            gic_version = VIRT_GIC_VERSION_4;
+        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
+            gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            gic_version = VIRT_GIC_VERSION_2;
+        }
+        break;
+    case VIRT_GIC_VERSION_NOSEL:
+        if ((gics_supported & VIRT_GIC_VERSION_2_MASK) &&
+            max_cpus <= GIC_NCPU) {
+            gic_version = VIRT_GIC_VERSION_2;
+        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
+            /*
+             * in case the host does not support v2 emulation or
+             * the end-user requested more than 8 VCPUs we now default
+             * to v3. In any case defaulting to v2 would be broken.
+             */
+            gic_version = VIRT_GIC_VERSION_3;
+        } else if (max_cpus > GIC_NCPU) {
+            error_report("%s only supports GICv2 emulation but more than 8 "
+                         "vcpus are requested", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_2:
+    case VIRT_GIC_VERSION_3:
+    case VIRT_GIC_VERSION_4:
+        break;
+    }
+
+    /* Check chosen version is effectively supported */
+    switch (gic_version) {
+    case VIRT_GIC_VERSION_2:
+        if (!(gics_supported & VIRT_GIC_VERSION_2_MASK)) {
+            error_report("%s does not support GICv2 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_3:
+        if (!(gics_supported & VIRT_GIC_VERSION_3_MASK)) {
+            error_report("%s does not support GICv3 emulation", accel_name);
+            exit(1);
+        }
+        break;
+    case VIRT_GIC_VERSION_4:
+        if (!(gics_supported & VIRT_GIC_VERSION_4_MASK)) {
+            error_report("%s does not support GICv4 emulation, is virtualization=on?",
+                         accel_name);
+            exit(1);
+        }
+        break;
+    default:
+        error_report("logic error in finalize_gic_version");
+        exit(1);
+        break;
+    }
+
+    return gic_version;
+}
+
 /*
  * finalize_gic_version - Determines the final gic_version
  * according to the gic-version property
@@ -1828,118 +1907,46 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
+    const char *accel_name = current_accel_name();
     unsigned int max_cpus = MACHINE(vms)->smp.max_cpus;
+    int gics_supported = 0;
 
-    if (kvm_enabled()) {
-        int probe_bitmap;
-
-        if (!kvm_irqchip_in_kernel()) {
-            switch (vms->gic_version) {
-            case VIRT_GIC_VERSION_HOST:
-                warn_report(
-                    "gic-version=host not relevant with kernel-irqchip=off "
-                     "as only userspace GICv2 is supported. Using v2 ...");
-                return;
-            case VIRT_GIC_VERSION_MAX:
-            case VIRT_GIC_VERSION_NOSEL:
-                vms->gic_version = VIRT_GIC_VERSION_2;
-                return;
-            case VIRT_GIC_VERSION_2:
-                return;
-            case VIRT_GIC_VERSION_3:
-                error_report(
-                    "gic-version=3 is not supported with kernel-irqchip=off");
-                exit(1);
-            case VIRT_GIC_VERSION_4:
-                error_report(
-                    "gic-version=4 is not supported with kernel-irqchip=off");
-                exit(1);
-            }
-        }
+    /* Determine which GIC versions the current environment supports */
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
+        int probe_bitmap = kvm_arm_vgic_probe();
 
-        probe_bitmap = kvm_arm_vgic_probe();
         if (!probe_bitmap) {
             error_report("Unable to determine GIC version supported by host");
             exit(1);
         }
 
-        switch (vms->gic_version) {
-        case VIRT_GIC_VERSION_HOST:
-        case VIRT_GIC_VERSION_MAX:
-            if (probe_bitmap & KVM_ARM_VGIC_V3) {
-                vms->gic_version = VIRT_GIC_VERSION_3;
-            } else {
-                vms->gic_version = VIRT_GIC_VERSION_2;
-            }
-            return;
-        case VIRT_GIC_VERSION_NOSEL:
-            if ((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <= GIC_NCPU) {
-                vms->gic_version = VIRT_GIC_VERSION_2;
-            } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
-                /*
-                 * in case the host does not support v2 in-kernel emulation or
-                 * the end-user requested more than 8 VCPUs we now default
-                 * to v3. In any case defaulting to v2 would be broken.
-                 */
-                vms->gic_version = VIRT_GIC_VERSION_3;
-            } else if (max_cpus > GIC_NCPU) {
-                error_report("host only supports in-kernel GICv2 emulation "
-                             "but more than 8 vcpus are requested");
-                exit(1);
-            }
-            break;
-        case VIRT_GIC_VERSION_2:
-        case VIRT_GIC_VERSION_3:
-            break;
-        case VIRT_GIC_VERSION_4:
-            error_report("gic-version=4 is not supported with KVM");
-            exit(1);
+        if (probe_bitmap & KVM_ARM_VGIC_V2) {
+            gics_supported |= VIRT_GIC_VERSION_2_MASK;
         }
-
-        /* Check chosen version is effectively supported by the host */
-        if (vms->gic_version == VIRT_GIC_VERSION_2 &&
-            !(probe_bitmap & KVM_ARM_VGIC_V2)) {
-            error_report("host does not support in-kernel GICv2 emulation");
-            exit(1);
-        } else if (vms->gic_version == VIRT_GIC_VERSION_3 &&
-                   !(probe_bitmap & KVM_ARM_VGIC_V3)) {
-            error_report("host does not support in-kernel GICv3 emulation");
-            exit(1);
+        if (probe_bitmap & KVM_ARM_VGIC_V3) {
+            gics_supported |= VIRT_GIC_VERSION_3_MASK;
         }
-        return;
-    }
-
-    /* TCG mode */
-    switch (vms->gic_version) {
-    case VIRT_GIC_VERSION_NOSEL:
-        vms->gic_version = VIRT_GIC_VERSION_2;
-        break;
-    case VIRT_GIC_VERSION_MAX:
+    } else if (kvm_enabled() && !kvm_irqchip_in_kernel()) {
+        /* KVM w/o kernel irqchip can only deal with GICv2 */
+        gics_supported |= VIRT_GIC_VERSION_2_MASK;
+        accel_name = "KVM with kernel-irqchip=off";
+    } else {
+        gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
-            /* CONFIG_ARM_GICV3_TCG was set */
+            gics_supported |= VIRT_GIC_VERSION_3_MASK;
             if (vms->virt) {
                 /* GICv4 only makes sense if CPU has EL2 */
-                vms->gic_version = VIRT_GIC_VERSION_4;
-            } else {
-                vms->gic_version = VIRT_GIC_VERSION_3;
+                gics_supported |= VIRT_GIC_VERSION_4_MASK;
             }
-        } else {
-            vms->gic_version = VIRT_GIC_VERSION_2;
         }
-        break;
-    case VIRT_GIC_VERSION_HOST:
-        error_report("gic-version=host requires KVM");
-        exit(1);
-    case VIRT_GIC_VERSION_4:
-        if (!vms->virt) {
-            error_report("gic-version=4 requires virtualization enabled");
-            exit(1);
-        }
-        break;
-    case VIRT_GIC_VERSION_2:
-    case VIRT_GIC_VERSION_3:
-        break;
     }
+
+    /*
+     * Then convert helpers like host/max to concrete GIC versions and ensure
+     * the desired version is supported
+     */
+    vms->gic_version = finalize_gic_version_do(accel_name, vms->gic_version,
+                                               gics_supported, max_cpus);
 }
 
 /*
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1..e1ddbea96b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -109,14 +109,19 @@ typedef enum VirtMSIControllerType {
 } VirtMSIControllerType;
 
 typedef enum VirtGICType {
-    VIRT_GIC_VERSION_MAX,
-    VIRT_GIC_VERSION_HOST,
-    VIRT_GIC_VERSION_2,
-    VIRT_GIC_VERSION_3,
-    VIRT_GIC_VERSION_4,
+    VIRT_GIC_VERSION_MAX = 0,
+    VIRT_GIC_VERSION_HOST = 1,
+    /* The concrete GIC values have to match the GIC version number */
+    VIRT_GIC_VERSION_2 = 2,
+    VIRT_GIC_VERSION_3 = 3,
+    VIRT_GIC_VERSION_4 = 4,
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
+#define VIRT_GIC_VERSION_2_MASK BIT(VIRT_GIC_VERSION_2)
+#define VIRT_GIC_VERSION_3_MASK BIT(VIRT_GIC_VERSION_3)
+#define VIRT_GIC_VERSION_4_MASK BIT(VIRT_GIC_VERSION_4)
+
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
-- 
2.37.1 (Apple Git-137.1)

