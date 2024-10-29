Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp106375njj;
        Tue, 29 Oct 2024 02:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXhcH+Q9dUhX6BtMb1yiLV7uAcHdO5mVXV9DRo4DR/F0tTxgngMHlEz8nFyJwrfpqt9oOYUj92O84/LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE7b5wHqGl9EVDmQTRWivhiSYa1+rmovVpqEAkW9okp6qzVn5+WPNrFNwRKsioUHYDsUwiT
X-Received: by 2002:a05:620a:4708:b0:7b1:481f:b8b7 with SMTP id af79cd13be357-7b193f3d0e9mr1774472185a.43.1730193498147;
        Tue, 29 Oct 2024 02:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730193498; cv=none;
        d=google.com; s=arc-20240605;
        b=O3aIfDhIIgS7x7b4FFjBzTB+kbuBXED4sFfeVnIIfFRBnJ5VN4610/CZ3xGvaVO+fl
         E38rmUFHTJRgki+i1MgoFER+KMXyHzIieOryKP/F+3DanCicH0v+Y/Pr6+ri+lNdnoX9
         nGD4YOrNQzBdaaY+4dLgDcL67yw3O40btYiUTeWWQGAIMJw8lgSZ1hn3dvwaxEqKSHMF
         3xU/MGwgEEb0HpaTf7i/7WGn0h6N5yz7Pntubzt55KRPvGx94B5ORoDAJdhQhRdJ58ju
         C8PzQy/OQJBi8sMVwrotRPnNt+hZP4CZz8a94LnDA2f9Z+0Z3ejo/Gfdv2BwwOIS1wp4
         C6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=gV1O5Rb7blVfbi2RD7rwG4QbWvEX0MzbQQ1ZITjqVKg=;
        fh=4rHsaFhVkVMXk5u1IVZO4usPBujjRbqK1KMv0eZ+6CI=;
        b=BonKq2yBsOLGXcUOncVbc6srS3V9PVMPPfCc1/Xy3wJCbPi1DTXxBRhBLmoAZswyXP
         rykPqqVetE/K1oE2EgG/VBMV4itFRPuhVyl/nRcdR9DMvnZlFmJzMA6Ivkl0eljNoJ3a
         DqJ98Qli44SaCJVi1SXXLh9KwoPYURETQILOuf7Sh3X0CK7hK+EQr4rJ5sfonzkKm6fW
         H9kW8xdF0ferlXLJQlvVGzrvKywjYNVhKd/rizNvzKkFD27Qo8gfKBDXpla2zbSUX+D9
         8UlPe1J2GETRKTsXkiRJHKRowt7fUcnSocL6KCIbsjLv1FA1niO0Ra6LjwH5szgDK57P
         at/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d344729si1055911985a.491.2024.10.29.02.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 02:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5iMW-0000bG-4H; Tue, 29 Oct 2024 05:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMM-0000aR-Io; Tue, 29 Oct 2024 05:17:54 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1t5iMJ-0003A3-SA; Tue, 29 Oct 2024 05:17:53 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 29 Oct
 2024 17:17:31 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 29 Oct 2024 17:17:31 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Bin Meng <bmeng.cn@gmail.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:SD (Secure Card)" <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 5/8] hw/sd/sdhci: Introduce a new Write Protected pin
 inverted property
Date: Tue, 29 Oct 2024 17:17:26 +0800
Message-ID: <20241029091729.3317512-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
References: <20241029091729.3317512-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: ESK0IGd2CNX3

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24). However, some board are
design Write Protected pin active high. In other words, write enable the bit 19
should be 0 and write protected the bit 19 should be 1 at the
Present State Register (0x24). To support it, introduces a new "wp_invert"
property and set it false by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/sd/sdhci.c         | 6 ++++++
 include/hw/sd/sdhci.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index db7d547156..bdf5cbfb80 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -275,6 +275,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
+    if (s->wp_invert) {
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
+    DEFINE_PROP_BOOL("wp-invert", SDHCIState,
+                     wp_invert, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6cd2822f1d..d68f4788e7 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -100,6 +100,11 @@ struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
+    /*
+     * Write Protect pin default active low for detecting SD card
+     * to be protected. Set wp_invert to true inverted the signal.
+     */
+    bool wp_invert;
 };
 typedef struct SDHCIState SDHCIState;
 
-- 
2.34.1

