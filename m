Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1653531lfq;
        Thu, 10 Sep 2020 13:55:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD+GN6lQ3l/vG0dlcysTjQWWUuxCvCduEuRQ/ZtrqtG7QsM7djx1EdExRuWISvSq87pZp1
X-Received: by 2002:a25:afc3:: with SMTP id d3mr16127770ybj.440.1599771311275;
        Thu, 10 Sep 2020 13:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599771311; cv=none;
        d=google.com; s=arc-20160816;
        b=bTLeOirGQjfFat1Qu2sS1ks1YvMNXoHH7Xzue4u3cypfYSISCU3/WzI1GNT7l3dy6M
         WJjcZpJygaJRGhL3Q+0z5Tq06EBxeJp4xuTxYo18sSruxTKOyNVrK5eGalHjOj0mH3jm
         ppdAMfQ3DwX1TtM6Ha/ITUV3ZOoX+CkXq/kjVnWd4tjzzINALbtiZO5773cbo2rzz7zt
         2NPQpssx31EPHmllh1tqJD/H2Dn/oudgGReUzPdTwAujnTc7EqR4OWbqYT+lBgANkhE/
         EwJ2p9hmHuDxHNrRF8sRCk0BGtN6xcoAnHorahZfVzA+xmpTF7Nv8W2+mltxH9zYt58b
         9ATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pr3IdxupnoTag8g+l9d/z4aY7eG0d/P7ZaZKT2cQb14=;
        b=D21gMQRP8iWuHctc3TgPW0q79wVOAkfd2kBfFkuf0zlMAW2iTLYIBjJgiDjjDRJpFF
         3T+MF+nwvT+FWxfUhQZ/mwHjnXWSB04U4eGUC2T/ZwkVpToyIfeTFjHdIMg0cgZN4wA5
         8csiCoqMGYI/wemDb2Rd484Dfijvjq9OuKD2/cuqIu8U68ZGkGjP0uE+LAsLFxW+z1CN
         X23LhGVfGm4hzRuXKuZVk8RdywUFC5OCiIZ1fJfh4SyQ/NtluoQIrVWQ6BlrKELO7tgU
         k+7HufiLVyN87p7V3D3hGS0uAc5s8iWIMcvZEqBQSi8BaLRlnoKN049a1zz1WZB7Z+Um
         9lSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XMJ8XoJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si95453yba.327.2020.09.10.13.55.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 13:55:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XMJ8XoJv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGTb4-0004mG-JD
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 16:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTaa-0004Fk-IX; Thu, 10 Sep 2020 16:54:40 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTaY-0000HX-J6; Thu, 10 Sep 2020 16:54:40 -0400
Received: by mail-wr1-x443.google.com with SMTP id e16so8678264wrm.2;
 Thu, 10 Sep 2020 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pr3IdxupnoTag8g+l9d/z4aY7eG0d/P7ZaZKT2cQb14=;
 b=XMJ8XoJvNLl+l/3ThwTUrJhBW/ats7GMT8TS3AGtudRW2cEklhfmlxFBeAgDr3Pzh9
 X0RV2MTmz5xq1c6r195QWwKzW334K3xv2WtBCkGn0RbzJ4D4pWirWo/rV9aORCpZtOWI
 a9cSmkR8QNpZdfBz3pMDdY5sewQe2X+Xhnceqmcy+lE4wtx7X4h2VZQY7KUteac7hGdJ
 Skhxzq5CdUvVBJVP6uPjF4bzG6KlWXv50HNLeWsPcF89rH3viTwSI2sXhp/77fpnJCdj
 GOk8qX1qBsJxDwv/mAGQ1fLTUTgBcLGz67ePVf+L7z/3gxow7lr+g7YKhLrFZyKm8oJl
 xUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pr3IdxupnoTag8g+l9d/z4aY7eG0d/P7ZaZKT2cQb14=;
 b=Nq7/LcOSqAubuCHVCQ02ZsvgJ4OM4WzkqNPv4+WIbZTmBQIAy0G/L6qSDz4x7sHI1Q
 3m2BDUof9WjldBYtYuob1aTbHlGOAHT7fQA+ktKsZpLkM8SLxBqbPId+HQpQ7lXZ+2U1
 B6JoKKpu1afuk45OGGGyCCKjwKzR8Qyx8YcFPHG6ai4VW/1FuVdIsnTDFzDjfMuoIjsl
 NkOgoHGx7YabYz/5xGeGKIenHfVLQ4sYzv0RqL0utwYjK/Z0UQNTzV6CUMdO8xz4nApa
 f66eljfFHf+ixTvzJC596BlFAHfdpakb+RP9snPDkbjUqj3YPnisTA61eV566l3ghfeG
 MJjg==
X-Gm-Message-State: AOAM531Z+mSpt8uKMr06a7/1p1yxGo0NdNnDPT1dVq2oPa5SMhzyB1kU
 bihwF1P8GcPsmyAwwzKzj2N8cAH7+7A=
X-Received: by 2002:adf:8b48:: with SMTP id v8mr10930209wra.21.1599771276760; 
 Thu, 10 Sep 2020 13:54:36 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t1sm5089317wmi.16.2020.09.10.13.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 13:54:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/7] hw/arm/aspeed: Add the 3 front LEDs drived by the
 PCA9552 #1
Date: Thu, 10 Sep 2020 22:54:26 +0200
Message-Id: <20200910205429.727766-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910205429.727766-1-f4bug@amsat.org>
References: <20200910205429.727766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Luc Michel <luc.michel@greensocs.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1PQhUNDOApNu

The Witherspoon has 3 LEDs connected to a PCA9552. Add them.
The names and reset values are taken from:
https://github.com/open-power/witherspoon-xml/blob/master/witherspoon.xml

Example booting obmc-phosphor-image:

  $ qemu-system-arm -M witherspoon-bmc -trace led_change_intensity
  1592693373.997015:led_change_intensity LED desc:'front-fault-4' color:green intensity 0% -> 100%
  1592693373.997632:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
  1592693373.998239:led_change_intensity LED desc:'front-id-5' color:green intensity 0% -> 100%
  1592693500.291805:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
  1592693500.312041:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
  1592693500.821254:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
  1592693501.331517:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
  1592693501.841367:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
  1592693502.350839:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%
  1592693502.861134:led_change_intensity LED desc:'front-power-3' color:green intensity 100% -> 0%
  1592693503.371090:led_change_intensity LED desc:'front-power-3' color:green intensity 0% -> 100%

We notice the front-power LED starts to blink at a ~2Hz rate.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 20 ++++++++++++++++++++
 hw/arm/Kconfig  |  1 +
 2 files changed, 21 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8bfb1c79ddc..83e322ea983 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -20,6 +20,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
 #include "hw/misc/tmp105.h"
+#include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
@@ -521,9 +522,20 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
 
 static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
 {
+    static const struct {
+        unsigned gpio_id;
+        LEDColor color;
+        const char *description;
+        bool gpio_polarity;
+    } pca1_leds[] = {
+        {13, LED_COLOR_GREEN, "front-fault-4",  GPIO_POLARITY_ACTIVE_LOW},
+        {14, LED_COLOR_GREEN, "front-power-3",  GPIO_POLARITY_ACTIVE_LOW},
+        {15, LED_COLOR_GREEN, "front-id-5",     GPIO_POLARITY_ACTIVE_LOW},
+    };
     AspeedSoCState *soc = &bmc->soc;
     uint8_t *eeprom_buf = g_malloc0(8 * 1024);
     DeviceState *dev;
+    LEDState *led;
 
     /* Bus 3: TODO bmp280@77 */
     /* Bus 3: TODO max31785@52 */
@@ -534,6 +546,14 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
                                 aspeed_i2c_get_bus(&soc->i2c, 3),
                                 &error_fatal);
 
+    for (size_t i = 0; i < ARRAY_SIZE(pca1_leds); i++) {
+        led = led_create_simple(OBJECT(bmc),
+                                pca1_leds[i].gpio_polarity,
+                                pca1_leds[i].color,
+                                pca1_leds[i].description);
+        qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
+                              qdev_get_gpio_in(DEVICE(led), 0));
+    }
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bc3a423940b..06ba1c355b1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -394,6 +394,7 @@ config ASPEED_SOC
     select TMP105
     select TMP421
     select UNIMP
+    select LED
 
 config MPS2
     bool
-- 
2.26.2

