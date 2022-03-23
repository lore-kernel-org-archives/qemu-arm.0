Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2579322lfb;
        Wed, 23 Mar 2022 10:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznSyjUZrj01/PnVF8W58cACtPRHCyGZ7fBipKqJmRfjj4QY7o/OaPJYc9j15K2qhtwlVBg
X-Received: by 2002:a25:9845:0:b0:628:99a6:55ed with SMTP id k5-20020a259845000000b0062899a655edmr1015205ybo.221.1648056997305;
        Wed, 23 Mar 2022 10:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648056997; cv=none;
        d=google.com; s=arc-20160816;
        b=Ok2N6h5YOyNBPkbML14fq90dza9An/ILnCgShtuPFrW0i2OsTc/5RI3O9n5MbI+EP2
         ovI35SHi8IZzcK7I/txlvRIXgIVBxCtOqz10hQJh130bCgkL5g1G4i72yGsO1LzmbkYa
         CAbvGur4jQ/yJyVKBVnHISGsj+1F3ih3HcPxNCCbSatwD/YaF9Or82KSJl6XStZwEYpg
         LFJM4BfDXpqosmWgwMkZvuoCW13id0702sbWWioRVjHufbAxJP6ZqqrczH5G8b5rOUNq
         xlaHcSreaCPRtrUS18f+8+Ka+NrMjUGkV0Y72Q/0fdxD+okde5sKQ9zdZTl4/uyaTQBO
         eudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GCsELW2QXqJF8bCAIFTcBQvHzfwsRKTCwEsXwAqek4w=;
        b=ERXhKnUR1AQuXCRtzdDeYF2BkH0IvPdLiUlwErhaQQZuso3KP14oCJUreKG0w0wRFL
         lqFn7qv6qhSraiFA2NXzYezFcsK3rpUxHRnlJ6GIlZVWO6tXy930OLZt4I0PF1OdJXds
         CeivzbLoQSMpBntxCR014kw+TTkjNXq4kkvzr6b2TnklC9bLfpRauh7qYLKOorkjGjrS
         fTKoaP/j7IPX93D/8Lftjds+ppiLIJSR1JMciabCDLpR5hSHT9KbBfK17LUs2x5/5TA/
         KNxue6gpHlT9jDhjDosrnRPT5ob7YHM+SUrAUwTeFcE9TAt3PmWYav/7gO1zkoMn6gbP
         8vxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="8G1Fo/Lt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a25090f000000b00633ccab81d0si13688850ybj.463.2022.03.23.10.36.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Mar 2022 10:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartx-com.20210112.gappssmtp.com header.s=20210112 header.b="8G1Fo/Lt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nX4uS-00005t-Ks
	for alex.bennee@linaro.org; Wed, 23 Mar 2022 13:36:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uH-0008Ua-2N
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:25 -0400
Received: from [2607:f8b0:4864:20::52b] (port=44015
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4uF-0005VP-Ee
 for qemu-arm@nongnu.org; Wed, 23 Mar 2022 13:36:24 -0400
Received: by mail-pg1-x52b.google.com with SMTP id c2so1704242pga.10
 for <qemu-arm@nongnu.org>; Wed, 23 Mar 2022 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCsELW2QXqJF8bCAIFTcBQvHzfwsRKTCwEsXwAqek4w=;
 b=8G1Fo/LtG+qvDUJoacfKR5i0ISORzoj/q0mLJFWlp7UCcqBq8Tw1PLwhHODtHdJvn/
 Na+9mBMqkYTDBSx7F3kCfm6KE41HBhVus8t3EflXRhRgCsepMjzjlCDdyieE9egYoBoB
 ahtzQowWnAA+lVhVfDicbWzT9fXLn5Ueiv+LzNw1Bbpbon0epS/MV6ifXyW7kyvP8n1L
 YcjVDfg+N7Pl7/uMlb9LA8Aqv9jDXnRwL2uRErrFxLku3bAA4J5wHF/e3FEfMIPnOvA2
 LMUPqQSd51l1/6QYApGdGdpi9yi2JMrEN3n0oGDmnnZuZSgGhuvSqFBWsAHseav18bKR
 35kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCsELW2QXqJF8bCAIFTcBQvHzfwsRKTCwEsXwAqek4w=;
 b=2GAjMyWpN2FTLslXLTFzEkbHjN7T6S0hEDdut5NDFl78qPYHH6edKernB+SiR0Izvp
 9maBZM6Vq2MD1pLagQz9h0oP1rb1hXJ4wrt6FQRt0b6uNiMwURo56n2dSoUDQQV7IgjI
 sN7m40wUVjl1/KgcRrEwhWgEhLeJ1pPIE/LvZTUAezxk0ZB4v40Vfv5B0+ZAHIjN9Sge
 nmGOKsyum7BeMSJE6MJeb0oOKhhI+BkBGNtfwtKkhrYnmOtRI/RnvSJZCswKofHlgIh1
 ZGVOAJ7+39ngrHFy/NoNU5rr9LPR/M4ZT7mKVqTom6IF1AgBqMlefw4hfFj0SbYPOJ7N
 0KEA==
X-Gm-Message-State: AOAM530ZQu9ZGO224g4Jrbd29uFnUnEUJOK6trDLiu0lH16a4HaHZU8G
 fh4nguBx+tm687vTPJtip8gtrg==
X-Received: by 2002:a63:481b:0:b0:378:9b24:5163 with SMTP id
 v27-20020a63481b000000b003789b245163mr782851pga.224.1648056982228; 
 Wed, 23 Mar 2022 10:36:22 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:21 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] hw/intc/exynos4210_combiner: replace 'qemu_split_irq'
 with 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:41 +0800
Message-Id: <20220323173543.146442-4-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52b;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
X-TUID: hLipnV00tgyM

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/intc/exynos4210_combiner.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index 4534ee248d..18dade35d3 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -31,10 +31,12 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
+#include "qapi/error.h"
 
 #include "hw/arm/exynos4210.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
+#include "hw/core/split-irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
 
@@ -105,6 +107,22 @@ static const VMStateDescription vmstate_exynos4210_combiner = {
     }
 };
 
+static qemu_irq split_irq(qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        hw_error("exynos4210.combiner: unable to realize split irq device");
+        return NULL;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+
+    return qdev_get_gpio_in(splitter, 0);
+}
+
 /*
  * Get Combiner input GPIO into irqs structure
  */
@@ -132,48 +150,48 @@ void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs, DeviceState *dev,
         /* MDNIE_LCD1 INTG1 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(0, bit + 4)]);
             continue;
 
         /* TMU INTG3 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(3, 4):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(2, bit)]);
             continue;
 
         /* LCD1 INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 0) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 3):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(11, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG12 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 8):
-               irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+               irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                        irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG35 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(35, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG51 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(51, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
 
         /* Multi-Core Timer INTG53 */
         case EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 4) ...
              EXYNOS4210_COMBINER_GET_IRQ_NUM(53, 8):
-            irq[n] = qemu_irq_split(qdev_get_gpio_in(dev, n),
+            irq[n] = split_irq(qdev_get_gpio_in(dev, n),
                     irq[EXYNOS4210_COMBINER_GET_IRQ_NUM(1, bit + 4)]);
             continue;
         }
-- 
2.34.0

