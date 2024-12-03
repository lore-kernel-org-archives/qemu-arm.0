Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3372887njk;
        Mon, 2 Dec 2024 17:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5Dey5uhUR2sJQNbuK5813ceCnikrCFXlZBPDCB7I9ye+5g71miypylF9p4joDaJh5S/E/D1w+BWey7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFl8UXykXkUvkx5jPzHfv2kW6HcneQbHf0+SdtmmobkpfyFNv2a9pyf1Ihqzub9NaCxBuar
X-Received: by 2002:a05:620a:178f:b0:7b6:6a76:3a49 with SMTP id af79cd13be357-7b6a65cdb6emr113522985a.11.1733190810869;
        Mon, 02 Dec 2024 17:53:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733190810; cv=none;
        d=google.com; s=arc-20240605;
        b=LZRFax1IZ7i7ze5ziP/7V/fdEryfGhEtzx2QElaucaYvf123rwhuIT1qqFLa7TNV6Z
         P6IIeAEV02MgL7W4AtlMw3gVYAmEFiWzGcUcwd8lKT7Fql78Q+IA6qBid1BUSrEkQJw8
         Yh0vLDRMhATy2v2du+zuLSFCIpeb+hxQVH0eo/fpkNNilBnWPf4mEO53QTkzNRRKsUfU
         wVWw4SVMoyE1FrIQjIGIzhRX0nK14n4FKag3WKGqnnyuqtGPbYPs9VGDUB+nlURdVVDU
         pDNvtx7wuk4jSbtfT9M7worYGjFkK/1Xn6RIvDKzZH7CqI0voC2y8RKpTSwvqaXkIvtA
         730Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=jrTZwKCvU0Njza3ND8dwx7RF1ipD1WBHtl1wE9m9cYY=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=WA1CFl8/O+wzKZBSBqT2oyG8PhPBDnPyQfTW3+8zuCc1zYiZUazL6z537b4bBih3Gb
         u5RAAz1FNRcNdVBSVrlvWxUo2Xsl9gntwCVTi79zCI1j+jO8edbJODE+4+Yziu8TbZFL
         J04aR4iMKBKiVYXMzwyH2ThlpZDwAA2UYtfwHQrj9512KQvOJgBv3nWHpexQkrkspRxn
         XPG7RTsDgMWmrjVQYBnzw+thBLWUj5rVdk1EyaYfwteoA0c/1KqcKP483l7wDU6874m5
         5Ubt3q02uwq9z+aJix3IX3WG8VH2PeQTQRSopYsHzcpLvQvkD0mR0WUHaEUqRVmpFLRs
         5Gvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684924fcbsi1360459185a.141.2024.12.02.17.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 17:53:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tII5t-0007Nh-KT; Mon, 02 Dec 2024 20:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5m-0007MY-34; Mon, 02 Dec 2024 20:52:46 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tII5k-0006Sd-O1; Mon, 02 Dec 2024 20:52:45 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 09:52:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 3 Dec 2024 09:52:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 3/5] hw/sd/aspeed_sdhci: Add AST2700 Support
Date: Tue, 3 Dec 2024 09:52:22 +0800
Message-ID: <20241203015224.3985820-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241203015224.3985820-1-jamin_lin@aspeedtech.com>
References: <20241203015224.3985820-1-jamin_lin@aspeedtech.com>
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
X-TUID: whpqg1dQqx+4

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

