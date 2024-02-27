Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2543003ejf;
        Tue, 27 Feb 2024 00:40:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXLPENEXexm+0RIKV79AmXTkjahQ4oskb4JemEC+jowWVqovli2jxZw19d3lfzo/3itLRNbk/FqrXSBYUHTNo51XApTF3NG
X-Google-Smtp-Source: AGHT+IGuycLcmF4/MWTjpdTCJqjhMhoLjZmL14vQhZceAKnO8YVkpwgj5BpNseV1xcdYyvlTX5By
X-Received: by 2002:a05:620a:3723:b0:787:df32:5eb0 with SMTP id de35-20020a05620a372300b00787df325eb0mr1986581qkb.60.1709023223275;
        Tue, 27 Feb 2024 00:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023223; cv=none;
        d=google.com; s=arc-20160816;
        b=vtSkhPr1wKdB4px1YwgmFVEGlC9vbgnLGmI871KivI+n9Ees6OS1mHah/lZuprondN
         LN4KyTX+qdFm9hN8rorRXZ1YDb9yweP9koEQqk30THozZqllB2FqzmnmZ6nJGAZgXx27
         kkW9YhtX8yfm18zswrXyASDAzV7A0G1CDV/fVCCJOPHYCjjoOKmp1A7T+IWbgWCKaoCk
         iJuuxN6ymT24PWDpA57Sc38FtVVgzy3Z3P+oz0Oq2r4mtWWf/l0DWPnUHSyDGOZjoLHv
         7fiJqkOtVjFvgtQWGMwO9+o/xOtUe2gGQAfKMjkd8/4tBgJrlW9A9SdSmQZgEGLhWgra
         aYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VnEDXtHkt/194uNClzvCuVob3BL+zj1HTpnUIrcdYvs=;
        fh=a1DDHkKFBZAz1dQLvFUDCr//EeMxOvXPVl64jJ7n3JA=;
        b=aZBbQu6Pd6d/iYuhxQ7xjrZnArbuHA7Mm9kryYx7gMtl8X6PiIdwi3KCf0t9rMyrY9
         coilsYRQV0jeDO7KmzAH8LhM9ItCqnCQT2iunOq/fsGIA2SjwcL6n8Xlco4tqgVWTymY
         inhbCzW8tN/pim61oTsGvEZDytnwVYsfpIoL/+SBaOSM7kTMfNX4dADTqY8+7MdjtqzW
         ojWDgHpJ/xezSLjD41yDEzIC5RiJ03p4RnWE9NGFD/52F2qh77w1RroEPWin2zdLkkHF
         mI9mnbUhS50MH9rIGV3RRdx2Z5ufmHEGLEUYZhY1qqKKo878pIEZB0QyVgJFDzKN2Omw
         EBaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rf4ROqkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25-20020a05620a02f900b00787bed7b3dfsi6976199qko.266.2024.02.27.00.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rf4ROqkT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret0R-0005t1-Vj; Tue, 27 Feb 2024 03:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0Q-0005sL-48
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret0O-0007Q6-4o
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:40:05 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-412ad927275so2037555e9.3
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023203; x=1709628003; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VnEDXtHkt/194uNClzvCuVob3BL+zj1HTpnUIrcdYvs=;
 b=Rf4ROqkTvbsei6T97sud1aTVhEN/7e3cdHwmJ1gfjSVtpm/lM0ZihaH/J/wkjWikdq
 4aAJXNuzHCac9FF2XshYdabBcdTjEsDdUpLtK8fggCVO1REWdqfugiR8IKKeHm3dCflj
 JvtSFDqk2gZ5ZohW+fP+z+9OBfk6zfLXpmxYaUGSQyjrJGUXOV/tFi7/AxFpDaE1OGRR
 lSTD7PFcAEtRj4GsEYpY1fBjqS9QYfDIdrbxUmtyWaUIfwZbuhCPIUl5zi7kVmg+W/iK
 ZCJKiMBjBlElCePa20LgiH7qjSoKa8mwt3508thIllQ1KXDr6gC59zQiUSBU9JhR4LVV
 9JxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023203; x=1709628003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VnEDXtHkt/194uNClzvCuVob3BL+zj1HTpnUIrcdYvs=;
 b=CCWAwNQKBzlHd7PEvUy/O+oFqLUpAlfkPNC2z6PiYokPAcMlb4mMdEzrfIiEePPGmB
 NB6OT7m4JucMY5eDrWVuvznWHd6doRjW9aEVrBBcQ8eHyXviFpwUeqWKQz0OXHRPID3L
 MA8cx3RrnVz/81LWekxmoxFxCh9b5uwTy/Fv/9VeXxU2R2ZC11UHPsNJoHiM2u8dYpR+
 NhTeia4wftpc+dftrhls3AtVHgBaqsunLz7kqYEHFjxuPVtwFkpg/qQFs6001RFnUJxF
 WyHw/H4pzjOXss9UXIsFxIQRMAKVrLZiF9mVg0jAC2SSHFXlrwv4RMs4AbA5J3Kltt2g
 vF1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVg2/EL2uu2swglf5/ioh9diQMFgAqfl94w3scR+gtlsBLOCVDb8FEvGgyuk5pq01gi07ngWL3+njXv7szR2Wzj3Swa
X-Gm-Message-State: AOJu0YzwkGxNx/HjpBysjBEw2TePMncCCNxyeZlmt+9Lx7D+//wGVlCs
 2gKsyW2DkIR/E6jSrGXvCAiYsaSUPGATTLJTc4h4lp70xDpccywsRqTfHBLxOOA=
X-Received: by 2002:a05:6000:1816:b0:33d:f51f:2d9f with SMTP id
 m22-20020a056000181600b0033df51f2d9fmr146659wrh.44.1709023202800; 
 Tue, 27 Feb 2024 00:40:02 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a5d6f19000000b0033da430f286sm10910899wrb.69.2024.02.27.00.40.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:40:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/30] hw/display/pl110: Pass frame buffer memory region as
 link property
Date: Tue, 27 Feb 2024 09:39:18 +0100
Message-ID: <20240227083948.5427-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Fb68LM/DhIxm

Add the PL110::'framebuffer-memory' property. Have the different
ARM boards set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240226173805.289-3-philmd@linaro.org>
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

