Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1300280wme;
        Wed, 16 May 2018 09:12:36 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqQB0baSi7uM+Jgr6VsUwWwP9PGRVEF6Kl0O662VgKQuEGeuxQHp0lE5MWpCrR+gQGgUPkj
X-Received: by 2002:a37:21a0:: with SMTP id f32-v6mr1496820qki.153.1526487156166;
        Wed, 16 May 2018 09:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526487156; cv=none;
        d=google.com; s=arc-20160816;
        b=guSHJ6mMjgucKNrpzeJ0DWZTxfFxTrh6sDyrWChE+ukhDrJPLehkQXy/OfIA+Zfrb2
         REr4Qga7p1/Mp90cDg0zZ1JTE3XRSmPpErEusuXLQuZsZg3l5dgIf1gpEsnJ4eO7b4Uf
         2i9pK0N6axna9lQwMLaCsBZXwbV0POMhWAjuQn2MUcmP5hXYGJOvo97T+kyTMLAIG+pW
         6fsOmDF/VI7vLj+X+O+EmZFSVT54lTCfsO1/+aFXkBZKYSGJCp2a1d96UbkNY0e8zywo
         snNWWFRUG6ycMnKObovzMIgvjAn2XBkDfVqG7jXlRtgKOtkYQN4CSfTxd/4QeLYOOLO7
         KrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=DZ5ucGknKUl4UPbUqlwbWO++nJgtnqQPoRnewCNgLnQ=;
        b=nDo9DIEKILBeOVzR11Ro4K6wnU3c4wzFwPPP3dW7x/ZAvGwwmgEYnjo+PDsViwzY0Q
         VWw3C0d4d+JCkjjheqgN+RGVCu39KHl17JK9Mewlx9wm3/vaCd1hLWwK7SaXGRuOBLRF
         NPG8LpnCXjfCmaPEven5CqyWFf6nPGXIa76LIfTggsJogD7Lc7nwS8A6HV64np/7iN3u
         r6/ZJZlSme6yCBZRi3lrIa4PncTtWNg4SG6OcrWEKa+Rg9O4UlYgcr21aNd58k0oW5jv
         dUxNBbbG1+1HOYIW4rSryAZlg5XNIztpGVideO6Xkd1Dg3YkqMRmGSgpiA3NJFIQOHRm
         dS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5-v6si505943qkf.71.2018.05.16.09.12.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 09:12:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIz2Z-0003CX-Fo
	for alex.bennee@linaro.org; Wed, 16 May 2018 12:12:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyzQ-0000oH-VU
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyzP-0004fT-Oe
	for qemu-devel@nongnu.org; Wed, 16 May 2018 12:09:20 -0400
Received: from [45.249.212.35] (port=58059 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyzK-0004au-W5; Wed, 16 May 2018 12:09:15 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 6C751BB0E397D;
	Wed, 16 May 2018 23:21:56 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:49 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:23 +0100
Message-ID: <20180516152026.2920-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [RFC v2 3/6] hw/arm/virt: Add pc-dimm mem hotplug
 framework
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xC3az5fTRiFx

This will be used in subsequent patches to model a chunk of
memory as pc-dimm(cold plug) if the valid iova regions are
non-contiguous. This is not yet a full hotplug support.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/aarch64-softmmu.mak |  1 +
 hw/arm/virt.c                       | 82 +++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h               |  2 +
 3 files changed, 85 insertions(+)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 9ddccf8..7a82ed8 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -8,3 +8,4 @@ CONFIG_DDC=y
 CONFIG_DPCD=y
 CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
+CONFIG_MEM_HOTPLUG=y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 05fcb62..be3ad14 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1552,9 +1552,82 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static void virt_dimm_plug(HotplugHandler *hotplug_dev,
+                         DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+    MemoryRegion *mr;
+    uint64_t align;
+    Error *local_err = NULL;
+
+    mr = ddc->get_memory_region(dimm, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+    align = memory_region_get_alignment(mr);
+    pc_dimm_memory_plug(dev, &vms->hotplug_memory, mr, align, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
+out:
+    error_propagate(errp, local_err);
+}
+
+static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
+                           DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+    PCDIMMDevice *dimm = PC_DIMM(dev);
+    PCDIMMDeviceClass *ddc = PC_DIMM_GET_CLASS(dimm);
+    MemoryRegion *mr;
+    Error *local_err = NULL;
+
+    mr = ddc->get_memory_region(dimm, &local_err);
+    pc_dimm_memory_unplug(dev, &vms->hotplug_memory, mr);
+    object_unparent(OBJECT(dev));
+
+    error_propagate(errp, local_err);
+}
+
+static void virt_machinedevice_plug_cb(HotplugHandler *hotplug_dev,
+                                      DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_plug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device plug request for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static void virt_machinedevice_unplug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_dimm_unplug(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "device unplug for not supported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
+static HotplugHandler *virt_get_hotplug_handler(MachineState *machine,
+                                             DeviceState *dev)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = machvirt_init;
     /* Start max_cpus at the maximum QEMU supports. We'll further restrict
@@ -1573,6 +1646,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
+
+    mc->get_hotplug_handler = virt_get_hotplug_handler;
+    hc->plug = virt_machinedevice_plug_cb;
+    hc->unplug = virt_machinedevice_unplug_cb;
+
 }
 
 static const TypeInfo virt_machine_info = {
@@ -1582,6 +1660,10 @@ static const TypeInfo virt_machine_info = {
     .instance_size = sizeof(VirtMachineState),
     .class_size    = sizeof(VirtMachineClass),
     .class_init    = virt_machine_class_init,
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
 
 static void machvirt_machine_init(void)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index fc24f3a..a39f29e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "hw/mem/pc-dimm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -108,6 +109,7 @@ typedef struct {
     uint32_t gic_phandle;
     uint32_t msi_phandle;
     int psci_conduit;
+    MemoryHotplugState hotplug_memory;
 } VirtMachineState;
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-- 
2.7.4


