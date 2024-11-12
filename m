Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7535829njc;
        Tue, 12 Nov 2024 10:14:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUYMaH8rb29u/3fptFLgUxQacH0Ldbl1OHsRAT/mXmh10QOn+QPlKUwH5XoOD0/xzeO4UzhZ79rmZ9xg==@linaro.org
X-Google-Smtp-Source: AGHT+IEYul5FZqFzAzcjOwnrTKRTpzwZ8yFopaC5eAUJlLnWjL8K3DRsqv+KFKaWMWatia8i7aD/
X-Received: by 2002:ac8:58c3:0:b0:460:a9da:42b8 with SMTP id d75a77b69052e-463401d2956mr41205171cf.22.1731435258374;
        Tue, 12 Nov 2024 10:14:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435258; cv=none;
        d=google.com; s=arc-20240605;
        b=hXCrTMOxzyQABJadBmqBfr+7sceADIBl1JBuHegCSHqxSpg9tZ1O6ZsNPCfccwxXiU
         vsurSIdcqBijXuNsDZYvE6qhDDi9zBU6CBgGLA/zBg73YysY7RetEDdlLtgAMbxIO9cO
         LbzPARkCIogK6N4rZBSZ/gTtszFzXAjZPXc/ZkDfy0roGlUcJCbJAiz6M+HV1nRAMAse
         iKuPIIqOJCeAEfNGyQ78pFZrmafz4C9Vbup0ls1J5p75Eq0SGk0rX3Y9OypjFjNW9zcC
         Hk+tYfuZariAYz/LbraMP4COPaJCkXQQj3ICcafICtRqhTf7lJTcoKLwo9fHlBylj1qA
         iBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2SAvDiAsNxCj5xV4d5IUtJExFxHe3WGoYxScpi/ms1o=;
        fh=vGdUaV30XD/sZ4XBSUd4gKz36zVgUQ92GaNLqYHNLe0=;
        b=CcEpx5rzwRduVQrscnf5N8uGyv1XSJ/7cptzy4+EeSqU4ldvc7fbPPVYaYoaKg9fZ8
         gwdOXgWpnCe/tyewL1lh+GLNYnWSlubAxq1bRLkuhOeCSBz7nHpVpZ2k1Kw7EVi/CgvE
         P25VrVQ2ZrjInOSJj4Fk9sqgKzuisS//TT+O/UdyxFw+qlANodXU1lk4MZEJpD6Jik99
         0jMcG9M46ExoW23VIu5PYjccKKHaEqTTD7w2ZN8LCXCPXGnQaqmXzDGQxvsgM4ajhnJx
         5chAu3QuPRHq8YAcOs0Mt96ApVrC3l9blAEnnPgSepoy5Dq1Z24nLwO3FGlbTk3p51ES
         f8hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1I3AWgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff40f00esi135888471cf.20.2024.11.12.10.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:14:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1I3AWgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvNz-0008HB-Gx; Tue, 12 Nov 2024 13:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNg-0007rR-9s
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:48 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvNe-00024R-64
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:12:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so47591605e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435164; x=1732039964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2SAvDiAsNxCj5xV4d5IUtJExFxHe3WGoYxScpi/ms1o=;
 b=b1I3AWgJ8fZn9s7dnxtsfBRIdMykYkIzM62I+GwT0GqtXyvIaxGRwhLLlwEJy1DSg5
 BAWWd7PN4k5QSLgh28FGcZlC1N3TxjZweX/El6gdgC8utqyYnsShNdUMEQMNrJ2DF3qL
 59uAVWo6a52TDWeHEespyTR/u4afsWUWrM+5KbN6sZXgdBBq8vWqUsKaxmtNMx49co4u
 0VCWOqDP1j15Vdmt/mNL4fQxNrd4LSyJCpM2zsFZ+SWPCjdUiFDgCsXZhbGCtSl3r+oq
 chFlyud50KLv6wugtZC99zcfAtEJMkYyr47Eck/k9eJdQiLFfEFkckyFjqN+BZvauqvh
 FZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435164; x=1732039964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SAvDiAsNxCj5xV4d5IUtJExFxHe3WGoYxScpi/ms1o=;
 b=ISkzUiuJKA+i2okWpqXHK7KeZlAJPctBod3IpBFSjpUmBm814wMAtOkQtp81DXwc7m
 q5o2hGkwOeMgUZKxyBy2Ghi1Oge6WN7zl6xX4vzB+unLYxJ3Nn3XMB+qeT4cwdAEUWZy
 liwaDk9ovM288yxzOOCTxv2ORE2jq+VHrEKFCnjvgZIKgDbtYNBFs86dsC3EsULh7Zyo
 xJ0SjqrLiBEmLFaVL2F5i06wzRv0q8UKc53KXvH9JRcBL6bVXKcYxoCVUymHFHT2q8a8
 mSgNCI4UTqplQQOKJoLfoAeTSW/mFtS0ORJc0XbK32XHeRmImQ4+eimDISn+oG6un1JI
 UZHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7HEWwp7D5+Q3BKD4lfeQ8K/6Bq2lV+JDwlyAqgs0qjOYOEuEGqOtXOc05go/C1VOutWJAW94W1A==@nongnu.org
X-Gm-Message-State: AOJu0Yz1/yshSsCCnEWgQ5YFJJav8DkB/hHSCzoghaBblX4hqCjTdaN9
 i4jJs5L1pcq96IUC/dAQZC7igk8cIg0HhxSzUNe0w6oZiyjEBfadMNvMOimZD/E=
X-Received: by 2002:a05:600c:1c15:b0:42c:a580:71cf with SMTP id
 5b1f17b1804b1-432b751e27cmr148068795e9.30.1731435163019; 
 Tue, 12 Nov 2024 10:12:43 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6bee9asm260965995e9.19.2024.11.12.10.12.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:12:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/20] hw/net/xilinx_ethlite: Map the RAM buffer as RAM memory
 region
Date: Tue, 12 Nov 2024 19:10:43 +0100
Message-ID: <20241112181044.92193-20-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mK8Sr+uWCdwz

Rather than using I/O registers for RAM buffer, having to
swap endianness back and forth (because the core memory layer
automatically swaps endiannes for us), declare the buffers
as RAM regions. Remove the now unused s->regs[] array.

The memory flat view becomes:

  FlatView #0
   Root memory region: system
    0000000081000000-00000000810007f3 (prio 0, ram): ethlite.tx[0]buf
    00000000810007f4-00000000810007ff (prio 0, i/o): ethlite.tx[0]io
    0000000081000800-0000000081000ff3 (prio 0, ram): ethlite.tx[1]buf
    0000000081000ff4-0000000081000fff (prio 0, i/o): ethlite.tx[1]io
    0000000081001000-00000000810017f3 (prio 0, ram): ethlite.rx[0]buf
    00000000810017fc-00000000810017ff (prio 0, i/o): ethlite.rx[0]io
    0000000081001800-0000000081001ff3 (prio 0, ram): ethlite.rx[1]buf
    0000000081001ffc-0000000081001fff (prio 0, i/o): ethlite.rx[1]io

Mention the device datasheet in the file header.

Reported-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 79 +++++++++++------------------------------
 1 file changed, 20 insertions(+), 59 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index f681b91769..da453465ca 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -2,6 +2,10 @@
  * QEMU model of the Xilinx Ethernet Lite MAC.
  *
  * Copyright (c) 2009 Edgar E. Iglesias.
+ * Copyright (c) 2024 Linaro, Ltd
+ *
+ * DS580: https://docs.amd.com/v/u/en-US/xps_ethernetlite
+ * LogiCORE IP XPS Ethernet Lite Media Access Controller
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -27,7 +31,6 @@
 #include "qemu/bitops.h"
 #include "qom/object.h"
 #include "qapi/error.h"
-#include "exec/tswap.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -46,7 +49,6 @@
 #define A_RX_BASE0    0x17fc
 #define R_RX_BUF1     (0x1800 / 4)
 #define A_RX_BASE1    0x1ffc
-#define R_MAX         (0x2000 / 4)
 
 #define RX_BUFSZ_MAX  0x07e0
 
@@ -72,6 +74,8 @@ typedef struct XlnxXpsEthLitePort
 {
     MemoryRegion txio;
     MemoryRegion rxio;
+    MemoryRegion txbuf;
+    MemoryRegion rxbuf;
 
     struct {
         uint32_t tx_len;
@@ -100,7 +104,6 @@ struct XlnxXpsEthLite
 
     UnimplementedDeviceState mdio;
     XlnxXpsEthLitePort port[2];
-    uint32_t regs[R_MAX];
 };
 
 static inline void eth_pulse_irq(XlnxXpsEthLite *s)
@@ -118,16 +121,12 @@ static unsigned addr_to_port_index(hwaddr addr)
 
 static void *txbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
 {
-    unsigned int rxbase = port_index * (0x800 / 4);
-
-    return &s->regs[rxbase + R_TX_BUF0];
+    return memory_region_get_ram_ptr(&s->port[port_index].txbuf);
 }
 
 static void *rxbuf_ptr(XlnxXpsEthLite *s, unsigned port_index)
 {
-    unsigned int rxbase = port_index * (0x800 / 4);
-
-    return &s->regs[rxbase + R_RX_BUF0];
+    return memory_region_get_ram_ptr(&s->port[port_index].rxbuf);
 }
 
 static uint64_t port_tx_read(void *opaque, hwaddr addr, unsigned int size)
@@ -252,53 +251,6 @@ static const MemoryRegionOps eth_portrx_ops = {
         },
 };
 
-static uint64_t
-eth_read(void *opaque, hwaddr addr, unsigned int size)
-{
-    XlnxXpsEthLite *s = opaque;
-    uint32_t r = 0;
-
-    addr >>= 2;
-
-    switch (addr)
-    {
-        default:
-            r = tswap32(s->regs[addr]);
-            break;
-    }
-    return r;
-}
-
-static void
-eth_write(void *opaque, hwaddr addr,
-          uint64_t val64, unsigned int size)
-{
-    XlnxXpsEthLite *s = opaque;
-    uint32_t value = val64;
-
-    addr >>= 2;
-    switch (addr) 
-    {
-        default:
-            s->regs[addr] = tswap32(value);
-            break;
-    }
-}
-
-static const MemoryRegionOps eth_ops = {
-    .read = eth_read,
-    .write = eth_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4
-    }
-};
-
 static bool eth_can_rx(NetClientState *nc)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
@@ -354,6 +306,9 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
 {
     XlnxXpsEthLite *s = XILINX_ETHLITE(dev);
 
+    memory_region_init(&s->mmio, OBJECT(dev),
+                       "xlnx.xps-ethernetlite", 0x2000);
+
     object_initialize_child(OBJECT(dev), "ethlite.mdio", &s->mdio,
                            TYPE_UNIMPLEMENTED_DEVICE);
     qdev_prop_set_string(DEVICE(&s->mdio), "name", "ethlite.mdio");
@@ -363,6 +318,10 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
                             sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->mdio), 0));
 
     for (unsigned i = 0; i < 2; i++) {
+        memory_region_init_ram(&s->port[i].txbuf, OBJECT(dev),
+                               i ? "ethlite.tx[1]buf" : "ethlite.tx[0]buf",
+                               0x07f4, &error_abort);
+        memory_region_add_subregion(&s->mmio, 0x0800 * i, &s->port[i].txbuf);
         memory_region_init_io(&s->port[i].txio, OBJECT(dev),
                               &eth_porttx_ops, s,
                               i ? "ethlite.tx[1]io" : "ethlite.tx[0]io",
@@ -370,6 +329,11 @@ static void xilinx_ethlite_realize(DeviceState *dev, Error **errp)
         memory_region_add_subregion(&s->mmio, i ? A_TX_BASE1 : A_TX_BASE0,
                                     &s->port[i].txio);
 
+        memory_region_init_ram(&s->port[i].rxbuf, OBJECT(dev),
+                               i ? "ethlite.rx[1]buf" : "ethlite.rx[0]buf",
+                               0x07f4, &error_abort);
+        memory_region_add_subregion(&s->mmio, 0x1000 + 0x0800 * i,
+                                    &s->port[i].rxbuf);
         memory_region_init_io(&s->port[i].rxio, OBJECT(dev),
                               &eth_portrx_ops, s,
                               i ? "ethlite.rx[1]io" : "ethlite.rx[0]io",
@@ -390,9 +354,6 @@ static void xilinx_ethlite_init(Object *obj)
     XlnxXpsEthLite *s = XILINX_ETHLITE(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
-
-    memory_region_init_io(&s->mmio, obj, &eth_ops, s,
-                          "xlnx.xps-ethernetlite", R_MAX * 4);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
 }
 
-- 
2.45.2

