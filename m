Received: by 10.223.150.237 with SMTP id u100csp3057906wrb;
        Mon, 13 Nov 2017 17:19:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZ8M537ZoNTY6TtFNh7+NL1YB61O8zIQYvOfTDOvTn2ulNXF24Rt6oeOO0rdIlRcMM5HuSU
X-Received: by 10.13.227.5 with SMTP id m5mr7197562ywe.404.1510622342902;
        Mon, 13 Nov 2017 17:19:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510622342; cv=none;
        d=google.com; s=arc-20160816;
        b=gJkjDgKUtN1URgTdkPtfOmyzv6lWcqfsebwx4KlTzaLSMK2+CIJO64+0r1HD6CVne6
         j6pL5sZPtBFnCnOyjxTitZM4yw5Typ71Q/zUlgKDtpeVe6q9tZf7/9PzhCuk0pv8OlsL
         W3EUhpmkIOE92jCXH2thDR2Ndm201vHR1ARlzFHClF6MGJ5kuUcbETqFNAUxRSlZmW/7
         1jfMqQNd4THrDAMnQgcGtFsm/smZzNDJxfFrczQy3fMzEWHtlNthaBMp3HIPVVCxHTIT
         cQpha8kkjQgGZdgrdyxdB6PA9XEK9F97xu0WYfnFiWwBBpOeewkJWhBG0dVvYCM6NYMa
         ZTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=ijcvUqNlsMjymnb2dz+AvZQhvsg92Ho+4Xt4pmURqYk=;
        b=miyrrKtEz3oSGFnaHIDvdTRuBVbJIcVBjfin9lkuKqTeVtdyl7ZWka2EFUEfTWkP95
         uh/8SqC+nH2/6UcNs0mKKNNQep15kWY/hF687FB5jkIP7zZoqEUIpenEE0+fNH3HzlGX
         eGApoe9OFKp0gxP7+6fSFtnUqlq3fA1l/oBAqUHYqcze2IowvRZkkaeuxElE6kAxQITo
         1k2mccSmcQKxM0QKRRwthL9B7W1ahUlpkdntIJPcD72kJUF/KI+oET9nnCXsvcWKYdRa
         C/1l0d2UPsG73xOS6FIebzAOI/1cXhL00SkxiYZMUIwp7mhQB9qHl92pkNtzQmRPQvW3
         lj4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q4si3962313ybc.807.2017.11.13.17.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 17:19:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57151 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPsU-0005E8-9J
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 20:19:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPqh-000401-9V
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 20:17:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPqg-0004Da-9V
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 20:17:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEPqa-00045h-Cc; Mon, 13 Nov 2017 20:17:04 -0500
Received: from 172.30.72.60 (EHLO DGGEMS411-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT86937; Tue, 14 Nov 2017 09:16:54 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.361.1; Tue, 14 Nov 2017
	09:15:57 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Tue, 14 Nov 2017 09:15:51 +0800
Message-ID: <1510622154-17224-3-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5A0A4406.0090, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6bdc2bd85fb1e5fbaf4796237eb2b147
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-arm] [RFC 2/5] hw/arm/virt: Enable dynamic generation of
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
Cc: peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ead77sNUqjQq

From: Zhu Yijun <zhuyijun@huawei.com>

Register a ram_memory_region_init notify to allocate memory region
from system memory and add them as subregions.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
---
 hw/arm/virt.c         | 21 ++++++++++++++++-----
 include/hw/arm/virt.h |  1 +
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..ddde5e1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1225,6 +1225,19 @@ void virt_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(vms);
 }
 
+static void virt_ram_memory_region_init(Notifier *notifier, void *data)
+{
+    MachineState *machine = MACHINE(qdev_get_machine());
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *ram = g_new(MemoryRegion, 1);
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         ram_memory_region_init);
+
+    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
+                                         machine->ram_size);
+    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+}
+
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -1258,7 +1271,6 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     int n, virt_max_cpus;
-    MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
 
     /* We can probe only here because during property set
@@ -1409,10 +1421,6 @@ static void machvirt_init(MachineState *machine)
     fdt_add_cpu_nodes(vms);
     fdt_add_psci_node(vms);
 
-    memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
-                                         machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
-
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vms, pic);
@@ -1462,6 +1470,9 @@ static void machvirt_init(MachineState *machine)
      * Notifiers are executed in registration reverse order.
      */
     create_platform_bus(vms, pic);
+
+    vms->ram_memory_region_init.notify = virt_ram_memory_region_init;
+    qemu_add_machine_init_done_notifier(&vms->ram_memory_region_init);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..38906b8 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -90,6 +90,7 @@ typedef struct {
 typedef struct {
     MachineState parent;
     Notifier machine_done;
+    Notifier ram_memory_region_init;
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
-- 
1.8.3.1


