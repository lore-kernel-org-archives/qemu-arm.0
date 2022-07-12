Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1707774lfp;
        Tue, 12 Jul 2022 15:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9heS6i15q5ajmIHUOW3mtVkXCocX110SKttttQvs6XiucgTKPoQreaBSi1sFYJ/qOMUu/
X-Received: by 2002:ac8:7e8d:0:b0:31e:b5cd:4cf2 with SMTP id w13-20020ac87e8d000000b0031eb5cd4cf2mr157181qtj.37.1657663810324;
        Tue, 12 Jul 2022 15:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657663810; cv=none;
        d=google.com; s=arc-20160816;
        b=lAi4foWO0Ivs7ma7LJUOcaTgEat+tq2IBxumx33uKvLZJ4ehk7O7WWihI3QKjZKloF
         pdX+yH0BaXV65ZImz+zgvlU5kBMtHpuIH26TFpVLntmiblfvIQrQdUcMQ5vw6GK5Wt2k
         FvDxxTEJFcVmsRE0QdDcovQhRd5jg+DtXZKqbZD4ZVp1Pu5ZDFT3/e+lGB54OjGfpi9k
         9t0ULN8Vbc9D68ScAvDSITc6om7txFYnNk2xEC3AlkR6JhJaDGzgEQKIZOLbfoybHyp6
         j2sUD7FB5HUnppW/a/heXla8yoykMVH2ISlmBCJGDgwCggm9+5LFQhE0l50eOe/4t7rn
         T12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=7VonB9otHaI0cb+mvGnQodb+2sGUOEDb+7wWM+xUCpg=;
        b=WNVyETKluA9kmPxDgloSawkAdP9Rdj+Ml8vUjz8tz/R1V4zDBSFQ7HX61Obw1rEyT0
         YxooyOQsGLfIbJ2An2yZ7rVe50PF34ZM/6XhCqk6KPjAN5E6rRWlwsy0o3KJ27/qus4V
         lwjdNuYuBZnEcgF8h7iI/0z1ygwz4JF0eZDLZaNGfJNTp6sOASneDAapHacIzjIRk99i
         /WADgXUTwgU7D5o4upP7w1q77+B0z0AW20nV635kHBvzaHwlrm2TwwVgnp4a/RzuQXtW
         CWqWuunEUblC6ClRz2uqvEIdZK5diDQ9OOu50IoXdJ6HA+LZQrH0Mvc1McWLpI9Gjq+b
         xOuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AFLrJe7e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k63-20020a37ba42000000b006b5b7a0a643si39246qkf.655.2022.07.12.15.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AFLrJe7e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBO53-0001uW-Ms
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNq1-000386-JO; Tue, 12 Jul 2022 17:54:37 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNpx-0007t6-5N; Tue, 12 Jul 2022 17:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7VonB9otHaI0cb+mvGnQodb+2sGUOEDb+7wWM+xUCpg=; b=AFLrJe7e3S+NolAuX4CRnjtV5i
 0uGvRzU6PfLW4mxhhjvSen7kQAoIzLsP+nNowUzSbq9TZHCTo9CJe9qt9IP5i+WKl2pTox3CPx4Qu
 CXLvL4XZdRqhxvHN4quDiziF/Rm7ybasa19vESVc0EiWOkZ5SzP8yzwMfqyqwp9yJjGw8HAsiiBYS
 vhO5JCS8xPQnCnnlWvuXN56tuUN72uV0D7xG5tlaS2TY/8n/YFeEiZNrmQNhUjKhPsYVVSH9dOa8r
 pIy0jWac7q36djHwRi8Fu+Ca8V4nZCpWc+yUpciocm/HmF99Ld+IbzVB7shCkaCcfF4nIiFz15uLY
 NIX6Hkhk9tsk+lGRa8+OHg204WMw0KlyWAfarDOao8XPOFKmZ4+muBCkCoGURFpRZ0TBHvHhgT1qc
 us2AQNCVpJMvxGqncivnjwCOrTJenpgFZp+JvCYMWFFF0oKMIRqB3QoRrKBtQHctS9NhP2zrRggKH
 zuSE4da2WYTTjGbVDiBshNNTOyDc1AYgLqlVPNw1t+ujm8Jp0NSeRYT/Prey33fdMQQ55/IyNYVlG
 WBX8shj+A3DOqd6GbBn/NQ2y5nz9rg7OVm6Wj5N98FFGpBiWsF50hdSmKxMXO4zt0yJs4RsNRLezW
 jwi0qp8ztWWR6H5DANP4r0aP86JRhI1A9UsOvUwnY=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoC-000Bqt-LJ; Tue, 12 Jul 2022 22:52:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:30 +0100
Message-Id: <20220712215251.7944-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 19/40] lasips2: move keyboard port initialisation to new
 lasips2_kbd_port_init() function
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
X-TUID: k5KzlDVBiBGv

Move the initialisation of the keyboard port from lasips2_init() to
a new lasips2_kbd_port_init() function which will be invoked using
object_initialize_child() during the LASIPS2 device init.

Update LASIPS2State so that it now holds the new LASIPS2KbdPort child object and
ensure that it is realised in lasips2_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c         | 47 ++++++++++++++++++++++++++------------
 include/hw/input/lasips2.h |  2 +-
 2 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index f70cf893f6..74427c9990 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -40,9 +40,9 @@ static const VMStateDescription vmstate_lasips2 = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(kbd.control, LASIPS2State),
-        VMSTATE_UINT8(kbd.id, LASIPS2State),
-        VMSTATE_BOOL(kbd.irq, LASIPS2State),
+        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
+        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
+        VMSTATE_BOOL(kbd_port.parent_obj.irq, LASIPS2State),
         VMSTATE_UINT8(mouse.control, LASIPS2State),
         VMSTATE_UINT8(mouse.id, LASIPS2State),
         VMSTATE_BOOL(mouse.irq, LASIPS2State),
@@ -119,8 +119,8 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd.irq | s->mouse.irq);
-    qemu_set_irq(s->irq, s->kbd.irq | s->mouse.irq);
+    trace_lasips2_intr(s->kbd_port.parent_obj.irq | s->mouse.irq);
+    qemu_set_irq(s->irq, s->kbd_port.parent_obj.irq | s->mouse.irq);
 }
 
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
@@ -211,7 +211,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd.irq || port->parent->mouse.irq) {
+        if (port->parent->kbd_port.parent_obj.irq || port->parent->mouse.irq) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -240,7 +240,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
 static void lasips2_set_kbd_irq(void *opaque, int n, int level)
 {
     LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = &s->kbd;
+    LASIPS2Port *port = LASIPS2_PORT(&s->kbd_port);
 
     port->irq = level;
     lasips2_update_irq(port->parent);
@@ -258,9 +258,15 @@ static void lasips2_set_mouse_irq(void *opaque, int n, int level)
 static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
+    LASIPS2Port *lp;
 
-    s->kbd.ps2dev = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd.ps2dev), PS2_DEVICE_IRQ,
+    lp = LASIPS2_PORT(&s->kbd_port);
+    if (!(qdev_realize(DEVICE(lp), NULL, errp))) {
+        return;
+    }
+
+    lp->ps2dev = ps2_kbd_init();
+    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
     s->mouse.ps2dev = ps2_mouse_init();
@@ -272,18 +278,19 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
 static void lasips2_init(Object *obj)
 {
     LASIPS2State *s = LASIPS2(obj);
+    LASIPS2Port *lp;
+
+    object_initialize_child(obj, "lasips2-kbd-port", &s->kbd_port,
+                            TYPE_LASIPS2_KBD_PORT);
 
-    s->kbd.id = 0;
     s->mouse.id = 1;
-    s->kbd.parent = s;
     s->mouse.parent = s;
 
-    memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
-                          "lasips2-kbd", 0x100);
     memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
                           "lasips2-mouse", 0x100);
 
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->kbd.reg);
+    lp = LASIPS2_PORT(&s->kbd_port);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &lp->reg);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
@@ -318,10 +325,22 @@ static const TypeInfo lasips2_port_info = {
     .abstract      = true,
 };
 
+static void lasips2_kbd_port_init(Object *obj)
+{
+    LASIPS2KbdPort *s = LASIPS2_KBD_PORT(obj);
+    LASIPS2Port *lp = LASIPS2_PORT(obj);
+
+    memory_region_init_io(&lp->reg, obj, &lasips2_reg_ops, lp, "lasips2-kbd",
+                          0x100);
+    lp->id = 0;
+    lp->parent = container_of(s, LASIPS2State, kbd_port);
+}
+
 static const TypeInfo lasips2_kbd_port_info = {
     .name          = TYPE_LASIPS2_KBD_PORT,
     .parent        = TYPE_LASIPS2_PORT,
     .instance_size = sizeof(LASIPS2KbdPort),
+    .instance_init = lasips2_kbd_port_init,
 };
 
 static const TypeInfo lasips2_mouse_port_info = {
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index aab6a3500c..f728f54c78 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -60,7 +60,7 @@ struct LASIPS2MousePort {
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
-    LASIPS2Port kbd;
+    LASIPS2KbdPort kbd_port;
     LASIPS2Port mouse;
     qemu_irq irq;
 };
-- 
2.30.2

