Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3837864lfg;
        Wed, 26 Feb 2020 18:38:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqw1kQdHgWzBDersS6BHfiRQFVvUPBMZ1tKk+DUVpeRFYahgYHHvSfvsP7dl7qW0xAQUn7qV
X-Received: by 2002:ad4:4d94:: with SMTP id cv20mr2336136qvb.105.1582771119002;
        Wed, 26 Feb 2020 18:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582771118; cv=none;
        d=google.com; s=arc-20160816;
        b=h6h6gYnV63O1I/DxvOxtRfCs/26Wjm1K1Br9DCdOqVC1P5MA8YKWGfLvUVx0syoQ3T
         XykSwp586xbLurh1NFtAgrMIm5g2CWP08lByobIhtLHmKxdGgkoRvyp+vEZoOfATBZSY
         2by5wu6xnMJwZlW9tZmgIceXl2KjSecdfw48JI/9VxKKDMgMnTkQrN6pMJIuWxSKaelJ
         GLazSMNG//+UrnReP6bCz75YCc4WN9BDK1Czv2d6UBgaAwr5ibO794aXz69N1Vnpg6kj
         s0Ko04Eka+WUuLQfJY+lh90EaKl3alKiAWzyppmSDY+VfRYKSadLM6M6z7eXXB4Fhp+2
         bYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=p/F+4x4UkdW18ehpRURv5+muCDGDvBF/a+QAMr/dAYk=;
        b=EDc/1z9IwnWSN6vqcx0WZ3NzDP/9c88MKVyOd9WLfT9lrHbop8ObJYGlzLJR9lPpGV
         vGfHUQznO8GM4CHV6q4T+DGEZBIr1qkofuzWtYFlGGrU2Jd7I7Q3gc3os3lCjELQejCM
         4GIVEBZcXOamYJNzfXxlIA19YR3qG0x8ahg6aZxcOgVs94buLuL1fXuPMnAmSUtBhlP4
         dUiC7J0OHPcomEONUdT5F8yI2ov1W/M35lxSyjS+58oqk2JXpNekYXmAlIspAh5PGaSY
         DS8WSN8lYcE1Ing7TQB692vp+2Emyv3TXAQ71Xr/Z35efBUCo8oerc/ZPIXCJpFjVg4z
         nkMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si496361qvw.81.2020.02.26.18.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 18:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j794Q-0003qH-Dp
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 21:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791V-00083l-Cm
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791U-0001lB-Au
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:37 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3175 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791R-0001ZP-MZ; Wed, 26 Feb 2020 21:35:33 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A23DBA7A5288C2477CB3;
 Thu, 27 Feb 2020 10:35:31 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:22 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 6/6] hw/timer/cadence_ttc: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:55 +0800
Message-ID: <20200227025055.14341-7-pannengyuan@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: zhang.zhanghailiang@huawei.com, Alistair Francis <alistair@alistair23.me>,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, euler.robot@huawei.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qDrMLLOs3x87

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
---
 hw/timer/cadence_ttc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
index 5e3128c1e3..b0ba6b2bba 100644
--- a/hw/timer/cadence_ttc.c
+++ b/hw/timer/cadence_ttc.c
@@ -412,16 +412,21 @@ static void cadence_timer_init(uint32_t freq, CadenceTimerState *s)
 static void cadence_ttc_init(Object *obj)
 {
     CadenceTTCState *s = CADENCE_TTC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
+                          "timer", 0x1000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
+
+static void cadence_ttc_realize(DeviceState *dev, Error **errp)
+{
+    CadenceTTCState *s = CADENCE_TTC(dev);
     int i;
 
     for (i = 0; i < 3; ++i) {
         cadence_timer_init(133000000, &s->timer[i]);
-        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->timer[i].irq);
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->timer[i].irq);
     }
-
-    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
-                          "timer", 0x1000);
-    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
 static int cadence_timer_pre_save(void *opaque)
@@ -479,6 +484,7 @@ static void cadence_ttc_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->vmsd = &vmstate_cadence_ttc;
+    dc->realize = cadence_ttc_realize;
 }
 
 static const TypeInfo cadence_ttc_info = {
-- 
2.18.2

