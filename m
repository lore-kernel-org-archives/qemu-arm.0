Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11091741wrx;
        Tue, 26 Feb 2019 05:51:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaDDG5xgdgehheDrH3mbaThXwY4YnQnW59zuikFGoOmk8zhPMRORsCIWZbSASgl6bAM0I3U
X-Received: by 2002:a81:c87:: with SMTP id 129mr17991141ywm.137.1551189070787;
        Tue, 26 Feb 2019 05:51:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189070; cv=none;
        d=google.com; s=arc-20160816;
        b=ltjvAkH+A6DUg2xGIAeZaoppul+GnLFqqOme46sXIBttOvVpaVI+sZuDcgKNGqezvq
         atnKyeDcXmlcqD2vb6amNEMPKlj9+8nGPYIHuNm2NraJFmzh1vlj5nep+XROrtu8sZpb
         kokKcpakilpVY/MdrXZdlHvvF7icPcPpqSsZ/CZHIDsiw/0qlyResGez045NHGaO892u
         mu1qx9ILDQ5YGRNrGH3ZYxPA+LfzZpy2SvVYDZ9GE5axWNd90A6j5WTZXUzQmpHjScwx
         Az3d0WWtpq+cfVJJbGJjZV6RiNjX8k+2oaWas8c5KTHj3VFX6d9ZS5MPOIB/tAga2y5P
         MZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=NKd/83U49rrf+Dgww4J/53VnHXGM2YDw2m9fFAPqLgw=;
        b=ZBUbamuaR/qqiwbp7oY7kSdYVjOXZjfFCMADAJaBX4ztx4ctKAh9RHqzvhM3ti8nXi
         BNSANr8cFuVEXWEQL4G24jjIgwylmQVc+2WhOIET9Pvd+RtXEACve1aZVv2q6OvIU0Ah
         kt1Rur0tQMgHZDaqy/l1tY9UuzmLWvhc+sO3snJmnp2SqgTeiUElvjgKkQBcuUc4LsaW
         UgDEmbGOP16f3HdlXoAg6G05JkXVgGr8QN5ctChDpdYLPMZrtCHpAdUUEzK0iYlZ1ZlB
         9VB1XchLApmrG8RYhSF8qVFQH39NsjXpXUKoa1U2duf6rLmP8RWxD2p0gLp01HKbmqHA
         WI7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v38si6836029ywh.347.2019.02.26.05.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:51:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyd8Y-0008UZ-7t
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd89-0008KR-Le
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:50:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd86-0006XT-LT
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 08:50:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd86-0006Vw-3w; Tue, 26 Feb 2019 08:50:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D3247001F;
	Tue, 26 Feb 2019 13:50:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BB0A5E1B0;
	Tue, 26 Feb 2019 13:50:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:49:59 +0100
Message-Id: <20190226135014.31854-4-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 26 Feb 2019 13:50:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 03/18] hw/arm/virt: Split the memory map
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CYYN6yBvd913

In the prospect to introduce an extended memory map supporting more
RAM, let's split the memory map array into two parts:

- the former a15memmap, renamed base_memmap, contains regions below
  and including the RAM. MemMapEntries initialized in this array
  have a static size and base address.
- extended_memmap, only initialized with entries located after the
  RAM. MemMapEntries initialized in this array only get their size
  initialized. Their base address is dynamically computed depending
  on the the top of the RAM, with same alignment as their size.

Eventually base_memmap entries are copied into the extended_memmap
array. Using two separate arrays however clarifies which entries
are statically allocated and those which are dynamically allocated.

This new split will allow to grow the RAM size without changing the
description of the high IO entries.

We introduce a new virt_set_memmap() helper function which
"freezes" the memory map.

The memory map is unchanged (the top of the initial RAM still is
256GiB). Then come the high IO regions with same layout as before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- removed Peter's R-b due to the changes induced by Igor's comments
- call set_memmap back in virt_instance_init
- add comments about sizing of extended_memmap
- s/region/entries as suggested by Igor
- rewording of the commit message

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
 hw/arm/virt.c         | 51 ++++++++++++++++++++++++++++++++++++++-----
 include/hw/arm/virt.h | 14 ++++++++----
 2 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 892bae4f3a..7297b69d93 100644
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
@@ -149,11 +150,24 @@ static const MemMapEntry a15memmap[] =3D {
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+};
+
+/*
+ * Highmem IO Regions: This memory map is floating, located after the RA=
M.
+ * Each MemMapEntry base (GPA) will be dynamically computed, depending o=
n the
+ * top of the RAM, so that its base get the same alignment as the size,
+ * ie. a 512GiB entry will be aligned on a 512GiB boundary. If there is
+ * less than 256GiB of RAM, the floating area starts at the 256GiB mark.
+ * Note the extended_memmap is sized so that it eventually also includes=
 the
+ * base_memmap entries (VIRT_HIGH_GIC_REDIST2 index is greater than the =
last
+ * index of base_memmap).
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
@@ -1354,6 +1368,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSt=
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
@@ -1845,7 +1883,8 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->memmap =3D a15memmap;
+    virt_set_memmap(vms);
+
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

