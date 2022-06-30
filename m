Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp257619lft;
        Thu, 30 Jun 2022 04:32:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tgyk8RNt2epdI9iUY5dNmss4F4fTG0O2KPCTpbRGsHl+2t7r8E3r38QAXrDwsyKqVRpKwP
X-Received: by 2002:a05:6214:c21:b0:443:a2d2:a685 with SMTP id a1-20020a0562140c2100b00443a2d2a685mr12094854qvd.52.1656588749700;
        Thu, 30 Jun 2022 04:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588749; cv=none;
        d=google.com; s=arc-20160816;
        b=mxFkG6k/g7+wu94NJx3zWNw6vW7kgbEqYkTE/Z5o1hryW/H0/4ROgbFl6T8+NpF+7r
         AyHneJOq5rXD4mqULfm95Fa9pHseNOLKkT0UYwkWbOmYIW1Po19wgY9wpEhUdaquc3nt
         jDh0hMSgF0w6bEWPuOpuUnMRVKHWKL76Z+d3QjYVhne3/sQ1LvTm8a4+ZNYgVHbCpWo9
         b597J4tbxXH3rPGwnfoR6+mEZF6zoGsXGrJE+yDeWu4MzrtprR+fkM5lyKqgU8lx3W3k
         8FKvIKGTOWxOL0JM80vKgviKfRiI2khz+rsrMTN+5X5rHtBYO5BCbhUAp66OoYJSdG+C
         S8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=j4VlA+9byJR+UxCfym3fR3mPGld3KLWtm/lf+2M17y0=;
        b=I3gSBtirwZAJikCVY4DcrBKUGYZnaPoxDbODnWGr0Vl3pvuk3a1lwECKRg6GZA8WAp
         fOBfR0UqL0VSRV3f7OdmCBjcABMx8eaIgFrdoQFI/4U3TtBnsBoJSJEnft0ebLmwSEzX
         ReK2c9MJtRTpKlyKiY2SpniFQBmbxIOXe4PQMxa+EBLK/LBgOqQfMUydCeX1FEJrIXG/
         G1fNydyYkakckKXE0/GLXO0vsTEJHf3BHtswqo9Fhc2ddyMavJCy7GVx9dIWVHeLrFzJ
         TlAsZUDpaFg5fHEt8VFmTS0vPf6qctY8vMev9GFrQrRuS1/sy9HDcKZ8nYtzngA7j2KZ
         sF1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13-20020a05620a424d00b006a6e5976423si11591479qko.102.2022.06.30.04.32.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sPN-0002fU-3a
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIL-0000TZ-J1; Thu, 30 Jun 2022 07:25:14 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sIJ-00024n-1q; Thu, 30 Jun 2022 07:25:13 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbT6NyZz4xXD;
 Thu, 30 Jun 2022 21:25:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbbR67Ztz4xD5;
 Thu, 30 Jun 2022 21:25:07 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 19/27] hw/arm/aspeed: firework: add I2C MUXes for VR channels
Date: Thu, 30 Jun 2022 13:24:03 +0200
Message-Id: <20220630112411.1474431-20-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: lPWVfH67ijpM

From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Add 2-level cascaded I2C MUXes for SOC VR channels into the Firework
machine.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-8-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index e8c565c9adf5..6fe9b1354804 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -965,13 +965,21 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
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
2.35.3

