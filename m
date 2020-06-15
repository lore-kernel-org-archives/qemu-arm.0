Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2025785lfm;
        Mon, 15 Jun 2020 13:53:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRuTyNZSVFh2XDFKGpoT+TQYRbA/vh55AdJhOi5aO/WzR5nnNJlOPnxvkUF4m3ttvLvSX6
X-Received: by 2002:a25:5f43:: with SMTP id h3mr49160212ybm.248.1592254421727;
        Mon, 15 Jun 2020 13:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592254421; cv=none;
        d=google.com; s=arc-20160816;
        b=PlTycuNjIrY90C9BBj4nb/6qjaj8AYYi98Pz66oJbSqlhVeVR7FG6CYgfnvtI3YnZZ
         JxEVybA/a4Umm4zeLqPlu7xy0rquMu1OGywrFx1YXrsdjARa6XplqhMbhPxBJmmgUfg3
         owiPi0QRjbQsbpfbWBb1E6s3bQo76GjHrhRp7l+iCGpaXXVKcFtIsGBnkCcqY8Pr8jsP
         rpIVgCFMnvBTLsS5DHnfuixD6W8aUbElAIeJkegKLUf6G4sUG/CpsjzaYgmL3eB3/gYY
         iZqxT6sBdF6wVtChumOuVrucKfL6IpVEpoDCTmeFKhoVyvB6W8FzYBX6I7pVlrUEPICR
         Rj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WSEFF9DoIxrKXJNtEM+wjTFCkRr+RtsMi5qBeoYhzuk=;
        b=L8PaevdZHGdGOqErYjt8/FpLRHo8VCTZOS9t1mIEx91KzIIkqrQy8NR1IMj/K95Tp9
         zQc14d7rlH+xK21IQfpac6fsdt9tte8HGOMNggi3Xx0zE7xEapq6f9i8oZtPwa533San
         OAmbUHvbsAXXn4YV+kTrHu2Y3WHDkiRWDpCzLg6AAqr6918M1aBSB3/VLtJ41JoZF7sr
         /43E+ZOcY1o1RXCdrqeNalf4fQXkt8XpnW/UFZ2NN1b68puJBiaFIN8aVOBfdSjuho10
         +3YZZD1bWhI0y5UPsfUWdfk36p7z4sUo23npFUSs0PsDVb7i7qr21vqt2o6HjcQvdKr9
         HuQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gK59IDPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si14062056ybk.86.2020.06.15.13.53.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 13:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gK59IDPn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkw6v-0006WY-2R
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 16:53:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuF-0002uy-O7
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38912
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuB-0000Wt-9Z
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 16:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSEFF9DoIxrKXJNtEM+wjTFCkRr+RtsMi5qBeoYhzuk=;
 b=gK59IDPnHskiJhXiX/Q2rxchF3RpK17Jq43h9YIB1AvujQa+ZANejuAKpNugDbjDeT3GeL
 TBuS71HDHklU6i1HtoqSXRvlcqv+lRHxL/OEW0oSAttL60LSOb7L5xNh+YHTEB5WJ60Y2A
 45Us69fiYk5MpS1DHGXzD24LuubLYYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-lSd6O5J-MzafrU7N3qp_gA-1; Mon, 15 Jun 2020 16:40:18 -0400
X-MC-Unique: lSd6O5J-MzafrU7N3qp_gA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CB3E5AED0;
 Mon, 15 Jun 2020 20:40:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7B1319C79;
 Mon, 15 Jun 2020 20:40:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2385C11385F9; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/84] arm/stm32f405: Fix realization of "stm32f2xx-adc" devices
Date: Mon, 15 Jun 2020 22:38:47 +0200
Message-Id: <20200615204008.3069956-4-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:38:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E/LQQhiykrLq

stm32f405_soc_initfn() creates six such devices, but
stm32f405_soc_realize() realizes only one.  Affects machine
netduinoplus2.

In theory, a device becomes real only on realize.  In practice, the
transition from unreal to real is a fuzzy one.  The work to make a
device real can be spread between realize methods (fine),
instance_init methods (wrong), and board code wiring up the device
(fine as long as it effectively happens on realize).  Depending on
what exactly is done where, a device can work even when we neglect
to realize it.

The five unrealized devices appear to stay unreal: neither MMIO nor
IRQ get wired up.

Fix stm32f405_soc_realize() to realize and wire up all six.  Visible
in "info qtree":

     bus: main-system-bus
       type System
       dev: stm32f405-soc, id ""
         cpu-type = "cortex-m4-arm-cpu"
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio ffffffffffffffff/00000000000000ff
    +    mmio 0000000040012000/00000000000000ff
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio ffffffffffffffff/00000000000000ff
    +    mmio 0000000040012100/00000000000000ff
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio ffffffffffffffff/00000000000000ff
    +    mmio 0000000040012200/00000000000000ff
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio ffffffffffffffff/00000000000000ff
    +    mmio 0000000040012300/00000000000000ff
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio 0000000040012000/00000000000000ff
    +    mmio 0000000040012400/00000000000000ff
       dev: stm32f2xx-adc, id ""
         gpio-out "sysbus-irq" 1
    -    mmio ffffffffffffffff/00000000000000ff
    +    mmio 0000000040012500/00000000000000ff
       dev: armv7m, id ""

Fixes: 529fc5fd3e18ace8f739afd02dc0953354f39442
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200609122339.937862-2-armbru@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/arm/stm32f405_soc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 4f10ce6176..c9a530eecf 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -37,7 +37,8 @@ static const uint32_t usart_addr[] = { 0x40011000, 0x40004400, 0x40004800,
 /* At the moment only Timer 2 to 5 are modelled */
 static const uint32_t timer_addr[] = { 0x40000000, 0x40000400,
                                        0x40000800, 0x40000C00 };
-#define ADC_ADDR                       0x40012000
+static const uint32_t adc_addr[] = { 0x40012000, 0x40012100, 0x40012200,
+                                     0x40012300, 0x40012400, 0x40012500 };
 static const uint32_t spi_addr[] =   { 0x40013000, 0x40003800, 0x40003C00,
                                        0x40013400, 0x40015000, 0x40015400 };
 #define EXTI_ADDR                      0x40013C00
@@ -185,16 +186,18 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->adc_irqs), 0,
                           qdev_get_gpio_in(armv7m, ADC_IRQ));
 
-    dev = DEVICE(&(s->adc[i]));
-    object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err);
-    if (err != NULL) {
-        error_propagate(errp, err);
-        return;
+    for (i = 0; i < STM_NUM_ADCS; i++) {
+        dev = DEVICE(&(s->adc[i]));
+        object_property_set_bool(OBJECT(&s->adc[i]), true, "realized", &err);
+        if (err != NULL) {
+            error_propagate(errp, err);
+            return;
+        }
+        busdev = SYS_BUS_DEVICE(dev);
+        sysbus_mmio_map(busdev, 0, adc_addr[i]);
+        sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
     }
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_mmio_map(busdev, 0, ADC_ADDR);
-    sysbus_connect_irq(busdev, 0,
-                       qdev_get_gpio_in(DEVICE(&s->adc_irqs), i));
 
     /* SPI devices */
     for (i = 0; i < STM_NUM_SPIS; i++) {
-- 
2.26.2

