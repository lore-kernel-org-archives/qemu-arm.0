Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp111892wrq;
        Mon, 2 Jul 2018 10:24:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfz2wDOmP0ePft7gMkw/kaCxP9OetSz63aiRvj5iH92zoslFZyY1d2HE+kh6G0pM74w7Ylz
X-Received: by 2002:aed:3848:: with SMTP id j66-v6mr14219057qte.218.1530552267947;
        Mon, 02 Jul 2018 10:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552267; cv=none;
        d=google.com; s=arc-20160816;
        b=WVqrEKi0YmstI4SDqvY7TJUxrTheFGP4oIT48vscPgo8k+X0Ex9apDG+OE6hWJrvai
         ba9YmG4p0olvAAjZMaah9ySkix2SBn5x5y3v23fUOAz1IidoxgtUkaqJ++Pq4EB/psRZ
         rqjiWVH043nlgX2a8+kqv1VCkAsySrDV72Qsp8JqOy752+8LpU55C9Def8egK8naT/5L
         HuxCrWnvo5NyeHa+nOpgdVDdLYTIxeF2h0q4aRNes/Shtfk27vVFVufkRw0LXkBUHnvU
         gmllSZD+pS4VDnK70FYxH87bxxa+0WdmMBCNls3xgwUlskPcLGYov3qWaqM81avhFMjL
         ibKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BAwS+PDd5G88lI+YIUAhFtzH/Ntd8p7T/RTnrUjc2TU=;
        b=s3hFngjO77bnGuATOzWcIoEvOgtc7ffCcjLFZ9Y8WkEZU4Gxy2bcR7TNX+cYGOTvHS
         4Zv2N0NeJIHXw6Us3pVR4TR16A4BAY3Y6QUXHBZkqYBTy5JnhjXDhrVKwrAh8Wj0GFLW
         kPKgGOL9U6wRkQkVyzZQmr249YYEB5zrzLguJQ2O6kNgWtiJFjGpt6JsMeCfm6WrNJOX
         rzq0xLtY+WG3vnB/99i7lZ9uHOlLhmEpa3Wree4/V0VEbTf3eLyzWP312a1o9WcWKLUr
         Ssrzk9v2aUl+WmpPzfLIg18qF3mISldaqmstyEzKPSrWtVxO1MQWwSVnmSUiZcV9SRg6
         sIJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q53-v6si11860574qte.315.2018.07.02.10.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2Yt-0000sV-BU
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:24:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y7-0000NA-IB
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Y4-0006nC-NK
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48076 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Y4-0006mt-H2; Mon, 02 Jul 2018 13:23:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1903777885;
	Mon,  2 Jul 2018 17:23:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09332111AF38;
	Mon,  2 Jul 2018 17:23:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:37 +0200
Message-Id: <1530552162-15533-11-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:23:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 02 Jul 2018 17:23:36 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 10/15] acpi: move build_srat_hotpluggable_memory
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
X-TUID: 1ujMtfm+xTTd

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

