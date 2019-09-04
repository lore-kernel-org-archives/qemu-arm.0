Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp439261wrp;
        Wed, 4 Sep 2019 01:58:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygyLQfXnLq1UmdWOpfViLwbbZ7uK6cOY4GIrj6E9cMv1nekPyEy19zD2Sn/Aep12bPdxnN
X-Received: by 2002:ac8:4988:: with SMTP id f8mr10581571qtq.2.1567587497910;
        Wed, 04 Sep 2019 01:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567587497; cv=none;
        d=google.com; s=arc-20160816;
        b=VQTEFQswcsNErU10rUp00TzM5FHld8nZBxPUI96i4637XhBwV6w6A19tXlJBXoA54D
         7DPMlD0y/id4B27VN5Or0aB8Is5pC/gS8YiXx+4/9KwynTkPjNge94LbCFJY0ue5Ed6C
         8oP1Rl9/FWjtbsdN/AoAal8i0sORigWQujfFjviSpqwt/pwXWcCXVr3m06+KcBhjJoq/
         cCFcZbRKAJSBe/7RXIwahP8rP/UwpX8ev0s8WGAG9N6W5c/UIyiDC3FV/XUnciCLPK9b
         +wwIpVF8mO1bAK6AfL8NfVoNtNkzwtjbO55mD0VL7XBoHrM+jGvink1qa4GyB0UVJQSZ
         Jhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=rTWsOEXzZWRlyjwcN3WId8GrW9T2jjGI3jtrfw+Kh+Y=;
        b=xrSS1YOpaiE8Ctjvk1hi+3BZ/wmXqCS3zvQCgm6BhO+2EkVrA/U9tI42yW344Nk/0c
         E6N84L8M6udigPCYYmbeWsR58RLjqK4Jh85eckZ1Av9WUTW4mgn9DWGpBcvH37z53EOJ
         LuSbWX/tIBOHfhKF+OzKbiwyLQEl/OMe6dxqGLKHHLwSDgwlyzYKvNQtTyWfiTS9Yf8H
         /IXKkVpm4OE1e6BCjtOsBvHfp9UDKd2hcSwt3v/W99LN5HEmDPE3qOnBlMOpDlwp17/w
         XkR50fe56ruBOHoRKgJ656ujpkF7UzNK9AnLoJPQ443cFvIEQZdFHtN4zEUey7MqcJCU
         4yfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si819491qtt.302.2019.09.04.01.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 01:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5R7I-0007J9-T1
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 04:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38403)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6m-0006z0-ON
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6k-000753-BH
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 04:57:44 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2258 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1i5R6j-00073Y-Dq; Wed, 04 Sep 2019 04:57:42 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AF4CEAB72B497DE3D10E;
 Wed,  4 Sep 2019 16:57:38 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 16:57:29 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 4 Sep 2019 09:56:19 +0100
Message-ID: <20190904085629.13872-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH-for-4.2 v10 01/11] hw/acpi: Make ACPI IO address
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
X-TUID: gGf6+FmBnfKo

This is in preparation for adding support for ARM64 platforms
where it doesn't use port mapped IO for ACPI IO space. We are
making changes so that MMIO region can be accommodated
and board can pass the base address into the aml build function.

Also move few MEMORY_* definitions to header so that other memory
hotplug event signalling mechanisms (eg. Generic Event Device on
HW-reduced acpi platforms) can use the same from their respective
event handler code.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v9 --> v10
  - Fixed "make check" failure on x86_64.

v8 --> v9
  -base address is an input into build_memory_hotplug_aml()
  -Removed R-by tags from Igor and Eric for now.
---
 hw/acpi/memory_hotplug.c         | 33 ++++++++++++++------------------
 hw/i386/acpi-build.c             |  7 ++++++-
 hw/i386/pc.c                     |  3 +++
 include/hw/acpi/memory_hotplug.h |  9 +++++++--
 include/hw/i386/pc.h             |  3 +++
 5 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 9483d66e86..9b0b150f4f 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -30,12 +30,7 @@
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
@@ -210,7 +205,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
 };
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base)
+                              MemHotplugState *state, hwaddr io_base)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
 
@@ -219,12 +214,10 @@ void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
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
@@ -343,7 +336,8 @@ const VMStateDescription vmstate_memory_hotplug = {
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method)
+                              const char *event_handler_method,
+                              AmlRegionSpace rs, hwaddr memhp_io_base)
 {
     int i;
     Aml *ifctx;
@@ -352,10 +346,6 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     Aml *mem_ctrl_dev;
     char *mhp_res_path;
 
-    if (!memhp_io_base) {
-        return;
-    }
-
     mhp_res_path = g_strdup_printf("%s." MEMORY_HOTPLUG_DEVICE, res_root);
     mem_ctrl_dev = aml_device("%s", mhp_res_path);
     {
@@ -366,14 +356,19 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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
index 034e413fd0..0d97cc701d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1873,7 +1873,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
     }
-    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0", "\\_GPE._E03");
+
+    if (pcms->memhp_io_base && nr_mem) {
+        build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
+                                 "\\_GPE._E03", AML_SYSTEM_IO,
+                                 pcms->memhp_io_base);
+    }
 
     scope =  aml_scope("_GPE");
     {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c14ed86439..b38cd07231 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1951,6 +1951,9 @@ void pc_memory_init(PCMachineState *pcms,
 
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
index 19a837889d..ac09e42030 100644
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


