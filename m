Received: by 10.223.150.237 with SMTP id u100csp3059986wrb;
        Mon, 13 Nov 2017 17:22:17 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZvHmmgRwHjw72xjg9vyXBCr50Pxnz6A8h8+XOM71anriUt1V8MQE6Pe32dmRfcrBVY6kjm
X-Received: by 10.37.224.149 with SMTP id x143mr6500764ybg.440.1510622537162;
        Mon, 13 Nov 2017 17:22:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510622537; cv=none;
        d=google.com; s=arc-20160816;
        b=Yb09ev9iR9kRN+qclpqaeX/w9HO0pi+gWQxcZlj/rnbtHPqJWDDT7zyw5sbmLElacY
         QRu636gC1eHlsR3J1BZahKanUKiRkUgy9DbkhJUrpfl+W+ECwJKK1LWxjnchvrYqzFoP
         5NUV6qlECSGSNpXCE9ldYYZfg3Tl2uKsi4TUPob9CaHP2VJXrYT2cVGNXIfklk5wxlnf
         Bhs3YnYjVyx8Xq0rvxSZ+vOMyUR2I/SueEWLpJqY0WR88CLqgrrssRVXt4AIO9v4AVXl
         1QqXeHPjSUy2923Hy+Xy3j7hBbul8Nw72Ye+5nuJG7scjnYEUuZ7/uSUObP/PDcxbs/R
         8G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=uv4cFh0jNl2vBy6TpsaaPs9/RYw1Dmh8nNENhWu2Vrw=;
        b=p3rd7vX+Rm27W3C3eGS+VuQeGbp2lK7J85tos4ozUc8dgcj8ZB+RzxS9liOAexZiNx
         x5GHvmd0vy8vbAMSaxURP/s9nvdP9xb8EI4C2SNaZ0XZPFGSIAnSawarL7OlyIXKxK8c
         mbqjpEE5qx+3iLN0Zz7k9QFJNKpmvfUtIgHRs6t8uoOimv03+lrK4B1Wi0FQCXPg5Wmo
         1wsR94Coe8ByYyCjFoRlBYReOp+4nHyDq0k8Bo/0zQE2DKPIxkwik8TArL3a+Gj+pmY6
         1cEtEQd9JOcyQm5cvrsTnXzTfGyGOecAZDsTttUMVASxK+0dM7V9ID9xbz7R66sYeEyo
         SIyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y71si362149yby.642.2017.11.13.17.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 17:22:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEPvc-0007SH-J3
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 20:22:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPqC-0002ly-OM
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>) id 1eEPq9-0003pa-Ga
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 20:16:40 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2290)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhuyijun@huawei.com>)
	id 1eEPq8-0003nz-TK; Mon, 13 Nov 2017 20:16:37 -0500
Received: from 172.30.72.60 (EHLO DGGEMS412-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DKW85549; Tue, 14 Nov 2017 09:16:31 +0800 (CST)
Received: from localhost (10.177.27.25) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.361.1; Tue, 14 Nov 2017
	09:15:59 +0800
From: <zhuyijun@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <eric.auger@redhat.com>
Date: Tue, 14 Nov 2017 09:15:54 +0800
Message-ID: <1510622154-17224-6-git-send-email-zhuyijun@huawei.com>
X-Mailer: git-send-email 1.8.4.msysgit.0
In-Reply-To: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.27.25]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5A0A43EF.00F2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fb5d816960baf9cd40ade15de84c2a3e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [RFC 5/5] hw/arm/virt-acpi-build: Build srat table
 according to mem_list
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
X-TUID: c+xFbprWGuXx

From: Zhu Yijun <zhuyijun@huawei.com>

In case of accessing memory holes, we build srat table by
traversing mem_list.

Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
---
 hw/arm/virt-acpi-build.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..e8dd7c9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -487,7 +487,12 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiSratProcessorGiccAffinity *core;
     AcpiSratMemoryAffinity *numamem;
     int i, srat_start;
-    uint64_t mem_base;
+    hwaddr region_offset = 0;       /* region base addr offset */
+    hwaddr region_eat_size = 0;     /* region consumed size */
+    hwaddr node_mem_size = 0;
+    RAMRegion *begin_search_region = QLIST_FIRST(&vms->bootinfo.mem_list);
+    RAMRegion *reg;
+
     MachineClass *mc = MACHINE_GET_CLASS(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
@@ -504,12 +509,37 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         core->flags = cpu_to_le32(1);
     }
 
-    mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < nb_numa_nodes; ++i) {
         numamem = acpi_data_push(table_data, sizeof(*numamem));
-        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
-                          MEM_AFFINITY_ENABLED);
-        mem_base += numa_info[i].node_mem;
+        node_mem_size = numa_info[i].node_mem;
+        QLIST_FOREACH(reg, &vms->bootinfo.mem_list, next) {
+            if (reg->base != begin_search_region->base) {
+                continue;
+            }
+
+            if (node_mem_size >= (reg->size - region_offset)) {
+                region_eat_size = reg->size - region_offset;
+            } else {
+                region_eat_size = node_mem_size;
+            }
+
+            build_srat_memory(numamem, reg->base + region_offset,
+                              region_eat_size, i, MEM_AFFINITY_ENABLED);
+
+            node_mem_size -= region_eat_size;
+            region_offset += region_eat_size;
+            begin_search_region = reg;
+
+            /* The region is depleted */
+            if (reg->size == region_offset) {
+                region_offset = 0;
+                begin_search_region = QLIST_NEXT(reg, next);
+            }
+
+            if (node_mem_size == 0) {
+                break;
+            }
+        }
     }
 
     build_header(linker, table_data, (void *)srat, "SRAT",
-- 
1.8.3.1


