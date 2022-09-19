Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1285958ejy;
        Mon, 19 Sep 2022 10:29:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7p4I7etr+kW6AfC2PjqJGCnJpe7XWKx11AMadnNyXoDVVHPpvef6XxkyJHo4VtbvnAYxPx
X-Received: by 2002:a05:622a:14a:b0:35c:c06a:25d1 with SMTP id v10-20020a05622a014a00b0035cc06a25d1mr15506643qtw.254.1663608588684;
        Mon, 19 Sep 2022 10:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663608588; cv=none;
        d=google.com; s=arc-20160816;
        b=Xv7ywp2bt9+q0Vqgy3dbsJLkO8GfePbu6/uHbxnbBoKGO22ha/9D1hQwqxOFS05rOz
         lRkQcckQ/jIbc+XnRFx3EDALU6Ly+zuyQuuc3bpE+mXl47Oa0rnR+T7epAq/leebOAsz
         MuWM/z5wd4ciO2ZxiwQEZUXcp6WMUV48kGe2n31igoTvjdNcYUqVTmJXhkdlX6vAaUda
         Gy7uSEhPc/X3oirI2oJ6ot8pDes56uiy3W65Xkwj+Xk4JPCAqReqWLMa+O0EYUsjhD7U
         S3o2Gnae/gGzPKfUFerrB3782mRzA3CqYr/6mFJTjiw4FZrkq52yfr5KlDmvFsIdcO9X
         iUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9UzldcR0b1o/X+kC4vXAaVIzBakXO1OmfFUhrcDp5d4=;
        b=NUGpHutmpsgHleniujRuvUEJbaHfKCb0kEu1wG5sUGLZjtYFXlnmmeh3yFjmfjLRC4
         dgVEaiLbV7fvUgvw3jLV6c1F+gVrhKTQ3bkpJYQrCGDo0oAuYnHs0KiFzjR3aqe475KO
         HqIZboOcKbr4gpYNk7i0FQv1mRw1hKeoN4RqRg41B73tU3N69pJjkLVUQkDHu/1vYcg4
         teG/sxhtRu3zVQvOO3fsZstnmPnqbGvJwMPGQYBU1pAEeBbO8zSwgS+TtP7VsI1Ivjyd
         csnNzFCqjUsW+9jH9u6obKZTaQEkA8CgaznH/ZI0GE029Cg5pRf77f18np8UK+cemKxF
         pofQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=CnyLZpYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020ac84581000000b0033fdf034a0asi9513176qtn.765.2022.09.19.10.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Sep 2022 10:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=CnyLZpYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oaKaa-0004v5-21
	for alex.bennee@linaro.org; Mon, 19 Sep 2022 13:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSp-0005aa-La
 for qemu-arm@nongnu.org; Mon, 19 Sep 2022 13:21:47 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSo-0000Pt-2j
 for qemu-arm@nongnu.org; Mon, 19 Sep 2022 13:21:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w2so311769pfb.0
 for <qemu-arm@nongnu.org>; Mon, 19 Sep 2022 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9UzldcR0b1o/X+kC4vXAaVIzBakXO1OmfFUhrcDp5d4=;
 b=CnyLZpYXR/q+z6MF4m8Z1wUhwPQNur+hHNqN3Pij/IGwYIIklbcIf6k+IG2IVo0BWd
 FMmcvI1qfP+Zgb3zBC6nBuNtRUaVFmIQXYC786TT0SJ7u5T/8sDoIhrpws+yUL5N/G1d
 jiYcrwVZ1GwZCJjwzLDoG1BFrPQGCyVC97eV+DLLcAV3k7IoXT6XCY/yp7UEe4nOU/KC
 I297iSt54KeV5m+sRFilXjdlXEjk4sw9WUdTQ8ywivhKLWSscrzNBp6xI7p5zYHa7RGe
 wjuRWdmVw3BSh/bekb+gHPeI/9XdqxD6KXwij6y9VDMi2GEGq9VZ0irEFYpK+7hXHOKA
 pKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9UzldcR0b1o/X+kC4vXAaVIzBakXO1OmfFUhrcDp5d4=;
 b=QouFcljk0mBlXym0j+jbnH3GwKrm0t/Xv6UUimB5BSGX7KzWbiGTVQ4xd7NAwBWQ64
 AHEKjfkYOpfYH7OzizvNHdkH8KdqyCu6E7kzr2JJ74/f9MdbVMOqnTBRR4e7AUPx/i79
 UbC1ebz7KhoDdn8m4+cKYC8D0uuBlH1oedaZYuPXYzTIHBs0kxtY8nwLLN/4S/w6N0kV
 nzIOr6jJPHtFUThRvxYREMHcXa1q9LgAQ4gyAl5LhwQ9KZhuleJPsUJBB49Zor6H60vl
 oS37f62eZ0AEzROuAEurQIKpLGuiDGxKwngH/aMifvVWgX9TVm7zl6iQKBmMI6Q5PmyJ
 75Rg==
X-Gm-Message-State: ACrzQf26RiOBMEPN2JyIpC35xk6vYzn7IgVFZLrD4KPWxGYqO+bFFV1J
 KKJjhCWiJrSen6eEX+6UTYhvd5Okc9EoC0PpNCI=
X-Received: by 2002:a65:6e9a:0:b0:435:6009:4b62 with SMTP id
 bm26-20020a656e9a000000b0043560094b62mr16662675pgb.596.1663608104658; 
 Mon, 19 Sep 2022 10:21:44 -0700 (PDT)
Received: from localhost ([49.7.199.210]) by smtp.gmail.com with ESMTPSA id
 q6-20020aa79826000000b0053e99f2bf16sm20580111pfl.78.2022.09.19.10.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:21:44 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 1/3] hw/gpio/aspeed_gpio: Add gpios in/out init
Date: Tue, 20 Sep 2022 01:21:10 +0800
Message-Id: <20220919172112.2706026-2-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:32 -0400
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
X-TUID: DWA1p+M569lD

Add gpios in/out init for aspeed gpio to add the ability to connect
to other gpio devices.

Based the qdev-core.h comments, If you want to connect a GPIO to other
devices, you need to call qdev_init_gpio_in() or qdev_init_gpio_out().

```
For input gpios:
 *
 * Outbound GPIO lines can be connected to any qemu_irq, but the common
 * case is connecting them to another device's inbound GPIO line, using
 * the qemu_irq returned by qdev_get_gpio_in() or qdev_get_gpio_in_named().

For output gpios:
 * This function is intended to be used by board code or SoC "container"
 * device models to wire up the GPIO lines; usually the return value
 * will be passed to qdev_connect_gpio_out() or a similar function to
 * connect another device's output GPIO line to this input.
```

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 hw/gpio/aspeed_gpio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index e99c4c6329..616ec8db52 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1018,6 +1018,17 @@ static void aspeed_gpio_reset(DeviceState *dev)
     memset(s->sets, 0, sizeof(s->sets));
 }
 
+static void aspeed_gpio_set(void *opaque, int line, int new_state)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    uint32_t set_idx, pin;
+
+    set_idx = line / ASPEED_GPIOS_PER_SET;
+    pin = line % ASPEED_GPIOS_PER_SET;
+
+    aspeed_gpio_set_pin_level(s, set_idx, pin, new_state);
+}
+
 static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
 {
     AspeedGPIOState *s = ASPEED_GPIO(dev);
@@ -1042,6 +1053,12 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
             TYPE_ASPEED_GPIO, 0x800);
 
+    /* TODO: Maybe could in named, not anonymous is better */
+    qdev_init_gpio_out(dev, &s->gpios[0][0],
+                       ASPEED_GPIO_MAX_NR_SETS * ASPEED_GPIOS_PER_SET);
+    qdev_init_gpio_in(dev, aspeed_gpio_set,
+                      ASPEED_GPIO_MAX_NR_SETS * ASPEED_GPIOS_PER_SET);
+
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-- 
2.25.1

