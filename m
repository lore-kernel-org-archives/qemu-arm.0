Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp429615lft;
        Wed, 29 Jun 2022 06:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sE3ZQDMosMn2R3mdKnHG082WdPzQQmG2+36OTWAHoqs0oubYjPK/Az0Nd2cZ9ZzCyC+tlj
X-Received: by 2002:a05:6214:1d2e:b0:470:462b:1ae5 with SMTP id f14-20020a0562141d2e00b00470462b1ae5mr7748585qvd.29.1656507930925;
        Wed, 29 Jun 2022 06:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656507930; cv=none;
        d=google.com; s=arc-20160816;
        b=Fxlq4tPo7BY7AqtbAMvV4wy6vhVy3b8g6bvw4QnvPCWu2V2m705A1mqKb/6ShFdLz3
         7yjGH8vFpQ4pupZ6/qricY0zl3CFO4HKxoM+iy3utND6wn8VMkvcWazLBKmyZXq9Vy4W
         bdzrQahetmsHMCOFJGl0H27MNWM4ikRc0VVWiuANKNrxbvsqFavFymWLcyvpQvr8qQBl
         L/jvz0Qj5y749PUQOoEw6tTyranyhXQ1suCyK6dbj/OfdKb3y1X2FeI6YGEj4RyIUYJw
         aq3mAXYJJO19mwJwABsJHBUMzxf1IVlrOxThhgy++UvPF1hZ7VR0/OMlvac660B3eI1D
         jZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=k6ixRlhRQBrdejO76MPeuD87rJK/SJ8x4SSvtVymr1I=;
        b=v/6RK4tXAKLte2HM1PBVExQE7Sa9qP+vsjtJm0XIY+qJvhnTl9Nb4KESZVLjDpP1y1
         vuMTGkQc29X2YOX2MlxQ9RmJixJPONt5j9i59nNus/+LtcFTDo+mJwM1vGLA6Lcpxi1h
         5psv9dlF1ooEKLEV+xmxNjKPolX/GydPeDKiigc8y3go/n9XlA7iGG6/qt0tqO5V0GTO
         534/XdUsQ7sFepQHm/AT2yBDvL9+tNsPdiNupzqvRDBOPTl7Nnm9PO7M42RM0xn6GyTj
         XV1slIwXTrs2nrKrLd/RMCUkCrBQ1/Ed/MLuAnDoZof/ydIOsA0VeK1rp9Ooz9+nZ2bS
         TpUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=od9s2kvf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da19-20020a05621408d300b004646640422csi7047695qvb.593.2022.06.29.06.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=od9s2kvf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:37740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XNq-0000f2-8P
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0y-0008UA-Jw; Wed, 29 Jun 2022 08:41:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X0s-0004iq-Te; Wed, 29 Jun 2022 08:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k6ixRlhRQBrdejO76MPeuD87rJK/SJ8x4SSvtVymr1I=; b=od9s2kvfXeqgnnELs7ZujeMxth
 XB3RKT/iCdOwBYH7ZMsiJ+j2Vnd5sWdZ/JPJsv7CBA9+U71v4MIvRW2V1dFiude2sRuC8UoBSSkHL
 1re0RutwYjcAbwddnwXFJEaJmYaqX8ejHftrC9nTVpAtpexZ1lKmdcXSFQQjW1J1FhTXrUBhNbv0A
 5jjn3tj/lTLJzRlSCzAU1cPsmKiEtp93t/yklQPnwWCe6myhXPe+mn3x5HS1WT09tY1cb4rIK5SKM
 xyEEugSHNsLi2pFI2E2aGno5lkYt5Mqxs36R6GRoSEvTK719ik8CfSjpNp924bM3ANSL9Fv5Itn4K
 8vsqozRE5qzZ5h6XE1H4/9TmJGRnLBLkh6T4/TqSYVVFLFKjXmHYd9EiAkcVpgOcSmFIlAuTtRO0c
 aNGrnJgtwfeQrZFXqc8xldyjF2+DK8al5yvikFtydmC41PYNzsPuUi66A+Ep5glXVRb4z7xvydoMo
 I+97T7HMiTYZIw8nIz0jbanMxm9ix8GbkKi/nR0y47V/RYqo3SdImnHaaPc7jZCoSAiFZ+qpXJHR+
 DZQS2CODYbBktj0hZF3o94rCEFa7trNadE1fUYI9Vhkf/sGbHfmo0SbnNYemOoBWW/6dkdDn2m9hp
 nwz1BShfsiZn1KstI3JticuDGOJ3GqJ4lgjQdf2l0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6WzE-0002tZ-8s; Wed, 29 Jun 2022 13:40:08 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:05 +0100
Message-Id: <20220629124026.1077021-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 19/40] lasips2: move keyboard port initialisation to new
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FtzatIslmIxw

Move the initialisation of the keyboard port from lasips2_init() to
a new lasips2_kbd_port_init() function which will be invoked using
object_initialize_child() during the LASIPS2 device init.

Update LASIPS2State so that it now holds the new LASIPS2KbdPort child object and
ensure that it is realised in lasips2_realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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

