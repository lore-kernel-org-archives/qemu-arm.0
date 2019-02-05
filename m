Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5039696wrt;
        Tue, 5 Feb 2019 09:53:48 -0800 (PST)
X-Google-Smtp-Source: AHgI3IamanrAY1PKddjej7usK2BPeGO9zJKzDYJsdtfLbUQgeku9UPX+WcHnMSiZhR6ww14TpRKU
X-Received: by 2002:a25:7056:: with SMTP id l83mr4834486ybc.189.1549389228341;
        Tue, 05 Feb 2019 09:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389228; cv=none;
        d=google.com; s=arc-20160816;
        b=kIKBffuQd08keEnPtPWfkxBGso3SIiS5bE+c0fiDrz3zAwgY6TMLMm312cPk4UP3RV
         ZdIkhfAr0XE8XMFZlpsOk4t1JsLetKGn7MhmpzMiE/1dUtPK0LR4cozDaoKWxoU6mqZ6
         JdepCnAMH8gW8z0CaAI0IBGvz4DI44e1ixqy3gZ/tsXtWERNIL8AWAuJ4hbMYlKspK7M
         TAmGEMU73J8BC2C2RKULx7V31w9Nh943fopSqKEf3fyT4VBFPg+7dhxDxlgYAL8f+xVB
         /d9rkJUS/o6uIkkMUHCBPmnyOk1XZqSH+G/w7kwOhIEays+25SwyeWzdmMBwR19d/hes
         Dhmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HJZyZgqF9O9ghePTMB3VZCvLBMmdxhgwKwmm6Et/9P8=;
        b=l7d2Q3XJ1VuApzoy3osC1cv702rQM/rwX/2NMmBdIVUhu0TrE8sRzvTBWPbOM9cPYR
         dVeMhABaoavCpo9v1UyY9ZU33p+iMWVs2ypE7J71uPlTrGMK7ZEPwyBhCFiE+HyjUDBW
         A40Kh+NBYdn6l9CRHE7P7Y3VyKLL6wJFdsOk7hO1zqziNMZgyFUeZL2SiqCwoj1conGZ
         aZZj3cAoEvVDhhxJjp3/BfLeFEdidqPNB4d/f7aEFoACoD7433cZu7ssTvFQdu+AZacl
         Wkc77ahOuNs8yxxOaSNvd39USjqh2mHKsO5VHEj3TuibgVVCuPiyG2wUcE8AO4RytKYL
         5Msg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a3si2350930ybh.402.2019.02.05.09.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:53:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr4up-0007GV-Kx
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:53:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bd-000086-HE
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:33:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bb-0004EE-P8
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 12:33:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bS-0003zC-Bg; Tue, 05 Feb 2019 12:33:46 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 77F59A82C;
	Tue,  5 Feb 2019 17:33:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D424960A9D;
	Tue,  5 Feb 2019 17:33:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:53 +0100
Message-Id: <20190205173306.20483-6-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 05 Feb 2019 17:33:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 05/18] hw/arm/virt: Split the memory map
 description
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
X-TUID: dcbXDWysGSmd

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

At that point the memory map is not changed, ie. the initial RAM can
grow up to 256GiB. Then come the high IO regions with same layout as
before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6
- removal of many macros in units.h
- introduce the virt_set_memmap helper
- new computation for offsets of high IO regions
- add comments
---
 hw/arm/virt.c         | 45 ++++++++++++++++++++++++++++++++++++++-----
 include/hw/arm/virt.h | 14 ++++++++++----
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a1955e7764..2b15839d0b 100644
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
@@ -149,11 +150,20 @@ static const MemMapEntry a15memmap[] =3D {
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
+ * ie. a 512GiB region will be aligned on a 512GiB boundary.
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
@@ -1354,6 +1364,30 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSt=
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
+    for (i =3D 0; i < ARRAY_SIZE(a15memmap); i++) {
+        vms->memmap[i] =3D a15memmap[i];
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
@@ -1368,6 +1402,8 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
+    virt_set_memmap(vms);
+
     /* We can probe only here because during property set
      * KVM is not available yet
      */
@@ -1843,7 +1879,6 @@ static void virt_instance_init(Object *obj)
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

