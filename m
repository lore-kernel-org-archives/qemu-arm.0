Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2203743ejf;
        Mon, 26 Feb 2024 09:39:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAeGwgegEy3qP1EmvyKfeBz8ShFi1I3i7v4b8RMlY8oaHTQ9SLq4JigQLRKkMaG/TMfvg0h9ie0RFzalDk6KGx/cnj/9wW
X-Google-Smtp-Source: AGHT+IEthFooi7m/pnSJC1OCwbnAyNoT5cMh14NGo/09z2d5YORSYqG8N+cBQbLlgUn5UmScXQjg
X-Received: by 2002:a05:6808:13c3:b0:3c1:78a7:993a with SMTP id d3-20020a05680813c300b003c178a7993amr10397218oiw.46.1708969165259;
        Mon, 26 Feb 2024 09:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708969165; cv=none;
        d=google.com; s=arc-20160816;
        b=fPMOXsAi7b2i2c/Eeq/k761pwJB0edVzoHSqnJG1QXLT9w1wOJyYzQTaMFvhfFXjsG
         WwYg41PPYkt+kbHZPCjSoqScIwXqoiPaUOkfPcP9F9qTdGpPfbNf5iUFYw31B5RxMoR5
         Vuh9kPaf50rNDl8lDRZ4G7zkdWrnQtuyYcNB2S3G1oWWg/dZfY1dJ4XLzswKv9KZk+ij
         0dL64kvLsxWbM66pZtw/SVNHfUaEewSa8cGKYAYbHJoPqlupYjVNDq0Eq/Qb8FMALXUh
         i+ZmkdAuA9IhxWzpz+jPrBCtZTiA2xP4+NtZQU+/y2I0DfISJjO09niMFL/j1IxbEAm5
         vx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HOtPbIv+bN4xewQdXjZPgqbIWit4/WmbOrW33B3V7po=;
        fh=nvo5RjCIyzrsfNZsFyc8KAYF9iiDE6P73sa+fgZTnCQ=;
        b=oYIfWwVoClFFD9ogJOk/yF4Vs3rXj6ot6UHcq9vzt7cDhWHFMezUWvrecWuSDr+CyG
         T98/YariI7AvZENNQ92mxv1l7mKLl1PS2b+F8FuTQHAYKob0I9CZjtljej9UGrvEA5ho
         MCzsg61xO6H9iwm8NTsZquCuwOFFXjTtLqgiveyn7XhVwNNrVSGmQAzqh7v/3XHw6jOm
         DcGKH2I6kvO2bODXZ7+Z5y59nkCEwQoVrozamndpibQtdbIdhnyHpw5ZYv6VMxjlYjpz
         5GNIUXJDy1q59+VH7Mxq7x4PgVqY4N/lER7XFk6UTKg11jChXz8nCAEqPGUf2RHpu703
         Oalw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMKmZlIU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv4-20020ad44ee4000000b0068fe7f88fa3si5583896qvb.499.2024.02.26.09.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 09:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMKmZlIU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reew5-0004De-Kq; Mon, 26 Feb 2024 12:38:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevo-0003yx-JD
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 12:38:25 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reevl-000775-GX
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 12:38:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33dd2f0a0c4so993154f8f.0
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708969098; x=1709573898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOtPbIv+bN4xewQdXjZPgqbIWit4/WmbOrW33B3V7po=;
 b=IMKmZlIURxNnQV9sRdtLNlZd+J8f/BYh5OKxdkUsIqs3doT7evRK4at5cHJevIijOj
 tCOzvY4IDMFpInJs4eeC9Vxj2dyCDC8/wX1h25FiQHwaqb4mDydkKcgnNM39Pbn6ZJzH
 y6xor66iya8shFHQIxexdIc3Ayedb4V5Fo/LCos60s30dshtjDQZLNKgRRO+w6hTHvGa
 OTwceHeHVpB/ioCFYHPayMGoa0OnnVCd+rWrTRiKeunP3Y9viCmsUmXekc/XP3/T06TD
 VhgIiH0MiN5LlECWuRgyIIxtmCJMQQWEwhbYG3X3gpSk/KU0MyRF4lVtMB9m90BDyWo6
 J4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708969098; x=1709573898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOtPbIv+bN4xewQdXjZPgqbIWit4/WmbOrW33B3V7po=;
 b=Ge43yKilhnVfTpMWcDymNBUSXZb6A1f0NpB70U6xVkGAs+c/5innisAn+YA3TqXgh9
 qjkTPIQDJDe69kHvUU1ilXf6hjrE35qLVDf2EIoEe9LksUf3Cqt460snfq1WjelYx9J3
 cjrsQzP3ughsDdethFhlZ7JoBDX5ZJzMguL9nGp0vaaldZVsyRwOCyWuivPYpwuwr5xR
 dOPT3W+BDS87LIfLy2h0SsuX/D2Hj6nL4h1GmzLGtIbWei8FWhekl4yWHEEXZcPY4dvs
 KriJRyp/d+cS+7HoEp+MInBmNxQ3vBnY6q1VfrBbHL03K1DJ7R1HyfhybrjAazrJH6XF
 CI8w==
X-Gm-Message-State: AOJu0YyWTrJTEEDIPObR+ATpknAuW/XQ7AMtkPEtsW9SEADmadOt8YkN
 p0+knh5xymtz5DqcMPp2d75bxzy3NAd4Fp1cvFCcImDTXuZs4nI+bd7e8EB57Vv5e/O4xNp5oqC
 Q
X-Received: by 2002:a5d:5048:0:b0:33d:6309:75a with SMTP id
 h8-20020a5d5048000000b0033d6309075amr5037247wrt.67.1708969098709; 
 Mon, 26 Feb 2024 09:38:18 -0800 (PST)
Received: from m1x-phil.lan ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 g7-20020adfe407000000b0033d2ae84fafsm8819797wrm.52.2024.02.26.09.38.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 09:38:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/6] hw/display/pl110: Pass frame buffer memory region as
 link property
Date: Mon, 26 Feb 2024 18:38:00 +0100
Message-ID: <20240226173805.289-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226173805.289-1-philmd@linaro.org>
References: <20240226173805.289-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0yTI3k8avfar

Add the PL110::'framebuffer-memory' property. Have the different
ARM boards set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/integratorcp.c |  2 ++
 hw/arm/realview.c     |  2 ++
 hw/arm/versatilepb.c  |  2 ++
 hw/arm/vexpress.c     |  5 +++++
 hw/display/pl110.c    | 20 ++++++++++++++++----
 5 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 5b002da350..feb0dd63df 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -671,6 +671,8 @@ static void integratorcp_init(MachineState *machine)
     }
 
     dev = qdev_new("pl110");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(address_space_mem), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xc0000000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[22]);
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 77300e92e5..b186f965c6 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -239,6 +239,8 @@ static void realview_init(MachineState *machine,
     gpio2 = sysbus_create_simple("pl061", 0x10015000, pic[8]);
 
     dev = qdev_new("pl111");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(sysmem), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[23]);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 7e04b23af8..d48235453e 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -300,6 +300,8 @@ static void versatile_init(MachineState *machine, int board_id)
     /* The versatile/PB actually has a modified Color LCD controller
        that includes hardware cursor support from the PL111.  */
     dev = qdev_new("pl110_versatile");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(sysmem), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10120000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[16]);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 671986c21e..de815d84cc 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -299,6 +299,9 @@ static void a9_daughterboard_init(VexpressMachineState *vms,
 
     /* 0x10020000 PL111 CLCD (daughterboard) */
     dev = qdev_new("pl111");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(sysmem), &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0x10020000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[44]);
 
@@ -654,6 +657,8 @@ static void vexpress_common_init(MachineState *machine)
     /* VE_COMPACTFLASH: not modelled */
 
     dev = qdev_new("pl111");
+    object_property_set_link(OBJECT(dev), "framebuffer-memory",
+                             OBJECT(sysmem), &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, map[VE_CLCD]);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[14]);
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 4b83db9322..7f145bbdba 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
 #include "framebuffer.h"
@@ -17,6 +18,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 
 #define PL110_CR_EN   0x001
@@ -74,6 +76,7 @@ struct PL110State {
     uint32_t palette[256];
     uint32_t raw_palette[128];
     qemu_irq irq;
+    MemoryRegion *fbmem;
 };
 
 static int vmstate_pl110_post_load(void *opaque, int version_id);
@@ -210,7 +213,6 @@ static int pl110_enabled(PL110State *s)
 static void pl110_update_display(void *opaque)
 {
     PL110State *s = (PL110State *)opaque;
-    SysBusDevice *sbd;
     DisplaySurface *surface = qemu_console_surface(s->con);
     drawfn fn;
     int src_width;
@@ -222,8 +224,6 @@ static void pl110_update_display(void *opaque)
         return;
     }
 
-    sbd = SYS_BUS_DEVICE(s);
-
     if (s->cr & PL110_CR_BGR)
         bpp_offset = 0;
     else
@@ -290,7 +290,7 @@ static void pl110_update_display(void *opaque)
     first = 0;
     if (s->invalidate) {
         framebuffer_update_memory_section(&s->fbsection,
-                                          sysbus_address_space(sbd),
+                                          s->fbmem,
                                           s->upbase,
                                           s->rows, src_width);
     }
@@ -535,11 +535,22 @@ static const GraphicHwOps pl110_gfx_ops = {
     .gfx_update  = pl110_update_display,
 };
 
+static Property pl110_properties[] = {
+    DEFINE_PROP_LINK("framebuffer-memory", PL110State, fbmem,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void pl110_realize(DeviceState *dev, Error **errp)
 {
     PL110State *s = PL110(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
+    if (!s->fbmem) {
+        error_setg(errp, "'framebuffer-memory' property was not set");
+        return;
+    }
+
     memory_region_init_io(&s->iomem, OBJECT(s), &pl110_ops, s, "pl110", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
@@ -577,6 +588,7 @@ static void pl110_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->vmsd = &vmstate_pl110;
     dc->realize = pl110_realize;
+    device_class_set_props(dc, pl110_properties);
 }
 
 static const TypeInfo pl110_info = {
-- 
2.41.0

