Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp526281wrt;
        Wed, 23 Jan 2019 02:26:39 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6SKQl9PcqP8tJmyEzQyxePf1MM6utAf27rIlC0w4yfYzWoxJkVfR1zs/fJdlevgOV2H+wS
X-Received: by 2002:a05:6000:8a:: with SMTP id m10mr1991488wrx.79.1548239199075;
        Wed, 23 Jan 2019 02:26:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548239199; cv=none;
        d=google.com; s=arc-20160816;
        b=pL2YPfhdf8NHbKWRLamqSaXJDyn6Ko8AW/MwMZnz4LBE0Jq83Zt1QUFhgRT+mRLYZa
         T18chDWBjzSUMTQoboB9o5N9XpjrC2B2heFA1jIVnpp9BaaORbQ2UXYkzAIjs9brqk/T
         2Rh+IA4F7YY649pIaZiGpZjR3Wqydpk5imHnT8YWk8/V5y3ckNeufScz7sY55eP3edww
         qfHZnsHtF2d43acSnoTRIhNynmQhjh18zMTiC3I3C75JdSEwPec1dD3ni3JT9kJBqxkH
         mXdmAwzLKULHlx96XXsm4ITDXEqdiB6bNjwmDnLXhrO+0Y0XUbIlTQ/FTknbJUTyPC4r
         4RyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w7POX0mX15xwXzuEymiioKG3+y9Xbh1l2fxNg02uI/w=;
        b=zWR5cMMfmmxJRPpCw+TFNXXI6CB0uB8CnkKHDm3EhkOEuG86Wr1IkKo0Q3mcDSJcvo
         PpGsFmAuJi9jHG0b+yonNyLWV5wZLRPJeH/yNYlWpR7ChxkmNwKa+ds80l2KAtQDs8CZ
         2eYbPGwUn0USUQJSoWsYmc5jI6ILH91OSyGQaFUAQdXQlGobvo7MP3E9pg6U8YB9zFiY
         BatPtc+n9slOiVw9JMt5HODAp4ea55ZGwtQEKF424HlLXrVaud+KM7PBEp/3Ov8RgBVr
         4PqZ433nXZ873SmO9JKsNsWsfMYnXnWIpnTozmUohkj4pQ94xzDKFvzy0s/c5A4OqfkS
         AyEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si41901562wrr.124.2019.01.23.02.26.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:26:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFjy-0002GA-3c
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaQ-0002FP-B7
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFaO-0007mp-Gf
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:16:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFaO-0007cU-6F; Wed, 23 Jan 2019 05:16:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5068CDB935;
	Wed, 23 Jan 2019 10:16:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3FBF6019F;
	Wed, 23 Jan 2019 10:16:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:54 +0100
Message-Id: <20190123101458.12478-15-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Jan 2019 10:16:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 14/18] hw/arm/virt: Allocate device_memory
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
X-TUID: kTCdlRCOi/x5

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
index aad7e0f095..c74a622412 100644
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
@@ -1255,6 +1256,37 @@ static void create_secure_ram(VirtMachineState *vm=
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
@@ -1542,6 +1574,10 @@ static void machvirt_init(MachineState *machine)
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

