Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5046211wrx;
        Wed, 20 Feb 2019 14:41:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaPgqScAIbTN+J/+ndWFOwcP9toib6mLwhLvnSmowLSfhenl2UsCM8Rf8/FdePWQm4nQw6J
X-Received: by 2002:a25:2fd4:: with SMTP id v203mr30050784ybv.184.1550702478981;
        Wed, 20 Feb 2019 14:41:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550702478; cv=none;
        d=google.com; s=arc-20160816;
        b=iUezjn3EmvZ8jLzYeTlDnkmJOYoed15qGYAVuft/6cmiZQUvj8n06AiyVguoNhVK/K
         h1w4hadHVQVZaodjKMrnoWxShQ7Vwtt+bvbq/E3PHxTGefrEjZhyBUHq1C5shmyZ/M8v
         QzLZDK9O7xZ2sA1CnLmy5+UO2DoXq5ymqlOREhIuqbCh34sTCVYyqPVSVp/FYGO9FHw6
         VAvF8h8Sxj5kEmQ5jkdnNB+o98DI78VkK4mSIKJ9s7GZfCY6bgyigQRd0GHUtfSxC9cM
         s85NMGOJPcaY0NvB5Y7sylTogfPF5AcRw0EAqslUrJNCr8ULMB/pTylEA3aIwOCnQ7+8
         C0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pC63zqxW+Cvjzw1yBC8gy+b1/vhMe/CUUc0tCDicM8c=;
        b=uW0epUQDuKFIfAcLFil14ZfpX1YxmsGk7/Go0OC7FtRRHV6WibLHzareDx/RHUMypk
         grp1Q5mO+YqBBmkOaqISbNZd8rlPJXmM2RGObOnUXB3HkQeMpccEy6a1TE/jfpm92WwY
         v4KgZkJuFS3LTZnFV3Hnv+XJejEau9lCPhx2/B5I+piXzIE+hEq9ynVH4wnZAX4oZ1+V
         EpZ/7NR6thqYwcrVom7yTwWPSabhSuEcMIwMukiLWWmHsVnvFJMdkK3aBkYxoRHuMc7j
         GvR75/RLH5DkwTlRvsDDMyM9b1lHq2qgjYwdyhTQtmX+1CzwNd/Giwbv4nWUykt3qC7A
         przQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 187si4919128ybq.104.2019.02.20.14.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 14:41:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwaYI-0004Mq-Bo
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 17:41:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaY1-0004Le-Ip
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gwaXz-0000Hq-EK
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 17:41:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34922)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gwaXu-00009Q-4K; Wed, 20 Feb 2019 17:40:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F6583F45;
	Wed, 20 Feb 2019 22:40:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28FAA5D6AA;
	Wed, 20 Feb 2019 22:40:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 20 Feb 2019 23:39:55 +0100
Message-Id: <20190220224003.4420-10-eric.auger@redhat.com>
In-Reply-To: <20190220224003.4420-1-eric.auger@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 20 Feb 2019 22:40:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 09/17] hw/arm/virt: Bump the 255GB initial RAM
 limit
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
X-TUID: ucpjG+mQ2UVn

Now we have the extended memory map (high IO regions beyond the
scalable RAM) and dynamic IPA range support at KVM/ARM level
we can bump the legacy 255GB initial RAM limit. The actual maximum
RAM size now depends on the physical CPU and host kernel.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7
- handle TCG case
- set_memmap modifications moved to previous patches
---
 hw/arm/virt.c | 54 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ad3a0ad73d..5b656f9db5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -59,6 +59,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "target/arm/internals.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -93,21 +94,8 @@
=20
 #define PLATFORM_BUS_NUM_IRQS 64
=20
-/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
- * RAM can go up to the 256GB mark, leaving 256GB of the physical
- * address space unallocated and free for future use between 256G and 51=
2G.
- * If we need to provide more RAM to VMs in the future then we need to:
- *  * allocate a second bank of RAM starting at 2TB and working up
- *  * fix the DT and ACPI table generation code in QEMU to correctly
- *    report two split lumps of RAM to the guest
- *  * fix KVM in the host kernel to allow guests with >40 bit address sp=
aces
- * (We don't want to fill all the way up to 512GB with RAM because
- * we might want it for non-RAM purposes later. Conversely it seems
- * reasonable to assume that anybody configuring a VM with a quarter
- * of a terabyte of RAM will be doing it on a host with more than a
- * terabyte of physical address space.)
- */
 #define RAMBASE GiB
+/* Legacy RAM limit in GB (< version 4.0) */
 #define LEGACY_RAMLIMIT_GB 255
 #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
=20
@@ -1372,16 +1360,18 @@ static void virt_set_memmap(VirtMachineState *vms=
)
     hwaddr base;
     int i;
=20
-    if (ms->maxram_size > ms->ram_size || ms->ram_slots > 0) {
-        error_report("mach-virt: does not support device memory: "
-                     "ignore maxmem and slots options");
-        ms->maxram_size =3D ms->ram_size;
-        ms->ram_slots =3D 0;
-    }
-    if (ms->ram_size > (ram_addr_t)LEGACY_RAMLIMIT_BYTES) {
-        error_report("mach-virt: cannot model more than %dGB RAM",
-                     LEGACY_RAMLIMIT_GB);
-        exit(1);
+    if (!vms->extended_memmap) {
+        if (ms->maxram_size > ms->ram_size || ms->ram_slots > 0) {
+            error_report("mach-virt: does not support device memory: "
+                         "ignore maxmem and slots options");
+            ms->maxram_size =3D ms->ram_size;
+            ms->ram_slots =3D 0;
+        }
+        if (ms->ram_size > (ram_addr_t)LEGACY_RAMLIMIT_BYTES) {
+            error_report("mach-virt: cannot model more than %dGB RAM",
+                         LEGACY_RAMLIMIT_GB);
+            exit(1);
+        }
     }
=20
     vms->memmap =3D extended_memmap;
@@ -1598,6 +1588,22 @@ static void machvirt_init(MachineState *machine)
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
=20
+   if (!kvm_enabled()) {
+        ARMCPU *cpu =3D ARM_CPU(first_cpu);
+        bool aarch64 =3D object_property_get_bool(OBJECT(cpu), "aarch64"=
, NULL);
+
+        if (aarch64 && vms->highmem) {
+            int requested_pa_size, pamax =3D arm_pamax(cpu);
+
+            requested_pa_size =3D 64 - clz64(vms->highest_gpa);
+            if (pamax < requested_pa_size) {
+                error_report("VCPU supports less PA bits (%d) than reque=
sted "
+                            "by the memory map (%d)", pamax, requested_p=
a_size);
+                exit(1);
+            }
+        }
+    }
+
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram)=
;
--=20
2.20.1

