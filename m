Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2100462ejb;
        Mon, 20 Feb 2023 01:16:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+9r0uQ86Crj0cvgGGP+8KVhLDRnQmIV0TtuunVEmrlLs17JhnGbtFDMqI1Updf5r//XUQT
X-Received: by 2002:ac8:5ac7:0:b0:3b8:2e48:921a with SMTP id d7-20020ac85ac7000000b003b82e48921amr14561804qtd.57.1676884609957;
        Mon, 20 Feb 2023 01:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676884609; cv=none;
        d=google.com; s=arc-20160816;
        b=I9CxTBXRtdG0VPIVGeX6w6tIAQSBhVa2fNXNUgnZVlNcb0EYRNRR8Xuv9Ns8XgNU/R
         +xj4IYG0/3PsY7qoOQ1oG/YcIT3xsK3xUQ3txgcjC1p9YXEQrYj8/YGyxNN+WJG7pSs3
         mX3VoSNEClHDxtzgjMo8tjF/KnNefasSUFYc73ebaqz6oVq5kBg7RBY2zGGsGcjxRatJ
         vFCZwp2/scIjv83CyEU/GlbWVJNpujiXsbXX7G2C8nuAbWoskOd5GpDzplbbXoA+V76W
         XArZNC5cwuu1bWM6mQWont9vE+t1E6O5lWQ/XqVr3vwlq64hmxseY3Lg1gm6ReRgpGNq
         yNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GMjTemuFLJ3RFOowD2crRLZnd5GWJHiz0MSZdBMbUX4=;
        b=C8eBW1k0S/POnyXeSe65YL0waRoOmgYBsjtgoeBMznYZWV4bM9WvAJJLK5wztRY9HW
         gv9Xr+UZAXVh8Wa5LwG3rC82J8zWhjp0QJU5HuAYQrg7uKShb7OynHUGX/SWXdnkxoAM
         LAFpgywEEgFJP/exYM0FoxQ3zBoTzulPiOw12CeXbjEnyTP9Y+KE0GarNFLIYjpP9nGt
         +0gUhx64TdWtRge0A1WAYv6kZc8kvLo6i16OSnyQI0TBTF2gpq1HkBbaIuBniNFngIK8
         RP/50YgF9lRRQNWIdpgxq8VFoomPXsqpyVi+qliCtWJuCC4EXf0XYi+H1wvU3rKuEfzB
         hoyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxK6YJbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13-20020ac859cd000000b003b83c0ba5cfsi9225013qtf.543.2023.02.20.01.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 01:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GxK6YJbE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU2HB-0007Y7-9U; Mon, 20 Feb 2023 04:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GW-0006nh-8d
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2GT-0003pH-3A
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 04:15:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id z8so56161wrm.8
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 01:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GMjTemuFLJ3RFOowD2crRLZnd5GWJHiz0MSZdBMbUX4=;
 b=GxK6YJbEZ1JjfE46GsK2VgA9UW52U2FneaJhnmVFtFckgtxnA8hFncNQDCiu6d/0Pl
 9OrcMgBqXZ32Gemm54vY/Nx2uUAFmFl/UefDgPSev1wP+Y7oSG1JWZzauPEC1ffxVaaO
 kRckiKd/FDVSYsj1EXSQMBDo7tS1fiac5g432u5xYn+Pf59BGMYPMSeGmb82mhoHijwr
 dRmZnmmqG/GFgvM9ELeEhnkQEs5Tv2ffMXb87O6EdqiaqGyQVzUeGHp5FfFYGJK77cb2
 kSBuazw8cbKhxhEdwUJZ8eLmZ/ngUPMCs7SoQu3z/Xd2Zcxza0+guNwuaGvtUScxkKRx
 0GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GMjTemuFLJ3RFOowD2crRLZnd5GWJHiz0MSZdBMbUX4=;
 b=Htix7XAoKbBoO36MFrRXDYLSr2GvJ80xS4yeZBsFMX6qcrPChrjeVTsUpMP2/rT2Fi
 MwMIg9fSsdSgT81BbOWJckOYru5lFZ7JlevlO+oN4urNWr5IA2qxkJaTUOw8S2JFU5Cq
 BeQ5c9XlEgQoj+1kVxPBoL5iOqW1Ks02I6XUo0sjeGISlozEH2uz/2wE9nIDNP1venI8
 Lcjfpx5dZlw+LSagAq16zzRrqHK2eCTnXy4LOMLg4Y85jzcdGNOD9mKSUBnhQMUeBHOM
 B4VwbD5PSQKyMDA8fP/PCVbqFUjRM2vaIv9YQNEUAcF/gPyRaTrMS4eA48+vxjMF1ECf
 a+yA==
X-Gm-Message-State: AO0yUKXclaycO4/WLW8EDXESNWlfgZYlumhdkA3+Rhw297VHlc1vZ6PK
 FgNSLQYVObg0XmSNoKP5C9o1EA==
X-Received: by 2002:a05:6000:1f10:b0:2c5:512c:f499 with SMTP id
 bv16-20020a0560001f1000b002c5512cf499mr500362wrb.27.1676884516402; 
 Mon, 20 Feb 2023 01:15:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l11-20020adff48b000000b002c592535839sm969827wro.17.2023.02.20.01.15.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:15:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 15/24] hw/ide: Rename ide_init2() ->
 ide_bus_init_output_irq()
Date: Mon, 20 Feb 2023 10:13:49 +0100
Message-Id: <20230220091358.17038-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wo2eGj/Uyg30

ide_init2() initializes an IDEBus, and sets its output IRQ.
To emphasize this, rename it as ide_bus_init_output_irq().

Mechanical change using:

  $ sed -i -e 's/ide_init2/ide_bus_init_output_irq/g' \
        $(git grep -l ide_init2)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-15-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/ahci.c             | 2 +-
 hw/ide/cmd646.c           | 2 +-
 hw/ide/core.c             | 4 ++--
 hw/ide/isa.c              | 2 +-
 hw/ide/macio.c            | 2 +-
 hw/ide/microdrive.c       | 2 +-
 hw/ide/mmio.c             | 2 +-
 hw/ide/piix.c             | 3 ++-
 hw/ide/sii3112.c          | 2 +-
 hw/ide/via.c              | 2 +-
 include/hw/ide/internal.h | 4 ++--
 11 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7f67fb3119..d79b70d8c5 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1554,7 +1554,7 @@ void ahci_realize(AHCIState *s, DeviceState *qdev, AddressSpace *as, int ports)
         AHCIDevice *ad = &s->dev[i];
 
         ide_bus_init(&ad->port, sizeof(ad->port), qdev, i, 1);
-        ide_init2(&ad->port, irqs[i]);
+        ide_bus_init_output_irq(&ad->port, irqs[i]);
 
         ad->hba = s;
         ad->port_no = i;
diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 2865bc25fc..26a90ed45f 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -294,7 +294,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, cmd646_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 1be0731d1a..fd2215c506 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2771,7 +2771,7 @@ static IDEDMA ide_dma_nop = {
     .aiocb = NULL,
 };
 
-void ide_init2(IDEBus *bus, qemu_irq irq)
+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out)
 {
     int i;
 
@@ -2779,7 +2779,7 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
         ide_init1(bus, i);
         ide_reset(&bus->ifs[i]);
     }
-    bus->irq = irq;
+    bus->irq = irq_out;
     bus->dma = &ide_dma_nop;
 }
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index f8ed26b587..95053e026f 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -72,7 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
+    ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
 }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 7efbbc720a..6be29e44bc 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -420,7 +420,7 @@ static void macio_ide_realizefn(DeviceState *dev, Error **errp)
 {
     MACIOIDEState *s = MACIO_IDE(dev);
 
-    ide_init2(&s->bus, s->ide_irq);
+    ide_bus_init_output_irq(&s->bus, s->ide_irq);
 
     /* Register DMA callbacks */
     s->dma.ops = &dbdma_ops;
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 08504b499f..84452ae4ef 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -599,7 +599,7 @@ static void microdrive_realize(DeviceState *dev, Error **errp)
 {
     MicroDriveState *md = MICRODRIVE(dev);
 
-    ide_init2(&md->bus, qemu_allocate_irq(md_set_irq, md, 0));
+    ide_bus_init_output_irq(&md->bus, qemu_allocate_irq(md_set_irq, md, 0));
 }
 
 static void microdrive_init(Object *obj)
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index d650dcee4d..c6c0299c53 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -122,7 +122,7 @@ static void mmio_ide_realizefn(DeviceState *dev, Error **errp)
     SysBusDevice *d = SYS_BUS_DEVICE(dev);
     MmioIdeState *s = MMIO_IDE(dev);
 
-    ide_init2(&s->bus, s->irq);
+    ide_bus_init_output_irq(&s->bus, s->irq);
 
     memory_region_init_io(&s->iomem1, OBJECT(s), &mmio_ide_ops, s,
                           "ide-mmio.1", 16 << s->shift);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index daeb9b605d..2f71376b93 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -145,7 +145,8 @@ static int pci_piix_init_ports(PCIIDEState *d)
         if (ret) {
             return ret;
         }
-        ide_init2(&d->bus[i], isa_get_irq(NULL, port_info[i].isairq));
+        ide_bus_init_output_irq(&d->bus[i],
+                                isa_get_irq(NULL, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index c918370220..f9becdff8e 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -284,7 +284,7 @@ static void sii3112_pci_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, sii3112_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&s->bus[i], sizeof(s->bus[i]), ds, i, 1);
-        ide_init2(&s->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&s->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&s->bus[i], &s->bmdma[i], s);
         s->bmdma[i].bus = &s->bus[i];
diff --git a/hw/ide/via.c b/hw/ide/via.c
index fd398226d4..ab9e43e244 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -191,7 +191,7 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     qdev_init_gpio_in(ds, via_ide_set_irq, 2);
     for (i = 0; i < 2; i++) {
         ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
-        ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
+        ide_bus_init_output_irq(&d->bus[i], qdev_get_gpio_in(ds, i));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
         d->bmdma[i].bus = &d->bus[i];
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 11a4931ef9..c687282a78 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -488,7 +488,7 @@ struct IDEBus {
     IDEDMA *dma;
     uint8_t unit;
     uint8_t cmd;
-    qemu_irq irq;
+    qemu_irq irq; /* bus output */
 
     int error_status;
     uint8_t retry_unit;
@@ -616,8 +616,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    uint64_t wwn,
                    uint32_t cylinders, uint32_t heads, uint32_t secs,
                    int chs_trans, Error **errp);
-void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
+void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
 int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
-- 
2.38.1

