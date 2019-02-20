Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5046008wrx;
        Wed, 20 Feb 2019 14:40:58 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYQ+CdY3mZ5CRUopqw37r/efJxlmH7OR82j+wxzg+/hjimissAuhzoOBbqUqwcjgArbqCih
X-Received: by 2002:a25:9106:: with SMTP id v6mr12272980ybl.148.1550702458671;
        Wed, 20 Feb 2019 14:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702458; cv=none;
        d=google.com; s=arc-20160816;
        b=YCrhuGiSfFsOW7UVAqxPPOyk4bmbnTEYckiPS0OdIbboMkZzsB+MArprx7gHFPqWR4
         6aW1GVM448jSTHb+AzQSYUGWhpscOmi9FVm6a+LiyxLk8xZI/FafUGh0eqXnqlrEYjhm
         Imlvv0qu80Y/raofqKBUBLNl/7dYqqNX44yYvD5Xyp+sn2gTGXYoMRwpRdBovnJT3hDG
         dUS76PZD1Sk3GiooPZtPpxO0TzYtxaboTLuE4xlpsf7W8uZsHZdN5dZ+5K5rW1zw7m/m
         il70VuVzOzd/NccjL1yDJrwFL0A2O5VE+aaMNZrsnpHdUV4o9q6ziPYsSbnfe8hrJFTB
         CShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/U+g1zsdUqOE2yjY3zDN9M2g7rxvbCtHLfeEe7vWO8U=;
        b=hAXIJHPNqh/UuVn8QBdd4t0r+nxfdoor7X6ai+bqy+0un4TvLA2F4WQz3U6EE2aEmi
         aJ7to6Zy3ynG6xHHdKl3RV9Agg8rqiObdwRR8EoTDHbdk0THfP+zOnyAS5KltpEvbMgT
         qOsDY/I4713+gL6PBeGczeylgxFrzturpDlyqtnrH0IZ9QODQj5pHGgZzjWPa9hPANzo
         yJiHxRlabGvvjBsPeSNYjX+L4w3DBJIzHxBDrNUA02DQSQBt1s+wULTUGJJFtiUmkG9w
         NVbsZ7GECgncK3JTYlu45x5rKpNMvrmCMc3IdomSWNn0cuMqYrlDQfo+JA6GwcYFMoZ0
         rsaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q79si11021975ybg.339.2019.02.20.14.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49930 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaXy-000452-49
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXS-0003uw-Tz
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXR-0008Sh-QX
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:40:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:1214)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXM-0008QA-Of; Wed, 20 Feb 2019 17:40:20 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7FDE3082E5A;
	Wed, 20 Feb 2019 22:40:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47EAE5D6AA;
	Wed, 20 Feb 2019 22:40:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:48 +0100
Message-Id: <20190220224003.4420-3-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Wed, 20 Feb 2019 22:40:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 02/17] hw/arm/virt: Rename highmem IO regions
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dxlR4E+2cKLF

In preparation for a split of the memory map into a static
part and a dynamic part floating after the RAM, let's rename the
regions located after the RAM

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v7: added Peter's R-b
v6: creation
---
 hw/arm/virt-acpi-build.c |  8 ++++----
 hw/arm/virt.c            | 21 +++++++++++----------
 include/hw/arm/virt.h    |  8 ++++----
 3 files changed, 19 insertions(+), 18 deletions(-)

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
index 99c2b6e60d..a1955e7764 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -150,10 +150,10 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
     /* Additional 64 MB redist region (can contain up to 512 redistribut=
ors) */
-    [VIRT_GIC_REDIST2] =3D        { 0x4000000000ULL, 0x4000000 },
-    [VIRT_PCIE_ECAM_HIGH] =3D     { 0x4010000000ULL, 0x10000000 },
+    [VIRT_HIGH_GIC_REDIST2] =3D   { 0x4000000000ULL, 0x4000000 },
+    [VIRT_HIGH_PCIE_ECAM] =3D     { 0x4010000000ULL, 0x10000000 },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
-    [VIRT_PCIE_MMIO_HIGH] =3D   { 0x8000000000ULL, 0x8000000000ULL },
+    [VIRT_HIGH_PCIE_MMIO] =3D     { 0x8000000000ULL, 0x8000000000ULL },
 };
=20
 static const int a15irqmap[] =3D {
@@ -435,8 +435,8 @@ static void fdt_add_gic_node(VirtMachineState *vms)
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
@@ -584,7 +584,7 @@ static void create_gic(VirtMachineState *vms, qemu_ir=
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
@@ -601,7 +601,8 @@ static void create_gic(VirtMachineState *vms, qemu_ir=
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
@@ -1088,8 +1089,8 @@ static void create_pcie(VirtMachineState *vms, qemu=
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
@@ -1418,7 +1419,7 @@ static void machvirt_init(MachineState *machine)
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
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..a27086d524 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -64,7 +64,7 @@ enum {
     VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
-    VIRT_GIC_REDIST2,
+    VIRT_HIGH_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
@@ -74,9 +74,9 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM,
-    VIRT_PCIE_ECAM_HIGH,
+    VIRT_HIGH_PCIE_ECAM,
     VIRT_PLATFORM_BUS,
-    VIRT_PCIE_MMIO_HIGH,
+    VIRT_HIGH_PCIE_MMIO,
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
@@ -128,7 +128,7 @@ typedef struct {
     int psci_conduit;
 } VirtMachineState;
=20
-#define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
+#define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
=20
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
 #define VIRT_MACHINE(obj) \
--=20
2.20.1

