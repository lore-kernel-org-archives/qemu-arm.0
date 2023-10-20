Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1204494ejb;
        Fri, 20 Oct 2023 06:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJS5372ai9UbAFELncRZA2SrB9b1bYFmFE8Sk9XejNtVDk3tzkTEgh9LrUH8NpTaemSjrT
X-Received: by 2002:ac8:5946:0:b0:41c:e009:6ad7 with SMTP id 6-20020ac85946000000b0041ce0096ad7mr289157qtz.52.1697807038006;
        Fri, 20 Oct 2023 06:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697807037; cv=none;
        d=google.com; s=arc-20160816;
        b=Q5mHa0LxdrCYBCGIDq34klo4fG7/QuQSkrOF6t/1fI2gAxbQplGiwNkeNz8TEixilU
         4R0V9gCRhzXeRQAXwajN59DOTazBGy2emHQF2MSKOrkFrKl6t/UnKfT+lMYGR6ymyNRs
         O24rjcECXxR602WA4+ZbcD9NoQ/KWaEoesXNXmLUGvCOTGNXkFAe9HNevfoD4vI7tu7I
         qjv6ChHUqqyBEPHJSXA6XglunIv92ijD5PxnbvAPsVxTt7oxr6Bdgmq3QkeQJjCja0X1
         YuoRgfdFs3sQZoZcGE7PH08MpnzFvqVf9FRLYLrKP09/i39xIVhNfkq5dLZ8xlhJQ6ip
         SkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zkM/85hWmZ9SV/FNcYSH0O2+Ai96FulzN3LwQBfEAtk=;
        fh=QWGggua+3ufs1S3QlzhTWcDhlhc7bBCtXi/Y+/UuB8A=;
        b=ZvKfZa0+05R5ibmyJFMT9gdgm6PnA4cZ+qlWJdNzwCELDXcge3CEeWjkOuCKCrsI8O
         wlu0UFJKkzfSUOKeDQhqgc1sq+rwRh3Xihm05vcrFMpgnYbzfSg3oL5lh6kaov4xGJAI
         tr4aMs6xyp6ro5t9GQCH98uHGOyz+ylJOZ+DFGskNIeteGlvzs3yaGCDBmdVzULGU9U3
         GjEHwKwCDb3bR9+9F8nTgXbTXpHWY1WMU5NivaJsCFdvgFpihYtGkOVAKnaN/uCHAp+v
         9ZzthtogGeRRR+vIBvPr5sE8+S1C+nUwNgUrziSbmqdp+KjL3qspxZlI1f2TzwK7EAUP
         F7xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fz0NQGU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020ac87f92000000b00417afb934casi1239030qtj.683.2023.10.20.06.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 06:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fz0NQGU9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtpAN-0000Ok-UE; Fri, 20 Oct 2023 09:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAL-0000GD-VX
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtpAK-0005I2-5p
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 09:03:49 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51e28cac164so4011607a12.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697807026; x=1698411826; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zkM/85hWmZ9SV/FNcYSH0O2+Ai96FulzN3LwQBfEAtk=;
 b=fz0NQGU9471iYg4GO3VbOIPLGT9uobXl9GyUpEDQYX6fPwUXO9wWJx5rHb9iIZj2/a
 7t8L+KCAhofo0UmDlkanyNd6JhZxUM6ag+rrYfivzUpSwrPz4vF7jiCQMhPIhbmnMMc9
 lSlvHUkKPmQGt/1ditwzusqn363BvpA1aiKv1xH5ZUskJJ/DwBL474XZ4l5Qxj+Kk0qF
 a3/G4Em1s9p/s4A7Nd7MgWHyF+7xWJRsQ+RQyWJ9mbQwOaK4WScHBy30MKF1B7hFZos3
 YmKBcogPNcUJl7RZK8nns6di5Z5G0Jko2I1siSeevHn9suBhC4FsdsjWbzJgwI7y0P71
 5ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697807026; x=1698411826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zkM/85hWmZ9SV/FNcYSH0O2+Ai96FulzN3LwQBfEAtk=;
 b=jLXV8EXRwBmZx6zzTcY9ObxgTJN4TrXNXsghC4ywB+GwKE/lbendFwpOfA88bk6HWZ
 HvjmCSaZLZXy7UqIGCkYF+AQYItUOzO9N4c3hR5C+tBYqZvZKSZHuWORykKVoEx2V79f
 HZeBihPd99lbe1ZEEDAOTIYSQGSnXd7Nabw25leFwN+Urt1jwWBwC2R/KnEmMMhlcvCf
 JIo5W1PAIoevYJj1Jx+h+wC1FzaTjAVj6ARKQP2E9suDhacf/qbuA7x8K/Hbiihw+g6y
 ZYB+/XvIbYtuf2ZyO8VdTiog4mAPRX1BOUsudhI9B11U+A/eQyTsZlqrg7KIaTUCg1cl
 Bd1w==
X-Gm-Message-State: AOJu0YxWSXnB+B63S1uj+AqDy5Wd2zmZ0FyzhfGVdP98otBpQSg0eA2F
 3gu4KFvKYOAotMKQnRMd/XxY40k8wkbHR9wJQ0Y=
X-Received: by 2002:a17:907:868f:b0:9ad:e3fd:d46c with SMTP id
 qa15-20020a170907868f00b009ade3fdd46cmr4254879ejc.10.1697807025923; 
 Fri, 20 Oct 2023 06:03:45 -0700 (PDT)
Received: from m1x-phil.lan (tbo33-h01-176-171-212-97.dsl.sta.abo.bbox.fr.
 [176.171.212.97]) by smtp.gmail.com with ESMTPSA id
 lg15-20020a170906f88f00b009ae587ce135sm1452393ejb.223.2023.10.20.06.03.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Oct 2023 06:03:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/9] hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
Date: Fri, 20 Oct 2023 15:03:23 +0200
Message-ID: <20231020130331.50048-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
References: <20231020130331.50048-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: amlWAPanjiy6

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/pxa2xx_mmci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 9f7a880bac..4749e935d8 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -479,13 +479,8 @@ PXA2xxMMCIState *pxa2xx_mmci_init(MemoryRegion *sysmem,
                 qemu_irq irq, qemu_irq rx_dma, qemu_irq tx_dma)
 {
     DeviceState *dev;
-    SysBusDevice *sbd;
 
-    dev = qdev_new(TYPE_PXA2XX_MMCI);
-    sbd = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(sbd, &error_fatal);
-    sysbus_mmio_map(sbd, 0, base);
-    sysbus_connect_irq(sbd, 0, irq);
+    dev = sysbus_create_simple(TYPE_PXA2XX_MMCI, base, irq);
     qdev_connect_gpio_out_named(dev, "rx-dma", 0, rx_dma);
     qdev_connect_gpio_out_named(dev, "tx-dma", 0, tx_dma);
 
-- 
2.41.0

