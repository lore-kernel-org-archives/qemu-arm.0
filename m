Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4563776wrx;
        Tue, 9 Apr 2019 03:39:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzN7n2rL3/V+yw2Wc5Ek+Wc8g54oK1YJoz4gBAID5IBeX/hn5jdB8kXatH9YTJpZL+GLFo1
X-Received: by 2002:a5d:6150:: with SMTP id y16mr704350wrt.13.1554806358218;
        Tue, 09 Apr 2019 03:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806358; cv=none;
        d=google.com; s=arc-20160816;
        b=yzM6IPHON8hv2VEfxIDlqg5iKhd6cFDacuuNr5tLMqd2dyKavK2BtJvn4Dtoxe59La
         dr8wQJQlHxn+CnsikROt4RjY7zWq5MCpidJMeyUMXXAYdQMqLXAGM8B9klXF+KYHKdvx
         Duy/30TgPsPcz0oebGUfvj8BRrEjCbuFeuaQT27GjWB7EyOkNZ0vRBrNVyUvvFhqCz3b
         o82PeALD/jHYXXa9l8+ybAQZiFBpa/IgwzLdbVBO0gEwg6cGqrKdc7GG2jD+XUkDeGzN
         okxkPDssDBDSq9ZTk4X4llf7VtdNP7D5hqZ4TKOF1Ge+P1a9dP3N+PyxsEo4KYiZsNEk
         chcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=XFzh40YvCUEntk6IZHpRTRO4yQ+m8x95a9DUVhCqthI=;
        b=yRMTwXEsC0F9gclz1Iq82WKagI/LUl3z1Fuab4iAbAVYVBWm0EGn44ZazYF9Ou9IRe
         Jqu3g/QYUcDpKAGELTQhBopaJMdcTx6XRp5XYa4IhVBk+kXhivN4qwZ1yYl+AS7fUmaL
         Mm6uRY0dXC7DV7BnUoFdSiq7m9CUbq20M/pK2ljiz0iCq1vhqe6g3eNlp4Sw1/wP8HEj
         muEJykjx/vxOnpXyDjB/jVVn3xF1Yw88D+gzCTlfdTmfFHBlg0kTf+1o1NMUSh99t6+I
         3vBXzQ+AYqpUJQV5MQcJxuU43wHTaINTX8SqrBRVy6O1FYLxFmRE08UAT369JhYs9bAS
         Fsow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si17080934wrr.6.2019.04.09.03.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo9t-0004CU-BM
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:39:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo2E-0006MP-HC
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo2D-0007Qg-FF
	for qemu-arm@nongnu.org; Tue, 09 Apr 2019 06:31:22 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60594 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo2C-0007Ob-Vd; Tue, 09 Apr 2019 06:31:21 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C68807842779D2009383;
	Tue,  9 Apr 2019 18:31:17 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:31:08 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:35 +0100
Message-ID: <20190409102935.28292-9-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v4 8/8] hw/arm/boot: Expose the PC-DIMM nodes in
 the DT
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xYTbuKge55oa

This patch adds memory nodes corresponding to PC-DIMM regions.
This will enable support for cold plugged device memory for Guests
with DT boot.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 8c840ba..150e1ed 100644
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
@@ -538,6 +539,41 @@ static void fdt_add_psci_node(void *fdt)
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
+            ret = fdt_add_memory_node(fdt, acells, di->addr, scells,
+                                      di->size, di->node, true);
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
@@ -637,6 +673,12 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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


