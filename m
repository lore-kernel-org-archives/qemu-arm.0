Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3879751ejc;
        Tue, 17 Oct 2023 05:24:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHGAVclGAKNDub/QTbrKbaEd9MmhCcdGUC0uWbj7oETDpJ7nSgBvYJ/YwUjU6aDciEHqk6
X-Received: by 2002:a05:620a:370e:b0:775:7be2:8c8 with SMTP id de14-20020a05620a370e00b007757be208c8mr2312912qkb.61.1697545472097;
        Tue, 17 Oct 2023 05:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697545472; cv=none;
        d=google.com; s=arc-20160816;
        b=wdeOFBmeVufqVUBc4RCrmfZNjltjjXUYbzK/dbhoknZ22FdGO6ElpPMJdYkiZF13oI
         8jNU1R5UA1f0WHd0aFpF8VlYJgWOwQi4IUH6OeJLQ9PBaQGisEMNHd/6p2kOjsRIVfNe
         6JjT52gXt5GTDtZMtGCONRF3tLNe9bSl3LZmyAN7Gp/8QyyBn1cwE7+VUBSXnkylO3jy
         gxrSZNGxjsCKKDdkN0QAxFFujazXIXTYf7JphjNk8xDiOYBNAE2qTOd98J7ChgCbaf+j
         6UR0ZgBwVjcjaAm0CI8rIoQ86gEp9tNDzOtuQqDtDtCHivo0CDPD+DtyIaATgnmwO8Qo
         2pBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X23rCmHj7vrKivIk0sTOGLiGuYEJTV79DlPVDDS4fB8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=PDsG2M4Krr1HU3G6HrEPytlF9r0BY0aJb0OnaQzvxNY/q9rnk9p/u6fZFHU6SZDVL8
         Q7PSfyzm2crqCyJnN0lqHZfGgZ6JvVOvqBQT0VM82CPXP5LVEsOHTI6onc18tP4zqQBt
         KSQn3ev7BNtSewxp9OBIMhItVZ06WAD09KrC3lOfmg50iRgUFg7nariUAX/2DprDscN9
         0k3JGwQIerIomds5OQeyCTECZgU/2afluTETqlKQRUUe2IBF720LIH0Fw5UXJM/gfG6l
         JN5daRIeo1VCxTq4E9+fXBA5veY+eoqwx/NiacOPBU5kwN7JlmBUrrdyhm9tf0G//b3W
         neQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUYC+WgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020a05620a21d600b00775907603f0si926736qka.470.2023.10.17.05.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:24:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OUYC+WgY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsj6S-0006bU-PU; Tue, 17 Oct 2023 08:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6P-0006ZK-8E
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:23:13 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6K-0003vH-N9
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 08:23:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3296b3f03e5so4778161f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697545387; x=1698150187; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X23rCmHj7vrKivIk0sTOGLiGuYEJTV79DlPVDDS4fB8=;
 b=OUYC+WgYYIQaht1FSlb2CSWgKNCHrdMThNvDbUloXdVaAXki7XVF+IgfXLMHLLWyy7
 u8ReWJpUBd7jBa+uiZSJfZaKUgqUoyUXGuqYDDpmZbJb2NojAS3e4jHAH0pwNNGGJMCr
 9vdS3FsdqxFLVlIhOysB9wxIqX558VHWRP3+yz6kx44mWH8xSvVcSv+Qt9EUfBqWZx9c
 oKOOPlscC+fSyvsyzFuFWtV3y2IRdLUsVctf/SOg/57yKf29RFCztrHVav1QU7ybF72p
 15wzJtl5/Yc894imlYTNJ9gLEChUr8JWUpt08sOhuv8P5hcJkpVLxIajHYW2jbD8kWCi
 W/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545387; x=1698150187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X23rCmHj7vrKivIk0sTOGLiGuYEJTV79DlPVDDS4fB8=;
 b=k582tFlUOegFH+UVZ0ch9GL4fu3f4+7i5IkojH6dB4RUL2oxuaR/ZHu/zaYOdw0LWO
 tiQf7akiMXBT9kVZXGH0YSN4ElkBvYsc1GKplR5yrd9U6GbxhbXsxGciRNDs2fI+izKr
 06GGrIAuK/53LYZskgWrim9fT2FVmhrpenx/XRCXe5H5tRBkXcO5Dj98fkmQUqzfLlPO
 25qkVC9oS4al6ezJVWz0xs7TG20ZOZbAhrZ+jtuTJBw0GI0iVD81yt36+6maUxAlbwar
 RlnqVC8SDjT9PQ8Od6SSNH66QPFecH/OQFljt2Z+JDyYj0WmfN9je2N/Ts44B5PsggL9
 tqNQ==
X-Gm-Message-State: AOJu0Ywww7yJ2qBSAUFqI+heB+9DhyvC/zTYwDtEFEIaZ3gHoP6h0BMG
 O7WjXEsFLeNrbiaP03bk/OQJiOAe3wlZFLaU9ic=
X-Received: by 2002:a5d:4528:0:b0:31c:804b:5ec3 with SMTP id
 j8-20020a5d4528000000b0031c804b5ec3mr1922351wra.67.1697545387116; 
 Tue, 17 Oct 2023 05:23:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1590905wrs.35.2023.10.17.05.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 05:23:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/input/stellaris_gamepad: Convert to
 qemu_input_handler_register()
Date: Tue, 17 Oct 2023 13:23:02 +0100
Message-Id: <20231017122302.1692902-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017122302.1692902-1-peter.maydell@linaro.org>
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uctq3L7/y99Z

Now that we have converted to qdev, we can use the newer
qemu_input_handler_register() API rather than the legacy
qemu_add_kbd_event_handler().

Since we only have one user, take the opportunity to convert
from scancodes to QCodes, rather than using
qemu_input_key_value_to_scancode() (which adds an 0xe0
prefix and encodes up/down indication in the scancode,
which our old handler function then had to reverse). That
lets us drop the old state field which was tracking whether
we were halfway through a two-byte scancode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/stellaris_gamepad.h |  2 +-
 hw/arm/stellaris.c                   |  6 ++++-
 hw/input/stellaris_gamepad.c         | 33 +++++++++++++---------------
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/hw/input/stellaris_gamepad.h b/include/hw/input/stellaris_gamepad.h
index 50c17041121..979e7243fd8 100644
--- a/include/hw/input/stellaris_gamepad.h
+++ b/include/hw/input/stellaris_gamepad.h
@@ -17,6 +17,7 @@
 /*
  * QEMU interface:
  *  + QOM array property "keycodes": uint32_t QEMU keycodes to handle
+ *    (these are QCodes, ie the Q_KEY_* values)
  *  + unnamed GPIO outputs: one per keycode, in the same order as the
  *    "keycodes" array property entries; asserted when key is down
  */
@@ -33,7 +34,6 @@ struct StellarisGamepad {
     qemu_irq *irqs;
     uint32_t *keycodes;
     uint8_t *pressed;
-    int extension;
 };
 
 #endif
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 707b0dae375..dd90f686bfa 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -32,6 +32,7 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 #include "qapi/qmp/qlist.h"
+#include "ui/input.h"
 
 #define GPIO_A 0
 #define GPIO_B 1
@@ -1276,7 +1277,10 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     }
     if (board->peripherals & BP_GAMEPAD) {
         QList *gpad_keycode_list = qlist_new();
-        static const int gpad_keycode[5] = { 0xc8, 0xd0, 0xcb, 0xcd, 0x1d };
+        static const int gpad_keycode[5] = {
+            Q_KEY_CODE_UP, Q_KEY_CODE_DOWN, Q_KEY_CODE_LEFT,
+            Q_KEY_CODE_RIGHT, Q_KEY_CODE_CTRL,
+        };
         DeviceState *gpad;
 
         gpad = qdev_new(TYPE_STELLARIS_GAMEPAD);
diff --git a/hw/input/stellaris_gamepad.c b/hw/input/stellaris_gamepad.c
index 48d37bd6275..65247ecd782 100644
--- a/hw/input/stellaris_gamepad.c
+++ b/hw/input/stellaris_gamepad.c
@@ -15,28 +15,20 @@
 #include "migration/vmstate.h"
 #include "ui/console.h"
 
-static void stellaris_gamepad_put_key(void * opaque, int keycode)
+static void stellaris_gamepad_event(DeviceState *dev, QemuConsole *src,
+                                    InputEvent *evt)
 {
-    StellarisGamepad *s = (StellarisGamepad *)opaque;
+    StellarisGamepad *s = STELLARIS_GAMEPAD(dev);
+    InputKeyEvent *key = evt->u.key.data;
+    int qcode = qemu_input_key_value_to_qcode(key->key);
     int i;
-    int down;
-
-    if (keycode == 0xe0 && !s->extension) {
-        s->extension = 0x80;
-        return;
-    }
-
-    down = (keycode & 0x80) == 0;
-    keycode = (keycode & 0x7f) | s->extension;
 
     for (i = 0; i < s->num_buttons; i++) {
-        if (s->keycodes[i] == keycode && s->pressed[i] != down) {
-            s->pressed[i] = down;
-            qemu_set_irq(s->irqs[i], down);
+        if (s->keycodes[i] == qcode && s->pressed[i] != key->down) {
+            s->pressed[i] = key->down;
+            qemu_set_irq(s->irqs[i], key->down);
         }
     }
-
-    s->extension = 0;
 }
 
 static const VMStateDescription vmstate_stellaris_gamepad = {
@@ -44,13 +36,18 @@ static const VMStateDescription vmstate_stellaris_gamepad = {
     .version_id = 2,
     .minimum_version_id = 2,
     .fields = (VMStateField[]) {
-        VMSTATE_INT32(extension, StellarisGamepad),
         VMSTATE_VARRAY_UINT32(pressed, StellarisGamepad, num_buttons,
                               0, vmstate_info_uint8, uint8_t),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static QemuInputHandler stellaris_gamepad_handler = {
+    .name = "Stellaris Gamepad",
+    .mask = INPUT_EVENT_MASK_KEY,
+    .event = stellaris_gamepad_event,
+};
+
 static void stellaris_gamepad_realize(DeviceState *dev, Error **errp)
 {
     StellarisGamepad *s = STELLARIS_GAMEPAD(dev);
@@ -63,7 +60,7 @@ static void stellaris_gamepad_realize(DeviceState *dev, Error **errp)
     s->irqs = g_new0(qemu_irq, s->num_buttons);
     s->pressed = g_new0(uint8_t, s->num_buttons);
     qdev_init_gpio_out(dev, s->irqs, s->num_buttons);
-    qemu_add_kbd_event_handler(stellaris_gamepad_put_key, dev);
+    qemu_input_handler_register(dev, &stellaris_gamepad_handler);
 }
 
 static void stellaris_gamepad_reset_enter(Object *obj, ResetType type)
-- 
2.34.1

