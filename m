Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp31176wrs;
        Tue, 13 Aug 2019 14:08:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcUy7n7+zH7Bl/l4o53yQwkk6FBF1GWRIVCEporB26X35xxzYo06OEq8VjZiHs0EMFs/rp
X-Received: by 2002:a17:907:4451:: with SMTP id mw1mr16607499ejb.270.1565730493072;
        Tue, 13 Aug 2019 14:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730493; cv=none;
        d=google.com; s=arc-20160816;
        b=oObtkUIRJumG+WhSY873aNnveB8aa6QFvJXg1g9VeWNHjU1Hq0aLwF8TNt+ESx1pLc
         LDXiqZLF6Z27Lpjy9Tq73TntRref0CcF65P28UOq4PoZbblFO7w35RLWV/L8tIj6+iUl
         DvUCrBxA8yoaYZknKc7gS9v+gqq/zCC5AWHwldBtM0j2h2GwByFEk8T5YDcA20flVY30
         VzHLxo0K/HXf2ItznCy49FHMGEJ/eut2pWseFhdqfyShNunJyLjHhjYUYQ+W/l9bCR4b
         wUtuONqHgO2cC8y7DRxPNs/qHtXyIPW8+PTZc9mW2cZomzILgJQlp8KOgliBgxXDRPLi
         0SkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=KOaBbheiXegr9n05bHIw34hEbIwBv9xvZKRMYUeQ0UA=;
        b=k3EVlqhayBv2upGySb1AnGYueAmm7xXMZKNJOJhHYz2ZTXIFsyNj/NOD1B29bKVtLB
         8NL7vaKxesbagaJVoSWKQKiGsmYrBh9+tRA6Nn3GxMCL3TIWMqIUYxHZD6+Yb+dBEud5
         a2VmizeofXpuGtsiq0N3hZwskWui4mvlliBv90t/ZX+MwlhhhOhG5MyjL3VHIcrpVSj+
         eeh0BryN/MCB9RBVCcK/rMGSosmn4tIxe4Z6b9LummpYSXeObyXh1MhJYo0DQBIY56l9
         /UVbxHi0xZUGZ9UFrpAK0J7FyRx+wfRkfwSOXF542fQMpsTUOPC7ODBMF7WWyeUxxFZD
         3h6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lu33si6191365ejb.182.2019.08.13.14.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe1c-0004nQ-32
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41594)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0o-0004ZK-3y
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0m-0000yc-8l
 for qemu-arm@nongnu.org; Tue, 13 Aug 2019 17:07:22 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2251 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe0l-0000tW-Mh; Tue, 13 Aug 2019 17:07:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CFB2BDBBB1A785A531F5;
 Wed, 14 Aug 2019 05:07:16 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:06 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:28 +0100
Message-ID: <20190813210539.31164-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v9 01/12] hw/acpi: Make ACPI IO address
 space configurable
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 075iSGK5fHx9

This is in preparation for adding support for ARM64 platforms
where it doesn't use port mapped IO for ACPI IO space. We are
making changes so that MMIO region can be accommodated
and board can pass the base address into the aml build function.

Also move few MEMORY_* definitions to header so that other memory
hotplug event signalling mechanisms (eg. Generic Event Device on
HW-reduced acpi platforms) can use the same from their respective
event handler code.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
v8 --> v9
  -base address is an input into build_memory_hotplug_aml()
  -Removed R-by tags from Igor and Eric for now.
---
 hw/acpi/memory_hotplug.c         | 29 ++++++++++++++---------------
 hw/i386/acpi-build.c             |  4 +++-
 hw/i386/pc.c                     |  3 +++
 include/hw/acpi/memory_hotplug.h |  9 +++++++--
 include/hw/i386/pc.h             |  3 +++
 5 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 297812d5f7..1734d4b44f 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -29,12 +29,7 @@
 #define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
 #define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
 #define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
-#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
 #define MEMORY_HOTPLUG_DEVICE        "MHPD"
-#define MEMORY_HOTPLUG_IO_LEN         24
-#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
-
-static uint16_t memhp_io_base;
 
 static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
 {
@@ -209,7 +204,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
 };
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base)
+                              MemHotplugState *state, hwaddr io_base)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
 
@@ -218,12 +213,10 @@ void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
         return;
     }
 
-    assert(!memhp_io_base);
-    memhp_io_base = io_base;
     state->devs = g_malloc0(sizeof(*state->devs) * state->dev_count);
     memory_region_init_io(&state->io, owner, &acpi_memory_hotplug_ops, state,
                           "acpi-mem-hotplug", MEMORY_HOTPLUG_IO_LEN);
-    memory_region_add_subregion(as, memhp_io_base, &state->io);
+    memory_region_add_subregion(as, io_base, &state->io);
 }
 
 /**
@@ -342,7 +335,8 @@ const VMStateDescription vmstate_memory_hotplug = {
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method)
+                              const char *event_handler_method,
+                              AmlRegionSpace rs, hwaddr memhp_io_base)
 {
     int i;
     Aml *ifctx;
@@ -365,14 +359,19 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
             aml_name_decl("_UID", aml_string("Memory hotplug resources")));
 
         crs = aml_resource_template();
-        aml_append(crs,
-            aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
-                   MEMORY_HOTPLUG_IO_LEN)
-        );
+        if (rs == AML_SYSTEM_IO) {
+            aml_append(crs,
+                aml_io(AML_DECODE16, memhp_io_base, memhp_io_base, 0,
+                       MEMORY_HOTPLUG_IO_LEN)
+            );
+        } else {
+            aml_append(crs, aml_memory32_fixed(memhp_io_base,
+                            MEMORY_HOTPLUG_IO_LEN, AML_READ_WRITE));
+        }
         aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
 
         aml_append(mem_ctrl_dev, aml_operation_region(
-            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
+            MEMORY_HOTPLUG_IO_REGION, rs,
             aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
         );
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f3fdfefcd5..e76d6631ea 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1871,7 +1871,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
     }
-    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0", "\\_GPE._E03");
+    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
+                             "\\_GPE._E03", AML_SYSTEM_IO,
+                             pcms->memhp_io_base);
 
     scope =  aml_scope("_GPE");
     {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 549c437050..be973cea99 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1936,6 +1936,9 @@ void pc_memory_init(PCMachineState *pcms,
 
     /* Init default IOAPIC address space */
     pcms->ioapic_as = &address_space_memory;
+
+    /* Init ACPI memory hotplug IO base address */
+    pcms->memhp_io_base = ACPI_MEMORY_HOTPLUG_BASE;
 }
 
 /*
diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
index 77c65765d6..dfe9cf3fde 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -5,6 +5,10 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 
+#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
+#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
+#define MEMORY_HOTPLUG_IO_LEN         24
+
 /**
  * MemStatus:
  * @is_removing: the memory device in slot has been requested to be ejected.
@@ -29,7 +33,7 @@ typedef struct MemHotplugState {
 } MemHotplugState;
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base);
+                              MemHotplugState *state, hwaddr io_base);
 
 void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
                          DeviceState *dev, Error **errp);
@@ -48,5 +52,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method);
+                              const char *event_handler_method,
+                              AmlRegionSpace rs, hwaddr memhp_io_base);
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 859b64c51d..49b47535cf 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -69,6 +69,9 @@ struct PCMachineState {
     /* Address space used by IOAPIC device. All IOAPIC interrupts
      * will be translated to MSI messages in the address space. */
     AddressSpace *ioapic_as;
+
+    /* ACPI Memory hotplug IO base address */
+    hwaddr memhp_io_base;
 };
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
-- 
2.17.1


