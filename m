Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2311750lft;
        Wed, 22 Jun 2022 10:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s7gpCmGCpMcGgDusIg0AJm1/TOhRTX/8mdSnD5YBUBMb90EMyFRgs8XkkCvNA0piRFjKeV
X-Received: by 2002:a37:4054:0:b0:6a7:8358:2d72 with SMTP id n81-20020a374054000000b006a783582d72mr3274080qka.414.1655919419389;
        Wed, 22 Jun 2022 10:36:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919419; cv=none;
        d=google.com; s=arc-20160816;
        b=k6BSmIhPpizEpCJHvGbTNjvYBWJlmVojQ3IxurLbVEjMgALVUouGtZTCQqhHZfBJbt
         apyOlyRZnDpL0NG/FfDirTZ4CVBfWkCIZCnLRWNjcLkWKBI15X+AWXY0c7Ktxf6QvE9Y
         qv/ZAcDdSRfyHjAs3dxBqduYzGI1jS6fWkWGuuF9MnrD43E/n0nDxibhLWqenK2AcuUK
         qWeivtBMBq5UB3MyT5yfhnMGJ4xgg5rWvBSYo4VKPlWL38pitJr8URqv1vBn5LWTwXzV
         YTsKHXs9AXIa14nbNil9y9lWif816eilIeuFrV8jEXmPAr8slls2R0t+Pn28m0qOiCZH
         OSzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r1zrUO/GPcqtf/VuTcDhnqOJkTFa5E6qrwOHCOxQnI0=;
        b=JI5PYzwz4W6KU9nBoKbu1hcs+6rr3w6az3J2z3WR0/s2dt+2WpkDTGMHYM9Gc+9wf+
         dyGyp75qXSYKwBfBtIY2LMBahEnhOS+o7h5waghsKgXOlrmXdYp+BV+TzQH2nPQVtQiX
         BYkRljWrKPjksh5X3pGyDrUzLVCiQdspWSEUgbnrAX/2pJsA5ndvR6U3MHcrqL9lxyc1
         evYe+8GXIPrfDnJtd6sW+M0LCuvfLpuI4kwN9GwpzcrhYtg1cNuKOJW3NYd1GwvbMJKb
         8cSdPxmJNCbaecAchyCRmUBhmxQ35grf+vfGDU0TTZd/4PsQBSNOpib09qy95M78XJvC
         2TLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b="el/74Qby";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020ac87d92000000b00304ceee55e2si12800600qtd.503.2022.06.22.10.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b="el/74Qby";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:51820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44Hi-0001Cc-T7
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Aj-0007VV-3F; Wed, 22 Jun 2022 13:29:45 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:23702)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44AS-0000at-Tv; Wed, 22 Jun 2022 13:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918968; x=1687454968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r1zrUO/GPcqtf/VuTcDhnqOJkTFa5E6qrwOHCOxQnI0=;
 b=el/74QbygnUbcYJImoxAAsMRNyd4TFAJKbriaKdyzSRCTwdx8xXNDEop
 ZbWzoxF/FzhPJ+QfzGkLo/xuYUqbTxD/Z67xq9WIBqqFe6U4T8YTafMYW
 1l+NYZg+0rcc4tfx2srl+nDJgaYrfPnBiMc3nSekxtnOE6AJXonQS4iqq I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Jun 2022 10:29:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:26 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:26 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 8/9] hw/arm/aspeed: firework: Add Thermal Diodes
Date: Wed, 22 Jun 2022 10:28:29 -0700
Message-ID: <20220622172830.101210-9-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5lOWsxvjw18

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Add Thermal Diodes for Firework machine.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 08e5fc178a94..526f3b651a9f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1038,6 +1038,7 @@ static void qcom_firework_fru_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
+    I2CSlave *mux;
 
     /* Create the generic DC-SCM hardware */
     qcom_dc_scm_bmc_i2c_init(bmc);
@@ -1047,6 +1048,15 @@ static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
     /* I2C4 */
     qcom_firework_fru_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x50, 128 * 1024);
 
+    /* I2C - 8 Thermal Diodes*/
+    mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "pca9548",
+                                  0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 0), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 1), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 2), TYPE_TMP75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 3), TYPE_TMP75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(mux, 4), TYPE_TMP75, 0x48);
+
     /* I2C-9 Fan Controller (MAX31785) */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
-- 
2.25.1

