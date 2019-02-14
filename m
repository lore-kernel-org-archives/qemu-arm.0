Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1019795wrp;
        Thu, 14 Feb 2019 06:07:49 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaVJmMIN8LuwHE68FQ4OY4udgpwmXD6cKqdYJ0cMH7eMfg13XC9yxhgYNn+Y0L4l6PFLw8M
X-Received: by 2002:a25:38d2:: with SMTP id f201mr3299652yba.253.1550153269347;
        Thu, 14 Feb 2019 06:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550153269; cv=none;
        d=google.com; s=arc-20160816;
        b=HQ6J0lBXmpxba3wi3Q7vY9iP1pqaG6Gorih6Du2uDvKtzfUqRHnEN/7O1Ic5713vBx
         MaMyKs6yc9lbTTRADv2KmVNrf1ehNOFfNoeI2jy5YMDcIJ4+aap807fv7f5lRR16i1qF
         t7xkC6KXDORJj1z5qZDcMJHoJh1zC5HT6SD5TwEmc0UI2OQv/vIdH2VS9sE9R9LP10aN
         CiZTekoxrweJnBxo1qT3431P0/2ENXxLAkVDySfxUKMAL2zoXXOm4xDvvrLseIn+CMMc
         6j2sccAsiM2aI+VokBWikWk+sy8wvoINCL9SQOaUOvtpeAb7DnUH7nY/7nSo477T/7oE
         dA2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=g+9y7MInoR1lchmUlctU2AFWeYRH0VIdg3F2W2C2thU=;
        b=y1GY3z9Vfo+C6sCos3SPH5wEaxAuntMFlgfVOMmZLwwfRZtPW9VfSb5SCLrd3Q54++
         VsTqA1GGHWoSpx2vssIhhvBeLM/BqAlomevJIHtN1dL7c5QEfB3k+rJnolJdLsPssy95
         x22XuzIjiaR2ZV6SWIcpucgBR5BngXc4eDSaQQ1tI9qujZ/0zkeePdwpBAQ/9RrT5jL3
         /mW0js19/oCPDqvR7+bKt8A3wcOcH7FG/yi+rA6c73o+02P2Vo4xbB2Cyjp+E9/oIAJ1
         bZ6BvFLlg++Njw2yS/mYEQiHsOyc+Q8wS7VJkq6KqVYGt0oiTZu9HgdXOHlG8jH/QK0Q
         OLgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si1444275ybi.282.2019.02.14.06.07.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 06:07:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guHg4-0000F6-Nt
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 09:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1guHfo-0000DW-JN
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 09:07:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1guHfk-0004HV-Nh
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 09:07:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:3131)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1guHfh-0004CE-4Y; Thu, 14 Feb 2019 09:07:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2ABF189AF3;
	Thu, 14 Feb 2019 14:07:20 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40D87277CF;
	Thu, 14 Feb 2019 14:07:18 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 09:07:14 -0500
Message-Id: <20190214140714.15738-1-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Feb 2019 14:07:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC] memory: use memory_region_init_ram() instead of
 memory_region_allocate_system_memory()
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-arm@nongnu.org,
	jan.kiszka@web.de, pbonzini@redhat.com, atar4qemu@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSRFugIka2DA

I'm considering to deprecating -mem-path/prealloc CLI options and replacing
them with a single memdev Machine property to allow interested users to pick
used backend for initial RAM (fixes mixed -mem-path+hostmem backends issues)
and as a transition step to modeling initial as a Device instead of (ab)using
MemoryRegion APIs.

Currently most boards use memory_region_allocate_system_memory() to allocate
RAM and the interface tied up too much to MemoryRegion that makes changing API
to hostmem across tree is quite a bit of work sometimes requiring logic rewrite
to do it cleanly and I'm not sure it's worth the effort and that it really has
a merit to do in case of TCG only boards.

I suggest to get rid memory_region_allocate_system_memory() on TCG only boards
since most of them don't really need NUMA features provided by this API and/or
probably won't noticeably benefit from -mem-path/prealloc backed memory if at all
and replacing memory allocation with plain memory_region_init_ram() API.

It won't require extensive changes in TCG only boards we have now, since they would
continue to use MemoryRegion based API approach. And the boards, that really need
to use hugepages or numa features, could be amended to use new machine memdev
property and/or initial RAM being allocated by implictly (-m) using hostmem-ram backend.

Also some boards (ab)use memory_region_allocate_system_memory(), calling it several
times to allocate various fixed sized chunks of RAM and ROMs, which is problematic
to map to a single initial RAM Machine::memdev backend and is currently broken if
-mem-path points to a not hugepage pool.

This RFC attempts to cleanup things a bit on TCG only boards (only several ones)
side and test waters if it's acceptable approach.  If it looks acceptable, I'll send
a proper series to make usage of memory_region_allocate_system_memory() minimal across
the codebase and then convert boards that actually use numa/hugepages to initial RAM
memdev model (arm/virt, spapr, s390x, pc/q35).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/musicpal.c    |  4 ++--
 hw/arm/vexpress.c    |  4 ++--
 hw/sparc64/niagara.c | 30 +++++++++++++++---------------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index d22532a11c..197e7d1282 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1592,8 +1592,8 @@ static void musicpal_init(MachineState *machine)
     cpu = ARM_CPU(cpu_create(machine->cpu_type));
 
     /* For now we use a fixed - the original - RAM size */
-    memory_region_allocate_system_memory(ram, NULL, "musicpal.ram",
-                                         MP_RAM_DEFAULT_SIZE);
+    memory_region_init_ram(ram, NULL, "musicpal.ram", MP_RAM_DEFAULT_SIZE,
+                           &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, ram);
 
     memory_region_init_ram(sram, NULL, "musicpal.sram", MP_SRAM_SIZE,
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index c02d18ee61..a2cf5c0af2 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -280,8 +280,8 @@ static void a9_daughterboard_init(const VexpressMachineState *vms,
         exit(1);
     }
 
-    memory_region_allocate_system_memory(ram, NULL, "vexpress.highmem",
-                                         ram_size);
+    memory_region_init_ram(ram, NULL, "vexpress.highmem", ram_size,
+                           &error_fatal);
     low_ram_size = ram_size;
     if (low_ram_size > 0x4000000) {
         low_ram_size = 0x4000000;
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index f8a856f611..62e0348d5f 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -37,6 +37,7 @@
 #include "sysemu/block-backend.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
+#include "qapi/error.h"
 
 
 typedef struct NiagaraBoardState {
@@ -108,27 +109,26 @@ static void niagara_init(MachineState *machine)
     /* init CPUs */
     sparc64_cpu_devinit(machine->cpu_type, NIAGARA_PROM_BASE);
     /* set up devices */
-    memory_region_allocate_system_memory(&s->hv_ram, NULL, "sun4v-hv.ram",
-                                         NIAGARA_HV_RAM_SIZE);
+    memory_region_init_ram(&s->hv_ram, NULL, "sun4v-hv.ram",
+                                         NIAGARA_HV_RAM_SIZE, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_HV_RAM_BASE, &s->hv_ram);
 
-    memory_region_allocate_system_memory(&s->partition_ram, NULL,
-                                         "sun4v-partition.ram",
-                                         machine->ram_size);
+    memory_region_init_ram(&s->partition_ram, NULL, "sun4v-partition.ram",
+                                         machine->ram_size, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_PARTITION_RAM_BASE,
                                 &s->partition_ram);
 
-    memory_region_allocate_system_memory(&s->nvram, NULL,
-                                         "sun4v.nvram", NIAGARA_NVRAM_SIZE);
+    memory_region_init_ram(&s->nvram, NULL, "sun4v.nvram", NIAGARA_NVRAM_SIZE,
+                           &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_NVRAM_BASE, &s->nvram);
-    memory_region_allocate_system_memory(&s->md_rom, NULL,
-                                         "sun4v-md.rom", NIAGARA_MD_ROM_SIZE);
+    memory_region_init_ram(&s->md_rom, NULL, "sun4v-md.rom",
+                           NIAGARA_MD_ROM_SIZE, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_MD_ROM_BASE, &s->md_rom);
-    memory_region_allocate_system_memory(&s->hv_rom, NULL,
-                                         "sun4v-hv.rom", NIAGARA_HV_ROM_SIZE);
+    memory_region_init_ram(&s->hv_rom, NULL, "sun4v-hv.rom",
+                           NIAGARA_HV_ROM_SIZE, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_HV_ROM_BASE, &s->hv_rom);
-    memory_region_allocate_system_memory(&s->prom, NULL,
-                                         "sun4v.prom", PROM_SIZE_MAX);
+    memory_region_init_ram(&s->prom, NULL, "sun4v.prom",
+                                         PROM_SIZE_MAX, &error_fatal);
     memory_region_add_subregion(sysmem, NIAGARA_PROM_BASE, &s->prom);
 
     add_rom_or_fail("nvram1", NIAGARA_NVRAM_BASE);
@@ -145,8 +145,8 @@ static void niagara_init(MachineState *machine)
         BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
         int size = blk_getlength(blk);
         if (size > 0) {
-            memory_region_allocate_system_memory(&s->vdisk_ram, NULL,
-                                                 "sun4v_vdisk.ram", size);
+            memory_region_init_ram(&s->vdisk_ram, NULL, "sun4v_vdisk.ram", size,
+                                   &error_fatal);
             memory_region_add_subregion(get_system_memory(),
                                         NIAGARA_VDISK_BASE, &s->vdisk_ram);
             dinfo->is_default = 1;
-- 
2.18.1

