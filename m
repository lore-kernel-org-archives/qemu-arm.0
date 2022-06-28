Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3319173lft;
        Tue, 28 Jun 2022 08:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sxihVff9/GEgXyW2BSbef8F5oUoEvxd9ZhcoxOqXB2wB4DJ/7omCrTo0ef9mzhpyOdvQeG
X-Received: by 2002:ac8:5a06:0:b0:317:a67e:343f with SMTP id n6-20020ac85a06000000b00317a67e343fmr13752129qta.557.1656431324924;
        Tue, 28 Jun 2022 08:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656431324; cv=none;
        d=google.com; s=arc-20160816;
        b=dR3vxjLjpjX2IOFjDEeD78izaYWbs9qKjF37Y6sBUKjP9MjRoh35+IabP7d2R8Wd4f
         IqJfBZWYHBWm4ONbQQTPacYMw2mTJ1cP/bzcafhwd5IMuE9zZbi5YudRRe15vMt+wvYW
         GYkd6uVlw/mewNqHkABJo4GIXcLBYjVS6go5hgK3LTtwk/L3OlyzGlhedWaQyOvvQNtR
         ore+eZitfRRwmde9HUv3UD6idbkaV/KNpew9mRBICKNSOvbJIcdz5+n+uPPkZA1vODLG
         9Ht1lWL4H7Gc6m+uE+MOZC8SR4bG/MM5NjYnej2Kk/eQxvteVeeunhwisIcJ2OVH08r+
         grFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=s1PXF7Cu0NmbZB6+rz0J4sLqVhpvliG8HNlHS2aq57k=;
        b=Z9CHbmFAIFs0zdctDoMxXc/T8HP3gNeozFOu9BT7+Fssb0MD2NLxzHco8DtOe+Fw27
         thKRvahJ19tybgY3uuSYg/6XFv3zb1LAHqt3sdp4PZlzdOXjoXbL6AYUqdZ8dY+Dcip6
         w1bFlQc8j1uvLJWNnjfJz/Wqb+OfID1l7Mc64gzXiSzI5hPqn3uDF1ibjM0XjUF4d9/e
         4pL2dQSoxZsNJWoGA46Cb8MO9GEf+zPv4fBHEJK2WucAuDaO5Me/FUi53NGhneEPG1DM
         xHaC+3h74FPAks1heq2Pe36lWaCK4HHl3MQxvsDOJcUm6BWLhxGZXlloxjNQZp6Vc9WO
         xZrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13-20020ad45c4d000000b004703d3ebeedsi7360718qva.224.2022.06.28.08.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jun 2022 08:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6DSG-0003mH-Dj
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 11:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRY-0003iH-T6; Tue, 28 Jun 2022 11:48:01 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:48393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xpXT=XD=kaod.org=clg@ozlabs.org>)
 id 1o6DRW-0001oK-9m; Tue, 28 Jun 2022 11:48:00 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LXTWZ6N1kz4xZ7;
 Wed, 29 Jun 2022 01:47:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LXTWX66Ncz4xR1;
 Wed, 29 Jun 2022 01:47:52 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/3] aspeed: sbc: Allow per-machine settings
Date: Tue, 28 Jun 2022 17:47:40 +0200
Message-Id: <20220628154740.1117349-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628154740.1117349-1-clg@kaod.org>
References: <20220628154740.1117349-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=xpXT=XD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kQcHNCg3z9H

From: Joel Stanley <joel@jms.id.au>

In order to correctly report secure boot running firmware the values
of certain registers must be set.

We don't yet have documentation from ASPEED on what they mean. The
meaning is inferred from u-boot's use of them.

Introduce properties so the settings can be configured per-machine.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_sbc.h | 13 ++++++++++++
 hw/misc/aspeed_sbc.c         | 41 ++++++++++++++++++++++++++++++++++--
 2 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 67e43b53ecc3..405e6782b97a 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -17,9 +17,22 @@ OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 
 #define ASPEED_SBC_NR_REGS (0x93c >> 2)
 
+#define QSR_AES                     BIT(27)
+#define QSR_RSA1024                 (0x0 << 12)
+#define QSR_RSA2048                 (0x1 << 12)
+#define QSR_RSA3072                 (0x2 << 12)
+#define QSR_RSA4096                 (0x3 << 12)
+#define QSR_SHA224                  (0x0 << 10)
+#define QSR_SHA256                  (0x1 << 10)
+#define QSR_SHA384                  (0x2 << 10)
+#define QSR_SHA512                  (0x3 << 10)
+
 struct AspeedSBCState {
     SysBusDevice parent;
 
+    bool emmc_abr;
+    uint32_t signing_settings;
+
     MemoryRegion iomem;
 
     uint32_t regs[ASPEED_SBC_NR_REGS];
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index bfa8b81d01c7..3946e6179bdd 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
 #include "hw/misc/aspeed_sbc.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
@@ -19,6 +20,27 @@
 #define R_STATUS        (0x014 / 4)
 #define R_QSR           (0x040 / 4)
 
+/* R_STATUS */
+#define ABR_EN                  BIT(14) /* Mirrors SCU510[11] */
+#define ABR_IMAGE_SOURCE        BIT(13)
+#define SPI_ABR_IMAGE_SOURCE    BIT(12)
+#define SB_CRYPTO_KEY_EXP_DONE  BIT(11)
+#define SB_CRYPTO_BUSY          BIT(10)
+#define OTP_WP_EN               BIT(9)
+#define OTP_ADDR_WP_EN          BIT(8)
+#define LOW_SEC_KEY_EN          BIT(7)
+#define SECURE_BOOT_EN          BIT(6)
+#define UART_BOOT_EN            BIT(5)
+/* bit 4 reserved*/
+#define OTP_CHARGE_PUMP_READY   BIT(3)
+#define OTP_IDLE                BIT(2)
+#define OTP_MEM_IDLE            BIT(1)
+#define OTP_COMPARE_STATUS      BIT(0)
+
+/* QSR */
+#define QSR_RSA_MASK           (0x3 << 12)
+#define QSR_HASH_MASK          (0x3 << 10)
+
 static uint64_t aspeed_sbc_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AspeedSBCState *s = ASPEED_SBC(opaque);
@@ -80,8 +102,17 @@ static void aspeed_sbc_reset(DeviceState *dev)
     memset(s->regs, 0, sizeof(s->regs));
 
     /* Set secure boot enabled with RSA4096_SHA256 and enable eMMC ABR */
-    s->regs[R_STATUS] = 0x000044C6;
-    s->regs[R_QSR] = 0x07C07C89;
+    s->regs[R_STATUS] = OTP_IDLE | OTP_MEM_IDLE;
+
+    if (s->emmc_abr) {
+        s->regs[R_STATUS] &= ABR_EN;
+    }
+
+    if (s->signing_settings) {
+        s->regs[R_STATUS] &= SECURE_BOOT_EN;
+    }
+
+    s->regs[R_QSR] = s->signing_settings;
 }
 
 static void aspeed_sbc_realize(DeviceState *dev, Error **errp)
@@ -105,6 +136,11 @@ static const VMStateDescription vmstate_aspeed_sbc = {
     }
 };
 
+static Property aspeed_sbc_properties[] = {
+    DEFINE_PROP_BOOL("emmc-abr", AspeedSBCState, emmc_abr, 0),
+    DEFINE_PROP_UINT32("signing-settings", AspeedSBCState, signing_settings, 0),
+};
+
 static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -112,6 +148,7 @@ static void aspeed_sbc_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_sbc_realize;
     dc->reset = aspeed_sbc_reset;
     dc->vmsd = &vmstate_aspeed_sbc;
+    device_class_set_props(dc, aspeed_sbc_properties);
 }
 
 static const TypeInfo aspeed_sbc_info = {
-- 
2.35.3

