Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp653611wrq;
        Fri, 22 Jun 2018 03:19:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpda2TPgPRsY43E5IeiUaFCxtPWGSJ7qF+D8AbPQ2z/99Fx627wXLfqSuWTNQ+N279wmSQUF
X-Received: by 2002:a0c:e444:: with SMTP id d4-v6mr770967qvm.119.1529662793555;
        Fri, 22 Jun 2018 03:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529662793; cv=none;
        d=google.com; s=arc-20160816;
        b=m+yGg8gI5nkPtiWByyhSw9KRG8gN8R7BX2n65jNt5JS1d+Nf5JojjuMWbdT4pGJVW2
         c2wFF01JowgsXN+wVBIk6l53674SAUdWb3HaqXh+ZwUd8ouX+7YhQeXmabqH8s/2mHsg
         Q0Uc++EHs2HJpccmOmOfCwwrvlsceTY+WmGfxbs09rf3garKZAUzaZjNhRlioGs26E1I
         fcEiwKrBecS2Zs0niik7aesHKZ3nU3E9u9aYWqkF0qLpLS2p/QaDzDW/Ek5w8QETwXBT
         soIma1Dj39Ej1i6XlpLE/EPh+LM2nZd+0Laeh/SdNATzHWg9zVg/uZ3MyAYgv7U7QNf6
         y6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=+AZKtL6yT1pOR1b02x+ymA4c4RnumPFmyHFs25QXu2k=;
        b=NjiXy5+HeqfLkBmNzFVGltvIUJ0P0PIZxHc1t8jrKTW9B3QuY9AumFkteT85eamM5A
         L7CUmjp0iPGAAbx/++SwrU36h7QU3EevXeAV8zhuK/BqZzOkZ+hJiRxUWXXdNKeoSiMP
         L6fBv7gn6mUQ8ihQMoEnCvQvErIP90mhlg8f4RdhB5sW81AGu9uhWY0HBVgsH6CKpp1L
         fsxKrDEXdC7YWHkDv3Fta0/t18H1hW81dh9rdmTPE+l1gFzB8PcPceM4EesF3b+gUZKv
         Eru8nrgA93tCp64DVs0SBeqgL2ijgLePcBQ2dgLHGIeYNOqldrFyI4VmWCEcDvpUBiQ4
         y/wA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8-v6si1204822qvs.51.2018.06.22.03.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJAX-0000bh-2X
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:19:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA5-0000Jq-Gw
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA4-0005cQ-DY
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48640 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWJA4-0005c9-86; Fri, 22 Jun 2018 06:19:24 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C64804023132;
	Fri, 22 Jun 2018 10:19:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EA4B11166E1;
	Fri, 22 Jun 2018 10:19:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com
Date: Fri, 22 Jun 2018 12:19:09 +0200
Message-Id: <1529662749-32069-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
References: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 22 Jun 2018 10:19:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 22 Jun 2018 10:19:23 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 5/5] hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3RM4RhXnDAur

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Generate Memory Affinity Structures for PC-DIMM ranges.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 74f5744..38a6886 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/mem/memory-device.h"
 #include "sysemu/numa.h"
 #include "kvm_arm.h"
 
@@ -532,6 +533,35 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SPCR", table_data->len - spcr_start, 2, NULL, NULL);
 }
 
+static void build_srat_hotpluggable_memory(GArray *table_data, uint64_t base,
+                                          uint64_t len, int default_node)
+{
+    MemoryDeviceInfoList *info_list = qmp_memory_device_list();
+    AcpiSratMemoryAffinity *numamem;
+    MemoryDeviceInfoList *info;
+    MemoryDeviceInfo *mi;
+    PCDIMMDeviceInfo *di;
+    uint64_t end = base + len, cur, size;
+
+    for (cur = base, info = info_list; cur < end;
+         cur += size, info = info->next) {
+        bool is_nvdimm;
+
+        if (!info) {
+            break;
+        }
+        numamem = acpi_data_push(table_data, sizeof(*numamem));
+
+        mi = info->value;
+        is_nvdimm = (mi->type == MEMORY_DEVICE_INFO_KIND_NVDIMM);
+        di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
+
+        build_srat_memory(numamem, di->addr, di->size,
+                          0, MEM_AFFINITY_ENABLED);
+        size = di->size;
+    }
+}
+
 static void
 build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -564,6 +594,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         mem_base += numa_info[i].node_mem;
     }
 
+    build_srat_hotpluggable_memory(table_data,
+                                   vms->bootinfo.device_memory_start,
+                                   vms->bootinfo.device_memory_size , 0);
+
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
-- 
2.5.5

