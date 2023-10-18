Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4630019ejc;
        Wed, 18 Oct 2023 06:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGgtGh4xSgwGRfMf8MofCpGPdHqfHF4VXe/nyp51X+y9Yp61LMhuqiiOP9JFxkbMBYNIfE
X-Received: by 2002:a05:620a:948e:b0:772:4706:99c0 with SMTP id sn14-20020a05620a948e00b00772470699c0mr4594701qkn.26.1697634989556;
        Wed, 18 Oct 2023 06:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634989; cv=none;
        d=google.com; s=arc-20160816;
        b=zUyCu9y1Vu9ROr88yTkfsE8qIp8fbPRlaGexw3wn4WXE7EqlUTyei2R8BIUMV5eGrl
         LnRpblVgFSB/wUTbK8sn6XphFf+TYo1pgeSh9Ybv3hlSYi1/fkEtFKgt04OZaiMk8SJZ
         wMDZSvaLzYJruEqoAToKEgHTpeqdxtQrJfbfXkudXN0SpFEbt7G2mB1JFDeG9UqzkGGn
         h2L5RynYbHw9sTK39xiftw8aqD/sE/xQTN3EIIIUVMj3upd9xNJbXL7vRgEKVZiyTz66
         MhFOgelXwDIYxg8/lsy4y5HJSpcP0JQ4DqgnuIsktv/q7lzyHujDHuVagxB8vZzzVQD+
         Kupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=G51hcCJdcVX7JxdlEx8NkccX/uOzxuF95lVb4blKU3Kz5s06GgLZpY3Lf9NelQScML
         QmwAsLFMX+fIoUltiQxZmCTSKVUAZX/DJD1tBP41+tdpB1PWHMZ86UugDqobEny44p1t
         g6SgXLOf1rbQWP+J8USHRffX86v8B1jnLHm5tThFZCkXVcUh9uulcL6/BxjAjYv6wbm9
         AFhqRYVbMT9EisywPi4R1DLnpVOn9yVCya0TY8BlB3BHRnK2ZixQexAPSVceE7sQjSY7
         L/yrnf5u7CLUsLI0EVpo4VY/0uHaE4qE3bDJ99wEddqVqDrLspTWjOqQL/fHC/BjZHPl
         2nxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rr63uc5f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a05620a444900b0076dabaa2929si2779706qkp.188.2023.10.18.06.16.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rr63uc5f;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6Mc-0007oe-Ac; Wed, 18 Oct 2023 09:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6M5-0007KT-VC
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:12:58 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6M4-0000mt-7S
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:12:57 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so407302766b.1
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 06:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634773; x=1698239573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
 b=Rr63uc5fQQU2B+Ih95WeWIDcUNdFoPgfNIxwcgQLvsFzFI3HAaCFoulhBojd10hOHt
 WPu9AbaRkTo36eV5xT2hSzwKANGZIEsbuksxEVKft8kB/l55oY7DpcN3+lZQKN+BWT1r
 ruqECkI0I/zV7Yii4jiOmJR2qSsgEo2JMbOA7f9/o2l2ccPLa34NPc9jWfXFHiBpCQaz
 OiKanezl+gZeVHIZYEbeNxmj0HOGzoGdfKwG1no6cig8pqA+N4KL22uJ7Es5z0MNG5wE
 7Fk6J0srEyl4ZNDbUYEKNbSmZcLxAeVS9Xq2Ejm08iggFACLjhosq/+V+PRC4u9mJKwP
 FpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634773; x=1698239573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kCYRI8Q1kvi4VpcB4GZtS6fXIL0c6XiuN6TOx6QUjpw=;
 b=tVv0ODvWJ3o0XXvb9mOLRJ6HfZjF0TkF+GGF/W/xazRTi3H60D3gVA6q+8U1Gys3EI
 4yl/uU0d5x2A/1D+6y26AdtA5gaQvwtmJMkGp6AzQqsUEYwnwl5BaNX//lMBvOsKjCWg
 IjEmYnJW4gtoewGI4mBVCwZHw/UV2+zOudNFKRC9xJL0N+f5tvP1ArhrpeziVtBiZLRm
 37+tLEtGq2mG8kVqgs8hA9T2gq5uld+elABIT5tj9L5FwiGBlayA+578lE8m47wPdYNe
 nndvYYu7sqjn/wr+qKsApywJSERWBIPoJGKEJFU7fqdfuLdivD93fs+YDu9M6CCkIaaj
 VNvQ==
X-Gm-Message-State: AOJu0Yz8IP3olaJJ1BDbVipug9M3xvpUTqiNxcptElkva2ldPNWi33PK
 nuJ/Jams+idMrr2udGT1kppg+aIh5ph1ebLLj0s=
X-Received: by 2002:a17:907:7f23:b0:9b2:982e:339a with SMTP id
 qf35-20020a1709077f2300b009b2982e339amr3668353ejc.22.1697634772894; 
 Wed, 18 Oct 2023 06:12:52 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 m15-20020a1709066d0f00b0099d804da2e9sm1663596ejr.225.2023.10.18.06.12.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] hw/pcmcia/pxa2xx: Inline pxa2xx_pcmcia_init()
Date: Wed, 18 Oct 2023 15:12:17 +0200
Message-ID: <20231018131220.84380-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4urH48uekL21

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/pxa.h |  2 --
 hw/arm/pxa2xx.c      | 12 ++++++++----
 hw/pcmcia/pxa2xx.c   |  6 ------
 3 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 54eb895e42..4c6caee113 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -100,8 +100,6 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
 #define TYPE_PXA2XX_PCMCIA "pxa2xx-pcmcia"
 OBJECT_DECLARE_SIMPLE_TYPE(PXA2xxPCMCIAState, PXA2XX_PCMCIA)
 
-PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
-                                      hwaddr base);
 int pxa2xx_pcmcia_attach(void *opaque, PCMCIACardState *card);
 int pxa2xx_pcmcia_detach(void *opaque);
 void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq);
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 07d5dd8691..601ddd8766 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -2205,8 +2205,10 @@ PXA2xxState *pxa270_init(unsigned int sdram_size, const char *cpu_type)
     sysbus_create_simple("sysbus-ohci", 0x4c000000,
                          qdev_get_gpio_in(s->pic, PXA2XX_PIC_USBH1));
 
-    s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
-    s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
+    s->pcmcia[0] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x20000000, NULL));
+    s->pcmcia[1] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x30000000, NULL));
 
     sysbus_create_simple(TYPE_PXA2XX_RTC, 0x40900000,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_RTCALARM));
@@ -2338,8 +2340,10 @@ PXA2xxState *pxa255_init(unsigned int sdram_size)
         s->ssp[i] = (SSIBus *)qdev_get_child_bus(dev, "ssi");
     }
 
-    s->pcmcia[0] = pxa2xx_pcmcia_init(address_space, 0x20000000);
-    s->pcmcia[1] = pxa2xx_pcmcia_init(address_space, 0x30000000);
+    s->pcmcia[0] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x20000000, NULL));
+    s->pcmcia[1] = PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA,
+                                                      0x30000000, NULL));
 
     sysbus_create_simple(TYPE_PXA2XX_RTC, 0x40900000,
                     qdev_get_gpio_in(s->pic, PXA2XX_PIC_RTCALARM));
diff --git a/hw/pcmcia/pxa2xx.c b/hw/pcmcia/pxa2xx.c
index a2ab96d749..e3111fdf1a 100644
--- a/hw/pcmcia/pxa2xx.c
+++ b/hw/pcmcia/pxa2xx.c
@@ -138,12 +138,6 @@ static void pxa2xx_pcmcia_set_irq(void *opaque, int line, int level)
     qemu_set_irq(s->irq, level);
 }
 
-PXA2xxPCMCIAState *pxa2xx_pcmcia_init(MemoryRegion *sysmem,
-                                      hwaddr base)
-{
-    return PXA2XX_PCMCIA(sysbus_create_simple(TYPE_PXA2XX_PCMCIA, base, NULL));
-}
-
 static void pxa2xx_pcmcia_initfn(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-- 
2.41.0

