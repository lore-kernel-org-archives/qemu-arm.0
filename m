Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp254754lft;
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcaSY4AbyeW8jGfE3dhyS7y81jkK8/QDilBM3ENDnNNIMp8uFzatDT9tiz9cnrGUxwfinX
X-Received: by 2002:a05:622a:1354:b0:31b:f063:e324 with SMTP id w20-20020a05622a135400b0031bf063e324mr6726045qtk.435.1656588487138;
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588487; cv=none;
        d=google.com; s=arc-20160816;
        b=cuX/T+XzhD9ECRtCTbVLRfqhjNMddqiE5hiP57wngjbHLJsscoM0fdW7DdTEE5fnib
         XCbQhPQJsQ5tiVgWg4c9p7Dd01zfAvVLMu7rYV4iDmm0OXIbj0H9lSgimhWEm6pkFV0N
         gUx1aFKPO/vYYf8O0SDEN6KpxXaVaDQZpLk6JXuqYPJLLT0yIYYfxbJiTSdReKf1nxZa
         RLu6wMA7LEoD7jj1wFYKjel3dWdclgpRoyorD1RlQfkNu7/0ry0rlqhHltHBFNfIMz38
         BXr1jIbD9zJuVYvUfY3gVcIfB7lUWvlrqQzjUvWH6GSFGKfe+76nx2dEejfamQcXTA0j
         0kSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=yoSsrtaJSuuqyXPsHdPZ3A4cmQLUbqKXZXATIfZVigE=;
        b=FH9MzKKGJsv61cOvicr69hwQXfX9252M2eRpuHE7IkiHsdbGnyFME+d/WwJt7BNVHn
         24ztnSnPbR7gLSK+XPi0bIU1nrTpZqiPD+MKeGx5+mxmEUA6yfvItmILoPHGWq4ZXHHU
         Dd9BzUxF2a7660H+zKpXRepTtPQuNpWUXNIYXWigLexGNyqQViWYEojIkhjc4xBty4cr
         C4A7j9LwvRHi5VZkeC+hCz84+Pq1Ep6MNgP0BSMKEdEjZisahL5rwyJPLs+UXtT8uPAy
         a0K58/MdpLCgl1GNFjSOK5LIksFXYWUEfL8FzkTmQVSn9H5hejFUTVuZ1LKZ0mC2Bdwb
         ZwVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm24-20020a05620a1d5800b006b1df10aa81si1777430qkb.447.2022.06.30.04.28.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:28:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sL8-0004xW-Gk
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI7-0008Ej-Sh; Thu, 30 Jun 2022 07:25:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sI4-00027m-Gw; Thu, 30 Jun 2022 07:24:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbbC3m0Zz4xXF;
 Thu, 30 Jun 2022 21:24:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbb91fDzz4xD5;
 Thu, 30 Jun 2022 21:24:52 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/27] hw/arm/aspeed: add Qualcomm Firework BMC machine
Date: Thu, 30 Jun 2022 13:23:58 +0200
Message-Id: <20220630112411.1474431-15-clg@kaod.org>
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
X-TUID: Kyefxy+hrDnP

From: Graeme Gregory <quic_ggregory@quicinc.com>

Add base for Qualcomm Firework BMC machine.

Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220627154703.148943-3-quic_jaehyoo@quicinc.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6e4b287fd31b..74cb297dd38c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -962,6 +962,16 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
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
@@ -1429,6 +1439,26 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
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
@@ -1470,6 +1500,10 @@ static const TypeInfo aspeed_machine_types[] = {
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
2.35.3

