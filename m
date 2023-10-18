Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4627679ejc;
        Wed, 18 Oct 2023 06:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoZ+1vtxaUqVexGKENj0h8rqj1vnyFLdcgbsw6x2qu5k3Q5RZ+ObSDxF4uCeS+2TsgrTZU
X-Received: by 2002:a05:620a:2892:b0:775:446b:860c with SMTP id j18-20020a05620a289200b00775446b860cmr5801428qkp.70.1697634809591;
        Wed, 18 Oct 2023 06:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697634809; cv=none;
        d=google.com; s=arc-20160816;
        b=PNqfZhF/IA1dpmN5vep5+9glxiCv2AYFvo6TGjQnsZUYIIVKYjZZF5JRA7Ung7Zqcj
         uCNwiPVT60Y+gWXQhNKy365Gy8j/TEDOG+cRnvd01ZY7wsk2125OAWfKP/crOV7KK0PB
         48LwwVDDQnIrAaGp2fyw/InMGUbhI4rwr90XrzLwMumnujvIg8X0ODK44tBxVvPsOyt+
         dU5f2wtQREB32hQydu6DXnE45nawMtW2Lu/eb9UMLFuUuUuDWL+3I2bAts7Z8ScWpmcq
         Euq3LkhZBqnM+ffDHNIcX59VMepUQXtE/nE4Uek28Fqv8BKXy2RsN/YLqQLxxvL5pyDt
         tRJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
        fh=Uq4CCH4qgIScoA1ZlzK6h1LD8Rw6xac8JtYTs6G5zlc=;
        b=aQ1WSYxrtHJ5R7MznuufcDTgj9Xce1A4eAp6SW/zxMaBX+klgsw+l50IACvk+LCtQ6
         6Unjym9O4yG7a6SxEWGrjt5jwM7F6kqkFcfP2SbshYSCPKHOSN+L3OY/pdtkREvn1Cjr
         mVA+st7N3XFq64TdTCidYtRyr4sweG4jFupEnI5j/U2agA8ukV8HVxlBGSWEnJmCnXRK
         N2AquLpc5r5bcFJYtI/e+7ooLyWAlUShlsZ3tHE3s8a/39iZKXdBdhvLHS7AuRiPNz+n
         lmkKCX8pXHaPH5o6rKOVGZRmLp8oxz4abzWVO4gVasfqidLv/bZgkvqEA/89y6YCs3h9
         FD1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwLHPQxc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qs8-20020a05620a394800b0077891c3f481si1221834qkn.780.2023.10.18.06.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nwLHPQxc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6MR-0007ds-JI; Wed, 18 Oct 2023 09:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Lq-00075p-AF
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:12:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qt6Lk-0000fM-WB
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:12:42 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so1176723666b.1
 for <qemu-devel@nongnu.org>; Wed, 18 Oct 2023 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697634755; x=1698239555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
 b=nwLHPQxcxrq0eIiAVJQcQdEJTcBjisfsAsYuM+ZewX85WmC0wdX/3bzAZGTLo9mucG
 NJzDa41pPtkflueCbvcHh/xzOWCYid6oIKuCUmWH+fxV0NtHuKn/YKprso7D6zs81pIB
 mjh4WE1vRoXLdxysBEm34RaNrVTlzL9bRtQ3IHVLlsWIW5vkuUQviNZgdTrE0nWDQN+8
 vmqZYGz7TyKrmgePGS/v+0Co5AcgBdv1dliA7/Ld640ztZ/IMYExicsQD5NvdUNYKhAx
 voc0Jdz/TTJcF/jpFcX3JOFAtzkw/5LMMsFQM3JB1Bb7YAAe/R/B2HX8PdEj2+dXsoH0
 cFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697634755; x=1698239555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJfJ06RDafLRLEOQTU58KKvhb0KtBRhLr9Bft9JesEY=;
 b=kERiIwSSaDxCeKJUSQbEHGwq8p4oHDfnRn5vBinaFNglRV7VICXh4owyBzVKv8sH9j
 +ajXu6BnBVOgchg/RCQqOHBJUZmRpmYgUaVkDMlbSIrjb0AKwDpFllr86AneQWToGjHt
 GDA/e0aZ5d3GXzyIi4O6sezW+YeXfOvl1yqdA30dMjzx0TSwYTQz6HvAFmi3iPVT3dZD
 heNxdFoG+2qdvGWyXiioTz2wVtH5LgbMYc0/yd8Mg1J6nDrnoykObGKzwKDJraE/Jzbv
 tkW3LclF1pDs+md10vLbxKr250X01YOUxgCdh+P+RsuMDn/+m5jhujN5O0Jya3tDDuJt
 Omkg==
X-Gm-Message-State: AOJu0Yxdb3EVJ2r+ughy1xv4UVBYif6UJCqd6id1AWMK3ftolj6FG65c
 Xs5tCGNLdfbS1dNUyAvbr18hUbGC+pPmaPlGipo=
X-Received: by 2002:a17:906:fe4b:b0:9ae:6388:e09b with SMTP id
 wz11-20020a170906fe4b00b009ae6388e09bmr3768847ejb.40.1697634754942; 
 Wed, 18 Oct 2023 06:12:34 -0700 (PDT)
Received: from m1x-phil.lan (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr.
 [176.171.218.149]) by smtp.gmail.com with ESMTPSA id
 og49-20020a1709071df100b009c657110cf2sm1664374ejc.99.2023.10.18.06.12.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Oct 2023 06:12:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/sd/pxa2xx: Do not open-code sysbus_create_simple()
Date: Wed, 18 Oct 2023 15:12:14 +0200
Message-ID: <20231018131220.84380-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018131220.84380-1-philmd@linaro.org>
References: <20231018131220.84380-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: BQ+Pz5DD7xTm

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

