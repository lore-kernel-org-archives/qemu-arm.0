Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3255900lfa;
        Mon, 26 Oct 2020 15:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK9SUzqZAr06//h5fHjpQaaZgFkz3KM/VWEfQZWTKmcrfCjHFdBn9DE04Sqwv4kgyFWSrz
X-Received: by 2002:a37:6246:: with SMTP id w67mr16933001qkb.35.1603750849224;
        Mon, 26 Oct 2020 15:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603750849; cv=none;
        d=google.com; s=arc-20160816;
        b=aa+NTK1N2ZBzabCNgnujyZagJLKfsmvMgfONciSDNU9M+/+btX5VIOcy4dSorb04Do
         DVsAGaaB1KoWp37fgIKiWp+eSlP0dOV9adGrGKSTQ44NxY0RyIx9oWzhc8seO2g16nnK
         4JS4IFu6GWhNHPIMb/LK5y7Z0TXYXhc12T14lROo2IIP9ZgnoQLnaGdYs3iEzNlDkYrh
         M1JrFJkD4+WMJnNwVGbsakLt6HgwirwN3u8pPTIjK+TcfmlKRc/i/mTcpwTavvf+RGCh
         f5dTMB6PgmLjynTThSs0Tcc5M/SrXVPO6sV5rOp42k+FzuBD9Gyp0eGmjP1+VFQIdYqW
         e8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Cm68ZLDWvK5znkWhn2IKM56HcHBW6UWkfpIBdHv6B2I=;
        b=Z/2+sWra3vgmZKGHzZAzw179SArSx5nNMKmeEUznBXCE1+lHg0SCzIB7HBCZyBVk0y
         b95LrwaMYmk8dBAlLnBe9N5ociO9AVYC/c+87Kjo7j4gKfqQ5uJh9LyECmtx1UxCNuxE
         U1z2WWa9huRkBRnSmUl4hBoVLzuy0yi8/dkaDKDImmtefuv9mbB3S5wR1TvASuZpFVHp
         Jh2w29GNMjZBHbN22hDSBR+o2fTVgFBEUw9n4dRB6/bsgMsDEgFJOaFf33hmtzU+QvoV
         nRMsmqJPxWl2YQ0I7Z+lOh5Ddt1QeSbuVK+1xGKm7pOPp722at7+f2i8BStgU76PlsMk
         8DHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KqRdWZL2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si6341725qkc.36.2020.10.26.15.20.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Oct 2020 15:20:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KqRdWZL2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kXArA-0000Lt-GW
	for alex.bennee@linaro.org; Mon, 26 Oct 2020 18:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAe0-0000kA-GP; Mon, 26 Oct 2020 18:07:12 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kXAdy-0005ox-Dy; Mon, 26 Oct 2020 18:07:12 -0400
Received: by mail-ej1-x642.google.com with SMTP id t25so16033863ejd.13;
 Mon, 26 Oct 2020 15:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cm68ZLDWvK5znkWhn2IKM56HcHBW6UWkfpIBdHv6B2I=;
 b=KqRdWZL2zYIVybTEFN2IcvQZZGH6zfluL0WwUvMHZrqaBXCPAEfqgb76XoBaFQ1H5V
 Cw7t++uxDZjxd4HLJt9rYwEt5QxSSvUjRhUW9nzFh6aoYmOqDSK2OZQTPBlJIxSwhr6+
 WYdtfk+B/nSoPo0AGHAC/DAF8yUEr6DlANjGe9VSJS7UHFcXBZH/BMVo2fh8G7Koxs7L
 5et5ho9z6KQ0PwMKvdITZnkBsgXS323DRZ7ZUCMHUGjZh7PThxj12nK9kAJn0g0x5I/a
 aqGHF6PpptOE095N8djbPKWE4GlArRkvFnLyj5arSNEUNV8OwSn5unx/w9XOkccCq92T
 guHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cm68ZLDWvK5znkWhn2IKM56HcHBW6UWkfpIBdHv6B2I=;
 b=AL1lm3h3qRpnRWev8peDHHwDd8YuZ7/S+1aT99EQ6UH518xWV035NV5AKkwyA1dXaq
 dSE6/z56o4R+v6xAoLv5u056UKU9Y8AniktD0dWuXoq/vdxfAn/kcufN1lsucLKclfNG
 8FEyVeicGFqpZ9M9xSeiQd1o0X4TEwkYvEiraGgA7eqe/BAvC3iDGhCjluZcBRxAvQyO
 v1F01Wrv0PW7ErBnBrX3u2cPcw+ECl0yPfo5i4wSAfbj0R8EWh9Vij68/eUB8awWiF1j
 FpjgDfnTZ7nYJArwS0FY3bVEinaN9KuqySutZFeE8rSd2tO3UzvuyWE74Pw5FGUEOSdY
 JarQ==
X-Gm-Message-State: AOAM530ZjrDu+O8V1pN/xwqPAIozWzk6ofBIqqzl7jW8GJUkCQguPfA8
 WdsfjOEcWf7ujidq5aV0k8M0mES3dAw=
X-Received: by 2002:a17:906:14db:: with SMTP id
 y27mr18600472ejc.148.1603750028476; 
 Mon, 26 Oct 2020 15:07:08 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id s25sm6427447ejc.29.2020.10.26.15.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 15:07:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] hw/arm/tosa: Replace fprintf() calls by LED devices
Date: Mon, 26 Oct 2020 23:06:24 +0100
Message-Id: <20201026220624.60878-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026220624.60878-1-f4bug@amsat.org>
References: <20201026220624.60878-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HJDr7hon+Uq

The recently added LED device reports LED status changes with
the 'led_set_intensity' trace event. It is less invasive than
the fprintf() calls. We need however to have a binary built
with tracing support.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200912134041.946260-8-f4bug@amsat.org>
---
 hw/arm/tosa.c  | 40 +++++++++++++++-------------------------
 hw/arm/Kconfig |  1 +
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index c196f0d2f88..fe88ed89fee 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -24,6 +24,7 @@
 #include "hw/irq.h"
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
+#include "hw/misc/led.h"
 #include "exec/address-spaces.h"
 #include "qom/object.h"
 
@@ -81,26 +82,6 @@ struct TosaMiscGPIOState {
     SysBusDevice parent_obj;
 };
 
-static void tosa_gpio_leds(void *opaque, int line, int level)
-{
-    switch (line) {
-    case 0:
-        fprintf(stderr, "blue LED %s.\n", level ? "on" : "off");
-        break;
-    case 1:
-        fprintf(stderr, "green LED %s.\n", level ? "on" : "off");
-        break;
-    case 2:
-        fprintf(stderr, "amber LED %s.\n", level ? "on" : "off");
-        break;
-    case 3:
-        fprintf(stderr, "wlan LED %s.\n", level ? "on" : "off");
-        break;
-    default:
-        g_assert_not_reached();
-    }
-}
-
 static void tosa_reset(void *opaque, int line, int level)
 {
     if (level) {
@@ -112,7 +93,6 @@ static void tosa_misc_gpio_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
 
-    qdev_init_gpio_in_named(dev, tosa_gpio_leds, "leds", 4);
     qdev_init_gpio_in_named(dev, tosa_reset, "reset", 1);
 }
 
@@ -122,6 +102,7 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                 TC6393xbState *tmio)
 {
     DeviceState *misc_gpio;
+    LEDState *led[4];
 
     misc_gpio = sysbus_create_simple(TYPE_TOSA_MISC_GPIO, -1, NULL);
 
@@ -143,14 +124,23 @@ static void tosa_gpio_setup(PXA2xxState *cpu,
                         qdev_get_gpio_in(cpu->gpio, TOSA_GPIO_JC_CF_IRQ),
                         NULL);
 
+    led[0] = led_create_simple(OBJECT(misc_gpio), GPIO_POLARITY_ACTIVE_HIGH,
+                               LED_COLOR_BLUE, "bluetooth");
+    led[1] = led_create_simple(OBJECT(misc_gpio), GPIO_POLARITY_ACTIVE_HIGH,
+                               LED_COLOR_GREEN, "note");
+    led[2] = led_create_simple(OBJECT(misc_gpio), GPIO_POLARITY_ACTIVE_HIGH,
+                               LED_COLOR_AMBER, "charger-error");
+    led[3] = led_create_simple(OBJECT(misc_gpio), GPIO_POLARITY_ACTIVE_HIGH,
+                               LED_COLOR_GREEN, "wlan");
+
     qdev_connect_gpio_out(scp1, TOSA_GPIO_BT_LED,
-                          qdev_get_gpio_in_named(misc_gpio, "leds", 0));
+                          qdev_get_gpio_in(DEVICE(led[0]), 0));
     qdev_connect_gpio_out(scp1, TOSA_GPIO_NOTE_LED,
-                          qdev_get_gpio_in_named(misc_gpio, "leds", 1));
+                          qdev_get_gpio_in(DEVICE(led[1]), 0));
     qdev_connect_gpio_out(scp1, TOSA_GPIO_CHRG_ERR_LED,
-                          qdev_get_gpio_in_named(misc_gpio, "leds", 2));
+                          qdev_get_gpio_in(DEVICE(led[2]), 0));
     qdev_connect_gpio_out(scp1, TOSA_GPIO_WLAN_LED,
-                          qdev_get_gpio_in_named(misc_gpio, "leds", 3));
+                          qdev_get_gpio_in(DEVICE(led[3]), 0));
 
     qdev_connect_gpio_out(scp1, TOSA_GPIO_TC6393XB_L3V_ON, tc6393xb_l3v_get(tmio));
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 70e275cafda..3c893e07cde 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -151,6 +151,7 @@ config TOSA
     select ZAURUS  # scoop
     select MICRODRIVE
     select PXA2XX
+    select LED
 
 config SPITZ
     bool
-- 
2.26.2

