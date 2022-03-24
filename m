Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3452126lfb;
        Thu, 24 Mar 2022 11:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDdwkads+BkvjCIvOUvQlntrgYm62ddbdfGrdYI5OPl7cSTsX1jnxyZUSa2GKhJlmpTfxG
X-Received: by 2002:a0c:fe47:0:b0:42d:f798:3da5 with SMTP id u7-20020a0cfe47000000b0042df7983da5mr5595097qvs.77.1648146251419;
        Thu, 24 Mar 2022 11:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648146251; cv=none;
        d=google.com; s=arc-20160816;
        b=HLR0rfAhmROkIZg10UAiJvI1aQwfKxF4LcYGQ1EzJwx8/jyBFxr4hIPmE9ZFcN7gft
         QeI4X+ensPy/EpgVakha3FKx3hd/mNhbMh5z6lKgM5FDjuI4WnnKyAY3S9ppK/gqp+Fi
         YqewavzqCKuP5YA3yVeEekWCrftu7z3TNvseJLjhqjannwt7u5mXGhPi5552DI47t5R7
         CIViD9QkvPQS8vkcdxVpZiS3WztdIFXalzBnIgWMZo/4KjyN9RPkL1Uau4Ki9bSZFTLD
         iymMpEw70zEp8wwHxpkP9nkMuf70CR/A4I+EUHiHX4DbiuE4gwGz9lZ9cb7nXHC/Nl9j
         vQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r9B6mV80OgqdiI83ewaqC80HWu/UbOOhNxA7lQxIlI8=;
        b=VgQaMvnIt/42udGNFp+IUiOt/57oHR+vl04PAz6Bx7My7zDpOh/qG7CkHeBSoHxg+w
         SHpTFShIzf6E2hJgDt1kJI29amC13n3FSmMpaTL2FhJV/dyY0mu3xp5n1pdw2AQ8cLYx
         e3pPOXrK8HXEwiKJ1hjyujRdqsY/7amnVi59crZwi5dm+bNC9S//oM7mJxWaZv5ejsxd
         xCiU/xjq7pR9v9cEtAzSbrQFWx8iArGQUIlZ2hz+EEztsXrZ1yIV9eS7QOFf34IPmjbA
         Jjt4OvQ2uf7Vd6yR8rUpHDXdFAJdUnlGVbBO9++W67Qicw3GeQ7gkXoyr8MUg/zBDhBK
         8qKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=msRaTW7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr17-20020a05621408f100b0044116ceb2e3si5049758qvb.187.2022.03.24.11.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Mar 2022 11:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b=msRaTW7W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXS82-0003kZ-Uo
	for alex.bennee@linaro.org; Thu, 24 Mar 2022 14:24:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0V-0005se-4h
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:16:23 -0400
Received: from [2607:f8b0:4864:20::102c] (port=33609
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXS0T-00035f-7w
 for qemu-arm@nongnu.org; Thu, 24 Mar 2022 14:16:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mp11-20020a17090b190b00b001c79aa8fac4so2806414pjb.0
 for <qemu-arm@nongnu.org>; Thu, 24 Mar 2022 11:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r9B6mV80OgqdiI83ewaqC80HWu/UbOOhNxA7lQxIlI8=;
 b=msRaTW7Wh1RhszjFBzjpEZZtDQa/ZjCSSxsduINZ3T3WDQv9OAJKS8KFPC+jJWVwzz
 zckfW1hHBGABJPe70kiYUcvGRsHb/dn/yIWYjSEnIGIahuoY5KYiZokzX3LBrNRgB5FF
 Bpnp80QgKlo+Gh2P5DqGVCGJwr27EzyJzoVhg6iC5sHkjWFypWUU+Z2JzVqVO8Wbupoq
 2OrnflgmfA8gf0ErsVY+y4FCWcZcB5C/aw0qwLxs5reIp8i1pPSGCvY7p7FePyWTtZCW
 KBwD9foKzwuIPWHxNybp+WHyZgS/VXrpaD2NC0WWg8K2Eog1lLbXrQFmfXoqS+olmp2b
 sZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9B6mV80OgqdiI83ewaqC80HWu/UbOOhNxA7lQxIlI8=;
 b=EreVDzv5kJAuCJmb0m70McMQWlxLY7ckRPfi8vKH8TVwOVxH4EcsDi/6TsQPHgZagz
 PSLQ/Ur7BopVdCTckzOUnGp1e1xXG4zwjTst0X7L7eNfKIkRceAuGG4e8CihcuBYMJ1t
 FUeLCd4+Z4JHPTLI+cThEjtXOByLtREscT6WnhdGOZNuYiJfuPW3yGGxGyRxIBwvviVk
 R+zHGogJkN0a37vPiKX1iqDK9XWHXttEaRsWYZ2Vcd9WgyXDbj+H3z8IHXGYTNvIFENw
 +/8u1Pcurtf4w/HlMSPkbuzSA7TpD/DL7nop5lTfy2OG624Xt41xMWdSTpR/zAa/kyh9
 4j/A==
X-Gm-Message-State: AOAM532JGyq020ydJKELZgdIZYPrp6k1KDifAHQI06WeDxRlA/2auf13
 bh7Yz21hLV4SfBvUwsv1OXA81R5PeSf/dA==
X-Received: by 2002:a17:90a:8a91:b0:1c6:9f99:e671 with SMTP id
 x17-20020a17090a8a9100b001c69f99e671mr19859368pjn.100.1648145779767; 
 Thu, 24 Mar 2022 11:16:19 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.101])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a17090a2b8a00b001c6594e5ddcsm3577725pjd.15.2022.03.24.11.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 11:16:19 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
Date: Fri, 25 Mar 2022 02:15:56 +0800
Message-Id: <20220324181557.203805-4-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324181557.203805-1-zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: 29
X-Spam_score: 2.9
X-Spam_bar: ++
X-Spam_report: (2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>, Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KqGr52akjw9M

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/exynos4210.c           | 26 +++++++++++
 hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
 hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
 include/hw/arm/exynos4210.h   | 11 ++---
 include/hw/core/split-irq.h   |  5 +--
 5 files changed, 126 insertions(+), 33 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0299e81f85..28bcf97af9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -288,6 +288,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
     }
+    /* SplitIRQ for internal irq realized here */
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
@@ -299,6 +300,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
     }
+    /* SplitIRQ for external irq realized here */
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
@@ -488,6 +490,30 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
         g_free(name);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.int_combiner_irq); i++) {
+        char *name = g_strdup_printf("internal-combiner-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.int_combiner_irq[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.ext_combiner_irq); i++) {
+        char *name = g_strdup_printf("external-combiner-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.ext_combiner_irq[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->irqs.board_irqs); i++) {
+        char *name = g_strdup_printf("board-irq-%d", i);
+
+        object_initialize_child(obj, name, &s->irqs.board_irqs[i],
+                                TYPE_SPLIT_IRQ);
+        g_free(name);
+    }
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248d..fafcfc484d 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,6 +31,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
@@ -105,16 +106,39 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
+static void split_irq(SplitIRQ *splitter, qemu_irq out1, qemu_irq out2)
+{
+    DeviceState *dev = DEVICE(splitter);
+
+    qdev_prop_set_uint32(dev, "num-lines", 2);
+
+    qdev_realize(dev, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(dev, 0, out1);
+    qdev_connect_gpio_out(dev, 1, out2);
+}
+
+static void passthrough_irq(SplitIRQ *splitter, qemu_irq out)
+{
+    DeviceState *dev = DEVICE(splitter);
+
+    qdev_prop_set_uint32(dev, "num-lines", 1);
+
+    qdev_realize(dev, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(dev, 0, out);
+}
+
 /*
  * Get Combiner input GPIO into irqs structure
  */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
-        int ext)
+void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *combiner,
+                                    int ext)
 {
     int n;
     int bit;
     int max;
-    qemu_irq *irq;
+    SplitIRQ *irq;
 
     max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
         EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
@@ -132,53 +156,74 @@ void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
         /* MDNIE_LCD1 INTG1 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]),
+                        0));
             continue;
 
         /* TMU INTG3 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]),
+                        0));
             continue;
 
         /* LCD1 INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                       irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG35 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG51 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
 
         /* Multi-Core Timer INTG53 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
-                    irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
+            split_irq(&irq[n], qdev_get_gpio_in(combiner, n),
+                    qdev_get_gpio_in(
+                        DEVICE(
+                            &irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]),
+                        0));
             continue;
         }
 
-        irq[n] = qdev_get_gpio_in(dev, n);
+        passthrough_irq(&irq[n], qdev_get_gpio_in(combiner, n));
     }
 }
 
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f115..888233c681 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -29,6 +29,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
+#include "hw/hw.h"
 
 enum ExtGicId {
     EXT_GIC_ID_MDMA_LCD0 = 66,
@@ -197,7 +198,7 @@ static void exynos4210_irq_handler(void *opaque, int irq, int level)
     Exynos4210Irq *s = (Exynos4210Irq *)opaque;
 
     /* Bypass */
-    qemu_set_irq(s->board_irqs[irq], level);
+    qemu_set_irq(qdev_get_gpio_in(DEVICE(&s->board_irqs[irq]), 0), level);
 }
 
 /*
@@ -218,6 +219,12 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
     uint32_t grp, bit, irq_id, n;
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
+        SplitIRQ *splitter = &s->board_irqs[n];
+        DeviceState *dev = DEVICE(splitter);
+
+        qdev_prop_set_uint32(dev, "num-lines", 2);
+        qdev_realize(dev, NULL, &error_fatal);
+
         irq_id = 0;
         if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
                 n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
@@ -229,15 +236,28 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
             /* MCT_G1 is passed to External and GIC */
             irq_id = EXT_GIC_ID_MCT_G1;
         }
+
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1, s->ext_gic_irq[irq_id - 32]);
         } else {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_combiner_irq[n]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->ext_combiner_irq[n]), 0));
         }
     }
     for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
+        SplitIRQ *splitter = &s->board_irqs[n];
+        DeviceState *dev = DEVICE(splitter);
+
+        qdev_prop_set_uint32(dev, "num-lines", 2);
+        qdev_realize(dev, NULL, &error_fatal);
+
         /* these IDs are passed to Internal Combiner and External GIC */
         grp = EXYNOS4210_COMBINER_GET_GRP_NUM(n);
         bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
@@ -245,8 +265,10 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
                      EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
 
         if (irq_id) {
-            s->board_irqs[n] = qemu_irq_split(s->int_combiner_irq[n],
-                    s->ext_gic_irq[irq_id-32]);
+            qdev_connect_gpio_out(dev, 0,
+                                  qdev_get_gpio_in(
+                                      DEVICE(&s->int_combiner_irq[n]), 0));
+            qdev_connect_gpio_out(dev, 1, s->ext_gic_irq[irq_id - 32]);
         }
     }
 }
diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 60b9e126f5..be36665e04 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
+#include "hw/core/split-irq.h"
 
 #define EXYNOS4210_NCPUS                    2
 
@@ -79,11 +80,11 @@
 #define EXYNOS4210_NUM_DMA      3
 
 typedef struct Exynos4210Irq {
-    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
-    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
+    SplitIRQ int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
+    SplitIRQ ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
     qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
-    qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
+    SplitIRQ board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
 
 struct Exynos4210State {
@@ -115,7 +116,7 @@ qemu_irq *exynos4210_init_irq(Exynos4210Irq *env);
 
 /* Initialize board IRQs.
  * These IRQs contain splitted Int/External Combiner and External Gic IRQs */
-void exynos4210_init_board_irqs(Exynos4210Irq *s);
+void exynos4210_init_board_irqs(Exynos4210Irq *irqs);
 
 /* Get IRQ number from exynos4210 IRQ subsystem stub.
  * To identify IRQ source use internal combiner group and bit number
@@ -126,7 +127,7 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit);
 /*
  * Get Combiner input GPIO into irqs structure
  */
-void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
+void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *combiner,
         int ext);
 
 /*
diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
index ff8852f407..eb485dd7a6 100644
--- a/include/hw/core/split-irq.h
+++ b/include/hw/core/split-irq.h
@@ -42,9 +42,6 @@
 
 #define MAX_SPLIT_LINES 16
 
-
-OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
-
 struct SplitIRQ {
     DeviceState parent_obj;
 
@@ -52,4 +49,6 @@ struct SplitIRQ {
     uint16_t num_lines;
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
+
 #endif
-- 
2.34.0

