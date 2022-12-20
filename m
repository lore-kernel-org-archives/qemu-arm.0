Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4423409ejb;
        Tue, 20 Dec 2022 07:37:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6TyWA0dR+WNoX7FQ27qpjwxcBQYEQKBE7El5RXtRlW/6l+s9d+wauuyt7la7HLA1pqDVxv
X-Received: by 2002:a05:622a:1309:b0:3a5:258c:d6a5 with SMTP id v9-20020a05622a130900b003a5258cd6a5mr83546387qtk.12.1671550634681;
        Tue, 20 Dec 2022 07:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671550634; cv=none;
        d=google.com; s=arc-20160816;
        b=HE3B1GU5xgMvAUEduSHoAy4lgJhf+UonO/C5w9jXIYaz/rZ8w4qi/5ASEdRHnfswUj
         5PLDSZhtEa7dNd72X2GQ23ZXtHFW7txaqKe5usXm7pdnwKcHxIo+DPpAFJ/tdzo98H4x
         In/zxCFkTuaJ363P86O9xCv0TWo562l0W2H58s8oiWn1zoo9oeaS2voO+HzkjCz64vRe
         R9+1ZCN4pTluCXbfrQpBrxEyP+dgonbnd9rRoQ3ZG1AadJzZ5XmFw0mmpBk974drq+GC
         fgS5MrPErlw1xSaafh7kVXjjtTPo97hg8MnrllHg5YBHj+yYnU/Cq5l1UCqAsz+aFlVd
         81mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OhYTU1aJZb39lmftLIYLDD1VOLE6G+xxYeYH0iJptug=;
        b=XYxlQBMbApdpWcw1q15x+L7T+WP17oh8W/5QMMyUhpQVzC6UcO2h+MN4y8VKIWrEAw
         lo1f37qwrhavIYQ/qfm5FMi+GtZ5tEH43ENOeDgbADJ+G9GUvQHdkNuFDSuRfvPyphS5
         2OOxd7VVqHuFVqDDAubZZ94G4BAzzWvA5nrmyruqpOg7d6DitYgIfkoBy4B48KEftmkg
         BFQD2xnwvpY+78APGVj/2VftFAVWZIwFdzQ6QaY3eoLdadipukNbEvfGHb1YnaasQLkK
         uO5/ZFyr3vH4YFgJRfy4pf8S0PEmCFNyxtVvyWnp6Ll9lwdn/nFoqr2NG39ul17qG/eT
         +nAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15-20020ac85e0f000000b003a5285cd9f9si5686471qtx.35.2022.12.20.07.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 07:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7eg1-0006ye-TC; Tue, 20 Dec 2022 10:37:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7eg0-0006vI-Pp
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:08 -0500
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7efy-0003wj-Or
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:08 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id AFE5740007;
 Tue, 20 Dec 2022 15:37:01 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH] i.MX7D: Connect GPT timers to IRQ
Date: Tue, 20 Dec 2022 16:36:59 +0100
Message-Id: <63a81cac41c769989e23caebb476dc078e83731d.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4b98:dc4:8::222;
 envelope-from=jcd@tribudubois.net; helo=relay2-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XTIynWI3BXYb

So far the GPT timers were unable to raise IRQs to the processor.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx7.c         | 10 ++++++++++
 include/hw/arm/fsl-imx7.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index cc6fdb9373..146bb559bb 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -219,9 +219,19 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_GPT4_ADDR,
         };
 
+        static const int FSL_IMX7_GPTn_IRQ[FSL_IMX7_NUM_GPTS] = {
+            FSL_IMX7_GPT1_IRQ,
+            FSL_IMX7_GPT2_IRQ,
+            FSL_IMX7_GPT3_IRQ,
+            FSL_IMX7_GPT4_IRQ,
+        };
+
         s->gpt[i].ccm = IMX_CCM(&s->ccm);
         sysbus_realize(SYS_BUS_DEVICE(&s->gpt[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPTn_IRQ[i]));
     }
 
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 1c5fa6fd67..50f19d8db0 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -235,6 +235,11 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
+    FSL_IMX7_GPT1_IRQ     = 55,
+    FSL_IMX7_GPT2_IRQ     = 54,
+    FSL_IMX7_GPT3_IRQ     = 53,
+    FSL_IMX7_GPT4_IRQ     = 52,
+
     FSL_IMX7_WDOG1_IRQ    = 78,
     FSL_IMX7_WDOG2_IRQ    = 79,
     FSL_IMX7_WDOG3_IRQ    = 10,
-- 
2.34.1

