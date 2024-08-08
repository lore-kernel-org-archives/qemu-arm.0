Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358294njc;
        Wed, 7 Aug 2024 19:51:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUhicfgw7KCRXWozDxGCW1Q7bWnsj6FSdSf/qenuqyYSf0eNQF1JEiu3Jlcj2IJLx6CXsoKirRwHy0Oa6LqpgYynr4phQoa
X-Google-Smtp-Source: AGHT+IHMMy1qrNXLhnV72YyxjvaUSUIXD1um8HjHGoDOfGXTKyzTNJwvTgyl5wRgUQ3ltuYz+cmi
X-Received: by 2002:a05:622a:4d97:b0:446:5ac5:f9dd with SMTP id d75a77b69052e-451d4214361mr8906091cf.14.1723085485556;
        Wed, 07 Aug 2024 19:51:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085485; cv=none;
        d=google.com; s=arc-20160816;
        b=0YsUxiBHT76R8trv2dkCXm0Wjb8mBRyDpNfOJDfK/HhkOeXU/qSw3qBCx+r0tadOKK
         ss/FmriNpQVmhKISlFVtYqVXox0H28mX03NxMRCIWjWBlrffYT6VfOlvBsDXI+gF0Opq
         f406AYJ5HNlWZyJTJ7gdskeW/eMyi8Fkm9sS7BAc/MOAMdGP0ZoQFoTef/9sjzLoPyls
         /B5HkvMfUk5x3SnDvliCtyLNC+f9ccTtkuuh1eMx95A6WFJG6+o4fD54s31Vc7H8Cvbe
         gJ5HyaRqsBpk+fDg34cEelvOl4vrw50TeWWiOPEqmNIT3IyaJvI1/IroYavAfpOrHnN4
         /8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=75qVw0A69s4WPWCxeO4vAxiB1n5P2oQb3D1cv6e1Crs=;
        fh=FCtYWwOtEgMeIuI7wG7f687kK1NW14MjWu/nT+chD9o=;
        b=JANwtPmRigdmyAz4Qco4agBrFA1focJQ3kZjxox8P5wFcZTV7gvspv85vz02mLcpqP
         ZR4hdtFsGmaQt6O2nQNBo1cn8UiuRZFY5KRf8jprDKt+AF0t7v4UjwO437Yhk1pS0tWC
         hGS7osFCR7n64F41Ud/ZyAtJkyFbEb8QzeLqZVCSP//H7nM64Qyj8EqeU2/egk6yIN6E
         s+sSMBt8gKGbsmcEo8XhVguJ/vZ+SJYEeTXyxPr9nTwjRgf3GWcNid/n8dz/+bXNdfAP
         2PIzM/vcudIqKjOFRmREVp95FPufOyvjk8eWR3uZmYhNdem9skJ5McHGJmQHX5sKaxLn
         IRIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-451c883208fsi30760641cf.599.2024.08.07.19.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:51:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDq-0007z2-Ta; Wed, 07 Aug 2024 22:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDp-0007tJ-HY; Wed, 07 Aug 2024 22:49:49 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDo-0008AE-3J; Wed, 07 Aug 2024 22:49:49 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 08/11] aspeed/soc: introduce a new API to get the INTC
 orgate information
Date: Thu, 8 Aug 2024 10:49:13 +0800
Message-ID: <20240808024916.1262715-9-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R3a1yqllAYi9

Currently, users can set the intc mapping table with
enumerated device id and device irq to get the INTC orgate
input pins. However, some devices use the continuous bits number in the
same orgate. To reduce the enumerated device id definition,
create a new API to get the INTC orgate index and source bit number
if users only provide the start bus number of device.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4257b5e8af..0bbd66110b 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -164,6 +164,11 @@ struct gic_intc_irq_info {
     const int *ptr;
 };
 
+struct gic_intc_orgate_info {
+    int index;
+    int int_num;
+};
+
 static const struct gic_intc_irq_info aspeed_soc_ast2700_gic_intcmap[] = {
     {128,  aspeed_soc_ast2700_gic128_intcmap},
     {129,  NULL},
@@ -193,6 +198,27 @@ static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
     return qdev_get_gpio_in(DEVICE(&a->gic), sc->irqmap[dev]);
 }
 
+static void aspeed_soc_ast2700_get_intc_orgate(AspeedSoCState *s, int dev,
+    struct gic_intc_orgate_info *orgate_info)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(aspeed_soc_ast2700_gic_intcmap); i++) {
+        if (sc->irqmap[dev] == aspeed_soc_ast2700_gic_intcmap[i].irq) {
+            assert(aspeed_soc_ast2700_gic_intcmap[i].ptr);
+            orgate_info->index = i;
+            orgate_info->int_num = aspeed_soc_ast2700_gic_intcmap[i].ptr[dev];
+            return;
+        }
+    }
+
+    /*
+     * Invalid orgate index, device irq should be 128 to 136.
+     */
+    g_assert_not_reached();
+}
+
 static uint64_t aspeed_ram_capacity_read(void *opaque, hwaddr addr,
                                                     unsigned int size)
 {
-- 
2.34.1

