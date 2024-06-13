Received: by 2002:a17:906:564e:b0:a6f:1bf6:7fc1 with SMTP id v14csp98554ejr;
        Thu, 13 Jun 2024 16:44:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPewHm4jpKv4ewaFw5y3jq/BxBc/px3rkJ93aDbnX0/PzpYn1QyTnfd2rDjM03Flxh0WknOmLzulQe2/7zI+vtUj09euBo
X-Google-Smtp-Source: AGHT+IHnIiptqz6cwx0FSehs2N1O2AU33qMRKh+QXu2qv+Ecx3lqLQ2uHKbdkSFBxhqNfAH4hjEY
X-Received: by 2002:a17:90a:db4a:b0:2bd:8378:af81 with SMTP id 98e67ed59e1d1-2c4db12c5c8mr1283696a91.4.1718322289219;
        Thu, 13 Jun 2024 16:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718322289; cv=none;
        d=google.com; s=arc-20160816;
        b=rTVX/Hm395WwjgR+O41TmoIXmKXX7Q+zXrfuMh+zZ+uD1Fx44kjCXL1ScssVQc3IFh
         FWSO5CGowmAV5pPWRoA5fknZU+keaUXzRiupksNJBwKfc/OxbgJjsujYFg1n7vHlPqCq
         tRqeOnWafXm2+sxwiAUDNI81iou1JlphI6B3Ogz+jVHy4Y65RcmwYN5OZY3aClBsxPU+
         9x+4qa0VMhRezwJXx7eIsSs3R/mJTKq4Em0/7WxrJ+tPTtviZzf/3GGKFmCtWsIryWu7
         7xA3KQCmwVZF1FJ/J8OVWGlpFljHdYE0Vl9ZIseClq2JWkMo7WX1M1ftTnSga/fCyd0u
         Ylyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=TR/jmwix6JrbkN15D+IaXKOPqz1DfSvHWJuW0Wh6noQ=;
        fh=LTv9rZypFCL5Yl51dJY3ojnjwtjMOAtIYwj21UMTdvU=;
        b=QBfKtjajZZUk4tbWmuMaw74EM64/PjTDHg5m0CvDnt8y45YU74w/wKJpu/cYoHwN33
         NVrCdchbW8IqBJefxlAJutN6JkFDJNF/PlRRlmjTa/AZvLPPX9qDgwlaZFbqQ+aX68m9
         1VTWA8BtJrXqPebrRgxFvAXfuZ4rzFWELIzBcs7SjvTdJTcxF79vepbSh8nrkLzzTxxk
         Gf0PhFO/5r4XWCkzHyMkW2zmxd1Zah2X7L3Q0APmkSV7mjrm7yn6B9tO5gHztuhE6gRq
         NreSpIZ+fxhh1z+wgQ9rqc1oQ+z5UzocDElrdiokmqz6Wu/3YTXiO+03dSWUNzwpPvDn
         SHgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2c4a75f39cbsi4502004a91.47.2024.06.13.16.44.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2024 16:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4W0fCF47Q5z6K69v;
	Fri, 14 Jun 2024 07:44:41 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 6E33214065C;
	Fri, 14 Jun 2024 07:44:44 +0800 (CST)
Received: from 00293818-MRGF.china.huawei.com (10.195.245.24) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 00:44:19 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>
Subject: [PATCH RFC V3 18/29] arm/virt: Add/update basic hot-(un)plug framework
Date: Fri, 14 Jun 2024 00:36:28 +0100
Message-ID: <20240613233639.202896-19-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613233639.202896-1-salil.mehta@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.195.245.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: Y8hdog6XbIxF

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
 hw/arm/virt.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a72cd3b20d..f6b8c21f26 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -85,6 +85,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "qapi/qmp/qdict.h"
 
 static GlobalProperty arm_virt_compat[] = {
     { TYPE_VIRTIO_IOMMU_PCI, "aw-bits", "48" },
@@ -3002,11 +3003,23 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
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
@@ -3049,6 +3062,22 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
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
@@ -3060,6 +3089,7 @@ static void virt_cpu_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
                           Error **errp)
 {
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
     MachineState *ms = MACHINE(hotplug_dev);
     CPUState *cs = CPU(dev);
     CPUArchId *cpu_slot;
@@ -3068,10 +3098,81 @@ static void virt_cpu_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     cpu_slot = virt_find_cpu_slot(ms, cs->cpu_index);
     cpu_slot->cpu = CPU(dev);
 
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
@@ -3196,6 +3297,8 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
         virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
                                      errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
+        virt_cpu_unplug_request(hotplug_dev, dev, errp);
     } else {
         error_setg(errp, "device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -3209,6 +3312,8 @@ static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
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
