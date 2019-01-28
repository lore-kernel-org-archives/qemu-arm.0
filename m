Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3146582wrt;
        Mon, 28 Jan 2019 03:07:37 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4D0qtjg4zj3jVXDK4RRqyVsFK3f4ndPOiwmuH4YduoT6rbwBCOE3rFRrWUoCfXIqUVSdkx
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr20975746wrs.318.1548673657285;
        Mon, 28 Jan 2019 03:07:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673657; cv=none;
        d=google.com; s=arc-20160816;
        b=RVAqLHD2yxR7PCp04hfrixroRZvJPq5wQbQp7XnaSwsqyNjob4PoDzV5oV84Yt97j7
         zAN0dtwrclBVz6UePYa30siS/hhK4sPFPdwkEfeRsZ1cL6Xi6FjtDEpvcHH+bym1tezI
         oT38qau/y6EtBDiNgMwIhZLgizMpWjYblee2mEB8wKCyCl06jmGvk0w64WstAR95yTyB
         Z2JPFgd3Em527y/TOsMxXvXuqECJLsOrFJzQ7i3OkWei1ixcQGiSYm9s3VQZI+KJYvPv
         yd8CJOAA2vFxmDJ5m5Vp/BctX4fLdZh6hQsCUOylWJCmJvzO53qmXaaVlvB5qYoQrX6T
         GCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=KvZxo5x/BCgRYbg0IbVFilSp+tj7rJxZ7buifNClvZw=;
        b=IjlGiMn5KXm5/oZ99ZRRDVSfycn1XajmaD3pSpmunnH+jJQRk570iHBSKS0Pgz7Uux
         hDVTIdDcZErDEtADYuroH/tHzF8uzdYv6Nkjdf+CMsbq+sXhr5OmYKIYxT07wmHYio/l
         ZWCiyqmUyWdYe+86o60VUaEHjv0OzX9xf49OoenUfnj380EFJzyVJIl7zo9KJoCnKD2Z
         aK/iKfkbGUcfrz2I0P0E0UxGBHKmbFEUfUNhzjrUmQisZZSG+T32BWMmbFBYHOcGl5Aw
         ZgRpW5NUp/Nw91SeuFtqOFkIqp/x98ZvWJUQfNsxHABh34bXUXRLMErXAF8Vj/MPrBNF
         Sxig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si80581397wro.332.2019.01.28.03.07.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:07:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4lK-0003wp-Bw
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:07:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4l2-0003uF-6B
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4l0-0004Bm-Qf
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2174 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4l0-00044k-F6; Mon, 28 Jan 2019 06:07:14 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id CA9DBE647A6015494704;
	Mon, 28 Jan 2019 19:06:58 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 28 Jan 2019 19:06:48 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <eric.auger@redhat.com>, <shannon.zhaosl@gmail.com>,
	<peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Jan 2019 11:05:45 +0000
Message-ID: <20190128110545.20644-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [RFC PATCH 3/4] hw/arm/virt: Enable pc-dimm hotplug
 support
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
Cc: linuxarm@huawei.com, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: spsN3d6r6Jtt

pc-dimm memory hotplug is enabled using GPIO(Pin 2) based ACPI
event. Hot removal functionality is not yet supported.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 884960d..cf64554 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -62,6 +62,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/pc-hotplug.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1651,7 +1652,14 @@ static void machvirt_init(MachineState *machine)
         nvdimm_init_acpi_state(acpi_nvdimm_state, sysmem,
                                vms->fw_cfg, OBJECT(vms));
     }
+    if (vms->acpi_memhp_state.is_enabled) {
+        MemHotplugState *state =  &vms->acpi_memhp_state;
+        hwaddr base;
 
+        state->hw_reduced_acpi = true;
+        base = vms->memmap[VIRT_ACPI_IO].base + ACPI_MEMORY_HOTPLUG_BASE;
+        acpi_memory_hotplug_init(sysmem, OBJECT(vms), state, base);
+    }
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
@@ -1819,6 +1827,20 @@ static void virt_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimm_state->persistence_string = g_strdup(value);
 }
 
+static bool virt_get_memhp_support(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->acpi_memhp_state.is_enabled;
+}
+
+static void virt_set_memhp_support(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->acpi_memhp_state.is_enabled = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -1863,8 +1885,8 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
     VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
 
-    if (dev->hotplugged) {
-        error_setg(errp, "memory hotplug is not supported");
+    if (dev->hotplugged && is_nvdimm) {
+        error_setg(errp, "nvdimm hotplug is not supported");
     }
 
     if (is_nvdimm && !vms->acpi_nvdimm_state.is_enabled) {
@@ -1875,6 +1897,22 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
 }
 
+static void virt_memhp_send_event(HotplugHandler *hotplug_dev, DeviceState *dev,
+                                  Error **errp)
+{
+    DeviceState *gpio_dev;
+    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
+
+    gpio_dev = virt_get_gpio_dev(GPIO_PCDIMM);
+    if (!gpio_dev) {
+        error_setg(errp, "No dev interface to send hotplug event");
+        return;
+    }
+    acpi_memory_plug_cb(hotplug_dev, &vms->acpi_memhp_state,
+                        dev, errp);
+    qemu_set_irq(qdev_get_gpio_in(gpio_dev, 0), 1);
+}
+
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
@@ -1891,6 +1929,10 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
         nvdimm_plug(&vms->acpi_nvdimm_state);
     }
 
+    if (dev->hotplugged && !is_nvdimm) {
+        virt_memhp_send_event(hotplug_dev, dev, errp);
+    }
+
 out:
     error_propagate(errp, local_err);
 }
@@ -1898,6 +1940,11 @@ out:
 static void virt_memory_unplug(HotplugHandler *hotplug_dev,
                                DeviceState *dev, Error **errp)
 {
+    if (dev->hotplugged) {
+        error_setg(errp, "memory hot unplug is not supported");
+        return;
+    }
+
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
     object_unparent(OBJECT(dev));
 }
@@ -2085,6 +2132,12 @@ static void virt_instance_init(Object *obj)
                                     "Set NVDIMM persistence"
                                     "Valid values are cpu and mem-ctrl", NULL);
 
+    vms->acpi_memhp_state.is_enabled = true;
+    object_property_add_bool(obj, "memory-hotplug-support",
+                             virt_get_memhp_support,
+                             virt_set_memhp_support,
+                             NULL);
+
     vms->irqmap = a15irqmap;
 }
 
-- 
2.7.4


