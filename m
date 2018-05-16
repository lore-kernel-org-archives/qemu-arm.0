Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1243185wme;
        Wed, 16 May 2018 08:22:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrJFTsLHMsNnLxW3O8ImASunK7ZSA54aAP5ioSxGltphPmXGqNi+b7MrhEmLd+7mCbn1HMc
X-Received: by 2002:aed:2c81:: with SMTP id g1-v6mr1382637qtd.285.1526484163900;
        Wed, 16 May 2018 08:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484163; cv=none;
        d=google.com; s=arc-20160816;
        b=klk2LRSEM+VFVvQRpt/UEbuTHcaTSRZguOHWbcYLLCda5DJYaXDFW8WYaLNkJolvwM
         CVo7tJ5QZJTOy5OaAH1WxzCe0GTzPvC2c2FyyHDzZ5xBEJBKZxpV2TXHdP1o7Ky4q5Vr
         3y45QcVxBM3fr9CrReStdC29cr11L+CIHJUmUe9OJh4rwjT5ZdXoO3qLTjhbhj9ba/qj
         YreULk52qyyep5aXpVo0kzwK+PneCF0ww7p1nQ9Y4Axoybmvids5GBK5YLwZ9qoGRHF9
         fH/J9aODwHrbUgNT345nhEYs3RQrUponcBO3ENHGlhsRYmlKh1gna2zCNnIjmrqCfS7g
         OspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=Uvi2Erl9aJDgJiDZ/uKw+pAyIWunAY5jNTAwP+VGb0g=;
        b=dxnFnbNCA57wPBsMCUkPWiYfbCiTXQn2druObTsdnIFEvUfmaX08bBai+flf9TV8yA
         WxYJLwedFMpcCWtLPv4eWWW8OyTnU7ZK5rXlA0hfoSGJRbWUdkyE1YJfn+mJbSny2UrI
         ntyKzsYC9aroDuFAThQ7zdMD49svDpsizHoNEhbQ8LHvPQWV1rCVOVC+TH4NtdjEs0Bt
         6kNpSLW3K7QnaPA5k5GznaBARyQdgx1jRbdtbyX3BbpWqdJ5Jkdkk1GCBQoapjvPu0JZ
         p2EArgP2uNx4pQbhvtE7EXGS+/gnTJ9x68lOUYwXDwQ6lxVjbZ4W2n8qW7zMHrFcHCT2
         PEMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r41-v6si2846561qtc.165.2018.05.16.08.22.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyGJ-00086B-BG
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:22:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFo-0007qj-EP
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFj-0005lV-OY
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:12 -0400
Received: from [45.249.212.32] (port=54447 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFi-0005iq-Bm; Wed, 16 May 2018 11:22:07 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 6E18C6500791A;
	Wed, 16 May 2018 23:22:01 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:53 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:24 +0100
Message-ID: <20180516152026.2920-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [RFC v2 4/6] hw/arm: Changes required to accommodate
 non-contiguous DT mem nodes
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qlFEVTE4ahi

This makes changes to the DT mem node creation such that its easier
to add non-contiguous mem modeled as non-pluggable and a pc-dimm
mem later.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c        | 91 ++++++++++++++++++++++++++++++++++++----------------
 include/hw/arm/arm.h | 12 +++++++
 2 files changed, 75 insertions(+), 28 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 26184bc..73db0aa 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -486,6 +486,27 @@ static void fdt_add_psci_node(void *fdt)
     qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
 }
 
+static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr mem_base,
+                                          uint32_t scells, hwaddr mem_len)
+{
+    char *nodename = NULL;
+    int rc;
+
+    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+    rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
+                                      scells, mem_len);
+    if (rc < 0) {
+        fprintf(stderr, "couldn't set %s/reg\n", nodename);
+        g_free(nodename);
+        return NULL;
+    }
+
+    return nodename;
+}
+
+
 /**
  * load_dtb() - load a device tree binary image into memory
  * @addr:       the address to load the image at
@@ -567,50 +588,64 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         goto fail;
     }
 
+    /*
+     * Turn the /memory node created before into a NOP node, then create
+     * /memory@addr nodes for all numa nodes respectively.
+     */
+    qemu_fdt_nop_node(fdt, "/memory");
+
     if (nb_numa_nodes > 0) {
-        /*
-         * Turn the /memory node created before into a NOP node, then create
-         * /memory@addr nodes for all numa nodes respectively.
-         */
-        qemu_fdt_nop_node(fdt, "/memory");
+        hwaddr mem_sz;
+
         mem_base = binfo->loader_start;
+        mem_sz = binfo->ram_size;
         for (i = 0; i < nb_numa_nodes; i++) {
-            mem_len = numa_info[i].node_mem;
-            nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
-            qemu_fdt_add_subnode(fdt, nodename);
-            qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
-            rc = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
-                                              acells, mem_base,
+            mem_len = MIN(numa_info[i].node_mem, mem_sz);
+
+            nodename = create_memory_fdt(fdt, acells, mem_base,
                                               scells, mem_len);
-            if (rc < 0) {
-                fprintf(stderr, "couldn't set %s/reg for node %d\n", nodename,
-                        i);
+            if (!nodename) {
                 goto fail;
             }
 
             qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
-            mem_base += mem_len;
             g_free(nodename);
+            mem_base += mem_len;
+            mem_sz -= mem_len;
+            if (!mem_sz) {
+                break;
+           }
         }
-    } else {
-        Error *err = NULL;
 
-        rc = fdt_path_offset(fdt, "/memory");
-        if (rc < 0) {
-            qemu_fdt_add_subnode(fdt, "/memory");
-        }
+        /* Create the node for initial pc-dimm ram, if any */
+        if (binfo->dimm_mem) {
 
-        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &err)) {
-            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "memory");
+            nodename = create_memory_fdt(fdt, acells, binfo->dimm_mem->base,
+                                              scells, binfo->dimm_mem->size);
+            if (!nodename) {
+                goto fail;
+            }
+            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id",
+                                                 binfo->dimm_mem->node);
+            g_free(nodename);
         }
 
-        rc = qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
-                                          acells, binfo->loader_start,
-                                          scells, binfo->ram_size);
-        if (rc < 0) {
-            fprintf(stderr, "couldn't set /memory/reg\n");
+    } else {
+
+        nodename = create_memory_fdt(fdt, acells, binfo->loader_start,
+                                         scells, binfo->ram_size);
+        if (!nodename) {
             goto fail;
         }
+
+        if (binfo->dimm_mem) {
+            nodename = create_memory_fdt(fdt, acells, binfo->dimm_mem->base,
+                                              scells, binfo->dimm_mem->size);
+            if (!nodename) {
+                goto fail;
+            }
+            g_free(nodename);
+        }
     }
 
     rc = fdt_path_offset(fdt, "/chosen");
diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index ce769bd..0ee3b4e 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -48,6 +48,12 @@ typedef struct {
     ARMCPU *cpu; /* handle to the first cpu object */
 } ArmLoadKernelNotifier;
 
+struct dimm_mem_info {
+    int node;
+    hwaddr base;
+    hwaddr size;
+};
+
 /* arm_boot.c */
 struct arm_boot_info {
     uint64_t ram_size;
@@ -124,6 +130,12 @@ struct arm_boot_info {
     bool secure_board_setup;
 
     arm_endianness endianness;
+
+    /* This is used to model a pc-dimm based mem if the valid iova region
+     * is non-contiguous.
+     */
+    struct dimm_mem_info *dimm_mem;
+
 };
 
 /**
-- 
2.7.4


