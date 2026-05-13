Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181E6CD4F24
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 10:56:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN7Go-0003W6-Ic; Wed, 13 May 2026 06:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7FX-000384-C6
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:39 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7FO-0001Np-In
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso65925975e9.0
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 03:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669724; x=1779274524; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QGkrVLFS7cW0IKrQNJ4/JeWHeoQPDU3gaIf/fmkwr+c=;
 b=tCvm3JZhCWvrVP3kstQQZTpQL4KFEEeV9a67zkRz2+r7NJnOom+74W1ButUhCK3qjZ
 sMZL3CmrzDxSd5LqxVPFBJ//1V+rh8Gfz3crfIbY3lKYl4zQvkzAGdMDWzRWr2drCLPn
 qGMrdhb0kdup4jyMez12ulUdmxJVkuC02Mxa9PAhonuJjMrYNUxDVuqwTpMA5vZBo8J8
 uJBAcm6XYRmdb4FOnetGitlOAHwJEsfc4IlCcA7QY/Ne5tcut9wfLabJpIFGNEb7D96Z
 iBSsUjjC8QJ46sPy7QS8ZL2Vvp50NpXtzzuxCZRHrDF9EZB/04rJCPgiC1KWNZXEh7Hp
 e9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669724; x=1779274524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QGkrVLFS7cW0IKrQNJ4/JeWHeoQPDU3gaIf/fmkwr+c=;
 b=OliEINSoDBAwpG6Iff4hCNdLKn2SxTPhEtZcwoxszWEhNj9E1+NEq1gWaM8M6/64HR
 d2Uh4Nmoi2C9lsO27v/Q2yuzFDSI/xTQMAGV+AhJiaSkZo1Hfz3uJJtuLInwtssHdr+L
 1FfI+SmbT3M6Pa/khNwoiAsT3ZCYklSB/7cU8QJTL9pitWEgF7jmyCXoy8Yd/+fHU+lI
 niXDt+QBn3Xg8IIWesS0fNY4IPU+pHA0c/FCOFT/lYUSlejoxI6avIpNS4/xBHIN2EfB
 lYCgLrxCJud32nm7q/6QySqm0g++u9Hres05RBlrA4tVibEwBGG7fhRNyFpgstqivt6U
 OsPQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+S82cv4HvUnSvaeNliflyJJr4U0raS65+hyM3YP7k1wtwp81jwzVbliqpFmgO+VVk/80Jbti2wVg==@nongnu.org
X-Gm-Message-State: AOJu0YyfBPmdDbECmmdJ+OZKQpWTg7It+87LNTiwv9KCCONJg/bQpvda
 nO23nxkaQiIqqwfJro2KxYqvtPA5k3SM6Tc5/Nx2yb+7Bpnx3bPKhw7+gTfS+OGX
X-Gm-Gg: Acq92OHtN81vQ/tkKL784iYBuIIgZKCkstH8iQuiLDftz+m+S+QzAYmRnwEUTS45bxz
 YDYk3gEbKYLhqdn3z13ebeSrE9HLZC6tUujWCu8A6ciidISoqKX/Gz5Pp9rPrT8jI1kl1iQ6RWg
 OaCNKP2YBKVEblIkKN7JrhH69qOPOMWe3+9AH3rSIBSGBsGJomWCy8BrDrHvZxAWydp1avo++7p
 AqIDx5eUrfauyB9c7VBFl9Q+4e4A9heIsnK6aiLms7WEsl9c91jnwXAR8Z+WU43M2FrL2xaJ6Tr
 kVrakX1ODr//pfUZu4jCvLVUJ5Dpv0WcJIsgJzlFT0is64j5l5Cam7d4QgFJURZFDNGrNCmmajX
 Yas9VlGDO7hMinBX2yM0n03TmB18P5PpPRm/s0MRuUwIuv0srJX+FEIfq385SVb+jTPKRm726Hf
 bhdzBYB4bGnsBDftI/b2wb1eEFyxNEeLkzItie41n7YrUR
X-Received: by 2002:a05:600c:8b57:b0:485:4eaf:eb53 with SMTP id
 5b1f17b1804b1-48fce9f71c5mr34992345e9.19.1778669724357; 
 Wed, 13 May 2026 03:55:24 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm56062295e9.6.2026.05.13.03.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:55:23 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
Subject: [PATCH v6 04/15] hw/arm/zynq-devcfg: Prevent unintended unlock during
 initialization
Date: Wed, 13 May 2026 12:55:06 +0200
Message-ID: <20260513105517.146706-5-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x335.google.com
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


