Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2449230ejc;
        Mon, 9 Jan 2023 09:28:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtSjDJ3f8Vx59ottTYXTCcr02YGUPcMC6VVeJsOpRN6Pttxw7QLeIEZ7DmIc50AHI5K2kEK
X-Received: by 2002:ac8:4f48:0:b0:3a9:7be9:f5dc with SMTP id i8-20020ac84f48000000b003a97be9f5dcmr84457303qtw.25.1673285301437;
        Mon, 09 Jan 2023 09:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285301; cv=none;
        d=google.com; s=arc-20160816;
        b=jbSlKDm7ErWzK+Yr4MuhY4fFph6eWLKPHIoqlMRglPPlwwdR4AdKmVaZfmyRpHb5LM
         zLa2EwtyXg1om/NFSqm91SJcjcXVcUEvwtWjZZNtFWwuaFsMOTBJ1tWNAMMWXTyIktrF
         sn1kPDb48f3Q3GmvYU0lLxBQkEpJGtIG6dUP1FY1HMxpaHB0qcSOtPdIWBWMTz97NN5+
         zX3yddnlvQj42pJOdQmRYV1coftg9+NTRMhQ2uvzXKs8c0DVoYNltyy5EwqTHKp039D1
         2+MMZI7vF8ht9jcPcEa8MCpOk9uPsGmB7WWxTYoVXKBU3RlZQPKqJYwhxuFF+0hokbRw
         kDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cKyAwLwM8Pm09xe6hbUORuW9/AEhRnyrnWLTrc7e2kA=;
        b=INygFAiONfmqSkOwkiiO2Ah70KmztnmEb/P7ltGk44HumdDOc0l3Z+NkQhT84Ujf8h
         aehd0723MUz7s0SQqKPZDjrr5dClnlE6VHCof0YXI+oqU2WwIXqAbHJE9LAYQCkDAkfB
         rRIDKgwR1Wqzsh5+bRJu5Ev1gAKzymZv+b4SE1vBI4+tuArQK3sLrLJvY1RjFktn66LR
         5R+V3G/Bm7kWhBOuj5iG0acifSxQqs2lfgvKwqVi1rpVttxruJvisujKVSW2TrKJf9Iq
         FmgbAoAAShD/WLU+zIJaE7otl9TSn8dB1bmFDAPM7S54sWEmntAnrZu+BcZCRCjE761c
         Ng0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJaXtx9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11-20020ac8488b000000b003a52649329asi4739469qtq.286.2023.01.09.09.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJaXtx9m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuY-0004Ho-N6; Mon, 09 Jan 2023 12:26:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtt-0002vp-6m; Mon, 09 Jan 2023 12:25:33 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtr-0001T2-B7; Mon, 09 Jan 2023 12:25:32 -0500
Received: by mail-ej1-x631.google.com with SMTP id hw16so10049128ejc.10;
 Mon, 09 Jan 2023 09:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cKyAwLwM8Pm09xe6hbUORuW9/AEhRnyrnWLTrc7e2kA=;
 b=ZJaXtx9mxNmfJOlZ+46bOk8XO+OpJWkpxfNuy9LdCT+v2miAKq381OGkl0aX6KJAk3
 mQut2NPR3PjTK0atAwdINN33vUUaaavWhJ9YbUHd68pbsmIqIaMENKJbdgECK13JZ2dc
 dMCl2/wSHupaqiVJ1mmISdb/gbYB1oNiHtijAzgvMmasyboPuSVe3MeGKonPetHSn8eY
 eq4zVqYXejDn/ZYEFda4mVpGBEjyG71CMyePuaDw2ps4e2TLq0tbtZrxPoGzfaooKUWd
 BbrNcDRwXUz098+0clypzlnOPZIBkCRp5MIn5lKccHctyv600uo4Pkla1AkC+8I4ijAj
 Zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cKyAwLwM8Pm09xe6hbUORuW9/AEhRnyrnWLTrc7e2kA=;
 b=eg70vl8lUt2+oaoITvFguDHjJaQBjHqVmRvTbamF4qM63ntbttFGC7d76wEguEVrYD
 hvp9ae6EzXWMl0EHwjUdQB1HQQsL5qowq5Udvkq53vpjd3+kS5BRNDIPdlxJe75aquPo
 G4n+PtRaO7Mp4Q+tYhv3UP7E+7YNhItTs6JTA8mclk28j3NYbXMZ85ZjHXGt7aPZSOIc
 9U+3h2n7WwFY1puTO1+/OwHnAIvfCLLpJbcQTuld7hPJyjgKyOgWHV14L0Rg2TBwKx6d
 VztzChPXPb7I2aWYmiANQFtDgE9mChSRjev3/ry7B2Ch0eTUpp+aJL4ZkF8MgklhdR0i
 K8Zw==
X-Gm-Message-State: AFqh2kr+aPISu62wCBDLkuqQIyiuv8qVMEm73Zj8vkbSbDX/XoD7LApH
 UDL3D0EAeSC3KMjn6Prn6jKZ2nKg57ck9w==
X-Received: by 2002:a17:907:1759:b0:7ad:d250:b903 with SMTP id
 lf25-20020a170907175900b007add250b903mr71843212ejc.56.1673285129197; 
 Mon, 09 Jan 2023 09:25:29 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:28 -0800 (PST)
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
Subject: [PATCH v6 31/33] hw/isa/piix: Rename functions to be shared for
 interrupt triggering
Date: Mon,  9 Jan 2023 18:23:44 +0100
Message-Id: <20230109172347.1830-32-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
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
X-TUID: vD2cEiEX+I+Q

PIIX4 will get the same optimizations which are already implemented for
PIIX3.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-40-shentey@gmail.com>
---
 hw/isa/piix.c | 56 +++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 0132f6e70a..33ea5275ec 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -40,47 +40,47 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-static void piix3_set_irq_pic(PIIXState *piix3, int pic_irq)
+static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
-    qemu_set_irq(piix3->pic.in_irqs[pic_irq],
-                 !!(piix3->pic_levels &
+    qemu_set_irq(piix->pic.in_irqs[pic_irq],
+                 !!(piix->pic_levels &
                     (((1ULL << PIIX_NUM_PIRQS) - 1) <<
                      (pic_irq * PIIX_NUM_PIRQS))));
 }
 
-static void piix3_set_irq_level_internal(PIIXState *piix3, int pirq, int level)
+static void piix_set_irq_level_internal(PIIXState *piix, int pirq, int level)
 {
     int pic_irq;
     uint64_t mask;
 
-    pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
+    pic_irq = piix->dev.config[PIIX_PIRQCA + pirq];
     if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
     mask = 1ULL << ((pic_irq * PIIX_NUM_PIRQS) + pirq);
-    piix3->pic_levels &= ~mask;
-    piix3->pic_levels |= mask * !!level;
+    piix->pic_levels &= ~mask;
+    piix->pic_levels |= mask * !!level;
 }
 
-static void piix3_set_irq_level(PIIXState *piix3, int pirq, int level)
+static void piix_set_irq_level(PIIXState *piix, int pirq, int level)
 {
     int pic_irq;
 
-    pic_irq = piix3->dev.config[PIIX_PIRQCA + pirq];
+    pic_irq = piix->dev.config[PIIX_PIRQCA + pirq];
     if (pic_irq >= ISA_NUM_IRQS) {
         return;
     }
 
-    piix3_set_irq_level_internal(piix3, pirq, level);
+    piix_set_irq_level_internal(piix, pirq, level);
 
-    piix3_set_irq_pic(piix3, pic_irq);
+    piix_set_irq_pic(piix, pic_irq);
 }
 
-static void piix3_set_irq(void *opaque, int pirq, int level)
+static void piix_set_irq(void *opaque, int pirq, int level)
 {
-    PIIXState *piix3 = opaque;
-    piix3_set_irq_level(piix3, pirq, level);
+    PIIXState *piix = opaque;
+    piix_set_irq_level(piix, pirq, level);
 }
 
 static void piix4_set_irq(void *opaque, int irq_num, int level)
@@ -121,29 +121,29 @@ static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 }
 
 /* irq routing is changed. so rebuild bitmap */
-static void piix3_update_irq_levels(PIIXState *piix3)
+static void piix_update_irq_levels(PIIXState *piix)
 {
-    PCIBus *bus = pci_get_bus(&piix3->dev);
+    PCIBus *bus = pci_get_bus(&piix->dev);
     int pirq;
 
-    piix3->pic_levels = 0;
+    piix->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level(piix3, pirq, pci_bus_get_irq_level(bus, pirq));
+        piix_set_irq_level(piix, pirq, pci_bus_get_irq_level(bus, pirq));
     }
 }
 
-static void piix3_write_config(PCIDevice *dev,
-                               uint32_t address, uint32_t val, int len)
+static void piix_write_config(PCIDevice *dev, uint32_t address, uint32_t val,
+                              int len)
 {
     pci_default_write_config(dev, address, val, len);
     if (ranges_overlap(address, len, PIIX_PIRQCA, 4)) {
-        PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
+        PIIXState *piix = PIIX_PCI_DEVICE(dev);
         int pic_irq;
 
-        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix3->dev));
-        piix3_update_irq_levels(piix3);
+        pci_bus_fire_intx_routing_notifier(pci_get_bus(&piix->dev));
+        piix_update_irq_levels(piix);
         for (pic_irq = 0; pic_irq < ISA_NUM_IRQS; pic_irq++) {
-            piix3_set_irq_pic(piix3, pic_irq);
+            piix_set_irq_pic(piix, pic_irq);
         }
     }
 }
@@ -165,7 +165,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
         }
     }
 
-    piix3_write_config(dev, address, val, len);
+    piix_write_config(dev, address, val, len);
 }
 
 static void piix_reset(DeviceState *dev)
@@ -225,7 +225,7 @@ static int piix3_post_load(void *opaque, int version_id)
      */
     piix3->pic_levels = 0;
     for (pirq = 0; pirq < PIIX_NUM_PIRQS; pirq++) {
-        piix3_set_irq_level_internal(piix3, pirq,
+        piix_set_irq_level_internal(piix3, pirq,
             pci_bus_get_irq_level(pci_get_bus(&piix3->dev), pirq));
     }
     return 0;
@@ -482,7 +482,7 @@ static void piix3_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    pci_bus_irqs(pci_bus, piix3_set_irq, piix3, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, piix3, PIIX_NUM_PIRQS);
     pci_bus_set_route_irq_fn(pci_bus, piix3_route_intx_pin_to_irq);
 }
 
@@ -490,7 +490,7 @@ static void piix3_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.0

