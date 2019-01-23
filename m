Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp517432wrt;
        Wed, 23 Jan 2019 02:16:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4V+tU5XgMFu7qshCxJr5LBT10uaDvGs909Opv5bGkTwdH4m8avW15gdbmHDda7nge64J1l
X-Received: by 2002:a1c:a00f:: with SMTP id j15mr2015080wme.84.1548238560864;
        Wed, 23 Jan 2019 02:16:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238560; cv=none;
        d=google.com; s=arc-20160816;
        b=ipq4pHnw6yiu8HtDxK+0BkduNPEJCUBG24Dbh9cI0W6ZOs8UbNxinpteDuGuiHOC3d
         kXXy5Xx1e/n1hnZshAFUZvJgOzqYU7+MAWXy2DN7QZLW7wYq5cBO1sZT5pgzvnDlX44v
         QEdx2pOIRBVP16HDd2GVAkEC/tVr0KNNJ7wbsGCEITrSo3CzIe28kXDRnp53C3NYRYzr
         QZ40Lfok61WaVcnw8pS5m3lmoYSyvYpSDUwiAdkBhcMTA+Me1P2BHTs16TGvHxCQsais
         mfWfMPUay5RLb0ozS6aDcDGV+djoS0NfQHFiQUiYyUT44OxnmdXl7QWQLXqT2GSXWIK5
         93Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DGZNYTL1bccDTkgMHEkTUaYyj123PUI7CnDk9aCVilA=;
        b=0pExu0kmahvW+uaf5ScuJSKxKq8W0LjpXDTPu2se2RyImFUFAdlYZxCfMj+D2ExFgt
         pdk56wSdy2j2SZeK9/BXbBv4qtrjxXqZUC5fOpuexm/+8RM5ryy0aH6Ru49tQG+KISoL
         XJrxrxKDm6j1ArFDMxBfbpD1JryuYQBWYfj62Oczm5eGFytM6YpVBR0IxkmXU4PNwgze
         CCQySnFmkL7YGXZUs+29jPJ3WMQ7cQ8UE+c9a79+cPXH4K+h0FdCbOVB0dH5i9Us3Fhf
         iOlKfBU+t2LXPVS+GVXPPugjOxhdwG8XWMjaWYZE53xNchgMi/D/+g2oMibtpAEppYbC
         CquQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h192si38269959wmg.145.2019.01.23.02.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:16:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFZf-0001RR-Mh
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:15:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZN-0001Om-LM
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZL-0007CJ-Un
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:25153)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZL-00076x-8b; Wed, 23 Jan 2019 05:15:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF76E19E53;
	Wed, 23 Jan 2019 10:15:31 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51C7C60181;
	Wed, 23 Jan 2019 10:15:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:44 +0100
Message-Id: <20190123101458.12478-5-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Jan 2019 10:15:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 04/18] hw/arm/virt: Split the memory map
 description
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YjLpGCFPtW8d

In the prospect to introduce an extended memory map supporting more
RAM, let's split the memory map array into two parts:

- the former a15memmap contains regions below and including the RAM
- extended_memmap, only initialized with entries located after the RAM.
  the base address of each entry is an offset relative to the top of
  the RAM.

This new split will allow to grow the RAM size without chaanging the
static description of the high regions.

At that point the memory map is not changed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c |  8 ++++----
 hw/arm/virt.c            | 40 +++++++++++++++++++++++++++++-----------
 include/hw/arm/virt.h    | 16 +++++++++++-----
 3 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 04b62c714d..829d2f0035 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -229,8 +229,8 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMa=
pEntry *memmap,
                      size_pio));
=20
     if (use_highmem) {
-        hwaddr base_mmio_high =3D memmap[VIRT_PCIE_MMIO_HIGH].base;
-        hwaddr size_mmio_high =3D memmap[VIRT_PCIE_MMIO_HIGH].size;
+        hwaddr base_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].base;
+        hwaddr size_mmio_high =3D memmap[VIRT_HIGH_PCIE_MMIO].size;
=20
         aml_append(rbuf,
             aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXE=
D,
@@ -663,8 +663,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, Vi=
rtMachineState *vms)
             gicr =3D acpi_data_push(table_data, sizeof(*gicr));
             gicr->type =3D ACPI_APIC_GENERIC_REDISTRIBUTOR;
             gicr->length =3D sizeof(*gicr);
-            gicr->base_address =3D cpu_to_le64(memmap[VIRT_GIC_REDIST2].=
base);
-            gicr->range_length =3D cpu_to_le32(memmap[VIRT_GIC_REDIST2].=
size);
+            gicr->base_address =3D cpu_to_le64(memmap[VIRT_HIGH_GIC_REDI=
ST2].base);
+            gicr->range_length =3D cpu_to_le32(memmap[VIRT_HIGH_GIC_REDI=
ST2].size);
         }
=20
         if (its_class_name() && !vmc->no_its) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99c2b6e60d..ba4088895a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,6 +29,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
@@ -149,11 +150,15 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+};
+
+/* Memory map beyond the RAM */
+static MemMapEntry extended_memmap[] =3D {
     /* Additional 64 MB redist region (can contain up to 512 redistribut=
ors) */
-    [VIRT_GIC_REDIST2] =3D        { 0x4000000000ULL, 0x4000000 },
-    [VIRT_PCIE_ECAM_HIGH] =3D     { 0x4010000000ULL, 0x10000000 },
+    [VIRT_HIGH_GIC_REDIST2] =3D   { 0x0, S_64MiB },
+    [VIRT_HIGH_PCIE_ECAM] =3D     { S_256MiB, S_256MiB },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
-    [VIRT_PCIE_MMIO_HIGH] =3D   { 0x8000000000ULL, 0x8000000000ULL },
+    [VIRT_HIGH_PCIE_MMIO] =3D     { S_512GiB, S_512GiB },
 };
=20
 static const int a15irqmap[] =3D {
@@ -435,8 +440,8 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                          2, vms->memmap[VIRT_GIC_DIST].s=
ize,
                                          2, vms->memmap[VIRT_GIC_REDIST]=
.base,
                                          2, vms->memmap[VIRT_GIC_REDIST]=
.size,
-                                         2, vms->memmap[VIRT_GIC_REDIST2=
].base,
-                                         2, vms->memmap[VIRT_GIC_REDIST2=
].size);
+                                         2, vms->memmap[VIRT_HIGH_GIC_RE=
DIST2].base,
+                                         2, vms->memmap[VIRT_HIGH_GIC_RE=
DIST2].size);
         }
=20
         if (vms->virt) {
@@ -584,7 +589,7 @@ static void create_gic(VirtMachineState *vms, qemu_ir=
q *pic)
=20
         if (nb_redist_regions =3D=3D 2) {
             uint32_t redist1_capacity =3D
-                        vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIS=
T_SIZE;
+                    vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDI=
ST_SIZE;
=20
             qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
@@ -601,7 +606,8 @@ static void create_gic(VirtMachineState *vms, qemu_ir=
q *pic)
     if (type =3D=3D 3) {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base)=
;
         if (nb_redist_regions =3D=3D 2) {
-            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].=
base);
+            sysbus_mmio_map(gicbusdev, 2,
+                            vms->memmap[VIRT_HIGH_GIC_REDIST2].base);
         }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
@@ -1088,8 +1094,8 @@ static void create_pcie(VirtMachineState *vms, qemu=
_irq *pic)
 {
     hwaddr base_mmio =3D vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio =3D vms->memmap[VIRT_PCIE_MMIO].size;
-    hwaddr base_mmio_high =3D vms->memmap[VIRT_PCIE_MMIO_HIGH].base;
-    hwaddr size_mmio_high =3D vms->memmap[VIRT_PCIE_MMIO_HIGH].size;
+    hwaddr base_mmio_high =3D vms->memmap[VIRT_HIGH_PCIE_MMIO].base;
+    hwaddr size_mmio_high =3D vms->memmap[VIRT_HIGH_PCIE_MMIO].size;
     hwaddr base_pio =3D vms->memmap[VIRT_PCIE_PIO].base;
     hwaddr size_pio =3D vms->memmap[VIRT_PCIE_PIO].size;
     hwaddr base_ecam, size_ecam;
@@ -1418,7 +1424,7 @@ static void machvirt_init(MachineState *machine)
      */
     if (vms->gic_version =3D=3D 3) {
         virt_max_cpus =3D vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDI=
ST_SIZE;
-        virt_max_cpus +=3D vms->memmap[VIRT_GIC_REDIST2].size / GICV3_RE=
DIST_SIZE;
+        virt_max_cpus +=3D vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GIC=
V3_REDIST_SIZE;
     } else {
         virt_max_cpus =3D GIC_NCPU;
     }
@@ -1780,6 +1786,7 @@ static void virt_instance_init(Object *obj)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
     VirtMachineClass *vmc =3D VIRT_MACHINE_GET_CLASS(vms);
+    int i;
=20
     /* EL3 is disabled by default on virt: this makes us consistent
      * between KVM and TCG for this board, and it also allows us to
@@ -1842,7 +1849,18 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->memmap =3D a15memmap;
+    vms->memmap =3D extended_memmap;
+
+    for (i =3D 0; i < ARRAY_SIZE(a15memmap); i++) {
+        vms->memmap[i] =3D a15memmap[i];
+    }
+
+    vms->high_io_base =3D S_256GiB; /* Top of the RAM */
+
+    for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
+        vms->memmap[i].base =3D extended_memmap[i].base + vms->high_io_b=
ase;
+        vms->memmap[i].size =3D extended_memmap[i].size;
+    }
     vms->irqmap =3D a15irqmap;
 }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..3dc7a6c5d5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -64,7 +64,6 @@ enum {
     VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
-    VIRT_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
@@ -74,12 +73,18 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM,
-    VIRT_PCIE_ECAM_HIGH,
     VIRT_PLATFORM_BUS,
-    VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_LOWMEMMAP_LAST,
+};
+
+/* indices of IO regions located after the RAM */
+enum {
+    VIRT_HIGH_GIC_REDIST2 =3D  VIRT_LOWMEMMAP_LAST,
+    VIRT_HIGH_PCIE_ECAM,
+    VIRT_HIGH_PCIE_MMIO,
 };
=20
 typedef enum VirtIOMMUType {
@@ -116,7 +121,7 @@ typedef struct {
     int32_t gic_version;
     VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
-    const MemMapEntry *memmap;
+    MemMapEntry *memmap;
     const int *irqmap;
     int smp_cpus;
     void *fdt;
@@ -126,9 +131,10 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    hwaddr high_io_base;
 } VirtMachineState;
=20
-#define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
+#define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
=20
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
 #define VIRT_MACHINE(obj) \
--=20
2.20.1

