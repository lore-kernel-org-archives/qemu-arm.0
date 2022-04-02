Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1755174lfb;
        Sat, 2 Apr 2022 11:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS/pE4XXhMmD31D85QpPN6H0ErsTcOs9gYRUGAjhUYSLrkjsEwLwggxXyGFTY4Gtkvuxe4
X-Received: by 2002:a05:622a:5ce:b0:2e1:b3d0:7773 with SMTP id d14-20020a05622a05ce00b002e1b3d07773mr12451262qtb.531.1648925197235;
        Sat, 02 Apr 2022 11:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648925197; cv=none;
        d=google.com; s=arc-20160816;
        b=l9SqNqqy84T6e6e9D/7MJJ9aT80FTEKPUx0XkjJNxNWVYQM3JL+uL+V9m0VNdqaosK
         um6tFlETYo2FDkREQj0KjiaN+90CTUUAUy+w1JiZ3UJa7BqQJdm8qbyJbxv9l9suGlA2
         sAF9KuF8I4SFBmal4EcvWZesLPxLw9LPS9yOW7PPFe4gg1GJOvuw/BfcPTqaeAH56pDk
         zYA9eo75kIF0bX60OtsbW71Oycj44WvfQh74/TZm4HZhlHhogWfEnMlxYZsHDj6XvPNT
         LDPBHSh22Ayu4AjPltY6/3jq1H/EKO+sQOM740Wjhp++K6X/Veav3KXmWI7a1o6GmYbZ
         UgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=YfqyIjiQJtSpVBzWioT9SfB3vkVqUAIhO8ud5pGzO9o=;
        b=NXLpPXquGP6M2aFa337cJm95IwxNmBRl0p3d3+fVue/9aQstWlwSO2yGCzqLvTmecj
         fjoN1drC+4lWwh28mekU/03NERn6rbYNZmxP6GBqQ1+BQ04g+mGERzJRe1D2YsAHGUQX
         lMztjd7uqbsaxrgsuarWk9kU9Pppao3FnPJEWQH6gkO0jSFAFQIEzaXcS2TJWU+CP5ij
         boVmJXi6MZnsxiIqiwI9MoB+bn7eQPSGlR6ejE8q+raB/JuWfqm8UBkFAWboFEmnv1C1
         5mzM9ctd0L4yXMPAqL89dnNxhwxTQ5SBYheL3L7Ck7kLkt603LluBi5i4MNf7EnmZY/F
         +Iyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=YL2VG9Sy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05621407a900b00440e46a7befsi1772038qvz.141.2022.04.02.11.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 02 Apr 2022 11:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@quicinc.com header.s=qcdkim header.b=YL2VG9Sy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nailg-0008G0-PH
	for alex.bennee@linaro.org; Sat, 02 Apr 2022 14:46:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1naijv-00075T-RY; Sat, 02 Apr 2022 14:44:47 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:12577)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1naijt-0007F1-O1; Sat, 02 Apr 2022 14:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648925085; x=1680461085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YfqyIjiQJtSpVBzWioT9SfB3vkVqUAIhO8ud5pGzO9o=;
 b=YL2VG9SyzgUbVleXf1DagqlQNH/sWitNp51ELCG31gqjvSwB4C78cRAp
 9PXFTWgX37O/uj7SP0upKgYgLl5PJ5Tc2MOMH6hKEW9iZBXqCm15cjER8
 S06m3HImQilZgrg5gydBqAz5fJZsN0VW3ufr1wyKz7lhJEQNGhWZhX+v2 k=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 02 Apr 2022 11:44:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2022 11:44:40 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sat, 2 Apr 2022 11:44:48 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sat, 2 Apr 2022
 11:44:40 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
Subject: [PATCH] hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model
Date: Sat, 2 Apr 2022 11:44:27 -0700
Message-ID: <20220402184427.4010304-1-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Graeme Gregory <quic_ggregory@quicinc.com>,
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VErCzMBDSkoX

Current fmc model of AST2500 EVB and AST2600 EVB can't emulate quad
mode properly so fix them using equivalent mx25l25635e and mx66u51235f
respectively.

These default settings still can be overridden using the 'fmc-model'
command line option.

Reported-by: Graeme Gregory <quic_ggregory@quicinc.com>
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
 hw/arm/aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d205384d986f..b94a56e10093 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1092,7 +1092,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     mc->desc       = "Aspeed AST2500 EVB (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
-    amc->fmc_model = "w25q256";
+    amc->fmc_model = "mx25l25635e";
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
@@ -1161,7 +1161,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2600-a3";
     amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
     amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
-    amc->fmc_model = "w25q512jv";
+    amc->fmc_model = "mx66u51235f";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
-- 
2.25.1

