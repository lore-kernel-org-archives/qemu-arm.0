Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5050214wrx;
        Wed, 20 Feb 2019 14:47:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYlUk11XtCYTpLGqYvXfrLpoWpXV+foj9pvVNY3KtpFKkhrjH61DDcUi0WzD0qOjuQxGFzi
X-Received: by 2002:a25:cf13:: with SMTP id f19mr19651252ybg.206.1550702868732;
        Wed, 20 Feb 2019 14:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702868; cv=none;
        d=google.com; s=arc-20160816;
        b=WVcSektrrdSIWNkbCuUAWlG82O6l2UREUF5FC1yiV/xMlMVDPXvxaHaAXafOAweFqA
         +cBaoEQ1o1oonRSM++jJSgVxQXjuqZgAdzn4XQnIcar5K4dk09ezthghs1CAKEiA3ZLI
         nPyTXaLLxYrX8H++/B30cZqwrLq3Gbfl/fYD6zrPp9NM78JtQJ6xGe0/PZXfbzc6xEsW
         hFQIFkSdc6dh2cIEZp3nmCZsgIijTANBeD0PCPIWuhy8Dow8fqt/hnR0f+cOKbbeiUjC
         E2ZSb4WC96rSx9e1Dje4pLUDAfuPQ8TuqVjGLhb4WlVX3V/kWS46GEr9qlDneG1zqfxU
         uKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w2giJx5CVmuFUXrrAfdjKBAO5oACzvUPrCIb/eG+Ro8=;
        b=pS3hwwqP+LC2ssbBIMCmCw0I2J5YCvLOW/3rsk2KG3p2Y9feOl+Y+/yCgvgppfQXIq
         Vd8L0Sel9iGWcMZlDL4Sbq1Ec1M5T7z7ZvjYYKxq2URyFTAs6cx5109NfsQzqqde6/MV
         0b/5g3+5duAUB7au5QXWFzj/fHNYOTPi/GKoHrCV4ViWBDOHS6Wn8gqI3oQASd+JmaXi
         51Q635nittjjEUTmHUS8Jz5js2EcLetkmy/Ch9uboERDb0SQEfNcExC6SikfrznGFyOC
         PDCBHNAF8XpfpYil0bl+EotifK6ShqACSKyCrklww3+h+ERlr6oTAMgXV/rvvsEhWSdz
         sB8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k185si13295119ywg.357.2019.02.20.14.47.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaea-0001Bl-3a
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXR-0003uD-6J
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXQ-0008S4-0C
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXP-0008Rq-NY; Wed, 20 Feb 2019 17:40:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF27D3086275;
	Wed, 20 Feb 2019 22:40:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46B015D6AA;
	Wed, 20 Feb 2019 22:40:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:49 +0100
Message-Id: <20190220224003.4420-4-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 20 Feb 2019 22:40:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 03/17] hw/arm/virt: Split the memory map
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
X-TUID: /AANYiJtGYVn

In the prospect to introduce an extended memory map supporting more
RAM, let's split the memory map array into two parts:

- the former a15memmap contains regions below and including the RAM
- extended_memmap, only initialized with entries located after the RAM.
  Only the size of the region is initialized there since their base
  address will be dynamically computed, depending on the top of the
  RAM (initial RAM at the moment), with same alignment as their size.

This new split will allow to grow the RAM size without changing the
description of the high regions.

The patch also moves the memory map setup into machvirt_init().
The rationale is the memory map will be soon affected by the
kvm_type() call that happens after virt_instance_init() and
before machvirt_init().

The memory map is unchanged (the top of the initial RAM still is
256GiB). Then come the high IO regions with same layout as before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v6 -> v7:
- s/a15memmap/base_memmap
- slight rewording of the commit message
- add "if there is less than 256GiB of RAM then the floating area
  starts at the 256GiB mark" in the comment associated to the floating
  memory map
- Added Peter's R-b

v5 -> v6
- removal of many macros in units.h
- introduce the virt_set_memmap helper
- new computation for offsets of high IO regions
- add comments
---
 hw/arm/virt.c         | 48 +++++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h | 14 +++++++++----
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a1955e7764..12039a0367 100644
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
@@ -121,7 +122,7 @@
  * Note that devices should generally be placed at multiples of 0x10000,
  * to accommodate guests using 64K pages.
  */
-static const MemMapEntry a15memmap[] =3D {
+static const MemMapEntry base_memmap[] =3D {
     /* Space up to 0x8000000 is reserved for a boot ROM */
     [VIRT_FLASH] =3D              {          0, 0x08000000 },
     [VIRT_CPUPERIPHS] =3D         { 0x08000000, 0x00020000 },
@@ -149,11 +150,21 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+};
+
+/*
+ * Highmem IO Regions: This memory map is floating, located after the RA=
M.
+ * Each IO region offset will be dynamically computed, depending on the
+ * top of the RAM, so that its base get the same alignment as the size,
+ * ie. a 512GiB region will be aligned on a 512GiB boundary. If there is
+ * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
+ */
+static MemMapEntry extended_memmap[] =3D {
     /* Additional 64 MB redist region (can contain up to 512 redistribut=
ors) */
-    [VIRT_HIGH_GIC_REDIST2] =3D   { 0x4000000000ULL, 0x4000000 },
-    [VIRT_HIGH_PCIE_ECAM] =3D     { 0x4010000000ULL, 0x10000000 },
-    /* Second PCIe window, 512GB wide at the 512GB boundary */
-    [VIRT_HIGH_PCIE_MMIO] =3D     { 0x8000000000ULL, 0x8000000000ULL },
+    [VIRT_HIGH_GIC_REDIST2] =3D   { 0x0, 64 * MiB },
+    [VIRT_HIGH_PCIE_ECAM] =3D     { 0x0, 256 * MiB },
+    /* Second PCIe window */
+    [VIRT_HIGH_PCIE_MMIO] =3D     { 0x0, 512 * GiB },
 };
=20
 static const int a15irqmap[] =3D {
@@ -1354,6 +1365,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSt=
ate *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
=20
+static void virt_set_memmap(VirtMachineState *vms)
+{
+    hwaddr base;
+    int i;
+
+    vms->memmap =3D extended_memmap;
+
+    for (i =3D 0; i < ARRAY_SIZE(base_memmap); i++) {
+        vms->memmap[i] =3D base_memmap[i];
+    }
+
+    vms->high_io_base =3D 256 * GiB; /* Top of the legacy initial RAM re=
gion */
+    base =3D vms->high_io_base;
+
+    for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
+        hwaddr size =3D extended_memmap[i].size;
+
+        base =3D ROUND_UP(base, size);
+        vms->memmap[i].base =3D base;
+        vms->memmap[i].size =3D size;
+        base +=3D size;
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(machine);
@@ -1368,6 +1403,8 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
+    virt_set_memmap(vms);
+
     /* We can probe only here because during property set
      * KVM is not available yet
      */
@@ -1843,7 +1880,6 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->memmap =3D a15memmap;
     vms->irqmap =3D a15irqmap;
 }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a27086d524..3dc7a6c5d5 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -64,7 +64,6 @@ enum {
     VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
-    VIRT_HIGH_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
@@ -74,12 +73,18 @@ enum {
     VIRT_PCIE_MMIO,
     VIRT_PCIE_PIO,
     VIRT_PCIE_ECAM,
-    VIRT_HIGH_PCIE_ECAM,
     VIRT_PLATFORM_BUS,
-    VIRT_HIGH_PCIE_MMIO,
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
@@ -126,6 +131,7 @@ typedef struct {
     uint32_t msi_phandle;
     uint32_t iommu_phandle;
     int psci_conduit;
+    hwaddr high_io_base;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

