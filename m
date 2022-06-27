Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2475615lft;
        Mon, 27 Jun 2022 08:48:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAaqOVtYb00XKH5sqmCpG03Z5Wsh/1t85GbUW1JFpA0qwdVJg4/d8dfPl0n9RHgVbmxMcH
X-Received: by 2002:a0c:e2c1:0:b0:470:3d22:f9fe with SMTP id t1-20020a0ce2c1000000b004703d22f9femr9090112qvl.83.1656344899583;
        Mon, 27 Jun 2022 08:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656344899; cv=none;
        d=google.com; s=arc-20160816;
        b=RD1OdnHv7gLElXAUuzl7++Ng1Z6pvdnLBHOeFsnbKGNLv0HAn2efobD6L2Tele0YYl
         /zd+ajusDzRsa2+aqlW3drHsPPwYDeQmPuUXthFJkAdc9CRQI3luzwySTooYEuKmmLZd
         wnjM8h3Amhf4IylpmtwQz+yIUUWVTU4ElphPZWHSqRJqJsV7GlM4ft/qrv8yW1EgM9No
         RuZvUVgUES9H/9Xg1Ii34r93s3sSXRT3hEERR3WDW6QEtKRCvRdMqWEk7k1xmqsHe5Ua
         2BGRxzRlrfd5mOkkNvbq2lJNcDSaPJJm0PJZWHZvYYXvKgaCu6SneGDgQf5NZoVPKt1v
         exzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Y09mCb5si9Qj7bmCcbC9RswbhEYEXytjucZp5yK9lbo=;
        b=a96WMnvjes/aOa+nPbuTjDdpsP0y+rurpoYtfigHxEvromeYFq6pL262t1I6wq2p5d
         g1GDz2G5V24WJR5d+WO4EKXDFiCmCwgMhxvrBMUVqsEeWvQIg4Nh7FWXo2T/X3zt81e8
         aTRwC9LYMTNkSwc+eOOuXqjQiyjPNvY+3kxSVI8R7WMruhF3zC5PFhS3dP7KHH1MpC6h
         8gN84fPPJKtt1owhq84E/axuMiIkCKWfyTxHia5v3Nhpsl3czJJFuPBnV5S1TVyBT5o/
         dnm7oL1ta0zN5lEl6ONOHjMjdlsFTMUh2BnwCLzWAVwxabRa/uMxb3FDJmxrve2NtnTL
         X1sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=udbBe35H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl26-20020a05620a1a9a00b0069fe9799e14si6466638qkb.477.2022.06.27.08.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=udbBe35H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5qyJ-0001Ur-1w
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxn-0001RP-Jy; Mon, 27 Jun 2022 11:47:47 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:57702)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxl-0005et-8U; Mon, 27 Jun 2022 11:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344865; x=1687880865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y09mCb5si9Qj7bmCcbC9RswbhEYEXytjucZp5yK9lbo=;
 b=udbBe35HcpCcE4ehh76fFtqGyQdT5HqVjoy3mJ4uYqLj8av7SqTdY6eu
 QPHafM4UjJW6hzYHzf+6IixH50dNV6nOssuGYYyAzaPU1HSSdA5r+vuWV
 ed1+oNcmnBNZUD99oTYdqQluXNikLnL1v/G/HYioRMJT4+J5iuDkXy6wN c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jun 2022 08:47:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:42 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:40 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 7/7] hw/arm/aspeed: firework: add I2C MUXes for VR channels
Date: Mon, 27 Jun 2022 08:47:03 -0700
Message-ID: <20220627154703.148943-8-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: S+O0kH5NIeES

Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
machine.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* None

 hw/arm/aspeed.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cfc322ee30e9..1708a8f3408d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1002,13 +1002,21 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
-    I2CSlave *therm_mux;
+    I2CSlave *therm_mux, *cpuvr_mux;
 
     /* Create the generic DC-SCM hardware */
     qcom_dc_scm_bmc_i2c_init(bmc);
 
     /* Now create the Firework specific hardware */
 
+    /* I2C7 CPUVR MUX */
+    cpuvr_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7),
+                                        "pca9546", 0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 0), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 1), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 2), "pca9548", 0x72);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(cpuvr_mux, 3), "pca9548", 0x72);
+
     /* I2C8 Thermal Diodes*/
     therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
                                         "pca9548", 0x70);
-- 
2.25.1

