Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3146201wrt;
        Mon, 28 Jan 2019 03:07:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4zj5YQ2WtpYo1dgYQngh5l54Tor/IkjJNdGYOQ3C87XP8la9MSeLgvzXHY30F+mb5VB0/G
X-Received: by 2002:adf:e149:: with SMTP id f9mr23008399wri.42.1548673637459;
        Mon, 28 Jan 2019 03:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673637; cv=none;
        d=google.com; s=arc-20160816;
        b=qLkoQmaTm4VWJ+5GKIwsKcGGN6rGFWF3hPkENAVT2CljMT9hI2o2uG3D1sJq3NF30z
         j6+N5aINdGPLWR5oZE2ycdwB9NRlQqam+5AXPpQ84D2HPS1kY8SZ//mSEkwItVfbEQXe
         xK8k1mQj9pyORAk1iCmUuT9JYl6W3uDQnE1Kii6ybj7KQwmh5/MmrNDTfarX0b1EnR9s
         VWZ3unhZ9SKzYGtpfxj+J5CpBlNqfTpqOfJcUQptKtjqtWPVJI4lRdje/xplfL3i0hlB
         18ZlmPlWmMtcVJI1fYPGFMxsHwc1KDeBuVnsxSXsCJh75kNgvxN4bYhxVl+LELk9BFkP
         C50Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=Z9RCDKHTLl473egDrWKfRjaj4/RAn70tszqNv1yS6Iw=;
        b=NmVncsDAWn/BNMglc3Pl5jh+gRIq8Mq8bdKvyraCBt2S1oiaFEthiFSSOhSveuL3ZB
         /+AxVUV4KvYS6KZdhP5Oj9nOR2imDoj4QfaISNt2rSJX2Dvsf7EOfKyoUul1BCSvSTXg
         y2gzW6PmzSZSS/N6+2X1VqFPCqquuy+K4pcXrZ75RE44uktbL1TL2qvpSJz1AWYSsxRV
         vfsq/bqpJweRb4f/VQPuR/+hSRbxfmr/GVzuVjmfWsWNjnJHZy7CUV8IzF3Qoy/iRSs4
         c/mQfDHESxA70rhOAXtEBGGnz5BEqo8KCu9SIU9IBhnIFE6wBP8WSFPFjlZr/4gKsJOw
         Hl7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si84073595wra.444.2019.01.28.03.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57921 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4l2-0003jr-F9
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4ko-0003hE-5Q
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4km-000451-7T
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:07:01 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33556 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4ki-00043q-Jg; Mon, 28 Jan 2019 06:06:58 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C1CA0769E03B966D799F;
	Mon, 28 Jan 2019 19:06:53 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 28 Jan 2019 19:06:42 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <eric.auger@redhat.com>, <shannon.zhaosl@gmail.com>,
	<peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Jan 2019 11:05:43 +0000
Message-ID: <20190128110545.20644-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
References: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC PATCH 1/4] hw:acpi: Make ACPI IO address space
 configurable
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
Cc: linuxarm@huawei.com, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HFR0jSTm/xHP

This is in preparation for adding support for ARM64 platforms
where it doesn't use port mapped IO for ACPI IO space.

Also add a flag to identify hw reduced ACPI platforms as they
might use GPIO hw for signaling ACPI platform events.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/acpi/memory_hotplug.c         | 13 ++++++++-----
 hw/i386/acpi-build.c             |  3 ++-
 include/hw/acpi/memory_hotplug.h |  6 ++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 921cad2..05f1d45 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -34,7 +34,7 @@
 #define MEMORY_HOTPLUG_IO_LEN         24
 #define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
 
-static uint16_t memhp_io_base;
+static hwaddr memhp_io_base;
 
 static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
 {
@@ -208,7 +208,7 @@ static const MemoryRegionOps acpi_memory_hotplug_ops = {
 };
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base)
+                              MemHotplugState *state, hwaddr io_base)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
 
@@ -279,7 +279,9 @@ void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
     mdev->is_enabled = true;
     if (dev->hotplugged) {
         mdev->is_inserting = true;
-        acpi_send_event(DEVICE(hotplug_dev), ACPI_MEMORY_HOTPLUG_STATUS);
+        if (!mem_st->hw_reduced_acpi) {
+            acpi_send_event(DEVICE(hotplug_dev), ACPI_MEMORY_HOTPLUG_STATUS);
+        }
     }
 }
 
@@ -341,7 +343,8 @@ const VMStateDescription vmstate_memory_hotplug = {
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method)
+                              const char *event_handler_method,
+                              AmlRegionSpace rs)
 {
     int i;
     Aml *ifctx;
@@ -371,7 +374,7 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
         aml_append(mem_ctrl_dev, aml_name_decl("_CRS", crs));
 
         aml_append(mem_ctrl_dev, aml_operation_region(
-            MEMORY_HOTPLUG_IO_REGION, AML_SYSTEM_IO,
+            MEMORY_HOTPLUG_IO_REGION, rs,
             aml_int(memhp_io_base), MEMORY_HOTPLUG_IO_LEN)
         );
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2e21a31..b62c1a3 100644
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
index 77c6576..ec56579 100644
--- a/include/hw/acpi/memory_hotplug.h
+++ b/include/hw/acpi/memory_hotplug.h
@@ -26,10 +26,11 @@ typedef struct MemHotplugState {
     uint32_t selector;
     uint32_t dev_count;
     MemStatus *devs;
+    bool hw_reduced_acpi; /*true for hw reduced acpi platform */
 } MemHotplugState;
 
 void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
-                              MemHotplugState *state, uint16_t io_base);
+                              MemHotplugState *state, hwaddr io_base);
 
 void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
                          DeviceState *dev, Error **errp);
@@ -48,5 +49,6 @@ void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list);
 
 void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
                               const char *res_root,
-                              const char *event_handler_method);
+                              const char *event_handler_method,
+                              AmlRegionSpace rs);
 #endif
-- 
2.7.4


