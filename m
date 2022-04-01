Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp555394lfb;
        Thu, 31 Mar 2022 20:07:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzROOSsdZGEg/Fazf+rC2gVEfxz/qLiRMgjDCv95B8lm2uNdBsaTZ+8QxGSYAuQ1a0QA8Xm
X-Received: by 2002:ac8:57cd:0:b0:2e3:5317:9248 with SMTP id w13-20020ac857cd000000b002e353179248mr6978414qta.341.1648782425380;
        Thu, 31 Mar 2022 20:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648782425; cv=none;
        d=google.com; s=arc-20160816;
        b=Wo/rrQOVThakkNt7aNk+5BwqIeidj9aeXu9jw6GTBF0Vql5EA0tyFpMU0BlYJ/+rvu
         DyK5F6KsjHFIr6fI3Pyhqp65WeqIGY6n5eSnxG5wL6mBBlPyp7QCQLaA+C2EoRYlOPbJ
         d2aCxWqzalMVnc8yrZR2ZvFEd3hlsqQdglQerGPv2hmOc1ZsIa1ujIRhMm1crIJwaFr/
         aTpxfO/u02D7248TuLuXn5/N5PKU/AgTSQjqgr4FACRDgLBU05mX/Dsglv0mpOESHP1C
         qH9uIq2rPwLBMOL+dReQz59p0fmTseS34gydT7zHEPBeHDFqYtwm1BSxG6JOD5/xami9
         QlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Tyx25RR1zJDAh808Z7Z8HufTpiHutWgi3NLm4qApdtA=;
        b=B1HcJc5RkwewO8RL8kGwdhAqlCZ5wtZtiM9nwjq74YkZUX2mHCIQ+frzSkJXNsjgeM
         htpWM77vy4t8fs+WOhQRYe5nqEh0fnZZ0N9FpQ0O1oeEDEnoclylc4XVTWcGPN6Mtyjs
         HFPht/do9vCHSyG/Te+6SHOzqD8ZL9AaeMYwwaDRUA+DFmMRTNW9vna6K/TVc3THnZ4M
         Y718TFZQ+lbeWVoNASOoHvwL9PcwcfM/R6IuilMyLpqQQChEPBdED6DYw7p4ObzL2GWK
         sNTiFwUBhdUs28a8RVhiqro8kFaO5Qz45VI3sZwOkLI0q5aOLX4FniZdyujOQOsa5ax1
         KfAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26-20020ac8671a000000b002e1fbf3bf27si611501qtp.280.2022.03.31.20.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 20:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1na7cu-0004JV-LK
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 23:07:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7c3-0004ET-31; Thu, 31 Mar 2022 23:06:11 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:53745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1na7bt-0002iv-TY; Thu, 31 Mar 2022 23:06:10 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2312s9H9090568;
 Fri, 1 Apr 2022 10:54:09 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 1 Apr
 2022 11:05:10 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alistair Francis <alistair@alistair23.me>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [PATCH v3 1/9] aspeed/adc: Add AST1030 support
Date: Fri, 1 Apr 2022 11:05:00 +0800
Message-ID: <20220401030508.28133-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
References: <20220401030508.28133-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2312s9H9090568
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
X-TUID: wQ8whtoTUUEf

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

