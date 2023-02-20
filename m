Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2101491ejb;
        Mon, 20 Feb 2023 01:18:16 -0800 (PST)
X-Google-Smtp-Source: AK7set/ujKOqbqXd+GyUwXeafoQEGg/0xPBv52zB4vUkMWEacY9aGWRZIWR36WrQ9zmo6h5bt0os
X-Received: by 2002:ac8:5f51:0:b0:3bd:f03:5f12 with SMTP id y17-20020ac85f51000000b003bd0f035f12mr21104195qta.42.1676884696672;
        Mon, 20 Feb 2023 01:18:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884696; cv=none;
        d=google.com; s=arc-20160816;
        b=gipvx5blZJ3Bu0HljsmWTqsf119rbd/0Mmb42g8f6VDs0jaQPfjgRsnlFjd3zMYGHW
         GNYml7wSSwtI6EVhFrDFHUvUr00ZnUVMnHXko2a6STXbnAaaxiwrMUHj1TTPU5CC4ZdF
         OO/XAsumoA+q+DdF9EdqGDoAMhsjc6Fo39ihsK0yVXLjzQmtGZrwvvsGQ8mDLVBL+G4C
         5sE6kXu5WG3zuG6HbgGBsupQoHyZjmIIh+fFp7mTuJP/OvpTINMhw4bH0YXEHos8XraD
         TfJLCb6DpzMsvveIv4o8LaTQRPG21kYp99wPom9O4eR2/oL8QvvSx/e3rNH63Jg4MDq1
         X4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3d3dAgvSU7y0t40ls900hD5+K9cJXXT4fSGii8WVS2E=;
        b=dFDWtYfOj5S5NLpl9JsROQgvnQ6UyVd3YG3lVup6DqZM/EYz8JQy+XophNeMwYtER5
         GoVjh2i48UGHOaoYYG2vXUGK5dOeYuxFfgb6Xr3MOkLwUeNMZ5Qn6UeML0IL19Qr1hVe
         r7WTxDi9kfu9k9rmgH6LGdJvLHSuqEZNs5d7+47Mtm8IBSOrkn13tSBXXGBcP+CnG4kV
         CAtVD3fvjHa5O/HQS71ZwbawrPU6vwUJ0b/7b59juxpPS6dWmp/ZaWv7l405IOO53/1a
         qtWcqS+1zXOTd4e/jkzEjLXlzLrWvPNEW5T194aJR70cie4M3SKVnHdSWJS22KzOl6Cr
         pNKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkMjx7Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11-20020a05620a40cb00b00720e0ab6c46si10388275qko.542.2023.02.20.01.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:18:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kkMjx7Gg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2HL-0007uu-Tr; Mon, 20 Feb 2023 04:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gk-00072k-BN
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Gi-0004GY-Jp
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:34 -0500
Received: by mail-wm1-x332.google.com with SMTP id m23so368767wms.5
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3d3dAgvSU7y0t40ls900hD5+K9cJXXT4fSGii8WVS2E=;
 b=kkMjx7GgkkZi3BsfS4ITbV34M7i21b/ozd5L/2r+vsRBOg25IxsFkW5K52pdeGhDbE
 CzbL6pdQSOaJiRYvMEJsSieuuCB8qPjHjya7Wbz82+ZEezhYEY5ToCmD02ZfeaeC8uXy
 R4uOg9UzGgutypzYE23m5pGzkw9+l5AmNBFScFKI2K49VQfGzGtJVgf9AlT31UyiUhno
 ufUmwNSkL2C5NIQqMSVdSsG80TMNBFFpbXNLt2Oemyq/5Dxi45SJ4Urb0pVD+bRaBR2t
 VonQzmL8X12rCmjt9wdIEE8ClwQsfCa87HVBEbdxJ+WdWXl+2sL+RI5sU1B7j9BpTWmc
 yJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3d3dAgvSU7y0t40ls900hD5+K9cJXXT4fSGii8WVS2E=;
 b=3OtDe7KO3iCbg6jzGrfIVFkI8BjSSmmS7/3zqxgCEyoSnqKdBiCSisGNpJTNfbU3nu
 +GpesqUBNo+szfVd0j2KGaCD3D9ru8O88zoe8ZEFfdd7cz93g63n7H/3JaQqX1PL1L0l
 WZT3C7QXYcSx/fG5C9tXU6gdPjq0qxYQZei7lIGgYbthWJp4L1llFtYU8ZmAQJSYkWJy
 HmjLm11XWWiAXNMWI49KsDJhnKiyFdU/D/mMO6dQpa4c+whD4IRKDRhxybwllRLVZF0E
 ZEvMBQggUAh0qlkESunWD4GvhNqk3GreiuYEwMxe+ZXOnauRg1aDosr4yk/HWkTRbzc3
 X5Ug==
X-Gm-Message-State: AO0yUKX7vl+ZSdzDvlNU5eHK4AZkstf6p/6q/NdB4HDDZZEQFwD74Rla
 0x7AZYPNdr7s7UnPR/09XnfFag==
X-Received: by 2002:a05:600c:3316:b0:3dc:42e7:f626 with SMTP id
 q22-20020a05600c331600b003dc42e7f626mr6301754wmp.26.1676884531368; 
 Mon, 20 Feb 2023 01:15:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003dd8feea827sm10216609wmq.4.2023.02.20.01.15.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 18/24] hw/ide: Rename ISA specific ide_init_ioport ->
 ide_bus_init_ioport_isa
Date: Mon, 20 Feb 2023 10:13:52 +0100
Message-Id: <20230220091358.17038-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: uqbyt9W0uqM7

Rename ide_init_ioport() as ide_bus_init_ioport_isa() to make
explicit it expects an ISA device. Move the declaration to
"hw/ide/isa.h" where it belongs.

Message-Id: <20230215161641.32663-13-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 4 +++-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 5 +++--
 include/hw/ide/internal.h | 1 -
 include/hw/ide/isa.h      | 3 +++
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..7156c465da 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -35,6 +35,7 @@
 #include "qemu/cutils.h"
 #include "sysemu/replay.h"
 
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
 
@@ -50,7 +51,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
+                            int iobase, int iobase2)
 {
     int ret;
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 95053e026f..6eed16bf87 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -71,7 +71,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_bus_init_ioport_isa(&s->bus, isadev, s->iobase, s->iobase2);
     ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2f71376b93..fc44c261cc 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -38,6 +38,7 @@
 
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/isa.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
@@ -140,8 +141,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
 
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                              port_info[i].iobase2);
+        ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
+                                      port_info[i].iobase2);
         if (ret) {
             return ret;
         }
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index d9f1f77dd5..d3b7fdc504 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -618,7 +618,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_exit(IDEState *s);
 void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
 
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
index 1cd0ff1fa6..7f7a850265 100644
--- a/include/hw/ide/isa.h
+++ b/include/hw/ide/isa.h
@@ -10,11 +10,14 @@
 #define HW_IDE_ISA_H
 
 #include "qom/object.h"
+#include "hw/ide/internal.h"
 
 #define TYPE_ISA_IDE "isa-ide"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
 
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1);
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *isa,
+                            int iobase, int iobase2);
 
 #endif
-- 
2.38.1

