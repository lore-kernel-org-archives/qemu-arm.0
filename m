Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5176255gdb;
        Wed, 14 Sep 2022 05:24:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4kkdJBeJc/IjOvAWCPwc2veqecRlN2J97XqoRnvvcYTlbEZWnFt2Yg/OH8vXzCydY3OmpW
X-Received: by 2002:ad4:596c:0:b0:4ac:99bb:5820 with SMTP id eq12-20020ad4596c000000b004ac99bb5820mr17511379qvb.23.1663158299138;
        Wed, 14 Sep 2022 05:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663158299; cv=none;
        d=google.com; s=arc-20160816;
        b=BxV7TwS3a8q4Swo/Sz0RjhMur2ZYWr0DvWMBKuWP3sj897vR4qVsiVJyqvdqek3Yyu
         rcG+D0iHfmGfNArI22Ux6hHRvhC+4jS4YSjTVKmIh8QKhUaGIoXaXMCIDWR0IDDv5eFf
         BjvE14iDAqWcKrs2yLqfN0VVIUUaDMAOa91ATq/sVNU29WXvpXZJU+b3E6Npc5dh3c1j
         ZLlbb5h6mrFO3PrdDMAVaG7aedJBFKNEWCiMAQFMRzts2H51duITWMnBcpUvVNg8FOav
         YBVc3lntbiPIE41hH6YXviIF4d5k7sodAPuH8Vtdk2B4R0m/D4BOe0mpqOdLfY3e8Rin
         nb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=//e/ZN3ckKFpSJhex3jLrOtW1Ky/TB8tcKb8eFkaCDI=;
        b=DmstlWQUtamhILmgrCII++JbMtrIwkZkOR7yj78Py2x/uevw7Jdl5ytDsGQ2qTacR8
         c0UwP5FZG7dsiSWdNpVIo3WERDFqpKVtmhbRVX6n9HrH7nfACQsKWnmlG93RwXJ0uciF
         AkKrHi4S6+M1rw4NnXFSWf+pg4lCtSGlsPCpElmRVzhNIXetI8ikRAljHpymps/0gY3U
         vkzQQsPmk935AYLkfTpo6tWty5TI57dKRNjAxbW1Mq3xgzTyigDlPM5tawIRx8UJL16Y
         tmA8wuaMzzdb9QW0XGVt2HdjW4q8I4LFsKwGOVxJLUrhsBcN5ChfAjTuYEA08VYKBxUH
         S7AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcXudYxf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a05620a44d100b006ce403a2505si1361927qkp.673.2022.09.14.05.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fcXudYxf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRRq-0005wA-MT
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-00006E-7O
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:34 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwJ-0008VG-AJ
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:32 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 r66-20020a1c4445000000b003b494ffc00bso2821764wma.0
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=//e/ZN3ckKFpSJhex3jLrOtW1Ky/TB8tcKb8eFkaCDI=;
 b=fcXudYxfvCIg1xlg+rJyFOQklZezlXCOCfKu4sTOO9j2uxBpi9MdZxRD8bHWd5boBo
 1JAq/CsbKLlOy/Ri657S75eX1ClCVNU1fJ7SI2dfUtqahjyCBd/wAyRJmLesvef9oO/8
 INAeKrqSwLEcYIkwiV+nKO3ch19trhBN0ai/dc5DTaGBtgFkr7mmjUAg2GaNyt2nd7cH
 uxVC9lCh6w2AJTJk/W2x2yvRRLuVG94RcmYo6Tx03n+pbdpw1mDyPv/xYXcngAbsxSGR
 yitPlaWCQGlw0cPVDIFXHUt4utu+7W3eWuhSPVJMhQHi9VKhXLUEp21n1e0nXiDsICv/
 cnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=//e/ZN3ckKFpSJhex3jLrOtW1Ky/TB8tcKb8eFkaCDI=;
 b=rESI6BZcI22qQmHvWNbIFkN5tshDauvJotYsoDsaXX/sZT/6V+mPBk2kUMGkg0EuC0
 CuSGMytv7RivZII+nOrEfhiQu2Vduej/o16cNVdSOjXaxJNYZKis9mKZ4kioaVdK6olg
 2GphGzcttfqmhcdmxAVfVfZlEX9JbwmLf1nQ5C7rQHrYNnYx9rTO/bTJ9FyzcMJRyOxX
 JnRaE0UShcV7DhJkhW361mnSoLY/Sz7nAXJZj/S/A4xA5FE7TFlGjO+ENbrnHry0qmUE
 qvpOS8asViXr80yYPC3aN4W4ZpTOoJ5Ldl106z1c5zV/xfibITw6yVCjKkTNLXtHoVNk
 1wtQ==
X-Gm-Message-State: ACgBeo2apEUApbJIRHdvgSgUqhQKeNWvHEqCrUpjNl98Yq/ENxGZIqhd
 vfCZSKWI6UnjCoXSlK0rMTjR75BgKhlT/izN
X-Received: by 2002:a1c:f009:0:b0:3b4:9398:49c9 with SMTP id
 a9-20020a1cf009000000b003b4939849c9mr2823677wmb.174.1663156341610; 
 Wed, 14 Sep 2022 04:52:21 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Enrik Berkhan <Enrik.Berkhan@inka.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/20] hw/arm/bcm2835_property: Add support for
 RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS
Date: Wed, 14 Sep 2022 12:51:59 +0100
Message-Id: <20220914115217.117532-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WU+2ednMGqiF

From: Enrik Berkhan <Enrik.Berkhan@inka.de>

In more recent Raspbian OS Linux kernels, the fb driver gives up
immediately if RPI_FIRMWARE_FRAMEBUFFER_GET_NUM_DISPLAYS fails or no
displays are reported.

This change simply always reports one display. It makes bcm2835_fb work
again with these more recent kernels.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Message-Id: <20220812143519.59134-1-Enrik.Berkhan@inka.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/bcm2835_property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index e94e951057..890ae7bae5 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -270,6 +270,10 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             stl_le_phys(&s->dma_as, value + 12, 0);
             resplen = 4;
             break;
+        case 0x00040013: /* Get number of displays */
+            stl_le_phys(&s->dma_as, value + 12, 1);
+            resplen = 4;
+            break;
 
         case 0x00060001: /* Get DMA channels */
             /* channels 2-5 */
-- 
2.34.1

