Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp653412wrq;
        Fri, 22 Jun 2018 03:19:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKGxeVS5X/QyZfja6n/uYqZBE5tirFq9XOF4gaFojF/nLNsog27S+3XsKAg7/mMkGUeMW2T
X-Received: by 2002:a37:b7c4:: with SMTP id h187-v6mr694533qkf.430.1529662778926;
        Fri, 22 Jun 2018 03:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529662778; cv=none;
        d=google.com; s=arc-20160816;
        b=w379Hm43UyxlmaeTbj1yzIu9pZkPv29vcMQWD8QRwpVbj3HUq1Hwao2V7ArjssVC+i
         DtzCH/Z5T6+9DdqKPtTE0L2T7HL/lN4h6dAWqbd5hYXBLmcziLzBDiSCY8V9bfeQCTLO
         PSOfddQgUTcWzydiXDqL2+eWVay77wwrbxwjY4ldOCq/OT7NL6Rwo9Xt4Sqwpd6tdo+3
         YJDGxWED0M6nfgOekXBTyb6F1aRoRjpXhdPIpR/eThdoJxGWWW6CvSwAM2xW7kaZ9TEh
         BjDaXDHXjKJf6rp5P3qpLZGgmjGSomiknFcHqa5BZvtDk+DMuIvhJa7ZtFPhwxvWiJKY
         CI4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=J+zgYZQrPK2QbN3yDa9AYYaSwhV0F4NORdjz3pXirU4=;
        b=Cs29Q5PBVVpb5VUGKCDfljdUnIeKxQ/qcKAh9Be4+J2iM0FNJUKDzMtD07F9mjIJFb
         eJqu2Gicqboo8Q4zJQ6XaVWpVspMPu6ty2SfrzvTJ4PI+9Iy+JpETN9sDtPP+ejrE5DX
         qa9/qGYa0Bs0eRmycypk3Lhcf1HomJG+el9E7+6tBYX9paTbs1ws0pfIPPZ2HZiRvULm
         YX5/ESd1J1PmuCSN/AbMOYiDvz61e/nmRlPbORuukw4L+zewYpw23KfGhaKeoQuLWQeW
         42hwjZB6fGktA0Yg6UPQ2yhgrwQUitjYrs4cepz90CDGytEUy4OUbh8DByhhDdczOTtq
         ngkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o34-v6si319392qve.171.2018.06.22.03.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJAI-0000Le-A6
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA2-0000JN-Ev
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA1-0005Z1-CI
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40796 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWJA1-0005Yg-6A; Fri, 22 Jun 2018 06:19:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B78FB6167F;
	Fri, 22 Jun 2018 10:19:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D52711166E1;
	Fri, 22 Jun 2018 10:19:19 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com
Date: Fri, 22 Jun 2018 12:19:07 +0200
Message-Id: <1529662749-32069-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
References: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 10:19:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 22 Jun 2018 10:19:20 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 3/5] hw/arm/boot: introduce fdt_add_memory_node
 helper
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
X-TUID: O4+8p2gaJALc

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node. Also we nop
existing /memory node in numa and non numa case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

---

the nop related change should disappear if the following series
lands upstream:
[PATCH v2 0/3] ARM virt: Silence dtc warnings
---
 hw/arm/boot.c | 70 +++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 1e48166..cc425ce 100644
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
     int size, rc;
     uint32_t acells, scells;
-    char *nodename;
     unsigned int i;
     hwaddr mem_base, mem_len;
 
@@ -545,49 +574,28 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                 "RAM size > 4GB\n");
         goto fail;
     }
+    /*
+     * Turn the /memory node created before into a NOP node, then create
+     * /memory@addr nodes.
+     */
+    qemu_fdt_nop_node(fdt, "/memory");
 
     if (nb_numa_nodes > 0) {
-        /*
-         * Turn the /memory node created before into a NOP node, then create
-         * /memory@addr nodes for all numa nodes respectively.
-         */
-        qemu_fdt_nop_node(fdt, "/memory");
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
-        Error *err = NULL;
-
-        rc = fdt_path_offset(fdt, "/memory");
+        rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
+                                 scells, binfo->ram_size, -1);
         if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
-        }
-
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
-        }
-
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
             goto fail;
         }
     }
-- 
2.5.5

