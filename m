Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1450120lfb;
        Mon, 6 Jun 2022 08:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDnBur8wPwyadOOIBO/yH8o8Bf5QpOtmBRfaEGBBf9/pm/WmwfhTFmKWJgJCT6+QZtLPNv
X-Received: by 2002:ac8:7e83:0:b0:304:b3c4:b297 with SMTP id w3-20020ac87e83000000b00304b3c4b297mr18701845qtj.668.1654529133053;
        Mon, 06 Jun 2022 08:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654529133; cv=none;
        d=google.com; s=arc-20160816;
        b=O9g39swHvq+J25Wsf22382dClqTFh1lqsY0SE/zaAAOGncM1D8GukIVK4MDsm1QHNh
         gF5Ef/V2YzQFGYOc6KWLypOjJMudikcZmhHLbwm2DVE32wnvYQuY7wxjOuGkwk8F82iI
         +KQk2hIkUr+Syq5Sk9Z2k7MhQXCkelQmi2AFlffkR3rVZ5Wk0yn15de5Q5fiG9WL5gax
         bDeuPsAX8OVqV/wNWiZkKYCnEBqtzdY3LPcOJ8g7raFG0O88E+6Nso7BNgB/Mw1VVzsg
         3miXbAR34YEYFyovSjAALGXFI2DdWMImR1IrUNYsjBzmyJLt/bMEYzRkcbLdaGlpMCJO
         jyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=AzgMgXvcXeA7rgVOZzoTocbZdaIm0WyonFGGfUbZKa4=;
        b=q8AhRJeqokIIwdA2K5Iqy7o9HaiQ3IsUAA+Qr0Gp82qUrb6DxJbiwfP6fL76YCZWnA
         wJRrBzfbqgE1q6qX+45/ORtUaRo6IuB67SEy4HnEKVQyMpDXUFBdiG1Y8p1vI/az3oB/
         xk69NhGcYcf/WkpOSoOmybNDQkSwa9XTjJNnsvyIjFvO9mHW+UtaK4g7bJ89CCzVrMNH
         4qaQD097d04CKdjK6MSSOIqOCULFI39kDTA2M4m0rzt77d4qvMZRLFN2izq1AxbNWVsf
         VR8UkFNTFpAk5MXpAovHWExpU28PTV9nvvH8kJS91sDSuxUGrCBVxP/Kbgbbpb7jaKpd
         HHTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020a05620a120500b006a6a547ea46si4620270qkj.188.2022.06.06.08.25.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 08:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyEbk-0005re-6V
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 11:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELp-0006KC-7P; Mon, 06 Jun 2022 11:09:05 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:47037
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELn-00069K-5i; Mon, 06 Jun 2022 11:09:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxhr2sC9z4xZf;
 Tue,  7 Jun 2022 01:09:00 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxhl0XYDz4xZY;
 Tue,  7 Jun 2022 01:08:54 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 12/21] aspeed/i2c: Add ast1030 controller models
Date: Mon,  6 Jun 2022 17:07:23 +0200
Message-Id: <20220606150732.2282041-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: lbdM06jSb5/e

Based on :
  https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg06017.html

Cc: Troy Lee <troy_lee@aspeedtech.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |  1 +
 hw/i2c/aspeed_i2c.c         | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 506bcf1a9daf..79c6779c6c1e 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -30,6 +30,7 @@
 #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
 #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
 #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
+#define TYPE_ASPEED_1030_I2C TYPE_ASPEED_I2C "-ast1030"
 OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8425e928890a..5fce516517a5 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1185,6 +1185,29 @@ static const TypeInfo aspeed_2600_i2c_info = {
     .class_init = aspeed_2600_i2c_class_init,
 };
 
+static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedI2CClass *aic = ASPEED_I2C_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 I2C Controller";
+
+    aic->num_busses = 14;
+    aic->reg_size = 0x80;
+    aic->gap = -1; /* no gap */
+    aic->bus_get_irq = aspeed_2600_i2c_bus_get_irq;
+    aic->pool_size = 0x200;
+    aic->pool_base = 0xC00;
+    aic->bus_pool_base = aspeed_2600_i2c_bus_pool_base;
+    aic->has_dma = true;
+}
+
+static const TypeInfo aspeed_1030_i2c_info = {
+    .name = TYPE_ASPEED_1030_I2C,
+    .parent = TYPE_ASPEED_I2C,
+    .class_init = aspeed_1030_i2c_class_init,
+};
+
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
@@ -1192,6 +1215,7 @@ static void aspeed_i2c_register_types(void)
     type_register_static(&aspeed_2400_i2c_info);
     type_register_static(&aspeed_2500_i2c_info);
     type_register_static(&aspeed_2600_i2c_info);
+    type_register_static(&aspeed_1030_i2c_info);
 }
 
 type_init(aspeed_i2c_register_types)
-- 
2.35.3

