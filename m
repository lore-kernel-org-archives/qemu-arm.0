Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp359958lft;
        Fri, 24 Jun 2022 07:22:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1svfldzh2WopO+ONmbSSKM3FDyUUW4LPEOupn5k3895vi2A1Hvs5OuBoogoLRCcsEGgS+si
X-Received: by 2002:a05:6214:ac2:b0:46e:7e2a:ada with SMTP id g2-20020a0562140ac200b0046e7e2a0adamr33251354qvi.81.1656080522693;
        Fri, 24 Jun 2022 07:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656080522; cv=none;
        d=google.com; s=arc-20160816;
        b=I3X2l7kBDzXt9eOU2rAamzA0YcMcX8m6o/Qct6m0nZ8ST6qeVNO2scOjtam5BTC3Fu
         h+eMAbCrvxdPt0VMeovOyPR4oLT8xaLbTZbcGp+CTHoNsgFaMvFmHh3xS3mvgwSI4Fdl
         3EEUbso+C2gvs81/WwiVbqDHox7NTZ1Uuc4XR0yq7BcdUKJy2GD/caN57NPBAmzMIM+e
         SJisP1uHaA6+Dp3KKMJfGbzveVRKJ76Zzor5uP6wwcSox+3slKK05ErscByeLki5Zpbz
         1UZIMLZ9xNj0QHgtC6iAv4vnmrp7mXLbn/1/aPDc05IObL2YmzbCe108zbTrZJCTc7jT
         GLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1ziIIUpFc5E35r0AnNosnNGeFEOoSVqErikcGd+BEFg=;
        b=BWyRJRMioUc5zG2Z3VxPj9T/AEB9UsFUaAwSv/06RvDXZkvqvZewyVTpi6cr952+0s
         P/tHg0JoxB1rwV6f18lKq44DgY07O3tVh7AmV57It9BdfMlBHs+Jh+iCePc8+ZJPN+3C
         yLNeFk/rWLCOV23Uh2CvQCcus8amRzthfygFxkgwJj2Kpr7zdLZNPPXPOrReJpU5C/M5
         nH/8BbvrQu5K6THYnSV/VtMvnw5InXW6DbfA21nt+neLn6GwgAo5nmdMBmJw+cJx9RAj
         Ljkgt7ZTIPpROZdzgSqCtYeSgZLXNa2TwFkQ8jp7JV6tHTsI7oL6jd6J5ZzackvjlaOz
         irWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="O/uJGN3T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj18-20020a056214529200b004706122e32asi1388451qvb.333.2022.06.24.07.22.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="O/uJGN3T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kCA-0002is-5p
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jc0-0004q5-Bl; Fri, 24 Jun 2022 09:44:40 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jby-0005ZG-E3; Fri, 24 Jun 2022 09:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ziIIUpFc5E35r0AnNosnNGeFEOoSVqErikcGd+BEFg=; b=O/uJGN3TZzAXelT2mwiRbqZcBf
 dFa/9LZ6E0FeamDAS81IHFf8sADcPCOKiUu4xheCWpsQwxOryfFyWJTiZMh26PWQYynKbD21zIzRG
 eDS8UtR82MkATaI022BHvW899hpLPufPexKuJADockNZPWi6ui76HkilsP6xLaKtX+hTw43AKF0pq
 JmwuwpkUfJynrDBV3JpwBldT1LXp+v3TOiqPuZPiY3BWfFFGUSbt5Oy93xesdjyvxAztgKn81nTWf
 lNpTq6ogD6vZ0vTzdwkYumQk7Z+nfPJiXNyL44OSuXj6zlZ3aknd1pfOkmzHz4r5VzSH9so7xhnOX
 B9CR7MBu8Ph7MrJzlVW1qj/spZkCOUVNMJp0D0olH9oI/wGLwjcLKfCa4th2K3cmZDjhVflC8Ribs
 mhDITa6SzI89h1d8x+dyspbvzYKvbjwd6Kitq9FT6sjnEqBGrmMzWfQjPFU6J//wJ6o9qMlgdT4bv
 ZVzOkfVmDBvOhDMGxmSo+ZwqXNGn9wHorAv9AA3RSGymCs+veE/ro1xbMTr+kSvGKzpo55YyRgHYq
 YeTT9wvFfF3jzjWHGxvs9DF0oMZ62Cf8JcEdA8lrwIGFUXnpPMl9KEUuiwOZy/5PE5Tg9+xWc+8Sf
 EkFntA/22DUH4aIwSZ0W+Wul3YEDlfT71dPKhwD0s=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaN-00037t-U9; Fri, 24 Jun 2022 14:43:00 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:04 +0100
Message-Id: <20220624134109.881989-50-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 49/54] pckbd: switch I8042_MMIO device from update_irq()
 function to PS2 device gpio
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lbctbir3+owY

Define a new qdev input gpio for handling incoming PS2 IRQs, and then wire up the
PS2 keyboard and mouse devices to use it. At the same time set update_irq() and
update_arg to NULL in ps2_kbd_init() and ps2_mouse_init() to ensure that any
accidental attempt to use the legacy update_irq() function will cause a NULL
pointer dereference.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 5d7c969fc6..ee306428a3 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,6 +665,22 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_set_kbd_irq(void *opaque, int n, int level)
+{
+    MMIOKBDState *s = I8042_MMIO(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_kbd_irq(ks, level);
+}
+
+static void i8042_mmio_set_mouse_irq(void *opaque, int n, int level)
+{
+    MMIOKBDState *s = I8042_MMIO(opaque);
+    KBDState *ks = &s->kbd;
+
+    kbd_update_aux_irq(ks, level);
+}
+
 static void i8042_mmio_reset(DeviceState *dev)
 {
     MMIOKBDState *s = I8042_MMIO(dev);
@@ -686,8 +702,14 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
     /* Note we can't use dc->vmsd without breaking migration compatibility */
     vmstate_register(NULL, 0, &vmstate_kbd, ks);
 
-    ks->kbd = ps2_kbd_init(kbd_update_kbd_irq, ks);
-    ks->mouse = ps2_mouse_init(kbd_update_aux_irq, ks);
+    ks->kbd = ps2_kbd_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
+                                                 0));
+    ks->mouse = ps2_mouse_init(NULL, NULL);
+    qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
+                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
+                                                 0));
 }
 
 static void i8042_mmio_init(Object *obj)
@@ -696,6 +718,12 @@ static void i8042_mmio_init(Object *obj)
     KBDState *ks = &s->kbd;
 
     ks->extended_state = true;
+
+    qdev_init_gpio_out(DEVICE(obj), ks->irqs, 2);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_kbd_irq,
+                            "ps2-kbd-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_mouse_irq,
+                            "ps2-mouse-input-irq", 1);
 }
 
 static Property i8042_mmio_properties[] = {
@@ -718,16 +746,14 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                             ram_addr_t size, hwaddr mask)
 {
     DeviceState *dev;
-    KBDState *s;
 
     dev = qdev_new(TYPE_I8042_MMIO);
     qdev_prop_set_uint64(dev, "mask", mask);
     qdev_prop_set_uint32(dev, "size", size);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    s = &I8042_MMIO(dev)->kbd;
 
-    s->irqs[I8042_KBD_IRQ] = kbd_irq;
-    s->irqs[I8042_MOUSE_IRQ] = mouse_irq;
+    qdev_connect_gpio_out(dev, I8042_KBD_IRQ, kbd_irq);
+    qdev_connect_gpio_out(dev, I8042_MOUSE_IRQ, mouse_irq);
 
     return I8042_MMIO(dev);
 }
-- 
2.30.2

