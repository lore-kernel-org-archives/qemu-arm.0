Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E54CD1297
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:32:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIlce-0008K9-Od; Tue, 11 Nov 2025 05:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcG-0007Up-Py
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:49 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcB-0000G2-1V
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:44 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so802927666b.2
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762856921; x=1763461721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6i1DkODnGuRCQdtikNR9m8FrNkAKeUpr8knda9F3Gxc=;
 b=c95Eq4vFV8HvXfIZ3oUy+YyI9dVO1dT3WYoMy2D6Qnp1KhzivJ1GeOJYxmgHAOkTQT
 mSUvxnQwzS5whI0SjVQ2r2zx/xFr6sJ5HMq6zCBCC4Zg5IacvC4COifi0bbB+6ohOxdB
 w8NmOHAAXNoZ+4fv4qpTuvJPmbHlR2QHQDQ8TGlqGrrr5/dAZxizIo5Qv2/e0Lq3VSi7
 MDl3IzCHVCv1PpkqvRN56MPFfMdq7iGkraBY1Aj6/kYm1/A1VJGI/YjhKqdrAW+H56Gi
 F3mg5mbFiN5QV7jmUcLiV3We/JK1VPZzi255bQk1YuXPOWfbFtdrqec4zXgyrn7WXsMl
 ulmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762856921; x=1763461721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6i1DkODnGuRCQdtikNR9m8FrNkAKeUpr8knda9F3Gxc=;
 b=Bk+hP7eG4F7h3mGwj7XxTk1dL/YPQ7wcO+L14Qnm84Y5vm5KN19ph+OugrxhfEIOAd
 JR7Q0IPQa5Ovm0iC6XMSNhet4LKXQcLP3O4o9coGCNNg5+dCfhd22fKNypdgac4BSUaB
 wlsfT+uG3D/89urd2ks+szrYGUmyQR1436o2Yq6neeQ6zTRXI8sInPAWxp0HLznohu4I
 ZN5WvITh37C8436hC7NB4Mv6XiPTK2VOpUUPCghydUV3ROJB4/1slMZ+PS9g09KUNZy7
 18qLqB3tHSmydWjkzm7AGdMey2nayGnELl253ePWoQdYR6zAAS42rfw4z2Y47hEPjfzI
 yAdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUyxVCdcEqTDR+u8EbS6FJUSXHVXcDCvgqRXKR0kCFSQ0lwXMOSu3Ugwrr0712q9FqOuRcHzBNhw==@nongnu.org
X-Gm-Message-State: AOJu0YyQdetjLU2uQbWFP8B8j9H/0EGk0Vk8PLlFq6K/xM2hR1FhBiSw
 vjZ8uEgWR1awtS70cb++crpaXbUV+VNVDFGMBHXOwLog+3Zj/gudZWcD
X-Gm-Gg: ASbGncvYzwKZJnvJ2FhReDRQtsTnqkduBU8gUwqRn6DEbQ4rZt72tLDAWz40K2dYio2
 iYUM1bKhJ5ipTeQsslQMBWxinWWfpugUYTQchyXSJFSjB+y+v+92L9KXNHKVK1DVUYw2uTq29Ia
 tvy4/3gz15uQt2j8TBqSLdT8mcxoPQDVKdDQfelc8gv37EoB1XS/pdEIOap4669Uq1x40sBr5VZ
 CwAKwtkb0hYzvzDKKnicieyXtUS2/UoTSNj/I3oz2VlW8b5CZW8hIiaYUB+60ePUKzcCWVdNqZv
 RY/HbNYtIYyRwEB3MyUS1R7DfveROgV8NcD5rdEuu+gtvRIYk8mDwiIoGbqMq23KzKET87oIqn2
 ey1u+m3DeAuRyFX3wr3iVRd5bdwH+FyUboENLQnp5YYe7VWPJNTTYAZ3HLuP4TmjIIbgzRBg3KW
 rRV2ka1vpqAof4JjrrwbZN2+njPeQBW76g
X-Google-Smtp-Source: AGHT+IHM4domQNVK37cJ8bR78wwXttQbvifvqJGVEDxlB+ZBkUj6yvS/S9lCcqKoeUb7qrk1Cp8wgQ==
X-Received: by 2002:a17:907:3fa9:b0:b6d:5262:a615 with SMTP id
 a640c23a62f3a-b72e045bbe3mr897990366b.41.1762856920664; 
 Tue, 11 Nov 2025 02:28:40 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc12:ce00:ae91:a1ff:fe8b:15a7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbd1ecfsm1290619366b.10.2025.11.11.02.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:28:40 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v4 03/15] hw/dma/zynq-devcfg: Handle bitstream loading via DMA
 to 0xffffffff
Date: Tue, 11 Nov 2025 11:28:24 +0100
Message-ID: <20251111102836.212535-4-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111102836.212535-1-corvin.koehne@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x632.google.com
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
index 0fd0d23f57..b838c1c0d0 100644
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


