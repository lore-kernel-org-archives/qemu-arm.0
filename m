Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp627157wrm;
        Fri, 4 Oct 2019 09:05:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFSCF5/IEsvD+lY+lZzS7PG4p3K16lf2U2CLo6L2NuMVGsdL0IC4Bwx0GA4o5M2G/IJo1W
X-Received: by 2002:ad4:55b2:: with SMTP id f18mr14570374qvx.16.1570205112953;
        Fri, 04 Oct 2019 09:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570205112; cv=none;
        d=google.com; s=arc-20160816;
        b=hYXMV+xSyM3onuIPOfl4FDIMsS5fA8aQKIeX3u6QEfYZC/j+a7apF2Q6Qel8nTZ71q
         G4CvbatWlpgIYsfxuXLCj8bQpr6XgQG3+KXGAVOjL++FSdV9dH2x7MWNaG+4pSOdvI5t
         By3QO5URWvTkS38w2iMwxu0I7ZhSvslslv8FLLiC06vvKZwP/n7msyssXhoe49aav0yX
         MttfRDkjpDCVYoKyZt5xO3dfZyIjuZte8fKGtkEISXLuV16WLz28UbEhcZcgW5k3nE12
         lS3PWZtF72GKwBB6eL4vPKXB9RnbUXwrSjiP/gaBssYAbwgdjioeKaWeg4dZLNunh8/V
         x5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=sUePgMF8GDXIjJxVgSYhyboitYbq0wiByaj6rIQbZtE=;
        b=UrrI+Mk4aLIeULfzuo9u2QYjiyqxrSaXRtA9Gz2CNdK9EnIoviQ0fynbESY5sH7+4r
         oqrbxHF3aNILp+oqZ7Dc+x1+zlIRm1Kwb5TSGfxm/62IITjByPmoedqspX0dXi/NybbL
         Lv2BLXlzXGZwbBAaikT6be24M9bW6fSd6YK0YpoQp5TmC1BBh5F6inwqzaB6ddmVw400
         8ZpAppqaydrw5thkzdxwtE+Up3bK6ZZ/fXrvBCZD1eKCL73UsSZuD4rJ9a3kp7tyM00h
         u/JFlubgT1Y3VaSkirZcRqhroNiwcpv0pLZUsX3g3rceXuKXdEhiqpHqOULm4a/qvOd4
         UWFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si6066743qve.6.2019.10.04.09.05.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 09:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGQ4t-0004iY-Lx
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 12:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuR-0006K9-HY
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuQ-0000Wl-5e
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2245 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuP-0000Uo-Pn; Fri, 04 Oct 2019 11:54:22 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C8CD5155CB26E3B1BFA7;
 Fri,  4 Oct 2019 23:54:17 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 4 Oct 2019 23:54:11 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH 4/5] hw/arm/boot: Expose the pmem nodes in the DT
Date: Fri, 4 Oct 2019 16:53:01 +0100
Message-ID: <20191004155302.4632-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, lersek@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pgIUtQWV2DzP

From: Eric Auger <eric.auger@redhat.com>

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c264864c11..bd6d72b33e 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "sysemu/reset.h"
 #include "hw/loader.h"
+#include "hw/mem/memory-device.h"
 #include "elf.h"
 #include "sysemu/device_tree.h"
 #include "qemu/config-file.h"
@@ -523,6 +524,44 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static int fdt_add_pmem_node(void *fdt, uint32_t acells, uint32_t scells)
+{
+    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
+    MemoryDeviceInfo *mi;
+    int ret;
+
+    for (info = info_list; info != NULL; info = info->next) {
+        mi = info->value;
+
+        if (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM) {
+            PCDIMMDeviceInfo *di = mi->u.nvdimm.data;
+            char *nodename;
+
+            nodename = g_strdup_printf("/pmem@%" PRIx64, di->addr);
+            qemu_fdt_add_subnode(fdt, nodename);
+            qemu_fdt_setprop_string(fdt, nodename, "compatible", "pmem-region");
+            ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells,
+                                               di->addr, scells, di->size);
+            /* only set the NUMA ID if it is specified */
+            if (!ret && di->node >= 0) {
+                ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id",
+                                            di->node);
+            }
+
+            g_free(nodename);
+
+            if (ret < 0) {
+                fprintf(stderr, "couldn't add NVDIMM /memory@%"PRIx64" node\n",
+                        di->addr);
+                goto out;
+            }
+        }
+    }
+out:
+    qapi_free_MemoryDeviceInfoList(info_list);
+    return ret;
+}
+
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as, MachineState *ms)
 {
@@ -622,6 +661,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    rc = fdt_add_pmem_node(fdt, acells, scells);
+    if (rc < 0) {
+        fprintf(stderr, "couldn't add pmem memory nodes\n");
+        goto fail;
+    }
+
     rc = fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.17.1


