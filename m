Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE43CD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:39:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsV5-0000xB-VF; Mon, 18 May 2026 03:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUL-0000fq-Db
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:15 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUI-0000C3-2T
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso1009017f8f.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779089644; x=1779694444; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bGVucTk00lHJOoHDxhxqBmDjYYXRIxmmMPGfNidYBio=;
 b=OGp15DdJIajhT17FkUUlRwq90s2TT+g3whcpl+RXB7+Z5Gq8EeIC6Es5bJKgXGzRLO
 yUZuFEpG+U7ruuUaYS7dYcTrzYymuABxbzBy6P6+GWNDjQp+GPx/rT9JhCV5q8gnDjoi
 QTTIaA5+GDque0Y8G+24dTvr7LFjsUKx/17U6MIP2Grp1l7Bv3CBksRWwEM/ryuZlioD
 iWTzM2QVHmyi5ywyG8Mp6PpPwt63aVFCQRBHLRwqBgh6E3fgNtQXeFtO8ijC9Dgi3b/L
 0tRa+6aYwDVPPs6NTIPTh0kWANRrCJujy8hpxp7XHC0lPJQ/ZUf4yAHFYhF8mG63kG54
 7JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089644; x=1779694444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bGVucTk00lHJOoHDxhxqBmDjYYXRIxmmMPGfNidYBio=;
 b=qoYhD6PdTKQ7Koh6oKbnReXXP0gsqr5DXrYvYs6QkqdxR75flt2crb9RiLuEJ5dEwk
 quI5uYAwl897QUKuGoIBGQayhuCtCN+TkLCeRrr4VYha8XY70sHHa0KNwoyV3k3VaC0z
 +Esq6j1dDjim8v+X/pEEpG3MEX7z5fQs+68kBw7zIkNvgd0LFYOGfELGRfyMlZrJRyGu
 6kAw64hgZZzxQ/rKYtT7ps7YyfL4biprgW+YLESdACEWUIWuPqqk58kly5M4UA7AGtHd
 JRwxSmw6fYiT8N8BhJS0xO0wQpH7jWvH6wP4L5ao31ts1xZTT+lVnWqRDAf0hSH3uhG6
 Xbcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/d/EtjmADZLRuB2EWorSf8q5Dw6kG8E+S855fSg/OBi4D9nrIkjvSiwfng42gSx4dGZGhBwD+p5A==@nongnu.org
X-Gm-Message-State: AOJu0Yy+3ntyff4X479/k8OgxvxKCooekPHrNjuJwyum6AoR2k1v/Yk6
 2K+uetWnOYAZzajbRrLIYInb9il/RvERCc6hG2cu8XWROxxiz48+Bfth
X-Gm-Gg: Acq92OF2K38i5taT2aypqc1cAPVLV71ORdZDW3xRvieizCsgXNNJFVNIXJ35xfzllDB
 v77HP9mUV09YCz5hs9c7ei4SnApakW+jGBO+N9/v2CJen7FzpayUq0AaWIOhE0/tFtnvM6DZdbB
 z+LN7WHnEVTkK1ONYQ5JghGPWaGucRmtVS4hFkPCug7tHCPBpp6I+7IFBZePb6eu8bBfiRgfmKE
 KS+Vi4P3MNLRVY3dYcWrWH5svF7RG5BraztE51DlNe6OrkBEYYrC0j+LMFDYuCWjDHWbxp2g4mS
 cYes5HfMqpCafcnNEe5s9MoyQp7RKUjJBOPX56xGLrg4o98lbJ2FgBQZW3c3SB8KDqmv5ZbxC0q
 KP14modKQRZ6spzFAtMtYP+r0kvuz9qNUkTZI+I9k8cXL2E5GZ5rF9qQs7U4t0ngN3DhfLuuGNe
 2QNCeboFqEcfJcAgiTgY6eqq6nLy7JUI2h2fI+5TE6gd5wlQ==
X-Received: by 2002:a05:6000:4205:b0:455:7c9f:a49e with SMTP id
 ffacd0b85a97d-45e5c5bfbc8mr21150969f8f.25.1779089644346; 
 Mon, 18 May 2026 00:34:04 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc08:b284:85e6:f7f4:1a4a:4dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm32590222f8f.11.2026.05.18.00.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:34:03 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Yannick Vossen <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Corvin Koehne <C.Koehne@beckhoff.com>, qemu-block@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v7 01/16] hw/dma/zynq-devcfg: Handle bitstream loading via DMA
 to 0xffffffff
Date: Mon, 18 May 2026 09:33:46 +0200
Message-ID: <20260518073401.11279-2-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: YannickV <Y.Vossen@beckhoff.com>

A DMA transfer to destination address `0xffffffff` should trigger a
bitstream load via the PCAP interface. Currently, this case is not
intercepted, causing loaders to enter an infinite loop when polling
the status register.

This commit adds a check for `0xffffffff` as the destination address.
If detected, the relevant status register bits (`DMA_DONE`,
`DMA_P_DONE`, and `PCFG_DONE`) are set to indicate a successful
bitstream load. If the address is different, the DMA transfer proceeds
as usual. A successful load is indicated but nothing is actually
done. Guests relying on FPGA functions are still known to fail.

This feature is required for the integration of the Beckhoff
CX7200 model.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index cf00aa863d..9708200760 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -247,7 +247,14 @@ static uint64_t r_lock_pre_write(RegisterInfo *reg, uint64_t val)
 static void r_dma_dst_len_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
-
+    if ((s->regs[R_DMA_DST_ADDR]) == 0xffffffff) {
+        DB_PRINT("bitstream loading detected\n");
+        s->regs[R_INT_STS] |= R_INT_STS_DMA_DONE_MASK |
+                                R_INT_STS_DMA_P_DONE_MASK |
+                                R_INT_STS_PCFG_DONE_MASK;
+        xlnx_zynq_devcfg_update_ixr(s);
+        return;
+    }
     s->dma_cmd_fifo[s->dma_cmd_fifo_num] = (XlnxZynqDevcfgDMACmd) {
             .src_addr = s->regs[R_DMA_SRC_ADDR] & ~0x3UL,
             .dest_addr = s->regs[R_DMA_DST_ADDR] & ~0x3UL,
-- 
2.47.3


