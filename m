Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5052464wrx;
        Wed, 20 Feb 2019 14:51:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYzDjVB7imQxlQqdHDz1xABeAvIZOE0imTi8fJ343wmN441wLsm1Ds5gVcBpNPUlPNQe6eU
X-Received: by 2002:a81:b386:: with SMTP id r128mr27624721ywh.370.1550703085362;
        Wed, 20 Feb 2019 14:51:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703085; cv=none;
        d=google.com; s=arc-20160816;
        b=cLy0VhrV7VWoBT9gcNDDutWRXu45CFT2xeNJfIMKQc/EGTCwWcJVAKARBqevgV0zpK
         zPet1SbSMf5lmLvAT6pra/CxCW6zGKDLbixDkPqZTJOU5CrBcyPSUh7TZMcZJucSgErm
         UlmUI8E2qHDK0ZkPEq22Q9HabiiuowPKaHu09o6eAY59fHFSvBfO0HUH1X5IF7iWiKpw
         rf9EhDOFV4+ORh8CxleQAvtFb4SmmVqcbiPqL0/7J0cTDTxP2T/jKKl1NKIu4xLfCxbW
         JerVfYp5GoCab8oy+GJQIkV5MaWcVJDdq01S+JZufE8NzoRo42tFGZc+qs73etS5O7ZU
         lBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aey9upPyb09HLPIe6uAfye1Kl7veUrAjcIrwLHOFhSw=;
        b=QCR1AmEaLSuSsXcYTCGdm4K5+uw/VSA/irTZ5JjQNTaxt+6iZh9cXtgDI6X9t0BxU6
         gpi++8ZZ60bCTeqRt8dI5+9oMhtMiGAu0MZ2YsmByccF3c9F/rz5z1JEaC1MXaReknUw
         3Bq7eQEP6yzc42IttETYNokE3GtNfb6vYmL1zYSnctN20yWApcAD2Y5snSvOQcaxmm2L
         XAE8KjxwgI3pO3loGd+J9bgRwl/K00U/DEpau6Db8DA1dpkstdTYXFTz5CfY1Rv38WCA
         WLDVICa3+WfOrXLBdLPV+Y3ic04zAzbJGevPJ6Dchm3s1fncAysnSDTKzD/glc1uyj1Q
         TtEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si11907581ywz.463.2019.02.20.14.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:51:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwai4-0004Lh-PI
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:51:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXj-00049r-0v
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXh-00006d-1u
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:40:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXg-00005x-Pv; Wed, 20 Feb 2019 17:40:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C0098C049D67;
	Wed, 20 Feb 2019 22:40:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27EFB5D6AA;
	Wed, 20 Feb 2019 22:40:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:53 +0100
Message-Id: <20190220224003.4420-8-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 20 Feb 2019 22:40:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 07/17] hw/arm/virt: Dynamic memory map
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zff1J3TXBa/D

Up to now the memory map has been static and the high IO region
base has always been 256GiB.

This patch modifies the virt_set_memmap() function, which freezes
the memory map, so that the high IO range base becomes floating,
located after the initial RAM and the device memory.

The function computes
- the base of the device memory,
- the size of the device memory and
- the highest GPA used in the memory map.

The two former will be used when defining the device memory region
while the latter will be used at VM creation to choose the requested
IPA size.

Setting all the existing highmem IO regions beyond the RAM
allows to have a single contiguous RAM region (initial RAM and
possible hotpluggable device memory). That way we do not need
to do invasive changes in the EDK2 FW to support a dynamic
RAM base.

Still the user cannot request an initial RAM size greater than 255GB.
Also we handle the case where maxmem or slots options are passed,
although no device memory is usable at the moment. In this case, we
just ignore those settings.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 47 ++++++++++++++++++++++++++++++++++---------
 include/hw/arm/virt.h |  3 +++
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 12039a0367..9db602457b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -107,8 +107,9 @@
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
@@ -149,7 +150,7 @@ static const MemMapEntry base_memmap[] =3D {
     [VIRT_PCIE_MMIO] =3D          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =3D           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =3D          { 0x3f000000, 0x01000000 },
-    [VIRT_MEM] =3D                { 0x40000000, RAMLIMIT_BYTES },
+    [VIRT_MEM] =3D                { RAMBASE, LEGACY_RAMLIMIT_BYTES },
 };
=20
 /*
@@ -1367,16 +1368,48 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineS=
tate *vms, int idx)
=20
 static void virt_set_memmap(VirtMachineState *vms)
 {
+    MachineState *ms =3D MACHINE(vms);
     hwaddr base;
     int i;
=20
+    if (ms->maxram_size > ms->ram_size || ms->ram_slots > 0) {
+        error_report("mach-virt: does not support device memory: "
+                     "ignore maxmem and slots options");
+        ms->maxram_size =3D ms->ram_size;
+        ms->ram_slots =3D 0;
+    }
+    if (ms->ram_size > (ram_addr_t)LEGACY_RAMLIMIT_BYTES) {
+        error_report("mach-virt: cannot model more than %dGB RAM",
+                     LEGACY_RAMLIMIT_GB);
+        exit(1);
+    }
+
     vms->memmap =3D extended_memmap;
=20
     for (i =3D 0; i < ARRAY_SIZE(base_memmap); i++) {
         vms->memmap[i] =3D base_memmap[i];
     }
=20
-    vms->high_io_base =3D 256 * GiB; /* Top of the legacy initial RAM re=
gion */
+    /*
+     * We compute the base of the high IO region depending on the
+     * amount of initial and device memory. The device memory start/size
+     * is aligned on 1GiB. We never put the high IO region below 256GiB
+     * so that if maxram_size is < 255GiB we keep the legacy memory map.
+     * The device region size assumes 1GiB page max alignment per slot.
+     */
+    vms->device_memory_base =3D ROUND_UP(RAMBASE + ms->ram_size, GiB);
+    vms->device_memory_size =3D ms->maxram_size - ms->ram_size +
+                              ms->ram_slots * GiB;
+
+    vms->high_io_base =3D vms->device_memory_base +
+                        ROUND_UP(vms->device_memory_size, GiB);
+    if (vms->high_io_base < vms->device_memory_base) {
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
@@ -1387,6 +1420,7 @@ static void virt_set_memmap(VirtMachineState *vms)
         vms->memmap[i].size =3D size;
         base +=3D size;
     }
+    vms->highest_gpa =3D base - 1;
 }
=20
 static void machvirt_init(MachineState *machine)
@@ -1470,11 +1504,6 @@ static void machvirt_init(MachineState *machine)
=20
     vms->smp_cpus =3D smp_cpus;
=20
-    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
-        error_report("mach-virt: cannot model more than %dGB RAM", RAMLI=
MIT_GB);
-        exit(1);
-    }
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 3dc7a6c5d5..acad0400d8 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -132,6 +132,9 @@ typedef struct {
     uint32_t iommu_phandle;
     int psci_conduit;
     hwaddr high_io_base;
+    hwaddr highest_gpa;
+    hwaddr device_memory_base;
+    hwaddr device_memory_size;
 } VirtMachineState;
=20
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
--=20
2.20.1

