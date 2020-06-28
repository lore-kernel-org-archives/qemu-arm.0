Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2194304lfm;
        Sun, 28 Jun 2020 07:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAHqD9ueVqflB5IjjCA9aHoApUY8AjepyA2T5xo+ejrI9PhO2rghkYxN/0vPxoJEfksujM
X-Received: by 2002:a25:d28e:: with SMTP id j136mr20209991ybg.408.1593354558525;
        Sun, 28 Jun 2020 07:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354558; cv=none;
        d=google.com; s=arc-20160816;
        b=mrBG8Zs9wEzsZYlLSK8rzCeAMOy7ivMmLYSmJsx9jjGk76+7WWO1DvCRsVv43F1Qls
         4fP0lSaJvlcai2kX6c03TrVw4zyQ9CM0yLKuEE42Q47cisAuq4ZRrWf94oMq9tWUZ87u
         on1IlZwrMc0hiuWModf5XDOWGzBxKd2dSb67fMxQfCBLvO7JDC+A9hswSCPksrSQskrK
         Dd4ds3L5pFuIP+HTo0zAANR/o/czEl2nbUW4gykjBRZqwhSyt/+ySIPE1XmldAU4M3by
         dHar3V+W6+qbPodvMQKZEfMeU0EWfRIUAQndsq7aAnmGItKuYlWP+tQvkMW6mtQ9G2fq
         HA6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SgwIMScr/FIQnW8BnMJTzdrdEBtyQPvg038hPjzvKgw=;
        b=t3kBW/Uv33BvjX4qL0LpiuKvQD8F9cex2yS/ErBjDnrf66Yw7nQEAl6LvLpuvbjst7
         8EO32vgYDPaYtrI2HCwlpu79zf2ObYaDEBdyGmfWO7Bi6qbbhljBIDJYGyrH1w/XHibz
         KtIL0Ykd7wpsF0yqqYA6YnCrEzJES15DSx+moaDkX5S1EUyORoaGLrab1Qw2B3uqatqi
         I7pnCvoxEmsu2dXeXyUEvG0U9TC8FayXh+R5jtMb0nWZ5YMDttQk8ZxcWq3wb5+PiIkx
         qX+RhoVcSDqRZXzBvRxMVTN/MTwZEp6HVNO+qkDM3OCStICEczK8KC75eMGxxkHz9+GF
         9QVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DmLjHksG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u76si5938449ybi.283.2020.06.28.07.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DmLjHksG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYJ3-0005Z6-R0
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEg-0006Fv-HT
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:46 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpYEe-0004jK-Aj
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 10:24:46 -0400
Received: by mail-wr1-x442.google.com with SMTP id r12so13991387wrj.13
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 07:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgwIMScr/FIQnW8BnMJTzdrdEBtyQPvg038hPjzvKgw=;
 b=DmLjHksG4vO/ptD6HFqYBPrTo4WYlILaUNvZcw+idizCY/oRkwwWVZ4RghhTBfHnW2
 fo6lP9TJ7mBzXlJJNYGAdW/r+ZmxDJ02iASOvfUy+tZ0DixaAc9afnqGMU+3KzDu+klk
 kYNr0hbinaRIvohzRWrJRSY4cZDKjv07YsE/Qi/GZLE4mlgj2Gz3Q0ZHtPgnXqTbhyyZ
 nietcuGRTi9bo37Ts98fdLL2fp5BKm25s9NLS8RxLPHjykAfjCs6N3YrMhKcKTPwplI3
 gPFtHbCGHX1MW9XRZ9QAN0L3wIBFtMTd413vNabXYI5pOZuEdc0B+rxWz8NraEooGYwL
 7k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgwIMScr/FIQnW8BnMJTzdrdEBtyQPvg038hPjzvKgw=;
 b=k3t9FHQaTr8zx8CIwRXEee8cUwSMUsd74ggR0jQm5A4aFVxHVR/fpJjoVSpily7GtL
 /0gl6TmcFYa6wBPKRzfWWSNZzJjDcMlifwjYvSB8D3rq52oVcQpWl8laIka5nbWjjlsT
 +Ly1oEutBgVIQJ261bwWlRHwHxZyUmQZ74H4isM0yspbd8FplfQE5+rsA9m9vXPvoLOo
 DOjtACmxSze8Cwqfm2rXUA3Kc2YqiZbfJRHxRifwUktbdG8iGcdSw6omDwlMf5VIia10
 PmYU2wTxnMtma5MXaQHwEot3rcRq83SvjlcsfiOWaNgXOK2XLuaYp4gSFg2F5X7okkXz
 8PXg==
X-Gm-Message-State: AOAM530OlYRN3+vr6koKA6bibBiIxe2hO5WscJjHwrwzubzIpHl2lf23
 0K+Yn6fuEXT1FxIk00mu5wLUNWerHy5nog==
X-Received: by 2002:adf:f38f:: with SMTP id m15mr11548083wro.173.1593354282790; 
 Sun, 28 Jun 2020 07:24:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h13sm5321555wml.42.2020.06.28.07.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:24:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/17] hw/arm/spitz: Use max111x properties to set initial
 values
Date: Sun, 28 Jun 2020 15:24:21 +0100
Message-Id: <20200628142429.17111-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628142429.17111-1-peter.maydell@linaro.org>
References: <20200628142429.17111-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
X-TUID: wTUMcUuGxipn

Use the new max111x qdev properties to set the initial input
values rather than calling max111x_set_input(); this means that
on system reset the inputs will correctly return to their initial
values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 11e413723f4..93a25edcb5b 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -731,11 +731,14 @@ static void spitz_ssp_attach(SpitzMachineState *sms)
                           qdev_get_gpio_in(sms->mpu->gpio, SPITZ_GPIO_TP_INT));
 
     bus = qdev_get_child_bus(sms->mux, "ssi2");
-    sms->max1111 = ssi_create_slave(bus, "max1111");
+    sms->max1111 = qdev_new("max1111");
     max1111 = sms->max1111;
-    max111x_set_input(sms->max1111, MAX1111_BATT_VOLT, SPITZ_BATTERY_VOLT);
-    max111x_set_input(sms->max1111, MAX1111_BATT_TEMP, 0);
-    max111x_set_input(sms->max1111, MAX1111_ACIN_VOLT, SPITZ_CHARGEON_ACIN);
+    qdev_prop_set_uint8(sms->max1111, "input1" /* BATT_VOLT */,
+                        SPITZ_BATTERY_VOLT);
+    qdev_prop_set_uint8(sms->max1111, "input2" /* BATT_TEMP */, 0);
+    qdev_prop_set_uint8(sms->max1111, "input3" /* ACIN_VOLT */,
+                        SPITZ_CHARGEON_ACIN);
+    ssi_realize_and_unref(sms->max1111, bus, &error_fatal);
 
     qdev_connect_gpio_out(sms->mpu->gpio, SPITZ_GPIO_LCDCON_CS,
                         qdev_get_gpio_in(sms->mux, 0));
-- 
2.20.1

