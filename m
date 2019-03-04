Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3448975wrx;
        Mon, 4 Mar 2019 02:17:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvgIr4D2TfhUrkdQfCtx+I6jAp+OHUvA0OkDKqRn9t6NIqrW6c2WtMvT6aW+DFbIxAjLy6
X-Received: by 2002:a81:84c5:: with SMTP id u188mr13796953ywf.227.1551694673488;
        Mon, 04 Mar 2019 02:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694673; cv=none;
        d=google.com; s=arc-20160816;
        b=okpnXJFmGnAu3sw1K3FZPksBgpCUKqZu64ZhqUDOQW2/XXwk4H5juXATmPSdbNIxWx
         mbqe8/heAzO2R6P2S12CnxYKOwveBIS6VWO/9hZ9296R3qF6sV/8Hbx5fHWPCQ4FYxpc
         QIl/JFXWTeI5T+MgafkFmX8rkolGPyRnpkedjs9dOhOO8Ka+WYQEAbrsrMTG9aQOdwm1
         swGGs6RFkiHoLHQgoMa+esIhQCCzJGXcI2pIcxsX0EhxOphaclXRsHhKPwxCRC1f2ayF
         3ayZAavDh05SLud0pmZIhXmsvn2gyR3rHejrY5YBlhTK0c0KMqel3TuEOuLZyKpJVPpR
         oKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tGzZb4BBGhO98sthmmJRxGc8GOVzD8wYd4Yn/sl+y2U=;
        b=dG4zAyjX+3T/ubNaDWncG2Tpt85Vy9TosMwSRZaGZFhK7uSAtbbKBiAgK9b+ix988O
         Ttdv1TXSw4ZpS09jNiChn/bs+m9fYaDfQVbPj+6bK0ks2bJz81ZPvT/9aTdeBI0t3jAU
         PRLxmYiio7MMS/SbEd6gyMHmmjEibJHhNwNAs4f3ml3QFckFxGAep62RNG9Nh+v4kLVe
         G49wjrxRJqUe6UDBApgS/R5aKRu7TyLYaFYYYs1ZeEpve0gwWYW4MzSypSIrxsLy/h6X
         nTY8cni84WjoSzqnGm1PFmk0bsbqfyYUwgXFCdbJfrLwIvXFGgzeHP3dVH/5tzvP+U+S
         pIQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si3041250ywa.427.2019.03.04.02.17.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:17:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kfQ-0004JP-Bd
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:17:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcR-0001lv-Ly
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kcQ-0000Qt-Gh
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49708)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kcQ-0000Px-7G; Mon, 04 Mar 2019 05:14:46 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AF6337E60;
	Mon,  4 Mar 2019 10:14:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DAC432B893;
	Mon,  4 Mar 2019 10:14:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:36 +0100
Message-Id: <20190304101339.25970-8-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 04 Mar 2019 10:14:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v12 07/10] hw/arm/virt: Dynamic memory map
 depending on RAM requirements
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1tfMIIMOlzvZ

Up to now the memory map has been static and the high IO region
base has always been 256GiB.

This patch modifies the virt_set_memmap() function, which freezes
the memory map, so that the high IO range base becomes floating,
located after the initial RAM and the device memory.

The function computes
- the base of the device memory,
- the size of the device memory,
- the high IO region base
- the highest GPA used in the memory map.

Entries of the high IO region are assigned a base address. The
device memory is initialized.

The highest GPA used in the memory map will be used at VM creation
to choose the requested IPA size.

Setting all the existing highmem IO regions beyond the RAM
allows to have a single contiguous RAM region (initial RAM and
possible hotpluggable device memory). That way we do not need
to do invasive changes in the EDK2 FW to support a dynamic
RAM base.

Still the user cannot request an initial RAM size greater than 255GB.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v10 -> v11:
- remove RAMBASE
- s/256GiB/vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES
  while checking if high io region base < 256GB
- added a comment in base_memmap about the actual RAM size

v9 -> v10:
- remove check of maxram_size 1GB alignment

v8 -> v9:
- add if (machine->device_memory) check

v7 -> v8:
- allocate ms->device_memory and removes vms->device_memory_base and
  vms->device_memory_storage
- remove (ms->maxram_size > ms->ram_size || ms->ram_slots > 0) and
  (ms->ram_size > (ram_addr_t)LEGACY_RAMLIMIT_BYTES) checks
- initialize the device memory
- move the slots nb check and maxram_size alignment checks in this
  patch
---
 hw/arm/virt.c         | 52 ++++++++++++++++++++++++++++++++++++++-----
 include/hw/arm/virt.h |  1 +
 2 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9596c7c7f1..2e788a0361 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/acpi/acpi.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -107,8 +108,8 @@
  * of a terabyte of RAM will be doing it on a host with more than a
  * terabyte of physical address space.)
  */
-#define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+#define LEGACY_RAMLIMIT_GB 255
+#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such =
as UEFI.
@@ -149,7 +150,8 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_PCIE_MMIO] =3D          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
-    [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+    /* Actual RAM size depends on initial RAM and device memory settings=
 */
+    [VIRT_MEM] =3D                { GiB, LEGACY_RAMLIMIT_BYTES },
 };
=20
 /*
@@ -1370,7 +1372,8 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSta=
te *vms, int idx)
=20
 static void virt_set_memmap(VirtMachineState *vms)
 {
-    hwaddr base;
+    MachineState *ms =3D MACHINE(vms);
+    hwaddr base, device_memory_base, device_memory_size;
     int i;
=20
     vms->memmap =3D extended_memmap;
@@ -1379,7 +1382,32 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i] =3D base_memmap[i];
     }
=20
-    base =3D 256 * GiB; /* Top of the legacy initial RAM region */
+    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
+        error_report("unsupported number of memory slots: %"PRIu64,
+                     ms->ram_slots);
+        exit(EXIT_FAILURE);
+    }
+
+    /*
+     * We compute the base of the high IO region depending on the
+     * amount of initial and device memory. The device memory start/size
+     * is aligned on 1GiB. We never put the high IO region below 256GiB
+     * so that if maxram_size is < 255GiB we keep the legacy memory map.
+     * The device region size assumes 1GiB page max alignment per slot.
+     */
+    device_memory_base =3D
+        ROUND_UP(vms->memmap[VIRT_MEM].base + ms->ram_size, GiB);
+    device_memory_size =3D ms->maxram_size - ms->ram_size + ms->ram_slot=
s * GiB;
+
+    /* Base address of the high IO region */
+    base =3D device_memory_base + ROUND_UP(device_memory_size, GiB);
+    if (base < device_memory_base) {
+        error_report("maxmem/slots too huge");
+        exit(EXIT_FAILURE);
+    }
+    if (base < vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES) {
+        base =3D vms->memmap[VIRT_MEM].base + LEGACY_RAMLIMIT_BYTES;
+    }
=20
     for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
         hwaddr size =3D extended_memmap[i].size;
@@ -1389,6 +1417,13 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size =3D size;
         base +=3D size;
     }
+    vms->highest_gpa =3D base - 1;
+    if (device_memory_size > 0) {
+        ms->device_memory =3D g_malloc0(sizeof(*ms->device_memory));
+        ms->device_memory->base =3D device_memory_base;
+        memory_region_init(&ms->device_memory->mr, OBJECT(vms),
+                           "device-memory", device_memory_size);
+    }
 }
=20
 static void machvirt_init(MachineState *machine)
@@ -1475,7 +1510,8 @@ static void machvirt_init(MachineState *machine)
     vms->smp_cpus =3D smp_cpus;
=20
     if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM", RAMLI=
MIT_GB);
+        error_report("mach-virt: cannot model more than %dGB RAM",
+                     LEGACY_RAMLIMIT_GB);
         exit(1);
     }
=20
@@ -1569,6 +1605,10 @@ static void machvirt_init(MachineState *machine)
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram)=
;
+    if (machine->device_memory) {
+        memory_region_add_subregion(sysmem, machine->device_memory->base=
,
+                                    &machine->device_memory->mr);
+    }
=20
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f3f7fae4ac..507517c603 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -131,6 +131,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    hwaddr highest_gpa;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

