Received: by 10.25.205.13 with SMTP id d13csp2430827lfg;
        Tue, 13 Dec 2016 13:59:17 -0800 (PST)
X-Received: by 10.55.65.82 with SMTP id o79mr24840061qka.136.1481666357204;
        Tue, 13 Dec 2016 13:59:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f3si28651298qkc.200.2016.12.13.13.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:59:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGv6Q-0001uA-BF
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:59:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutJ-0002UV-CD
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutI-0007Yp-85
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutH-0007YO-Vn; Tue, 13 Dec 2016 16:45:40 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04D002C7312;
	Tue, 13 Dec 2016 21:45:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQS014685; Tue, 13 Dec 2016 16:45:37 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:17 +0100
Message-Id: <20161213214522.25548-7-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 13 Dec 2016 21:45:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 06/11] hw/arm/virt: move VirtMachineState/Class
 to virt.h
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4krseErEZnei

In preparation to share more Virt machine state than just guest-info
with other mach-virt source files, move the State and Class structures
to virt.h

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c         | 51 +++++++--------------------------------------------
 include/hw/arm/virt.h | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 44 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b137d9bbb689..7860fade52f1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -58,50 +58,6 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 
-/* Number of external interrupt lines to configure the GIC with */
-#define NUM_IRQS 256
-
-#define PLATFORM_BUS_NUM_IRQS 64
-
-static ARMPlatformBusSystemParams platform_bus_params;
-
-typedef struct {
-    MachineClass parent;
-    bool disallow_affinity_adjustment;
-    bool no_its;
-    bool no_pmu;
-    bool claim_edge_triggered_timers;
-} VirtMachineClass;
-
-typedef struct {
-    MachineState parent;
-    VirtGuestInfo acpi_guest_info;
-    Notifier machine_done;
-    bool secure;
-    bool highmem;
-    bool virt;
-    int32_t gic_version;
-    struct arm_boot_info bootinfo;
-    const MemMapEntry *memmap;
-    const int *irqmap;
-    int smp_cpus;
-    void *fdt;
-    int fdt_size;
-    uint32_t clock_phandle;
-    uint32_t gic_phandle;
-    uint32_t msi_phandle;
-    int psci_conduit;
-} VirtMachineState;
-
-#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-#define VIRT_MACHINE(obj) \
-    OBJECT_CHECK(VirtMachineState, (obj), TYPE_VIRT_MACHINE)
-#define VIRT_MACHINE_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(VirtMachineClass, obj, TYPE_VIRT_MACHINE)
-#define VIRT_MACHINE_CLASS(klass) \
-    OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
-
-
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
                                                     void *data) \
@@ -131,6 +87,13 @@ typedef struct {
     DEFINE_VIRT_MACHINE_LATEST(major, minor, false)
 
 
+/* Number of external interrupt lines to configure the GIC with */
+#define NUM_IRQS 256
+
+#define PLATFORM_BUS_NUM_IRQS 64
+
+static ARMPlatformBusSystemParams platform_bus_params;
+
 /* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
  * RAM can go up to the 256GB mark, leaving 256GB of the physical
  * address space unallocated and free for future use between 256G and 512G.
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c2c1f6837442..77d25dbddb62 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -33,6 +33,8 @@
 #include "qemu-common.h"
 #include "exec/hwaddr.h"
 #include "qemu/notify.h"
+#include "hw/boards.h"
+#include "hw/arm/arm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -89,6 +91,43 @@ typedef struct VirtGuestInfo {
     bool no_its;
 } VirtGuestInfo;
 
+typedef struct {
+    MachineClass parent;
+    bool disallow_affinity_adjustment;
+    bool no_its;
+    bool no_pmu;
+    bool claim_edge_triggered_timers;
+} VirtMachineClass;
+
+typedef struct {
+    MachineState parent;
+    VirtGuestInfo acpi_guest_info;
+    Notifier machine_done;
+    bool secure;
+    bool highmem;
+    bool virt;
+    int32_t gic_version;
+    struct arm_boot_info bootinfo;
+    const MemMapEntry *memmap;
+    const int *irqmap;
+    int smp_cpus;
+    void *fdt;
+    int fdt_size;
+    uint32_t clock_phandle;
+    uint32_t gic_phandle;
+    uint32_t msi_phandle;
+    int psci_conduit;
+} VirtMachineState;
+
+#define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
+#define VIRT_MACHINE(obj) \
+    OBJECT_CHECK(VirtMachineState, (obj), TYPE_VIRT_MACHINE)
+#define VIRT_MACHINE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(VirtMachineClass, obj, TYPE_VIRT_MACHINE)
+#define VIRT_MACHINE_CLASS(klass) \
+    OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
+
+
 void virt_acpi_setup(VirtGuestInfo *guest_info);
 
 #endif /* QEMU_ARM_VIRT_H */
-- 
2.9.3

