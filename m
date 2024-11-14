Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp205780njc;
        Thu, 14 Nov 2024 01:50:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+ya+3rK1LRxBSi23HwNRg+a2e9WcOXExqat/rG35hgalFttnKVmF464LC2E1k2jRpWHEvoaQ+9imYyg==@linaro.org
X-Google-Smtp-Source: AGHT+IGejIHV7aZ6UlrISn3HP+qPCWtFohoKzPoxbBOLreOYbTwjwi4E2Xr+O14gU6KzU0Lvs0vt
X-Received: by 2002:a05:6214:3bc2:b0:6d3:941a:2274 with SMTP id 6a1803df08f44-6d3edcfbae4mr16343276d6.22.1731577806358;
        Thu, 14 Nov 2024 01:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731577806; cv=none;
        d=google.com; s=arc-20240605;
        b=DCvxakuDy+BvXWVOGtA6fiEk2pgvj1o64Afc5jOGh8dV/reUdvmMe0Cvgvbnoo/6wz
         KrrF5AFEQ12l8tjqLwNw8bDK3dw+nUsYQFU065T5jtJhfHYfQG1vRBmK5lLNLdQ3ByZk
         f+uUWnDYYNzOCsdTSF5EvAz1R+yXL6TQH3iOJ+PSCHc7+1IC9bonT4byFOabX9s07KWr
         cQBxLHatdXJoxi79YwKdl186KBXYJcGCQSeS+tfOG1HAUu8iK+zOsZPme0sU2Ng5+zXs
         JOUXJb/Hf4/m45ykpHx3A64gWzNQJT79q1lkbUc95Dm5FgMnXevblF6PHzsGXrwwhGFX
         CI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/oODKS6D8AMaIjaXKVJyluGx4nHcMgvBlxEda/qJiZ0=;
        fh=7EWEpVkwAKt238OnwFP+5VqXSxu55vPOeusd31PKmFE=;
        b=VY8xb4gN0trEgstMZUjGcXaPONTmN2R5IVnr+P4nPLAtLIOjR5BJbAMBjL9Fpk5vvf
         ffRpjn76jbyO6NpkojoVm8Iq6yxakLLGky4M7GoxZ3AyLZpXm/Q8FqdZs+Hn7alzx6Xm
         T8oyWHV6+CZWWFyx/YGjZ3K72xFYDAaQUVSUi6DO5tRQXsYN1Ut0OfRkz/5XVwsm7F9W
         KzJgH2hZ0GWhQPWPwVSrzmUGhMRVQjoQWC+YJ1AnT8jjVk9mERQinOMPNhhGi5o7lSx6
         GnzWTUu8JnyA1cXr19kKSvcYjgNG6vuUx3ct4Tl7eD91hph5w/WWLE5h48ia83srD0Qf
         15rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee9f532esi8654666d6.499.2024.11.14.01.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 01:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBWTU-0002TA-QC; Thu, 14 Nov 2024 04:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWTN-0002Qq-Gt; Thu, 14 Nov 2024 04:49:11 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tBWTM-0000F8-6E; Thu, 14 Nov 2024 04:49:09 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 14 Nov
 2024 17:48:40 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 14 Nov 2024 17:48:40 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v3 2/3] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
Date: Thu, 14 Nov 2024 17:48:38 +0800
Message-ID: <20241114094839.4128404-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
References: <20241114094839.4128404-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: Aigk7kW9Y/ro

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24). However, some boards are
design Write Protected pin active high. In other words, write enable the bit 19
should be 0 and write protected the bit 19 should be 1 at the
Present State Register (0x24). To support it, introduces a new "wp-inverted"
property and set it false by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Acked-by: Cédric Le Goater <clg@redhat.com>
---
 hw/sd/sdhci.c         | 6 ++++++
 include/hw/sd/sdhci.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 37875c02c3..06d1e24086 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -274,6 +274,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
+    if (s->wp_inverted) {
+        level = !level;
+    }
+
     if (level) {
         s->prnsts &= ~SDHC_WRITE_PROTECT;
     } else {
@@ -1550,6 +1554,8 @@ static Property sdhci_sysbus_properties[] = {
                      false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
+                     wp_inverted, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6cd2822f1d..38c08e2859 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -100,6 +100,11 @@ struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
+    /*
+     * Write Protect pin default active low for detecting SD card
+     * to be protected. Set wp_inverted to invert the signal.
+     */
+    bool wp_inverted;
 };
 typedef struct SDHCIState SDHCIState;
 
-- 
2.34.1

