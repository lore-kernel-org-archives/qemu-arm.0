Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2450422ejc;
        Mon, 9 Jan 2023 09:30:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvYedNFiVeqHe3u1BuePSMCDNhPBC50dkIPZbW1p9dsdnspyRefH3XfbBcrRp3jVeYkNilA
X-Received: by 2002:a0c:d782:0:b0:531:94d7:a41f with SMTP id z2-20020a0cd782000000b0053194d7a41fmr63115673qvi.43.1673285401919;
        Mon, 09 Jan 2023 09:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285401; cv=none;
        d=google.com; s=arc-20160816;
        b=EGC9IF+6fPBL+KE3LmLohRAYr9+k3Z9yNerp3aWhYNRCtySyP4WK2tDN3B7gqKcOS9
         KrhEgolieqRQxq111JjA6ydx+PMXo/iNJYyf4vXEod86G9APMJR/vTY0wkDhD/Z07O/0
         T3cudoifx64f4m1axhlnI9DKJ6XTsAVA86r41cInOp5Ut0FNtbmHW1RUk2eEHHuCbkE7
         xjrlIxMl7qz47IQgm5tcCjuLV55Q5MxXlmSF5uYvaNLKw8Wcf+0OQ5eDid6PwEPzoOB2
         qHxG+HJYz94Cu4Nq41p5IUVDqxs/nZhzK+ZEHVGBUIJ7DSDixplB7VRf1om0moRrEZTf
         tbSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OKI3pQf10L0CafJmgzqflOFdUTw3VE2jrgkDejTMPzM=;
        b=LIMzA4bodkK5wp13e2rg74ZAAXihWA3v1B3M30R1U3vdhmiEWxSImj7bb8BMJyzO2C
         8ZvRwLIrEMGPtf3uFfHsE6xzsIGiKdaqorFmsrdu+aoM9oOu3itNlvBsYzm/zlFaKv4l
         eCdHkETiEJ/shoK2zqOPWaQoofiCVUjqgN2asMzdoApVVrhNozzJiviJd7+TSeM2gxBD
         EaNEqvk0TTEziQILXhdZPXaVaFet3xRWCpk+3fG3lkpCRFuX2IIsSTtOIibGky2EGc0N
         4fR0f0UZW9d5eU/F6NZW2/COJxfspQzQY7U1jZcvjomr2codsIUvVg3Y7vfeMKGw+IGF
         4TFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=OoDke38m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m15-20020ad45dcf000000b004bb8b904078si4703287qvh.453.2023.01.09.09.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=OoDke38m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuK-0003TM-TH; Mon, 09 Jan 2023 12:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvts-0002vo-Dd; Mon, 09 Jan 2023 12:25:34 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtq-00018g-I0; Mon, 09 Jan 2023 12:25:32 -0500
Received: by mail-ej1-x636.google.com with SMTP id tz12so21915150ejc.9;
 Mon, 09 Jan 2023 09:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKI3pQf10L0CafJmgzqflOFdUTw3VE2jrgkDejTMPzM=;
 b=OoDke38mmIwwGhP6cJhu2cWAEYICxTjvcPMYBTJUG612kbMFUXrHUijxTdMfzs7Ov2
 rNTaM3flVWXQs3Wg0Ad3qc2PDgzVAV6J6stcOHIhuUraXCMI6+QBaR05kB6aCG6wVsvq
 uXT05veQLdlAqC4APaa9rQxLnW5K22wTc+BY0GARhjM/3+4u9G+C/JXaupf01x97gd9m
 HA75NKPruMz0LBJ5c4NRVblGoqFl03uQ29/Nuuo30EhZSYc51PhVZKtVN0dt3AjXSqHS
 LsDIVPOiHDoNCkft6dBHQ8TZMgI03cXUFJ9grGjuvUzGgQu9huD3Cljql7IWIbQv5eoT
 Xfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OKI3pQf10L0CafJmgzqflOFdUTw3VE2jrgkDejTMPzM=;
 b=Z4UM0mrSfpPtFtdTvvQySC1F7BN6sBKREOX/vAZTqCC7jt0/yosmuM/uzNFD827wCb
 TfjdL1lsNDpY4MlrREJWH2Nsw4lVINQHAteESgMqA82zKfrnm/D06podtOsofViDlnuP
 HKa+M6snG2FHK1HO1ovdOVHky84SFsYVXpXWLLiaGNCv1PexR0NuxoklVYFu84RC+Ny6
 cgcygsIxcSFNxNfNXr+gjPfsMyPd0EOEf2ED0NDr2urON4F1eCmwXGOif74qL6k/PSwW
 RR/3L6ZZpeUNEiKDOOIhqDNxbEO2AZ4HabIiM25f61Qny7pDaCivaeJYow0fy05Q1UvN
 Vd4w==
X-Gm-Message-State: AFqh2kpoee1iDM2K4BIDe/sQlec2mBs5q++9wLRaKUJ48KW+NL8xYnef
 08F5XdsowzBOfnr/E/TTEfUrU4gctXU3uQ==
X-Received: by 2002:a17:907:d302:b0:7c1:3472:5e75 with SMTP id
 vg2-20020a170907d30200b007c134725e75mr60039636ejc.29.1673285128130; 
 Mon, 09 Jan 2023 09:25:28 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:27 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 30/33] hw/isa/piix: Reuse PIIX3 base class' realize method
 in PIIX4
Date: Mon,  9 Jan 2023 18:23:43 +0100
Message-Id: <20230109172347.1830-31-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: z3FnARgNm8d2

Resolves duplicate code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-39-shentey@gmail.com>
---
 hw/isa/piix.c | 65 +++++++--------------------------------------------
 1 file changed, 9 insertions(+), 56 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d8cd80e859..0132f6e70a 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -331,7 +331,8 @@ static const MemoryRegionOps rcr_ops = {
     },
 };
 
-static void pci_piix3_realize(PCIDevice *dev, Error **errp)
+static void pci_piix_realize(PCIDevice *dev, const char *uhci_type,
+                             Error **errp)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
@@ -371,8 +372,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 
     /* USB */
     if (d->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &d->uhci,
-                                TYPE_PIIX3_USB_UHCI);
+        object_initialize_child(OBJECT(dev), "uhci", &d->uhci, uhci_type);
         qdev_prop_set_int32(DEVICE(&d->uhci), "addr", dev->devfn + 2);
         if (!qdev_realize(DEVICE(&d->uhci), BUS(pci_bus), errp)) {
             return;
@@ -477,7 +477,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
     if (*errp) {
         return;
     }
@@ -506,7 +506,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
     PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
 
-    pci_piix3_realize(dev, errp);
+    pci_piix_realize(dev, TYPE_PIIX3_USB_UHCI, errp);
     if (*errp) {
         return;
     }
@@ -536,71 +536,24 @@ static const TypeInfo piix3_xen_info = {
 
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
+    ERRP_GUARD();
     PIIXState *s = PIIX_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
 
-    isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
-                          pci_address_space_io(dev), errp);
-    if (!isa_bus) {
-        return;
-    }
-
-    memory_region_init_io(&s->rcr_mem, OBJECT(dev), &rcr_ops, s,
-                          "piix-reset-control", 1);
-    memory_region_add_subregion_overlap(pci_address_space_io(dev),
-                                        PIIX_RCR_IOPORT, &s->rcr_mem, 1);
-
-    /* initialize i8259 pic */
-    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
+    pci_piix_realize(dev, TYPE_PIIX4_USB_UHCI, errp);
+    if (*errp) {
         return;
     }
 
-    /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->pic.in_irqs);
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
 
-    /* DMA */
-    i8257_dma_init(isa_bus, 0);
-
     /* RTC */
-    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-        return;
-    }
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    /* IDE */
-    qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
-    if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
-        return;
-    }
-
-    /* USB */
-    if (s->has_usb) {
-        object_initialize_child(OBJECT(dev), "uhci", &s->uhci,
-                                TYPE_PIIX4_USB_UHCI);
-        qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
-        if (!qdev_realize(DEVICE(&s->uhci), BUS(pci_bus), errp)) {
-            return;
-        }
-    }
-
-    /* ACPI controller */
-    if (s->has_acpi) {
-        object_initialize_child(OBJECT(s), "pm", &s->pm, TYPE_PIIX4_PM);
-        qdev_prop_set_int32(DEVICE(&s->pm), "addr", dev->devfn + 3);
-        qdev_prop_set_uint32(DEVICE(&s->pm), "smb_io_base", s->smb_io_base);
-        qdev_prop_set_bit(DEVICE(&s->pm), "smm-enabled", s->smm_enabled);
-        if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
-            return;
-        }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
-                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
-    }
-
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
 }
 
-- 
2.39.0

