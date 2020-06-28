Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2191723lfm;
        Sun, 28 Jun 2020 07:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNBaV5T0Y/CegcOJAFY0nFhyTDXgRpaAAiy2eLECVpSjA71igS+rc8HBC2wTKHi7SKqcg3
X-Received: by 2002:a25:6b49:: with SMTP id o9mr18754579ybm.275.1593354300520;
        Sun, 28 Jun 2020 07:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354300; cv=none;
        d=google.com; s=arc-20160816;
        b=Bw9ZbOO00dsxUNlhKSUyT63kSnqJrYzyqY8Lus9n2GVD0Bme+wEawTe7dXmb2e0tUS
         Xvo/I4Y49MhrcYgLrQ4Oeh+xyWvIaPxSUWHpfZ2MgiQv47C/ML0fBIS148XPoTWhNhtK
         2sgB/Y/Br/KkuSPc1McpszgHHitEfLVZTm2+0Ry6nvOKqZkK34XFGfN6l86W46hKHfKI
         1xnnnRuMT7H//f4xSyJa9XT5uW6jAPmQ8vRPn/sjb/ztxaKXhP0ksEtN8TYytlHZssxh
         vw0qKDDypGwmAFGTkCsSI+0bThKFr2c++Bcp2uoZNoNI44Ynkowxv4dWu/a2DaoLStlc
         bt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uwJ6AMnZ4BeCXoBcjEvXgzYDqM09D0Grg4qI2GYORlA=;
        b=gpHK6tnmViBW9L017IYEaV/ymdMLNY+fEYTmtt0F3Hq3Zih0XsQT3vQkgHG4OBOSRF
         3RQak+UvExcsn1wBlGBMlJuNC313pm3tAy6F8u9HurlGNcvIUMO+WwhrHWyrefQBBYrr
         hQzx+KAE2DqRhU3crS15NdzN5/p6+BtdAqCFYYlr79pt5u+/AGvOgFyTKSRKLwbqke/y
         sSz+7ep8XwEClx22OrgYrm6ypVXGxwQ2yRXEifcaOpdJY7ghBeh/zkZamyJlraV+8fSE
         NYa8tdVcx8rrhPrSAEboK7QCAHEWZ02qlLYGbPxAFcDp79mx8E28ZWjAulBYYvOJhTsa
         dyZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w9idSx+0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si29042161ybd.161.2020.06.28.07.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w9idSx+0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYEt-0006Ty-Rn
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEb-00060v-8k
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:41 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEZ-0004gw-Jz
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:40 -0400
Received: by mail-wm1-x341.google.com with SMTP id l17so13019544wmj.0
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uwJ6AMnZ4BeCXoBcjEvXgzYDqM09D0Grg4qI2GYORlA=;
 b=w9idSx+0gR7I3+whwLAtTQ7A4m1JDKYQnxwFpVGWoy1zyPJoHtWn7jrBfB64yYDhJb
 zRX3DoCDbWX/lt3udEUqF/quULhT1YkeaRLgjM+re95BUz4X0n7bBmmscdehIdfz6EfS
 ZENQM4oFGmfjl562zDe214qYQExwzKV3gUG/M6Ru+EDf5hMMzembzNkRl7vz83SEW/Af
 iosd6MKXYzjZ/P/W9/Zabs4dZ9DFC7XGhtl7QVWW11N7jyAMQ6htRfvzY49/Wdh7rTpL
 sUrg2OS2etoBz/9Om/tvB8TgUj6UehkxeKe2gWQmls6zORlGtCbARZgunh23/GcEiiDe
 exbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uwJ6AMnZ4BeCXoBcjEvXgzYDqM09D0Grg4qI2GYORlA=;
 b=Jvpl8K3STkuQIwD2ENXPqKYv224Up7rv3AY+OAciOPr2FxMnBjHlqQbUjgP1vAw29V
 PTn+sO0T0p24kPuRY1mT5TOL5QxpuRsAk3O6Kma5aSwOWGMBjQhtaET5gYpdg+ShwmFf
 SBO5Wt8yKbcd3zwFWA+vTXTwubigKV6LerR/Yx3/bu2+CARS6o6C29mEQpnOtIx7ZN9Y
 p3ifJMz3cSQBERkNeuSAjKemC04COnUH8hynBaRtvMB439ueCgPlpYYKC4/a7cKUrpp5
 vgqQCYxGGA67e0eKU18NybeQuQKR1xe7G3nv/stgLM56Tsv3mNFK0r8rzcSPnINZnFFP
 WSuQ==
X-Gm-Message-State: AOAM531AWntzw82FcGJ9CQQHan1y6x4lItPRYfyQPNb72lVSZL/h0qxu
 mAgMkj9g6a0ac262TOxdPDTvtgynbxil5w==
X-Received: by 2002:a1c:9650:: with SMTP id y77mr8861480wmd.101.1593354278097; 
 Sun, 28 Jun 2020 07:24:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/17] hw/arm/spitz: Implement inbound GPIO lines for bit5 and
 power signals
Date: Sun, 28 Jun 2020 15:24:17 +0100
Message-Id: <20200628142429.17111-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XKoDtOTFpTpA

Currently the Spitz board uses a nasty hack for the GPIO lines
that pass "bit5" and "power" information to the LCD controller:
the lcdtg realize function sets a global variable to point to
the instance it just realized, and then the functions spitz_bl_power()
and spitz_bl_bit5() use that to find the device they are changing
the internal state of. There is a comment reading:
 FIXME: Implement GPIO properly and remove this hack.
which was added in 2009.

Implement GPIO properly and remove this hack.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 69bc2b3fa10..11e413723f4 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -586,12 +586,9 @@ static void spitz_bl_update(SpitzLCDTG *s)
         zaurus_printf("LCD Backlight now off\n");
 }
 
-/* FIXME: Implement GPIO properly and remove this hack.  */
-static SpitzLCDTG *spitz_lcdtg;
-
 static inline void spitz_bl_bit5(void *opaque, int line, int level)
 {
-    SpitzLCDTG *s = spitz_lcdtg;
+    SpitzLCDTG *s = opaque;
     int prev = s->bl_intensity;
 
     if (level)
@@ -605,7 +602,7 @@ static inline void spitz_bl_bit5(void *opaque, int line, int level)
 
 static inline void spitz_bl_power(void *opaque, int line, int level)
 {
-    SpitzLCDTG *s = spitz_lcdtg;
+    SpitzLCDTG *s = opaque;
     s->bl_power = !!level;
     spitz_bl_update(s);
 }
@@ -639,13 +636,16 @@ static uint32_t spitz_lcdtg_transfer(SSISlave *dev, uint32_t value)
     return 0;
 }
 
-static void spitz_lcdtg_realize(SSISlave *dev, Error **errp)
+static void spitz_lcdtg_realize(SSISlave *ssi, Error **errp)
 {
-    SpitzLCDTG *s = FROM_SSI_SLAVE(SpitzLCDTG, dev);
+    SpitzLCDTG *s = FROM_SSI_SLAVE(SpitzLCDTG, ssi);
+    DeviceState *dev = DEVICE(s);
 
-    spitz_lcdtg = s;
     s->bl_power = 0;
     s->bl_intensity = 0x20;
+
+    qdev_init_gpio_in_named(dev, spitz_bl_bit5, "bl_bit5", 1);
+    qdev_init_gpio_in_named(dev, spitz_bl_power, "bl_power", 1);
 }
 
 /* SSP devices */
@@ -820,15 +820,11 @@ static void spitz_out_switch(void *opaque, int line, int level)
     case 3:
         zaurus_printf("Orange LED %s.\n", level ? "on" : "off");
         break;
-    case 4:
-        spitz_bl_bit5(opaque, line, level);
-        break;
-    case 5:
-        spitz_bl_power(opaque, line, level);
-        break;
     case 6:
         spitz_adc_temp_on(opaque, line, level);
         break;
+    default:
+        g_assert_not_reached();
     }
 }
 
@@ -858,9 +854,9 @@ static void spitz_scoop_gpio_setup(SpitzMachineState *sms)
 
     if (sms->scp1) {
         qdev_connect_gpio_out(sms->scp1, SPITZ_SCP2_BACKLIGHT_CONT,
-                              outsignals[4]);
+                              qdev_get_gpio_in_named(sms->lcdtg, "bl_bit5", 0));
         qdev_connect_gpio_out(sms->scp1, SPITZ_SCP2_BACKLIGHT_ON,
-                              outsignals[5]);
+                              qdev_get_gpio_in_named(sms->lcdtg, "bl_power", 0));
     }
 
     qdev_connect_gpio_out(sms->scp0, SPITZ_SCP_ADC_TEMP_ON, outsignals[6]);
-- 
2.20.1

