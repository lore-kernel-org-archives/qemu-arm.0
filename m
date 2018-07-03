Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp698166wrq;
        Tue, 3 Jul 2018 00:29:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfAUdD590u+hn4c7XvgnRTG6mOfduvJ/925YJCF1vJ23NGo+tcBUppN8QGCawEW/1IXcGhw
X-Received: by 2002:a37:5f01:: with SMTP id t1-v6mr24395206qkb.231.1530602989236;
        Tue, 03 Jul 2018 00:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602989; cv=none;
        d=google.com; s=arc-20160816;
        b=heC2o6e/ZSj+aB2F9zzAhxM9TLHwaiZRhDl7tyH9gcza7J1R6SmvyP6sTmLb0MZfMt
         E9LsKe4vE63W55Yv1R5SMO+kApR5UQG9wk+e+X/EOZHz4tt3MejmV+rKZTb4Fi1aAL7C
         0jNIaykfs1q+nWdoc5ipfLTjr5FbUNjSQsLUUZWYm1UIeErxHWSE0cIVOA6c/gQtEVHH
         UeLu7/lqDqaAnxH6nBKg1LhbyuhBg6JyMGRJUB4asoE7u0AXsh30ML+723KN0gxkvdSV
         2FbvGNyAX3Ct1T2UK9lgVCOlf4p3iovsRbemmfKOqakbNyqTuwT7CbbAAMBgDahNdCIX
         GHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BAwS+PDd5G88lI+YIUAhFtzH/Ntd8p7T/RTnrUjc2TU=;
        b=FzWwemP6JqcZuy4RuTSj2nq1o6QfR+UYw34GPIRDQLS+T+rPjCSj+itGRQKtACu28F
         I+Ahi7qxuRkc9GU6xdDcP9l46dutqprQHpXhwoHzniRea5S5qF0nx8c3pB1YOJuHvzpb
         9py8XW4CSzOduN7XeiNsjoRsY7mUYkAhLS54SCq2zd7HFF66dlNwxLGv7rvusY02SPvn
         HTkhpSZI+skq1xNZH6/j2WKXMMB2H3WutoHgl1rp9lbKHQ1L69HHQI52pJNocAVWG2CE
         8D+x4NBUkgqdKxp144+/lVoq1ow3zrEeTlMd8XFZOxOp+rG0F7neUGDOBhDbMzsiQfA6
         3Vgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34-v6si513293qvp.83.2018.07.03.00.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFky-0005lT-PN
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:29:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFfy-0003o0-Ch
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:28:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcG-0005RH-56
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:24:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47882 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcF-0005Qc-QV; Tue, 03 Jul 2018 03:20:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31564B5CA;
	Tue,  3 Jul 2018 07:20:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F53D1C5B5;
	Tue,  3 Jul 2018 07:20:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:53 +0200
Message-Id: <1530602398-16127-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 07:20:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 03 Jul 2018 07:20:47 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 10/15] acpi: move build_srat_hotpluggable_memory
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovG21yaPPADM

We plan to reuse build_srat_hotpluggable_memory() for ARM so
let's move the function to aml-build.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/aml-build.c         | 51 +++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 49 -------------------------------------------
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 54 insertions(+), 49 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd7..167fb6b 100644
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
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9bc6d97..fcebd02 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2251,55 +2251,6 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 #define HOLE_640K_START  (640 * 1024)
 #define HOLE_640K_END   (1024 * 1024)
 
-static void build_srat_hotpluggable_memory(GArray *table_data, uint64_t base,
-                                           uint64_t len, int default_node)
-{
-    MemoryDeviceInfoList *info_list = qmp_memory_device_list();
-    MemoryDeviceInfoList *info;
-    MemoryDeviceInfo *mi;
-    PCDIMMDeviceInfo *di;
-    uint64_t end = base + len, cur, size;
-    bool is_nvdimm;
-    AcpiSratMemoryAffinity *numamem;
-    MemoryAffinityFlags flags;
-
-    for (cur = base, info = info_list;
-         cur < end;
-         cur += size, info = info->next) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-
-        if (!info) {
-            build_srat_memory(numamem, cur, end - cur, default_node,
-                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
-            break;
-        }
-
-        mi = info->value;
-        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
-        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
-
-        if (cur < di->addr) {
-            build_srat_memory(numamem, cur, di->addr - cur, default_node,
-                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
-            numamem = acpi_data_push(table_data, sizeof *numamem);
-        }
-
-        size = di->size;
-
-        flags = MEM_AFFINITY_ENABLED;
-        if (di->hotpluggable) {
-            flags |= MEM_AFFINITY_HOTPLUGGABLE;
-        }
-        if (is_nvdimm) {
-            flags |= MEM_AFFINITY_NON_VOLATILE;
-        }
-
-        build_srat_memory(numamem, di->addr, size, di->node, flags);
-    }
-
-    qapi_free_MemoryDeviceInfoList(info_list);
-}
-
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903..4c2ca13 100644
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
2.5.5

