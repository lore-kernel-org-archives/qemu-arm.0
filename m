Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3835716lfg;
        Wed, 26 Feb 2020 18:36:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwSfZG5KcmFrX0YP+oO1zf9bqZDjerUTCQkxHb0BPmIR7ttbQrawJ/+GZDBKIVnK990LlNy
X-Received: by 2002:a37:b15:: with SMTP id 21mr2376635qkl.291.1582770960120;
        Wed, 26 Feb 2020 18:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582770960; cv=none;
        d=google.com; s=arc-20160816;
        b=AZuDX5H3fmIEcUZ4mmAncYqU+P5eyGXVEaHx4nUHDK0Lq2392R3XKwGF/fRttY9eTK
         j7dZSHFW9Z7F8KRDfr1qlB7m5Yu9jTgHW9b/QKgYf1zXaNLDpN9OgjpbrHtVA0Citpk8
         pT3YfUxBGekZ66hHgj4C2dGzqTM1hqXC9wnHEgyAckBo1z5rHLW1cogPkX298fkqx55U
         ByI/6jlAjIDjd+PXlPSSsIIDgXxDwCF9L0OykgVGyMBfTSkJOhc+kqZm/s8AKLTkdy99
         FnWt3O/XmOMGIt1x94+tCF8P+H81Ug8aeZPPP0sjue7n9RaU5i0Y+z7XEZSSBDF8L5lN
         gGLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=OcctjUq1mh6dsDK+AG7FcjMvK08p4/jeTXH4R0VwdhQ=;
        b=Bukp+4Pm4FFoya9encc/1Nk/2sKKLrezpeW4phrJarJupvDwQWX7Y6IYAZykByBuNf
         C6JExxQbphmSOmEQG7zzaQFv/+czl8BsI/lQzoBbGhrryUcHwkdXma/8bguTxAlQDe7X
         fo2deNRL31IX4PwkZh0/wPiMeJux1EEw3uSqt5gV99v407LvUzyHTw1yoamRyenQD4Mh
         wtbMoyfSDPYZaNco2LNRKmyCX35vSoFE4A0CRPq0+JqAOV7dBT0PYAF0aR2QdemZIWFO
         HxTDZcayU/O04cLOjUi15tLwFy7HgESZxf4rQ2iDg3xNIv28EkINJ9Tyjhhd2fqm5jj8
         KGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x60si690541qte.334.2020.02.26.18.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 18:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j791q-0008Pd-I1
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 21:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791P-0007wJ-Gn
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791O-0001Vl-Fr
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 21:35:31 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3171 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791O-0001O6-4z; Wed, 26 Feb 2020 21:35:30 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 854A496A2BE4FCDFB2BD;
 Thu, 27 Feb 2020 10:35:26 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:19 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 4/6] hw/arm/strongarm: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:53 +0800
Message-ID: <20200227025055.14341-5-pannengyuan@huawei.com>
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
Cc: euler.robot@huawei.com, qemu-arm@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDpwAbjKrAD2

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 hw/arm/strongarm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index cd8a99aaf2..3010d765bb 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -399,9 +399,6 @@ static void strongarm_rtc_init(Object *obj)
     s->last_rcnr = (uint32_t) mktimegm(&tm);
     s->last_hz = qemu_clock_get_ms(rtc_clock);
 
-    s->rtc_alarm = timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s);
-    s->rtc_hz = timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
-
     sysbus_init_irq(dev, &s->rtc_irq);
     sysbus_init_irq(dev, &s->rtc_hz_irq);
 
@@ -410,6 +407,13 @@ static void strongarm_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void strongarm_rtc_realize(DeviceState *dev, Error **errp)
+{
+    StrongARMRTCState *s = STRONGARM_RTC(dev);
+    s->rtc_alarm = timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s);
+    s->rtc_hz = timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
+}
+
 static int strongarm_rtc_pre_save(void *opaque)
 {
     StrongARMRTCState *s = opaque;
@@ -451,6 +455,7 @@ static void strongarm_rtc_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "StrongARM RTC Controller";
     dc->vmsd = &vmstate_strongarm_rtc_regs;
+    dc->realize = strongarm_rtc_realize;
 }
 
 static const TypeInfo strongarm_rtc_sysbus_info = {
@@ -1240,15 +1245,16 @@ static void strongarm_uart_init(Object *obj)
                           "uart", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
     sysbus_init_irq(dev, &s->irq);
-
-    s->rx_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_rx_to, s);
-    s->tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, s);
 }
 
 static void strongarm_uart_realize(DeviceState *dev, Error **errp)
 {
     StrongARMUARTState *s = STRONGARM_UART(dev);
 
+    s->rx_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                       strongarm_uart_rx_to,
+                                       s);
+    s->tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, s);
     qemu_chr_fe_set_handlers(&s->chr,
                              strongarm_uart_can_receive,
                              strongarm_uart_receive,
-- 
2.18.2

