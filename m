Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2375968wrt;
        Thu, 18 Oct 2018 07:32:12 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60H9/EGc4SNGJpADIwJfpNqu1qIBZlVK2MGQmsq0nN91fj/cQ3NT+4ct0DmFrk4Wr7TyJSc
X-Received: by 2002:a0c:f443:: with SMTP id h3mr30350318qvm.5.1539873132863;
        Thu, 18 Oct 2018 07:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873132; cv=none;
        d=google.com; s=arc-20160816;
        b=BkAtSsr5mVzneV5W+H6I+a4J9miSc5Dx5/W12LMXaW4vz6fhDwWoG5h+Iq94U50BRh
         vTQr3dGpYGmq6Rmg1JHzPyTrI+6G+PBJZ7KezV5KnGY4c5T8jXVkdke0uCG2v8LVDUbR
         OIPXGJScy1NSK2ysXqqaLdH4rqPmRNp1YMJD5AHbjyr5YMQjzlT4y80cpdYE/JFvH2TL
         3yIset4NTjAjwrgfbe1yWlgCDvhDgNBCjGs4mKbf9KqCBf4Iq3k0/emKUlzihyqizWsL
         jHhLM8yeibmEXQVeJ3fJJvXZvUE65pCwwQwHThdIPiycAjTTqmpd6LktNhzoGN3Qhb5u
         Ho5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=/WJ0TxOmncz27/r1vYV31AzYqjxdhk3u4hcYOk6zGgc=;
        b=Am5ZkA6zMBJHkLwJ+IbOnSROptK1wKBy1sdML2J77Iv1P5LQTXlKvHhT8FUwTjV6Bf
         B86aBFNE21ZjMUZSp0mHfRLMRjhcq/VnXY5eSK6O+lriu3KRsK5Kxz9hEDJbagr/Ts2z
         9XjJ26j3joySwJ1tDMNDwNut2hO4nhBELbVA1zCXInENgY7t+60nOaLkxUQDizu8wJ2V
         m0rAXUMJCvvb+0E2oZjqE4CrxyqmdwJ1TRB1tVDJPeNvkVxSfeevI0TNA9uRn4n9l3EN
         DW5d10Mp8zRP/JknZ+8iX8eS99ltvyUX2Dq65IVXNL2PsoFFb+8HsJxn3eQDoWCdNna6
         UV/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i3-v6si13895294qti.112.2018.10.18.07.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9LQ-00067d-AZ
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:32:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KP-0005St-6R
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9KM-0006VV-6C
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53470)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9KL-0006OY-Qb; Thu, 18 Oct 2018 10:31:06 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31D233001A5E;
	Thu, 18 Oct 2018 14:31:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C93C47899E;
	Thu, 18 Oct 2018 14:30:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:27 +0200
Message-Id: <20181018143042.29588-2-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Oct 2018 14:31:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 01/16] hw/arm/boot: introduce
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
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kzAUO1PGWVJF

From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

We introduce an helper to create a memory node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c | 54 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 20c71d7d96..ba2004da5c 100644
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
2.17.1

