Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3385867njk;
        Mon, 2 Dec 2024 18:17:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEiycDwL6NHj4/XaTizFbiWKxHf7lgzebCrz9iz0rKpDATemX7d1jsN4VodD+8v3tZg6s8dDQ/FYJpnw==@linaro.org
X-Google-Smtp-Source: AGHT+IF5uwdfRLi0nlLJIbD+qA7BazoFlCpim+dXYmMafQAsGyC+mxOF3zpphYvFgBDQgdckLbqG
X-Received: by 2002:a05:6214:2507:b0:6d8:a7f7:c39d with SMTP id 6a1803df08f44-6d8b741d70amr15226426d6.40.1733192240731;
        Mon, 02 Dec 2024 18:17:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733192240; cv=none;
        d=google.com; s=arc-20240605;
        b=AIoAIEMKD59B/LHjB4B9yvfXodtihv3X9rV3IiaQmlNr2KsohXMv0oF7T+bUocyCIt
         1hK79d+oWE1LJJtbJ6vHrdKPIgeFcWXsF617nvIOPboKonhoFkekfSpkdrtejJDx5dn1
         gIeNFgwMQWHt5LQ7BM6ul274TszZMK4m/QKjbzHpn83m6jGSgzbYZRb7e4JVY3C33jmz
         o9kNgRkcnqTEX1RAR2aT/+dH8rLdi5D0AS0G6MQ708cVsHvgtWjm3tb3NvDWg48df2VL
         +pndETiezZw14OQVzurhTTEHxw1qNkVWEeFAPw8NrPocHSqYSBGbOdr+CkXIq2d7SB8P
         daUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=jrTZwKCvU0Njza3ND8dwx7RF1ipD1WBHtl1wE9m9cYY=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=KCahHMoJ7Ei5fiexOwdNGGeZHTTe3oFANJbxngT2a+saQStWY+4oebsunFznSfxYaO
         hXhB1gPRcsLcHK5WO/lWCxOf9xvWJ3fUheurqPUAUjVcGGQjOTUBozfR8WtSKqNQDo2K
         dfxO91GDrwDEEsN4/B+jgMkmiOoXS5ctMcbp/55KJepLkWK1b3IWhJTYiOcML16Wueq5
         tuVz8yXCDOEpE4TQBbu+cbrwYHb9rsqani847o5ytK+PpJHd82D2NRHRbVVp8SD76dum
         +aimuSBl6JzwTsCw6qAF1qYj4otFXoXbpnzA5fQcQu9kMr43oZhZtwRe0fPBoP3fC38n
         ZreQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d87ed70cf8si112533766d6.138.2024.12.02.18.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 18:17:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIIRk-0005Tw-HH; Mon, 02 Dec 2024 21:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRe-0005Ro-90; Mon, 02 Dec 2024 21:15:22 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIIRc-0003dt-T1; Mon, 02 Dec 2024 21:15:22 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 10:15:01 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 10:15:01 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 4/6] hw/sd/aspeed_sdhci: Add AST2700 Support
Date: Tue, 3 Dec 2024 10:14:58 +0800
Message-ID: <20241203021500.3986213-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
References: <20241203021500.3986213-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1Ze9dCQKoBD7

Introduce a new ast2700 class to support AST2700. Add a new ast2700 SDHCI class
init function and set the value of capability register to "0x0000000719f80080".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/aspeed_sdhci.c         | 16 ++++++++++++++++
 include/hw/sd/aspeed_sdhci.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 93f5571021..4cba934f53 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -273,12 +273,28 @@ static const TypeInfo aspeed_2600_sdhci_info = {
     .class_init = aspeed_2600_sdhci_class_init,
 };
 
+static void aspeed_2700_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 SDHCI Controller";
+    asc->capareg = 0x0000000719f80080;
+}
+
+static const TypeInfo aspeed_2700_sdhci_info = {
+    .name = TYPE_ASPEED_2700_SDHCI,
+    .parent = TYPE_ASPEED_SDHCI,
+    .class_init = aspeed_2700_sdhci_class_init,
+};
+
 static void aspeed_sdhci_register_types(void)
 {
     type_register_static(&aspeed_sdhci_info);
     type_register_static(&aspeed_2400_sdhci_info);
     type_register_static(&aspeed_2500_sdhci_info);
     type_register_static(&aspeed_2600_sdhci_info);
+    type_register_static(&aspeed_2700_sdhci_info);
 }
 
 type_init(aspeed_sdhci_register_types);
diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index 8083797e25..4ef1770471 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -16,6 +16,7 @@
 #define TYPE_ASPEED_2400_SDHCI TYPE_ASPEED_SDHCI "-ast2400"
 #define TYPE_ASPEED_2500_SDHCI TYPE_ASPEED_SDHCI "-ast2500"
 #define TYPE_ASPEED_2600_SDHCI TYPE_ASPEED_SDHCI "-ast2600"
+#define TYPE_ASPEED_2700_SDHCI TYPE_ASPEED_SDHCI "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedSDHCIState, AspeedSDHCIClass, ASPEED_SDHCI)
 
 #define ASPEED_SDHCI_NUM_SLOTS    2
-- 
2.34.1

