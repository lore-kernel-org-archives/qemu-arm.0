Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E42CCD193
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeJ-0001up-BO; Wed, 15 Oct 2025 05:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xe6-0001pk-Pp
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:12 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xdn-0007C6-6e
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b4539dddd99so385195166b.1
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519864; x=1761124664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VkrWnXOza2cCpUm4Jt1bEmOXlc37hxfarF7/E3Z83v0=;
 b=HUysQ0HZ84LMdtji+2c57JxlvIE3sQ7d260781+PL7ccx96nlw0HCPOdBY/93cPhUr
 rC1RUJqIBHNlynC9+Zy4Z/jH07IR4tDjxO4OADLIQpdEbUKcyQUl/9wjcAZXHrkecpNA
 1Lo4mH2oQU77+FBM2ukTt5viGdT2HcZeQh8WvMSmkOz8qf1NbJaqkjbe0UFpbgWDE09O
 CQr7oqUQyzeS62jqpA7KbcRWqWG2Zb5lF6YF+eNvCnWnVOjTFPfrwWE52dd2kWwfwvQ2
 zF4epk0PbeSdW4BARQuUbuW9yykcWZOVHL1NJJLI5taDi2y0MneENCBYwTQLXe/lJEVA
 FQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519864; x=1761124664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VkrWnXOza2cCpUm4Jt1bEmOXlc37hxfarF7/E3Z83v0=;
 b=IZtQPNLRwQOJUDAbXSiE7MgpdGiAIVO0eEMFpC1JvHWXbpH+qfk+nND+Lh5/FBtTfB
 RfioL5zarrQf4tzThn0Mma34HNDWFBmBH8Nb+caERUzpbb/WpT80PLGEiKxLhLqUphlp
 hwV+V23apScbET0eOnYwOr+yqSbHmvnHpFasr5nBsSlGIznCcVc8zOtIcqK39wz1uPxL
 /XB8g1ePPyuROMRARq5+T8qoNLzdj2w5nmmLdrnvKlefbhU5SkRIK32qmVg3HBl8ef/1
 bl4YjG6+a76kS/VoAj3OSnNayMTg5ncTK8X69K5wK437YgeFPwVfDjo7Id6HBQLxivgl
 Zn0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBc/3t85ejSUJisVlbfeTR4jfV8B2wVSqTEiU0TVeNL6GF5fcxjoW8NEfAFUMP3mZQVILk9wlfTg==@nongnu.org
X-Gm-Message-State: AOJu0Yzn8XdpH5dGurnBUtjxvoa/5GCJRPpYMU+QylpopPeBdj95CDLA
 zesMclye2cL1q2KyGAXcz/UvrWzn+znEbwVZSoC8JjOpLLg5YUUdqDN3
X-Gm-Gg: ASbGnct76uBKKMNlEYf8Hi7+Dt7sfBXen+1t6rhxKcDH05H3gq1AiEAND7L9WaU1+1/
 LGssgYcjM0NPgaTKi6nakCna779nrowzui4WOFEUfmOL8+e+ezw3zW4x50x01DOZU998NzaZ4d6
 BPjDAu/Y4WvTcyArx0dfpEtCwRAi83T3oITgVd77lraL0YybQMjfWDJijEp6bZ7wzB31XgSYiSm
 eTcYLVRYcXBoYxFQKR48Hfvwo5mCkztRuswxvvy5kQV1e99nOKgKiAFy0AwTIwK2QsXe36zDHLM
 FlidHn6i1nHthmWQnT6e9nEMXlUc0c0sVRsvUXqU4JfEh4VD+AAvfDDwpudn+vTZP7d1iLnkueA
 JBVkSfEy1DCoECjglT+W2ooKteo5kas/4PRvE8IO1mJu0jDt6wMezDfUlIQkKK0nnJ/aY5oNC
X-Google-Smtp-Source: AGHT+IHlC6ekauqE3OSEZFb2GQP7S1s+gG0eaQtrkYEotRvpWIZfGPRVElMm6rgpII2wNgtlbcI4mQ==
X-Received: by 2002:a17:907:961b:b0:b3a:ecc1:7769 with SMTP id
 a640c23a62f3a-b50ac0cb195mr2888802166b.52.1760519864156; 
 Wed, 15 Oct 2025 02:17:44 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:43 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v3 03/14] hw/dma/zynq-devcfg: Handle bitstream loading via DMA
 to 0xffffffff
Date: Wed, 15 Oct 2025 11:17:18 +0200
Message-ID: <20251015091729.33761-4-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251015091729.33761-1-corvin.koehne@gmail.com>
References: <20251015091729.33761-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
index 26845713ee..f11d0e1b1c 100644
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


