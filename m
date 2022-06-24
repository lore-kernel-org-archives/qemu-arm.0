Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp339038lft;
        Fri, 24 Jun 2022 06:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkITsb7bz6GPdiYRXW/GDc2RZ41Bd2sChf2KK7l2g8/Kdspxg36EHb6Lrf12+X4ZGMRasZ
X-Received: by 2002:a05:620a:4412:b0:6a7:76b5:eff5 with SMTP id v18-20020a05620a441200b006a776b5eff5mr10451431qkp.73.1656078801328;
        Fri, 24 Jun 2022 06:53:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078801; cv=none;
        d=google.com; s=arc-20160816;
        b=NrtoG2xPpKGcc+mYwhyuLL489fFL8kVSFsdpje8Hnt2GufnU9TpqiArZnbn8w5v+th
         c2CewP2GG77KU8wlkZ1eOQDfqVhxDHqcKXlXc+hTWUFv9S/adcFpIxqbk3hqGECOzpbi
         Dr5Pj3AoVM0RF8djWC4D4/fi0BSa4xnR/gtxSDgCOHYx3TC8Y4M/QWI3BrMn4Kp6PCsy
         uJy1y3O/EmgtxPiA5E2TwWNP5VGAo6o2g8osUkoVDL6RuJkr06vkaGwn2e2wOLEDYhrg
         l21cuyZyEu7ESDwauUMJf8j7LAMT5KFlRLTt6IGW1TzD8y22hUh1ZSSvje95VGDdwzeC
         3UcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=iJHx1KzN+frYJabby4L2TTcxcb7fJYorC8rQY39CQB0=;
        b=u8b2NRjeTIajV5sQPOFfx2Flmx0sJKorPVC6JAldMjKndZC3N1RuZIE+jFt3pfxPJ4
         V830X4EgIBz0pf4daAHg2QRJoubRXQFp5ruVvWJ5HTcdxkNTu/fHkD5D2HZgIMBtUH6l
         Bftxfw0NGA5i9lrF92zSTY8KUQjHO3bHTdD74r0klUc3Rw3xmUIzjwcuGA3tyHtfloOf
         /y3wVG+vsRakXItQZJuvM2mR9EYXLOd6QNylIyovOVKWa1ZliVx9EBFnzyzMKXZptTB8
         XVaZecY2Ncrphri92WwwUhJ8TnXVIl7OqsXClYT1CCtDx32j0k2lc8R/QRPzH/kwLDgj
         8Ydw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=woHbWkhd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a05621420e700b004702e36ffb7si1434811qvk.4.2022.06.24.06.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:53:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=woHbWkhd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jkO-0000Ov-NN
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZM-0007oB-LA; Fri, 24 Jun 2022 09:41:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZK-00056A-UV; Fri, 24 Jun 2022 09:41:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iJHx1KzN+frYJabby4L2TTcxcb7fJYorC8rQY39CQB0=; b=woHbWkhd9k6adNf4D8Erv0q4Q8
 w9xnnhfaFbciMw2ifDKbq20lBcVg6ZbqQX4AZ88OCa2HMHwOW7ONPkOwDVlJvsfNEebgwQiDKPfqw
 pTiDWqAjZ+jnZYXz8HFi123VXmW2opNGG2cWHN3eEfF6BHZszDkZx6m0a4aN3xlCy3VqDWoiCSmpx
 srWN7Trh4yKgF5VAZQpQ9yAVIarntS3xnsoU9uNS4R+XsZCJx2v38Uk/p4ZtQaA7GcFK1htHP91aI
 Wd2DIsxeLATZZaQB4QprDTHmstbYghCFwjQRzag0hmparHfSKWUMf6PfPSp0OCMwXEk15jnQwKvX8
 5B1V9Ytvr7kPp36vkfmilj4x0v2VZ99VoNx1rvv9Gy8uUYK7QFw9RG1DUcITSi2aH8pW1+GJ9vzTl
 FIA2ooWzTMdMODDKcAva8wDmHusarc8bl/rMV+agzKRRvWUnyajIYb+q8A3uQDTI4d8Wt5/QLYqNX
 HNKQ48ZHDYSapY1mzPH0333cgRfc9SyrlavD0shj5KB3Q2ssTgdIxOkJBl7TmwHlaiz6R60VaLP2H
 wNPPB1UbYhwKLXcBlrLK0KmbNeVLK/wWkOdvAmlJSC7MXe0SilY7ayFB7YghxSHg9+dueookgDK28
 sdUqrEMovOR72oxmy00tvhPbK2Tav0R8Srjct+C6o=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jY1-00037t-G2; Fri, 24 Jun 2022 14:40:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:23 +0100
Message-Id: <20220624134109.881989-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 08/54] ps2: implement ps2_reset() for the PS2_DEVICE QOM
 type based upon ps2_common_reset()
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
X-TUID: Cgo2FZMtT8bf

The functionality of ps2_common_reset() can be moved into a new ps2_reset() function
for the PS2_DEVICE QOM type. Update PS2DeviceClass to hold a reference to the parent
reset function and update the PS2_KBD_DEVICE and PS2_MOUSE_DEVICE types to use
device_class_set_parent_reset() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c         | 48 ++++++++++++++++++++++++++++++------------
 include/hw/input/ps2.h |  2 ++
 2 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index fd5236690a..f6f5514f0b 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -995,8 +995,10 @@ void ps2_write_mouse(PS2MouseState *s, int val)
     }
 }
 
-static void ps2_common_reset(PS2State *s)
+static void ps2_reset(DeviceState *dev)
 {
+    PS2State *s = PS2_DEVICE(dev);
+
     s->write_cmd = -1;
     ps2_reset_queue(s);
     s->update_irq(s->update_arg, 0);
@@ -1028,26 +1030,28 @@ static void ps2_common_post_load(PS2State *s)
     q->cwptr = ccount ? (q->rptr + ccount) & (PS2_BUFFER_SIZE - 1) : -1;
 }
 
-static void ps2_kbd_reset(void *opaque)
+static void ps2_kbd_reset(DeviceState *dev)
 {
-    PS2KbdState *s = (PS2KbdState *) opaque;
-    PS2State *ps2 = PS2_DEVICE(s);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
+    PS2KbdState *s = PS2_KBD_DEVICE(dev);
+
+    trace_ps2_kbd_reset(s);
+    ps2dc->parent_reset(dev);
 
-    trace_ps2_kbd_reset(opaque);
-    ps2_common_reset(ps2);
     s->scan_enabled = 1;
     s->translate = 0;
     s->scancode_set = 2;
     s->modifiers = 0;
 }
 
-static void ps2_mouse_reset(void *opaque)
+static void ps2_mouse_reset(DeviceState *dev)
 {
-    PS2MouseState *s = (PS2MouseState *) opaque;
-    PS2State *ps2 = PS2_DEVICE(s);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_GET_CLASS(dev);
+    PS2MouseState *s = PS2_MOUSE_DEVICE(dev);
+
+    trace_ps2_mouse_reset(s);
+    ps2dc->parent_reset(dev);
 
-    trace_ps2_mouse_reset(opaque);
-    ps2_common_reset(ps2);
     s->mouse_status = 0;
     s->mouse_resolution = 0;
     s->mouse_sample_rate = 0;
@@ -1227,7 +1231,6 @@ void *ps2_kbd_init(void (*update_irq)(void *, int), void *update_arg)
     vmstate_register(NULL, 0, &vmstate_ps2_keyboard, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_keyboard_handler);
-    qemu_register_reset(ps2_kbd_reset, s);
     return s;
 }
 
@@ -1255,26 +1258,45 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     vmstate_register(NULL, 0, &vmstate_ps2_mouse, s);
     qemu_input_handler_register((DeviceState *)s,
                                 &ps2_mouse_handler);
-    qemu_register_reset(ps2_mouse_reset, s);
     return s;
 }
 
+static void ps2_kbd_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
+
+    device_class_set_parent_reset(dc, ps2_kbd_reset, &ps2dc->parent_reset);
+}
+
 static const TypeInfo ps2_kbd_info = {
     .name          = TYPE_PS2_KBD_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2KbdState),
+    .class_init    = ps2_kbd_class_init
 };
 
+static void ps2_mouse_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PS2DeviceClass *ps2dc = PS2_DEVICE_CLASS(klass);
+
+    device_class_set_parent_reset(dc, ps2_mouse_reset,
+                                  &ps2dc->parent_reset);
+}
+
 static const TypeInfo ps2_mouse_info = {
     .name          = TYPE_PS2_MOUSE_DEVICE,
     .parent        = TYPE_PS2_DEVICE,
     .instance_size = sizeof(PS2MouseState),
+    .class_init    = ps2_mouse_class_init
 };
 
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->reset = ps2_reset;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index aef892b5e6..4be27de316 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -35,6 +35,8 @@
 
 struct PS2DeviceClass {
     SysBusDeviceClass parent_class;
+
+    DeviceReset parent_reset;
 };
 
 /*
-- 
2.30.2

