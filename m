Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2075051ejy;
        Tue, 20 Sep 2022 15:41:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Is+qg9G7l6g0i0RDL1ajNo0Tsu9vUJaVMWiTcCQ3yb/x/SVsSOoQ9eUsPAM3DQOe4CBJg
X-Received: by 2002:a05:6214:29e1:b0:4ad:5852:987 with SMTP id jv1-20020a05621429e100b004ad58520987mr5283730qvb.103.1663713709547;
        Tue, 20 Sep 2022 15:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663713709; cv=none;
        d=google.com; s=arc-20160816;
        b=UDLZ1UANpjXsDA5+PtrRkxoG8fvu/kNOl7LEAR27A1/784Yma7YZGJywkuI7cpC66L
         47fmIhgQQThKKXKXy86F84DaiFHa63MDiPDxbZidAeEwGBsXvnznfMnJCpYpR8ro2kMZ
         mjZCigPZYbCj5uxT9hjk2+GEflY0PjKUp3ZRbDem2NKChtKzrcm5D7Qc+rd/GCkFHBJO
         eofTU6EuGuFUUb+zEMvOHyB3C9h4nCQ2FoVHGkUXwgPiQdA4nPmVflR7YyRubHJM7DyA
         AnT0mOrabXdJE5cv/i5jX/1B4cTvDxqnQ8cu4vndbmK1O0k6f3kKndtKLtEbJiO0U44p
         +gWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qlTkrqVb2aMkLpsUHrMoW58Kky3kHTKxI6M8gj2V1zA=;
        b=zet1I97LXERaUVICs+uxvU/WNjZm5w/7ggvxIUdAU7X9DqNP8tQj2I0KopGIKW6m8H
         L8ru32TrKTUq6SOrE36JaxCAJicQEUXxCRAi9bUFPys2YN0b60NGw5b1tRXm8ToVK2Uq
         QJjx253aDyJDf1kW/QlCy6CoM64fgZ+mT/8wAi6OG0oxssK/kXGC1o3N+XoF45u98dxQ
         Uuizm9CX9U49Vhlm1x9694V9kVlbd4YzXa78EZ9SXucsfk4BW9aeId3PU6IY/BO5ky5X
         XFzEMH6TYHEO/h541FL1CYAMK1qA6SYlX2yDXPontzsvV9lZ571vMk+Y8g0m//w7ubUf
         dx1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=LBX0XO9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020ac841c1000000b00357173148b8si450327qtm.478.2022.09.20.15.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 15:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bytedance-com.20210112.gappssmtp.com header.s=20210112 header.b=LBX0XO9y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bytedance.com
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oalw5-0005UR-25
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 18:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGY-0004RT-3t
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 14:46:51 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGU-0007Qs-Dt
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 14:46:41 -0400
Received: by mail-pj1-x1035.google.com with SMTP id rt12so1559504pjb.1
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 11:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qlTkrqVb2aMkLpsUHrMoW58Kky3kHTKxI6M8gj2V1zA=;
 b=LBX0XO9yQRjLND9QEAKvEB6zfPznF3dsCCHx05wtFKbOHtyRAGkUoHkJ39fzvKD6kk
 9sVfDrfFDqNou/tLpdBJC3QUilSBtr0FQbYbiTbqrHLXuCa9J2+YdrTjn57PWyxJJEJT
 hGcy8qTMQhysnCc8MEdu49uLbR96Meuwa7VjA6qqPHrx5QNlcFSEMFZbLsEykXdqTHiu
 Lw1/qawKpNjjaLljYJ56RK171qgdvFhwfr3MPNCZE0Aeclh95TVv0Y1+DcfILr9BuH6N
 cfmszz7PiD+sbSlwJazt/ObeKpAmmsRrsft68cT57/eGGpD6ZtyRelgtDiaeorY3rI/j
 UnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qlTkrqVb2aMkLpsUHrMoW58Kky3kHTKxI6M8gj2V1zA=;
 b=mnWsTuHfFNPA/ztG0Yhfu+JYkXpMpouOfc5Maur5/uu3X2vlGTB+B1ak//+faH50+m
 oV4JSMXWshPojG27i4Ft35bqGcTUyiTKUytk793pt1mt6AuJQ7ZeCiv8ngRFV9VY7Rva
 Rei6LtcGTRkRsPqAQq7o3/AcF+H7MeX3sw1QfUvBvz6NRTzEYPt/oiF91OrdSZXjf7jz
 QtrrWhEgYyZdn5cow3R3aT4IevF9cWEv445gqqXOWBsfqr+JZVPPqGuM3gvvisFSvvfG
 aR8Yza9x8c3HamZr1RzaSt9SnFjAvk8zZVmSTe7px82USHjILrsjnu+yeKYY7iUUqxe8
 9v3w==
X-Gm-Message-State: ACrzQf2maLvdQpfQrKXTc5eCFDf7oM3DYJ4wHB4UXqdmsZGbFqRdB9Xb
 c+t7Mn0+Knj83GoQaPEg8aLxhw==
X-Received: by 2002:a17:902:e5cd:b0:176:ad01:ab47 with SMTP id
 u13-20020a170902e5cd00b00176ad01ab47mr958363plf.133.1663699596882; 
 Tue, 20 Sep 2022 11:46:36 -0700 (PDT)
Received: from localhost ([49.7.199.230]) by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm203667pja.57.2022.09.20.11.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:36 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 2/3] hw/gpio/aspeed_gpio: Add gpios in/out init
Date: Wed, 21 Sep 2022 02:46:18 +0800
Message-Id: <20220920184619.3370115-3-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rrbVqG9Vo73b

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
index 1e267dd482..51f5f1c386 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1013,6 +1013,17 @@ static void aspeed_gpio_reset(DeviceState *dev)
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
@@ -1037,6 +1048,12 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
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

