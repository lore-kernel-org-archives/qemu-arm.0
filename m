Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5050235wrt;
        Tue, 5 Feb 2019 10:04:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZOJQGBWQMfdItp2e+irfH1bT/WjLXf2bSY2HxgaRESm9AmXlJVFA1ZJGxPIKI/UkHwi6Bn
X-Received: by 2002:a81:af0f:: with SMTP id n15mr5209631ywh.103.1549389874507;
        Tue, 05 Feb 2019 10:04:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389874; cv=none;
        d=google.com; s=arc-20160816;
        b=0SCZ86CrRWodTOzNFbxNkvbYapVkgm5OSAx84A6q5eoqDBR4h8PNKCJf1nxTmLvwzy
         lRHzsopQdrAYlUlOFg6h6nAKsgHhYy7zAtmgtnlP/Y/l0Ey4tjmWfP51B1+sXtUZ9uIV
         yPv84xrYZBZGB3Dk+p2yUwte3BP2ykUFjwDmQD8x0Y31H4BPWj/4H8h/k72DxNzGkyXo
         acy8LYSzy6QOJ2CZpd5tAXytAEwVl2LydHd3dHj0F1BoAEWanxCUZevrw1EwT2WCdTST
         Nc23qNdpP6qeeK/oLeyQi1zizF6llyaJX3r4ntnWBIQSYVf5yOL+p/MhuVcUlZ98B8oh
         8xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=icW+3hWWaYXBpdDydAOzzHFJs/+5vgAuxW5gFdiWAv4=;
        b=vzLpI+4QVIvbqJtH8Td+2HR2wlY4O7jXGEallbJjye7uL2/vgcHY0393zKGRnJjvGm
         +dt1E3xaAyF20O8WF/TdmlSk7cXRYlhwJzPr1hdEQZaWesJIUfN8kpjLtWOaSQB3tm5/
         IDN+hf64rWi7EpqPetyp54WVk75zEA3bgbvfB/XM+ZL41ExyphBudpFJG9vf1kuZ81Q8
         dlox6Z++1J5pMh5WABF+U312+njZcNZQCWSw2ed9oaxcdBnOOYw7Jrk+LsZxeeWJ0K95
         RnKMaCMyvfFYolpM5PA3X6/p2HmLcwb2nsr/kISEdX/uHlehknWz0bUnqZBrW+rrq5Bq
         EreQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si2295173ywa.175.2019.02.05.10.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 10:04:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36172 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr55F-0000Ny-TB
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 13:04:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4cH-0000jQ-Nn
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4c2-0004Y6-L1
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:34:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4c2-0004XT-6g; Tue, 05 Feb 2019 12:34:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DAA781138;
	Tue,  5 Feb 2019 17:34:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7B16183EA;
	Tue,  5 Feb 2019 17:34:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:33:02 +0100
Message-Id: <20190205173306.20483-15-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 05 Feb 2019 17:34:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 14/18] hw/arm/virt: Allocate device_memory
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
X-TUID: bTFIUFOjdn5f

The device memory region is located after the initial RAM.
its start/size are 1GB aligned.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

---
v4 -> v5:
- device memory set after the initial RAM

v3 -> v4:
- remove bootinfo.device_memory_start/device_memory_size
- rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
---
 hw/arm/virt.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 783468ba77..b683902991 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -61,6 +61,7 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/acpi/acpi.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1260,6 +1261,37 @@ static void create_secure_ram(VirtMachineState *vm=
s,
     g_free(nodename);
 }
=20
+static void create_device_memory(VirtMachineState *vms, MemoryRegion *sy=
smem)
+{
+    MachineState *ms =3D MACHINE(vms);
+    uint64_t device_memory_size =3D ms->maxram_size - ms->ram_size;
+    uint64_t align =3D GiB;
+
+    if (!device_memory_size) {
+        return;
+    }
+
+    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
+        error_report("unsupported number of memory slots: %"PRIu64,
+                     ms->ram_slots);
+        exit(EXIT_FAILURE);
+    }
+
+    if (QEMU_ALIGN_UP(ms->maxram_size, align) !=3D ms->maxram_size) {
+        error_report("maximum memory size must be aligned to multiple of=
 0x%"
+                     PRIx64, align);
+        exit(EXIT_FAILURE);
+    }
+
+    ms->device_memory =3D g_malloc0(sizeof(*ms->device_memory));
+    ms->device_memory->base =3D QEMU_ALIGN_UP(GiB + ms->ram_size, GiB);
+
+    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
+                       "device-memory", device_memory_size);
+    memory_region_add_subregion(sysmem, ms->device_memory->base,
+                                &ms->device_memory->mr);
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_si=
ze)
 {
     const VirtMachineState *board =3D container_of(binfo, VirtMachineSta=
te,
@@ -1569,6 +1601,10 @@ static void machvirt_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram)=
;
=20
+    if (vms->extended_memmap) {
+        create_device_memory(vms, sysmem);
+    }
+
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
=20
     create_gic(vms, pic);
--=20
2.20.1

