Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1653516lfq;
        Thu, 10 Sep 2020 13:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMF87IigmqcYk0N21MBENVXI9zfftmGOl8GBV4Fr+PPWUwsaDIi0qB7Dir0HLyiKbxf376
X-Received: by 2002:a25:2742:: with SMTP id n63mr770856ybn.32.1599771309326;
        Thu, 10 Sep 2020 13:55:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599771309; cv=none;
        d=google.com; s=arc-20160816;
        b=kFbGo6Qaydygdh3qPr8aFb5Jr8JbVorRQgMPHK4v0C+Ot5A2+0e6rhemrxWsPeQ7e2
         RorTbLfV5ATnYAQCU/QKrLfnSHqdhCDp8WoL1dz/yUSHz7s0a/j8Rz94jojPfN4R2GD+
         st70SfdAvSjR0gh+gMayqZoHkII4t/nbITBTo2S/9lkNTi808EzV/Kfloca6p/Oyekek
         w7xpyk2TfA4SAHQQm4oqYhpnCSrJpySQHmEXu1vQBAWjidbj8q8PPau5JjJIZ5a+v4JI
         +pIabaEKPGpUrYVl96fe97QQVt7z3obQItOYpozIUJnF+hjlChZWJWS8cvTYw6PfL7zw
         AwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Q0lfFRL4xWLEBHVRUO7uZKpVUCkRWQqd0DscmUXOlik=;
        b=ia0bZWx3M70QC6PAQ7JdRNtWTdNtwEes0qNPaS4JQeJqx3i5QbysBI2zt4t+ivDRG4
         ucAP13kaoT/2opjyIp0Li3nTt9bJF+pgjiZtwC1Dh8zrQ109z2tB8+s9E0mY1/ByIvoW
         65y5tdeOAtcNFY6WyDOadVVfNBK7MhhE6/5EoCeQWXIDC3aeKB1GszPEzel++eGi+lvU
         DFECicy1q9H9dwGmX7Is+JO+TK1zsnB41aUpIP2WNd5jzS/3w50ZoNhEAD8m2FOVBrra
         AhsmE3wQK77yaIGzpsFha/NAThZCeH8DmQEOX3gOjBzI87pbLtEa1xc7/s1DP2Lgdvk5
         NEXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4t4oGP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o79si99764yba.346.2020.09.10.13.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 13:55:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n4t4oGP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGTb2-0004hM-LR
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 16:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTaX-0004CM-Pg; Thu, 10 Sep 2020 16:54:37 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTaW-0000H6-As; Thu, 10 Sep 2020 16:54:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id c18so8629690wrm.9;
 Thu, 10 Sep 2020 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0lfFRL4xWLEBHVRUO7uZKpVUCkRWQqd0DscmUXOlik=;
 b=n4t4oGP65oBHUYzE2xK0F74MlbEbRT5IAFeK833QZzdZ8LCW8GBjoZwleGAZqgbieN
 jYNDKs+Td7Q1MghsoZu4BAjSCI21ev9quK6FkVmPetufVnsdhALR0eoh47mVbJi/kcK+
 po5rSGPA/Gz8wZggnqAzc58xrNK8K+HWSwBMqmU+zcxVG3wSZ7DTaAUbwApTouEwsIy8
 ZQ0rp85u5rNbSl6uUOYjQRF3VpShEJsypvMRfodgbq3rx48a8+Y7zHEdMibFEDlggc5k
 jstX7Km6cbPCq7lETo7Ypkth4c3DxGK7WAaST/V9Lv2p03Bs/3XbtA4i/c7N0PQ60gvy
 n/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q0lfFRL4xWLEBHVRUO7uZKpVUCkRWQqd0DscmUXOlik=;
 b=Dvzg6iacQMQqtbSl3O/ZuntqVVtHP8aggMrD9bvg7vfwgcpkUyVSKU+QWYjclkf/xO
 4bwp95Bw57yQvk5G/0GDYUWSu0m1L5WpVhP2LcO3k94TuFT16YBrUnP/HTe4mxCUU3Il
 cknQ5HPwxHi5v9as59iBSmWX46O08iLJY7kJvgCPqTTgOx1HOLo4dXqFeGVjg56zFHhe
 NYYNEM7xd2l3AZa5thL0g5IgRKa0c+RE7jmzkp6WAw2cX0U6le1n3dJSJnk4kse2q/zj
 WNxfgegXQOCpbYErIN+xK6mjFSoKKdQhJh65jXee1PkFQ+1sEpwtug1IM9LWIBDSbcK6
 aKsg==
X-Gm-Message-State: AOAM533R5sN6vriJV8W87IzjF2+ivX/cCmzcc5/S9cnyyAkuFtAaejEW
 jFvvodDWZ+IPb2qfhqQyLwPKpXdzrHY=
X-Received: by 2002:adf:dd0e:: with SMTP id a14mr10840273wrm.151.1599771274236; 
 Thu, 10 Sep 2020 13:54:34 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t1sm5089317wmi.16.2020.09.10.13.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 13:54:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/7] hw/misc/led: Allow connecting from GPIO output
Date: Thu, 10 Sep 2020 22:54:24 +0200
Message-Id: <20200910205429.727766-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910205429.727766-1-f4bug@amsat.org>
References: <20200910205429.727766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aop+gTEyc4u4

Some devices expose GPIO lines.

Add a GPIO qdev input to our LED device, so we can
connect a GPIO output using qdev_connect_gpio_out().

When used with GPIOs, the intensity can only be either
minium or maximum. This depends of the polarity of the
GPIO (which can be inverted).
Declare the GpioPolarity type to model the polarity.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/led.h  |  8 ++++++++
 include/hw/qdev-core.h |  8 ++++++++
 hw/misc/led.c          | 17 ++++++++++++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index f5afaa34bfb..71c9b8c59bf 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -38,10 +38,16 @@ typedef struct LEDState {
     /* Public */
 
     uint8_t intensity_percent;
+    qemu_irq irq;
 
     /* Properties */
     char *description;
     char *color;
+    /*
+     * When used with GPIO, the intensity at reset is related
+     * to the GPIO polarity.
+     */
+    bool inverted_polarity;
 } LEDState;
 
 /**
@@ -71,6 +77,7 @@ void led_set_state(LEDState *s, bool is_emitting);
 /**
  * led_create_simple: Create and realize a LED device
  * @parentobj: the parent object
+ * @gpio_polarity: GPIO polarity
  * @color: color of the LED
  * @description: description of the LED (optional)
  *
@@ -78,6 +85,7 @@ void led_set_state(LEDState *s, bool is_emitting);
  * drop the reference to it (the device is realized).
  */
 LEDState *led_create_simple(Object *parentobj,
+                            GpioPolarity gpio_polarity,
                             LEDColor color,
                             const char *description);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index ea3f73a282d..846354736a5 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -424,6 +424,14 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * GpioPolarity: Polarity of a GPIO line
+ */
+typedef enum {
+    GPIO_POLARITY_ACTIVE_LOW,
+    GPIO_POLARITY_ACTIVE_HIGH
+} GpioPolarity;
+
 /**
  * qdev_get_gpio_in: Get one of a device's anonymous input GPIO lines
  * @dev: Device whose GPIO we want
diff --git a/hw/misc/led.c b/hw/misc/led.c
index 89acd9acbb7..3ef4f5e0469 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -10,6 +10,7 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/led.h"
+#include "hw/irq.h"
 #include "trace.h"
 
 #define LED_INTENSITY_PERCENT_MAX   100
@@ -53,11 +54,19 @@ void led_set_state(LEDState *s, bool is_emitting)
     led_set_intensity(s, is_emitting ? LED_INTENSITY_PERCENT_MAX : 0);
 }
 
+static void led_set_state_gpio_handler(void *opaque, int line, int new_state)
+{
+    LEDState *s = LED(opaque);
+
+    assert(line == 0);
+    led_set_state(s, !!new_state != s->inverted_polarity);
+}
+
 static void led_reset(DeviceState *dev)
 {
     LEDState *s = LED(dev);
 
-    led_set_state(s, false);
+    led_set_state(s, s->inverted_polarity);
 }
 
 static const VMStateDescription vmstate_led = {
@@ -84,11 +93,14 @@ static void led_realize(DeviceState *dev, Error **errp)
     if (s->description == NULL) {
         s->description = g_strdup("n/a");
     }
+
+    qdev_init_gpio_in(DEVICE(s), led_set_state_gpio_handler, 1);
 }
 
 static Property led_properties[] = {
     DEFINE_PROP_STRING("color", LEDState, color),
     DEFINE_PROP_STRING("description", LEDState, description),
+    DEFINE_PROP_BOOL("polarity-inverted", LEDState, inverted_polarity, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -119,6 +131,7 @@ static void led_register_types(void)
 type_init(led_register_types)
 
 LEDState *led_create_simple(Object *parentobj,
+                            GpioPolarity gpio_polarity,
                             LEDColor color,
                             const char *description)
 {
@@ -126,6 +139,8 @@ LEDState *led_create_simple(Object *parentobj,
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LED);
+    qdev_prop_set_bit(dev, "polarity-inverted",
+                      gpio_polarity == GPIO_POLARITY_ACTIVE_LOW);
     qdev_prop_set_string(dev, "color", led_color_name[color]);
     if (!description) {
         static unsigned undescribed_led_id;
-- 
2.26.2

