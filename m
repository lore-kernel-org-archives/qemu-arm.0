Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1877323lfm;
        Sat, 20 Jun 2020 16:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp8hDojx28oV+ROn20LcWDXx2K0nJATWlYZ2W60oK8Nq2nmbdIVYqaBAWq0EdpKESTiqwl
X-Received: by 2002:a25:3295:: with SMTP id y143mr16418839yby.321.1592694565727;
        Sat, 20 Jun 2020 16:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592694565; cv=none;
        d=google.com; s=arc-20160816;
        b=XiZ1m6voSq5ZorofZyhQRcvjAW3ul1v0Hkix6MYZowDHTeKSxK+CvcQiqDnE+VAqDx
         pC8Ph6JgrTbOS4LaVgT4u/XdvThXnKu1P9SyVxuMEStOgizVhqyrpy9KV7COZp2QwXuC
         gBzw9NlxW1/bsZCF1pZG596o0XWiEfueY8rjlojs86C2xkgcWgNMfayE5/vnDMeI7+m+
         lGhXqNNg/GZ2Z0QJgepT76ALJ0+bYXLUCj9yFirTeynQmS6S/QChGdT+ocOR18htLFJj
         SLNR4mR3FS4G4ExODenruAGXDeBMz1LicavKha4nhRrJaN7lrhA+5dXcRDQrwOkCjT+v
         qczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5hUQ5otQW5bygweFKI3rW4XNSTTh4n8sfBRqu0ySVvs=;
        b=tXbsAij6YvUuaNGhqS/QUiIbUVrUVphixxwPzxN/41YJsNOO9nr4sxvQeEWBR3+uPw
         S19kvcpiotD9HAzJ4hnNO/QbX4QfgxgHvZCGMmfn7AicWIPni/zUCbbFBD9G30v6N43K
         IMl0UOk0rPMoTBEzbDIWpivqNueHB2/qGjReo82084NxRzJrVYQhgR+ed1njl5tC/8eg
         h912nRgGWb6vThdpvRjL4ZIRwlMHt+FdPhz0nd6QD/0IY2G67sRrd0RX1Y3cDX0GQ+K6
         DoA9vNRQXrsTk/BVkHVryS4tWr9fuaiNlJ0aMcuNO96IBahHCilsxfxpyFn1WCXfp1a+
         csAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Zy9rrEO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si9418815ybc.177.2020.06.20.16.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jun 2020 16:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Zy9rrEO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmmc1-0000wF-3p
	for alex.bennee@linaro.org; Sat, 20 Jun 2020 19:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmma8-0006zZ-EE; Sat, 20 Jun 2020 19:07:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmma6-0002MG-U3; Sat, 20 Jun 2020 19:07:28 -0400
Received: by mail-wr1-x442.google.com with SMTP id o11so5446615wrv.9;
 Sat, 20 Jun 2020 16:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hUQ5otQW5bygweFKI3rW4XNSTTh4n8sfBRqu0ySVvs=;
 b=Zy9rrEO8pPRm0FO7p7zU69pbshb81SUnExVa5YSCHy02tmPi8DWS+JcDT1RaaQRBRF
 pPkN2QpRpevLiyOn15BxBlL/jUIiDb7aLN63bS+RrWSoVY5ofD8b7mJtwvNd255/G34z
 JYH0JjIVn6ZvK0R+P3wWyk5E7LHj8t20J50KYo9yE05J0nbr4SDlxfC9zABcsjTz1AEw
 ug+CYaBZaYfzreKN3BiA3ksgKn75kUWyZ0xIaeOKFteIG8+lCH29spz0Y1uuC3+n3aqS
 qi19k3qZOpuSl1YG4VNTdWTBOmzyzNkNP4MynEllnlAUUn+lXQvDuHyO7XVOAepJXvqY
 YN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5hUQ5otQW5bygweFKI3rW4XNSTTh4n8sfBRqu0ySVvs=;
 b=FLCXld6krxikbjsDkagSy1LmM9KMrHdJGbh3bLXsyowUkrTYoc/IM3VqsFQ0qLPITe
 t+wEXzbi7MmO+EPE89JeIH4wNsGgi2waqbecyfyE7N96WVeaACHXJ49xNvBBVnn9JqZB
 1UF/s7Bmzb3fmdoLA/a0+GEfd+lKaDSVsfXANuTdEJHogIFG5HAxFmyih1D8So9iUlJu
 kzE7xSjATELnHZZLGYBcdtj/pdJVsoZ5Dd8vmgTpzfZMbNSwQboo/qxtEmU/8iy1y4RA
 p2xaNKx8kv4HU3ast9RSO+/1qhkpvheegG3b5cRrtwjM3THs2X3fKrcMhUmCNVm/IXb1
 HU8w==
X-Gm-Message-State: AOAM530CqYs1zPqzt+s9t9MZ4sKfGX+gFEh2J7NUllp7aD2reU4qSSS1
 CzOzuWHp7i2cVziHLE6Z/La60dGA
X-Received: by 2002:adf:ed47:: with SMTP id u7mr6541699wro.201.1592694444884; 
 Sat, 20 Jun 2020 16:07:24 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id o82sm11455037wmo.40.2020.06.20.16.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 16:07:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/7] hw/misc/led: Add helper to connect LED to GPIO output
Date: Sun, 21 Jun 2020 01:07:14 +0200
Message-Id: <20200620230719.32139-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620230719.32139-1-f4bug@amsat.org>
References: <20200620230719.32139-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YAKRzR4v5fT+

Some devices expose GPIO lines. Add the create_led_by_gpio_id()
helper to connect a LED to such GPIO.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Adding support for named GPIO is trivial. We don't need it yet.
---
 include/hw/misc/led.h | 20 ++++++++++++++++++++
 hw/misc/led.c         | 25 +++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/include/hw/misc/led.h b/include/hw/misc/led.h
index 821ee1247d..883006bb8f 100644
--- a/include/hw/misc/led.h
+++ b/include/hw/misc/led.h
@@ -35,6 +35,8 @@ typedef struct LEDState {
     DeviceState parent_obj;
     /* Public */
 
+    qemu_irq irq;
+
     /* Properties */
     char *description;
     char *color;
@@ -76,4 +78,22 @@ DeviceState *create_led(Object *parentobj,
                         const char *description,
                         uint16_t reset_intensity);
 
+/**
+ * create_led_by_gpio_id: create and LED device and connect it to a GPIO output
+ * @parent: the parent object
+ * @gpio_dev: device exporting GPIOs
+ * @gpio_id: GPIO ID of this LED
+ * @color: color of the LED
+ * @description: description of the LED (optional)
+ * @reset_intensity: LED intensity at reset
+ *
+ * This utility function creates a LED and connects it to a
+ * GPIO exported by another device.
+ */
+DeviceState *create_led_by_gpio_id(Object *parentobj,
+                                   DeviceState *gpio_dev, unsigned gpio_id,
+                                   LEDColor color,
+                                   const char *description,
+                                   uint16_t reset_intensity);
+
 #endif /* HW_MISC_LED_H */
diff --git a/hw/misc/led.c b/hw/misc/led.c
index e55ed7dbc4..8503dde777 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -10,6 +10,7 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/led.h"
+#include "hw/irq.h"
 #include "trace.h"
 
 static const char *led_color(LEDColor color)
@@ -39,6 +40,14 @@ void led_set_state(LEDState *s, bool is_on)
     led_set_intensity(s, is_on ? UINT16_MAX : 0);
 }
 
+static void gpio_led_set(void *opaque, int line, int new_state)
+{
+    LEDState *s = LED(opaque);
+
+    assert(line == 0);
+    led_set_state(s, !!new_state);
+}
+
 static void led_reset(DeviceState *dev)
 {
     LEDState *s = LED(dev);
@@ -63,6 +72,8 @@ static void led_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "property 'color' not specified");
         return;
     }
+
+    qdev_init_gpio_in(DEVICE(s), gpio_led_set, 1);
 }
 
 static Property led_properties[] = {
@@ -119,3 +130,17 @@ DeviceState *create_led(Object *parentobj,
 
     return dev;
 }
+
+DeviceState *create_led_by_gpio_id(Object *parentobj,
+                                   DeviceState *gpio_dev, unsigned gpio_id,
+                                   LEDColor color,
+                                   const char *description,
+                                   uint16_t reset_intensity)
+{
+    DeviceState *dev;
+
+    dev = create_led(parentobj, color, description, reset_intensity);
+    qdev_connect_gpio_out(gpio_dev, gpio_id, qdev_get_gpio_in(dev, 0));
+
+    return dev;
+}
-- 
2.21.3

