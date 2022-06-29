Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp457230lft;
        Wed, 29 Jun 2022 06:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqrzG7YvOLzS0axiNQltlgjbuAE9KiDSfB1hm7wGL0sCEnx7Wm4daGxvjtxMA+q4wQOtuG
X-Received: by 2002:ac8:5a83:0:b0:31a:272f:d67d with SMTP id c3-20020ac85a83000000b0031a272fd67dmr2359662qtc.57.1656510228717;
        Wed, 29 Jun 2022 06:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656510228; cv=none;
        d=google.com; s=arc-20160816;
        b=o9CSRHdTzrYgBMpFCKxEYa6zTpEa1nMQwhKzAQKOnw8k5x227jvO6VlPBmP17QOpjK
         xhLn1wPQeC/CrqN71TXyplzolFiPmVZ1UNAsgiSTL/eoUfrTOnMDeupr9w7aocsi1aL9
         4tLn5drz3ZZZUfvf6IPeDr2x+IaWl2l1fg+V5J0IY9vC9GBiF4N9Xo3t1/uqO5tts2cb
         P2/xtVEPgWIM8J9536Ssr33d1lU07i3qJGIN2oMFyKXHY3mmWgfyti3wFnuCmPgaVaW2
         87SvStY/PWyouuIUbx26cY2TH+OeupNzzRRWGWoypdrKNno0KoObTKBFUTS5z+5er+IH
         NspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VjyLwG39TG1/DgUH7jKMKI43V5Gw+2OWZceVJ8f48sA=;
        b=BTYBWyG16HMUwXcixnlrfsTFrFOg4vaG0yr2YRaGJ0xIXgoWM8OjZMJHMcl6tb7g9G
         c/VAIWFY16BqziozzuHUhfwCJ0hOb9YCkuehzDT9aSuffr04c1gO06crPqQGuDggX+Ed
         I9tJ6PKXzivoUDsX6qnNttRZAsdUi31xRAdICNZHOKwDQ7N4VTwiIt/HYWjH5KN3SST0
         YnsudgmIgffM+Upr5MrlDwCENECv3O3qMKZZ2HxPblF/8sXg33Yd7HwtTq6I001iAofa
         s38hA+2ndjMOamg/hFbPoTPaE5bnBRZx7iSCzruMdz1ccIcpZ3QIyNhhPxkyMk37L6WD
         n92w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=E7vUBjL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16-20020ac87fd0000000b00305323a1001si10147704qtk.656.2022.06.29.06.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:43:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=E7vUBjL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6Xyu-0002gl-2y
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1U-0001M1-E2; Wed, 29 Jun 2022 08:42:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1S-0005I7-Ly; Wed, 29 Jun 2022 08:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjyLwG39TG1/DgUH7jKMKI43V5Gw+2OWZceVJ8f48sA=; b=E7vUBjL8jBZjyPrO5Ik0ub7KuY
 y1p/fPopRn23XTdNd63TPZsHF4n2l7T04PPyE6W//6ZGoW/fcVaqn/KbFq0GXNQULoOz2u9tJtUIF
 NM0e2TMCJYktEBcs0HD2g1fJM6BZnSdBtNfBSj1PBMqAXa0yuc7B01a4CCt4sH2bq7K6zAvdImPjz
 iRZjdjV6AgpS/yG10ot08/0u+MJU9NyCJBFicjmzbdLwGgXUU1FyVmd8WlEPlIjulFpJlMtFdd7bE
 /sDfq1/dcgA0SIeYUEbLKgH9gDjN01QttDrvqz+XHeWn+R8nTX4DBKra8tdBEXPoFx0wJA2Um/AET
 +Rx4P/zA//kpi0mesXVanvTtVpbutFVUera5S4avYOkf1Bskk/RX4nZ+l6ZH3cGY4gQvZ6h2mpaTZ
 lrUVZmkm3mj3YlMFtu2HmJ0TbSjNMVohfT3KzksTaqSOQ7kWWplT6AQk0fQTjfkiFjhKBj4z7EmyB
 36xoGqc7K+gpLOEPdyOdcO1j+8OpsWO4aPKbQwLzYFTO9vcsmUH8xg1LU+CfwvMQNdWydaWF8Ygtg
 tNV4eOOFeNDIPj+8EmFqwFiAKPuYcYQPZUODaSgGLZ0lSdX5LUtqHopt8G7TMp0uW9rh3EbuduzME
 qqQe1XfhtVi57q8XKFGJNI8+PgZqzX57ZgkKfxCR0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzo-0002tZ-NU; Wed, 29 Jun 2022 13:40:44 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:22 +0100
Message-Id: <20220629124026.1077021-37-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 36/40] pckbd: don't use legacy ps2_kbd_init() function
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
X-TUID: 234FfvDr8ooP

Instantiate the PS2 keyboard device within KBDState using
object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
it in i8042_realizefn() and i8042_mmio_realize() accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 29 +++++++++++++++++++++--------
 include/hw/input/i8042.h |  3 ++-
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 195a64f520..cb452f2612 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -286,7 +286,7 @@ static void kbd_queue(KBDState *s, int b, int aux)
         s->pending |= aux ? KBD_PENDING_CTRL_AUX : KBD_PENDING_CTRL_KBD;
         kbd_safe_update_irq(s);
     } else {
-        ps2_queue(aux ? s->mouse : s->kbd, b);
+        ps2_queue(aux ? s->mouse : PS2_DEVICE(&s->ps2kbd), b);
     }
 }
 
@@ -408,7 +408,7 @@ static uint64_t kbd_read_data(void *opaque, hwaddr addr,
                 timer_mod(s->throttle_timer,
                           qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) + 1000);
             }
-            s->obdata = ps2_read_data(s->kbd);
+            s->obdata = ps2_read_data(PS2_DEVICE(&s->ps2kbd));
         } else if (s->obsrc & KBD_OBSRC_MOUSE) {
             s->obdata = ps2_read_data(s->mouse);
         } else if (s->obsrc & KBD_OBSRC_CTRL) {
@@ -429,14 +429,15 @@ static void kbd_write_data(void *opaque, hwaddr addr,
 
     switch (s->write_cmd) {
     case 0:
-        ps2_write_keyboard(s->kbd, val);
+        ps2_write_keyboard(&s->ps2kbd, val);
         /* sending data to the keyboard reenables PS/2 communication */
         s->mode &= ~KBD_MODE_DISABLE_KBD;
         kbd_safe_update_irq(s);
         break;
     case KBD_CCMD_WRITE_MODE:
         s->mode = val;
-        ps2_keyboard_set_translation(s->kbd, (s->mode & KBD_MODE_KCC) != 0);
+        ps2_keyboard_set_translation(&s->ps2kbd,
+                                     (s->mode & KBD_MODE_KCC) != 0);
         /*
          * a write to the mode byte interrupt enable flags directly updates
          * the irq lines
@@ -699,10 +700,14 @@ static void i8042_mmio_realize(DeviceState *dev, Error **errp)
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->region);
 
-    ks->kbd = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(ks->kbd), PS2_DEVICE_IRQ,
+    if (!sysbus_realize(SYS_BUS_DEVICE(&ks->ps2kbd), errp)) {
+        return;
+    }
+
+    qdev_connect_gpio_out(DEVICE(&ks->ps2kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
+
     ks->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(ks->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
@@ -716,6 +721,8 @@ static void i8042_mmio_init(Object *obj)
 
     ks->extended_state = true;
 
+    object_initialize_child(obj, "ps2kbd", &ks->ps2kbd, TYPE_PS2_KBD_DEVICE);
+
     qdev_init_gpio_out(DEVICE(obj), ks->irqs, 2);
     qdev_init_gpio_in_named(DEVICE(obj), i8042_mmio_set_kbd_irq,
                             "ps2-kbd-input-irq", 1);
@@ -851,6 +858,8 @@ static void i8042_initfn(Object *obj)
     memory_region_init_io(isa_s->io + 1, obj, &i8042_cmd_ops, s,
                           "i8042-cmd", 1);
 
+    object_initialize_child(obj, "ps2kbd", &s->ps2kbd, TYPE_PS2_KBD_DEVICE);
+
     qdev_init_gpio_out_named(DEVICE(obj), &s->a20_out, I8042_A20_LINE, 1);
 
     qdev_init_gpio_out(DEVICE(obj), s->irqs, 2);
@@ -884,10 +893,14 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
 
-    s->kbd = ps2_kbd_init();
-    qdev_connect_gpio_out(DEVICE(s->kbd), PS2_DEVICE_IRQ,
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->ps2kbd), errp)) {
+        return;
+    }
+
+    qdev_connect_gpio_out(DEVICE(&s->ps2kbd), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-kbd-input-irq",
                                                  0));
+
     s->mouse = ps2_mouse_init();
     qdev_connect_gpio_out(DEVICE(s->mouse), PS2_DEVICE_IRQ,
                           qdev_get_gpio_in_named(dev, "ps2-mouse-input-irq",
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index ca933d8e1b..8beb0ac01f 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -10,6 +10,7 @@
 
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
+#include "hw/input/ps2.h"
 #include "qom/object.h"
 
 #define I8042_KBD_IRQ      0
@@ -30,7 +31,7 @@ typedef struct KBDState {
     uint8_t obdata;
     uint8_t cbdata;
     uint8_t pending_tmp;
-    void *kbd;
+    PS2KbdState ps2kbd;
     void *mouse;
     QEMUTimer *throttle_timer;
 
-- 
2.30.2

