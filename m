Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp76486lfp;
        Thu, 21 Jul 2022 23:43:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uufYeAsbpZfvnGs5VNvxw7ARvbC8cWXVIScqgQcjRNaQ4YgH1Wlg/aPWJx5K6ledzBPGc+
X-Received: by 2002:a05:622a:48d:b0:31e:f1a8:61dc with SMTP id p13-20020a05622a048d00b0031ef1a861dcmr1786836qtx.129.1658472233477;
        Thu, 21 Jul 2022 23:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658472233; cv=none;
        d=google.com; s=arc-20160816;
        b=JwVFxTA95iFnYMcYEjZr1skxS8smAUnmgE+bH+rSaxBTMn+R8iXuaCU8XuX0BqiJgj
         +lrNJgXBQxAYEy7FnH5oOuzk4ahS0KqBrx4EaY03GGgRlKjMHnFE1gdsSHMkEdoPZZ5J
         1W5NjU5qcD/t24wmiRo/54HKg22XhI5ILSZIgoTDoG7ftdwH1NV3l7yzlqI4eL5bBuRa
         vJ2vUVZxQy3rIyriSUVDI3h97R20ZF0I8pT+5Z/hRCl8Y7yJiWJbUsWaW7dvhmLJC29U
         ZVbf1FaYWM+S3vZRxdJ86ihapELZnAy4OtvilRZzjjyq9r+2hNr4fjDoEUO/6g5+tcGg
         lm+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=UfD/R3h9lxqWiWNdsm2XB1CZlnKM+OsPPeRf1pgT4JE=;
        b=j7HknNaWNQXfHke5ICjXZVbfQr3IPS/piOhPWQY3OssDDF4/v+P/g7tM2JvNWw+Uz7
         6+cKC7UI5EoxDCWi+TpGINWtdEO7a9arZLUPErhxAz0qSsw1p8RLJnvxO3lLUbsLycNp
         EcIv8PsD+5s/3ja6rSmdFBqKdXbPWV80Yq6OJEzkBpYN2NrKiXb8IQJLhjv1F8NwHToi
         I6OXy824fquEpip/j5FliY1CofeAC10uVXcsx5eoNb0SOEsG+kcwzwyX1Y6ou5zLxS82
         KLuz0LKuIa9J8PASvn7GFeC30YBrkbTJu+PkGp2WQJae0jklPX8+ASaCD2wGIOD6to/W
         IiNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez3-20020a05622a4c8300b0031d352c7b5esi411760qtb.199.2022.07.21.23.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jul 2022 23:43:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oEmO8-0005Bw-MH
	for alex.bennee@linaro.org; Fri, 22 Jul 2022 02:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHL-0008FB-Pa; Fri, 22 Jul 2022 02:36:53 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:51285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org>)
 id 1oEmHK-00018X-4F; Fri, 22 Jul 2022 02:36:51 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Lq08b319Wz4xGJ;
 Fri, 22 Jul 2022 16:36:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lq08W3Fqtz4xFy;
 Fri, 22 Jul 2022 16:36:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Date: Fri, 22 Jul 2022 08:36:02 +0200
Message-Id: <20220722063602.128144-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722063602.128144-1-clg@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w2Kw=X3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: KUaBA80XAnEy

A mx25l25635f chip model is generally found on these machines. It's
newer and uses 4B opcodes which is better to exercise the support in
the Linux kernel.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1c611284819d..7e95abc55b09 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1157,7 +1157,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2400-a1";
     amc->hw_strap1 = PALMETTO_BMC_HW_STRAP1;
     amc->fmc_model = "n25q256a";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size       = 256 * MiB;
@@ -1208,7 +1208,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
     amc->fmc_model = "mx25l25635e";
-    amc->spi_model = "mx25l25635e";
+    amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
@@ -1258,7 +1258,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
     mc->desc       = "OpenPOWER Witherspoon BMC (ARM1176)";
     amc->soc_name  = "ast2500-a1";
     amc->hw_strap1 = WITHERSPOON_BMC_HW_STRAP1;
-    amc->fmc_model = "mx25l25635e";
+    amc->fmc_model = "mx25l25635f";
     amc->spi_model = "mx66l1g45g";
     amc->num_cs    = 2;
     amc->i2c_init  = witherspoon_bmc_i2c_init;
-- 
2.35.3

