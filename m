Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2450560ejc;
        Mon, 9 Jan 2023 09:30:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaM84iOtyGPzCb23XHetKv8jZkgLWTzVyygfiUw0RMndb67Jv9KNq1/BCU+fnsW0gbeX+G
X-Received: by 2002:a05:622a:801b:b0:3ac:77ed:3995 with SMTP id jr27-20020a05622a801b00b003ac77ed3995mr9150331qtb.26.1673285412261;
        Mon, 09 Jan 2023 09:30:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285412; cv=none;
        d=google.com; s=arc-20160816;
        b=0TzLuJfcnqcXMsq0rPfPhEDkpEmi5liiubp2D0EYfn3TKwRIznJR51gYMUIXhCUuIR
         5aRsTK0kdBc1IhU+OltlUjf/PYwpJ/7tN+KlznXDWRnz2HSJf5Z6Vy5Nc+ZEA5TEqSg3
         gRzD44rFl0IhrNuCRb+hl1JGfrrROeZsT9u2WbU2RbjfzHrwwWICQp/88jtCY+fLnlOQ
         ckgXsAQSwtglkKZ6cAIm3I32eyBXbvd43FDMC1bRV4KR1WPHK275ScMs4Kw+b9MDokR8
         TR3uufYFmkfcIaXGGdW38GStTvw6ltUZfmk+71/UHZjsq4yW3ajr8sJIcWCIdUiEOc1I
         h9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IMdn1pWnXwwaTdih9emYCZADk1B97e7zAw/7nMQYL5E=;
        b=YwzGJ4/0snUZmTcQ/Jp/FMU3m6c5LR768Yw7RI/p7AeNWQxlWcweDz8Ehvbi23tevg
         RjwjqLB6NIq0z4lzdijUcd69W80wD+wl9ykcSpJ9FZMaVA7+t4cuM/sJp9VNflY7ownm
         Vn/I/AG4nfFdZx9aZ1Yqaq0WCjCGFA/fpc1Ze6Y5zwHjt8JGNw5pA0kVmL0PVBskak+/
         vYh08KyctLEVPzRu+wiS8lF3XyuZZZzwxboiEAtQI2aD1gz2Lpco/ApjgVO8lVrdAwDo
         ResduiCA5hiUySOWbJG6AQcI6stXZr5MxOMcX2ApAZ0KLhlWXRAgUWn7Q4ji2jros9VP
         RqjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RSRPwX1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb21-20020a05622a481500b003a9861da69esi5036267qtb.239.2023.01.09.09.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:30:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RSRPwX1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvuG-0003FS-SY; Mon, 09 Jan 2023 12:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtn-0002mk-5u; Mon, 09 Jan 2023 12:25:27 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtj-0000yV-UY; Mon, 09 Jan 2023 12:25:25 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so21943913ejc.4;
 Mon, 09 Jan 2023 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMdn1pWnXwwaTdih9emYCZADk1B97e7zAw/7nMQYL5E=;
 b=RSRPwX1sAgWcXr8fKGZHpY5BnMO7NdW5CR7eZHLX7HT1BxsbQf2j6r1obCUK2RzIuG
 Rr734INhE4fqwibDAH+XpffWN3sNdQRvyfrGDLKZ7CT6Zl8rJONF+ZkYIigK465e+821
 FjaV9Sg+wMzY+Os5tVJoabJy9OynchUBzqQ8zhjZy8T+ysY24s0gsCMcsp6YpgG9K24S
 q4LUVyFrK7GEOa9LEt3HKopOFErdSugWr0KFINj1zcnVgp9IdOFvhkXwEiaucjWIAqvM
 OpuO3K4F5mMjPJk8MLCUNENk5rO86yqgo0MP3ACerBaMS4H7Xw/QDGYrVAOuFqnh+Rql
 VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMdn1pWnXwwaTdih9emYCZADk1B97e7zAw/7nMQYL5E=;
 b=hrs52ueJEIDbGk4Om1FRwN0jUHxxErnq5DPJWBUm46qN8OBJeA0SNGF7m1CKXw4fXF
 z+yLUjqMTNccMpmCVjnOEzfP8XPFcGA0e7QbtzI6AhlGTDtwIAKK+eOMH9P1rM6pBito
 tJFvuGpPg0RVW7Se6/FN45bGzt/FancFzf2rBVO74T8ANCopThzqMYFd+pT9Lxwkehd5
 newQFgAA8Gx9s6kEq0o3yAr4rNZSstwMBrgOWmTrKL8X9IQVnB4YTMbaOw0dlypBIx0i
 QtjC4OT+NaNQvF4yLqm8bWA7JQIImGCL992K0Ns5Jeiis7HeGavKA2gO/UyyulAI0A3Q
 zp1Q==
X-Gm-Message-State: AFqh2koUZFAkHX05cx48hcPFUyhs9vmxeHC15F5zNGU6dQkkYVH3hjlb
 2omWBG4b3nByce0recqXDcUvQ9s02Bffzw==
X-Received: by 2002:a17:906:30c9:b0:78d:f457:1052 with SMTP id
 b9-20020a17090630c900b0078df4571052mr53566286ejb.15.1673285121595; 
 Mon, 09 Jan 2023 09:25:21 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:21 -0800 (PST)
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
Subject: [PATCH v6 25/33] hw/isa/piix4: Use TYPE_ISA_PIC device
Date: Mon,  9 Jan 2023 18:23:38 +0100
Message-Id: <20230109172347.1830-26-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: U/tFsqiw/N7K

Aligns the code with PIIX3 such that PIIXState can be used in PIIX4,
too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-33-shentey@gmail.com>
---
 hw/isa/piix4.c  | 28 ++++++++++------------------
 hw/mips/malta.c | 11 +++++++++--
 hw/mips/Kconfig |  1 +
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9edaa5de3e..eae4db0182 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -44,9 +44,8 @@
 
 struct PIIX4State {
     PCIDevice dev;
-    qemu_irq cpu_intr;
-    qemu_irq *isa;
 
+    ISAPICState pic;
     RTCState rtc;
     PCIIDEState ide;
     UHCIState uhci;
@@ -82,7 +81,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(s->isa[pic_irq], pic_level);
+        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
     }
 }
 
@@ -149,12 +148,6 @@ static const VMStateDescription vmstate_piix4 = {
     }
 };
 
-static void piix4_request_i8259_irq(void *opaque, int irq, int level)
-{
-    PIIX4State *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void piix4_rcr_write(void *opaque, hwaddr addr, uint64_t val,
                             unsigned int len)
 {
@@ -190,7 +183,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     PIIX4State *s = PIIX4_PCI_DEVICE(dev);
     PCIBus *pci_bus = pci_get_bus(dev);
     ISABus *isa_bus;
-    qemu_irq *i8259_out_irq;
 
     isa_bus = isa_bus_new(DEVICE(dev), pci_address_space(dev),
                           pci_address_space_io(dev), errp);
@@ -198,20 +190,18 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
 
-    qdev_init_gpio_out_named(DEVICE(dev), &s->cpu_intr,
-                             "intr", 1);
-
     memory_region_init_io(&s->rcr_mem, OBJECT(dev), &piix4_rcr_ops, s,
                           "reset-control", 1);
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &s->rcr_mem, 1);
 
     /* initialize i8259 pic */
-    i8259_out_irq = qemu_allocate_irqs(piix4_request_i8259_irq, s, 1);
-    s->isa = i8259_init(isa_bus, *i8259_out_irq);
+    if (!qdev_realize(DEVICE(&s->pic), NULL, errp)) {
+        return;
+    }
 
     /* initialize ISA irqs */
-    isa_bus_irqs(isa_bus, s->isa);
+    isa_bus_irqs(isa_bus, s->pic.in_irqs);
 
     /* initialize pit */
     i8254_pit_init(isa_bus, 0x40, 0, NULL);
@@ -224,7 +214,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    s->rtc.irq = isa_get_irq(ISA_DEVICE(&s->rtc), s->rtc.isairq);
+    s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
     /* IDE */
     qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
@@ -251,7 +241,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
             return;
         }
-        qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->isa[9]);
+        qdev_connect_gpio_out(DEVICE(&s->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&s->pic), 9));
     }
 
     pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
@@ -261,6 +252,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
+    object_initialize_child(obj, "pic", &s->pic, TYPE_ISA_PIC);
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
     object_initialize_child(obj, "ide", &s->ide, TYPE_PIIX4_IDE);
 }
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 4a2e0edd98..55f3e0c54a 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -29,6 +29,7 @@
 #include "qemu/guest-random.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
+#include "hw/intc/i8259.h"
 #include "hw/isa/superio.h"
 #include "hw/char/serial.h"
 #include "net/net.h"
@@ -1280,10 +1281,11 @@ void mips_malta_init(MachineState *machine)
     PCIBus *pci_bus;
     ISABus *isa_bus;
     qemu_irq cbus_irq, i8259_irq;
+    qemu_irq *i8259;
     I2CBus *smbus;
     DriveInfo *dinfo;
     int fl_idx = 0;
-    int be;
+    int be, i;
     MaltaState *s;
     PCIDevice *piix4;
     DeviceState *dev;
@@ -1459,7 +1461,12 @@ void mips_malta_init(MachineState *machine)
     pci_ide_create_devs(PCI_DEVICE(dev));
 
     /* Interrupt controller */
-    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pic"));
+    i8259 = i8259_init(isa_bus, i8259_irq);
+    for (i = 0; i < ISA_NUM_IRQS; i++) {
+        qdev_connect_gpio_out(dev, i, i8259[i]);
+    }
+    g_free(i8259);
 
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index 4e7042f03d..d156de812c 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -1,5 +1,6 @@
 config MALTA
     bool
+    select I8259
     select ISA_SUPERIO
     select PIIX4
 
-- 
2.39.0

