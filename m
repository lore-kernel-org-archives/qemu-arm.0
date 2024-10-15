Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2339602njb;
        Tue, 15 Oct 2024 03:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeklusD+K6+8rByMeGzMPUJj5VmJudZTEBhyptrA8MVjD2pOEwh1tmb9Gpg+9chpm9zJP7GDEGSCj7ug==@linaro.org
X-Google-Smtp-Source: AGHT+IG9xajCshp1DpQ2GxciyoqYlxKzCySq+BfILw/AiynltSeunkXG/3Yc7ZF9K2brccft7smD
X-Received: by 2002:a05:600c:3b13:b0:42c:bc22:e074 with SMTP id 5b1f17b1804b1-4311df55c6fmr125837885e9.29.1728986806641;
        Tue, 15 Oct 2024 03:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728986806; cv=none;
        d=google.com; s=arc-20240605;
        b=NWqkBTFag/jL9dqZpJnkR0RQ8mUIFiwBEew7fQWUHPRzbQ57BczX3p4RrVIQA+26aK
         zzfj7JgXz9j99HwtLs9bKUY1Q291x6RMW+TYT2VtYmHs3bYkAdtVhNsRGQNCJtgWsVSi
         jc5BXHwb9iBBWb6IOA0Sz6iEgkcOWhDVG6yLKc+94ZsOVX38mWmq6SrCcajKy4o4VWRp
         sGpV2ebMMIECW1ZXu0JoTjE8cHEgPc7tL9c3rhXd0awZcxghvFuO4ihXMQgaOmJOQz1f
         aaBBPRxjvedDzQAmVy+ztQGEj1FVZ+n71QxTc21+3Vlf2yGSZcl2jwgDt1IRZj9xtYJk
         nkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Ikj38uwwpE1sDWbyd0bIMDyrrFXlzB7mwTtS0QQGeUU=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=Mk0uFcaRDgLpiNtaKNM+6PpMIAWUKbeK1WwIK8ns3QFn+KCXG/TWhUs4FEpQQMdcYa
         jT5UhEKnkHO6P+1mZszLZlAdGOH5zjyO7133BLGycjssFaZ3zVqme5XoFVuxjkgQe8D5
         fYHj1eQ5nmdoR6move19ta3szc9T8dF/R1X3AkMwvhjOwfWjliNHlT9UH67Mg0zIyFal
         HUI4R1l2rDiVaAYFh/ZsZAciHSwhJ/nXfWVprcxu9ujAUyfVdC3zgLHWmKESwfl+dbeP
         mZzcDu3BRSTtSaf1BJ4u+F1Ne4ORGjIQUhmQ3fzqRK5UT20dj5yFMcqBp54CKcXNw5+q
         cdrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fd038ecsi534572f8f.984.2024.10.15.03.06.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSV8M2TzBz6FGg5;
	Tue, 15 Oct 2024 18:05:07 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C3411400D9;
	Tue, 15 Oct 2024 18:06:44 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:06:24 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 17/30] arm/virt: Add/update basic hot-(un)plug framework
Date: Tue, 15 Oct 2024 10:59:59 +0100
Message-ID: <20241015100012.254223-18-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: QYyjPmaP0Ntk

Add CPU hot-unplug hooks and update hotplug hooks with additional sanity checks
for use in hotplug paths.

Note: The functional contents of the hooks (currently left with TODO comments)
will be gradually filled in subsequent patches in an incremental approach to
patch and logic building, which would roughly include the following:

1. (Un)wiring of interrupts between vCPU<->GIC.
2. Sending events to the guest for hot-(un)plug so that the guest can take
   appropriate actions.
3. Notifying the GIC about the hot-(un)plug action so that the vCPU can be
   (un)stitched to the GIC CPU interface.
4. Updating the guest with next boot information for this vCPU in the firmware.

Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/arm/virt.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7cbc212130..d4bcaedb8f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -86,6 +86,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qdict.h"
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
@@ -3014,11 +3015,23 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
 static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     ARMCPU *cpu = ARM_CPU(dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
 
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
@@ -3060,11 +3073,30 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
         return;
     }
     virt_cpu_set_properties(OBJECT(cs), cpu_slot, errp);
+
+    /*
+     * Fix the GIC for the newly plugged vCPU. The QOM CPU object for this new
+     * vCPU needs to be updated in the corresponding QOM `GICv3CPUState` object.
+     * Additionally, the IRQs for this new CPU object must be re-wired. This
+     * update is confined to the QOM layer and does not affect KVM, as KVM was
+     * already pre-sized with possible CPUs during VM initialization. This
+     * serves as a workaround to the constraints posed by the ARM architecture
+     * in supporting CPU hotplug, for which no formal specification exists.
+     *
+     * This GIC IRQ patch-up is necessary for both cold- and hot-plugged vCPUs.
+     * Cold-initialized vCPUs have their GIC state initialized earlier during
+     * `machvirt_init()`.
+     */
+    if (vms->acpi_dev) {
+        /* TODO: update GIC about this hotplug change here */
+        /* TODO: wire the GIC<->CPU irqs */
+    }
 }
 
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                           Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
 
@@ -3081,6 +3113,74 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
          */
         cpu_slot->arch_id = arm_cpu_mp_affinity(ARM_CPU(cs));
     }
+
+    if (vms->acpi_dev) {
+        /* TODO: register cpu for reset & update F/W info for the next boot */
+    }
+
+    /*
+     * Update the ACPI hotplug state for vCPUs being both hot- and cold-plugged.
+     * vCPUs can be cold-plugged using the `-device` option. For vCPUs that are
+     * hot-plugged, the guest is also notified.
+     */
+    if (vms->acpi_dev) {
+        /* TODO: update acpi hotplug state. Send cpu hotplug event to guest */
+    }
+}
+
+static void virt_cpu_unplug_request(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    ARMCPU *cpu = ARM_CPU(dev);
+    CPUState *cs = CPU(dev);
+
+    if (!vms->acpi_dev) {
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
+}
+
+static void virt_cpu_unplug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                            Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    CPUState *cs = CPU(dev);
+    CPUArchId *cpu_slot;
+
+    if (!vms->acpi_dev) {
+        error_setg(errp, "GED does not exists or device is not realized!");
+        return;
+    }
+
+    cpu_slot = virt_find_cpu_slot(cs);
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
 }
 
 static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
@@ -3207,6 +3307,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
                                      errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -3220,6 +3322,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
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
