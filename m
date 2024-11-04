Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1869945njc;
        Sun, 3 Nov 2024 19:22:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoGCDv4D5B1O6m4vAQrw+FV3vFoBivXKUeZgF7WPt8vHYOEgGIv9gNxWtfaWCKMroUvSiks77TbT2B1A==@linaro.org
X-Google-Smtp-Source: AGHT+IFlZx9SQewPDYUtWL4XGI8Ko/t2bIyhYRc78gcwls21qe2/pxAMUuLkHDP+IJjsbFJMjNtO
X-Received: by 2002:ad4:5b85:0:b0:6cb:440c:c44 with SMTP id 6a1803df08f44-6d35b8e7259mr206762376d6.1.1730690544630;
        Sun, 03 Nov 2024 19:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730690544; cv=none;
        d=google.com; s=arc-20240605;
        b=FvGPP2vbysOWLFYeIjpcSe4zB/gH5gj4GiIDWTJr02f62iX5YkbAgw5+CeeH7QaNnf
         LakwC49VQuIP7Sowt3S6YX1EQ0YoefNG/ZF/19EugWCFl+/DSeAa9AZ64a2JT6mPxcvr
         gALUaORuZWXyBgzmVn3nwrag7mOXXosgVtvmVnr5nxkCurI4tlsMBHUVsf1uvZ+XVFUQ
         q+dun+Mpsi03TnczmFia0vp4Hv0ft1pekKUFOpkwNouGsC3dj4vBsjVg8vMNpYG3SeB/
         1jVBhT6P5KDO7E76w+Z2gfmGQMW2POW83Us5DhrMmVEdaMTQu3mkYlPzvidVTyh+tWYH
         KBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=e0zJcZRcqg+1NOKgVvtGJzI5LhPoSpDJ/Aj0JjaDGoc=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=iwr7ejWx/QVimFWSScnPeq5Hw60p4cjCuPbiU+RspXGgtUpH1kyuXJA9IppoRL/pWR
         vfm/LQFW3iS/04AfinbEI8fvPkeGEujx4h5poOv/0y1KPpvVs/q8XXNFPsUhCKnXLhKU
         ILSjotVdE7MhrurgJhc4e2pQCZi2n0kbwHHG+1GL7ifauQjulhWi334r4MQbiMrTIMpo
         yAjpQSR6h4kLW1Bfdq1zD94z2MV0fR6dlVkoZxlAPTQEMH7osflJnlQwoKCotL6zhvUs
         tuuVitPjBucTJcU3du6aVtc47K18BlBugL0z+uRxznigtGZLYvLSPDxPx6dDtL30euVB
         0VBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fadf82si100527696d6.78.2024.11.03.19.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 19:22:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7nej-0005uG-NM; Sun, 03 Nov 2024 22:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t7nea-0005sH-E7; Sun, 03 Nov 2024 22:21:21 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t7neZ-0004QT-1g; Sun, 03 Nov 2024 22:21:20 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 4 Nov
 2024 11:21:05 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 4 Nov 2024 11:21:05 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 2/3] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
Date: Mon, 4 Nov 2024 11:21:03 +0800
Message-ID: <20241104032104.2784183-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104032104.2784183-1-jamin_lin@aspeedtech.com>
References: <20241104032104.2784183-1-jamin_lin@aspeedtech.com>
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
X-TUID: w1Lq/TsOFosx

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24). However, some boards are
design Write Protected pin active high. In other words, write enable the bit 19
should be 0 and write protected the bit 19 should be 1 at the
Present State Register (0x24). To support it, introduces a new "wp-inverted"
property and set it false by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/sdhci.c         | 6 ++++++
 include/hw/sd/sdhci.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index db7d547156..c675543873 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -275,6 +275,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
+    if (s->wp_inverted) {
+        level = !level;
+    }
+
     if (level) {
         s->prnsts &= ~SDHC_WRITE_PROTECT;
     } else {
@@ -1551,6 +1555,8 @@ static Property sdhci_sysbus_properties[] = {
                      false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
+                     wp_inverted, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6cd2822f1d..25ad9ed778 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -100,6 +100,11 @@ struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
+    /*
+     * Write Protect pin default active low for detecting SD card
+     * to be protected. Set wp_inverted to true inverted the signal.
+     */
+    bool wp_inverted;
 };
 typedef struct SDHCIState SDHCIState;
 
-- 
2.34.1

