Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp645491wrx;
        Fri, 1 Mar 2019 05:48:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxANch7MWRZhng7PotT+Gx8LOdH1b1yeJqkLiu9hcJ/4JXLOYoDXJXrrmA/30s5A003ksQ8
X-Received: by 2002:a25:660b:: with SMTP id a11mr466249ybc.77.1551448131392;
        Fri, 01 Mar 2019 05:48:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448131; cv=none;
        d=google.com; s=arc-20160816;
        b=feRbTgcIsu7QvstqOEWOhcQ1qKhVfeIM9OWpSg+/MaB5MYFQ/kwvMiBMOltuW8dqJL
         KVMluJN/m1I4HvKrFbd4ry0Noz+m4vTyHZWq82uP/++KfhcuOsjVVFt06jRCrmX6JJzr
         cBx/j0/W1Mtke4q2lWxxZMt4rL5gQgG60iAhaF1G8N4uij5maH8KS3wL9cszMQqkzW3o
         eYZJsz4GVHIlPS4Lx/2cMVG5w0NfQNpgEE+7jBZvYyYEqknOCGh7GsLbJ8S5hQ1rfU9H
         DqzjmKszYqZrPMlP6RR7et2PYZsdwXXcutHyl+cMSUfhKzhbVj0UgztPiHk9/GZ4VEo3
         quDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oSQZ3PzvSwz2Dhv6/3O7cjo5A7aaPmj7+UxUi/3pGN8=;
        b=iVme0uYuXqQgBbarWFB0HRCoBUg9d6ATO+SG1Jj9SH3ho1INp0HgCau1A8/AzEVpBl
         D4oCTFmWKm1IegLmK0aXbkCwUYhnfbA0b7z1VNGXbq1l/KEaSTQlwVyE2Oxs+cZ4hEAW
         iU2oM7D4KDv5H6EyNdrjqMOrsMo/ouO+f+LnEUv/UagvWThSZXbzQKEW5RXAS3+4qo3s
         THrvSJMbW1ucJ3MLl2O1ZxGFWKFOiaCyaQ0c2G6Ka6rbJ9J9GcBA2x20aXorjBAWOCEF
         eEFINaZzbZTTFZ31tgesqI1D2rae7LhA26IvMNct9gHKXDweNVnUcmFkwXKB05L+tx06
         yOMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y142si12986029ywg.346.2019.03.01.05.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:48:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gziWw-0002xQ-PL
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVt-0002rZ-Cp
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVr-0002hi-2a
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 08:47:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:20949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gziVg-0002Z6-Fk; Fri, 01 Mar 2019 08:47:33 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EC378F892;
	Fri,  1 Mar 2019 13:47:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCAA15D782;
	Fri,  1 Mar 2019 13:47:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Fri,  1 Mar 2019 14:47:02 +0100
Message-Id: <20190301134709.4695-4-eric.auger@redhat.com>
In-Reply-To: <20190301134709.4695-1-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 01 Mar 2019 13:47:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v11 03/10] hw/arm/virt: Split the memory map
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmMXo9nh0avH

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
"freezes" the memory map. We call it in machvirt_init as
memory attributes of the machine are not yet set when
virt_instance_init() gets called.

The memory map is unchanged (the top of the initial RAM still is
256GiB). Then come the high IO regions with same layout as before.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v10 -> v11:
- remove vms->high_io_base
- initialize vms->memmamp to NULL in the instance_init

v8 -> v9:
- restore virt_set_memmap call in machvirt_init as otherwise it does
  not work in TCG mode

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
 include/hw/arm/virt.h | 13 +++++++----
 2 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 892bae4f3a..1c213eb3c9 100644
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
@@ -1354,6 +1368,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineSt=
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
+    base =3D 256 * GiB; /* Top of the legacy initial RAM region */
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
@@ -1368,6 +1405,8 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded =3D bios_name || drive_get(IF_PFLASH, 0, 0);
     bool aarch64 =3D true;
=20
+    virt_set_memmap(vms);
+
     /* We can probe only here because during property set
      * KVM is not available yet
      */
@@ -1845,7 +1884,7 @@ static void virt_instance_init(Object *obj)
                                     "Valid values are none and smmuv3",
                                     NULL);
=20
-    vms->memmap =3D a15memmap;
+    vms->memmap =3D NULL;
     vms->irqmap =3D a15irqmap;
 }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a27086d524..f3f7fae4ac 100644
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
--=20
2.20.1

