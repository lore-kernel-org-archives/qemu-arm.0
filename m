Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp149932lfb;
        Mon, 4 May 2020 00:28:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwEyf3xqAvA5swOagVKHyuHvb0M+uvMJqL4L0+3J6pjD/NcSDqJmpkz3Ygtkbbazt+hXxD
X-Received: by 2002:a0c:ec44:: with SMTP id n4mr15056238qvq.237.1588577319799;
        Mon, 04 May 2020 00:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588577319; cv=none;
        d=google.com; s=arc-20160816;
        b=zWT0SkcUI6qlD6gd2iqPbva4La150eK+w11ZK8aoXfUXpjJbxB7N4XEd3AyxaAmVJR
         bJQNsuiG1naPwUXzbI4RuE7SRpJHjt0JKGchGDtawftd9qkWXX3M73KbVdnY8RpPdynU
         XQIV+gwmfojxwKTqtBlz2vMRGu6opCSz6W1c6rzcGZcoGGmNBtCAHvRBsOtoCsfOCXv1
         rAzagyh8A2atfCU2EZtkuxHszS6INWFOF67b8SuRkgW/tgGG7A7L328d9F3Hf4zlH4n9
         IXex82Z9NKLQo1RCmENIWpERtKyRpLtO16aTxzztQ22b4LCcdObGwQoqd6O1ELLer4q7
         w57A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dsajqg5lAaKjFPLXc7DAkT/Ql48pVTTyNDF4inTTmC8=;
        b=uVjd5k8IHNFXXgxBibMzojPTeVEf6T3yFbxFWqShAhEaF0jEMx21Exi9DpFId/13VJ
         NdWikHcBbFklORZm/tSYt0rpIU2nOQpsgbsGWedIscYhJz0k7DNzC/IDler5IX9GIbC2
         aA/6WQIaz+CggV/ZoMmpEZhjhOBHoPt1wk/ku8UgGBZndc5TBUHhRUTrzIlAGskSASWw
         RwCRWJwTNzmz7HPc7AsavbBwanQ2W2eF0b5jQtnrcQT8Kg7TeqKprWZ5rg1nxFgtxL5a
         tafD5+0Wm/iRQJ4vsFTOb5x1PPRgY4Wr9R5MTliF85UTODPHcQ8I0+ur7S9mVbBsxynM
         x54A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nAN4IOBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p55si5915570qtk.60.2020.05.04.00.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 00:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nAN4IOBZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVVWo-00062F-Qk
	for alex.bennee@linaro.org; Mon, 04 May 2020 03:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWg-0005zU-47; Mon, 04 May 2020 03:28:30 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVVWe-00063Y-RH; Mon, 04 May 2020 03:28:29 -0400
Received: by mail-wr1-x441.google.com with SMTP id x18so19643412wrq.2;
 Mon, 04 May 2020 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dsajqg5lAaKjFPLXc7DAkT/Ql48pVTTyNDF4inTTmC8=;
 b=nAN4IOBZGf9iV4qWAm5yqzwg6S2WcDVcXCXnWWdZ5KZeHwPSopMqE9XfUJOCf0tH5a
 9xvdZLFgVqF3ZwKVisRQqlm+nErQk8FCZvB7a84zMbSSjLsJT6NcWyHQ13LgRKg/wEKt
 +TQR+w2My6cA+QIR5SuFlHqocZVZkD7ROX2ey/5/uD2kHjZt/q5wIm9TCCl54MTEah2w
 /KCBXr2JGO3KMIcuRc30nrSLJMcC0SGtQP2/2riVJ27Yj4OrJ1fvWGEUItu58kC3c1Bd
 gG5uo/iG2rzzAS1ij9MauvDECON3vp/dKIRtg5o1yIt/xtJUxbsbMvaReLQgHfEifovG
 sgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dsajqg5lAaKjFPLXc7DAkT/Ql48pVTTyNDF4inTTmC8=;
 b=mrlSgnqGZ25KB/8uOXH0gCInf+FFThvtGIRInDExw4M4K0CsIBRRLSRBQYr54qEn6O
 L9fmSpOt4vFxDr6BdTNxN4WteLgfgCm/5oc+J+voeX4KkCrGfmd/vw5EakoNsPhlVnI3
 LxR924+w+LuGYwZeEQNhOE4KHnewF/RI1k95gTJWVvkMfAycYjXgCAV2jeNDyVIcpqMt
 Yt3haBFa9sGSWs0Ltx++E4etOzq0yiNzs/zBd2B6/KUzTklVJEigbzV1gqgrXh8E62gx
 EbijwaJKAqA3mNHwpbWONc0cFD7IRB9FENngO0mcLanYKOQD/MfYFupAfln1nB9ilpNT
 TySA==
X-Gm-Message-State: AGi0PuaDBqjyJacsqE7QoUcUETeA1E6tkZPt1SwmpV+kEwS1oNZENCn6
 9zLTNxHx4rdq/T5uS6DQZvsxV1jU
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr9294279wro.25.1588577305926;
 Mon, 04 May 2020 00:28:25 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id w83sm12590159wmb.37.2020.05.04.00.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 00:28:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/arm/nrf51: Add NRF51_PERIPHERAL_SIZE definition
Date: Mon,  4 May 2020 09:28:19 +0200
Message-Id: <20200504072822.18799-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200504072822.18799-1-f4bug@amsat.org>
References: <20200504072822.18799-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jiND8v1j+nNy

On the NRF51 series, all peripherals have a fixed I/O size
of 4KiB. Define NRF51_PERIPHERAL_SIZE and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/nrf51.h        | 3 +--
 include/hw/i2c/microbit_i2c.h | 2 +-
 hw/arm/nrf51_soc.c            | 4 ++--
 hw/i2c/microbit_i2c.c         | 2 +-
 hw/timer/nrf51_timer.c        | 2 +-
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
index 1008fee6c9..de836beaa4 100644
--- a/include/hw/arm/nrf51.h
+++ b/include/hw/arm/nrf51.h
@@ -24,11 +24,10 @@
 #define NRF51_IOMEM_BASE      0x40000000
 #define NRF51_IOMEM_SIZE      0x20000000
 
+#define NRF51_PERIPHERAL_SIZE 0x00001000
 #define NRF51_UART_BASE       0x40002000
 #define NRF51_TWI_BASE        0x40003000
-#define NRF51_TWI_SIZE        0x00001000
 #define NRF51_TIMER_BASE      0x40008000
-#define NRF51_TIMER_SIZE      0x00001000
 #define NRF51_RNG_BASE        0x4000D000
 #define NRF51_NVMC_BASE       0x4001E000
 #define NRF51_GPIO_BASE       0x50000000
diff --git a/include/hw/i2c/microbit_i2c.h b/include/hw/i2c/microbit_i2c.h
index aad636127e..2bff36680c 100644
--- a/include/hw/i2c/microbit_i2c.h
+++ b/include/hw/i2c/microbit_i2c.h
@@ -29,7 +29,7 @@
 #define MICROBIT_I2C(obj) \
     OBJECT_CHECK(MicrobitI2CState, (obj), TYPE_MICROBIT_I2C)
 
-#define MICROBIT_I2C_NREGS (NRF51_TWI_SIZE / sizeof(uint32_t))
+#define MICROBIT_I2C_NREGS (NRF51_PERIPHERAL_SIZE / sizeof(uint32_t))
 
 typedef struct {
     SysBusDevice parent_obj;
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 57eff63f0d..e50473fd19 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -156,7 +156,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
             return;
         }
 
-        base_addr = NRF51_TIMER_BASE + i * NRF51_TIMER_SIZE;
+        base_addr = NRF51_TIMER_BASE + i * NRF51_PERIPHERAL_SIZE;
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->timer[i]), 0, base_addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer[i]), 0,
@@ -166,7 +166,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
 
     /* STUB Peripherals */
     memory_region_init_io(&s->clock, OBJECT(dev_soc), &clock_ops, NULL,
-                          "nrf51_soc.clock", 0x1000);
+                          "nrf51_soc.clock", NRF51_PERIPHERAL_SIZE);
     memory_region_add_subregion_overlap(&s->container,
                                         NRF51_IOMEM_BASE, &s->clock, -1);
 
diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
index 4661f05253..8024739820 100644
--- a/hw/i2c/microbit_i2c.c
+++ b/hw/i2c/microbit_i2c.c
@@ -100,7 +100,7 @@ static void microbit_i2c_realize(DeviceState *dev, Error **errp)
     MicrobitI2CState *s = MICROBIT_I2C(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &microbit_i2c_ops, s,
-                          "microbit.twi", NRF51_TWI_SIZE);
+                          "microbit.twi", NRF51_PERIPHERAL_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
index e04046eb15..bc82c85a6f 100644
--- a/hw/timer/nrf51_timer.c
+++ b/hw/timer/nrf51_timer.c
@@ -313,7 +313,7 @@ static void nrf51_timer_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
     memory_region_init_io(&s->iomem, obj, &rng_ops, s,
-            TYPE_NRF51_TIMER, NRF51_TIMER_SIZE);
+                          TYPE_NRF51_TIMER, NRF51_PERIPHERAL_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
 
-- 
2.21.3

