Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15284291lff;
        Mon, 30 Dec 2019 03:13:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNAQmZbwyX1Pf1wjnOyeTBqOOCnjt36wMGUkwBSEc7uc+1zjxPQDwUEcRcHR8ugAtPs60j
X-Received: by 2002:a9d:4c94:: with SMTP id m20mr71721167otf.341.1577704397502;
        Mon, 30 Dec 2019 03:13:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577704397; cv=none;
        d=google.com; s=arc-20160816;
        b=V5VuLNYdH3WExXNsI7iNyJXPh1wolCWB3gCGJ4HfTVsAITzd4fcW1wfMDJLr18auP0
         2DtmVVwghL1hsdvj/j+F0c7olU26cKg+ipv6UscfSwl8y7+D5lkNh2WFth/dp/Nv6AwD
         OzbwXG7oR8iGLcje9qCRKpn/0ss0Qj/l4RQC2d9HXuQWqAk3QZht/v9ok6GPciAD1Z45
         ErRXEAUx25nxsR5zjsZ4dFf9H4pwYnD2D2V0F70EL98Bw2yAdbNvv7FzBQI+j0Ar1N6U
         D+UpBSY6Q50zf8Bf0lyBYItPNgaxjl3yYmLRdPqT5FmcpzkquPU3oRaiptdgeUCnxduA
         C1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=N8YaSe87ak8uhHmiFp5CcDUPJZv1Grr3iIYPennz/Fg=;
        b=UKboG6U3iNkg7frKw+I5XqiXYn2qskEfUkrOOTqCXk/czkJsHPpm9RyM/GHqUHtEq5
         JNrDtfB8bPKuyAfqRwFHwsQV89L/JsXLsGobGXcXkEzASusjTI7mGXnMifbuQR+d12Wk
         0waHZrx5eHFuvCizQpS/8e9qUx/zMtHCWIPzL126EZvS5chBSYFv5ZFtw+jVpOUiTiqo
         6gpuo9ikAsN7XIcdXESBW9X7bYeuoDi9XAPhW5xYAhIMcJiKi63/DF/UlWnblJksurWK
         1gdeDNyyLYSHsH3OsfBRTpCC8YS2+uGmdwpsLGNM3NTxZ7n0fmtBdLDnBYYvsopy6JHt
         vmaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pqAWoWpJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1794438otj.33.2019.12.30.03.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 03:13:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pqAWoWpJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilsz6-0001mM-Mi
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 06:13:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvz-0005Wo-AT
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvy-00038a-0T
 for qemu-devel@nongnu.org; Mon, 30 Dec 2019 06:10:03 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41477)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ilsvx-00038J-QE; Mon, 30 Dec 2019 06:10:01 -0500
Received: by mail-wr1-x442.google.com with SMTP id c9so32333596wrw.8;
 Mon, 30 Dec 2019 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N8YaSe87ak8uhHmiFp5CcDUPJZv1Grr3iIYPennz/Fg=;
 b=pqAWoWpJK71sx/Jygy1TAsWw9WBir7sjma/NtvScrYwW4w/zun0VShlyr7KPOj5l1Y
 CdXaYT0yumPDS6/JYQE8DXzDHmQUqBb+HP3gVBKsB7as1SRH8kdnX+8HblR1byQg4UdD
 K5F2a8Zt45M/AfVo5DsHFRsM5Pi6cvyREax74Wp5hDSlriecEWZJT8D4wF4rWsWgBwtY
 HbST8dO7yrUfJ+YipMt1Y66DTm2gXV1GMTd2BqhcJVik2n33FXpc7mn1aft5xuCaCeug
 uyi+1A9VkOx2GTtqdp+Im3A7cVHtVKu2K5SgQ3L2GE5BTw5mZ86DSPV2tPd/M2/njnMW
 0ALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=N8YaSe87ak8uhHmiFp5CcDUPJZv1Grr3iIYPennz/Fg=;
 b=He3GvTrGmuugk1xtnljsgEhkXWhb3tXm0OtrW36ydsWfZo6MjMQ7jdnFQPK+oAv2OB
 GZo/N9cy6xtKaNH+QikWTqG0S3ZysJHtBQSbPHANJqJajswHNjBKIPdCIJNOjEm4CW4Z
 eQUePTdJlhkC9p1GlREi3U1j2ZKQX+zWv/IhD1GcgIoYOauO29ysajX0JYOeRGD2sFiq
 5gYxPgaaru3o5a0obJSCGslQLy16rRCwjcZrtQ6HW6gUlDz7FAUZNheeAFVNwkjfhAY0
 x4fsz8tIVyXAscgFBqAVArKnb/f0Ze4O+kzxwGqBs/5J7B8u2523Pv67SCMO+eaqTsGn
 0yBw==
X-Gm-Message-State: APjAAAX1CghQrOxKwLh7iqFI9Cn/YSZazqVtKN2rQl+TMD780j2T7356
 jUXeCOtb5Bvjqaz1ccl1OS9xGXjEBQw=
X-Received: by 2002:a5d:488c:: with SMTP id g12mr65591723wrq.67.1577704200633; 
 Mon, 30 Dec 2019 03:10:00 -0800 (PST)
Received: from x1w.redhat.com ([2a01:cb18:8372:6b00:691b:aac5:8837:d4da])
 by smtp.gmail.com with ESMTPSA id p15sm20442738wma.40.2019.12.30.03.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 03:10:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/arm/allwinner-a10: Simplify by passing IRQs with
 qdev_pass_gpios()
Date: Mon, 30 Dec 2019 12:09:51 +0100
Message-Id: <20191230110953.25496-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191230110953.25496-1-f4bug@amsat.org>
References: <20191230110953.25496-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k2DywqRNsV6j

By calling qdev_pass_gpios() we don't need to hold a copy of the
IRQs from the INTC into the SoC state.
Instead of filling an array of qemu_irq and passing it around, we
can now directly call qdev_get_gpio_in() on the SoC.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/allwinner-a10.h |  1 -
 hw/arm/allwinner-a10.c         | 24 +++++++++++-------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 941c61e533..40d0b1d9c0 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -23,7 +23,6 @@ typedef struct AwA10State {
     /*< public >*/
 
     ARMCPU cpu;
-    qemu_irq irq[AW_A10_PIC_INT_NR];
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 0f1af5a880..966fbd4a6e 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -55,7 +55,6 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
 {
     AwA10State *s = AW_A10(dev);
     SysBusDevice *sysbusdev;
-    uint8_t i;
     qemu_irq fiq, irq;
     Error *err = NULL;
 
@@ -76,9 +75,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(sysbusdev, 0, AW_A10_PIC_REG_BASE);
     sysbus_connect_irq(sysbusdev, 0, irq);
     sysbus_connect_irq(sysbusdev, 1, fiq);
-    for (i = 0; i < AW_A10_PIC_INT_NR; i++) {
-        s->irq[i] = qdev_get_gpio_in(DEVICE(&s->intc), i);
-    }
+    qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
 
     object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
     if (err != NULL) {
@@ -87,12 +84,12 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     }
     sysbusdev = SYS_BUS_DEVICE(&s->timer);
     sysbus_mmio_map(sysbusdev, 0, AW_A10_PIT_REG_BASE);
-    sysbus_connect_irq(sysbusdev, 0, s->irq[22]);
-    sysbus_connect_irq(sysbusdev, 1, s->irq[23]);
-    sysbus_connect_irq(sysbusdev, 2, s->irq[24]);
-    sysbus_connect_irq(sysbusdev, 3, s->irq[25]);
-    sysbus_connect_irq(sysbusdev, 4, s->irq[67]);
-    sysbus_connect_irq(sysbusdev, 5, s->irq[68]);
+    sysbus_connect_irq(sysbusdev, 0, qdev_get_gpio_in(dev, 22));
+    sysbus_connect_irq(sysbusdev, 1, qdev_get_gpio_in(dev, 23));
+    sysbus_connect_irq(sysbusdev, 2, qdev_get_gpio_in(dev, 24));
+    sysbus_connect_irq(sysbusdev, 3, qdev_get_gpio_in(dev, 25));
+    sysbus_connect_irq(sysbusdev, 4, qdev_get_gpio_in(dev, 67));
+    sysbus_connect_irq(sysbusdev, 5, qdev_get_gpio_in(dev, 68));
 
     memory_region_init_ram(&s->sram_a, OBJECT(dev), "sram A", 48 * KiB,
                            &error_fatal);
@@ -111,7 +108,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     }
     sysbusdev = SYS_BUS_DEVICE(&s->emac);
     sysbus_mmio_map(sysbusdev, 0, AW_A10_EMAC_BASE);
-    sysbus_connect_irq(sysbusdev, 0, s->irq[55]);
+    sysbus_connect_irq(sysbusdev, 0, qdev_get_gpio_in(dev, 55));
 
     object_property_set_bool(OBJECT(&s->sata), true, "realized", &err);
     if (err) {
@@ -119,10 +116,11 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sata), 0, AW_A10_SATA_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, s->irq[56]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, qdev_get_gpio_in(dev, 56));
 
     /* FIXME use a qdev chardev prop instead of serial_hd() */
-    serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2, s->irq[1],
+    serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2,
+                   qdev_get_gpio_in(dev, 1),
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
 }
 
-- 
2.21.0

