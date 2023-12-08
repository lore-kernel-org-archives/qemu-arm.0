Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp2044259ejb;
        Thu, 7 Dec 2023 18:33:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCgsWLxjNL9OICYjKiqCCNs4rJPGqLBw2vrNH9cHA19lS9LBntj0v4R9YW8Hkll6yX8Cr3
X-Received: by 2002:a05:622a:14d4:b0:425:4043:5f1e with SMTP id u20-20020a05622a14d400b0042540435f1emr5026579qtx.92.1702002807883;
        Thu, 07 Dec 2023 18:33:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702002807; cv=none;
        d=google.com; s=arc-20160816;
        b=T9Gx4evgRpEmZveFZijkDSYaYvdVkfBeh+jZIKrFlH+Rs4NmA0qCCfFKMlH3c5SKb2
         ifQHzQXC5I4fFk5Uc2EY3ELFXGLfzoM5XZorVEFY5Ophevs1f3wvICC1AOxy11rIXaEq
         fGcbBYsJedKFGFuJxJdN8095IaxqX3aBgwOu5Z+Ds08mynwRSobQ6E3sPz0sz525yDpP
         lbPy7MajGfDxGs9ilaat+wZC6xKm+xsmzGEL+nZIvrjQQgajkoFUKqn4h1YswTs6mMmG
         ZyEsulqVoVe2viJzScaSpN/uqinHrXNz2paSk+ybbCU5vU2ublJip04W22dMEsMyDsfk
         yo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GKpCBrUqkr8L/zjThyY7FG08zFIoOF+cembaEspqQBk=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=T9XkC4p5GKwtVT3nN7CLoZLhhfqkTL8DLSEYSOxpqtx2wjjWJVjohIcrpUjb0YXLVO
         ujjnA+d6c9UQ3mGY/W/+I12k99o6GQIZJ5id+1aU2IBM1qleTeVLezRmbsyvfgLD1N8d
         6Sx9cgE/z8V6NyCnw/PNhXCxX9En14ZDlrmjhjLlk2SCin09YwKLa3GB2zr5VM5B6ggp
         lBnWOlrE+gemKd/+8EVsKPFP3SHOuAKzGQbX5RvjM+5wXwXjYaRSiycm12JoCo4Td0U4
         TLrvtKKfVcCOC0xYtvOllglpps8MPs7sZssuaZlU3GihhE9TSWBNTPkyPbwVPoIUKAA6
         ERTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTpkMcER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fz21-20020a05622a5a9500b004214ba70700si1299911qtb.408.2023.12.07.18.33.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 18:33:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTpkMcER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rBQfF-00040z-6Z; Thu, 07 Dec 2023 21:32:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfC-0003zm-GJ; Thu, 07 Dec 2023 21:32:26 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1rBQfA-0002RL-Nk; Thu, 07 Dec 2023 21:32:26 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c9f84533beso17731621fa.1; 
 Thu, 07 Dec 2023 18:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702002742; x=1702607542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKpCBrUqkr8L/zjThyY7FG08zFIoOF+cembaEspqQBk=;
 b=OTpkMcERr0Q8ABcSm7QidESIWcAXRoGzXMyJtl24aquBvdr2Ra0n9Z6KWCGx3Y3GcO
 tUPBp43tJeWnjziWJUdSEVbFGJKzDRk4M7AdN9WtopFw6rWW5rwgXCbmIUt6Zpw99JlS
 /oq4AenamCERupxUOgFPE1hXTzN3z/s7+HpDt0uVOJs2aJE3EJOdl2oDNqsTtL1xB2vM
 o8iwffbZruQN13HCKmokySXyrC584NQy/WXOygdbt6XYIHnnmMPCxF5WYvdgAP8Qlz3J
 qcc95XsiRXghK2LSJ3PuWsrEB985whSRbgvh54VgTeIiljE6Iy1KjBDR7M6yoidi9ORJ
 7WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702002742; x=1702607542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKpCBrUqkr8L/zjThyY7FG08zFIoOF+cembaEspqQBk=;
 b=PmNkY1bsW/aB0PJrs1O//ROE9tGWZkv/0FzBn2V7AQpdWpX3Ilo3l68yADvdRnXTJI
 F6OlFWfdbB036tNsV7b2BWN9SQtpgrBIFrA6i28CERmzY8LsUEod4/4imM2uVyBZBCR4
 KScmsQn1BfoaNJChVUyU/M2Taq7RDLEXdhdwmK1KhrIc+8el7ZD2SdLUl0cD7fz072dg
 cTRF2jJyBKUtCHAtWHBYwen8cgSZJx9HU2yz39aB1fZp7BSfNgYekwoKp4LpGHnqhVQw
 6aJMxDxonTHzGBTHKGYbYz60NwCF8aHTxkfHj9ERSImk08Qya2AQ0KYWm60GIivV98oc
 M9Qg==
X-Gm-Message-State: AOJu0Yw8UB+oJ9e8lEtdzj/Q5o6J369tvxWnH67BEiypXUoK86te7oaO
 ziq0gzPiS4eN6uWd5dp/INkOsQ/llAbROA==
X-Received: by 2002:a2e:9b8e:0:b0:2c9:d874:6f04 with SMTP id
 z14-20020a2e9b8e000000b002c9d8746f04mr1852548lji.97.1702002742232; 
 Thu, 07 Dec 2023 18:32:22 -0800 (PST)
Received: from localhost.localdomain ([185.200.240.39])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a2e94c1000000b002c9e6cbf78esm99062ljh.19.2023.12.07.18.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 18:32:21 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v4 08/45] Connect SD controller to BCM2838 GPIO
Date: Thu,  7 Dec 2023 20:31:08 -0600
Message-Id: <20231208023145.1385775-9-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=serg.oker@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5c/DAJqkfp/F

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/gpio/bcm2838_gpio.c         | 59 +++++++++++++++++++++++++++++++---
 include/hw/gpio/bcm2838_gpio.h |  5 +++
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/bcm2838_gpio.c b/hw/gpio/bcm2838_gpio.c
index 51eb55b00a..f166ce7959 100644
--- a/hw/gpio/bcm2838_gpio.c
+++ b/hw/gpio/bcm2838_gpio.c
@@ -17,9 +17,10 @@
 #include "qemu/timer.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
-#include "migration/vmstate.h"
+#include "hw/sd/sd.h"
 #include "hw/gpio/bcm2838_gpio.h"
 #include "hw/irq.h"
+#include "migration/vmstate.h"
 
 #define GPFSEL0   0x00
 #define GPFSEL1   0x04
@@ -64,6 +65,16 @@
 
 #define BYTES_IN_WORD        4
 
+/* bcm,function property */
+#define BCM2838_FSEL_GPIO_IN    0
+#define BCM2838_FSEL_GPIO_OUT   1
+#define BCM2838_FSEL_ALT5       2
+#define BCM2838_FSEL_ALT4       3
+#define BCM2838_FSEL_ALT0       4
+#define BCM2838_FSEL_ALT1       5
+#define BCM2838_FSEL_ALT2       6
+#define BCM2838_FSEL_ALT3       7
+
 static uint32_t gpfsel_get(BCM2838GpioState *s, uint8_t reg)
 {
     int i;
@@ -87,6 +98,31 @@ static void gpfsel_set(BCM2838GpioState *s, uint8_t reg, uint32_t value)
             s->fsel[index] = fsel;
         }
     }
+
+    /* SD controller selection (48-53) */
+    if (s->sd_fsel != BCM2838_FSEL_GPIO_IN
+        && (s->fsel[48] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[49] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[50] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[51] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[52] == BCM2838_FSEL_GPIO_IN)
+        && (s->fsel[53] == BCM2838_FSEL_GPIO_IN)
+       ) {
+        /* SDHCI controller selected */
+        sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
+        s->sd_fsel = BCM2838_FSEL_GPIO_IN;
+    } else if (s->sd_fsel != BCM2838_FSEL_ALT0
+               && (s->fsel[48] == BCM2838_FSEL_ALT0) /* SD_CLK_R */
+               && (s->fsel[49] == BCM2838_FSEL_ALT0) /* SD_CMD_R */
+               && (s->fsel[50] == BCM2838_FSEL_ALT0) /* SD_DATA0_R */
+               && (s->fsel[51] == BCM2838_FSEL_ALT0) /* SD_DATA1_R */
+               && (s->fsel[52] == BCM2838_FSEL_ALT0) /* SD_DATA2_R */
+               && (s->fsel[53] == BCM2838_FSEL_ALT0) /* SD_DATA3_R */
+              ) {
+        /* SDHost controller selected */
+        sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
+        s->sd_fsel = BCM2838_FSEL_ALT0;
+    }
 }
 
 static int gpfsel_is_out(BCM2838GpioState *s, int index)
@@ -266,6 +302,11 @@ static void bcm2838_gpio_reset(DeviceState *dev)
 
     memset(s->fsel, 0, sizeof(s->fsel));
 
+    s->sd_fsel = 0;
+
+    /* SDHCI is selected by default */
+    sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
+
     s->lev0 = 0;
     s->lev1 = 0;
 
@@ -302,15 +343,25 @@ static void bcm2838_gpio_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
 
-    memory_region_init_io(&s->iomem, obj, &bcm2838_gpio_ops, s,
-                          "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);
+    qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(s), "sd-bus");
+
+    memory_region_init_io(
+        &s->iomem, obj,
+        &bcm2838_gpio_ops, s, "bcm2838_gpio", BCM2838_GPIO_REGS_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
     qdev_init_gpio_out(dev, s->out, BCM2838_GPIO_NUM);
 }
 
 static void bcm2838_gpio_realize(DeviceState *dev, Error **errp)
 {
-    /* Temporary stub. Do nothing */
+    BCM2838GpioState *s = BCM2838_GPIO(dev);
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhci", &error_abort);
+    s->sdbus_sdhci = SD_BUS(obj);
+
+    obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost", &error_abort);
+    s->sdbus_sdhost = SD_BUS(obj);
 }
 
 static void bcm2838_gpio_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/gpio/bcm2838_gpio.h b/include/hw/gpio/bcm2838_gpio.h
index 06d48e0c19..f2a57a697f 100644
--- a/include/hw/gpio/bcm2838_gpio.h
+++ b/include/hw/gpio/bcm2838_gpio.h
@@ -14,6 +14,7 @@
 #ifndef BCM2838_GPIO_H
 #define BCM2838_GPIO_H
 
+#include "hw/sd/sd.h"
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
@@ -29,6 +30,10 @@ struct BCM2838GpioState {
 
     MemoryRegion iomem;
 
+    /* SDBus selector */
+    SDBus sdbus;
+    SDBus *sdbus_sdhci;
+    SDBus *sdbus_sdhost;
 
     uint8_t fsel[BCM2838_GPIO_NUM];
     uint32_t lev0, lev1;
-- 
2.34.1

