Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33326njb;
        Wed, 4 Dec 2024 00:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPHORM2rOB2j+8sg43H33zNxU86oEAWB1NN0WfKlP23riN9zWi74SL/hC19v7yaVvJFxkbwTadDHsrEw==@linaro.org
X-Google-Smtp-Source: AGHT+IHg+8hRUfOOa6MHvTSXWGUA9amW0HyfTUu4SnIMYtjHBetqL3iPKbQmJlDkKzhlD1Bzhxzh
X-Received: by 2002:ad4:5c4e:0:b0:6d4:257a:8e with SMTP id 6a1803df08f44-6d8b72f189emr84944356d6.4.1733299584356;
        Wed, 04 Dec 2024 00:06:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299584; cv=none;
        d=google.com; s=arc-20240605;
        b=Pq4YX+7E1ZL+p/U+MXImGxFlHWAM1HxNfhbM2PSdH8snmCFD9WhiPa9PQiZ9rzjxZB
         4aHKoqlgH6d3xSTEFSyd1Sgg5mbZttriY/SoSI2XHCyV2KkrRqUQQNaGeAxF3gs6uaXk
         mAvW3fM2RRWiJ5KPlRpwBoDxrWdsA9Xe1ZHTJrqcT80aRuy/gTEh/pn7/xe4+WHOwbBq
         ArGJWX6Mzu/6zcQ+cmEnPMoLzHQOP+MuJG/xPiD8TzichRLADcm3yIhcICsGoRzHARH3
         R+SIqq1u0JD8hCMILUpgcITuEDiPxCtQWj6Jf4gdukqOLtIAZhZiuBxSOYc0EPM4rS1d
         p1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=d86QEHKM7/8hH30wbB6PgYpPuaLCacZzfKYgJFhLTZs=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=JeHrY95WvMi+a3bkg3eJ6tUVC6qomP6OQHYitMCNdfj7IV0UbOWftfglwJGIeIHUje
         yVAVGTlGUhyUcfltbFNMfk/ErRfBZBeKjy0N47/NPZPv7YKuTMAvgferZJPJYldgc07k
         qKJE2Trwqzop3e0b9zKE4obl5erduXQ0TrbSFtZQb5nKwovVgwpzywyd0JC3BMtmhgjx
         Nj66fnU8Beg7y8zgOfx07kff0pym/OiNL0ZJctKK2/E2o0/8zbixie1BbiP9WXY9zc4H
         LZUooeHKvXJJAgliAG0RWWnSuwfXWdeK7r9RkHQEEKtpx7lNvyzfsLVG+2eJOykxOUMP
         kRkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849314adsi1680869985a.149.2024.12.04.00.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:06:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkOS-0004Gy-SR; Wed, 04 Dec 2024 03:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOP-0004Fp-Oc; Wed, 04 Dec 2024 03:05:55 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOL-00082v-8j; Wed, 04 Dec 2024 03:05:50 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 5/7] hw/sd/aspeed_sdhci: Add AST2700 Support
Date: Wed, 4 Dec 2024 16:05:21 +0800
Message-ID: <20241204080523.4025780-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
References: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
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
X-TUID: RLMhStGEj3CF

Introduce a new ast2700 class to support AST2700. Add a new ast2700 SDHCI class
init function and set the value of capability register to "0x0000000719f80080".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/aspeed_sdhci.c         | 16 ++++++++++++++--
 include/hw/sd/aspeed_sdhci.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index 4e64e2537a..de92f84111 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -239,6 +239,15 @@ static void aspeed_2600_sdhci_class_init(ObjectClass *klass, void *data)
     asc->capareg = 0x0000000701f80080;
 }
 
+static void aspeed_2700_sdhci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSDHCIClass *asc = ASPEED_SDHCI_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 SDHCI Controller";
+    asc->capareg = 0x0000000719f80080;
+}
+
 static const TypeInfo aspeed_sdhci_types[] = {
     {
         .name           = TYPE_ASPEED_SDHCI,
@@ -263,8 +272,11 @@ static const TypeInfo aspeed_sdhci_types[] = {
         .parent = TYPE_ASPEED_SDHCI,
         .class_init = aspeed_2600_sdhci_class_init,
     },
+    {
+        .name = TYPE_ASPEED_2700_SDHCI,
+        .parent = TYPE_ASPEED_SDHCI,
+        .class_init = aspeed_2700_sdhci_class_init,
+    },
 };
 
 DEFINE_TYPES(aspeed_sdhci_types)
-
-
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

