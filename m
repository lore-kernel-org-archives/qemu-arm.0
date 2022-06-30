Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp261194lft;
        Thu, 30 Jun 2022 04:37:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujnHN4/RNfKsn+jQIsSgyRimGsmSZJQ0lK2N4dH5QROvo77QN+4xoswf6WamndsA8SQJ7v
X-Received: by 2002:a05:622a:1651:b0:31d:3248:ad77 with SMTP id y17-20020a05622a165100b0031d3248ad77mr948640qtj.213.1656589065916;
        Thu, 30 Jun 2022 04:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656589065; cv=none;
        d=google.com; s=arc-20160816;
        b=qYkzGli1bFHUrQTU/8GsvfXxHkf5r6GjcU05Hgwg5EEhfVHNFSlsMUymKAQJzsUNH2
         ziXoo7uMgR9peTSXLr1vkN1OyNZ1ClpijXPM50A++H3sOH2R3MoZeQSoVB0Wk+jWyRI/
         yGsYc0MbMs1t8wRx+m01rB+jK0b96w5VO3NRMjjMBKvswR0nrLJF/GhcZ7ruIVaPRNsj
         hkK4mBH/We01tTsbqfeA79Ju1a3rVtJHkFsRSWMZG0eG5Lm5d4PzHqQzq2Ukfy1UtMq3
         f2FkX5FnbKd5yTHRyvts0eohhoORNMvnYmlnjBwkeCnoIheGGQysoHULaRbsO+xwtQSV
         WSew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=zwYEaLRpeDc3y/fqbXVBTNA7bIOw7AZwFsNX6se5P1w=;
        b=ulHDEens0g/VFA1qhAxjK3FnSkeXJVn4JwPUsvUhj9b0aNB2H7faBE4+CjCAJ3YaH3
         7Nj/SZ2VMlEMZwMcNL0oY1IyISpFrtN+295b/vFVMl2ml0TIPiRFuCsdsrAZOj7SdX//
         vTsqn1AeA08Gf2eTGl2pjd6MqP8NwPjvPNazvIrYmlPtUEuDzC2UaOObBW1uvOwIXftE
         RnBt1m1cNbPiPOcFyWomDy+2bob/UGZyRK80y91v5Vbrigx/MTjA3aivBtGIh6bP2to6
         5Ur41MJ+2Y0WMT+5w2gpSuySALfVdaE0Hzko7L6l4PyNQCLaMfbuPwy2HfrIeR0VYTtW
         bIoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22-20020ac85756000000b00317cb8ec640si9772522qtx.91.2022.06.30.04.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sUT-00023S-Cs
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI7-0008Ct-Cf; Thu, 30 Jun 2022 07:24:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI2-00025Y-3L; Thu, 30 Jun 2022 07:24:59 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbb859Kpz4xYS;
 Thu, 30 Jun 2022 21:24:52 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbb64vG6z4xD5;
 Thu, 30 Jun 2022 21:24:50 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 13/27] hw/arm/aspeed: add support for the Qualcomm DC-SCM v1
 board
Date: Thu, 30 Jun 2022 13:23:57 +0200
Message-Id: <20220630112411.1474431-14-clg@kaod.org>
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
X-TUID: 2+//wOAg+Mu/

From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Add qcom-dc-scm-v1 board support.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-2-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b43dc0fda853..6e4b287fd31b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -174,6 +174,10 @@ struct AspeedMachineState {
 #define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
 #define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
 
+/* Qualcomm DC-SCM hardware value */
+#define QCOM_DC_SCM_V1_BMC_HW_STRAP1  0x00000000
+#define QCOM_DC_SCM_V1_BMC_HW_STRAP2  0x00000041
+
 #define AST_SMP_MAILBOX_BASE            0x1e6e2180
 #define AST_SMP_MBOX_FIELD_ENTRY        (AST_SMP_MAILBOX_BASE + 0x0)
 #define AST_SMP_MBOX_FIELD_GOSIGN       (AST_SMP_MAILBOX_BASE + 0x4)
@@ -951,6 +955,13 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
      */
 }
 
+static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 15), "tmp105", 0x4d);
+}
+
 static bool aspeed_get_mmio_exec(Object *obj, Error **errp)
 {
     return ASPEED_MACHINE(obj)->mmio_exec;
@@ -1398,6 +1409,26 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->macs_mask = 0;
 }
 
+static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
+                                                     void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Qualcomm DC-SCM V1 BMC (Cortex A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = QCOM_DC_SCM_V1_BMC_HW_STRAP1;
+    amc->hw_strap2 = QCOM_DC_SCM_V1_BMC_HW_STRAP2;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "n25q512a";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  = qcom_dc_scm_bmc_i2c_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1435,6 +1466,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_g220a_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("qcom-dc-scm-v1-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_qcom_dc_scm_v1_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.35.3

