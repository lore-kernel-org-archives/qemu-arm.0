Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp93841wrx;
        Thu, 21 Mar 2019 03:51:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyns8hwO8LdOCNSVecJv0Eq3Og+0Fnx/xd5/CeE/jUS+GDMfAFNsmrDEuC6+dQeuVDpGW1Q
X-Received: by 2002:a1c:f115:: with SMTP id p21mr1289111wmh.93.1553165483607;
        Thu, 21 Mar 2019 03:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553165483; cv=none;
        d=google.com; s=arc-20160816;
        b=u+W07P52LIFdJ5wr5h8TBrBhMVjausWQceoID0kLSMsCQ8k1kLJsn17OLFnwlL9aoL
         268O5ZP6BRMlo1RG4E2pG6w3TOoq2f0gpy3m3fT1h5tdQ/sivf9ZTfiZx+LVJcBC1QS0
         RhqZMRNeDOgTkzqn5aj7blYA4zKvGBSxF6bmhy5uMOIPmjxJMGECkHQ5bbwfg4U6Aa7j
         yVtMKT6sxYtNTns4nnbY+x87mUv1J1LCHLUBnGBBbGX1Gx75F+Ou74oS2+Ni7UO57W4I
         JriSStsmyoNtlTD1ilk7BsrIRm0r/kdc6tYHrAbo/yxPQzTaV3wPef6H2HiKCsIx3vJJ
         SPkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=fA3zYJegmny2VbWNybrNR5q3ICUNxSl0RPBG8H8xrZg=;
        b=ROeQMI5GdhqYMYSu1sMTG+y23/wTSTuAF/mb6iOKkaCZvTqIEwR7jWD5YQGNAaT2Ev
         WPDRng5fuuRAMGYhXaLO6jR7IaN9Zc8sWEblQZrJuZoQrB9OeMgfUoI49lvMPhksCpPN
         OMrq+p7fw/aWxds4ml0ofJ/X3yf7552/h7S0dnMDpVFErEGzWRHXNvD78qdmQLI8kdda
         8LjhKYgbDSHdbRyOPCBPzYGWRqB79lRMqbiYeitwcroCeTbq/H8F1IX7ClA7AJEJTdMX
         3J5yEmDhQJmrUb+vH9Mh8W0abNciNYCgySRbtKajAaR4D3tT4c/pxsFTyzEoohaBSwSv
         l4Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si3147231wmc.34.2019.03.21.03.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Mar 2019 03:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:34702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6vIA-0004cp-Kf
	for alex.bennee@linaro.org; Thu, 21 Mar 2019 06:51:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vHZ-0004Og-4u
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG7-0003DB-MY
	for qemu-arm@nongnu.org; Thu, 21 Mar 2019 06:49:16 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2253 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h6vG7-000322-3F; Thu, 21 Mar 2019 06:49:15 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C864B518F006BC5AD6DD;
	Thu, 21 Mar 2019 18:49:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.408.0; Thu, 21 Mar 2019 18:49:03 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Thu, 21 Mar 2019 10:47:43 +0000
Message-ID: <20190321104745.28068-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v3 08/10] hw/arm/boot: Expose the PC-DIMM nodes
 in the DT
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HNM5PjWjdO3B

This patch adds memory nodes corresponding to PC-DIMM regions.
This is an opt-in feature and needs to be enabled("fdt=on") when
Guest is booted with DT.

NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NVDIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655..5b9a994 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -19,6 +19,7 @@
 #include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
+#include "hw/mem/memory-device.h"
 #include "elf.h"
 #include "sysemu/device_tree.h"
 #include "qemu/config-file.h"
@@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static int fdt_add_hotpluggable_memory_nodes(void *fdt,
+                                             uint32_t acells, uint32_t scells) {
+    MemoryDeviceInfoList *info, *info_list = qmp_memory_device_list();
+    MemoryDeviceInfo *mi;
+    int ret = 0;
+
+    for (info = info_list; info != NULL; info = info->next) {
+        mi = info->value;
+        switch (mi->type) {
+        case MEMORY_DEVICE_INFO_KIND_DIMM:
+        {
+            PCDIMMDeviceInfo *di = mi->u.dimm.data;
+
+            ret = fdt_add_memory_node(fdt, acells, di->addr,
+                                      scells, di->size, di->node);
+            if (ret) {
+                fprintf(stderr,
+                        "couldn't add PCDIMM /memory@%"PRIx64" node\n",
+                        di->addr);
+                goto out;
+            }
+            break;
+        }
+        default:
+            fprintf(stderr, "%s memory nodes are not yet supported\n",
+                    MemoryDeviceInfoKind_str(mi->type));
+            ret = -ENOENT;
+            goto out;
+        }
+    }
+out:
+    qapi_free_MemoryDeviceInfoList(info_list);
+    return ret;
+}
+
 int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                  hwaddr addr_limit, AddressSpace *as)
 {
@@ -621,6 +657,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    if (object_property_get_bool(OBJECT(qdev_get_machine()), "fdt", NULL)) {
+        rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
+        if (rc < 0) {
+            fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+            goto fail;
+        }
+    }
+
     rc = fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.7.4


