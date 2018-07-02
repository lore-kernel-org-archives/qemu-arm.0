Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp121166wrq;
        Mon, 2 Jul 2018 10:34:24 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfRrxprJBZF6qdJJAb67Kwwfn7uzqi2FCPGK9r7DctXz5Xerc1dfm68EoAOpaI/AaCIrjGr
X-Received: by 2002:a37:7d02:: with SMTP id y2-v6mr1784731qkc.19.1530552864479;
        Mon, 02 Jul 2018 10:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552864; cv=none;
        d=google.com; s=arc-20160816;
        b=ftp9OKE3JlNKVexBeUdGg89coUg/ja7L9MaE5lJ3xc7l1lg/U017KKdR/7epRFGvpr
         78eJOiKfDevlx8IbJIMgJIuuJtCPjrJ4ZVB8uj/xHOHqeY0e6fAKiyae4YLYBG2xASnV
         NMNnnCcXdAto1fJcHQG+9uApYsHesxZ44P7yqzn2A7tpfSxx6F0hb89B+yStVDA+m3yW
         wAPN8+Qs0FE+HNkhsqWmxscfTD9o4Pyj9Og6nVMgtSjY01z5FZ59kIKhd6cUk7C4WzEA
         UgvFmxc0GmxBzDJ7rt0dXBHKgD2BXYL+mMun5sU0qHGNJ+1S+YV1x4lNJkel4MnfEj4A
         Qzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/ACeE0TCJwQQhnFs+HdrGoeb1jBC8JLOUxR3YPGFj5U=;
        b=EAtUQRKz5QzOTd20bswb5/k9DoAGi1xKkmnjmNUkdjrFtfuTSJnWMN7R5QBatLHNfW
         Q37JDibfHvwJiPJk47oq1YCI0jyQjKwq4JF56AS1X3P4iACkM2YeSIwArCaC3EfvI/Ob
         73JYlACfzWFFVc7O405No4H7CEVSkiSkaZI3EOg3Vmk31hI1VO2SNiL8sOQHMoI5s6FF
         YuPaD171vBC326T5VMb8PoaGS2SUcBSJ3Ls8CakPFOm2ICK0+Pr/UcbAl9KOb4838x9M
         k7t0L66ctZC7RwMuR5doq4Mp7qfAzPFrZnFoJHDVKXSSow1zehumzdfVzXPmv+WuD5vH
         zQvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4-v6si5755426qvi.6.2018.07.02.10.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2iV-0008UQ-U0
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:34:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YL-0000Yk-DU
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2YK-00071e-Ch
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49798 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2YK-00071T-7a; Mon, 02 Jul 2018 13:23:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C43467C6A9;
	Mon,  2 Jul 2018 17:23:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C7D2111AF38;
	Mon,  2 Jul 2018 17:23:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:41 +0200
Message-Id: <1530552162-15533-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 02 Jul 2018 17:23:51 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 14/15] hw/arm/boot: Expose the pmem nodes in the
 DT
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
X-TUID: Xezy1PaqEOaG

In case of NV-DIMM slots, let's add /pmem DT nodes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/boot.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 2c7d558..3381c66 100644
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
@@ -532,7 +562,8 @@ static int fdt_add_hotpluggable_memory_nodes(void *fdt,
         di = !is_nvdimm ? mi->u.dimm.data : mi->u.nvdimm.data;
 
         if (is_nvdimm) {
-            ret = -ENOENT; /* NV-DIMM not yet supported */
+            ret = fdt_add_pmem_node(fdt, acells, di->addr,
+                                    scells, di->size, di->node);
         } else {
             ret = fdt_add_memory_node(fdt, acells, di->addr,
                                       scells, di->size, di->node);
-- 
2.5.5

