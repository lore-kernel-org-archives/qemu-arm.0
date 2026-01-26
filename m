Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6953DD19511
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd5-0001b5-WA; Mon, 26 Jan 2026 12:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQct-0001RN-Rs
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcs-00009z-8u
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:47 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so70306015e9.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449424; x=1770054224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XwGSsZ5E+pHUCrk55JcghHWJX/O0i4AExLwj5l49n4=;
 b=OMCAOIK0ufcvL1qsQcOmgl56LB+hIrU31dZi+GI0AtMdoK5PdXE9ajnzUwNEtLzTk+
 fvgS4QFzkGy/oaBuCbZD8N18WA+BunY6UdEfKkG16wrL2qt6lHEQi1DVdOp03+JMUZlk
 0RUQ6z5K8/OH5CeHUcraniaIjxWg4VJBX3YjfZx+QViW+hAyHiGDF7LYfDTYrZMl3jlk
 XU0ZQ3r5ZjNUCVVMCalZ5FV7uhS0ZdEtvxgB4mPt1gYNqdPXJzM9NQPf7jbU4ziCv2LF
 gGJNQinqao2itZAdJ5xiapuqE/vwQtWXADSeRf+Wk4enPNvLHDywxPfdyDkpVgnvPLsY
 GIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449424; x=1770054224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7XwGSsZ5E+pHUCrk55JcghHWJX/O0i4AExLwj5l49n4=;
 b=FZLkcywb8YddANEeXlVOa8sDZIhRawDLj3rJiPDCFFtrtm/DW973MetW97w+QvKsBX
 8jzIH7uUCBxguoOLcAEDFB3fIIuzW7+cZCkQQckg4UXcDMgvTlCp1AxVsCAYrq9mXTKx
 i0hJl9Gke4Yxs//67H4QTbHdHwpKVIa5zfvCvydKM7vkbrdajG4WG8Rwaf16tMhtKjQD
 FiFpeLqcRh4oSZLBurmLUqff3TCowkkf82tb/+4nVfw3Gdc2MzFgJdZuaAIOanMLxrnV
 VE2spjjvRf8lrlJUP1o42YH3qX/+LcNhhpeO+ikPCiRfVK5b9aIH/QJECySK+A07yE8h
 KQvg==
X-Gm-Message-State: AOJu0YwSlcpPaWF5QuOS4nBFA5Gn0FiB7dpdFkEO8qt78170nrbEnmjU
 bxVOznChZcLwdayYsOVNb59enHL6msStn3eFipYv0AGn1t2M6eenF/Fp
X-Gm-Gg: AZuq6aKaTy0p9Vl//W1H91wtokd6qyrH7dFZ8tOD1i/ileQ19dgcFC5FUYn70FlE81p
 sBjgveNpOqXVPKHwlgwIwLQzYtJWF4D+B52qfuEXUW3Cs1R57NoOdh7Pj8ublAV1K4stg+uPisU
 pydoxjpOe67YM9VR9IDj3SSpx5FQn0vlNRKEvbr+SjRdXBvfuSa9zSaH8nWvhB/hV8sPQROVYgO
 47zKtqEEmKfk8M0pLLPSyM7yCo6DWCJTmBUaamalEpfOCFmm46Wm56azjOimRk+oGGYpr//xt65
 r2YAye8WmKDFxWdS4a6qcjOYqae2+6x9GHgZ9o7+497ZvAZ9UI8+Uig7vXm3ZrHOlZd1STOfnLE
 4B/kcFPM5WFiDA9XECM8TI87tYRmj6FH1ZAWQq5/0RZQjEIN3M5GPCT9BhL+ogdIenR7XQo3t/K
 XZZKdHnRFQ6Z526xI273WiKsN0Sntv0A8nm2uIcmxn9lhNFQA0JXO1dA==
X-Received: by 2002:a05:600c:b86:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-4805d0643d0mr87738005e9.25.1769449423937; 
 Mon, 26 Jan 2026 09:43:43 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:43 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 20/27] hw/core/sysbus: implement FDT_GENERIC_MMAP_CLASS
 interface
Date: Mon, 26 Jan 2026 18:43:06 +0100
Message-ID: <20260126174313.1418150-21-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


