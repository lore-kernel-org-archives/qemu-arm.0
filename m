Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C19CD4F48
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:35:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsUj-0000oJ-7C; Mon, 18 May 2026 03:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUM-0000ft-3G
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUJ-0000CT-6m
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:09 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso13465675e9.2
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779089645; x=1779694445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGkrVLFS7cW0IKrQNJ4/JeWHeoQPDU3gaIf/fmkwr+c=;
 b=ic1SyuqnBrio7UGvpl71sZFAq23RzQmssi3R6i0DDVS/gJVg4y5y1opi1Z4L2LO66q
 wxo6BehCFQ3RsGAqfTyUAuhu5L65juGNJZ0p3BhyHMzaKFsohyISZJjqnXLdX7tsvIy0
 ajGIkOulf73hkJNCgMqoaljBc9UGkItCJWUgUkH7iP++OvvKRq/ChhR3r1RoO0SdhKfh
 K3aIM1VUryps4g0v/j7/CjR3mc8l0DDhKGdIXTH2D/+lptRaWDxfUgG/zZVhIA7NKsfQ
 DckMH0HaVAi26dsuB1n29ORbyTaXIPOb3KiIyX9rbHBZiq0pWBS4+/2BOhrkLda0/xrE
 cN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089645; x=1779694445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QGkrVLFS7cW0IKrQNJ4/JeWHeoQPDU3gaIf/fmkwr+c=;
 b=n11VsY81EHG0Mh41hvP2N62PrKJvkkl1EbTC7W1Sf49sT0b3tKmt2CKlhQmKERRznE
 yDO7rC6tg1Z1zJWBWF8ZWCV9J8AQM4S86DPx4s02PlYBESkegcTzPIJncHFDfgYF7PEm
 AYmTazWTA1aM5mmfXQ7TA6JN+CUH4kMMxGxC3uybuByGNr5+LcphQiAlIQG2qW8bNotz
 RJlbpzzyZo1Q2J5JtSKu+nxSBXUr/Zv8gWz4Anm8kf9n8jXX8D6+IS1AvZoLpkAEGC8k
 6xaoFccoiKCRPctBuQkkVawITIKYCzr8rGvCa19zerXp5L8NkZHlEzIEYEnSdb5QrTaI
 /thg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LQaw94hi7BBqaC3hnuOT/Is6SSaJpKXZ3vaegzWaSD8VV0aDHwnzepBPQPT2g8v8hqMir63hoDw==@nongnu.org
X-Gm-Message-State: AOJu0YzsRmZ4IBiT0gDYwB5X1GY7LadcZizPPRrub8XFFuCRI4Danpqt
 hdhN0ntyz+/g5JzOWTL9f+z32otvXMuc5zYeht0Iu9JB3w25BQjKKp4Y
X-Gm-Gg: Acq92OF3X2MV3sCPyJ/tsh5k/j+oYUENVVmvJ3e8CEvSR9vFDmTkCC3KCsfRROZipsX
 f3dDUWB8+ZMJlD7/vTMACtGVeJcmdLy8HF76D3L1rxvX2c1M7+7XL+tzlBsT5gki62XoOGeq/fE
 iqYGYmfNewz8UJnd40151pev6nUHejWDOpDVSOleHdfo3vZ5Cx1ZVnMmSWXb4O5YtZlVcDAhP72
 o6id2gbr76n2aoSDhJAW5350S0+Me02DvAKFaJ77ju6RPWTwSyeX5MjJhAPX40DkAj+BCyjHdH3
 fgqR1lWnQZz1+sxUS4PY1u6D/qVjkVOhRjUjvGfeA8/MrmdgDa4EyE/xZlWHtELLBLvTBooplcD
 VoCNEnAriD2R1LbRoBewFIqyN8wU1B400SCiqk54+TFwqRZ2BFr8H8Vwmg7f2bp8MBXkxxYCxkT
 aT+dlLA++r16ioERORWSclNb1PJZ7JGtuFX/IvlgwOhavG4w==
X-Received: by 2002:a05:600c:4f8a:b0:489:ad:7b5b with SMTP id
 5b1f17b1804b1-48fe62f8c6bmr209575215e9.24.1779089645310; 
 Mon, 18 May 2026 00:34:05 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc08:b284:85e6:f7f4:1a4a:4dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm32590222f8f.11.2026.05.18.00.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:34:04 -0700 (PDT)
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
Subject: [PATCH v7 02/16] hw/arm/zynq-devcfg: Prevent unintended unlock during
 initialization
Date: Mon, 18 May 2026 09:33:47 +0200
Message-ID: <20260518073401.11279-3-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x32b.google.com
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

During the emulation startup, all registers are reset, which triggers the
`r_unlock_post_write` function with a value of 0. This led to an
unintended memory access disable, making the devcfg unusable.

During startup, the memory space no longer gets locked.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index 9708200760..afe6ffd326 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -221,7 +221,9 @@ static void r_unlock_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
     const char *device_prefix = object_get_typename(OBJECT(s));
-
+    if (device_is_in_reset(DEVICE(s))) {
+        return;
+    }
     if (val == R_UNLOCK_MAGIC) {
         DB_PRINT("successful unlock\n");
         s->regs[R_CTRL] |= R_CTRL_PCAP_PR_MASK;
-- 
2.47.3


