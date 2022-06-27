Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2475986lft;
        Mon, 27 Jun 2022 08:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uTSh8sQnuzIOOW557sRH+ZdJlANLmyQJt41Xbpo60dPceMTNt1YPGlek463k68htTftgzE
X-Received: by 2002:ad4:5aee:0:b0:470:69fd:3242 with SMTP id c14-20020ad45aee000000b0047069fd3242mr9240615qvh.34.1656344939645;
        Mon, 27 Jun 2022 08:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656344939; cv=none;
        d=google.com; s=arc-20160816;
        b=hJTdryyQqEjzUv76rmorGV8kzMU5eSX7ydczTBiyHpwOlSbrRpQTxwrd2lUuBakx/D
         RUIZv5RSkTRBMeZCI5/qU/JrRQCVYJgz1WbO7tLd3zjmMMyt9ajtp2UWSJslIG4uVPKB
         AnAGq0fm/W+CEtYrJjesmGxO8+Y0UiDpbBWVPz09bGcWLzdPEnmsT01NMU13EDYD5cmC
         3bszVEsIwBOUIr0IIbMfUY11sfy2CYQbeoJKEGYYXt7U/Xu9fvQvWsu4zVZV/sxERKwK
         X5r+7fUpxPPNvF79aSQ6aYhYfXtaJwKA7Q5Y5TEivh+7na/7ABJravkVpHGTtIjj8zwX
         Ar7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bc1EQ1HHmWjIcNG6T1vJreDy+rpZiUs2yToN+Zr2a9w=;
        b=R/ChzC36LzsSyR0PZrnjMqpLu+ivqMHol78WqwxyED9ui2b+0mpW4ywPuKJu2YVFyV
         /FlPcWjR5EyimhoxoZyRyMo1NsH3t5Fnu09ayLGxZGjvlbYbCK3gFG+SETb/8VNi9Oao
         RJFTIH2WrAE01Qc6DYPlcCSCOA3jjYWPPs0JUWQf1ipBUVE02dGn9A4bdDtwSGKaVXed
         OUOGKvqwPyMZyo0sYoPGDatMCTIn7pwCnOlibDtAb8Oqla2cYlwS+adC6ziEm+7JfHVD
         Xst/QEB30T96hltrgQz27eGEy49/O3QW+tWHnbeHEpt/hNSr2JmpZFDEPAdw9m/TQlB0
         k0LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=QTz1kf3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k21-20020ac85fd5000000b00304e82703dcsi6629201qta.519.2022.06.27.08.48.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 08:48:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=QTz1kf3I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o5qyx-0002Gi-4X
	for alex.bennee@linaro.org; Mon, 27 Jun 2022 11:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxn-0001RV-R5; Mon, 27 Jun 2022 11:47:47 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:30721)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o5qxl-0005eM-5Q; Mon, 27 Jun 2022 11:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344865; x=1687880865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bc1EQ1HHmWjIcNG6T1vJreDy+rpZiUs2yToN+Zr2a9w=;
 b=QTz1kf3IfhN+9EAN9C0RMIx4ULfXRUE96d4koKC1xHabWdZ5E1wxc/W3
 shY7VzPjzKC251IhSus6Y3lWKzLc4uugRcVHiDWtXx+Oe5S/t/awP+BsS
 m7nFSVGJdjfpAABUPr7ZR+XNyg4w5djfkaVJW0Fv/jbSgTz4Alxp8Nt3e Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Jun 2022 08:47:37 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:47:37 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:47:37 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:47:35 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Patrick Venture <venture@google.com>, Hao Wu
 <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/7] hw/arm/aspeed: add Qualcomm Firework BMC machine
Date: Mon, 27 Jun 2022 08:46:58 -0700
Message-ID: <20220627154703.148943-3-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
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
X-TUID: iWRSY29xKEJ3

From: Graeme Gregory <quic_ggregory@quicinc.com>

Add base for Qualcomm Firework BMC machine.

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v2:
* Changed machine name to 'qcom-firework-bmc'. (Cedric)
* Dropped FRU eeprom initialization part. (Patrick)

 hw/arm/aspeed.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cb7d99513816..342cf39c9747 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -999,6 +999,16 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
 }
 
+static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    /* Create the generic DC-SCM hardware */
+    qcom_dc_scm_bmc_i2c_init(bmc);
+
+    /* Now create the Firework specific hardware */
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1451,6 +1461,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
+                                                    void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Qualcomm DC-SCM V1/Firework BMC (Cortex A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
+    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "n25q512a";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1492,6 +1522,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("qcom-firework-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_qcom_firework_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.25.1

