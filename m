Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8276490wrx;
        Fri, 8 Mar 2019 03:54:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwy93nJRTzAo0r7ua8RFD0MoLoU1sMJE+flGFFvQ/i108PRolH3heD7BjZ6d4yAzcfTb1iz
X-Received: by 2002:a81:2fc1:: with SMTP id v184mr14138945ywv.129.1552046082402;
        Fri, 08 Mar 2019 03:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552046082; cv=none;
        d=google.com; s=arc-20160816;
        b=saz3JiWCmOwsFt86C6t5ggQgYSE9XCFdntL/riYSU2qaULUtL4GtcS2a5v31wlToYq
         ImsfGgNkcfCle7r/AiBKBlzSirYIeGB4xQoxZEvOtLGk0eSOmSU0fKAE1DqkRLEIWMZl
         uhOxZ8/ULeE1wF2JUv3rUnUh8vrVqOLzxXQn5IEUl7GHfKVP/hY8vUyh0/3oUXGlFpbm
         +FQI1DN0llkO8XNlAH6m6rRQLeMJYTttREX0BiqB4l4yvVtkyqqs9tSgkgYaWAy4vrrF
         JazaPoHcEh9Cc1aMUujj8X56rCfKv6Y3LjpfO97KdbNhDDQasbCfX0YGEzZDpYEgUFo9
         4cHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=0g5Jc0+LPt2qXzCI4n3PV6Fo26B0T6c2hXYYSPtswjE=;
        b=EGvwKc41DAPnVh5cydIZhhvNv79ixdkiTkr2uQQRu1v+57J7drTJ7LRpiq0bg+mkXY
         PR4nGPE2Oh8YZ5vrVj9cGxI4J7LMrSgCDK+ZIuc4Tqabt4DLCmLS6Q0wcPclvTqjK2yb
         tyJ40eqwhhGNLz76sIfR48rybWBnGNsYRTej1i5eLzFLJSonbKo7kNeijXnyvfA3iGxZ
         5bSLmX9xJBpMOJSq25nJqnVIFcEAWsIP6BmixO5VYMiDdLQwFWjrDagRwqTZsrDp5Ymg
         //F9P9wrDg3lX9p6UkXczgSalUJFLnTYDf7RABhFTmeGPBbXDS9VPvySSFrqs4lxGeUc
         uCVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si4404477ywi.451.2019.03.08.03.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 03:54:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:41680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2E5E-0007gp-6G
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 06:54:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvk-0008Ld-QF
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvh-0006TZ-Mq
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 06:44:47 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59546 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h2Dvg-0005td-SZ; Fri, 08 Mar 2019 06:44:45 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 4E59FE940061C88A2065;
	Fri,  8 Mar 2019 19:44:38 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.408.0; Fri, 8 Mar 2019 19:44:30 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>, <peter.maydell@linaro.org>,
	<shannon.zhaosl@gmail.com>, <sameo@linux.intel.com>,
	<sebastien.boeuf@intel.com>
Date: Fri, 8 Mar 2019 11:42:15 +0000
Message-ID: <20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes
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
X-TUID: g86LFBYzzx6p

This patch adds memory nodes corresponding to PC-DIMM regions.

NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
don't need to care about NVDIMM at this stage.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655..4caaf91 100644
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
@@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     }
 
+    rc = fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
+    if (rc < 0) {
+        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
+        goto fail;
+    }
+
     rc = fdt_path_offset(fdt, "/chosen");
     if (rc < 0) {
         qemu_fdt_add_subnode(fdt, "/chosen");
-- 
2.7.4


