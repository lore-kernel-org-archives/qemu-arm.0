Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3884199lfc;
        Mon, 7 Sep 2020 09:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHwVyW/P4q1T8bSeshsfJTpvyEkr701AZcrj1nrRmn6HDb836Dxc+VlJ0T6W/DPkQlB21v
X-Received: by 2002:a25:f43:: with SMTP id 64mr29975544ybp.128.1599496536318;
        Mon, 07 Sep 2020 09:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599496536; cv=none;
        d=google.com; s=arc-20160816;
        b=gj4ZQIc2S/4VeMRI6ivh09mfxz9ZN4xk0CbIt7DFTxNqo40bgSO6qcM20lr3WdYJhb
         RyEzsuPn9tNTghNamZuymFRPxy7F/H4jzD2xD7P2KBDaZLjdC1v7t3+TgQKTKTFcTydW
         PrcznY5tD2TruiR1DpKqwJdrzmnkKsDP4Nk+7Ofh2BCAkoHYvc6U6uRa+3z+HmU1kOqx
         ksZX0ZcUUGdbE40uH3ZdUPwElFdd9gUuV58SU/2VzOVpRkaKU/4W+WRYRQjLJOSYfAmK
         UqoaQwlzXZgWK9f+2vWJvJHEJbQFlqAhY4z0C5qIcM1Q2UizO+qSkxwp4p7CJpFBEwOU
         M3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VNbcpVtna5bpU7n81cix+fetWM20QpCF3F6nhCiudhQ=;
        b=DQrpAUSwcMMiuyLWTU1hVNeXTOdr4syADYb3qYkWxqpJEnMMdqUPA8T/qQtuC6XT1c
         NCQUkq4UmO/9NgRzmajh/5PfUB5BoQcCOLODf3owIeGq9zujFM+67THtAPdRLHejGQL/
         apFN6NQPyuXy3JfgZa05h7FY1PK8MR+FjudPGbacfW696FP9w3vpsBIOQc6mYLkwFYGc
         XqdjNoPFF3L+0HHb4BG//fDCPEfRP2xXRrlJohSicx3N9bea7GTrwpI+GAWOzejCiDb+
         TbR/0Yd6caHgTXGnI/hscDod9iPB51POrkI0kf3//Dnw/1eYRr6KWyDVrk0uEZWsksEq
         gKqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lsra9HzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si16250078yba.105.2020.09.07.09.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 09:35:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lsra9HzP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFK7D-000338-HY
	for alex.bennee@linaro.org; Mon, 07 Sep 2020 12:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4o-00084c-JU; Mon, 07 Sep 2020 12:33:06 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kFK4m-0007bv-Ti; Mon, 07 Sep 2020 12:33:06 -0400
Received: by mail-ej1-x642.google.com with SMTP id z23so18871174ejr.13;
 Mon, 07 Sep 2020 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNbcpVtna5bpU7n81cix+fetWM20QpCF3F6nhCiudhQ=;
 b=Lsra9HzP9MY8fC6amVNSnK9RIttSVRIDNAo7ZVenbXPeC+d7FLhru2Larq7F0cwxH9
 7A+1x5dtEHr7d7X8o+moA6ydLEfoLQqdWvDjl9Kfr2Jf0WEA08VsQbSXsul5VP4f4WBz
 5wO80IO5hMpD7iGTf+HkodI05Ua3cKKD5Ta3eG+HyCX7ZPo+sb7xQjR/lGRUsyP1sgCn
 RaA+8spjY4Xc1aE1pY6zEFS+6NZZP76V8o4bOMdzvnXgltI7KtodTz4wJxEDAg0oxqUp
 UzH0WDeBNBtX7N3HRP7NJTPa7H6EKVF2rMQGib4ZiGq0PUA7CyKtjr8HIMXhjymB6io2
 9UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VNbcpVtna5bpU7n81cix+fetWM20QpCF3F6nhCiudhQ=;
 b=Exz9wrwQ/sUDE5j6fx9U48qSQ4TkGo4MU9tYMdGtVUS/jbwd9K+9Q3ZCHjK1chwPZ/
 xHmKtbzJCCAEr5zxchvqi1qC+lLE41XNHHI4PjORtfjnPz7qckKtFjVQtQdF8eNXqJLL
 eKhzPUrzYJ+fe7cAKMLxJHGZI+/OgURnOfvr0UX3Q/3/aQd6pZXBWgAnk2GcMLg2vkwi
 7W2uoaFUvDk7w6UFasfSNkC4/bRYFPh6G5sWXi721wkKej+3arz8iTsxHD8+fJSjNj9S
 m5/63KgsfFmyIF6XHd1jn9NkHavC77m7d4h8JBhBNsI5H3Oh8ouF+3EJzBICu07/EnX/
 7rdA==
X-Gm-Message-State: AOAM533MP81iNd6lXHcawIX4pokqlhjr8sB4tmnz7MQa0LIQXKxDqXvi
 o00p65ssl3BF2/N6mtYE76j6tqCx6dE=
X-Received: by 2002:a17:906:2552:: with SMTP id
 j18mr21262657ejb.476.1599496382901; 
 Mon, 07 Sep 2020 09:33:02 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u13sm15700199ejn.82.2020.09.07.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 09:33:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/8] hw/misc/led: Allow connecting from GPIO output
Date: Mon,  7 Sep 2020 18:32:51 +0200
Message-Id: <20200907163257.46527-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907163257.46527-1-f4bug@amsat.org>
References: <20200907163257.46527-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +3nF5TEFspTz

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
index 1aaabbebafc..c8dd6da74d5 100644
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
  * @parent: the parent object
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
index f2140739b68..1acade1d592 100644
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

