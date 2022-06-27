Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2476064lft;
        Mon, 27 Jun 2022 08:49:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ufGbaVu+tHM52We9xmOon/tHe+SbYqsfciXWt2USxWrAO5f/5EqDKa5hRAVNCOhsOmieRS
X-Received: by 2002:ac8:5f13:0:b0:31b:ead2:9bf0 with SMTP id x19-20020ac85f13000000b0031bead29bf0mr576222qta.17.1656344945773;
        Mon, 27 Jun 2022 08:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656344945; cv=none;
        d=google.com; s=arc-20160816;
        b=z91lf73ydL03gPuDLSVNceL+ZDVde7rPVw7A1d6OroHFGMVvcSkDU7octdKHWVe5M3
         FG+ZQMaKgA5OMBeuMIbLq4o3uLetb2l8Udk4cgc2faq00+pw0LauvKATkmIiNga2X6NC
         B3oqZncvx3a3wUKCBxtscuRDrlfzwOOEjZ77Ez2xb3gfHc5WPtbdE9n7vAafGHo8eoVy
         M0S/p3GCQB0LQ2hZSpQuoMNO6eJ43zdzhRE9zmQY1wB1zO84B70hRsL8lqFn+2Z78Luq
         v1HpVZJV5MxVAkoLadJMDrG2GQ+Pp74S50v20Q9S7QHrWQDxgu1xm7dEVnDf/U7yyd0R
         Z97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p55ZwZ1mqA0kD6fdzYGXMJEn54U1NSdpfOpvP1qSRxE=;
        b=vwYiSraRR32gfyrYYrEyNWiQf/sAVF+QRKJrCr9EhAOggbF7hTyJyhSVRp9Yrgntw1
         BgKWUFx4USzu7DnFZzaTFcbsJufi08YzAkLTnwLmpcyGWhjvY28Xz15rJg0YlAD8qyid
         pQeQ+USUH0zFOUIWgbB2E0w9eos39GU/fuYU6H3FdXPvH7lQzyCy1tiuV/haYoVB4Epa
         wstxwVM5Lg9GGKixbs3OjnOeDcUp77GSE0KF7uPSWIqfpMkbif4PNM2lBY3H/l9p8WJq
         saJF+XN88oES+3br3Sp3fGbDtxcWJu7CxDAlkyhOvQJk+rFo7Heg1HUK9Zg5xLktZugH
         nxaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=ITFw7guq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a05620a268700b006a6af4c882bsi6275852qkp.723.2022.06.27.08.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=ITFw7guq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:54918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5qz3-0002ku-96
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:49:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxn-0001RK-Am; Mon, 27 Jun 2022 11:47:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7249)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxk-0005el-Vx; Mon, 27 Jun 2022 11:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344865; x=1687880865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p55ZwZ1mqA0kD6fdzYGXMJEn54U1NSdpfOpvP1qSRxE=;
 b=ITFw7guqYFMz4WHXwaELe9pMg86LhdHGEudY6ZeX8qHITMthxvEriMwY
 ODI1KZguxSXUwlRmySeb23l99ilDvzBSCnjKIRb1ziLCO1XChacAfUGYm
 25Gzde5ifpooTTIemqgCQ4rSbe8Zp/PLMyjKZJiVMoGQ5JV79SD7NAfBm g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 27 Jun 2022 08:47:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:41 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:39 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 6/7] hw/arm/aspeed: firework: Add Thermal Diodes
Date: Mon, 27 Jun 2022 08:47:02 -0700
Message-ID: <20220627154703.148943-7-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
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
X-TUID: CK5NzIn0zctB

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

Add Thermal Diodes for Firework machine.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Refined code to avoid retouching by the next patch. (Joel)

 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9c07db70f2fc..cfc322ee30e9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1002,12 +1002,22 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
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
2.25.1

