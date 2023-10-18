Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4629828ejc;
        Wed, 18 Oct 2023 06:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX+fhvaCzN5VuT2B+c1owsBnKIj7+Xsy26qzyA/jLORfhHfLz/Mt035jQJI4LUt/U1Yii9
X-Received: by 2002:ac8:5842:0:b0:418:11ab:1c00 with SMTP id h2-20020ac85842000000b0041811ab1c00mr5883568qth.49.1697634976386;
        Wed, 18 Oct 2023 06:16:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634976; cv=none;
        d=google.com; s=arc-20160816;
        b=x+JLXA8zsEHWiXY/voTcF6/RxXdEWMKFr0N3lZE2SWRY+YIyMk/2ZgXmCihYulAUHW
         QxcJCEIUkr3yp0Zt55N0V33cjm/TLAyRdoyyOBrhZFgbnUkY7o69P0J60SLM9HIdR8DX
         V9hckAsH9/+0eUqjC/w/kzZ3TNdnSHge9CtxyD7fdyXPmCxDZjQAZSXEy7tSKAzjYk6V
         8bD5alvjMg1/VBV3We9CUGJXEyZXMtI2GKGEUJjTqCeKjlAtWyC2WAGW3DnDHH+B3QjH
         /q4mELbsEtcCwe60YTNNRsI65FxFhY5ctsz7Q620+UsOto5wfZTYHhE0JlSKcyysZcAv
         8r7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=0d3++orOTAmIajYD/Z6LLKaUVNAnulr0sJORY4+tFVoIqZe9OAnM14hvuwzccY/Zk0
         Pb+9HdbZcE30nnte66RocQT55b8XLIFRI9ZI4J3/cnRWLEeZpQR1UAjSAMnwG4dtLmvZ
         rWkyzMpl4naMO8Q90t1rssxD/LNkkiI/mF1uPpj1Ix5d2e+uM4UIalRBMeB7yn4nUb6E
         MSlWakDnmuvMPM6AE9wRjyiOo5zp23jYAU7yYZI63RwuB01IndfGMJPZhzP0VB7+4iIj
         mL92mVquWdXx9zY7ZJ6154c8I28yeCrxlvCj63Qo23PWUAgGWJCtIdSyYlug3/KYfJop
         fN/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kh8udEtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8-20020ac85cc8000000b0041957764bd3si2757806qta.734.2023.10.18.06.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:16:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kh8udEtt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6MH-0007W1-T8; Wed, 18 Oct 2023 09:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Lu-00077J-Ox
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:48 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Ls-0000iV-Sm
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:12:46 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso1108975266b.1
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634760; x=1698239560; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
 b=Kh8udEtt+dWC2Gmh54JzfmUZD7PGqUegm5Xw+jEe4HwJ23FSD2UiIhqUONX12uKVCc
 IWSO1zckDCSXF6ARHGaRkoNIDejbkBJQgPZeFHPpIGQEbDd9DmAdlwSE9xYgymBGJHdw
 NeTIEgN3xC/PyzdZuV4qh4ZAVl45FrEtMDLln0Iou2ZOhXHWJLZCC9PB1lYfE/rwp8cO
 eODPn2cp9i5/9IVae0uMZFt7Q/nZL9v7JsSE1tD4dbo1ctL0vj6/PG/uHIwkICAYex+H
 2OBVY9JV7t3l5Lx8uzOvxWny2HxYFew0cvuCxNW8jpprTBjeE729PllxDnn13N6Xn5as
 aV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634760; x=1698239560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3Wrm2+hEgcQGJPeHM5sv3LDR90OXcyWyLu0fpUZ2rw=;
 b=fgNtUF7WkuEAs5L5Y9KVinDu5j7abHvZC84+J+9B8ndjgx/uSGZMNQohbZigk0kwvt
 6puAcR2lA34vsxGNJeuG47tBk5hlwntU7eNXar7JKmAAFbHR7jx6u0M5yYR2Rd/qpDyE
 ZaJpzmJGtVv9iz0COj/BNI+LUm9Yk4eRODPlMu8cfFtQCuDPIOpY2JaOY0JAkuhUujMd
 z8mmlFPp4HvPoATI4k2cbCEMazMNGvgBWeZ96xL7BmqpEYVLbMW+W1UUBSKnsQqgnMie
 CYp9twEbgQE2HyS7hs+GdsisqQe5qy+1c3HtGX7Cq6Jqm/7ejfoijWiikuvwq6SSYfyB
 dwWg==
X-Gm-Message-State: AOJu0YxSpIRAxDLv0G31DGo87I17I6mc3tmJ2/gJji0bzL4Up55B3fH7
 p27H0+oxngY9luLtT8UBb32T5g==
X-Received: by 2002:a17:907:97c3:b0:9c5:8a6b:29e with SMTP id
 js3-20020a17090797c300b009c58a6b029emr4246757ejc.13.1697634760760; 
 Wed, 18 Oct 2023 06:12:40 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 gz8-20020a170906f2c800b009bd9ac83a9fsm1639471ejb.152.2023.10.18.06.12.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/8] hw/pcmcia/pxa2xx: Realize sysbus device before accessing
 it
Date: Wed, 18 Oct 2023 15:12:15 +0200
Message-ID: <20231018131220.84380-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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
X-TUID: dprCasNk8tif

sysbus_mmio_map() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pcmcia/pxa2xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index fcca7e571b..e7264feb45 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -142,15 +142,12 @@ PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
                                       hwaddr base)
 {
     DeviceState *dev;
-    PXA2xxPCMCIAState *s;
 
     dev = qdev_new(TYPE_PXA2XX_PCMCIA);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    s = PXA2XX_PCMCIA(dev);
-
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
 
-    return s;
+    return PXA2XX_PCMCIA(dev);
 }
 
 static void pxa2xx_pcmcia_initfn(Object *obj)
-- 
2.41.0

