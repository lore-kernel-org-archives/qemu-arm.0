Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1707943ejx;
        Sun, 20 Nov 2022 07:07:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Jh1FrI0z5kxnql/cftz87R6sJb6J3rI9AcqPnZuo4kMAWtmRBH2eVmfDFAqif4wEbCzCl
X-Received: by 2002:a37:895:0:b0:6fa:8ddf:256b with SMTP id 143-20020a370895000000b006fa8ddf256bmr12932508qki.662.1668956837626;
        Sun, 20 Nov 2022 07:07:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668956837; cv=none;
        d=google.com; s=arc-20160816;
        b=qEo7xPnAZETcqK65j5tUKcvCCgZhz27LNkbPAYv317XqlmbZT/8TRCAjJxB401jGcA
         Vc4O+Z2PZQMZLp6QrvqBOCMm136Ou1Nw8On8BjOwclu4iklQFrM2oOZH0uKSfj9YxrHg
         ifZeXbQxHiPPPhFvD7Hksf8RyJJU5inm+pJFPX+7XTULRvfU3Ab2sg02I3GNwRa5DJz0
         gH0ZNGBDPHGP+Dg4Wvir04b45HtA2iPoKsuHf98w24znbVg++rpI7WFgpmDsaHTqbaha
         y7DKun5PGal2Bq9FULDxwzRrI0DavIxq6K932jkpEONInZ3myZ/zKlbC1cCed0CNu/vP
         EGew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dkQTfg08VbNig6GdBRLWj6lsjB4ZP5VrJ/GDbk7xlCk=;
        b=0qRaX5HtaETPr6VZYZ889LVvzb9p1SyRXPukIST91XvGj3FoGdbzCTyQe93YKrSqRC
         0sRuzqrDWf67BBV4Fwrg/GLPStb/y0NkKzbRzWBFfAV8hxMUWZlHhFE48L4FJX37jVQ3
         4qZivO3nqQDrIEam5XmyGheEKsbmZqdtZCvqOB1gQg4Ytg7Yd8nqbH+j4F1uT6769+QN
         bmXXWvEIuaAZZ37IC1mPPoJfn/bnH8l9MbkDQauS6fKTkvi0oR/iGSZa77Ft1LNKP1+9
         3A22kJZoGe5x7/auKU8vV8DdgGOzSm+UXUT74KqvYtTI1g1Ao9PS4Hlvq/eustgjkwv5
         p/lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=mApgodRu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ac8530c000000b003a53cee0df7si4478917qtn.289.2022.11.20.07.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Nov 2022 07:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=mApgodRu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owlu4-0002Iy-NA; Sun, 20 Nov 2022 10:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu3-0002IJ-QS; Sun, 20 Nov 2022 10:06:39 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1owlu2-0001xV-6F; Sun, 20 Nov 2022 10:06:39 -0500
Received: by mail-ed1-x536.google.com with SMTP id b8so2314981edf.11;
 Sun, 20 Nov 2022 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dkQTfg08VbNig6GdBRLWj6lsjB4ZP5VrJ/GDbk7xlCk=;
 b=mApgodRuAqIWbyxGLeZzrhTnup4TWlSMWDrzaBIDWNRo7LttKtfn8CxuvbLKFAlXOg
 n7QwWTzy1GmWC/EHJxVP/xHUVFp2czqq2+uV4aonnLCTJ0SRPuIAFzZsy5CYrK1gr7k2
 IN1heOxj3+PuZGoaQsANgeDX4paCbER6j96GoFXvukXd2ag+ZNW5xWWIrwj638+bMcvX
 U9QNSP/4B7ufUqwMXEycZXKxFkOMLCTQDj+Fw6zOJnGzqNSPX1wjvG6+XtkoirMgk5Cv
 lBH31vQyMdLSziZz9yo7bAcb55ffuaFL4mQnqhOCihArv5vHs+3yD5SvvLsL8ISF8Iyr
 fM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkQTfg08VbNig6GdBRLWj6lsjB4ZP5VrJ/GDbk7xlCk=;
 b=pcFW2kwo1w87Ld1cLBHPf4N0RuEZiX1Uc8DW3S8yBSB2AiVbXAhJ87/9LK5A/+XRg0
 fVUEs7kkNaXqGy19qrgLP7b8G6FTn8Ab33aDEYGkn8oPso0cOdGKGFe9bYxjuwafgu1+
 zpfZ53b70kRlkQYoNm/kmkzPIMTvI1TKoOMEk5E9+jBz9z7BpA3/Zx47EmdLp9BAC8l6
 TJT5fuYDwwKQaugW1WGLIebWjyw2XrG/rkveD74Cg3fmlZg6vMgs+vQdH8Wnp2WNRuQP
 xmhpwp3sCdexuUdgNAnOfdHX55m5x4trA38sTsjivIOYICUcri72tVV0jqOEWocZj+Ix
 dfNg==
X-Gm-Message-State: ANoB5pnhQMo7tW4tWNr297Wfj/7Yv/SYlAAuV5eSsPp/fFPSO7kFjyO8
 3miD3LEJ5lPg/ROTMjlJIoq3Q0T7rZ8=
X-Received: by 2002:aa7:dc0c:0:b0:461:6f87:20bb with SMTP id
 b12-20020aa7dc0c000000b004616f8720bbmr12726589edu.300.1668956795148; 
 Sun, 20 Nov 2022 07:06:35 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-067-205.77.13.pool.telefonica.de. [77.13.67.205])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a1709061daa00b007b2a3cad2cfsm4026785ejh.132.2022.11.20.07.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 07:06:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/3] hw/isa/piix3: Decouple INTx-to-LNKx routing which is
 board-specific
Date: Sun, 20 Nov 2022 16:05:49 +0100
Message-Id: <20221120150550.63059-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
References: <20221120150550.63059-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
X-TUID: q9Dvhr1mvSbZ

pci_map_irq_fn's in general seem to be board-specific. So move PIIX3's
pci_slot_get_pirq() to board code to not have PIIX3 make assuptions
about its board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 16 ++++++++++++++++
 hw/isa/piix3.c    | 13 -------------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 0ad0ed1603..ecae85a31e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/xen/xen-x86.h"
+#include "hw/xen/xen.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/piix4.h"
@@ -73,6 +74,17 @@ static const int ide_iobase2[MAX_IDE_BUS] = { 0x3f6, 0x376 };
 static const int ide_irq[MAX_IDE_BUS] = { 14, 15 };
 #endif
 
+/*
+ * Return the global irq number corresponding to a given device irq
+ * pin. We could also use the bus number to have a more precise mapping.
+ */
+static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
+{
+    int slot_addend;
+    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
+    return (pci_intx + slot_addend) & 3;
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -223,6 +235,10 @@ static void pc_init1(MachineState *machine,
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
+
+        pci_bus_map_irqs(pci_bus,
+                         xen_enabled() ? xen_pci_slot_get_pirq
+                                       : pci_slot_get_pirq);
     } else {
         pci_bus = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7ad26b82e8..30509f39e5 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -79,17 +79,6 @@ static void piix3_set_irq(void *opaque, int pirq, int level)
     piix3_set_irq_level(piix3, pirq, level);
 }
 
-/*
- * Return the global irq number corresponding to a given device irq
- * pin. We could also use the bus number to have a more precise mapping.
- */
-static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
-{
-    int slot_addend;
-    slot_addend = PCI_SLOT(pci_dev->devfn) - 1;
-    return (pci_intx + slot_addend) & 3;
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIX3State *piix3 = opaque;
@@ -389,7 +378,6 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
     }
 
     pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, pci_slot_get_pirq);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -425,7 +413,6 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * These additional routes can be discovered through ACPI.
      */
     pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
-    pci_bus_map_irqs(pci_bus, xen_pci_slot_get_pirq);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
-- 
2.38.1

