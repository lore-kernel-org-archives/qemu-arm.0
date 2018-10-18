Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2385203wrt;
        Thu, 18 Oct 2018 07:38:42 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61bbEkp7Ykv/aKk2Ssu0AHZ+ks0JZrnhr4m6ZJrvhr2x5dMpgIz7XIo8xICmIR5mQZSiZfv
X-Received: by 2002:a0c:890a:: with SMTP id 10mr29845803qvp.153.1539873522346;
        Thu, 18 Oct 2018 07:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873522; cv=none;
        d=google.com; s=arc-20160816;
        b=lqvxLiLN3sEZnkwwdOJN7dReEd2FHwnPF7jDZVHkOOv65Kb8Y+hhwNSw+NeTq04gA5
         ud/Ly2Q+kFZ81RU8KHvBQgg6xoVa6h9ujpT8Qp7UO4CbVQ4OHFyT+ikxLshsREt1jojq
         uGdCe0ciKdWFpUgo1dqlDOIC1P3f8j79wvVXe+Bw4/gWQGKvH4eMlPmN4JgkZK2zqohg
         /gp6m8nodeplpfwcXPaOaLscv1OoDTN+axpJHDrKDqfTR2qFsoG4YAAojh/CjhUJ8GaX
         ExvHFriGGAR8MWQzr7UjFPD8TxzxXyuV5sfTMrNcnU5Mc470n8XLyf1EXAy4AO6ObfCG
         /u9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ieNDoV9C28oHgOBlMHzEAJyEtADbQoOUONUjSbYPcEI=;
        b=JH0S93lRGb6Ef3N8jOoCOyNaoZ17G78hXoz1v6scwdDG2+8wDqprODRvXNBzmgIKx1
         mQ34XvpoGPQse3/jDMgAtBsRBP7ERdikzZnMvDvKHDItbNWcu4CL+Pu8lbv0tUtdsFSS
         IXd4huUvo6CprNktWji6TKDStkDnBAt0gnj3KgLu1s0+JdmZMkXGrsylbIkYTzHS8lwM
         /pcQ7xSG7F+AAzDyMr96MTNzIPI56VjcZWGj+H0w0HYz/apR5/WvSDR9oRFcWEZd0ZZp
         NZbdg+ohHQhFyMRGZEyFtmWSdtbcHwyhBE4akeXHKS3xA/PNMmU0YvSt6/2ACe8+/vGZ
         hspA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u61-v6si1407180qtd.122.2018.10.18.07.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9Rh-0003kj-SE
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:38:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LF-00068j-DF
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9LE-0007Xs-JI
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:32:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52777)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9LE-0007Wj-A1; Thu, 18 Oct 2018 10:32:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 611805F7AA;
	Thu, 18 Oct 2018 14:31:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D291789A6;
	Thu, 18 Oct 2018 14:31:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:37 +0200
Message-Id: <20181018143042.29588-12-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Oct 2018 14:31:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 11/16] acpi: move build_srat_hotpluggable_memory
 to generic ACPI source
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hkECPEYUAbm

We plan to reuse build_srat_hotpluggable_memory() for ARM so
let's move the function to aml-build.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/aml-build.c         | 51 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  3 +++
 2 files changed, 54 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd736d..167fb6bf3e 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include <glib/gprintf.h>
 #include "hw/acpi/aml-build.h"
+#include "hw/mem/memory-device.h"
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
@@ -1802,3 +1803,53 @@ build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
+
+void build_srat_hotpluggable_memory(GArray *table_data, uint64_t base,
+                                    uint64_t len, int default_node)
+{
+    MemoryDeviceInfoList *info_list = qmp_memory_device_list();
+    MemoryDeviceInfoList *info;
+    MemoryDeviceInfo *mi;
+    PCDIMMDeviceInfo *di;
+    uint64_t end = base + len, cur, size;
+    bool is_nvdimm;
+    AcpiSratMemoryAffinity *numamem;
+    MemoryAffinityFlags flags;
+
+    for (cur = base, info = info_list;
+         cur < end;
+         cur += size, info = info->next) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+
+        if (!info) {
+            build_srat_memory(numamem, cur, end - cur, default_node,
+                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+            break;
+        }
+
+        mi = info->value;
+        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
+        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
+
+        if (cur < di->addr) {
+            build_srat_memory(numamem, cur, di->addr - cur, default_node,
+                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+            numamem = acpi_data_push(table_data, sizeof *numamem);
+        }
+
+        size = di->size;
+
+        flags = MEM_AFFINITY_ENABLED;
+        if (di->hotpluggable) {
+            flags |= MEM_AFFINITY_HOTPLUGGABLE;
+        }
+        if (is_nvdimm) {
+            flags |= MEM_AFFINITY_NON_VOLATILE;
+        }
+
+        build_srat_memory(numamem, di->addr, size, di->node, flags);
+    }
+
+    qapi_free_MemoryDeviceInfoList(info_list);
+}
+
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903c0a..4c2ca134ee 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -416,4 +416,7 @@ void build_slit(GArray *table_data, BIOSLinker *linker);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
+
+void build_srat_hotpluggable_memory(GArray *table_data, uint64_t base,
+                                    uint64_t len, int default_node);
 #endif
-- 
2.17.1

