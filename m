Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1307164ejb;
        Fri, 16 Feb 2024 07:35:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2ghB2gWR7sCyEhiCAXzsr2KmQOIs4hQdlYkFVXVRQ3hUWuV6w8Nuyv7xHTNO+MVK8sV7BKWfBLqgsZuveG3zWSX2OKHf8
X-Google-Smtp-Source: AGHT+IFooPtDnR+X8tIGVHwUsV3JYw9AlZiW2LTxoZQfTfhRadazVOR4IWlsaWSUnETH/PpbVzNf
X-Received: by 2002:a05:622a:4cd:b0:42c:8135:8632 with SMTP id q13-20020a05622a04cd00b0042c81358632mr6051583qtx.2.1708097746344;
        Fri, 16 Feb 2024 07:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708097746; cv=none;
        d=google.com; s=arc-20160816;
        b=AUMYBaLGHzc/JdWl/kn86YNnjo1hgDNV0Z5B1p7ouXIMr//V6QUoGkHuN8qZph6F29
         HJHIs7a2b+cQ+OsJPUcJ8SBhV5h40qd/CJ59eqqu7sEojxvf2dZBergQMUEpDkXO2VeC
         CUC3j9Ur0HoVUsNt46oK4R8TCa+p3LpiacK5x3TeVodgOcY823STnU/hgNrexc/6+Od6
         W6fPr5/4PHJiOyJkKqXhPeBi0DPr1gKDOVp0Ecxkl4L42p9QKpojcw715i9g8JPSB+Md
         vus6X7by4nHMBMI8gE9SboFao7A3W9+S312I9ab0jKIVXwiNlLfjGJ/e6Q+jEkQJE5Pc
         z3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wZ1SK8UcIGNjoS5oUCJZaLlSaFI2o9jBSpbbsKbpCUU=;
        fh=EJjC/oGJrM2epHG02yEmeK3N/lqZVhv/PgF8v8FkfEw=;
        b=vlb4W9zBsxgQja9OxZ7J+jI33e8yrldYgrVvCJb5tDArO8Tg//aLMWQhUJtofI9Mvg
         UVaHJZwR+DfNtk2WuwNWmKG7okMQlcjQodl96rf9rjUFU+hh27D8wjjNBlg0P2podjfD
         bP7C7v4gXtMqjf4b+faSkZl+VIHQM6nQ6ai1FCLMRUp3s2btTZYjV1pKT1hfQ0ixBEQx
         nYVJ6hLm8pQIuLn91URG2B+9DYyN33KCKOWgjLF5se8NzORp6IrAxYlCTlDqfadrijiz
         8gRY8JhV5CCO+WfDpQWzCHkSuuyXVFGGMOkUzgKfdfp/jPq8reKVRzIn9hTbuNwhmVhi
         rreQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNuSANL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05622a15c300b0042c56d61276si58731qty.351.2024.02.16.07.35.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 07:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CNuSANL2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rb0FX-00045z-4x; Fri, 16 Feb 2024 10:35:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0FV-00044b-IL
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:38 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rb0FS-0008BD-Ew
 for qemu-arm@nongnu.org; Fri, 16 Feb 2024 10:35:37 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3122b70439so257176466b.3
 for <qemu-arm@nongnu.org>; Fri, 16 Feb 2024 07:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708097733; x=1708702533; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZ1SK8UcIGNjoS5oUCJZaLlSaFI2o9jBSpbbsKbpCUU=;
 b=CNuSANL2Eops5l//6bnMB1f2GchJ+D5MDNthI3t2EeyRdclohcB98lzc2IWbt9q6Bj
 c7nO6O9sViqemSNMKvb11m/VMLi/8J1ZwQcQjbJfhkh+F2goYi+zJNSzTxMkwRkk89x9
 UaFfYjlH4MHJ10BUPT9FFyG3+jxTPxW6nNbtoLAZI/sv6OuM9Ml44qjiyKnOrn1THhHH
 MPTnbUqGZPbO8cRlUKpNNtuCxC7OdkndXgCWBJp1lCXRI23Y4v9ezZE6nNtG0UCQ3QkL
 r8eaUBlgkeEQYPLv/sYCmXNIzBb7o7gJrjgJduFuFSeriZMlXF2AQhYZvYhmUsun8GoI
 KCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708097733; x=1708702533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZ1SK8UcIGNjoS5oUCJZaLlSaFI2o9jBSpbbsKbpCUU=;
 b=T0S29QRllFm5nbVzSqxj4QQqF1+pa8o6f+aThuERAPbpbu+zPIO3Ka/2QLac+IkNw9
 VcQ5pAcr1nxSnzqmkpJmqFp/bsXcTsuVj+FwGZIk/xm3utkw+CxrrmMfdJCeDJKNFvKp
 qXUAZN8HftQRY329PC1LNQn3kDAXg4voTlX7Imsw/id/QYII3XVcHm/kK7C4hAi9s6Ov
 8RnfVag3pWMpcSI2l6Xp6jCT/oFLqtNlIGReCVx5nYfpfaFZFV3bE8Ds7vq8StxsYQhl
 GytXPcX2h1Ks4DvVLc6V5CI1vzI7LlPOXWhz9Yzn/IwaeQ3clOTWNe6ZTsX5BdWY9Y4Z
 mUeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW7V/BsJy+HjTq41qFpPkmt4rVh4Viy+V/uYr1a81QyZZdlICvXDVE4JUbpLA5xkWFQzntOTO8BmFHtOLG27ZWJZZk
X-Gm-Message-State: AOJu0YxptnTzcSN0Z2dO0oxXmsPhKYkyrnm1ttpDfgXMXjChE4L7iC1n
 TH2RaUIHXytNLG1QL+E/m7pt7rOPijqiU5eRjAxqaLHfXxRYOYOG9Qradn7PagI=
X-Received: by 2002:a17:907:119c:b0:a3d:4037:73e7 with SMTP id
 uz28-20020a170907119c00b00a3d403773e7mr3369329ejb.48.1708097733048; 
 Fri, 16 Feb 2024 07:35:33 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 qw17-20020a170906fcb100b00a3d25d35ca5sm52716ejb.16.2024.02.16.07.35.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 07:35:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] hw/display/pl110: Pass frame buffer memory region as link
 property
Date: Fri, 16 Feb 2024 16:35:13 +0100
Message-ID: <20240216153517.49422-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216153517.49422-1-philmd@linaro.org>
References: <20240216153517.49422-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
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
X-TUID: pePmqzdwNCrL

Add the PL110::'framebuffer-memory' property. Have the different
ARM boards set it. We don't need to call sysbus_address_space()
anymore.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c    |  2 ++
 hw/arm/versatilepb.c |  2 ++
 hw/arm/vexpress.c    |  5 +++++
 hw/display/pl110.c   | 20 ++++++++++++++++----
 4 files changed, 25 insertions(+), 4 deletions(-)

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

