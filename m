Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D627D637DF
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 00:23:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVfJH-00068R-I2; Tue, 16 Dec 2025 19:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wfdBaQYKCAo84lsx9qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--yubinz.bounces.google.com>)
 id 1vVfJG-00066i-74
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 19:22:30 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wfdBaQYKCAo84lsx9qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--yubinz.bounces.google.com>)
 id 1vVfJE-000560-FC
 for qemu-arm@nongnu.org; Tue, 16 Dec 2025 19:22:29 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-bce224720d8so9387040a12.1
 for <qemu-arm@nongnu.org>; Tue, 16 Dec 2025 16:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765930946; x=1766535746; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yfDqR2P/yB65lpiBOHOFUM1Gb+paknLpn22lMcn8yB8=;
 b=C7dtk7F1E+bvvEz+txFxyvnm9FnJxN9Nn7QjNDiOdlimWLbSGrg66PquWfZpxM2tPD
 1jQBZCmtdxHi8LambaBcMFGgVZ+tYyuVyzMgXNCgdmWOxaMkMSORnZgD4INnwzB2p8aU
 W9OiVThTwILezUpw/cWFvLhLyVJVfO/xHlOv9N5HIvCDDLScsta4xoSdB7HPh1YB+vDz
 Pv4B6rgQWdT6X9d4u+FKYVGhYVM9kxiVzbFQt0EJAk4mPJPsgpi4zE93Z+8v6KY4jqb0
 MWw4d9g2pWb6nsaXWPiEs142DwZ4GXQc2MwJTvjm1jzdJGxGig/0VrsRw4dDiXh1r95w
 bh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765930946; x=1766535746;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yfDqR2P/yB65lpiBOHOFUM1Gb+paknLpn22lMcn8yB8=;
 b=pwlQoGMqGfEYKt2g3Rn1ABBaNrQHeUUhUiWr6HQ7L6BkE4iLWQLS21661u62+IKWOJ
 ZS0Hbwo5aUR+F087YxIFIkDWAYeTfvr59DyK22Pwn0BItJtqRmGV6uO661xXaqMy6y4Y
 tM47nW0O31LtHscYnYccJBRlOQeAFHUCIJbeaW8McqoP4qtuBtl8hE+BrYHXJgOBrdC+
 9aoGPCVhl9PJmGRH7cZ54a2C6KENZHAjwIx+RnDZRDzAXvI3Ar8ibqypq9DxQdr/dG+J
 BW/RvE/MvD8eG59WV3Os+7LrkQlntNF1K0Av2BMTh7DbNFonTTbUEVmafhjC5MxlzHF3
 wTMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfTox8MUDBtjv8PuuWWOtmVZX9Z4baVf2xm6t+QHAZQ7eYhmaDQeu9I00hneWuptbITinj6RdaKA==@nongnu.org
X-Gm-Message-State: AOJu0YwOCm8sdqDQ63gp1TS6mmuVE6UuKg+0GYDh9asVYNlNz4bLruR6
 UPnPZbhMN9OZUfTZcT6b8xTtmjJiP8BHMHQIsp0d7rV0jEp/KVJ0mFeuSwV+KrmwEfqULSAG1YL
 6rzDpMw==
X-Google-Smtp-Source: AGHT+IGUD0Sx1Bqe9Kf4r/U4t6wi4/KwVjB1s55bjWhftql49ZjbMJJLltld4G2AUeqYcMkKJ0hCVUoEHHw=
X-Received: from dybna11.prod.google.com
 ([2002:a05:7300:cc0b:b0:2ac:2ddf:6eca])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ff43:b0:2ac:19a3:c51c
 with SMTP id 5a478bee46e88-2ac2f8b1af5mr12015686eec.18.1765930945873; Tue, 16
 Dec 2025 16:22:25 -0800 (PST)
Date: Wed, 17 Dec 2025 00:22:12 +0000
In-Reply-To: <20251217-aspeed-sgpio-v4-0-28bbb8dcab30@google.com>
Mime-Version: 1.0
References: <20251217-aspeed-sgpio-v4-0-28bbb8dcab30@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251217-aspeed-sgpio-v4-2-28bbb8dcab30@google.com>
Subject: [PATCH v4 2/6] hw/gpio/aspeed_sgpio: Add QOM property accessors for
 SGPIO pins
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>, 
 Nabih Estefan <nabihestefan@google.com>, qemu-arm@nongnu.org, 
 Yubin Zou <yubinz@google.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3wfdBaQYKCAo84lsx9qyyqvo.myw0ow4-k1wxyxqx4.y1q@flex--yubinz.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The `aspeed_sgpio_get_pin` and `aspeed_sgpio_set_pin` functions are
implemented to get and set the level of individual SGPIO pins. These
are then exposed as boolean properties on the SGPIO device object.

Signed-off-by: Yubin Zou <yubinz@google.com>
---
 hw/gpio/aspeed_sgpio.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/hw/gpio/aspeed_sgpio.c b/hw/gpio/aspeed_sgpio.c
index 3fc750fe619dcb6f9a1f2486999e945002a6df13..dc2df137db247c178adc05807bd0595fc0cb5c52 100644
--- a/hw/gpio/aspeed_sgpio.c
+++ b/hw/gpio/aspeed_sgpio.c
@@ -84,6 +84,73 @@ static void aspeed_sgpio_2700_write(void *opaque, hwaddr offset, uint64_t data,
     }
 }
 
+static bool aspeed_sgpio_get_pin_level(AspeedSGPIOState *s, int pin)
+{
+    uint32_t value = s->ctrl_regs[pin >> 1];
+    bool is_input = !(pin % 2);
+    uint32_t bit_mask = 0;
+
+    if (is_input) {
+        bit_mask = SGPIO_SERIAL_IN_VAL_MASK;
+    } else {
+        bit_mask = SGPIO_SERIAL_OUT_VAL_MASK;
+    }
+
+    return value & bit_mask;
+}
+
+static void aspeed_sgpio_set_pin_level(AspeedSGPIOState *s, int pin, bool level)
+{
+    uint32_t value = s->ctrl_regs[pin >> 1];
+    bool is_input = !(pin % 2);
+    uint32_t bit_mask = 0;
+
+    if (is_input) {
+        bit_mask = SGPIO_SERIAL_IN_VAL_MASK;
+    } else {
+        bit_mask = SGPIO_SERIAL_OUT_VAL_MASK;
+    }
+
+    if (level) {
+        value |= bit_mask;
+    } else {
+        value &= ~bit_mask;
+    }
+    s->ctrl_regs[pin >> 1] = value;
+}
+
+static void aspeed_sgpio_get_pin(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    bool level = true;
+    int pin = 0xfff;
+    AspeedSGPIOState *s = ASPEED_SGPIO(obj);
+
+    if (sscanf(name, "sgpio%03d", &pin) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    level = aspeed_sgpio_get_pin_level(s, pin);
+    visit_type_bool(v, name, &level, errp);
+}
+
+static void aspeed_sgpio_set_pin(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    bool level;
+    int pin = 0xfff;
+    AspeedSGPIOState *s = ASPEED_SGPIO(obj);
+
+    if (!visit_type_bool(v, name, &level, errp)) {
+        return;
+    }
+    if (sscanf(name, "sgpio%03d", &pin) != 1) {
+        error_setg(errp, "%s: error reading %s", __func__, name);
+        return;
+    }
+    aspeed_sgpio_set_pin_level(s, pin, level);
+}
+
 static const MemoryRegionOps aspeed_gpio_2700_ops = {
   .read       = aspeed_sgpio_2700_read,
   .write      = aspeed_sgpio_2700_write,
@@ -107,6 +174,15 @@ static void aspeed_sgpio_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static void aspeed_sgpio_init(Object *obj)
+{
+    for (int i = 0; i < ASPEED_SGPIO_MAX_PIN_PAIR * 2; i++) {
+        g_autofree char *name = g_strdup_printf("sgpio%03d", i);
+        object_property_add(obj, name, "bool", aspeed_sgpio_get_pin,
+                            aspeed_sgpio_set_pin, NULL, NULL);
+    }
+}
+
 static void aspeed_sgpio_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -136,6 +212,7 @@ static const TypeInfo aspeed_sgpio_ast2700_info = {
   .name           = TYPE_ASPEED_SGPIO "-ast2700",
   .parent         = TYPE_ASPEED_SGPIO,
   .class_init     = aspeed_sgpio_2700_class_init,
+  .instance_init  = aspeed_sgpio_init,
 };
 
 static void aspeed_sgpio_register_types(void)

-- 
2.52.0.305.g3fc767764a-goog


