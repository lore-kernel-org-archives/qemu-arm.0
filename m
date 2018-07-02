Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp111679wrq;
        Mon, 2 Jul 2018 10:24:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdICtMae9YDI7uxveUc6dGbv8qX2rJD1rnhescAQLrc45gi9bPEjKw5RdlzGmn4bk83zUyy
X-Received: by 2002:a0c:f04e:: with SMTP id b14-v6mr2326926qvl.20.1530552252863;
        Mon, 02 Jul 2018 10:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552252; cv=none;
        d=google.com; s=arc-20160816;
        b=y+dFX2I7Ur9MG++Ji9qYNQWQPD2GoO6vj87VJwLxTAQMgzIrxIXjzuYsF2ULjz+wfx
         RHJT9DQUkzwHKWkN4cEQwfidHLdYbwnF0n8U0whDlrMTZXDTvfKKNzXyZO/GIK8bU9jQ
         uVl/dDemsFWXZPh7EFZ6GmPn8ifEyUDKz3daP39B9CJ8CcrWGu3JX2uhpk5CEECXAtZW
         i7cVgajre0i7RWxjBkqXZ7YpDR7Ze3oPW2RNgtlKLLfwrqhP6Fa2a3TWb8I/0TOqV9H7
         9P6RUG6A93veXs9GyL6JEBWdg+HXQWSE24VTccwOsXje8fpXlf0e2sS6pN2saq6I8/BE
         m/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=l1g3Y+1XwgMXEROVumnZpRwUkXymqyujlkJUgvD1erw=;
        b=eSumKWeWC3u7XM4QaN1w1m4mv4R4GMoo3oFijKgbXx6n0cZTGF68RY4zWWDMyr/R/J
         8Rv3dOKzdaSD3WeHe4qrO8y3QNlJ4eNnB0ZvmdSTnJ+UQZg/haR+1MLOBDMKvKtBVLEA
         e3XcsZbmOl5/bQyiousHxhdOck970XMlHjsAjUdcWJ8UCKsxj11X8hWz4NVcwyny/JYY
         Qc9PxMXf2g0cJTMGAg1fdP3wollZIxm4AnKDtaOxGStK/+wDtWcE5dE458UxPkFPzFCu
         UJjqPtO4HATzgZWeHia6qP4GmxqTevME0qpKi+JEGHg7ciwBMY6d19c3aSHka3RYEWQS
         /4Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2-v6si3423606qkb.201.2018.07.02.10.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2Ye-0000dg-6b
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:24:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xu-00009C-Ou
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2Xt-0006cu-Kb
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55728 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2Xt-0006cD-Cl; Mon, 02 Jul 2018 13:23:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF00B4022909;
	Mon,  2 Jul 2018 17:23:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBE77111AF38;
	Mon,  2 Jul 2018 17:23:22 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:35 +0200
Message-Id: <1530552162-15533-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 02 Jul 2018 17:23:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 02 Jul 2018 17:23:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 08/15] hw/arm/boot: introduce
 fdt_add_memory_node helper
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
X-TUID: 33XNLhv1wrGa

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

---

v1 -> v2:
- nop of existing /memory nodes was already handled
---
 hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e09201c..5243a25 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -413,6 +413,36 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
     }
 }
 
+static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
+                               uint32_t scells, hwaddr mem_len,
+                               int numa_node_id)
+{
+    char *nodename = NULL;
+    int ret;
+
+    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
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
@@ -492,7 +522,6 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     void *fdt = NULL;
     int size, rc, n = 0;
     uint32_t acells, scells;
-    char *nodename;
     unsigned int i;
     hwaddr mem_base, mem_len;
     char **node_path;
@@ -566,35 +595,20 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         mem_base = binfo->loader_start;
         for (i = 0; i < nb_numa_nodes; i++) {
             mem_len = numa_info[i].node_mem;
-            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
-            qemu_fdt_add_subnode(fdt, nodename);
-            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                              acells, mem_base,
-                                              scells, mem_len);
+            rc = fdt_add_memory_node(fdt, acells, mem_base,
+                                     scells, mem_len, i);
             if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
-                        i);
                 goto fail;
             }
 
-            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
             mem_base += mem_len;
-            g_free(nodename);
         }
     } else {
-        nodename = g_strdup_printf("/memory@%" PRIx64, binfo->loader_start);
-        qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-
-        rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
+        rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
+                                 scells, binfo->ram_size, -1);
         if (rc < 0) {
-            fprintf(stderr, "couldn't set %s reg\n", nodename);
             goto fail;
         }
-        g_free(nodename);
     }
 
     rc = fdt_path_offset(fdt, "/chosen");
-- 
2.5.5

