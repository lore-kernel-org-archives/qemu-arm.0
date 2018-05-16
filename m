Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1242941wme;
        Wed, 16 May 2018 08:22:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq3qKx7e4C1N7xu1J1TCRs4u1HTYIMAMw0bdTrH6329P8aJH3U/P3cN4jnFc03MVfGd6hkU
X-Received: by 2002:aed:2198:: with SMTP id l24-v6mr1392997qtc.87.1526484150280;
        Wed, 16 May 2018 08:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484150; cv=none;
        d=google.com; s=arc-20160816;
        b=Hna3dFrR0GMCjhrfLzIwZXR/gWo3DFeF0kFho7SvCn7Tnht4f2sXBQa67/FaV1+oKN
         z4Lvv5M6M8Y3UOQppCRJlk1+duK0DB+q0u4stcVjuoa97gpIfgyL7730r6OMClO+cO59
         5QjYgHmFmT9iM2lAGCsDrGgDVrZpl/L+ZPTSal5TE4gbpv26/IgtY0m8cmOit0vYr84X
         nZ/+SwGhb8+9TAUCqwRtsIUuEQvhlQxWBiLfelU/vALsiuNB96UV0+MqXUJyOnV+/mxQ
         CHqggPBK5rFySDXXfRMPIKzzmfosRipj4heicWnmvVkLACWrsc+IkI1ZP89amkYumE7Z
         soyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=wWUWHGcsDFzqG+NQLYWXDcxorLaXMH8nQVdeCrHH4+I=;
        b=IjXDYZKn6851Lis8iaY4gg5fsoInjXifkHwT/lc6IcVQu/BJZqCkStcyCmKhrBTBq9
         xgJz8BWUBMWjD34qWgdrgeA1CwO+58IkUkYSApS/Ld2eprXLWHY2eAwKFLoXs3OKhocU
         OQxdJeICP4uuhmQHhmIlwskBTPWlzzyd48t5WuF1ezc1vKjFMeNGw5vyIRXpVrfIOXOz
         mdkJpVeUoeF+0XWCDe+H3NaMnl3KKzThpEp/IE9bB3QRdnIhB23YYJWKaMLKFaztLjbp
         Ab085ADL8+n/I3u+WTNBKAj2zolGdMhTf810nNFzvQtYu5d23LgIKL4U8ALycsc2fCWX
         ODEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n20-v6si2906173qtb.20.2018.05.16.08.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyG5-0007xE-RG
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:22:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFl-0007nc-H8
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFk-0005lo-5T
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:09 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2617 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFj-0005iu-CG; Wed, 16 May 2018 11:22:08 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C2EEEBB4595AC;
	Wed, 16 May 2018 23:21:51 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:44 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:22 +0100
Message-ID: <20180516152026.2920-3-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [RFC v2 2/6] hw/arm/virt: Enable dynamic generation of
 guest RAM memory regions
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3E0ukHpIQSoT

Register ram_memory_region_init notifier to allocate memory region
from system memory.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c         | 28 ++++++++++++++++++++++------
 include/hw/arm/virt.h |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94dcb12..05fcb62 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1171,6 +1171,19 @@ void virt_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(vms);
 }
 
+static void virt_ram_memory_region_init(Notifier *notifier, void *data)
+{
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *ram = g_new(MemoryRegion, 1);
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         ram_memory_region_init);
+    MachineState *machine = MACHINE(vms);
+
+    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
+                                         machine->ram_size);
+    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+}
+
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -1204,7 +1217,6 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     int n, virt_max_cpus;
-    MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
     /* We can probe only here because during property set
@@ -1361,10 +1373,6 @@ static void machvirt_init(MachineState *machine)
     fdt_add_timer_nodes(vms);
     fdt_add_cpu_nodes(vms);
 
-    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
-
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vms, pic);
@@ -1405,15 +1413,23 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.firmware_loaded = firmware_loaded;
+
+    /* Register notifiers. They are executed in registration reverse order */
     arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
 
     /*
      * arm_load_kernel machine init done notifier registration must
      * happen before the platform_bus_create call. In this latter,
      * another notifier is registered which adds platform bus nodes.
-     * Notifiers are executed in registration reverse order.
      */
     create_platform_bus(vms, pic);
+
+    /*
+     * Register memory region notifier last as this has to be executed
+     * first.
+     */
+    vms->ram_memory_region_init.notify = virt_ram_memory_region_init;
+    qemu_add_machine_init_done_notifier(&vms->ram_memory_region_init);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ba0c1a4..fc24f3a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -91,6 +91,7 @@ typedef struct {
 typedef struct {
     MachineState parent;
     Notifier machine_done;
+    Notifier ram_memory_region_init;
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
-- 
2.7.4


