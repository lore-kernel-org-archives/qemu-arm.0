Received: by 10.223.150.237 with SMTP id u100csp3057508wrb;
        Mon, 13 Nov 2017 17:18:26 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYXQOiOIry6+0CR63L+uzrBWNZ7NSamiY90Q/TfQH5dWMIP8ZAKKEX4MTHHr0pHtmN3jCfN
X-Received: by 10.129.174.10 with SMTP id m10mr3463963ywh.189.1510622306474;
        Mon, 13 Nov 2017 17:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510622306; cv=none;
        d=google.com; s=arc-20160816;
        b=b/t5vgZASudJUQhJ/6Nnbu+fOi/80KWGMnJADUZLCyXlWqPgeSRqjhvC6TKcbXJ9HP
         GufgQNOdWbl3mglPwc9fhPXVsSONl5WpGVUVYgC1KFDd9gLJoXQyMaDpYb/aDN3diLF/
         UkVJOrXSvZeNo3qiZSt1Q/nEhQi146rK8slDPOngzyg/HhF2J4CthTKyApEEoQa/K7BC
         RBp3RUi8YNbcfU26HAi0+VVPEA4znD6tfJUORZEog3eh03maZOi6J6YfzcRnL3mg3eis
         InToB+WmTOK5gHrM9tP9rCrVjFRo83AlilZ5XTdXv1w7kuUqDjUfwasAg3mpcs+PC+Q0
         x7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=O0LhUklQZbhcUaUW4luokRBguCcqgixSGAzXEjAUKts=;
        b=EufcKf936ILcWMmx8YBRBqbpZtyUlhCmnIcFsn4RKMRKmP/EnfhjE+pQq/CewnyD3e
         mmgZbv4yMw4q2kbrzjyzs4qrSimXfCmBUqfldUorcePoCS0szt5nDQN+Kcy5a1wCLtjI
         F3cxc7iUgo8aGSkxmybqqIVTjuPDkO20rBty5Oa++K3mQ1qy5N0G0dbFnZ/czGwgyxVJ
         VELn+ksVnuyNsX1rGq3VoNv4YlyDhBytLgvz/qdpxEudVfKsBkcxV4MIxlArnwW5wojY
         xA7SpOZrvZZ8GgSoWxKgelnUr3NnMFMK184VEox9OjkZUBRqSntQZApfiPc6aoU4lt8d
         A17g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k22si1281367ywh.46.2017.11.13.17.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 17:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPrt-0004X4-Ru
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 20:18:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPqD-0002os-OH
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPqC-0003ql-Ck
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:41 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2291)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEPqB-0003pK-GF; Mon, 13 Nov 2017 20:16:40 -0500
Received: from 172.30.72.58 (EHLO DGGEMS405-HUB.china.huawei.com)
	([172.30.72.58])
	by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKW85566; Tue, 14 Nov 2017 09:16:35 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS405-HUB.china.huawei.com
	(10.3.19.205) with Microsoft SMTP Server id 14.3.361.1; Tue, 14 Nov 2017
	09:15:58 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Tue, 14 Nov 2017 09:15:53 +0800
Message-ID: <1510622154-17224-5-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5A0A43F3.0052, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 165b4da8128d720285897c371ffa0918
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [RFC 4/5] hw/arm/boot: set fdt size cell of memory
 node from mem_list
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
X-TUID: a1jvt7rij35/

From: Zhu Yijun <zhuyijun@huawei.com>

In case of accessing memory holes, we create memory fdt node by
traversing mem_list and adjust memory address if the addr is not
belong to RAM memory region.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
---
 hw/arm/boot.c | 151 ++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 109 insertions(+), 42 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 30438f4..f4ca599 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -384,6 +384,25 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
     }
 }
 
+static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr mem_base,
+                                          uint32_t scells, hwaddr mem_len)
+{
+    char *nodename = NULL;
+    int rc;
+
+    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+    rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
+                                      scells, mem_len);
+    if (rc < 0) {
+        fprintf(stderr, "couldn't set %s/reg\n", nodename);
+        g_free(nodename);
+    }
+
+    return nodename;
+}
+
 /**
  * load_dtb() - load a device tree binary image into memory
  * @addr:       the address to load the image at
@@ -412,7 +431,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     uint32_t acells, scells;
     char *nodename;
     unsigned int i;
-    hwaddr mem_base, mem_len;
+    RAMRegion *reg;
 
     if (binfo->dtb_filename) {
         char *filename;
@@ -464,49 +483,65 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         goto fail;
     }
 
+    /*
+     * Turn the /memory node created before into a NOP node, then create
+     * /memory@addr nodes for all numa nodes respectively.
+     */
+    qemu_fdt_nop_node(fdt, "/memory");
+
     if (nb_numa_nodes > 0) {
-        /*
-         * Turn the /memory node created before into a NOP node, then create
-         * /memory@addr nodes for all numa nodes respectively.
-         */
-        qemu_fdt_nop_node(fdt, "/memory");
-        mem_base = binfo->loader_start;
+        hwaddr reg_offset = 0; /* region base addr offset */
+        hwaddr reg_alloc_size = 0; /* region consumed size */
+        hwaddr node_mem_size = 0;
+        RAMRegion *tmp_reg = QLIST_FIRST(&binfo->mem_list);
+
         for (i = 0; i < nb_numa_nodes; i++) {
-            mem_len = numa_info[i].node_mem;
-            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
-            qemu_fdt_add_subnode(fdt, nodename);
-            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                              acells, mem_base,
-                                              scells, mem_len);
-            if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
-                        i);
-                goto fail;
-            }
+            node_mem_size = numa_info[i].node_mem;
+            QLIST_FOREACH(reg, &binfo->mem_list, next) {
+                if (reg->base != tmp_reg->base) {
+                    continue;
+                }
 
-            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
-            mem_base += mem_len;
-            g_free(nodename);
-        }
-    } else {
-        Error *err = NULL;
+                if (node_mem_size >= (reg->size - reg_offset)) {
+                    reg_alloc_size = reg->size - reg_offset;
+                } else {
+                    reg_alloc_size = node_mem_size;
+                }
 
-        rc = fdt_path_offset(fdt, "/memory");
-        if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
-        }
+                nodename = create_memory_fdt(fdt, acells,
+                                             reg->base + reg_offset,
+                                             scells, reg_alloc_size);
+                if (!nodename) {
+                    goto fail;
+                }
+
+                qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
+                g_free(nodename);
 
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
+                node_mem_size -= reg_alloc_size;
+                reg_offset += reg_alloc_size;
+                tmp_reg = reg;
+
+                /* The region is depleted */
+                if (reg->size == reg_offset) {
+                    reg_offset = 0;
+                    tmp_reg = QLIST_NEXT(reg, next);
+                }
+
+                if (node_mem_size == 0) {
+                    break;
+                }
+            }
         }
+    } else {
+        QLIST_FOREACH(reg, &binfo->mem_list, next) {
+            nodename = create_memory_fdt(fdt, acells, reg->base,
+                                         scells, reg->size);
+            if (!nodename) {
+                goto fail;
+            }
 
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
-            goto fail;
+            g_free(nodename);
         }
     }
 
@@ -814,6 +849,35 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     return size;
 }
 
+/* Find the max size memory region after info->initrd_start.
+ * TODO: we may have a corner case where the memory node size may not correctly
+ * fit into kernel/initrd/dtb Image sizes.
+ * */
+static RAMRegion *find_initrd_memregion(const struct arm_boot_info *info,
+                                        hwaddr *initrd_start)
+{
+    RAMRegion *reg, *initrd_reg = NULL;
+    hwaddr max_size = 0;
+    hwaddr addr = *initrd_start;
+
+    QLIST_FOREACH(reg, &info->mem_list, next) {
+        if (addr < reg->base) {
+            if (max_size < reg->size) {
+                max_size = reg->size;
+                *initrd_start = reg->base;
+                initrd_reg = reg;
+            }
+        } else if (addr >= reg->base && addr < (reg->base + reg->size)) {
+            if (max_size < reg->base + reg->size - addr) {
+                max_size = reg->base + reg->size - addr;
+                initrd_reg = reg;
+            }
+        }
+    }
+
+    return initrd_reg;
+}
+
 static void arm_load_kernel_notify(Notifier *notifier, void *data)
 {
     CPUState *cs;
@@ -837,11 +901,11 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
     assert(!(info->secure_board_setup && kvm_enabled()));
 
     /* If machine is not virt, the mem_list will empty. */
-    if (QLIST_EMPTY(&vms->bootinfo.mem_list)) {
+    if (QLIST_EMPTY(&info->mem_list)) {
         RAMRegion *new = g_new(RAMRegion, 1);
         new->base = info->loader_start;
         new->size = info->ram_size;
-        QLIST_INSERT_HEAD(&vms->bootinfo.mem_list, new, next);
+        QLIST_INSERT_HEAD(&info->mem_list, new, next);
     }
 
     info->dtb_filename = qemu_opt_get(qemu_get_machine_opts(), "dtb");
@@ -973,14 +1037,16 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
         uint32_t fixupcontext[FIXUP_MAX];
 
         if (info->initrd_filename) {
+            RAMRegion *reg = find_initrd_memregion(info, &info->initrd_start);
+
             initrd_size = load_ramdisk(info->initrd_filename,
                                        info->initrd_start,
-                                       info->ram_size -
+                                       reg->base + reg->size -
                                        info->initrd_start);
             if (initrd_size < 0) {
                 initrd_size = load_image_targphys(info->initrd_filename,
                                                   info->initrd_start,
-                                                  info->ram_size -
+                                                  reg->base + reg->size -
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
@@ -1027,7 +1093,8 @@ static void arm_load_kernel_notify(Notifier *notifier, void *data)
             }
             fixupcontext[FIXUP_ARGPTR] = dtb_start;
         } else {
-            fixupcontext[FIXUP_ARGPTR] = info->loader_start + KERNEL_ARGS_ADDR;
+            hwaddr kernel_args_addr = info->loader_start + KERNEL_ARGS_ADDR;
+            fixupcontext[FIXUP_ARGPTR] = kernel_args_addr;
             if (info->ram_size >= (1ULL << 32)) {
                 fprintf(stderr, "qemu: RAM size must be less than 4GB to boot"
                         " Linux kernel using ATAGS (try passing a device tree"
-- 
1.8.3.1


