Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3835731lfg;
        Wed, 26 Feb 2020 18:36:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwGQJc0vREpikRNZWzduZChIfy+9uwoc3ahijrgr9TdcmVvD843ZNIn1rtc0TXgy/QYj3W+
X-Received: by 2002:a37:bd85:: with SMTP id n127mr2737901qkf.113.1582770961314;
        Wed, 26 Feb 2020 18:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582770961; cv=none;
        d=google.com; s=arc-20160816;
        b=g+fzHoddJZ5DQWT2HcEhXpyIgnB1+BiH+zXOaqPhKYjnhKfcJ08BD4c+h2YcLFdfRu
         fwBxZkKal32uVzU5hX428d0jW1McajNuUCkK3Z82FuKiC+jpio1znm2Lv7yoDN60FqpX
         qVo7xxEL/PXjh0A8Ac7dl26iwqC6rKE6uDePORROvfigOMT1SLnLe9Nouqj3BB1tCfqr
         PUo2E8MiyASVBgDOeiOqZXT/GlKtlFj49BXjDju+kUZOQDp//xLl6pU60NFlzRatpVJi
         oGmiv//dxSlMVy0dTwTPHN2nCNEBrqwy59CKm7MKmOZLKltiCq9eDjnqcRRULJrCGc2B
         bhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=9uShoF//ypKdNFU7H/k8XOjnROEvEb/GT/eve+8SSdw=;
        b=EA5FdaakT+beqf1hgpTRDbQwDV1h0mePUkE/RUWkVLzQszbo66VGA1WpqRDN42cEHa
         Bfur+QkjVSfdFJdjSjozWXyF/hSSTxArY6aHmbGVdYsq3BZeMN2jf2KX5/pF1ps4VKGl
         ZK5ousHE/4S2V7XpZlhkAb9fbAtHW5LTET7fPUdP9IviPVfKQsea7aetz2o53oR+GiLX
         ffAi3JWsE4EOKyN9E1BMSSYE+YlFo27EK/BIS5Emzof36n6NOxxrpvYmMVG8+LPQQ10x
         kFsYZwM6VbV7e4x7Af6DRYQ6NVGsgOetsSj4C9cp57gXIdRB/vXkw8wHmfWw8Kz0kQuH
         HE0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24si756454qkl.44.2020.02.26.18.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 18:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j791s-0008Sn-O8
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 21:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791Q-0007wR-5d
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791O-0001Wx-UE
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3172 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791O-0001O8-JC; Wed, 26 Feb 2020 21:35:30 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 89955B16684D25F05FF8;
 Thu, 27 Feb 2020 10:35:26 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:17 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 2/6] hw/arm/pxa2xx: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:51 +0800
Message-ID: <20200227025055.14341-3-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200227025055.14341-1-pannengyuan@huawei.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, euler.robot@huawei.com,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lHCM75BYKQRA

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
---
 hw/arm/pxa2xx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index b33f8f1351..56a36202d7 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -1134,18 +1134,22 @@ static void pxa2xx_rtc_init(Object *obj)
     s->last_rtcpicr = 0;
     s->last_hz = s->last_sw = s->last_pi = qemu_clock_get_ms(rtc_clock);
 
+    sysbus_init_irq(dev, &s->rtc_irq);
+
+    memory_region_init_io(&s->iomem, obj, &pxa2xx_rtc_ops, s,
+                          "pxa2xx-rtc", 0x10000);
+    sysbus_init_mmio(dev, &s->iomem);
+}
+
+static void pxa2xx_rtc_realize(DeviceState *dev, Error **errp)
+{
+    PXA2xxRTCState *s = PXA2XX_RTC(dev);
     s->rtc_hz    = timer_new_ms(rtc_clock, pxa2xx_rtc_hz_tick,    s);
     s->rtc_rdal1 = timer_new_ms(rtc_clock, pxa2xx_rtc_rdal1_tick, s);
     s->rtc_rdal2 = timer_new_ms(rtc_clock, pxa2xx_rtc_rdal2_tick, s);
     s->rtc_swal1 = timer_new_ms(rtc_clock, pxa2xx_rtc_swal1_tick, s);
     s->rtc_swal2 = timer_new_ms(rtc_clock, pxa2xx_rtc_swal2_tick, s);
     s->rtc_pi    = timer_new_ms(rtc_clock, pxa2xx_rtc_pi_tick,    s);
-
-    sysbus_init_irq(dev, &s->rtc_irq);
-
-    memory_region_init_io(&s->iomem, obj, &pxa2xx_rtc_ops, s,
-                          "pxa2xx-rtc", 0x10000);
-    sysbus_init_mmio(dev, &s->iomem);
 }
 
 static int pxa2xx_rtc_pre_save(void *opaque)
@@ -1203,6 +1207,7 @@ static void pxa2xx_rtc_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "PXA2xx RTC Controller";
     dc->vmsd = &vmstate_pxa2xx_rtc_regs;
+    dc->realize = pxa2xx_rtc_realize;
 }
 
 static const TypeInfo pxa2xx_rtc_sysbus_info = {
-- 
2.18.2

