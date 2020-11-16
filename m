Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3595101lfb;
        Mon, 16 Nov 2020 02:50:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOc5ziY5tg5h2atoVILflGt9lHZ+fQJ8Ib9mocW5mEjEVQJS9RP6OXr8vqC2Ogxyo0paoP
X-Received: by 2002:a25:2f4e:: with SMTP id v75mr21317806ybv.18.1605523835713;
        Mon, 16 Nov 2020 02:50:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605523835; cv=none;
        d=google.com; s=arc-20160816;
        b=QeqEAvvOLZ8qeNI9qoX2FhcT/GMTjP6ZFg5y0TDTGCe/+R9GVpoX1aDkm8E5yupXLj
         gWaKTgmsydNzLiN1kyBkTC4bssDhMVNrOXftNoId9YZ9LKjzbLMgtkZjxf2YE13y8OhF
         CYB7q05OwOi2iJ8jk/J5+xFvqS9xumxsBz7FdfJHtprxSzxexHg4EzA7+V0kTyKGFQnm
         qk/RPDzBK1avj0R4FCoS2J2NwDabPkEP+CSqhRsHkKRxuhce1p1xVL/NdBf0DdddIg07
         t5x4E3q8HbrqNzWrUSveqNotXs4ttH211hye9wjeix+JeG6KNC8DcA7DqkdmBX9Ahh0N
         uzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=94eggaWe2+5P63Kl81RNXNeaaY0v2+lbVxf9v4CAftc=;
        b=JbYSwdvji/l8q2s4Py9KZYlihftGI6TUZHeu0XIU99dCv6Kesuyb2i+VPr7Y9NHzPV
         YcGg020+MvPeOz/3o4QsoyxgZ3PuQ0SNoA18czXZqtm+GYJPER0gATruZR2FAb64NDXT
         qaG1OOsTGIuaKaE4heJZ1fLqCdDRUX+4bqc/aV+nZhvpgHyo8zsrldDYvvjqGmcSW7rC
         vQ1mebGvazzsBpXjk4MRVxWaNsrXRQ94a91SSo783yZodVMWCRLLKqfdP0wDICDSQcOw
         07RiKVBS330HZ7OOjLvbw+LkbpegH0Bnpeirm0wRqyEAjhnKLvSfguzv2OLLO/fMU2pW
         AMIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=uAQqnBRV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si17879891ybm.232.2020.11.16.02.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 02:50:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=uAQqnBRV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kec5j-0007Ug-3c
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 05:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxy-0007xO-K2; Mon, 16 Nov 2020 05:42:35 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxu-0000YJ-VF; Mon, 16 Nov 2020 05:42:34 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAeAgW126741;
 Mon, 16 Nov 2020 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=94eggaWe2+5P63Kl81RNXNeaaY0v2+lbVxf9v4CAftc=;
 b=uAQqnBRVcOe4ltCRBA8KLOT1RuudLAzKjUxd60tBODeG746awoZB36q6ldkYcCJ8Xgjr
 RiMXVyDofOLO0pjc9wpdaOIGk5q6VLM+kobuJE+8RUqDUyEppWVzVAKAHAUCeckDSc4n
 uG7lHTakIByQ45GtcXSweJ4cl/u+ocZ9PfYtJBUZH0zyC2eRPYj5LFRhfHj9COXdMFZo
 OmSQRgTN8oyXIGzImcVagSnrsyIA/sTfRwCS4h5SwyHlOeSpR3+68k7nufT2f35Jm8di
 ETGZEe8xkiJx/zKQfETK5YIjJgPZ6/JJQpyM9hu/BihX02lxcWkWfjFNIw/1hrd4FXVK 8Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 34t4ramj0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:42:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAf9Fh068371;
 Mon, 16 Nov 2020 10:42:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34umcwp474-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:26 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AGAgP5j004850;
 Mon, 16 Nov 2020 10:42:25 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:25 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 761c95c1;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/5] hw/arm: Only minimise flash size on older machines
Date: Mon, 16 Nov 2020 10:42:16 +0000
Message-Id: <20201116104216.439650-6-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=3 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160062
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ne6+qHWtqg9J

Prior to 5.2 the flash images loaded into the bottom 128MB always
filled the region. Ensure that this continues to be the case.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/arm/virt-acpi-build.c | 11 +++---
 hw/arm/virt.c            | 79 ++++++++++++++++++++++++++--------------
 include/hw/arm/virt.h    |  3 +-
 3 files changed, 60 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2c08d36624..6e3d72a9e9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -117,16 +117,17 @@ static void acpi_dsdt_add_flash1(Aml *scope, int index,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap,
-    PFlashCFI01 *flash[2])
+static void acpi_dsdt_add_flash(Aml *scope, VirtMachineState *vms)
 {
+    MemMapEntry *flash_memmap = &vms->memmap[VIRT_FLASH];
+
     acpi_dsdt_add_flash1(scope, 0,
                          flash_memmap->base,
-                         virt_flash_size(flash[0]));
+                         virt_flash_size(vms, vms->flash[0]));
 
     acpi_dsdt_add_flash1(scope, 1,
                          flash_memmap->base + flash_memmap->size / 2,
-                         virt_flash_size(flash[1]));
+                         virt_flash_size(vms, vms->flash[1]));
 }
 
 static void acpi_dsdt_add_virtio(Aml *scope,
@@ -606,7 +607,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
-        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH], vms->flash);
+        acpi_dsdt_add_flash(scope, vms);
     }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 03ec844bf3..e851622cb5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -933,9 +933,15 @@ static void create_virtio_devices(const VirtMachineState *vms)
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-int64_t virt_flash_size(PFlashCFI01 *flash)
+int64_t virt_flash_size(VirtMachineState *vms, PFlashCFI01 *flash)
 {
-    return blk_getlength(pflash_cfi01_get_blk(flash));
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    if (vmc->maximize_flash_size) {
+        return vms->memmap[VIRT_FLASH].size / 2;
+    } else {
+        return blk_getlength(pflash_cfi01_get_blk(flash));
+    }
 }
 
 static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
@@ -1014,47 +1020,65 @@ static void virt_flash_map(VirtMachineState *vms,
     MemMapEntry *m = &vms->memmap[VIRT_FLASH];
 
     virt_flash_map1(vms->flash[0], m->base,
-                    virt_flash_size(vms->flash[0]), secure_sysmem);
+                    virt_flash_size(vms, vms->flash[0]), secure_sysmem);
 
     virt_flash_map1(vms->flash[1], m->base + m->size / 2,
-                    virt_flash_size(vms->flash[1]), sysmem);
+                    virt_flash_size(vms, vms->flash[1]), sysmem);
 }
 
 static void virt_flash_fdt(VirtMachineState *vms,
                            MemoryRegion *sysmem,
                            MemoryRegion *secure_sysmem)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     bool secure = sysmem != secure_sysmem;
     MemMapEntry *m = &vms->memmap[VIRT_FLASH];
     hwaddr flashbase0 = m->base;
     hwaddr flashbase1 = m->base + m->size / 2;
-    hwaddr flashsize0 = virt_flash_size(vms->flash[0]);
-    hwaddr flashsize1 = virt_flash_size(vms->flash[1]);
+    hwaddr flashsize0 = virt_flash_size(vms, vms->flash[0]);
+    hwaddr flashsize1 = virt_flash_size(vms, vms->flash[1]);
     char *nodename;
 
-    if (secure) {
-        nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase0);
-    } else {
+    if (vmc->maximize_flash_size && !secure) {
+        /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase0);
-    }
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, flashbase0, 2, flashsize0);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-    if (secure) {
-        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
-    }
-    g_free(nodename);
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase0, 2, flashsize0,
+                                     2, flashbase1, 2, flashsize1);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    } else {
+        /*
+         * If we are not intending to fill the flash region or one is
+         * device is secure, report two distinct nodes.
+         */
+        if (secure) {
+            nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase0);
+        } else {
+            nodename = g_strdup_printf("/flash@%" PRIx64, flashbase0);
+        }
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase0, 2, flashsize0);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        if (secure) {
+            qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+            qemu_fdt_setprop_string(vms->fdt, nodename,
+                                    "secure-status", "okay");
+        }
+        g_free(nodename);
 
-    nodename = g_strdup_printf("/flash@%" PRIx64, flashbase1);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, flashbase1, 2, flashsize1);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-    g_free(nodename);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase1);
+        qemu_fdt_add_subnode(vms->fdt, nodename);
+        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                     2, flashbase1, 2, flashsize1);
+        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        g_free(nodename);
+    }
 }
 
 static bool virt_firmware_init(VirtMachineState *vms,
@@ -2614,6 +2638,7 @@ static void virt_machine_5_1_options(MachineClass *mc)
     virt_machine_5_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
     vmc->no_kvm_steal_time = true;
+    vmc->maximize_flash_size = true;
 }
 DEFINE_VIRT_MACHINE(5, 1)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ee21d691ea..1135e7e165 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -127,6 +127,7 @@ struct VirtMachineClass {
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
+    bool maximize_flash_size;
 };
 
 struct VirtMachineState {
@@ -172,7 +173,7 @@ OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
-int64_t virt_flash_size(PFlashCFI01 *flash);
+int64_t virt_flash_size(VirtMachineState *vms, PFlashCFI01 *flash);
 
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
-- 
2.28.0

