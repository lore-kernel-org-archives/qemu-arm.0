Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp2140159dlb;
        Tue, 18 Oct 2022 14:08:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM50nLjvTJyVZhWnfAp7CoRAlcNI3IaypMlzBY0wIN3hfeOzsj/e/jYsPuz8bYUHd1a3G9v4
X-Received: by 2002:a05:6214:1cc2:b0:4af:891b:4e75 with SMTP id g2-20020a0562141cc200b004af891b4e75mr3769094qvd.30.1666127313608;
        Tue, 18 Oct 2022 14:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666127313; cv=none;
        d=google.com; s=arc-20160816;
        b=zW66dzsOka79BsjEArcZ2DCvqhvxvyjgppRlZRkcmnwvb/iXlUy+MAr1cxZhkcn/cf
         CsBe8rgl4JBvw1lqDD7lUJC8jcJmQXITCQBg3b0z/Uyz/LQbTjZ4oPOq6/i2AOYWl64t
         QoHsI10cGhBdvUlFTiAlSETZ7PeXOuZDTG2vQ/2Sn4zkKBSEpouYcFH6Gr9/+PwB+NBe
         2wZ22/JJoSmkoXjA7OKySWgFALM/nbOvoRX3oPtsK9i47q01akW1R/fL8xlc4i6+swho
         QuT/k1FFNHFwlX3KrJSdjo9p+5fKFiLszRoVd++zkUKLLMiYPvSDaIWNHegDI4mKMmS1
         UnEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=awrtEx6lNzPeVR73OK8TlTSiRZDQLC6LH5GaZ6uBKFI=;
        b=Im6D0/waQZ5JhWs2sodPX0O0Htjx3gMdxOE1/DHAAZzGnVSugzr5qvjkIguNaJG/xK
         rC5uIOZVWw+FYoIpeH/ufJxYlVLfBxyfY34VQU1B0sUa/pXbe9HCvSi2kjR97iv6lVzm
         HGSHFlaq+hq/BIcN7b+PBh39JaQ8mXElmFzdhObHZ6vWcymZ/Z5FR0nT3GwJyTcsQMCP
         5iBt3Yg07svoRcHDYPcYh5/OsOyOfOoBCLuti5d9uj50tRdc98jiX7Wm7VJ6I/yoQhUc
         3szrGOj/CmFsj0gW6HreQy7FRxsGBxjjGDTct0uvMVppemcEcARIvpC/16gyq2SbdrJS
         5/Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VAkGWLSG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19-20020ac840d3000000b0039cd0b5a0absi8976853qtm.250.2022.10.18.14.08.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 14:08:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=VAkGWLSG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oktpB-0002WQ-0I
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 17:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktja-00022S-9x; Tue, 18 Oct 2022 17:02:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oktjX-0003wQ-TK; Tue, 18 Oct 2022 17:02:45 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bj12so35297017ejb.13;
 Tue, 18 Oct 2022 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=awrtEx6lNzPeVR73OK8TlTSiRZDQLC6LH5GaZ6uBKFI=;
 b=VAkGWLSGbSHApPaBD/RRXwHNNCxjVl/e/Blu7oIsShNNHV79hA/ur6N+CQMCVvxuYC
 SUDKl8RuAvJ9wLl59jJBYDtVoR7jm7sngVKIv14krqdRt1OoyQ9ThXCCP+YnGrr98/+r
 Ac3TT0iFiAV86ib+E6Cy/C+wGKciBR4eftknxeP8lR1qB3hYj7CKgGttzPIACU/bqrIo
 hSvBCm4Gt4fZekvHgPcpDi8AYWv6n7drEVTF6hT7th8YjKMpl7Be2OTCFStoYNdUBqeX
 WKZ/vb6G3ZFxlmcXvQqYLMmC6xN+DYYiddoW+hutsumURDMiK3Di6oRxR76NgAZUqX9i
 8CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=awrtEx6lNzPeVR73OK8TlTSiRZDQLC6LH5GaZ6uBKFI=;
 b=sjDcuM/JY4AZiS79GZmS51SLPVDZTmyyHTJ/iOvZf/rFR+Tp7qAl9vuYPxgoFfZpzR
 MxSK0KsD7omVDZtt1zmRfwg0zvMiL6cMd6WnMYTGd/Q9yJSjmlOJs2GRBF9DZS/rovZ4
 2jFYQQuWE/tLfZ8UAdNU1cSlY/DMn5rSgP865rFi7jbOCNCPBjIhzMoc4UNsVNEj1VLE
 Yo709J7SjJmMz3WXPKzxrTiNS6paoAh1gIgh5WYxz4sZD2ZIV1D8yfxRRrZOQMW3RM+D
 7IlRtaxp25DZyZlsghyEQAbveeq9iTQau3UMXOBbFnQwzpUbSq3Ca3jszr0ld8ydhbLJ
 Rb1g==
X-Gm-Message-State: ACrzQf3QFGExotMBXEavIyJ4zWPYWUzG4Ariwk2pa2ocBkIiDq9paH3s
 rWs5/nfg9gD9gAncp+Pf6si89ebGYVU=
X-Received: by 2002:a17:907:8a24:b0:78d:cd60:1022 with SMTP id
 sc36-20020a1709078a2400b0078dcd601022mr3987985ejc.384.1666126960934; 
 Tue, 18 Oct 2022 14:02:40 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-012-048.78.54.pool.telefonica.de. [78.54.12.48])
 by smtp.gmail.com with ESMTPSA id
 fe7-20020a056402390700b004587c2b5048sm9407951edb.52.2022.10.18.14.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 14:02:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
Date: Tue, 18 Oct 2022 23:01:44 +0200
Message-Id: <20221018210146.193159-6-shentey@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018210146.193159-1-shentey@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YcSdBE17I7+n

Allows e500 boards to have their root file system reside on flash using
only builtin devices located in the eLBC memory region.

Note that the flash memory area is only created when a -pflash argument is
given, and that the size is determined by the given file. The idea is to
put users into control.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 16 ++++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 7b5eb3c4ee..38f8ceb0cf 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
 .. code-block:: bash
 
   -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
+
+Root file system on flash drive
+-------------------------------
+
+Rather than using a root file system on ram disk, it is possible to have it on
+CFI flash. Given an ext2 image whose size must be a power of two, it can be used
+as follows:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
+      -append "rootwait root=/dev/mtdblock0"
+
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 791fe78a50..769a1ead1c 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -126,6 +126,7 @@ config E500
     select ETSEC
     select GPIO_MPC8XXX
     select OPENPIC
+    select PFLASH_CFI01
     select PLATFORM_BUS
     select PPCE500_PCI
     select SERIAL
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 3e950ea3ba..73198adac8 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -23,8 +23,10 @@
 #include "e500-ccsr.h"
 #include "net/net.h"
 #include "qemu/config-file.h"
+#include "hw/block/flash.h"
 #include "hw/char/serial.h"
 #include "hw/pci/pci.h"
+#include "sysemu/block-backend-io.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
@@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
     }
 }
 
+static void create_devtree_flash(SysBusDevice *sbdev,
+                                 PlatformDevtreeData *data)
+{
+    g_autofree char *name = NULL;
+    uint64_t num_blocks = object_property_get_uint(OBJECT(sbdev),
+                                                   "num-blocks",
+                                                   &error_fatal);
+    uint64_t sector_length = object_property_get_uint(OBJECT(sbdev),
+                                                      "sector-length",
+                                                      &error_fatal);
+    uint64_t bank_width = object_property_get_uint(OBJECT(sbdev),
+                                                   "width",
+                                                   &error_fatal);
+    hwaddr flashbase = 0;
+    hwaddr flashsize = num_blocks * sector_length;
+    void *fdt = data->fdt;
+
+    name = g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 1, flashbase, 1, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
+}
+
 static void platform_bus_create_devtree(PPCE500MachineState *pms,
                                         void *fdt, const char *mpic)
 {
@@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
     uint64_t addr = pmc->platform_bus_base;
     uint64_t size = pmc->platform_bus_size;
     int irq_start = pmc->platform_bus_first_irq;
+    SysBusDevice *sbdev;
+    bool ambiguous;
 
     /* Create a /platform node that we can put all devices into */
 
@@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
     /* Loop through all dynamic sysbus devices and create nodes for them */
     foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
 
+    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
+                                                    &ambiguous));
+    if (sbdev) {
+        assert(!ambiguous);
+        create_devtree_flash(sbdev, &data);
+    }
+
     g_free(node);
 }
 
@@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
     IrqLines *irqs;
     DeviceState *dev, *mpicdev;
+    DriveInfo *dinfo;
     CPUPPCState *firstenv = NULL;
     MemoryRegion *ccsr_addr_space;
     SysBusDevice *s;
@@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
                                 pmc->platform_bus_base,
                                 &pms->pbus_dev->mmio);
 
+    dinfo = drive_get(IF_PFLASH, 0, 0);
+    if (dinfo) {
+        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+        BlockDriverState *bs = blk_bs(blk);
+        uint64_t size = bdrv_getlength(bs);
+        uint64_t mmio_size = pms->pbus_dev->mmio.size;
+        uint32_t sector_len = 64 * KiB;
+
+        if (!is_power_of_2(size)) {
+            error_report("Size of pflash file must be a power of two.");
+            exit(1);
+        }
+
+        if (size > mmio_size) {
+            error_report("Size of pflash file must not be bigger than %" PRIu64
+                         " bytes.", mmio_size);
+            exit(1);
+        }
+
+        if (!QEMU_IS_ALIGNED(size, sector_len)) {
+            error_report("Size of pflash file must be a multiple of %" PRIu32
+                         ".", sector_len);
+            exit(1);
+        }
+
+        dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_drive(dev, "drive", blk);
+        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
+        qdev_prop_set_uint64(dev, "sector-length", sector_len);
+        qdev_prop_set_uint8(dev, "width", 2);
+        qdev_prop_set_bit(dev, "big-endian", true);
+        qdev_prop_set_uint16(dev, "id0", 0x89);
+        qdev_prop_set_uint16(dev, "id1", 0x18);
+        qdev_prop_set_uint16(dev, "id2", 0x0000);
+        qdev_prop_set_uint16(dev, "id3", 0x0);
+        qdev_prop_set_string(dev, "name", "e500.flash");
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
+                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
+    }
+
     /*
      * Smart firmware defaults ahead!
      *
-- 
2.38.0

