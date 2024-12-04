Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp49379njb;
        Wed, 4 Dec 2024 00:46:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUPlrw9+SrOYtMKAO1IcaqmUNmZmQYALTCt4NPCsmiRfPcDz7FfLvavjG1Nszil8VBPYd0Z+dBJvAV5sg==@linaro.org
X-Google-Smtp-Source: AGHT+IEEqEMcJtBdU+pl8oM7USMAnxratHM9lfn9IduzgffTU1QnKP31mMVcRIDMPrBMA8YV0EKh
X-Received: by 2002:a05:620a:8015:b0:7b6:67c9:a267 with SMTP id af79cd13be357-7b6a6217939mr716370085a.62.1733301989447;
        Wed, 04 Dec 2024 00:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733301989; cv=none;
        d=google.com; s=arc-20240605;
        b=Ozo6W2gQgENuirp5LGMvvr0uyUUXTzJCxC0PClLlSGR+JE/AT/40r438Or3Ri2mQkJ
         OFl4P9px5h21/Y3pRn7ADr1laIRMYq2aBVTZcKIQSN/1YUGBMGCPPQgj3fZ44C0ucg6Y
         b2IpuveN44JReAWjnmd8twL+EvgCdF971cwp3fc7U+Aq6WUS/W4sFldrsxHhmFD8ICgT
         hv5DtrU+P3rzGmx3CCD9AJxJLG8GHL8dMW3EPmuXtvWIt641wDhT6Go4A9qfgePywFuJ
         IVNELw8Z9EvgUra2NadMkt7WJXyDtfSiPwl632YX9/vB3FgF5ajgy+ylIOby6EZsbjzz
         7eTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=2pyJvUS9AmxP7+HGXOIUIdOpnzI0lrk3W+JyyK2QaSA=;
        fh=oHzELYP6xEldnfh1elECkRDXzq+40wADKO/d7kYb8Lg=;
        b=cDXzBCPHeYRTypzbLHgYfiVT5tOBgoCE6V/FHEVUPJ+h31sX7twLdeDPxz0pz1CkXv
         UubPXsph7q5IKPHICyFSO50ETUsT8E7lhGZ+BfW4MWSYfBJRZ0emQc05y0Ff2H9GmeCX
         NlPNWAuE3CVHbv0+CWAqbnXrOokFfiLlxOtdT9AUPm2Ob+IYbZ0vbufJLVn6NFz2vKny
         Sh0Q8ZanmTf7P1+RR+AumqGRtS+TCFWnDph49Tx08pEoVGhv4BZuWkS4T2NxnLLiO3po
         RhD/Q3A4OObMCb8VAlJ3UJvRfe6vc1oQ0Po7e6+FZZpMEBTD38uRHtlSKQAmiLfKHOvl
         t2Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b4040si1643510285a.242.2024.12.04.00.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:46:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIl0U-00033B-OL; Wed, 04 Dec 2024 03:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0S-00032T-MO; Wed, 04 Dec 2024 03:45:12 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIl0Q-0006xz-60; Wed, 04 Dec 2024 03:45:11 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:44:54 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:44:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v4 4/6] hw/sd/aspeed_sdhci: Add AST2700 Support
Date: Wed, 4 Dec 2024 16:44:51 +0800
Message-ID: <20241204084453.610660-5-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
References: <20241204084453.610660-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qz9QrOrH2ye2

Introduce a new ast2700 class to support AST2700. Add a new ast2700 SDHCI class
init function and set the value of capability register to "0x0000000719f80080".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/aspeed_sdhci.c         | 14 ++++++++++++++
 include/hw/sd/aspeed_sdhci.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index ae2ec4a916..f82b05397e 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -246,6 +246,15 @@ static void aspeed_2600_sdhci_class_init(ObjectClass *klass, void *data)
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
@@ -270,6 +279,11 @@ static const TypeInfo aspeed_sdhci_types[] = {
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

