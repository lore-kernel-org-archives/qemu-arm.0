Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484B0E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:50:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt5MF-0003xz-4z; Thu, 19 Feb 2026 09:50:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lo-0003jv-LQ
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:50:06 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt5Lc-000835-Gx
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:49:51 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-436e8758b91so812334f8f.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771512583; x=1772117383; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XwGSsZ5E+pHUCrk55JcghHWJX/O0i4AExLwj5l49n4=;
 b=K/w290nKKKt1soKtvxdJyH+R6S/vaw/eVDjuDvTc7uPW+NnN1yzP8DK71HipO30dF2
 O+npBL/5VYVv1lt+w6A6MlaxYCY37pTR0ATiYaDWwufS+7fgRVCH0ikOVZKn6PpJe2aK
 wkX5RnyLIaDv+GmlM4c1YrFv8EKOA8y9bKP3+8QsQqO1SlbPZzQke5RnqNkZnfFeTkBo
 dBhUHqwXa3zHKN1pWa7RrXoE2pevIMwSTcYENOMxfrW+A5CxElAdEDMmQsU0vQe2cf+i
 rkWXTZK8jipGStR9y8Wv8PK7LMWGYbWEZssxlzHXAHVTmTd+tKBCxc8fd8VGof4Gnj+8
 TYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771512583; x=1772117383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7XwGSsZ5E+pHUCrk55JcghHWJX/O0i4AExLwj5l49n4=;
 b=sPlQ57CqHVhRBe2C/wFttvLTGedvBiG4l5v2S98MFJb9y9rv60oPKsq5AvZWqey4Yx
 28NzEYssVewGSc/VsaYzgHoN2AcgSRbIgSXLwM7HUDudB3am9gmFBLmYNGZYMnMCpM1A
 eTUnaBT0RwZsHk/6F6LJgOIk6yGOhWLtgoJgFKc7YHn73MmBWGRslgWzoWGvV422tGYX
 qEm3CHY+PFLC3TuOSc/NxEBtSkZGHlYlDZQGhXaP6G0OFVonJ2FLVNUgcn6MkfjMfPcT
 LoFSL+SEXpJq9N/EIHUygDzA95OTrloDeOKL0VxQaRPCYcRuEWMxe4d/Pd5dfOrvTL9L
 Zt8w==
X-Gm-Message-State: AOJu0Yw70kusOKG0voB9n+cN1mVAle11WWn2JSn8Le3+HXTLQMyTt30D
 aHrrAAjJGBIDTig85EV35DeOxTUP39ljaZ7yi85YcMdkNTVuGi/4PwHP
X-Gm-Gg: AZuq6aKOikErqg9hRYqs3yMFVSvKjiMn+LhcCVp7cyTFwB84n2xxX2QpVpO4aax9Yc0
 Ln8ua+dxmlGYPLJ/T2br96DpY0XSw10CE61l7OGgrOitriQsam9flj0L4msGgPAsXgli0iCElAD
 9LkK78efx9mK3UEZKetxz5FFNPMHbyT6fxEyhqmMxQC9h5L086si5qPly6YwDZAd6w+kznmYxY+
 oO75EBSOouy5c/8mnAp2zzgwyXffKecLER5zHW4ERlRWeBu8gHoWuyrG24ouxbr9Z7tu4nWMtc2
 AXmJxqjJ9tzCaE9P2Aa0Ks9Rut5P5dWwvWhypB0jYgvsiE7mBq38GP4jcha3ciudp1hEeJPOdCK
 Ec0IPXnO5Wj8P+PcgA+/ERgrl8Q6K2EfwXIbsI+bUspKfqvmedtL1qmpccC2i1XyOjn+joedO7I
 uB4E7WBkgbq86aSdRsnJrtDoZT+rY7ru9wABNUqQsXBTgGgQRj2gbL29LofvJpa2zPZGCJ
X-Received: by 2002:a05:6000:178f:b0:435:92d3:d9b4 with SMTP id
 ffacd0b85a97d-4379db6483dmr36012522f8f.26.1771512582570; 
 Thu, 19 Feb 2026 06:49:42 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8d82sm50163087f8f.31.2026.02.19.06.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:49:42 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 21/33] hw/core/sysbus: implement FDT_GENERIC_MMAP_CLASS
 interface
Date: Thu, 19 Feb 2026 15:48:49 +0100
Message-ID: <20260219144901.3317747-3-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219144901.3317747-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
 <20260219144901.3317747-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

The patch implements FDTGenericMMap interface for sysbus
device class. The implementation maps device's MMIO regions
based on 'reg' property in the Device tree.

This enables automatic memory mapping for the most QEMU
peripherals without the need of device-specific FDT
handling code.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/sysbus.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 3adf2f2faf..78b7827708 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -23,6 +23,8 @@
 #include "monitor/monitor.h"
 #include "system/address-spaces.h"
 
+#include "hw/core/fdt_generic_util.h"
+
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
 
@@ -291,11 +293,32 @@ static char *sysbus_get_fw_dev_path(DeviceState *dev)
     return g_strdup(qdev_fw_name(dev));
 }
 
+static bool sysbus_parse_reg(FDTGenericMMap *obj, FDTGenericRegPropInfo reg,
+                             Error **errp)
+{
+    int i;
+
+    for (i = 0; i < reg.n; ++i) {
+        MemoryRegion *mr_parent = (MemoryRegion *)
+            object_dynamic_cast(reg.parents[i], TYPE_MEMORY_REGION);
+        if (!mr_parent) {
+            /* evil */
+            mr_parent = get_system_memory();
+        }
+        memory_region_add_subregion_overlap(mr_parent, reg.a[i],
+                                 sysbus_mmio_get_region(SYS_BUS_DEVICE(obj), i),
+                                 reg.p[i]);
+    }
+    return false;
+}
+
 static void sysbus_device_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
+    FDTGenericMMapClass *fmc = FDT_GENERIC_MMAP_CLASS(klass);
     k->realize = sysbus_device_realize;
     k->bus_type = TYPE_SYSTEM_BUS;
+    fmc->parse_reg = sysbus_parse_reg;
     /*
      * device_add plugs devices into a suitable bus.  For "real" buses,
      * that actually connects the device.  For sysbus, the connections
@@ -354,6 +377,11 @@ static const TypeInfo sysbus_types[] = {
         .abstract       = true,
         .class_size     = sizeof(SysBusDeviceClass),
         .class_init     = sysbus_device_class_init,
+        .interfaces = (InterfaceInfo[]) {
+        { TYPE_FDT_GENERIC_MMAP },
+        { },
+    },
+
     },
     {
         .name           = TYPE_DYNAMIC_SYS_BUS_DEVICE,
-- 
2.43.0


