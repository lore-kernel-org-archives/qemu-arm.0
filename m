Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4560173wrx;
        Tue, 9 Apr 2019 03:35:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpS/u51QEdKxmPgyM5dOHQsQOAANaGGSEE0CmDBp+ZmYfXPrHAvfx3yYOZ6GL1vLKuHyw0
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr8968664wmj.41.1554806101825;
        Tue, 09 Apr 2019 03:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554806101; cv=none;
        d=google.com; s=arc-20160816;
        b=d1KMKbxXyBTigwIKpWku4zMgfUbouBsBoAEl9WyAea49VbFEccPq6Ba/Sq1m2jMVd/
         wn84WKwvTFY6ZPn24Xg9nvCkSoKG2kHIZEy0SE2D9vjUcBnp6dai9pw8Rox/kscHhrbq
         jeMo24CsDM55sHpguJ1SnbwNcGfbrZy6v2IIk0S8w58G4YBwn/LvZ3iLu8cXvU5IRtb/
         lHUAxHxBZU43uhVcX3KilRJ/+gSZOL7IOf9wJH67InTgBiyph9jGgS549xR7Yx+GBFXl
         W16wFIJIp07tGezphwhhcPYZhrUlLcpXoWmW6HFRlvC2B5gg9vRJLZbC5bi1FlQjbBmp
         rWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=FPMG66c8GhKG/xeS35PU2iBETT+8t4FkX+uKGkul+E4=;
        b=Kj+mJ4hgG+Crg9qictfwYfenmpp09xz9FnRlxfFHqjzCa3O0/XiOyExoHApcQ2PcCL
         UUKOmuLx7jMo1qLPsLhrhmBmWe38B3mO2R2ZGq6TeY8zxysqB44JVGwyMvPK9Mqtos+L
         4zTh/X6DBRgUdBf33tcKI3nSJJTrRY4x2KJpe2vY0aAl2aJcNwGuAqhYyZS3McgE/t04
         evm01Jp3r+qkhaCFlfgM670809FAA4Cf/UIkwezPvfu8HCVtbmibwyz21pUxm6dZMm+s
         j4Nsd8gBJ20oDV1cQN2wA48Luhph1v1m06SxE6zGLTxh2oAZtRCUqrVKa/58AX0BUkw3
         ddLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11si8122500wma.32.2019.04.09.03.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Apr 2019 03:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hDo5k-0008L9-TY
	for alex.bennee@linaro.org; Tue, 09 Apr 2019 06:35:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo2C-0006Il-09
	for qemu-devel@nongnu.org; Tue, 09 Apr 2019 06:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo2A-0007Oh-Sj
	for qemu-devel@nongnu.org; Tue, 09 Apr 2019 06:31:19 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2262 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1hDo26-0007Lz-Vz; Tue, 09 Apr 2019 06:31:15 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B321B80BFBB013806270;
	Tue,  9 Apr 2019 18:31:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.408.0; Tue, 9 Apr 2019 18:31:04 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
	<imammedo@redhat.com>
Date: Tue, 9 Apr 2019 11:29:34 +0100
Message-ID: <20190409102935.28292-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [PATCH v4 7/8] hw/arm/boot: Add "hotpluggable"
 property to DT memory node
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e89K9C3cRpWl

Currently firmware has no way of differentiating the memory
nodes and as a result device memory nodes might get exposed
to Guest Kernel via UEFI GetMemoryMap() as early boot memory
even if Guest boots with ACPI. This will prevent hot-unplug
of the device memory. To address this, an additional
"hotpluggable" property is introduced here similar to
the MEM_AFFINITY_HOTPLUGGABLE flag used in ACPI SRAT table.

Firmware can now check for "hotpluggable" property in the
memory node and treat them differently.

This is in preparation of exposing device memory nodes in DT.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/boot.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index a830655..8c840ba 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -425,7 +425,7 @@ static void set_kernel_args_old(const struct arm_boot_info *info,
 
 static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
                                uint32_t scells, hwaddr mem_len,
-                               int numa_node_id)
+                               int numa_node_id, bool hotplug)
 {
     char *nodename;
     int ret;
@@ -444,6 +444,22 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
         ret = qemu_fdt_setprop_cell(fdt, nodename,
                                     "numa-node-id", numa_node_id);
     }
+
+    /*
+     * Firmware has no way of differentiating the memory nodes currently
+     * and in the case of device memory nodes this is a problem if Guest
+     * boots with ACPI as these nodes might get exposed to Guest Kernel
+     * via UEFI GetMemoryMap() as early boot memory. This will prevent
+     * the memory being hot-unpluggable. To address this, an additional
+     * "hotpluggable" property is introduced here, similar to the
+     * MEM_AFFINITY_HOTPLUGGABLE flag used in ACPI SRAT table.
+     * Firmware can now check for "hotpluggable" property in the memory
+     * node and treat them differently.
+     */
+
+    if (hotplug) {
+        ret = qemu_fdt_setprop(fdt, nodename, "hotpluggable", NULL, 0);
+    }
 out:
     g_free(nodename);
     return ret;
@@ -602,7 +618,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         for (i = 0; i < nb_numa_nodes; i++) {
             mem_len = numa_info[i].node_mem;
             rc = fdt_add_memory_node(fdt, acells, mem_base,
-                                     scells, mem_len, i);
+                                     scells, mem_len, i, false);
             if (rc < 0) {
                 fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
                         mem_base);
@@ -613,7 +629,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
         }
     } else {
         rc = fdt_add_memory_node(fdt, acells, binfo->loader_start,
-                                 scells, binfo->ram_size, -1);
+                                 scells, binfo->ram_size, -1, false);
         if (rc < 0) {
             fprintf(stderr, "couldn't add /memory@%"PRIx64" node\n",
                     binfo->loader_start);
-- 
2.7.4


