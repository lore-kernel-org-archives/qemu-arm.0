Received: by 10.223.150.237 with SMTP id u100csp2395119wrb;
        Mon, 13 Nov 2017 04:31:19 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaj9bUZFZtszc+H+gwBAX9OGVc3aXktF/laNqb8F79BIz6ta/ZnFRWkkBNIHQV49XiKvkQ7
X-Received: by 10.37.189.83 with SMTP id p19mr5234016ybm.315.1510576279356;
        Mon, 13 Nov 2017 04:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510576279; cv=none;
        d=google.com; s=arc-20160816;
        b=Fdqu/FB2klQHSoiqRS9MJzGJu/IwWo1O1AKCF1dhVtOiou2SX9NsJaCKidb0GmW1vH
         EsTzMH+ODJUo6ivGiInLOua/O94oRdkNvyvzRX79DPXPnsJv00lI+5zrI8hN3f55AvsC
         2Ei6NqAasGvnLKnffJsqPCrJJJmk26yXgeY9H/Fy7lsM41ZnxZ8lxOBzOCZAe8AGVSM3
         gWhlNFyueqpnp6RTX+wmqm+Fn5aflTgQ224zlIgYMRVhdRMr30F5wSLqaRc+oUU/HBnC
         o+qazz54CDv9SvHCyivpczS6mjImM0GxnIwyMB5gaTTRfJ7KNISW/pB/HZ5sRRT+W69m
         SUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=drnovajfDAxBJL2jxrrb6OmftiSuLHwwrqFkAY+B6UA=;
        b=HIFbaQh1re3GeD0y2+lj4CP4hESIPMvS8ds4zML1uTvXu7R7FGz/ccetstQDdcvYwZ
         AKmsnWQInVmQYuXS52mWVNFUiI8BeTJrej0b4I36KYc1behUX4Ap4nZgI3Lh/hZi4jxl
         Lr48fwM3ka4kYM1oZu4USGIY8X1evFdQ+j9NG9vRYMVtIod22EB217ZchhmSbw3yglTm
         ffriFCAGY2iZL9kirV68LOZAmiNa4kYLIkLrA38uC29M2q06O/goCuraYXpHjN7V6yGH
         TfOj1/G3HduVwkgpcPACO9Of5UEHe+XE4XAomU+5DsC36BGhoY7YcOYA1vFI07PlHDTV
         1eGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i185si3801677ywf.546.2017.11.13.04.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 04:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEDtW-0007QI-OY
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 07:31:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDs1-0006cW-S2
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:29:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEDrx-0000kZ-3T
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 07:29:45 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2346)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEDrw-0000hb-7j; Mon, 13 Nov 2017 07:29:41 -0500
Received: from 172.30.72.60 (EHLO DGGEMS406-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKT03136; Mon, 13 Nov 2017 20:29:31 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Mon, 13 Nov 2017
	20:29:22 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Mon, 13 Nov 2017 20:29:03 +0800
Message-ID: <1510576145-23084-4-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
References: <1510576145-23084-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5A09902C.006B, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 8197e73b3ca87d9a208b7667f2e25e04
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [RFC 3/5] hw/arm: add scattered RAM memory region
 support
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
Cc: peter.maydell@linaro.org, shameerali.kolothum.thodi@huawei.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a8enmLrK/BDH

From: Zhu Yijun <zhuyijun@huawei.com>

Dig out reserved memory holes and collect scattered RAM memory
regions by adding mem_list member in arm_boot_info struct.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
---
 hw/arm/boot.c        |   8 ++++
 hw/arm/virt.c        | 101 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/arm.h |   1 +
 3 files changed, 108 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8..30438f4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -836,6 +836,14 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
      */
     assert(!(info->secure_board_setup && kvm_enabled()));
 
+    /* If machine is not virt, the mem_list will empty. */
+    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
+        RAMRegion *new = g_new(RAMRegion, 1);
+        new->base = info->loader_start;
+        new->size = info->ram_size;
+        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
+    }
+
     info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
 
     /* Load the kernel.  */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ddde5e1..ff334c1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,6 +56,7 @@
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
+#include "hw/vfio/vfio-common.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1225,6 +1226,98 @@ void virt_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(vms);
 }
 
+static void handle_reserved_ram_region_overlap(void)
+{
+    hwaddr cur_end, next_end;
+    RAMRegion *reg, *next_reg, *tmp_reg;
+
+    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
+        next_reg = QLIST_NEXT(reg, next);
+
+        while (next_reg && next_reg->base <= (reg->base + reg->size)) {
+            next_end = next_reg->base + next_reg->size;
+            cur_end = reg->base + reg->size;
+            if (next_end > cur_end) {
+                reg->size += (next_end - cur_end);
+            }
+
+            tmp_reg = QLIST_NEXT(next_reg, next);
+            QLIST_REMOVE(next_reg, next);
+            g_free(next_reg);
+            next_reg = tmp_reg;
+        }
+    }
+}
+
+static void update_memory_regions(VirtMachineState *vms, hwaddr ram_size)
+{
+
+    RAMRegion *new, *reg, *last = NULL;
+    hwaddr virt_start, virt_end;
+    virt_start = vms->memmap[VIRT_MEM].base;
+    virt_end = virt_start + ram_size - 1;
+
+    handle_reserved_ram_region_overlap();
+
+    QLIST_FOREACH(reg, &reserved_ram_regions, next) {
+        if (reg->base >= virt_start && reg->base < virt_end) {
+            if (reg->base == virt_start) {
+                virt_start += reg->size;
+                virt_end += reg->size;
+                continue;
+            } else {
+                new = g_new(RAMRegion, 1);
+                new->base = virt_start;
+                new->size = reg->base - virt_start;
+                virt_start = reg->base + reg->size;
+            }
+
+            if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
+                QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
+            } else {
+                QLIST_INSERT_AFTER(last, new, next);
+            }
+
+            last = new;
+            ram_size -= new->size;
+            virt_end += reg->size;
+        }
+    }
+
+    if (ram_size > 0) {
+        new = g_new(RAMRegion, 1);
+        new->base = virt_start;
+        new->size = ram_size;
+
+        if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
+            QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
+        } else {
+            QLIST_INSERT_AFTER(last, new, next);
+        }
+    }
+}
+
+static void create_ram_alias(VirtMachineState *vms,
+                             MemoryRegion *sysmem,
+                             MemoryRegion *ram)
+{
+    RAMRegion *reg;
+    MemoryRegion *ram_memory;
+    char *nodename;
+    hwaddr sz = 0;
+
+    QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
+        nodename = g_strdup_printf("ram@%" PRIx64, reg->base);
+        ram_memory = g_new(MemoryRegion, 1);
+        memory_region_init_alias(ram_memory, NULL, nodename, ram, sz,
+                                 reg->size);
+        memory_region_add_subregion(sysmem, reg->base, ram_memory);
+        sz += reg->size;
+
+        g_free(nodename);
+    }
+}
+
 static void virt_ram_memory_region_init(Notifier *notifier, void *data)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
@@ -1232,10 +1325,15 @@ static void virt_ram_memory_region_init(Notifier *notifier, void *data)
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     VirtMachineState *vms = container_of(notifier, VirtMachineState,
                                          ram_memory_region_init);
+    RAMRegion *first_mem_reg;
 
     memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
                                          machine->ram_size);
-    memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
+    update_memory_regions(vms, machine->ram_size);
+    create_ram_alias(vms, sysmem, ram);
+
+    first_mem_reg = QLIST_FIRST(&vms->bootinfo.mem_list);
+    vms->bootinfo.loader_start = first_mem_reg->base;
 }
 
 static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
@@ -1458,7 +1556,6 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.initrd_filename = machine->initrd_filename;
     vms->bootinfo.nb_cpus = smp_cpus;
     vms->bootinfo.board_id = -1;
-    vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
     vms->bootinfo.firmware_loaded = firmware_loaded;
     arm_load_kernel(ARM_CPU(first_cpu), &vms->bootinfo);
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index ce769bd..d953026 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -124,6 +124,7 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+    QLIST_HEAD(, RAMRegion) mem_list;
 };
 
 /**
-- 
1.8.3.1


