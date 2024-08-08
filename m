Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp358167njc;
        Wed, 7 Aug 2024 19:50:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCVvBDZnOCBT+sNIk49LLx+rQ0FwX/VR03s0rEFYtuPuqGyw7wLEwhcWKrG9nhTV6PgB5O6zDC+8pn5HgBb2+BcPbesPFh
X-Google-Smtp-Source: AGHT+IH6BwwToYYqkwK4dRON6cLDrpcVHAiazaMgAtNcxCX2xse35AzB595+l0okbzlg4LL8mNBg
X-Received: by 2002:a05:620a:40d5:b0:79f:1eb:d76c with SMTP id af79cd13be357-7a38187c0cbmr61652985a.43.1723085435623;
        Wed, 07 Aug 2024 19:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723085435; cv=none;
        d=google.com; s=arc-20160816;
        b=i54NwCJcGFR6wBiOAJ4tgzhHSoD9djgsES675grdRWpFi2be858zGzgS95ew8bNywY
         YbDokmsmEj4CBSWiH5LGglO3jxptR1eYFLHXmKaIot9zoWYib3LYVJ0swvWLCIgvyWj1
         kEioAjYmESfLxN39doTdhPwpZL1Ttg69qCRA/0cQN3I4ag9lM12V5MQ/3Ad/GDKHscLt
         YDktK5fN97eB1wTKGCrZaGGKenJxQormClGGB72vJV0ATIIWyStzHsrZKt/fIcUb54nt
         uKJD3f7plgXMefy+haLs3KNG8+D/IVrwziGVZEiotp1hyUM6CfCevA5414rNjlcrvRi/
         BG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=t//rePLA+k52dBm5d1rFJnXgk6N6lTFGW01h4A4lujw=;
        fh=sVs3p8gbptRv32z9lLYpJL2ORX7RrMh6U4eLBNuVM2U=;
        b=OE6ofhmx06KpGiMTqK/oqaM0jm2XF1UejlQ70X0dlXwUdPWlwuw8lugNJq3y1HJXWE
         PSEyH2DToMMa6Cp9HWqjmSXwZICDZx/ssweNuG2SMcEE+24LTw6PKmTl0kBA/prUdLHX
         w4FWPMtrdSa54UFdIHIvwttSTedHbVc8eH4BDwe4L2hU18x2fzGQm3VTCnZ22YYigwW4
         nMdjdFfIqUVZVFnqJEuALXoMRFKkhHWRCMkN78v0sriFIZ2WJXSvJeVNZ8luvtNLdXkW
         9qBaU4j1f1rHujM1Otod77FvUIAh7lX5GRwMsNeC5UrxCBHRCO/Y857G4q48GoD98DiJ
         gzdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a37882c232si312596885a.504.2024.08.07.19.50.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2024 19:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbtDo-0007pu-MM; Wed, 07 Aug 2024 22:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDn-0007jx-9X; Wed, 07 Aug 2024 22:49:47 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sbtDl-0008AE-Q2; Wed, 07 Aug 2024 22:49:47 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 8 Aug
 2024 10:49:18 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 8 Aug 2024 10:49:18 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>
Subject: [PATCH v2 07/11] hw/i2c/aspeed: support high part dram offset for DMA
 64 bits
Date: Thu, 8 Aug 2024 10:49:12 +0800
Message-ID: <20240808024916.1262715-8-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
References: <20240808024916.1262715-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R/3MxaY2gjMU

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

The AST2700 support the maximum DRAM size is 8 GB.
The DRAM physical address range is from "0x4_0000_0000" to
"0x5_FFFF_FFFF".

The DRAM offset range is from "0x0_0000_0000" to
"0x1_FFFF_FFFF" and it is enough to use bits [33:0]
saving the dram offset.

Therefore, save the high part physical address bit[1:0]
of Tx/Rx buffer address as dma_dram_offset bit[33:32].
It does not need to decrease the dram physical
high part address for DMA operation.
(high part physical address bit[7:0] – 4)

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/i2c/aspeed_i2c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c1ff80b1cf..44c3c39233 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -743,6 +743,14 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                       __func__);
         break;
 
+    /*
+     * The AST2700 support the maximum DRAM size is 8 GB.
+     * The DRAM offset range is from 0x0_0000_0000 to
+     * 0x1_FFFF_FFFF and it is enough to use bits [33:0]
+     * saving the dram offset.
+     * Therefore, save the high part physical address bit[1:0]
+     * of Tx/Rx buffer address as dma_dram_offset bit[33:32].
+     */
     case A_I2CM_DMA_TX_ADDR_HI:
         if (!aic->has_dma64) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA 64 bits support\n",
@@ -752,6 +760,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CM_DMA_TX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CM_DMA_TX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     case A_I2CM_DMA_RX_ADDR_HI:
         if (!aic->has_dma64) {
@@ -762,6 +772,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CM_DMA_RX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CM_DMA_RX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     case A_I2CS_DMA_TX_ADDR_HI:
         qemu_log_mask(LOG_UNIMP,
@@ -777,6 +789,8 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
         bus->regs[R_I2CS_DMA_RX_ADDR_HI] = FIELD_EX32(value,
                                                       I2CS_DMA_RX_ADDR_HI,
                                                       ADDR_HI);
+        bus->dma_dram_offset = deposit64(bus->dma_dram_offset, 32, 32,
+                                         extract32(value, 0, 2));
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
-- 
2.34.1

