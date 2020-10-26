Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3250863lfa;
        Mon, 26 Oct 2020 15:12:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7dI6uP/gryp0m4H9Lv/HeUmFO+F1EwTgIVKHegVCnE3Ju9KxErciPDkXU75lIP5cf9ev6
X-Received: by 2002:a37:a781:: with SMTP id q123mr3507982qke.204.1603750366991;
        Mon, 26 Oct 2020 15:12:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603750366; cv=none;
        d=google.com; s=arc-20160816;
        b=HpjCeDQCmtcRFeX3775uCWVT0HYOM62cogrKT3/PlgRlwOYo9gj0wApfeQwcpMGa/A
         +oXLF5SnAmyU6MMa8JTGyonUegZtph7eTRvhTO0g05H/J6f0jwvrQ1OpZz5T33AVpjPC
         KAS0lwcXvg5ua01Et3bwQ1YN80hEqdT0734wwdB2lyapPufaK0yVEb4EQn5ozDcRIblM
         KCYZDZlxdDg0i+2t8yhdpQblIXuJLdvrGFu/Iq5FKodu1wfbaDBnCZfNiLCFU9QH2jF5
         KhhwwOQ5qsxR+jsVvffnSkKj508bWVer1gCLiSqjQ2JG1BH8ebBNml5S3PMJeyQ/spq6
         lHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dMuCpvg2jvs8wv2yJweoNJ0vPwlnnXLBSkbONBKjyck=;
        b=Gyt48l8fp6o6Xsp8gSrWkVdLG1PW0qsVSU4IEZ67bfg1+EpXTEdQQ/5bFIYiTFJpDP
         Zn+VTFrT2mUDWm3yjqHgJhy+K/6dsM4xxybK0a2KwYMuC9V16BpK067y4xhQFLtMpVOl
         9yJ5jrInFJdhZttACRF8rwSMwVjmrgClW7DMkOjicwy1UosgVPzgLbxdgqEPVT7a6psZ
         Ueq/Bqz/i9XSzdiBQLgp7mL77qfbx12wZhXrgomC6JLquoDoU1G5dyvdjA5vSuYpWYy6
         JErtZGRSrNcDgW1D2JVxsCNt1kpv/DhMD9Gl3vrYV2soRyn9361wzz9qDohP4Zoo/pvQ
         tMYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pe8NOjvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si6251485qvx.35.2020.10.26.15.12.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 15:12:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pe8NOjvI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXAjO-000880-0b
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 18:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAdd-0008Tf-2G; Mon, 26 Oct 2020 18:06:50 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAdX-0005m7-NO; Mon, 26 Oct 2020 18:06:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id l16so11313010eds.3;
 Mon, 26 Oct 2020 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dMuCpvg2jvs8wv2yJweoNJ0vPwlnnXLBSkbONBKjyck=;
 b=pe8NOjvIu85re1H6MPR7cdc2wMW0nE4BoXaIStxKCOtIxWGkSG4SzQE2nFNzLhe+/T
 IQ3qLhF5dKDYpWcXN7w3OrqBJsj0cPdHpUejFeo2yYgYLr/Jgb9NfAoFcdhakJ+/wFNm
 DwKdEhA2IVoRZtvOhp/SENUmj97S+EyFJJW1Za7zF94QO+qavku0dB9xkvQK+6zDvpf8
 NOELvlcwA6tbzohmrhq+wIDYCxvlXmiCqqDYrllklV3AmodWRGB/jpZwrBMerQT/rbeu
 dImPwz22RIqpq/3B4YEmjxMT99YasItIvrmT+Yn08p8lRHIohGcA6nmvFu8Mx3/vpyK4
 r4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dMuCpvg2jvs8wv2yJweoNJ0vPwlnnXLBSkbONBKjyck=;
 b=KESe/8nY1Lrzry2cIFo+1u8b1uMmtvKWmJyAxOU9CXpVTniK3vk/reCNa4HnmHGj1k
 McmVMtWHzG8OuEP+hi4YhZGqkXyoiQsuGNqwxE7IW27TrpYvPXlYeBYjBucy+6CXzU/2
 NcyDJKNNDfQObYjFCr/e8SKRhlY8YYZlmkpvPD0KjsxgTtYieovscUDd9BmXJPy+Ik8T
 woTThYE2Wxj74lUJZXJtN9GSuleylDgg0GPXNKpNvurV6ZCnyyA9j+YDovRCF/IxXNNk
 i0ucVPs1Nt/dfRmEUJd+dQCwIyJApbWUOatkwp0TgqVmJszOKF3PyImUWdVZU6yneR6+
 ElBQ==
X-Gm-Message-State: AOAM533qx/grFTx5+LQnULz6oG8mye4JX/8Ol3ThlnDW+Uh5+auBH6Mh
 nh/dCNyZE2X0Voxsdewg62W/1fRjG7o=
X-Received: by 2002:aa7:cd14:: with SMTP id b20mr17950877edw.366.1603749999128; 
 Mon, 26 Oct 2020 15:06:39 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id ld2sm1287166ejb.94.2020.10.26.15.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:06:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] hw/misc/led: Allow connecting from GPIO output
Date: Mon, 26 Oct 2020 23:06:19 +0100
Message-Id: <20201026220624.60878-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026220624.60878-1-f4bug@amsat.org>
References: <20201026220624.60878-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eiklAvxInRi5

Some devices expose GPIO lines.

Add a GPIO qdev input to our LED device, so we can
connect a GPIO output using qdev_connect_gpio_out().

When used with GPIOs, the intensity can only be either
minium or maximum. This depends of the polarity of the
GPIO (which can be inverted).
Declare the GpioPolarity type to model the polarity.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Message-Id: <20200912134041.946260-3-f4bug@amsat.org>
---
 include/hw/misc/led.h  | 10 ++++++++++
 include/hw/qdev-core.h | 16 ++++++++++++++++
 hw/misc/led.c          | 17 ++++++++++++++++-
 3 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index 286d37c75c1..aa359b87c20 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -9,6 +9,7 @@
 #define HW_MISC_LED_H
 
 #include "qom/object.h"
+#include "hw/qdev-core.h"
 
 #define TYPE_LED "led"
 
@@ -37,10 +38,17 @@ struct LEDState {
     /* Public */
 
     uint8_t intensity_percent;
+    qemu_irq irq;
 
     /* Properties */
     char *description;
     char *color;
+    /*
+     * Determines whether a GPIO is using a positive (active-high)
+     * logic (when used with GPIO, the intensity at reset is related
+     * to the GPIO polarity).
+     */
+    bool gpio_active_high;
 };
 typedef struct LEDState LEDState;
 DECLARE_INSTANCE_CHECKER(LEDState, LED, TYPE_LED)
@@ -72,6 +80,7 @@ void led_set_state(LEDState *s, bool is_emitting);
 /**
  * led_create_simple: Create and realize a LED device
  * @parentobj: the parent object
+ * @gpio_polarity: GPIO polarity
  * @color: color of the LED
  * @description: description of the LED (optional)
  *
@@ -81,6 +90,7 @@ void led_set_state(LEDState *s, bool is_emitting);
  * Returns: The newly allocated and instantiated LED object.
  */
 LEDState *led_create_simple(Object *parentobj,
+                            GpioPolarity gpio_polarity,
                             LEDColor color,
                             const char *description);
 
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 868973319ee..a653295d6fc 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -443,6 +443,22 @@ void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
 void qdev_machine_creation_done(void);
 bool qdev_machine_modified(void);
 
+/**
+ * GpioPolarity: Polarity of a GPIO line
+ *
+ * GPIO lines use either positive (active-high) logic,
+ * or negative (active-low) logic.
+ *
+ * In active-high logic (%GPIO_POLARITY_ACTIVE_HIGH), a pin is
+ * active when the voltage on the pin is high (relative to ground);
+ * whereas in active-low logic (%GPIO_POLARITY_ACTIVE_LOW), a pin
+ * is active when the voltage on the pin is low (or grounded).
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
index 1e2f49c5710..c5fa09a613a 100644
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
+    led_set_state(s, !!new_state != s->gpio_active_high);
+}
+
 static void led_reset(DeviceState *dev)
 {
     LEDState *s = LED(dev);
 
-    led_set_state(s, false);
+    led_set_state(s, s->gpio_active_high);
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
+    DEFINE_PROP_BOOL("gpio-active-high", LEDState, gpio_active_high, true),
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
+    qdev_prop_set_bit(dev, "gpio-active-high",
+                      gpio_polarity == GPIO_POLARITY_ACTIVE_HIGH);
     qdev_prop_set_string(dev, "color", led_color_name[color]);
     if (!description) {
         static unsigned undescribed_led_id;
-- 
2.26.2

