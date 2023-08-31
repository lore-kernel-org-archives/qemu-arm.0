Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp247265ejc;
        Thu, 31 Aug 2023 15:58:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDm1yYwFRhU4EU0BZhvqtHjIvpixnZdxEK0iqiZ7CAEabK3qrwGufvGR4n0QWzIMQ7N5pd
X-Received: by 2002:a05:620a:4eb:b0:76c:bc24:7e38 with SMTP id b11-20020a05620a04eb00b0076cbc247e38mr759230qkh.35.1693522724624;
        Thu, 31 Aug 2023 15:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522724; cv=none;
        d=google.com; s=arc-20160816;
        b=U2TUIbV3EwpM8srWf31L4yk+l2vb9g7NCAk+JaqWgV0nLH4wLUTGJ9RCJJ3ATGfhY7
         4ae4AmrXXi3iQcEOgwSzHx2Acbn0/mtRwhhg+qCqNsw/DBLheuqAv1NWGa8DwUP0Vxmq
         yJsJgWnF4ZtMLnWhl5TP6Vw36JL6LVVIHj9weoMb03ZodJ5o4ZUSbWzLV1yy/mffsDyY
         zI7I2rtnmyPooiGPfnCQvBsTW5h46GLmtbou0jruxdDk+lO7CAHQW4tzbuvhCmjA+2HK
         VbCCKQcxwGHAv9ikKDMd+YfQPNc4qR1MmJubcKccGGNbqj5ACcuSyZ9w2qoD0xggKPN5
         X3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C//OKonAhBTdAA31WeZt4HEKfoMaq1ExT5IohWC+GEE=;
        fh=2dzFdWmoFMcRjG6X94z+TNmTpRmzCgbzYz+l0MFcCao=;
        b=R9fvgzAc9MjQlTPqYsLSPFb4GU+h7baRZY9+2fSvdw2yxfU8AvYCcHg2ziCP1kUkNg
         gTlfMa50IhbBnbPPziztO5YCDueB0J+X4LS2fCOWX8IRqxFuYgHuDSer42FP+OlXwRra
         9UZ8JL4RJqRIlDayrGsf3fNO4cQQrz0D7KrFTrBflttCOVFYN/BAkpyLGZfOaBWuvSE0
         b/U2WAJ4C2GTeFeXh0bN2pXe8wx6u1Z/qLI8KmCDxpYA5+EWXonYAzXYZOSipe8UCInK
         P58Qkhz2+/qmrIZr9HYXA4KZ2FbF1cE4NQqSyacZwb2uCfAJL1xVuQrjRzHwx8Exkv2o
         yc/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZycqYeTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ea9-20020a05620a488900b00767d6e06822si1597073qkb.40.2023.08.31.15.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZycqYeTq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqaz-0004IE-Ii; Thu, 31 Aug 2023 18:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqat-00044R-Sv
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:58 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqar-00030W-Lr
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:56:55 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31aeee69de0so1111340f8f.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522612; x=1694127412; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C//OKonAhBTdAA31WeZt4HEKfoMaq1ExT5IohWC+GEE=;
 b=ZycqYeTqToEPoiQHOVNKnceVyOBEVaynFCechXy+p2eraxH3cKL91PfxRb4CABXGA3
 /mTjWwghNxCk7Bi5GJAwvuoOcSUJu+3nQAvogD1KUdjEFL5FimMTHVpEBftMjyE8c/Um
 q/MZ1w+x5f7NNmjb/V/klkYgRJ3LJerJX+7ysJ27Nyph9PTRv5kt3DcA2nnYVc9lSOAK
 lgqpCDM4PYDFZQjQvAOj9LgIIyOqZCp2F6xNAuKo5BnkEA4F77Jk0gPxgBQI+7VD72gy
 j7SqZYK1++1t75rTZTrptC3QcoQE4xPERgxy4a+tHsFaytbQTtHIQONHBy+zs/m1/0rA
 B1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522612; x=1694127412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C//OKonAhBTdAA31WeZt4HEKfoMaq1ExT5IohWC+GEE=;
 b=O69VFLs/kHGnP5s6RRD5xUoPsfjZryxB/CkNgugwqoqGJkq3qVRHiqxhRE8xMofFKl
 nLRV6SZH+lxPfVAZu4Ynf/ewqyYeyiaBKirNNja3RoKyUMWLIg+t+ElZK9quOsoyITUU
 g+JHqiQDD8O/oHpOg9BJ+h+x/m/ZTTpE8wtCYD7KsdOSv/wDzJ1ZdsSZE0gQO4IFswdV
 /DEOrwHJ6YmqBr6bhs6Mm1vbg9mByF9RD/veZLLe4cPLn8CJsanBomIL03vvYhQLU6+V
 hj6OLG69CSIw7j1fbaGJs+1Zhzf8ah7oiwXdRByfROZ7wntw2FPQ2ciu2Wd3yK9d0sO4
 LuDw==
X-Gm-Message-State: AOJu0YwY6VYylIaPEqKtgWP9yMI6F7Y5pYLRAWeAHA9sZjXi4RkD0IJl
 3pxgajgn4BRF5ecoxCkDBZjYp27WR8ncgbkAh8o=
X-Received: by 2002:a5d:4388:0:b0:31a:d6cf:7709 with SMTP id
 i8-20020a5d4388000000b0031ad6cf7709mr718311wrq.22.1693522612215; 
 Thu, 31 Aug 2023 15:56:52 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 d3-20020aa7d5c3000000b005232ea6a330sm1345355eds.2.2023.08.31.15.56.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:56:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>
Subject: [PATCH 07/11] hw/arm/aspeed: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:02 +0200
Message-ID: <20230831225607.30829-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6665z14diRtl

Fix:

  hw/arm/aspeed_ast2600.c:391:18: error: declaration shadows a local variable [-Werror,-Wshadow]
        qemu_irq irq = aspeed_soc_get_irq(s, ASPEED_DEV_TIMER1 + i);
                 ^
  hw/arm/aspeed_ast2600.c:283:14: note: previous declaration is here
    qemu_irq irq;
             ^
  hw/arm/aspeed_ast2600.c:416:18: error: declaration shadows a local variable [-Werror,-Wshadow]
        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
                 ^
  hw/arm/aspeed_ast2600.c:283:14: note: previous declaration is here
    qemu_irq irq;
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a8b3a8065a..f54063445d 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -280,7 +280,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
-    qemu_irq irq;
     g_autofree char *sram_name = NULL;
 
     /* Default boot region (SPI memory or ROMs) */
@@ -339,6 +338,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
         DeviceState  *d   = DEVICE(&s->cpu[i]);
+        qemu_irq irq;
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
-- 
2.41.0

