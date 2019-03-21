Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp97225wrx;
        Thu, 21 Mar 2019 03:55:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNqfXsWUSGySM6+ZEx9o1eK4oZOewOK3gHwO2GkBXy5lZEjKuhEvK8Zq8qt86HsMbA1Jq2
X-Received: by 2002:a5d:620f:: with SMTP id y15mr1973783wru.101.1553165757472;
        Thu, 21 Mar 2019 03:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165757; cv=none;
        d=google.com; s=arc-20160816;
        b=mqPvxEWsrISacQdbBxsnSH5/mt8wKuxDIyYxELrc72qyfE+vX5gV+BpwbjV0q+RgRZ
         0FQzQPjJokJ+hEQv1nBEM54amxOfobC0TXzsGGGi6havpyqCQmANCjZz9DK4fBIIYD9j
         ONZ/TO+qjMO+dDbR5iErUuVnFNzsdvFbEynG452DCZ/QBwAZiT9ozSIaIk9/Aa6NXjyY
         8VHZgWoPE14WrP1u1MGbHuanTKd6k0sgRsyepH4zWcQoHX8p39EdyFFehdissyxYEu3T
         u4c6TCbPWCxMqGlTciiDOEhteudbXxRH8sKfYXMLKZDWf8LOwaNnD55AghQqhH4g8JCG
         HkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=tEK9bS9tHTGBV9g1TG77QS4bCq8uVvpsgMIlK4O5iqA=;
        b=WemZ1PzgfHd93wwQWMoWlsVFkYkRY8ZxaZkUaFRNm+JXxrzDi4njvZiSh1O5Dx0uQM
         roGLJ4R+wZqCTHqq/4JvvT6FtuISK/VOxHgN3H3A0/gqLSHi5eNstU41WJUvcmnhXYFC
         sjJDqplAlk+ANCDoKGQVOAw1QwnVCMssUhawB6GXZvbC8m4vF8wloarX8vdAbjnu5yHA
         2v0T3AFAA3+LjwtMYM7qXC7bHe9v3hT48AbwZpSeif9eHAN6votXQsr6SItD8sM6qx0K
         l6zMnjPHxKY9Q7SmF6L9/ybyLKfzGVojBtUGOFxCJ3Cl1McwJnZkjLXKbsbSJ1Mjn/Fa
         r2Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si603387wro.270.2019.03.21.03.55.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vMa-0007rM-Fv
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:55:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHk-0004XC-RK
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFr-0001Rs-Jc
	for qemu-devel@nongnu.org; Thu, 21 Mar 2019 06:49:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:56144 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vFp-0000Ml-7n; Thu, 21 Mar 2019 06:48:57 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 79103E5E8DB4E55B6534;
	Thu, 21 Mar 2019 18:48:47 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:48:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:36 +0000
Message-ID: <20190321104745.28068-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.35
Subject: [Qemu-devel] [PATCH v3 01/10] hw/acpi: Make ACPI IO address space
 configurable
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2d1txqnBrMxn

This is in preparation for adding support for ARM64 platforms
where it doesn't use port mapped IO for ACPI IO space.

Also move the MEMORY_SLOT_SCAN_METHOD/MEMORY_DEVICES_CONTAINER
definitions to header so that other memory hotplug event
signalling mechanisms (eg. Generic Event Device on HW-reduced
acpi platforms) can use the same from their respective event
handler aml code.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/memory_hotplug.c         | 24 ++++++++++++++----------
 hw/i386/acpi-build.c             |  3 ++-
 include/hw/acpi/memory_hotplug.h |  8 ++++++--
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 297812d..80e25f0 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -29,12 +29,10 @@
 #define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
 #define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
 #define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
-#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
 #define MEMORY_HOTPLUG_DEVICE        "MHPD"
 #define MEMORY_HOTPLUG_IO_LEN         24
-#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
 
-static uint16_t memhp_io_base;
+static hwaddr memhp_io_base;
 
 static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
 {
@@ -209,7 +207,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
 };
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base)
+                              MemHotplugState *state, hwaddr io_base)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
 
@@ -342,7 +340,8 @@ const VMStateDescription vmstate_memory_hotplug = {
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method)
+                              const char *event_handler_method,
+                              AmlRegionSpace rs)
 {
     int i;
     Aml *ifctx;
@@ -365,14 +364,19 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
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
index 416da31..6d6de44 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1852,7 +1852,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
                        "\\_SB.PCI0", "\\_GPE._E02");
     }
-    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0", "\\_GPE._E03");
+    build_memory_hotplug_aml(dsdt, nr_mem, "\\_SB.PCI0",
+                             "\\_GPE._E03", AML_SYSTEM_IO);
 
     scope =  aml_scope("_GPE");
     {
diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
index 77c6576..f95aa1f 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -5,6 +5,9 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 
+#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
+#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
+
 /**
  * MemStatus:
  * @is_removing: the memory device in slot has been requested to be ejected.
@@ -29,7 +32,7 @@ typedef struct MemHotplugState {
 } MemHotplugState;
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base);
+                              MemHotplugState *state, hwaddr io_base);
 
 void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
                          DeviceState *dev, Error **errp);
@@ -48,5 +51,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method);
+                              const char *event_handler_method,
+                              AmlRegionSpace rs);
 #endif
-- 
2.7.4


