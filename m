Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp256270lft;
        Thu, 30 Jun 2022 04:30:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjVP3EJFV1hu5SO2kytKs7chgxBSLNzBkzezNq772gsaAmcZD8XHP6u/QmbFvwIk54n+Bn
X-Received: by 2002:a37:8a42:0:b0:6b2:4cc1:ecf5 with SMTP id m63-20020a378a42000000b006b24cc1ecf5mr396040qkd.138.1656588634106;
        Thu, 30 Jun 2022 04:30:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588634; cv=none;
        d=google.com; s=arc-20160816;
        b=fz8JenramLuvn9sScpJt+N9AGsGKGby7DLaS0kdV75mCPX6JvB/1cqq5eqQ1D52pts
         DIRSuj3nIqtbqNmEOadejxtukURXX88boDBq7UQT4Qrtx2j6g3Oi/FxdrM3LihfCyfrG
         /CPWR0SRIWMRmVu06S2/gguUWHiDu5GPyjoDwCantQQJbXtoE8z6tJZ9wHKZDpjEd+8W
         zAFpQrnyglJFt9yF9XrLPsyECC76HtmS/f+9/QFmJKZWKZHYUthRKBLkUf7Ew9Or2JKy
         arcfJ4wM1U3oP5XLTMbg7AkNoh5saXMJznwM0T6z3XK5eYxMGSHWh7xBGuTJHJ6b2xXU
         fogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=gl2TsXIFlIQcG58QAutEOkt3Lvh/DrPUbwT0B0u5bU4=;
        b=KTjGNeIZQZYuIiaSmqYrLiMO1I7k7Pnk3eJLuD7YVT7wByC3ZH3FE5px4GvK5qWZGv
         3Hop6xdnMpux5iukCo5+ufVc42gz2LmPRdPmH+ilCUYaeg63gCdoKfh9+IpINl9p/zeK
         gRoT3PLx5hxqipjk/kJRL73/y0lrRfLLwYqN2fSIWUJiCwGdTuL/yeby5lpfVP6vdh3I
         y3d/IJFzgwIHkOud4CuErQYaphgMULgwtdCdjx40MrfNi+VQnoUJiZY72hLRrUxNT081
         FQ/umpj0DbX3RDHyMzunfUU8z1yV0uaMNHbg2P2hyPlbtuQNz8T5ax4cQoBZ4gMkI9kv
         EsrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a05620a268400b006aee8748eaasi9934743qkp.247.2022.06.30.04.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:30:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sNV-0007rS-EU
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:30:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIJ-0000NO-Tj; Thu, 30 Jun 2022 07:25:11 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39781
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIH-0002Pc-QF; Thu, 30 Jun 2022 07:25:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbR2QDxz4xYN;
 Thu, 30 Jun 2022 21:25:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbP0MbWz4xD5;
 Thu, 30 Jun 2022 21:25:04 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maheswara Kurapati <quic_mkurapat@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 18/27] hw/arm/aspeed: firework: Add Thermal Diodes
Date: Thu, 30 Jun 2022 13:24:02 +0200
Message-Id: <20220630112411.1474431-19-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qwO2LmYwBeP6

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Add Thermal Diodes for Firework machine.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-7-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 06b31fb533e2..e8c565c9adf5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -965,12 +965,22 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
 static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
+    I2CSlave *therm_mux;
 
     /* Create the generic DC-SCM hardware */
     qcom_dc_scm_bmc_i2c_init(bmc);
 
     /* Now create the Firework specific hardware */
 
+    /* I2C8 Thermal Diodes*/
+    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
+                                        "pca9548", 0x70);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
+    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
+
     /* I2C9 Fan Controller (MAX31785) */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);
-- 
2.35.3

