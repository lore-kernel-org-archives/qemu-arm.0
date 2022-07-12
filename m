Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1711365lfp;
        Tue, 12 Jul 2022 15:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uijAQLQQQ4TWGABGHm1AYUSPL/5csl2wyt1Z1biij8BoH2Y6DygDyqhXYQHoEj5FTan0x5
X-Received: by 2002:a05:6214:262b:b0:473:7eaf:27ed with SMTP id gv11-20020a056214262b00b004737eaf27edmr333943qvb.131.1657664386605;
        Tue, 12 Jul 2022 15:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657664386; cv=none;
        d=google.com; s=arc-20160816;
        b=gjrcLkMZzCt2MAq34+9bWRklvsB3Lc1M03BngVFrOwqKgys/KPcGkOOv6sCgNt6IFA
         kS28Bj9QwjjVDhramlsrD/5NTfzakNliCvSgAiOyr6cQ3a5dl2uSKRWsS7X3FcLg06JB
         uaUuLpJmDIl1WVIKqkrUEH6FOLrq6F7X2Veg8vg8rHapZuS9kbyYPw8huYQHCe2GRGI5
         /+hUeTOfjO0jR8aJjsYjVnuFZdCnUlwb2f6QoiiamfUbCMZaxOmxhdtRx3BXn216UTyR
         l7IjDFObdVHU5eYiJAM61o5zJ2Ues94BTKvtiGS+pUrfw5xTJbFYW7ZIxFvpk3rplPA0
         I8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Y++dPXdHU1fx9UmmrhbzCoBL15uAK8uWNBcqmziUOLA=;
        b=ZfZycnTrywAAaZfsutOwBWxuCppYoH4jC7gJppUGUN1WV0O923cone1AePwdXn9tUX
         xebkZEeHlGx2eA7GRVAy4Bj9qQPIDPQGf5lJqYSOynXmeovcdMPZwCGnGh04t52PIpcR
         uZQF6eZfV2saDixfgsTgCxvggU5fXoEQV8/MeAl6OKhEPuOEHHam5Sf4aNA61HphUGle
         xwUhlqDqGhiGBIaB50qLsRNiO6hInNi/+ZSi1OUbnP1GFyxubWBeGE4oLxaSFZ76LGiq
         9yCvFfCtAi0QXDrEHiBoOmsj3yy821lXFsaKZH7/UGYiZHFQx8H2jaY7Z5/vDCKmUwoS
         XaqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AM3RlZRe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fz6-20020a05622a5a8600b0031bf483b05bsi6772253qtb.478.2022.07.12.15.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=AM3RlZRe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBOEM-0004nL-0W
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqV-0004F5-An; Tue, 12 Jul 2022 17:55:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqS-0007xA-CJ; Tue, 12 Jul 2022 17:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y++dPXdHU1fx9UmmrhbzCoBL15uAK8uWNBcqmziUOLA=; b=AM3RlZReKdCp+EIVMEKgmnydCE
 2PvyLvIvT2h9C6L1zmJ+qrRWIWVMpH03GReY2Ire16pt67osDAf5gXK3BxMzapFVJwCXozYsmUzvy
 a71wKkStH6Wk3sDrhIlFrCbhg8NauSb1bb7v89Igm+rhShBEfaQ0Cp6YcGh9eroOaMygWcltexC44
 8K0pwCVtjEuQiVFRCQFqKEpKZQYTXdQNffV/JOeVD/ANm56+YTQBvKJS6w67JX+Jo+zzWR18cjX+S
 mUfQymMglBf7lNDoHZdHIwzDwxLI32zDTeSRzvnMPEKhV0oo3fU72JPjg5Pfu1RMscRzSy6ZDEC/a
 veub/QHzijRFuR/AvRc+kWc0ny4X91NZcWygW6LzDhEoh1pWtNLstzN7/uyADNbiD92Dachao/ISm
 HeokUWFLVrsXcunEEgxvrhWyRfN38qFDiGQzrzwHOGHf4Ej3P2pDI06B6EBBTB2+Ci4hK4oOOuVKe
 wnINLt2aGeKqkyJ7JAkbEwTCqNmSDlmqqBCFRBhKPuFWg6G+Q5go+GYfW+t5tOjksdCkzLAx2+Yqg
 ugkgNQXgtA2w/t+kKhKjuQIa2Uji8XOIOrIIVZnvzJ42E79gKIX8KtYsR/D+TDv058FVQUumClIuv
 CVe63d/0NIPZMIkPzGm4IKqXA8LSFxSESV8sATGto=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoj-000Bqt-7Q; Tue, 12 Jul 2022 22:53:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:39 +0100
Message-Id: <20220712215251.7944-29-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 28/40] lasips2: switch to using port-based IRQs
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
X-TUID: 7fGgyHJ/YMm5

Now we can implement port-based IRQs by wiring the PS2 device IRQs to the
LASI2Port named input gpios rather than directly to the LASIPS2 device, and
generate the LASIPS2 output IRQ from the int_status bitmap representing the
individual port IRQs instead of the birq boolean.

This enables us to remove the separate PS2 keyboard and PS2 mouse named input
gpios from the LASIPS2 device and simplify the register implementation to
drive the port IRQ using qemu_set_irq() rather than accessing the LASIPS2
device IRQs directly. As a consequence the IRQ level logic in lasips2_set_irq()
can also be simplified accordingly.

For now this patch ignores adding the int_status bitmap and simply drops the
birq boolean from the vmstate_lasips2 VMStateDescription. This is because the
migration stream is already missing some required LASIPS2 fields, and as this
series already introduces a migration break for the lasips2 device it is
easiest to fix this in a follow-up patch.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c         | 59 ++++++++++++--------------------------
 include/hw/input/lasips2.h |  7 ++---
 2 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 013d891af6..5ceb38c1af 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -42,10 +42,8 @@ static const VMStateDescription vmstate_lasips2 = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(kbd_port.parent_obj.birq, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
         VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
-        VMSTATE_BOOL(mouse_port.parent_obj.birq, LASIPS2State),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -119,10 +117,10 @@ static const char *lasips2_write_reg_name(uint64_t addr)
 
 static void lasips2_update_irq(LASIPS2State *s)
 {
-    trace_lasips2_intr(s->kbd_port.parent_obj.birq |
-                       s->mouse_port.parent_obj.birq);
-    qemu_set_irq(s->irq, s->kbd_port.parent_obj.birq |
-                         s->mouse_port.parent_obj.birq);
+    int level = s->int_status ? 1 : 0;
+
+    trace_lasips2_intr(level);
+    qemu_set_irq(s->irq, level);
 }
 
 static void lasips2_set_irq(void *opaque, int n, int level)
@@ -154,9 +152,8 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     case REG_PS2_XMTDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
             port->buf = val;
-            port->birq = true;
             port->loopback_rbne = true;
-            lasips2_update_irq(port->parent);
+            qemu_set_irq(port->irq, 1);
             break;
         }
 
@@ -189,9 +186,8 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
 
     case REG_PS2_RCVDATA:
         if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->birq = false;
             port->loopback_rbne = false;
-            lasips2_update_irq(port->parent);
+            qemu_set_irq(port->irq, 0);
             ret = port->buf;
             break;
         }
@@ -226,9 +222,8 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
             }
         }
 
-        if (port->parent->kbd_port.parent_obj.birq ||
-            port->parent->mouse_port.parent_obj.birq) {
-                ret |= LASIPS2_STATUS_CMPINTR;
+        if (port->parent->int_status) {
+            ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
 
@@ -253,24 +248,6 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void lasips2_set_kbd_irq(void *opaque, int n, int level)
-{
-    LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = LASIPS2_PORT(&s->kbd_port);
-
-    port->birq = level;
-    lasips2_update_irq(port->parent);
-}
-
-static void lasips2_set_mouse_irq(void *opaque, int n, int level)
-{
-    LASIPS2State *s = LASIPS2(opaque);
-    LASIPS2Port *port = LASIPS2_PORT(&s->mouse_port);
-
-    port->birq = level;
-    lasips2_update_irq(port->parent);
-}
-
 static void lasips2_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2State *s = LASIPS2(dev);
@@ -281,18 +258,18 @@ static void lasips2_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
-                          qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
-                                                 0));
+    qdev_connect_gpio_out(DEVICE(lp), 0,
+                          qdev_get_gpio_in_named(dev, "lasips2-port-input-irq",
+                                                 lp->id));
 
     lp = LASIPS2_PORT(&s->mouse_port);
     if (!(qdev_realize(DEVICE(lp), NULL, errp))) {
         return;
     }
 
-    qdev_connect_gpio_out(DEVICE(lp->ps2dev), PS2_DEVICE_IRQ,
-                          qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
-                                                 0));
+    qdev_connect_gpio_out(DEVICE(lp), 0,
+                          qdev_get_gpio_in_named(dev, "lasips2-port-input-irq",
+                                                 lp->id));
 }
 
 static void lasips2_init(Object *obj)
@@ -312,10 +289,6 @@ static void lasips2_init(Object *obj)
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
-    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_kbd_irq,
-                            "ps2-kbd-input-irq", 1);
-    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
-                            "ps2-mouse-input-irq", 1);
     qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
                             "lasips2-port-input-irq", 2);
 }
@@ -381,8 +354,10 @@ static const TypeInfo lasips2_port_info = {
 static void lasips2_kbd_port_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2Port *lp = LASIPS2_PORT(dev);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
     lp->ps2dev = ps2_kbd_init();
+    lpdc->parent_realize(dev, errp);
 }
 
 static void lasips2_kbd_port_init(Object *obj)
@@ -416,8 +391,10 @@ static const TypeInfo lasips2_kbd_port_info = {
 static void lasips2_mouse_port_realize(DeviceState *dev, Error **errp)
 {
     LASIPS2Port *lp = LASIPS2_PORT(dev);
+    LASIPS2PortDeviceClass *lpdc = LASIPS2_PORT_GET_CLASS(lp);
 
     lp->ps2dev = ps2_mouse_init();
+    lpdc->parent_realize(dev, errp);
 }
 
 static void lasips2_mouse_port_init(Object *obj)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index b79febf64b..7199f16622 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -12,10 +12,8 @@
  * + sysbus MMIO region 1: MemoryRegion defining the LASI PS2 mouse
  *   registers
  * + sysbus IRQ 0: LASI PS2 output irq
- * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
- *   keyboard device has asserted its irq
- * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
- *   mouse device has asserted its irq
+ * + Named GPIO input "lasips2-port-input-irq[0..1]": set to 1 if the downstream
+ *   LASIPS2Port has asserted its irq
  */
 
 #ifndef HW_INPUT_LASIPS2_H
@@ -46,7 +44,6 @@ struct LASIPS2Port {
     uint8_t control;
     uint8_t buf;
     bool loopback_rbne;
-    bool birq;
     qemu_irq irq;
 };
 
-- 
2.30.2

