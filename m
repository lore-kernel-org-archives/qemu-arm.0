Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4559258wrx;
        Tue, 9 Apr 2019 03:34:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVR81XGAYR5GL0IgR/LV48XafJEAnQp1eJzSnw/tdRcfGphV8MpWkFALPi4ZtBcCutn4Ic
X-Received: by 2002:a1c:eb18:: with SMTP id j24mr20814862wmh.32.1554806045727;
        Tue, 09 Apr 2019 03:34:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806045; cv=none;
        d=google.com; s=arc-20160816;
        b=jAE8DU7P9vh0IVY9VsPd0XmB0REqm/H5kBHYHe3X8GvotO30qNpDGr3fyTIhbqPd1U
         nZhKORTPM9C1kL3wZtsvJTtB2IbaYKSK5anSBiVjtQawa07pK4VKgKq9HuupCGC+uKg7
         ikk6qEsT1uZ1ecAwbV9LJFGdeNiT6U1r72fCd3uxIfPlXsZpCt93e3iLb90ECYQXni6V
         JldZlbDTCPfU6iEGDSiLJXHFTAX3jeDMsKUO6WM+MDLH3R9fB52pT4eO/YcFlxk4gI6y
         nl4SAtw31tDcKFSreCT4yfsu3SNijnmyp0BemSK4kUvXz1OLGpvW6yZwWP+G/H5krARH
         YT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=5ZdmYIFQNqiBfA0aWLC9LBlObwn+x10LBXv92xrOcy0=;
        b=U3MXKhJ79XmB1HGxu3ZPBEGqAA0RvKCI4nJx1ChM0SEPb8fbReDmNxRoFc/gsfTEVS
         Z9Ki42fhcCb9Mach10OR0kESpLJHOgJb6eEkNfjKjz+JW2FUTbSioT/7rjfmTTRgyKWQ
         Ra4rBjiws0sSaX/SaMdBorERDUQi4+wJjPF2f9RgCVWRsqjReanKqKxzZLxMN/8aGi3f
         2a6sSlKebBhrdbCGq6o++mXD+ni1rXOeenzN5QBKEC3lwI/U31Uumpd8ancy1iqHRW9a
         hzvzPyIhpiydwYT5dOL2K36Nv4Z+8Huf/bLwxxadiVb8HD6M0PU8/sk1CK1kwiBqi+xA
         Ps/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si20962158wrs.332.2019.04.09.03.34.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:34:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo4q-0008A8-NY
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:34:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo21-0006AM-Ci
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1y-0007Jj-BX
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2201 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo1x-0007Ib-Qh; Tue, 09 Apr 2019 06:31:06 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 9C82FEA73BA413BBCD14;
	Tue,  9 Apr 2019 18:31:02 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:30:54 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:31 +0100
Message-ID: <20190409102935.28292-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v4 4/8] hw/arm/virt: Add memory hotplug framework
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yegTNbbpoGTl

From: Eric Auger <eric.auger@redhat.com>

This patch adds the memory hot-plug/hot-unplug infrastructure
in machvirt. The device memory is not yet exposed to the Guest
either though DT or ACPI and hence both cold/hot plug of memory
is explicitly disabled for now.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 default-configs/arm-softmmu.mak |  3 +++
 hw/arm/virt.c                   | 45 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 613d19a..9f4b803 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -160,3 +160,6 @@ CONFIG_MUSICPAL=y
 
 # for realview and versatilepb
 CONFIG_LSI_SCSI_PCI=y
+
+CONFIG_MEM_DEVICE=y
+CONFIG_DIMM=y
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ce2664a..da516b3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -61,6 +61,8 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/mem/pc-dimm.h"
+#include "hw/mem/nvdimm.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1806,6 +1808,34 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
     return ms->possible_cpus;
 }
 
+static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                 Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        error_setg(errp, "memory cold/hot plug is not yet supported");
+        return;
+    }
+
+    pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
+}
+
+static void virt_memory_plug(HotplugHandler *hotplug_dev,
+                             DeviceState *dev, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+
+    pc_dimm_plug(PC_DIMM(dev), MACHINE(vms), NULL);
+
+}
+
+static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                            DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_pre_plug(hotplug_dev, dev, errp);
+    }
+}
+
 static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                         DeviceState *dev, Error **errp)
 {
@@ -1817,12 +1847,23 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
+        virt_memory_plug(hotplug_dev, dev, errp);
+    }
+}
+
+static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                          DeviceState *dev, Error **errp)
+{
+    error_setg(errp, "device unplug request for unsupported device"
+               " type: %s", object_get_typename(OBJECT(dev)));
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
 
@@ -1886,7 +1927,9 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
+    hc->pre_plug = virt_machine_device_pre_plug_cb;
     hc->plug = virt_machine_device_plug_cb;
+    hc->unplug_request = virt_machine_device_unplug_request_cb;
 }
 
 static void virt_instance_init(Object *obj)
-- 
2.7.4


