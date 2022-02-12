Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2896652lfk;
        Sat, 12 Feb 2022 03:37:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyD4mdom5OYoer4np7kYzMGJPefbneIJinFYKw6hkAkjW73i5kVIacRtUoEdeUVRlbbeDL8
X-Received: by 2002:a0d:dcc5:: with SMTP id f188mr5914228ywe.316.1644665842494;
        Sat, 12 Feb 2022 03:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644665842; cv=none;
        d=google.com; s=arc-20160816;
        b=avnNrWK8zzcPUuNGc8pT2bKk32WV/J/lYqqrEfa8YIgfUIWdCr/1ObusCsIKKrt+S8
         85KJJtC2H3IV4jCzsgmoajseoKUyJUOpqDG/n3hKeNy+1WnRzYqLSMCzMwuGH3OGx50Z
         Opyq0G342VY2P0YURAlzDRVx278i6TMo9tA9+ifQIASjgyZ69fiLdVgXyvPKvsIxHVhL
         4c2CQ5O/dDIfgqovKeX/8oXcJ8tfb/b8T26T8w0K8uZa2gFrEj3pB0UTkdGZGTCGbi+b
         o8Wc/3ixbpYthGBzLGuPKXHxFDxDkZIfkFtcBp/Avs0Mr0s8jmzDIZ2BtPnWbTt0P0Sn
         lA4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JQFl51QQ+66n1DWPb4qGXjZt3TBMtDCbGDgiim+R5aw=;
        b=Ny6SkVGQPsDP73KRIFC8oqfXREvEgO8WDpzL5Q8JsLRiHih8hwfbj+pniWeU7XbGVE
         fZvC2dHMRQWE0P0szEVmRKtv/jsgtpFZsz6rcjmipZ0g1eiAgm/FGsjI725mrQMHBt+F
         qL75+YOJUW0l635Zk6le6J6D55on60kJ38GJkOPsqycGmJDvpsk2h6ILNhjWHOoKXxXV
         y/pB1Fjyj2++2p0gKNAw2ugXbIdgmJ3P7Rpw9YSMmfdZ5l8cohlWzxHs9vHryi/b/Z3P
         DLxdECT3B0j11wikBU9BDXPa7BdVfr/TLcd9UXQ8pgBP9PikCAY7zkate+pIf8OKQm0U
         cChA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=h44tjI3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x84si13643296ybg.234.2022.02.12.03.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Feb 2022 03:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=h44tjI3x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIqiP-0006sf-Sa
	for alex.bennee@linaro.org; Sat, 12 Feb 2022 06:37:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nIqgr-0006l0-1R; Sat, 12 Feb 2022 06:35:47 -0500
Received: from [2a00:1450:4864:20::635] (port=42997
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nIqgo-0005ag-NF; Sat, 12 Feb 2022 06:35:44 -0500
Received: by mail-ej1-x635.google.com with SMTP id y22so15868671eju.9;
 Sat, 12 Feb 2022 03:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQFl51QQ+66n1DWPb4qGXjZt3TBMtDCbGDgiim+R5aw=;
 b=h44tjI3xeKL8TSFkdaeaCXthT8QLVzy1f8zPApKPx9cnaeEAHpAiL0CGqbpY8olD2h
 gC+7QSbgzo6lBzt9jDl2AqB4WIOr9Bmpq0L90m+oEaglyHQ6d3MOsitk9KXqo+e56sws
 rcS3v/BQo2E9OS8eOuBlY5xcSxjWg3+UkHBkBfFMTY0RZpwpIT3M3vj6wqTNcetEb6tS
 8SDf/KAkExxlmtNEYCg2VyTVtm9Elthi/rcl1PL2Ag06N9LCtmtbd3PFiUEV29+9jSbz
 uTywKDbEcdXR2MyD3zqsvXDKeWDNYFi5LHQjiXIwhL7dkRPWZVALqgRnZhlB97gl8trj
 O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JQFl51QQ+66n1DWPb4qGXjZt3TBMtDCbGDgiim+R5aw=;
 b=QdiArp7m7i2QPBPxLYmz5uOd4jfOqfoA+8vY/Hsxgexh1CX8O/GXXg//2XcOtdoVbl
 kNdkbMy9ppLMeS4SkcaCHMfSNpwAdeIqRN98SnuGiJhCC7960HjfkD8dXV5qGc2pSayo
 UlAQPzKV8+GI+QREnud6B2XvB7FiazQxqbODHtN3B0H0h8YZADhiaK+vhJem82qSld1z
 SBwqG4qcNOeVc/c7JphesarI0/2nzKFG+zDifYubS1vSVzKtVXmJW6IFA/qJrpxLuBg0
 RI1FUAyXCdeQNAfu4H0K2nntz3NB5buJgttJGOOI9N/rm+esHmsAbL4nv+5OtyJDGime
 dR1A==
X-Gm-Message-State: AOAM533iP8YXjqoO+uC2mkIIOhdG3xyNNJOz7SsZ+UeHDl/mt/AIgJjr
 PKB9HyPoiUGIpV6J4ms1TR29kTIu7HSTh63AwEU=
X-Received: by 2002:a17:906:73ce:: with SMTP id
 n14mr4449731ejl.312.1644665740649; 
 Sat, 12 Feb 2022 03:35:40 -0800 (PST)
Received: from osoxes.fritz.box (i577BC145.versanet.de. [87.123.193.69])
 by smtp.gmail.com with ESMTPSA id z14sm889288edc.62.2022.02.12.03.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:35:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] pci: Always pass own DeviceState to pci_map_irq_fn's
Date: Sat, 12 Feb 2022 12:35:16 +0100
Message-Id: <20220212113519.69527-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220212113519.69527-1-shentey@gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 "open list:ppc4xx" <qemu-ppc@nongnu.org>, Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSkWlChIxozC

Passing own DeviceState rather than just the IRQs allows for resolving
global variables.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c          | 6 +++---
 hw/pci-host/sh_pci.c    | 6 +++---
 hw/pci-host/versatile.c | 6 +++---
 hw/ppc/ppc440_pcix.c    | 6 +++---
 hw/ppc/ppc4xx_pci.c     | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 5a86308689..a31e9714cf 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -60,7 +60,7 @@ static int pci_irq_levels[4];
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
+    PIIX4State *s = opaque;
 
     pci_irq_levels[irq_num] = level;
 
@@ -75,7 +75,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_irq_levels[i];
             }
         }
-        qemu_set_irq(pic[pic_irq], pic_level);
+        qemu_set_irq(s->i8259[pic_irq], pic_level);
     }
 }
 
@@ -323,7 +323,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
 
     for (int i = 0; i < ISA_NUM_IRQS; i++) {
         s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 719d6ca2a6..ae0aa462b3 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -111,9 +111,9 @@ static int sh_pci_map_irq(PCIDevice *d, int irq_num)
 
 static void sh_pci_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pic = opaque;
+    SHPCIState *s = opaque;
 
-    qemu_set_irq(pic[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static void sh_pci_device_realize(DeviceState *dev, Error **errp)
@@ -128,7 +128,7 @@ static void sh_pci_device_realize(DeviceState *dev, Error **errp)
     }
     phb->bus = pci_register_root_bus(dev, "pci",
                                      sh_pci_set_irq, sh_pci_map_irq,
-                                     s->irq,
+                                     s,
                                      get_system_memory(),
                                      get_system_io(),
                                      PCI_DEVFN(0, 0), 4, TYPE_PCI_BUS);
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index f66384fa02..5fbcb72d7d 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -362,9 +362,9 @@ static int pci_vpb_rv_map_irq(PCIDevice *d, int irq_num)
 
 static void pci_vpb_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pic = opaque;
+    PCIVPBState *s = opaque;
 
-    qemu_set_irq(pic[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static void pci_vpb_reset(DeviceState *d)
@@ -422,7 +422,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
         mapfn = pci_vpb_map_irq;
     }
 
-    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s->irq, 4);
+    pci_bus_irqs(&s->pci_bus, pci_vpb_set_irq, mapfn, s, 4);
 
     /* Our memory regions are:
      * 0 : our control registers
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 788d25514a..291c1bfbe7 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -431,14 +431,14 @@ static int ppc440_pcix_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void ppc440_pcix_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pci_irq = opaque;
+    PPC440PCIXState *s = opaque;
 
     trace_ppc440_pcix_set_irq(irq_num);
     if (irq_num < 0) {
         error_report("%s: PCI irq %d", __func__, irq_num);
         return;
     }
-    qemu_set_irq(*pci_irq, level);
+    qemu_set_irq(s->irq, level);
 }
 
 static AddressSpace *ppc440_pcix_set_iommu(PCIBus *b, void *opaque, int devfn)
@@ -492,7 +492,7 @@ static void ppc440_pcix_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init(&s->busmem, OBJECT(dev), "pci bus memory", UINT64_MAX);
     h->bus = pci_register_root_bus(dev, NULL, ppc440_pcix_set_irq,
-                         ppc440_pcix_map_irq, &s->irq, &s->busmem,
+                         ppc440_pcix_map_irq, s, &s->busmem,
                          get_system_io(), PCI_DEVFN(0, 0), 1, TYPE_PCI_BUS);
 
     s->dev = pci_create_simple(h->bus, PCI_DEVFN(0, 0), "ppc4xx-host-bridge");
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 5df97e6d15..f6718746a1 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -256,11 +256,11 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
 
 static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
 {
-    qemu_irq *pci_irqs = opaque;
+    PPC4xxPCIState *s = opaque;
 
     trace_ppc4xx_pci_set_irq(irq_num);
     assert(irq_num >= 0 && irq_num < PPC4xx_PCI_NUM_DEVS);
-    qemu_set_irq(pci_irqs[irq_num], level);
+    qemu_set_irq(s->irq[irq_num], level);
 }
 
 static const VMStateDescription vmstate_pci_master_map = {
@@ -319,7 +319,7 @@ static void ppc4xx_pcihost_realize(DeviceState *dev, Error **errp)
     }
 
     b = pci_register_root_bus(dev, NULL, ppc4xx_pci_set_irq,
-                              ppc4xx_pci_map_irq, s->irq, get_system_memory(),
+                              ppc4xx_pci_map_irq, s, get_system_memory(),
                               get_system_io(), 0, ARRAY_SIZE(s->irq),
                               TYPE_PCI_BUS);
     h->bus = b;
-- 
2.35.1

