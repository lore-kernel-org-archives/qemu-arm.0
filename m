Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2306427lft;
        Wed, 22 Jun 2022 10:31:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9E6SfDHFFWdbTK66tGzhk69z71xrs6no2xIyrPr6201ekyfPmnuLKDC7raOqbzEp2Vc5h
X-Received: by 2002:a0c:d994:0:b0:470:73d0:d556 with SMTP id y20-20020a0cd994000000b0047073d0d556mr1604409qvj.97.1655919074395;
        Wed, 22 Jun 2022 10:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655919074; cv=none;
        d=google.com; s=arc-20160816;
        b=jm71Lra0Z11UfNm6mLA78p3P3BYSYb4C5ia2/hgR72RpCMftQAFQvntsqxHQycsPTv
         F3hxwcejRWLG4OzSrpkwdmmjPtSdCUKz3eQU6BYmvhotih1ojWInmGMMKB4kEhr57Chg
         bBj5vdEgTIC1lCd4rYRTdKb8ciVQl98n6GnBdtPMdJ5fl4j3T2VtE2sakrLhFjBrcnSg
         eYRY5a1EtlNMkzoVqVcKo1tRLRr/E49pVr9w9G5ObggQXm4Dq4QpAgGGX8Qq4LbpXZri
         b2OrwCa1PIYU+bKe+0TymMSiDhrq26VL/iE6PA5w+nprvB44Px1dL1i4NUYRyn2Jm25+
         dJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4AuA3hABa/62TgzGv4d33/IyKM9OmS0Gc50KL4j+On0=;
        b=Dz5oUqZP6+aypfQVi312nu19eCaqLApj1+VplVztOUn+MV1glpE4GsKUBCeUFK7tFk
         O2rj+6JKI1PS31XP3Af39gzVjXFHAHldNRJACLM6WWQ28mD+hHqFXSevSsCXx/tZRzCE
         NpLgr+RlWUr7Qb2Bza10LZ/ee1KpqXOK07V5p9u6h2oPsAz6wzk6y26X3bgODW0gZBwZ
         GUWOO764NRHD3dMnwwRo3/2v1Y64vTJD7fkNwjKhqM+3cSlPNLCsPEzrIRvAS/9wKwr1
         j9e0w8hCa+z5eYwCUEvTz4G+ePTfFnI6k2++ebVVMYeHTLTRPzYWGblVMWubXv4sLfE/
         MfXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=vM1AGNB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h128-20020a375386000000b006a5d2ebaf9esi10617255qkb.535.2022.06.22.10.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jun 2022 10:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcdkim header.b=vM1AGNB6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o44C9-0007zj-QK
	for alex.bennee@linaro.org; Wed, 22 Jun 2022 13:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44Ag-0007Po-Vz; Wed, 22 Jun 2022 13:29:43 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:45517)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44AT-0000aN-B6; Wed, 22 Jun 2022 13:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655918969; x=1687454969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4AuA3hABa/62TgzGv4d33/IyKM9OmS0Gc50KL4j+On0=;
 b=vM1AGNB6T1GJlNITy95KHuGX9J3f8sXmy6c1WYGzaWjf45VUqwDmYms/
 tkQbT+cUGQf/G4AzPP5nYawQIyDMg5VyQVO8av4a1SDg/WGCfVd0e62Ux
 25A7QoGohUlnYUgoJtP8Yj24VLRX2gKia9gTHFm7RNtmpvH+TQhXqbjZV w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 10:29:20 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:20 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:19 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH 1/9] hw/arm/aspeed: add support for the Qualcomm EVB proto
 board
Date: Wed, 22 Jun 2022 10:28:22 -0700
Message-ID: <20220622172830.101210-2-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=199.106.114.39;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out-sd-02.qualcomm.com
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
X-TUID: /0UOBzqJpedj

Add qcom-evb-proto board support.

Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98dc185acd9a..4f54721e5f1f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1420,6 +1420,26 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->macs_mask = 0;
 }
 
+static void aspeed_machine_qcom_evb_proto_class_init(ObjectClass *oc,
+                                                     void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Qualcomm EVB Proto using AST2600 EVB (Cortex A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
+    amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
+    amc->fmc_model = "n25q512a";
+    amc->spi_model = "n25q512a";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->i2c_init  = ast2600_evb_i2c_init;
+    mc->default_ram_size = 1 * GiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1457,6 +1477,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("g220a-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_g220a_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("qcom-evb-proto-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_qcom_evb_proto_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fp5280g2-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.25.1

