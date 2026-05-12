Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A37DCD343F
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 20:36:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMtoU-0002Vi-DQ; Tue, 12 May 2026 16:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMtoC-0002NW-M7
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:35 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMto8-0002NX-2i
 for qemu-arm@nongnu.org; Tue, 12 May 2026 16:34:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so3563295f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778618062; x=1779222862; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+PL/MH4uw3EOiajsILDQeY6KgmiCKgLUvtYeV1v2eOs=;
 b=xdcMyVOpErYCApvKo8vB1jw6FgIP1h2OapIU6ZJZW4HPVGdGe1FFB3W2SVzSBBcVZd
 X9gAUUNiRekJ9HOr4KFxFJEt8QL8djjyIB57VYvR6dcofRxsZEipuUcjVKQk/UHEDcO3
 rzQ+JBhBAYZCuhf2iXlJuzVBdTQFJpCN15V2LorxyK0/wMoFTseo5MRSjGHqqwlMwmob
 BMmEIZiD8C2yM51nr6ZdY3gZ5cG4VOa1/t5OQNH8SqYPi22cyojbN8Di/bZeDHXUoOTV
 FS3tHSwRhax5xBkCxgLeEfHHSfJwuMOkNTuNZDIGziGXYn9Liv8N/hMryaG+m1wK71Js
 Pv8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778618062; x=1779222862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+PL/MH4uw3EOiajsILDQeY6KgmiCKgLUvtYeV1v2eOs=;
 b=TP50f0HtPcfpdmX47TW+o94dMmDZ8J5ODmrlNm3ZrvW9q6OHIucvieF1Ko0kTRez3N
 l8Jlw+5hIx9D3AmOSePivZSe7bpdf1wk7WxVVhn243QX8QrX4bv9+9pl6LviJb+qBF7U
 U9KDmea+6/AVPoOKGWev2bvAcsYbypgf/YENigYqL5GVhVhQaiI/V1+50bc8xGJddiJr
 lRPbnGjYauADpLy3OdEuT+2Norqyf14N21JPVAc6Rbch6s5EdYY3XbnO1/FG0kikkrRT
 jxeSqfayLU+EOp78sxgEFK+J+hpY6BF61wnLybBIlMjBN0omZ+8m5IG86HrrG/kcNq/t
 g56w==
X-Gm-Message-State: AOJu0YyuQC8lf4FTTyorj6scUdwJAg37NT9wnBswGiXfHIbe4f7meypg
 HVq/A/W21+JPJCPQAvUYdGEFjSstjxCO01v2IhPAjXQVVXnmpmW9/Gy5p2DUU0vTxod1EwkdlPz
 5q6k/
X-Gm-Gg: Acq92OGIfemsXo4GEi057UCUdWhWNvlQCl8T9ZI42mbhCtqmKOoBsSrjh9rFNFZD1Fe
 7cEAd3pNAb6H9p8gn82jhO26frMwrfgpHnfMTugzptU9WeiGo7UMnkJJTRVDRpAau7dGrMDFzQj
 zLernFDFIlDUOLDJu8ocz9w5GZ+fIh2wKyxfF3gICYrLtxHWm9RV0Jq6icIE0DLwZ7k/2FMRuy/
 ynq13FyPrCHmAy09w6lq3rZt1wH2zSyqlKRW5ynfy3mLSwjAohTV43npVhnuYAE5vACL8jB9RKI
 bfc9elNk4DpLBST3b8x5M9fwYVW+TxnILYzFjAZMhkky26oHX93wlW3tEOpjyzgj9UJv9thMg6y
 rbrkoM7rupCnutnrGhpolUcnwgkyItZYDic8mhLYB9x11sNRBYL5zWi3sIgirpbNsBlVzYOUTaa
 CRElT3dWuJ3mSpS+Xj9CXtmtOXA4K9IfwRnsBM306eynymVXkXalIGOaLIYTw1UuxJz1haWdVO5
 StTyJWkWy+Bj1B1dYxyGsU3FdSebG0=
X-Received: by 2002:a05:600c:83c7:b0:48a:93f8:dd02 with SMTP id
 5b1f17b1804b1-48fc9a31d69mr4786575e9.14.1778618061746; 
 Tue, 12 May 2026 13:34:21 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d69d0bsm16350635e9.13.2026.05.12.13.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 13:34:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/12] hw/arm/omap: Remove unused omap1_dma_irq_map[] entries
Date: Tue, 12 May 2026 21:34:06 +0100
Message-ID: <20260512203414.3633237-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512203414.3633237-1-peter.maydell@linaro.org>
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

For the one remaining OMAP board, we use only the first 6 entries
in the omap1_dma_irq_map[] array; the rest were for OMAP1610.
Delete the now-unused elements.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 15087ba03e..40ca8c9890 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -3710,16 +3710,6 @@ static const struct dma_irq_map omap1_dma_irq_map[] = {
     { 0, OMAP_INT_DMA_CH3 },
     { 0, OMAP_INT_DMA_CH4 },
     { 0, OMAP_INT_DMA_CH5 },
-    { 1, OMAP_INT_1610_DMA_CH6 },
-    { 1, OMAP_INT_1610_DMA_CH7 },
-    { 1, OMAP_INT_1610_DMA_CH8 },
-    { 1, OMAP_INT_1610_DMA_CH9 },
-    { 1, OMAP_INT_1610_DMA_CH10 },
-    { 1, OMAP_INT_1610_DMA_CH11 },
-    { 1, OMAP_INT_1610_DMA_CH12 },
-    { 1, OMAP_INT_1610_DMA_CH13 },
-    { 1, OMAP_INT_1610_DMA_CH14 },
-    { 1, OMAP_INT_1610_DMA_CH15 }
 };
 
 /* DMA ports for OMAP1 */
-- 
2.43.0


