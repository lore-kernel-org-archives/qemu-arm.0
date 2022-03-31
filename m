Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1611502lfb;
        Thu, 31 Mar 2022 01:17:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvkGQrd+KLpz5ybAsXnhOYEXbe8GA1qkhkLQHxKUaVrjAz1xLNL/uAdoOIZnwCzDilfvGM
X-Received: by 2002:ac8:5c45:0:b0:2e1:dada:62ea with SMTP id j5-20020ac85c45000000b002e1dada62eamr3180372qtj.397.1648714634462;
        Thu, 31 Mar 2022 01:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648714634; cv=none;
        d=google.com; s=arc-20160816;
        b=NcU+81FPlA+iJjuOwa6uXnGRkT2OCoa/AJQAmpmAg17fbYkFLMQykW6Nrr7Tb0FjNa
         0V4cEVaCqXFv3UdlawsT34ErHk/GfWwGwfg+okMLK8SCUthHW3pcA9z8ZWrhG1hwn0s6
         2Bs4tgbxd7HnyS/RAvXhplsD/SLOQJCCNu/q849oCxH2ZAHRCwzQSMSOCcuVj1VHVgIh
         PWnz8PnYQgzlPlcuF8YT+0g9IZDPNwn2EUHOg5fW1rUaI7I/mPd1jfpaE7ZfX+pwrU0q
         +2H1ItsVg/UDuKD1t/8ZPRuVTIB6kCfzcx4isaYgAk6DzIvSmbiOYmMRRnIgKd6DMsM7
         5mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Tyx25RR1zJDAh808Z7Z8HufTpiHutWgi3NLm4qApdtA=;
        b=oDLbCeBuZV9owp8/sYXVu9TWcONqTNIeTy9z2zXTh4xUfPGCEtVFCOMyJuXikmLxVl
         fOSYUfSkljkGOtyptI6ry0QTmJIpIEA54ECYjiKOOLrHs41igO8eB0vjQ95qJjL3nW0W
         HBVwZW15WBVP6GVg8/NGiLzaK8jvRus9uR4/vtnx8M741dNVXolD0cL8joETcm4aBQju
         d9rTHOMqwCDBT58TtSfdxhzuRBanIVeegClm8A+axD/Nozmsm0I8LJShwi12YD6v6x++
         MQ7I0oDrTxj8pXTYmli3Vu6JlPBpD+ym1dun2RfEeiRS0pBE7RrzwEmnDlitjkQrMBdF
         vxCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a0c8d06000000b004414ba48f8bsi12452636qvb.475.2022.03.31.01.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 01:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZpzV-0001UA-Sn
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 04:17:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz4-0001Ta-16; Thu, 31 Mar 2022 04:16:46 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:46794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nZpz0-0000Vi-W0; Thu, 31 Mar 2022 04:16:45 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22V84nL9054233;
 Thu, 31 Mar 2022 16:04:49 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 31 Mar
 2022 16:15:47 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/9] aspeed/adc: Add AST1030 support
Date: Thu, 31 Mar 2022 16:15:37 +0800
Message-ID: <20220331081545.7140-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
References: <20220331081545.7140-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22V84nL9054233
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: jamin_lin@aspeedtech.com, troy_lee@aspeedtech.com,
 steven_lee@aspeedtech.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 903m8+BQ/t2g

From: Steven Lee <steven_lee@aspeedtech.com>

Per ast1030_v7.pdf, AST1030 ADC engine is identical to AST2600's ADC.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
 include/hw/adc/aspeed_adc.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index c5fcae29f6..0d29663129 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -389,6 +389,15 @@ static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
     aac->nr_engines = 2;
 }
 
+static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
+
+    dc->desc = "ASPEED 1030 ADC Controller";
+    aac->nr_engines = 2;
+}
+
 static const TypeInfo aspeed_adc_info = {
     .name = TYPE_ASPEED_ADC,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -415,6 +424,12 @@ static const TypeInfo aspeed_2600_adc_info = {
     .class_init = aspeed_2600_adc_class_init,
 };
 
+static const TypeInfo aspeed_1030_adc_info = {
+    .name = TYPE_ASPEED_1030_ADC,
+    .parent = TYPE_ASPEED_ADC,
+    .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
+};
+
 static void aspeed_adc_register_types(void)
 {
     type_register_static(&aspeed_adc_engine_info);
@@ -422,6 +437,7 @@ static void aspeed_adc_register_types(void)
     type_register_static(&aspeed_2400_adc_info);
     type_register_static(&aspeed_2500_adc_info);
     type_register_static(&aspeed_2600_adc_info);
+    type_register_static(&aspeed_1030_adc_info);
 }
 
 type_init(aspeed_adc_register_types);
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
index 2f166e8be1..ff1d06ea91 100644
--- a/include/hw/adc/aspeed_adc.h
+++ b/include/hw/adc/aspeed_adc.h
@@ -17,6 +17,7 @@
 #define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
 #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
 #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
+#define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
 OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
 
 #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
-- 
2.17.1

