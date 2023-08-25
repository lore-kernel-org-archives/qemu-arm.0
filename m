Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1355070ejc;
        Fri, 25 Aug 2023 05:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErHMeu+rQwVPSHZgeTOjurDj8e5a47sq6h/Yr1svDOTvc+j+DLOA6UjXw5wPIsERxiibdT
X-Received: by 2002:a5d:4041:0:b0:317:3f70:9dc4 with SMTP id w1-20020a5d4041000000b003173f709dc4mr14446421wrp.31.1692966120811;
        Fri, 25 Aug 2023 05:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692966120; cv=none;
        d=google.com; s=arc-20160816;
        b=NsSzPetsUMzyn9XeVdK9xGZKqOYBtag9Ak/bEegYsrczlDF68GMk8gNKy2yVUeE1GX
         S8pgFdiPbHBAphEHnWbV8BX+ep7M/azzGP4dVClZaR9hMTgTG4XI8flIO0oyTQvgf9BX
         AKlPx/9CLKnZPOk6njfTJYPkmQIoe6i/kYACOqEstmqSyewaNcBMjJecHeUx1ZzgAmf9
         A9MWnHBfHUyWFIlYN838PFQ6ZrQfinsorv6zeXNeETxrmsanUccks7lv9XzDtFqpww3m
         QlwdJHqUxV10fGIi7L1vUgy/wVJ61KH08WH6TQ3wkenR9XacUM5kJsXgqdCFJw10L9yl
         6J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=YjiCyUF3k9kIQcxswd+vWL9fikTL6oMLTA/wDjo5J90=;
        fh=kHl+ykYmH+sp39y94etEF/slFRRxb6k9dC2SJ6bxnkk=;
        b=uQxeRkDobvo91xnq4951L2iIX/RO9LqPmXKR9uaU4oI2W8s4zBoGf16/0K6npmvrji
         qwcQ3rF8/SO7JXf9z8GnMf1DX8aBqlGA3R3fJPtbgI77u47vLkHt3C42Bc6KtAxE67S0
         EVsobJXKDnjIYkFYBOrrlZx5DKvQTEMvDnWt29uVeV0YnfnRKFJnCzsbKHlrmLZi2mTM
         xS0ahffMDarzzgUSY983YdeUCxvKCqt/ZCScM3ThxnTbmWijmcZf1iXSLoNWsNzy2JKB
         2/y/07BIROEwCYWuULxUikOiZw+WeC6jW8JktdQPn+CYL/k+cU5my2ElzJmfQ7Rgumwg
         N2uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020adfed02000000b00317e9f8f19bsi724855wro.1000.2023.08.25.05.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Aug 2023 05:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qZVot-0003xK-Af; Fri, 25 Aug 2023 08:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoZ-0003wC-Ed; Fri, 25 Aug 2023 08:21:24 -0400
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1qZVoW-0004wV-Ka; Fri, 25 Aug 2023 08:21:22 -0400
Received: by mail.gandi.net (Postfix) with ESMTPSA id D79F060003;
 Fri, 25 Aug 2023 12:21:17 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] Remove i.MX7 IOMUX GPR device from i.MX6UL
Date: Fri, 25 Aug 2023 14:20:51 +0200
Message-Id: <48681bf51ee97646479bb261bee19abebbc8074e.1692964892.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692964891.git.jcd@tribudubois.net>
References: <cover.1692964891.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jcd@tribudubois.net
Received-SPF: pass client-ip=2001:4b98:dc4:8::223;
 envelope-from=jcd@tribudubois.net; helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i+uyEKbrgpOv

i.MX7 IOMUX GPR device is not equivalent to i.MX6UL IOMUXC GPR device.
In particular, register 22 is not present on i.MX6UL and this is actualy
The only register that is really emulated in the i.MX7 IOMUX GPR device.

Note: The i.MX6UL code is actually also implementing the IOMUX GPR device
as an unimplemented device at the same bus adress and the 2 instantiations
were actualy colliding. So we go back to the unimplemented device for now.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx6ul.c         | 11 -----------
 include/hw/arm/fsl-imx6ul.h |  2 --
 2 files changed, 13 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 2189dcbb72..0fdd2782ba 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -63,11 +63,6 @@ static void fsl_imx6ul_init(Object *obj)
      */
     object_initialize_child(obj, "snvs", &s->snvs, TYPE_IMX7_SNVS);
 
-    /*
-     * GPR
-     */
-    object_initialize_child(obj, "gpr", &s->gpr, TYPE_IMX7_GPR);
-
     /*
      * GPIOs 1 to 5
      */
@@ -537,12 +532,6 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                             FSL_IMX6UL_WDOGn_IRQ[i]));
     }
 
-    /*
-     * GPR
-     */
-    sysbus_realize(SYS_BUS_DEVICE(&s->gpr), &error_abort);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpr), 0, FSL_IMX6UL_IOMUXC_GPR_ADDR);
-
     /*
      * SDMA
      */
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 9ee15ae38d..3bec6bb3fb 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -22,7 +22,6 @@
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
 #include "hw/misc/imx7_snvs.h"
-#include "hw/misc/imx7_gpr.h"
 #include "hw/intc/imx_gpcv2.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "hw/gpio/imx_gpio.h"
@@ -74,7 +73,6 @@ struct FslIMX6ULState {
     IMX6SRCState       src;
     IMX7SNVSState      snvs;
     IMXGPCv2State      gpcv2;
-    IMX7GPRState       gpr;
     IMXSPIState        spi[FSL_IMX6UL_NUM_ECSPIS];
     IMXI2CState        i2c[FSL_IMX6UL_NUM_I2CS];
     IMXSerialState     uart[FSL_IMX6UL_NUM_UARTS];
-- 
2.34.1

