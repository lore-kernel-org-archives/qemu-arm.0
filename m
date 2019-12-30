Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15283710lff;
        Mon, 30 Dec 2019 03:12:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwxOGXTm8QwaLcHKl4pbIU/SFyYcCDyXA4a1NpgKcdA9vBLmNWW1ENFHY/0VJhaOYZXQ5lC
X-Received: by 2002:a37:ad17:: with SMTP id f23mr53499381qkm.24.1577704360764;
        Mon, 30 Dec 2019 03:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577704360; cv=none;
        d=google.com; s=arc-20160816;
        b=0yj+AaXc9+Soth6Nh8zBjD3zAl9hI2unTgGulcfm9qy/RDSqseMMus1U0jSG9P8Lh/
         0I+pvVjiMLo0hFLWzZYfafT9EdVDn2Dk9G30hij45GdChopBAZazNiIYI/2KbqIG4ICx
         GHdRS0LGLyUwe8ZgvDuqL94rTvdvYdPZBkGzj5iRl8vJHdV6Znce+mSuW+8X6f6cQ5lS
         2KfwDts294xPTGTAJlKRP8BDRo2IGAEAmY+3U1LC6IU0+jWXyc3eNY2ciEn4dn/PjOHA
         ndbSZ5U+U/XlrNqqxurWXheZrqXH01wIi3jZl8wfOoOr1arnTx+8WzDcbVOl1vZqWZMv
         4X0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wn1QqcaJuZGKr4BaTRtaO2JGUDTV/7uIt6tHl4UtiBE=;
        b=jfMbm/Uo8DpWBtrEqW3IsCKh/HvsUaHjimhMsKH0CJQbe81q8ioZ7VLhZGXiJq4vcX
         3IPxuS+acB4IVRct+Ol+9Arm905H7TMi1BYS3weofyHx2ROyl3y0mwPAUpPq6YdwSYnW
         ajsWSHw3w62nFt2znEqBsXTo0ifyLWO8dwev+uluDac7dJU3eTZbsIkfL2q+gVO/E9ZP
         BrTFZ7OKwuiw9jbZjYNdOnPzX7Or26UACVVwFpT+4KRcuV+sWT4R4TXtJ7V8BoeQDCBm
         xN15UTXgQV8OxtAX3yyIrzJwVf4lDsJdG+n5M3ozBl//J7GhscNv93bGUMjdusPbfUPC
         srTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tDbjUcEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si18039012qvv.210.2019.12.30.03.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 03:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tDbjUcEJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilsyV-00013K-UG
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 06:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsw2-0005cr-JQ
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 06:10:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsw1-0003C4-Gb
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 06:10:06 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38122)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvz-00038s-3u; Mon, 30 Dec 2019 06:10:03 -0500
Received: by mail-wr1-x444.google.com with SMTP id y17so32358952wrh.5;
 Mon, 30 Dec 2019 03:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wn1QqcaJuZGKr4BaTRtaO2JGUDTV/7uIt6tHl4UtiBE=;
 b=tDbjUcEJPfbvi+A1CdqGydruCJPOHCjcNxNvU1LE9JA3rY00iS89ycaGKL8LGT4bLv
 yZSbPfKfu2ZybOjJ68Lptu6ezVmviW9f2JMB1PrfCLdkG2puzTtT6SQXru8tsTIZavl2
 Tp4pnc9LOlEsrs+p60d7P0EGdinFc16Y+Zs6R34cb809v1fWiSrr0LaCSN4bs3e5P9uV
 I3mytTUGaEymioEyAACN15hX5BYUtDHZRLzUnK0RaYXeDrR+RJmgNd+mQemyoE+0DdPZ
 E4VNrLZ47lS4BTCwpNz/RnOOXJ9nCISr35acj5ZzM1+o0H6stlYnzjFJwdY+nnm5BHmD
 zWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wn1QqcaJuZGKr4BaTRtaO2JGUDTV/7uIt6tHl4UtiBE=;
 b=tfNRhBU8/opht3mRpGSHjdTUg2haE0SXbqq4tvxOdP9ziazyGz9qHmVwk+Y4eaIHgZ
 aLMQaAQhFAlVg1SYodpQMzPMDk2bHS6pB7Aa/RmW0hcweizKKXzScqnuqCV1ZI+XJ4dU
 ae1uBxPpqY/PwkXNWidjUoNgmthcaUnX7Ho4a1mT4Y3rOVZo4ktSUuwW8LSf5/Rkj9/B
 9NaSJlqLMfY6BIX4BDrse680Rz95fGQfItGxkNIK8CNsAJLsOX+kOktLjYjX5gaSf5sa
 8R5P6/F8HE7nm7mhZWCYFUWkkvDfjc6OAqyUqfaNLOvxNECUMNyw/0rItZoCbmqYryMC
 l2lQ==
X-Gm-Message-State: APjAAAV+D0pDO3eZV7M9JvxfPscgqDqDbM9gvxrNdPYayckgy2Q8Mpix
 H75rc/D+SPnRwO1LsSdQjB665Bfi3Io=
X-Received: by 2002:a5d:4807:: with SMTP id l7mr67706884wrq.64.1577704201881; 
 Mon, 30 Dec 2019 03:10:01 -0800 (PST)
Received: from x1w.redhat.com ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id p15sm20442738wma.40.2019.12.30.03.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 03:10:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] hw/arm/allwinner-a10: Remove local qemu_irq variables
Date: Mon, 30 Dec 2019 12:09:52 +0100
Message-Id: <20191230110953.25496-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191230110953.25496-1-f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JAqjRwFHHboX

We won't reuse the CPU IRQ/FIQ variables. Simplify by calling
qdev_get_gpio_in() in place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/allwinner-a10.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 966fbd4a6e..1cde165611 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -55,7 +55,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
 {
     AwA10State *s = AW_A10(dev);
     SysBusDevice *sysbusdev;
-    qemu_irq fiq, irq;
     Error *err = NULL;
 
     object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
@@ -63,8 +62,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
-    irq = qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ);
-    fiq = qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ);
 
     object_property_set_bool(OBJECT(&s->intc), true, "realized", &err);
     if (err != NULL) {
@@ -73,8 +70,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     }
     sysbusdev = SYS_BUS_DEVICE(&s->intc);
     sysbus_mmio_map(sysbusdev, 0, AW_A10_PIC_REG_BASE);
-    sysbus_connect_irq(sysbusdev, 0, irq);
-    sysbus_connect_irq(sysbusdev, 1, fiq);
+    sysbus_connect_irq(sysbusdev, 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(sysbusdev, 1,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
     qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
 
     object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
-- 
2.21.0

