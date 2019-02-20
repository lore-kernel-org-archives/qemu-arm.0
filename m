Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5054413wrx;
        Wed, 20 Feb 2019 14:54:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZXy9mRI7LakE9Gvik4HKAyEBD3yYn+2kJuwgWHIvpiUsotEna+8ssVw4fev73BdUJfLttm
X-Received: by 2002:a25:9106:: with SMTP id v6mr12311580ybl.148.1550703285279;
        Wed, 20 Feb 2019 14:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550703285; cv=none;
        d=google.com; s=arc-20160816;
        b=0bm/RXOMoqCaiLjOqOqzzvTSl+Cz6afTy5LVUZMNIf4jG2+hmGnwWQ6LKzRLbyOEkZ
         ItV2JT7OBschMjmUJD92XeGpvoNNxLXeztBtoMHIDhy7ECOoSC5JOE8jZsMNQH9m35oA
         XcxCqFcsVWK6qrsZaCMXug5N0ObVwbPX275/u5qpSYUeW9K3F0Pj8vZgPkUY6J5uoW5g
         HKSpX8WBuqDRC4ynf73GQvyB5E73RON01xEBgLZWOUhTjqzHrLDPXiHFjGWhqoQxXajB
         VAzv8xpCaQljUQ7ZpgfHZOMolIP6Gi0xM2cntCGzuBdc/Vov9IJvdS6sSVKls1YaI+en
         lLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WYyoIVFINwQECUOs0nIZ2JpmM7AZz2vzXSC6VgdD8AE=;
        b=T4ut6Vcz19iQZhesAVcSL3hPkQdUhRDW2pfpQlkIDJzjgbmQDbnF8NP/aFhCTBit8Y
         8Hgjg+KIwYY+gzAV0QVPRbKoZnR017r6CgdFICgGuEGZ74p5AkwoQFV3aFiE9mNbi5x/
         TLlXKlxG/lhUQcouwdl/ex48FyJYUkXSnUwzu1PoUEYlURFE30SPCWC5+z5j6yyFq9wo
         SUzqG6mxYIyU8jAcm1WKVoYL6RGmAViFMCGcymTwZGjf6qMjn2UlaudWFyS2q8t+k1E3
         G8AZHRxvOxzb09aJi5Y4vGMbdRlRbdxTUd/r8fVudYRiwb62MLfDVHrfsioR/YX96t7T
         iqlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o133si3038438ywd.403.2019.02.20.14.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwalI-0006Pl-Or
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY9-0004PY-PO
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:41:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY8-0000Vr-J1
	for qemu-devel@nongnu.org; Wed, 20 Feb 2019 17:41:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59776)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaY3-0000JB-N1; Wed, 20 Feb 2019 17:41:03 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C87E33081244;
	Wed, 20 Feb 2019 22:41:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2891D5D6B3;
	Wed, 20 Feb 2019 22:40:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:59 +0100
Message-Id: <20190220224003.4420-14-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 20 Feb 2019 22:41:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 13/17] hw/arm/virt: Allocate device_memory
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
X-TUID: eHB0XORgBUTc

The device memory region is located after the initial RAM.
its start/size are 1GB aligned.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>

---
v6 -> v7:
- check the device memory top does not wrap
- check the device memory can fit the slots

v4 -> v5:
- device memory set after the initial RAM

v3 -> v4:
- remove bootinfo.device_memory_start/device_memory_size
- rename VIRT_HOTPLUG_MEM into VIRT_DEVICE_MEM
---
 hw/arm/virt.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 470ca0ce2d..33ad9b3f63 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -62,6 +62,7 @@
 #include "target/arm/internals.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/acpi/acpi.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1263,6 +1264,34 @@ static void create_secure_ram(VirtMachineState *vm=
s,
     g_free(nodename);
 }
=20
+static void create_device_memory(VirtMachineState *vms, MemoryRegion *sy=
smem)
+{
+    MachineState *ms =3D MACHINE(vms);
+
+    if (!vms->device_memory_size) {
+        return;
+    }
+
+    if (ms->ram_slots > ACPI_MAX_RAM_SLOTS) {
+        error_report("unsupported number of memory slots: %"PRIu64,
+                     ms->ram_slots);
+        exit(EXIT_FAILURE);
+    }
+
+    if (QEMU_ALIGN_UP(ms->maxram_size, GiB) !=3D ms->maxram_size) {
+        error_report("maximum memory size must be GiB aligned");
+        exit(EXIT_FAILURE);
+    }
+
+    ms->device_memory =3D g_malloc0(sizeof(*ms->device_memory));
+    ms->device_memory->base =3D vms->device_memory_base;
+
+    memory_region_init(&ms->device_memory->mr, OBJECT(vms),
+                       "device-memory", vms->device_memory_size);
+    memory_region_add_subregion(sysmem, ms->device_memory->base,
+                                &ms->device_memory->mr);
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_si=
ze)
 {
     const VirtMachineState *board =3D container_of(binfo, VirtMachineSta=
te,
@@ -1610,6 +1639,10 @@ static void machvirt_init(MachineState *machine)
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

