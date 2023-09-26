Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp983906ejc;
        Tue, 26 Sep 2023 03:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbtrKT5cq6L4jsOa3Z8pofHwekqJT4m+0hKIYEA22ivjLkvT7TZTB8KOqllAH3SIoPLntK
X-Received: by 2002:a5d:4482:0:b0:320:3fa:945 with SMTP id j2-20020a5d4482000000b0032003fa0945mr8185759wrq.24.1695723191326;
        Tue, 26 Sep 2023 03:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695723191; cv=none;
        d=google.com; s=arc-20160816;
        b=OhiG16pDmkjOvjDPSoW2XQF/EBkYF+hZQB9k8PScZZqQq6wrRGy8urlUvTUr9kYPdR
         C2M1WbvAPhTwLeTwBmDmagpA80x0kCWrscMsmjtomMQXQFsoXX3+D7Ns7L49L4SF9r9M
         thUI9CX6kw4vnd4+pxE02EhMzSvlWeAAjKwU9VHawadDDjOwS2MltzXzeGZhYC4fyJUb
         +e1VaRkl0uqHrfZYB/zb0MNtZc6VERVLfRJPXT08EasEmvz+QAGjO9DWRV++MkzgY9K+
         hIwMEGx5tcIGtVrUJmfrJrii3eEIKL1NLNUWIV9boJpfVDN+V9sMtcp4+Vi1vcSGz4nE
         faHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=LLwsm3w3IUjlIn+/qw1YWx1rFL7aN1xX3tktg+VbBHw=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=pJsaeX53ccVSL9ziK0Rkxe93TbmoGeUnUL/h1/d6q628yT27K9A5tOQBhX0UarNcBn
         ZKjlhrDjW6k0yfdDglxp6jr6XVX0tsmqt5fyp0YUMaYXYNUZhcsOK4+ngn2f4STsCKfy
         oxtwtkxW3R2NBD5K/C2boz/9sonznJa4HH+AP62ppGZgfxG1QIvRSsOh8jm8S+VZEgq4
         ec3K1VoAIdEEy2WOIolkkjqmydWj/3/N966ku2ZkicDRcS4ZkORkZ5lo3oeAk5QlBS8q
         MPtHmHM/DkdKW1XxACyfXMyycQeCrJBohMy/hxU/+JVCn1H9LFag0KYeBn4tA3ZCFUTW
         UBrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id c13-20020adfe70d000000b0031ad93d83f0si5858788wrm.84.2023.09.26.03.13.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwWw2CvFz6K6wQ;
	Tue, 26 Sep 2023 18:11:56 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:12:52 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 25/37] arm/virt: Add/update basic hot-(un)plug framework
Date: Tue, 26 Sep 2023 11:04:24 +0100
Message-ID: <20230926100436.28284-26-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: SBFqS2QR7BiR

Add CPU hot-unplug hooks and update hotplug hooks with additional sanity checks
for use in hotplug paths.

Note, Functional contents of the hooks(now left with TODO comment) shall be
gradually filled in the subsequent patches in an incremental approach to patch
and logic building which would be roughly as follows:
1. (Un-)wiring of interrupts between vCPU<->GIC
2. Sending events to Guest for hot-(un)plug so that guest can take appropriate
   actions.
3. Notifying GIC about hot-(un)plug action so that vCPU could be (un-)stitched
   to the GIC CPU interface.
4. Updating the Guest with Next boot info for this vCPU in the firmware.

Co-developed-by: Salil Mehta <salil.mehta@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3b068534a8..dce02136cb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -81,6 +81,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qdict.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -2985,12 +2986,23 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
     int32_t min_cpuid = 0;
     int32_t max_cpuid;
 
+    if (dev->hotplugged && !vms->acpi_dev) {
+        error_setg(errp, "GED acpi device does not exists");
+        return;
+    }
+
+    if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
+        error_setg(errp, "CPU hotplug not supported on this machine");
+        return;
+    }
+
     /* sanity check the cpu */
     if (!object_dynamic_cast(OBJECT(cpu), ms->cpu_type)) {
         error_setg(errp, "Invalid CPU type, expected cpu type: '%s'",
@@ -3039,6 +3051,22 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
     virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
 
+    /*
+     * Fix the GIC for this new vCPU being plugged. The QOM CPU object for the
+     * new vCPU need to be updated in the corresponding QOM GICv3CPUState object
+     * We also need to re-wire the IRQs for this new CPU object. This update
+     * is limited to the QOM only and does not affects the KVM. Later has
+     * already been pre-sized with possible CPU at VM init time. This is a
+     * workaround to the constraints posed by ARM architecture w.r.t supporting
+     * CPU Hotplug. Specification does not exist for the later.
+     * This patch-up is required both for {cold,hot}-plugged vCPUs. Cold-inited
+     * vCPUs have their GIC state initialized during machvit_init().
+     */
+    if (vms->acpi_dev) {
+        /* TODO: update GIC about this hotplug change here */
+        /* TODO: wire the GIC<->CPU irqs */
+    }
+
     /*
      * To give persistent presence view of vCPUs to the guest, ACPI might need
      * to fake the presence of the vCPUs to the guest but keep them disabled.
@@ -3050,6 +3078,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                           Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
@@ -3058,10 +3087,81 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
     cpu_slot->cpu = OBJECT(dev);
 
+    /*
+     * Update the ACPI Hotplug state both for vCPUs being {hot,cold}-plugged.
+     * vCPUs can be cold-plugged using '-device' option. For vCPUs being hot
+     * plugged, guest is also notified.
+     */
+    if (vms->acpi_dev) {
+        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
+        /* TODO: register cpu for reset & update F/W info for the next boot */
+    }
+
     cs->disabled = false;
     return;
 }
 
+static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUState *cs = CPU(dev);
+
+    if (!vms->acpi_dev || !dev->realized) {
+        error_setg(errp, "GED does not exists or device is not realized!");
+        return;
+    }
+
+    if (!mc->has_hotpluggable_cpus) {
+        error_setg(errp, "CPU hot(un)plug not supported on this machine");
+        return;
+    }
+
+    if (cs->cpu_index == first_cpu->cpu_index) {
+        error_setg(errp, "Boot CPU(id%d=%d:%d:%d:%d) hot-unplug not supported",
+                   first_cpu->cpu_index, cpu->socket_id, cpu->cluster_id,
+                   cpu->core_id, cpu->thread_id);
+        return;
+    }
+
+    /* TODO: request cpu hotplug from guest */
+
+    return;
+}
+
+static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                            Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    MachineState *ms = MACHINE(hotplug_dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+
+    if (!vms->acpi_dev || !dev->realized) {
+        error_setg(errp, "GED does not exists or device is not realized!");
+        return;
+    }
+
+    cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
+
+    /* TODO: update the acpi cpu hotplug state for cpu hot-unplug */
+
+    /* TODO: unwire the gic-cpu irqs here */
+    /* TODO: update the GIC about this hot unplug change */
+
+    /* TODO: unregister cpu for reset & update F/W info for the next boot */
+
+    qobject_unref(dev->opts);
+    dev->opts = NULL;
+
+    cpu_slot->cpu = NULL;
+    cs->disabled = true;
+
+    return;
+}
+
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                             DeviceState *dev, Error **errp)
 {
@@ -3185,6 +3285,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
                                      errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -3198,6 +3300,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
         virt_dimm_unplug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "virt: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
-- 
2.34.1
