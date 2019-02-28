Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp689753wrx;
        Thu, 28 Feb 2019 07:13:01 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaM0y98PwK9SNLSdgnE1OxkY3Y4TKLswRjNHbM9IuM0lpmgWUqtKyjIKUp5OzGNg45lME2u
X-Received: by 2002:a81:924d:: with SMTP id j74mr5955725ywg.260.1551366781290;
        Thu, 28 Feb 2019 07:13:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366781; cv=none;
        d=google.com; s=arc-20160816;
        b=uDbmJzJKsc4VWCoddUxuE5z9MLFS47jmunNaDE/DAgj1zBtzo2khehEg1HNrVuhpSK
         bjKQNOEct2+kp8sq4zfZuWdx48MpY5k3tkvTCNY38f4s5Er1mrxOEnaIVq96WA1sCAAj
         8G1avLBOJH/snrIY/8eT9UNsa1dxI6b/LSsS7riPks9mas268z9fsn519ikUWmuhb7lt
         3DT7YiRitVz9yUc2NrLKgFjqRhJvYeziKUpM/wfB8AHHjF6jsZkxj26DX20pJjwaceAD
         SizvADvdzXG1CiwsWXjsMvNJ0uUGtR5dQr3MrSstLYUQtSfgOFLbc/wMj5iFKLe/dU3d
         vtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tXs+lHVPTYm2LSqeyas5U83AaiEBdWYNYUKbreYtWCM=;
        b=Avsq1P1kGyxwwRSeMQ+FVv0pH8VNHMMC1D9Smxxn7CAQNNfydReyRZWhjkDykuzpcG
         HHU4nUW/s6oF+Ta5zyTy/wEiPA/ojKez2wgFiStIWyqbK1JPSC2mCwzi3OUTxyVWJJoN
         m1bJluVAIv72lFMSGvDyuothNANgrCLR/6Ibvv4TqmBgGx+dzOyfveQ5EF7vCGbJq1aF
         r7Niu0FkqWuPZ3lNl2/3f/fYd5D36NGmdmBWS3p7sxJ8nhXkvVRXAEmknZSORIljN36C
         ggQQdwqpqaL5qgLjoe/ss+6wLdGUJLgTYyXE5u0ZCskkmsfbgwwMbYThZm9Ghb1tdq78
         Qg/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186si11227538ywb.18.2019.02.28.07.13.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:13:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNMq-0008HC-L9
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEo-00023J-MB
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:04:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEn-0004Mh-Gt
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:04:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNEj-0004Ff-Gh; Thu, 28 Feb 2019 10:04:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6736116B1E5;
	Thu, 28 Feb 2019 15:04:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD0601973C;
	Thu, 28 Feb 2019 15:04:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:21 +0100
Message-Id: <20190228150324.25973-8-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 28 Feb 2019 15:04:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v10 07/10] hw/arm/virt: Dynamic memory map
 depending on RAM requirements
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
X-TUID: KE+Sg6xwew3D

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

---
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
 hw/arm/virt.c         | 50 +++++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h |  1 +
 2 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8a23608d3e..d7aa7d3f9d 100644
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
@@ -107,8 +108,9 @@
  * of a terabyte of RAM will be doing it on a host with more than a
  * terabyte of physical address space.)
  */
-#define RAMLIMIT_GB 255
-#define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)
+#define RAMBASE GiB
+#define LEGACY_RAMLIMIT_GB 255
+#define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such =
as UEFI.
@@ -149,7 +151,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_PCIE_MMIO] =3D          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
-    [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+    [VIRT_MEM] =3D                { RAMBASE, LEGACY_RAMLIMIT_BYTES },
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
@@ -1379,7 +1382,30 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i] =3D base_memmap[i];
     }
=20
-    vms->high_io_base =3D 256 * GiB; /* Top of the legacy initial RAM re=
gion */
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
+    device_memory_base =3D ROUND_UP(RAMBASE + ms->ram_size, GiB);
+    device_memory_size =3D ms->maxram_size - ms->ram_size + ms->ram_slot=
s * GiB;
+
+    vms->high_io_base =3D device_memory_base + ROUND_UP(device_memory_si=
ze, GiB);
+    if (vms->high_io_base < device_memory_base) {
+        error_report("maxmem/slots too huge");
+        exit(EXIT_FAILURE);
+    }
+    if (vms->high_io_base < 256 * GiB) {
+        vms->high_io_base =3D 256 * GiB;
+    }
     base =3D vms->high_io_base;
=20
     for (i =3D VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++=
) {
@@ -1390,6 +1416,13 @@ static void virt_set_memmap(VirtMachineState *vms)
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
@@ -1476,7 +1509,8 @@ static void machvirt_init(MachineState *machine)
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
@@ -1570,6 +1604,10 @@ static void machvirt_init(MachineState *machine)
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
index 3dc7a6c5d5..326a26b6d6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,7 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr high_io_base;
+    hwaddr highest_gpa;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

