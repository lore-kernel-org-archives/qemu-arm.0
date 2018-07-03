Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp693958wrq;
        Tue, 3 Jul 2018 00:23:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeYNuzR9OHrne4lSwMlycPkQWjMCZzBrGhHqLbZBfsIE/+8B8eiwlFyyc/DrIyqsWjLIPaK
X-Received: by 2002:a37:1286:: with SMTP id 6-v6mr24261225qks.158.1530602602183;
        Tue, 03 Jul 2018 00:23:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530602602; cv=none;
        d=google.com; s=arc-20160816;
        b=K5PkjyewQFzWKna9ZbNJyVPt6njPMX7QcOOHONcVTuGa3t/y2PYV2b/rIoEH8ZgkMw
         JmYH11WDuEjxi3Y9J8F+tz7aJTleHA8xkO5NbbYJfAAebI/+Aa4RXyaW4GZXSAcxc3b4
         clqu6v/4QEdbCBH75Mlgvn0bfxjf1+EiJmBum3qHU1FnJB9WDrZvojyBAqzrjFvcAoWA
         59V84ija6NsKayl/y6giNN7xN1rsSxJAZjD411M9KdH1ChynDUQ2U1IyzwwcJZIXlORY
         sLf/ofNfrUiHWtVQawKb17SpMs9x6RbSyzsSYUxMPJgSUA6bSz3XWMygCQEbtHRSWXjg
         GaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/ACeE0TCJwQQhnFs+HdrGoeb1jBC8JLOUxR3YPGFj5U=;
        b=SpSE4vo1ov/A/TRl1pLukRzYQDkNs0f00X5a/zTPbMDop+f8HDrSbAX8cTniS4FxRv
         T0XgyNWCRSx015IXMVETcrMBTf0KvOJttdcWCH/5iNu7v0aqSLVJ58OjZ1bcz4oMZPyO
         e2GeDOWAajPQDzz4Kv3TL7ecgI/xJGfu+tpGvGsMNJd7/u6paA3PM6iVF/gO/quOaK8v
         Z5uO41EjeSwWG9h+kblCZEOmW21Uv8kkWVVCwDOTy8Ek+kJZj5B4F8BhFsVMV4SFj6Jx
         LUdfsiymz3jWhGvojQi2q9OMnA3cQzBjuaN7KopH6zcgdnCeJ/EgiuyGUaDAjflbguh8
         Tu0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i28-v6si500176qte.36.2018.07.03.00.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 00:23:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38382 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faFej-0003SS-OI
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 03:23:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFdY-0003E6-LE
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faFcU-0005kO-EZ
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 03:22:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49518 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faFcT-0005j5-Uw; Tue, 03 Jul 2018 03:21:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB5A8406F8B2;
	Tue,  3 Jul 2018 07:21:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E577A1C5B8;
	Tue,  3 Jul 2018 07:20:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  3 Jul 2018 09:19:57 +0200
Message-Id: <1530602398-16127-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:21:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 03 Jul 2018 07:21:00 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 14/15] hw/arm/boot: Expose the pmem nodes in the
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
X-TUID: JDxLuQSyp3QH

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

