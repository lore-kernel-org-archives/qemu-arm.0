Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8272761wrx;
        Fri, 8 Mar 2019 03:50:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqycNUS/mRdXwOm9bR39ODUugjbAiHKTtwLvaTMTlgynnMDVaw+3auRzKqxRKg91I/+lodkE
X-Received: by 2002:a25:407:: with SMTP id 7mr14263202ybe.309.1552045805295;
        Fri, 08 Mar 2019 03:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552045805; cv=none;
        d=google.com; s=arc-20160816;
        b=JxyMJM0YEZgB0/7qZkcfGsMh7VPhdwG4mokPGQZsrrLFkmW6CTAVlvJkwM1QCXC3No
         qmaFAFGUL4jtccKUC2GYrl7GXA32PGW4tReYz2RnTAFzvEFOVQzpqlKz5qG3EJmth+FH
         uvgaRpA98EgC9DXZR+lwwLFcHJpmToOGefb5TqFEcj6b8lCwb9L7ACUvsY3Aomd7u3NP
         XsuwUBErxJowrLSym9uFXhBRx7lLkpRzyA8ovjCZh8FHrYD3Ju+BNQ3CFGVBpIWvzgbP
         AqhDy1HaRMlaNgZOZsBzFL7svkgn2mMskcja1SN/o1aHx/5ls2ZCUMdYD4UEJjjTsAuV
         Nlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=8dAZh6ardznfCQ5M2tkxm3YaTQKmKl9t7SYpkC9mBe4=;
        b=K+zOWdXgQy+kSwUD55V3Cp/LAc7unOVZ5M5pWmx5M99uJi8v5sqkR8n9yUcSZyjgq1
         cr+fc3Sc3mG/6aRy6iw0dUW61u3BBte32ZTS7mASUIE4baPc1geoVoKvFDgmokYUsw5I
         l7KrW9JVGMLwkuvr8s463hduzfCo91Bw+36kf0HhBb/Krw6FB46zD1t3X+UV2MaeASxz
         DB4G/6LhRd9aIjgko7QdWnwJPGYxgGWMPD9sddumwcim4mSciKaLWq9j8Bd9kFN28bC8
         Tgqv0TYlzz9Dxv+59oMw6rMfxjwTr5dQJVCK7OeT9KdMV9LHekPxzl6ea+GArDaugO6W
         rC7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f66si3873022ybb.336.2019.03.08.03.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:50:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2E0p-000430-Ll
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:50:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvt-0008Tx-6a
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvo-00075Q-Vl
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2189 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvo-0006m5-IH; Fri, 08 Mar 2019 06:44:52 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 6D4E06C0D5FC7E7957FB;
	Fri,  8 Mar 2019 19:44:48 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:39 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:18 +0000
Message-ID: <20190308114218.26692-12-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [PATCH v2 11/11] hw/arm/virt: Add GED irq routing and
 Enable memory hotplug
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pQE60ui2DLv

Adds GED irq routing to guest and enables memory hotplug.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi.c    | 27 +++++++++++++++++++++++++--
 hw/arm/virt.c         | 17 +++++++++++------
 include/hw/arm/virt.h |  3 ++-
 3 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi.c b/hw/arm/virt-acpi.c
index 3b55c63..c5a9311 100644
--- a/hw/arm/virt-acpi.c
+++ b/hw/arm/virt-acpi.c
@@ -32,6 +32,7 @@ typedef struct VirtAcpiState {
     SysBusDevice parent_obj;
     MemHotplugState memhp_state;
     GEDState ged_state;
+    qemu_irq *gsi;
 } VirtAcpiState;
 
 #define TYPE_VIRT_ACPI "virt-acpi"
@@ -71,6 +72,21 @@ static void virt_device_unplug_cb(HotplugHandler *hotplug_dev,
 
 static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
+    VirtAcpiState *s = VIRT_ACPI(adev);
+    uint32_t sel = ACPI_GED_IRQ_SEL_INIT;
+
+    if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
+        sel = ACPI_GED_IRQ_SEL_MEM;
+    } else {
+        /* Unknown event. Return without generating interrupt. */
+        return;
+    }
+
+    /*
+     * We inject the hotplug interrupt. The IRQ selector will make
+     * the difference from the ACPI table.
+     */
+    acpi_ged_event(&s->ged_state, s->gsi, sel);
 }
 
 static void virt_device_realize(DeviceState *dev, Error **errp)
@@ -89,9 +105,16 @@ static void virt_device_realize(DeviceState *dev, Error **errp)
     }
 }
 
-DeviceState *virt_acpi_init(void)
+DeviceState *virt_acpi_init(qemu_irq *gsi)
 {
-    return sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
+    DeviceState *dev;
+    VirtAcpiState *s;
+
+    dev = sysbus_create_simple(TYPE_VIRT_ACPI, -1, NULL);
+    s = VIRT_ACPI(dev);
+    s->gsi = gsi;
+
+    return dev;
 }
 
 static Property virt_acpi_properties[] = {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 352dbb1..fa352c5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -577,6 +577,12 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
     fdt_add_v2m_gic_node(vms);
 }
 
+static void virt_gsi_handler(void *opaque, int n, int level)
+{
+    qemu_irq *gic_irq = opaque;
+    qemu_set_irq(gic_irq[n], level);
+}
+
 static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 {
     /* We create a standalone GIC */
@@ -692,6 +698,8 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         pic[i] = qdev_get_gpio_in(gicdev, i);
     }
 
+    vms->gsi = qemu_allocate_irqs(virt_gsi_handler, pic, NUM_IRQS);
+
     fdt_add_gic_node(vms);
 
     if (type == 3 && vms->its) {
@@ -1444,7 +1452,7 @@ static void machvirt_init(MachineState *machine)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
-    qemu_irq pic[NUM_IRQS];
+    qemu_irq *pic;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     int n, virt_max_cpus;
@@ -1640,6 +1648,7 @@ static void machvirt_init(MachineState *machine)
 
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
+    pic = g_new0(qemu_irq, NUM_IRQS);
     create_gic(vms, pic);
 
     fdt_add_pmu_nodes(vms);
@@ -1670,7 +1679,7 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms, pic);
 
-    vms->acpi = virt_acpi_init();
+    vms->acpi = virt_acpi_init(vms->gsi);
     virt_acpi_ged_conf(vms);
 
     vms->bootinfo.ram_size = machine->ram_size;
@@ -1842,10 +1851,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
 {
     const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
 
-    if (dev->hotplugged) {
-        error_setg(errp, "memory hotplug is not supported");
-    }
-
     if (is_nvdimm) {
         error_setg(errp, "nvdimm is not yet supported");
         return;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 49fda81..30ff460 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -136,6 +136,7 @@ typedef struct {
     int psci_conduit;
     hwaddr highest_gpa;
     DeviceState *acpi;
+    qemu_irq *gsi;
     GedEvent *ged_events;
     uint32_t ged_events_size;
 } VirtMachineState;
@@ -151,7 +152,7 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
-DeviceState *virt_acpi_init(void);
+DeviceState *virt_acpi_init(qemu_irq *gsi);
 
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
-- 
2.7.4


