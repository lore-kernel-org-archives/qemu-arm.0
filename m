Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1498023wru;
        Mon, 16 Jul 2018 06:19:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfNA13MbPV64PfIeSnVxkunwRXVFdE3OZAQoQzZ2AmhdMgy7KjP7lth10YpQr2xrX1Hf2qy
X-Received: by 2002:a37:24d0:: with SMTP id k77-v6mr14048284qkk.440.1531747187665;
        Mon, 16 Jul 2018 06:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531747187; cv=none;
        d=google.com; s=arc-20160816;
        b=wx4SeC+/nLJm6MOYHs/xNN5DsptXEQIePquB9ng0niC7CxZE9TNsGI39Tiqhtjyzmi
         w/C9qZzHo4C0E5bdtStgz7VR88tTTJjiAsKWZM2vPb+svsOB2C0UKcpBGxQhBj1aJoVN
         G6FYKdS2LieftHN/mh/T38posqj1CyZKrO+z9YiWFb23vYcMG/0pbUYEhclmw3fRcWSA
         EXT2BZ2EpoVYCyMOm0ThBlILbuZMp3PtqLDgECDcYzy8Pv/CDhN8qty0p/9Ys/xptpC8
         A7hC80eMAdrae5wi7WY3AfuYtn5fQSo9vsLQOW0KLuDiKXRpXQ3DeZ+HZl0EA/y15naB
         Rg4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=w0BMm0PdcaeKowsWUIzH3eLFYnxl3m/vQht2NiX9OrE=;
        b=gtUMQON6K/866JyAnTMw9/kvmB67LMCtjfKwE0zgmXKT1R41a2JEqKWDZIrXQztVBC
         lmVs1Lh+OeryXfR+CAz16++YGkv2jlVxFvRth8URgub62olKLKfe37WOjMYVUEYf6t1/
         BLCpO8IkF+cbSPXx9XnpFozYdOENKDSSzNckc0oTjyLZn/+5vbJhjCrU/Db6llWvGg4s
         xbgE50Oyy3cJ3qCPp6a1QeDVAfPM8xqYAWxfl/Zm8symw6hmLu9ThDQUyTM/pUYwigtj
         86GqSDiG8penS5sPDo9a5GW3ls2HfSrPBbijwc6gdxPjjAGiGWXR18abzXxT/JRJRhCz
         zrHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u15-v6si2568258qta.385.2018.07.16.06.19.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3Pm-0008Qy-SP
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:19:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36r-0001XM-6W
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ff36m-0002IZ-O9
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:00:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35440 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ff36m-0002HZ-Ij; Mon, 16 Jul 2018 09:00:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03F837C6A9;
	Mon, 16 Jul 2018 13:00:08 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-200-180.str.redhat.com
	[10.33.200.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 641771C589;
	Mon, 16 Jul 2018 13:00:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jul 2018 14:59:32 +0200
Message-Id: <1531745974-17187-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1531745974-17187-1-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 16 Jul 2018 13:00:08 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 15/17] hw/arm/stm32f205_soc: Fix introspection
 problem with 'stm32f205-soc' device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7LRX8eNv3c/

Valgrind complains:

echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
 "'arguments':{'typename':'stm32f205-soc'}}" \
 "{'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
[...]
==28531== Invalid read of size 8
==28531==    at 0x6185BA: qdev_print (qdev-monitor.c:686)
==28531==    by 0x6185BA: qbus_print (qdev-monitor.c:719)
==28531==    by 0x452B38: handle_hmp_command (monitor.c:3446)
[...]

Fix it with the new sysbus_init_child_obj() function.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/stm32f205_soc.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 2b2135d..c486d06 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -49,36 +49,32 @@ static void stm32f205_soc_initfn(Object *obj)
     STM32F205State *s = STM32F205_SOC(obj);
     int i;
 
-    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
-    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
+    sysbus_init_child_obj(obj, "armv7m", &s->armv7m, sizeof(s->armv7m),
+                          TYPE_ARMV7M);
 
-    object_initialize(&s->syscfg, sizeof(s->syscfg), TYPE_STM32F2XX_SYSCFG);
-    qdev_set_parent_bus(DEVICE(&s->syscfg), sysbus_get_default());
+    sysbus_init_child_obj(obj, "syscfg", &s->syscfg, sizeof(s->syscfg),
+                          TYPE_STM32F2XX_SYSCFG);
 
     for (i = 0; i < STM_NUM_USARTS; i++) {
-        object_initialize(&s->usart[i], sizeof(s->usart[i]),
-                          TYPE_STM32F2XX_USART);
-        qdev_set_parent_bus(DEVICE(&s->usart[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "usart[*]", &s->usart[i],
+                              sizeof(s->usart[i]), TYPE_STM32F2XX_USART);
     }
 
     for (i = 0; i < STM_NUM_TIMERS; i++) {
-        object_initialize(&s->timer[i], sizeof(s->timer[i]),
-                          TYPE_STM32F2XX_TIMER);
-        qdev_set_parent_bus(DEVICE(&s->timer[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "timer[*]", &s->timer[i],
+                              sizeof(s->timer[i]), TYPE_STM32F2XX_TIMER);
     }
 
     s->adc_irqs = OR_IRQ(object_new(TYPE_OR_IRQ));
 
     for (i = 0; i < STM_NUM_ADCS; i++) {
-        object_initialize(&s->adc[i], sizeof(s->adc[i]),
-                          TYPE_STM32F2XX_ADC);
-        qdev_set_parent_bus(DEVICE(&s->adc[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "adc[*]", &s->adc[i], sizeof(s->adc[i]),
+                              TYPE_STM32F2XX_ADC);
     }
 
     for (i = 0; i < STM_NUM_SPIS; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]),
-                          TYPE_STM32F2XX_SPI);
-        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+        sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
+                              TYPE_STM32F2XX_SPI);
     }
 }
 
-- 
1.8.3.1

