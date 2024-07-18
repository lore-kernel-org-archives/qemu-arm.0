Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260777njk;
        Wed, 17 Jul 2024 23:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQFx0tagX6bVC5LydEPmWf84zHXsdeYfhNl5we/XjCb80g+31t06nTCHzk6kVsbxWbYBfKlTIaw5yNHCQC5p95fUS3/8zP
X-Google-Smtp-Source: AGHT+IEBKJjERuz8WhUFS1vsBZJ709ZAfKErhYe3JoT0Adbg6/h6aJN/OIMeOzVG9Tvz+ijnhL2y
X-Received: by 2002:a05:622a:130a:b0:446:3add:2cf7 with SMTP id d75a77b69052e-44f86e61fcbmr48174871cf.56.1721285515820;
        Wed, 17 Jul 2024 23:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285515; cv=none;
        d=google.com; s=arc-20160816;
        b=s9Gc/KbHBSk81mrJE0EVambpOpSEE+CjbRQAy6nYM/loQW99/xRC69vNOHr3DkeIQk
         vV6m7ryr5v69BNYsHf8NhgBWJpDZBjL1gd8vbc6o6TNOB2Q6Vybnl1jvMlu+bRX46mnc
         tt5J4e2y2BORTyte15277WSJsnJfUVYpHJPG4DrnEJaP+iINko3dyf7oRmGm9tp3JC/o
         PaxB6K/iIYKhCLiGWxcmIr6wBk94utqcCF3w6SIJvK2FN42vQaEQzujCnJkpkEGH+AEn
         Mb14YQC0IXak86TaUYV3qFN19nHBsjBFKMyMTTMJHXWQ9QTMdhVSMgh97rT1/UHk6kff
         YU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=jbdzXJXxMYo3LKdAWQMkDQMeMmL2VQ+tWStKhA990i4=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=Ukvk4lspYgDeLGat2hSk1O2HHn7JlmHIHhWCLveIuKTH5JPCCoyzmaPSAQ+SrbSxD5
         5PNijRpxieu9jzKaPGGa5PO26FQ2AE+6Z0ZED9QvYxB8FEgi9b4DYfqDEZDBt9LGgKu9
         dHLORomPkwz1Ep7coZEYb1gSJn0FC/adD78J9fgdY6srKLhfI24pgIGdEUWhZGUqKFs4
         0JTYkLbiUFr5Ntnrxpqg7H8a5UQDQRALMZF/CqUp3SVomrXjf2FyFlV56SuKnrwyGGb1
         kxmLpmahoY4x2Xb/5RIST8LEuqhqCZg4fkZItv8zR7PW/tAvxDoi2QejYp+kUQ8oiTiK
         b7uA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f7b48si116823201cf.352.2024.07.17.23.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sUKyu-00088i-3r; Thu, 18 Jul 2024 02:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKye-0006s8-Ac; Thu, 18 Jul 2024 02:50:57 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyc-0004VA-Lb; Thu, 18 Jul 2024 02:50:56 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:17 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 11/15] hw/i2c/aspeed: support high part dram offset for DMA
 64 bits
Date: Thu, 18 Jul 2024 14:49:21 +0800
Message-ID: <20240718064925.1846074-12-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
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
X-TUID: t+5/m4YxoUPv

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
---
 hw/i2c/aspeed_i2c.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index b48f250e08..e28deadcfc 100644
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

