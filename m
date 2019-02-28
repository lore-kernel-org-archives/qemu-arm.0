Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp689852wrx;
        Thu, 28 Feb 2019 07:13:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ+iNyjC5Ol96UjppD8OKmrVkscokrSK2mq5+YwED49WwJY7kwO83mgxjT+6GQQ6wRG086J
X-Received: by 2002:a81:378a:: with SMTP id e132mr6188795ywa.66.1551366785144;
        Thu, 28 Feb 2019 07:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366785; cv=none;
        d=google.com; s=arc-20160816;
        b=qHkmp6rSQHZfjtCl+a+S+AD9smIEhgxdzKELBIJweqz2tPRczqExqRqAX8NtJdXUqN
         04g2jMFFzpGGGbnS7LINZEdhXtu+DLsmlP74E7No6dZzfEB+sfgdTRULfrZiTytAaCaK
         KWrg0N7Ng1T1yCZIuGLjKJlU5ElKiXrZqPB0UXbcSSoGz/YEjSlWg8sWgop9IyThvFT0
         vJogavuWXAaoqsFkrzATnb8lKwoARINpIBUGHHchzx6Vu6SM+VkOE835sExSEZO81Jp7
         ZvtcZNY4/Qwwfen7/Rbky7j7mb9xEI5oNHEwYzCcefXGHJSfiqyKyu+m4Si2Ocqsq5+G
         kRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sbHzGCsyUkUHhIXf+2RBFf/fJ4Arijru656BVn5Y/XA=;
        b=wu9uzS0nSinSdLHGaqT7uuajASTaaI1JS87Pvwie/Ig791L7RjjxA6ygVlY/kD2OUH
         fOGr2ARoba/WcJY8ivrP9wYkCdjeHgNAdBof8mHk2qskKlHgOkVTfVOi54TmxJl3f7a1
         PTUg4NeX2BNmw6pFo9cfMtKjsGAYzXqNEIjY2dKUsj2MzXN9k62hS1JfBsjcGb+hRhzM
         SGw7kmJg7v/NvePlOdUZFFdJ7DCcanQErllT3g1PTUY3AO27FIooKPbZNe7LVph1AevC
         b2ldt3ybMDrovl1nJKXBb+x1CNESbtZwnju+nfkJUKAF07j1JJWDpQ7+cha6+wvlmIQ/
         6rSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x37si11481294ywj.9.2019.02.28.07.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNMu-0000Tl-Iv
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:13:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEF-0001Ty-KW
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNE9-0003tz-Cy
	for qemu-arm@nongnu.org; Thu, 28 Feb 2019 10:04:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:23698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNDx-0003n0-I5; Thu, 28 Feb 2019 10:03:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B131E308D3EC;
	Thu, 28 Feb 2019 15:03:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDB1219C58;
	Thu, 28 Feb 2019 15:03:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:16 +0100
Message-Id: <20190228150324.25973-3-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 28 Feb 2019 15:03:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v10 02/10] hw/arm/virt: Rename highmem IO regions
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
X-TUID: hJINGA3V1Kz7

In preparation for a split of the memory map into a static
part and a dynamic part floating after the RAM, let's rename the
regions located after the RAM

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v8:
- added Igor's R-b and fixed "line over 80 characters" warnings
- nit: potential indent issue reported by Igor looks a false positive
  to me
v7: added Peter's R-b
v6: creation
---
 hw/arm/virt-acpi-build.c | 10 ++++++----
 hw/arm/virt.c            | 33 ++++++++++++++++++---------------
 include/hw/arm/virt.h    |  8 ++++----
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 04b62c714d..d7e2e4885b 100644
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
@@ -663,8 +663,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, V=
irtMachineState *vms)
             gicr =3D acpi_data_push(table_data, sizeof(*gicr));
             gicr->type =3D ACPI_APIC_GENERIC_REDISTRIBUTOR;
             gicr->length =3D sizeof(*gicr);
-            gicr->base_address =3D cpu_to_le64(memmap[VIRT_GIC_REDIST2].=
base);
-            gicr->range_length =3D cpu_to_le32(memmap[VIRT_GIC_REDIST2].=
size);
+            gicr->base_address =3D
+                cpu_to_le64(memmap[VIRT_HIGH_GIC_REDIST2].base);
+            gicr->range_length =3D
+                cpu_to_le32(memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
=20
         if (its_class_name() && !vmc->no_its) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99c2b6e60d..892bae4f3a 100644
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
@@ -431,12 +431,12 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                          2, vms->memmap[VIRT_GIC_REDIST]=
.size);
         } else {
             qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                         2, vms->memmap[VIRT_GIC_DIST].b=
ase,
-                                         2, vms->memmap[VIRT_GIC_DIST].s=
ize,
-                                         2, vms->memmap[VIRT_GIC_REDIST]=
.base,
-                                         2, vms->memmap[VIRT_GIC_REDIST]=
.size,
-                                         2, vms->memmap[VIRT_GIC_REDIST2=
].base,
-                                         2, vms->memmap[VIRT_GIC_REDIST2=
].size);
+                                 2, vms->memmap[VIRT_GIC_DIST].base,
+                                 2, vms->memmap[VIRT_GIC_DIST].size,
+                                 2, vms->memmap[VIRT_GIC_REDIST].base,
+                                 2, vms->memmap[VIRT_GIC_REDIST].size,
+                                 2, vms->memmap[VIRT_HIGH_GIC_REDIST2].b=
ase,
+                                 2, vms->memmap[VIRT_HIGH_GIC_REDIST2].s=
ize);
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
@@ -1417,8 +1418,10 @@ static void machvirt_init(MachineState *machine)
      * many redistributors we can fit into the memory map.
      */
     if (vms->gic_version =3D=3D 3) {
-        virt_max_cpus =3D vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDI=
ST_SIZE;
-        virt_max_cpus +=3D vms->memmap[VIRT_GIC_REDIST2].size / GICV3_RE=
DIST_SIZE;
+        virt_max_cpus =3D
+            vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        virt_max_cpus +=3D
+            vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
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

