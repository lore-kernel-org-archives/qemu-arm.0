Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1521747lfc;
        Tue, 12 Oct 2021 00:39:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl3rMZcZWQVXHAo4+FFhtmqGyPMR+yTSv7PYr/ST/vq9CIDWVCDlvX/6okJUMT0QVH+wMh
X-Received: by 2002:a05:620a:1709:: with SMTP id az9mr5258827qkb.191.1634024375257;
        Tue, 12 Oct 2021 00:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024375; cv=none;
        d=google.com; s=arc-20160816;
        b=v2CkrrnhlSJO42B8C37syTvaZQ0aadji1f+hZms31FRNW7FEgfqsPV0VE9uhiEF9am
         rwPx8NBymWipIIA44RhiTVzwwOaEKFQkm3ru5mGyuF5ikCfPkzsrgPB8PspcPDb1yarf
         RrhGLoS+UdK9pUF4sxZ4fOy+VgUbnWj27Ic+QOlmnSSqKDJ/8YEsoE6J0g2H54MlqHh4
         8OIq1Z2qBnt2502uBB3sV9smhNxV4d0w1ROm5c7lYDt4JT1CJsJqKWce0ev8nmiF5UW2
         2TUarJ6EGqCJPSiMrBBhG60iBRfJnfkxGbP+Frt5e2DJ1nETHcNickYU/qcxSvIWsQPF
         BOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fC7gWQHI3eMfjp1HNcUHHZreWn1hoLK6foUgOd25YX4=;
        b=qflAud9NusXvc+mYH0EM2dH76MyfqRXCs3La6IqG7RddKpVLDbh5Gy7SrgFyKMF5zg
         UDnpKbJhRZU/Mtg9E8cF3PNx6fzq8S1wKoKQ6TvG0bvz1vlZdwUlKBFrRE5kqtVoW0BK
         QDf0jRNW11KSq5ClrqmEMeeWOCFv9XHt0ttkB59VYJoQnXG48IsRlYq3X6K2RzteXokG
         VwdA2DVsZY37DWutd1Y4PV2L0hsHNsWToNW3Kx51oqon/DjcxxwY4USvJ3i8L7IJ+Dm+
         9Fmu0M0J+w789TjNPn3RoZAkoGnqA1b4AUmCsOYvBfDlHdy8hCXIKiXBwTpWqYQHdpxw
         qYFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si8977395qva.99.2021.10.12.00.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCNq-0003C1-Gq
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1maCMA-0000R4-40; Tue, 12 Oct 2021 03:37:50 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1maCM1-00052I-1d; Tue, 12 Oct 2021 03:37:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 970C821DF4;
 Tue, 12 Oct 2021 07:37:38 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006db9b74c7-863c-45e6-9fc5-eb521cf5148b,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 16/18] hw/arm: Integrate ADC model into Aspeed SoC
Date: Tue, 12 Oct 2021 09:37:26 +0200
Message-ID: <20211012073728.257748-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d9bf7613-06ea-4707-a3de-cb6f0973af05
X-Ovh-Tracer-Id: 4269975398880217961
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Wa/Bx+lCVi1

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20211005052604.1674891-3-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  2 ++
 hw/arm/aspeed_ast2600.c     | 11 +++++++++++
 hw/arm/aspeed_soc.c         | 11 +++++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 87d76c92598b..8139358549df 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -15,6 +15,7 @@
 #include "hw/cpu/a15mpcore.h"
 #include "hw/intc/aspeed_vic.h"
 #include "hw/misc/aspeed_scu.h"
+#include "hw/adc/aspeed_adc.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/misc/aspeed_xdma.h"
 #include "hw/timer/aspeed_timer.h"
@@ -53,6 +54,7 @@ struct AspeedSoCState {
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
+    AspeedADCState adc;
     AspeedSMCState fmc;
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a70e4c48a73c..0384357a9510 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -148,6 +148,9 @@ static void aspeed_soc_ast2600_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
@@ -322,6 +325,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4f013dd5cd9c..7d53cf2f5133 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -162,6 +162,9 @@ static void aspeed_soc_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
+
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
@@ -287,6 +290,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     /* UART - attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
-- 
2.31.1

