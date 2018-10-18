Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2389906wrt;
        Thu, 18 Oct 2018 07:42:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61Hl6s7ZFmYIOJXbu4QvnuCr8OubJOlPqaZ9InVmXXolYt5SkUT752XkNd7R6W4HAU253hL
X-Received: by 2002:aed:2c86:: with SMTP id g6-v6mr29846522qtd.15.1539873745905;
        Thu, 18 Oct 2018 07:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873745; cv=none;
        d=google.com; s=arc-20160816;
        b=GwV2LraWxBmBMdyHZJeayuz3PINLygs0md0XnX5jRDoRH+QFckYqyEfB88olyucZM2
         MjlNuqhjQLTMPeteo0XKqygnxGOtdM2n0hO07OpdmX4W+74T2VppBN/M54JRNBTizAL/
         yjhGeljDyjTc1Dw720mBVa1RjL2tT/ZKKC3vLPrOUGDyJJymhUUWUT7QMTyRwiKdwWhZ
         GtYYeMTjOfpj15mFbidO0YCPI2R/S5Rpt8y1uAQ6M7U0oC6En/sTZAgbjKSOKuqGVlWh
         EdvMnGo72H2PkevsnEjg1dKEXB8ZtHLc6JpGph24xSLZND5F91F2WbQNr5nctPk/2N9z
         ENFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=/dgao+EkTOcYEAfMkp2B/TaQysvTxuqTBzgi5++mgZs=;
        b=QfuT9FiUkjF1seHe9KANgzE6EIDTZX4hwEkwACXsK6iA1tr6ZWLJbUOGrJQUGcmIu8
         JxKVOkgA/p0mf5CD+EQV63LLLgZTqjErrRs0UZb6N7kmz8jeAbZfHzTS9tbXKjOIyjsh
         lgEeb1NoCaY5d/0PuYlKiFtNtOD5rXz1E8bK2AwHtIm8MZgzKkWOHHQHUVvNNouYpegB
         /wTm+3wgzIRIGAab7QS7g/X+oaHlmoyu2ov7LX/E7lJ6ryMld0Ihr4gdBcb0EZJticKq
         cIgxfCel9jWvU42p884Nzdo1ZzAn5dI+eV3z/VQri7DnxiHyC5Svhsc+t7EfLEwAzvSt
         4LWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7-v6si2175211qke.271.2018.10.18.07.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9VJ-0006Lr-2N
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:42:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Li-0006Wg-Ei
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 10:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Lh-0008Fu-CS
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 10:32:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9La-00085z-4q; Thu, 18 Oct 2018 10:32:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 035B313A9D;
	Thu, 18 Oct 2018 14:32:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B242060150;
	Thu, 18 Oct 2018 14:32:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:41 +0200
Message-Id: <20181018143042.29588-16-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Oct 2018 14:32:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 15/16] hw/arm/boot: Expose the pmem nodes in
 the DT
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8vtDLxoDSn4

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 81d621ce14..50acf0abd4 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -444,6 +444,36 @@ out:
     return ret;
 }
 
+static int fdt_add_pmem_node(void *fdt, uint32_t acells, hwaddr mem_base,
+                             uint32_t scells, hwaddr mem_len,
+                             int numa_node_id)
+{
+    char *nodename = NULL;
+    int ret;
+
+    nodename = g_strdup_printf("/pmem@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "pmem-region");
+    ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
+                                       scells, mem_len);
+    if (ret < 0) {
+        fprintf(stderr, "couldn't set %s/reg\n", nodename);
+        goto out;
+    }
+    if (numa_node_id < 0) {
+        goto out;
+    }
+
+    ret = qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", numa_node_id);
+    if (ret < 0) {
+        fprintf(stderr, "couldn't set %s/numa-node-id\n", nodename);
+    }
+
+out:
+    g_free(nodename);
+    return ret;
+}
+
 static void fdt_add_psci_node(void *fdt)
 {
     uint32_t cpu_suspend_fn;
@@ -531,7 +561,8 @@ static int fdt_add_hotpluggable_memory_nodes(void *fdt,
         di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
 
         if (is_nvdimm) {
-            ret = -ENOENT; /* NV-DIMM not yet supported */
+            ret = fdt_add_pmem_node(fdt, acells, di->addr,
+                                    scells, di->size, di->node);
         } else {
             ret = fdt_add_memory_node(fdt, acells, di->addr,
                                       scells, di->size, di->node);
-- 
2.17.1

