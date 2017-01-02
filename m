Received: by 10.25.205.13 with SMTP id d13csp8539916lfg;
        Mon, 2 Jan 2017 12:12:50 -0800 (PST)
X-Received: by 10.55.72.141 with SMTP id v135mr53428432qka.50.1483387970376;
        Mon, 02 Jan 2017 12:12:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 103si31539897qkq.81.2017.01.02.12.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:12:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8yN-0002Rb-Ld
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:12:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8oG-0001o0-CL
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8oD-0003u1-9e
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43238)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8oD-0003th-1c; Mon, 02 Jan 2017 15:02:17 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D90437E64;
	Mon,  2 Jan 2017 20:02:17 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOl017390; Mon, 2 Jan 2017 15:02:15 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:46 +0100
Message-Id: <20170102200153.28864-10-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 02 Jan 2017 20:02:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 09/16] hw/arm/virt: move
 VirtMachineState/Class to virt.h
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5RKivAEM3Nwq

In preparation to share more Virt machine state than just guest-info
with other mach-virt source files, move the State and Class structures
to virt.h

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c         | 52 +++++++--------------------------------------------
 include/hw/arm/virt.h | 39 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 45 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e51c1668e16e..51cb094d80f7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -41,7 +41,6 @@
 #include "sysemu/numa.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
-#include "hw/boards.h"
 #include "hw/compat.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
@@ -58,50 +57,6 @@
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
@@ -131,6 +86,13 @@ typedef struct {
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
index 248ba6f755a3..59ce353f5e71 100644
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
@@ -87,6 +89,43 @@ typedef struct VirtGuestInfo {
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

