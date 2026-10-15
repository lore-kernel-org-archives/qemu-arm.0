Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7BCC6B1C
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 03:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHCJ1-0005TZ-Rk; Wed, 14 Oct 2026 23:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCIx-0005NH-D2
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:38:56 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jay.chang@sifive.com>)
 id 1xHCIu-0008M7-C5
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 23:38:55 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2e5378b281aso26800175ad.2
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 20:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1792035523; x=1792640323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6iOmegYCi2+kiLTh1Hh1rMDQY/0CO9Y8ougnF0CSQjM=;
 b=VNGrpkCdayviAPS+8JFAxchFHDh346x5RNUq3rxPzDv+j+UI/BD1cHNUKJkHpWgCHp
 u/5tRQB1ta7dCU19ygrRT76pczrX9aUNWV4dkd/IDEv2hapBK7DMxh7wTaWP+y+Hm9Wk
 UUh0UPYjmKKtTz8ThiRnUDI9zNGOjJ2guWrZ+EeekOkLwF9p4FkBl1wvRpykAFjtGTmv
 E7crC3m5nnJvePH5h7Ix4ouomaHsCwtVsN9fTCZlUKXr/UOKQ3FxPYhfB56eOvlvyMh6
 nWj1bH0IZTKRZjxFZF+u6dm2kSKkRsaRFT2ATJ6iWjTmqViwgBLxAfsiGzv2JBEshdY/
 g7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792035523; x=1792640323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6iOmegYCi2+kiLTh1Hh1rMDQY/0CO9Y8ougnF0CSQjM=;
 b=wgyqVIeUN9R8AfIV22quL0/0lb/j68R9cjYUCZH5mobBfRobu9GGY8WzKywwbmhV/G
 mnXSOfHdX0eljgvSQzPAy/cpHYb2sS5dB6+XaKyZdG67jWQLLxdqy73CbKWCOabb8cZC
 rhSqVS+Y08BbtvUna7+3YMwcoyR3G2YLzFLOziTF33GWpMP8MFA+nyhURSsCR63FecZQ
 hKgSs1L+4T4AtMz8+2ZyoBRlA2mtd6wjiKkwofAScPJuuF/sx88yf1y5A5VkpXri1NPf
 JPpv6biV8aaDQzYP7uX5qrEOyso02CXOWi6A7gESZ7IcY3azUHR85hdZAXMb25qj11f6
 +4zw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx3sgjzD9np4JlZgzK8DXyyX0MI4BN5gIrJE2SOEteUcg197LlzviAGWX8FmuaNcPHhGEdC7rNP0Q==@nongnu.org
X-Gm-Message-State: AFq9FYJAVjPrNhkylwCP1KV8IXtn588sxerT3GmE0GMskhzA2k9vDnTJ
 7HZoFMWY5K7G6crONCRyLbznTlBZphiCuiMU3uSEAuADWrZq1VQmH3O506fhDwEoQ0A=
X-Gm-Gg: AYBFou1ky2EO5nzgo0qcStOMKJJwni1/pbjusjAKoEb+6w3/zbJQmTm3PB7oCWtO/zC
 wxc93E9qCpRpDuYdT/ChIIpPLRFSuBqi9Vc9px9M74QMb+YQ96i9O7JWswXRbotdc+SXUXZ/XRQ
 atLDCjP7CMrSik60YEIxpq/IbAWwubNB0xrU+OWBsb8Qx/xkNj6EJjo0PdBv6hapTHpErO9a3U6
 csG1gIR/IaPmXlka5XLyLveKEM2tNlADfaJgrPbDDt2VP8a/fwxj124Uzv62Zrp6b7Fc2zL4SOR
 1rdZDLYP2b0K4Gd+X98ePYoEwiVi2sDEAX8VwgIZtowrZ+irMoq7Vqc95Co/7rUS5zMWLWg0FOq
 jdFiHxg2xgAY5tMDajLIZAKGroe3jOndg6SGuqWB+8N9Y2F/cw9el1dXdmPt/tMYCaFRIWItA/0
 tV7N2dtXgo5+YBnOAtO03FoOLqWPoM5mf3f/+3J8u/bDC8IsfVCuAp+tFkbiQ4N16im3fUiutLD
 BB8erviXxdSOqVYr4V2GQYtMhBPhei33yOv
X-Received: by 2002:a17:90a:e704:b0:3aa:fc22:8aaa with SMTP id
 98e67ed59e1d1-3ab3b0951e9mr14778761a91.67.1792035523459; 
 Wed, 14 Oct 2026 20:38:43 -0700 (PDT)
Received: from jchang-1875.internal.sifive.com ([136.226.240.181])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cd635c612a9sm559188a12.17.2026.10.14.20.38.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 14 Oct 2026 20:38:43 -0700 (PDT)
From: Jay Chang <jay.chang@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 Jay Chang <jay.chang@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 4/6] hw/dma/xilinx_axidma: Reset both channels on DMACR_RESET
Date: Thu, 15 Oct 2026 11:37:31 +0800
Message-ID: <20261015033733.35116-5-jay.chang@sifive.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261015033733.35116-1-jay.chang@sifive.com>
References: <20261015033733.35116-1-jay.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=jay.chang@sifive.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Spec says setting either MM2S_DMACR.Reset = 1 or
S2MM_DMACR.Reset = 1 resets the entire AXI DMA engine.

Also replace magic number '1' with DMACR_RUNSTOP for clarity.

Signed-off-by: Jay Chang <jay.chang@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/xilinx_axidma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index 6892d494c0..687b5080e0 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -554,10 +554,11 @@ static void axidma_writel(XilinxAXIDMA *d, struct Stream *s, hwaddr addr,
         s->regs[R_DMACR] = value;
 
         if (value & DMACR_RESET) {
-            stream_reset(s);
+            stream_reset(&d->streams[0]);
+            stream_reset(&d->streams[1]);
         }
 
-        if ((value & 1) && !stream_resetting(s)) {
+        if ((value & DMACR_RUNSTOP) && !stream_resetting(s)) {
             /* Start processing.  */
             s->regs[R_DMASR] &= ~DMASR_HALTED;
         }
-- 
2.48.1


