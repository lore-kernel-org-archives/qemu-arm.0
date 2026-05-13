Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0BCCD4F24
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 10:57:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN7Gq-0003X7-J3; Wed, 13 May 2026 06:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7FZ-00038F-9d
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7FS-0001O8-Hg
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so73868765e9.2
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669725; x=1779274525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2UZAwblmFCL8Lm8n5wVmaatXyzHPE9hb4BFthu5ZrY=;
 b=JJ1N8334iwK5UFps/J4cB3IxFdxZjBFO/wWUcsIVF/V7D0Yu12a54uV41osK9yLdLy
 h3gpSiG/a+rNolkIOpbSxQKcySUiSIvVq18q+MtP5Z217hkl9TBfjzyh4jonsgkC27Y7
 fUw9KYn60VYmsVYh5OhSZdFaxAArVbL+InMVEAh49iktmxPHeuWVyEn0Yvmla4dy/sa/
 IqtyB7UaqLaAwlPCRvJNLfc1UYWT17w/kUkVlV7XERnH5kY2ZwvCvoHOG+X6orpMcZmA
 ogQBsciBqfMqvyUeXH6dP5NmFOCiGZWtRQgUaO8gzESUPEFqomShdWSYk/k4Sf9FBerw
 hlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669725; x=1779274525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k2UZAwblmFCL8Lm8n5wVmaatXyzHPE9hb4BFthu5ZrY=;
 b=eXhmLuDEi6HICxWgYrdR42cNxLAetIX1mIDFJsEP28f8VQ2BpquyLclQ5VDQFAbjKb
 7yRxq6zSl9ZChGKrvu8bCx//b9OKcNesogiy+rbfwtcHaykbNobyv8NDZHVZ3Iffr59x
 goJuodgqEos9hMLZc5Q4ljxzpBF1AJWMef3KyFr5sLdUKro5CTCNamlTABb++SWLWmrA
 b4ojzkWeeCwy+k54loz9xcObMZVEu72MZ1hO4LpSG3RB+HV8Vlmclk0MOYMk8bEeKhmR
 NCMuLHOjBEIP2Tou9cHd+WBM5IiJu0KPNJWM6Gy0SaNyKm6kLQf9P9m3/ebd9vKpzHnO
 BXUA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kU7VpX8lMzSD0goEGcvS0AaZFRMAkCVaGRrsz3weokx37tKoX0JZonuqvdYARMWZcm204Yefheg==@nongnu.org
X-Gm-Message-State: AOJu0Yy17KQCBAVf/UiCGKcQLFAC8UrEYbi+m37DPq763NZcmpa6IM3q
 cuiSyDi8t4kDZhgrNzKFFhOhiI0k+KWrkFOUGMaSUfVq8KIagYIY8MMo
X-Gm-Gg: Acq92OEepNMzvaOelOGh6nBeUaFEQSOWwhXP9S6bVwxv4iAqYKwARK2yseEnrQNRcSi
 fUAOIhq7C2FoKClHgvS6iqVhlbrOU12tItcOKHG9TZOJ7YeOWgkS0igO6HKJJ3EfVdn/Pg6NQ+N
 EMWtjcMOQ25rm/WJuelViQQ/dOBsF0wo4axRoniA6zHMovtnQd0CpfF36HllC6y/n019t9K+A1v
 iyZVzth4g35103iiubHuXNLB5vkR+fh+hz+98PWF8WuTgra5ZgcKraxE3Nvc+skwE79VhiZ9MA/
 c8oewuyWoiyq26QjonqFQJw1b5yopmMcYCVRVcQKTTzVOrdzwjFmM9wPkpQysvHM6/tJksYfNSl
 39Gab1ZRNwWuIeJR6LNbSRaE9ntV8ih5ZMwY+FgV2F7zsdX2ov6XNEIMu6IN/CaxA+NoVmzrHrM
 7Nmg1spPrxdzQmUoBjHGoRHiBVMnQ3o9gafVxdu+SbEYKv
X-Received: by 2002:a05:600c:1d06:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-48fc9a3122amr44055015e9.18.1778669725465; 
 Wed, 13 May 2026 03:55:25 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm56062295e9.6.2026.05.13.03.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:55:25 -0700 (PDT)
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
Subject: [PATCH v6 05/15] hw/dma/zynq: Ensure PCFG_DONE bit remains set to
 indicate PL is in user mode
Date: Wed, 13 May 2026 12:55:07 +0200
Message-ID: <20260513105517.146706-6-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x330.google.com
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

All register bits are clear on write by writing 1s to those bits, however
the register bits will only be cleared if the condition that sets the
interrupt flag is no longer true. Since we can assume that programming
is always done, the `PCFG_DONE` flag is always set to 1, so it will not
never be cleared.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/dma/xlnx-zynq-devcfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/dma/xlnx-zynq-devcfg.c b/hw/dma/xlnx-zynq-devcfg.c
index afe6ffd326..7370ab941f 100644
--- a/hw/dma/xlnx-zynq-devcfg.c
+++ b/hw/dma/xlnx-zynq-devcfg.c
@@ -188,6 +188,8 @@ static void r_ixr_post_write(RegisterInfo *reg, uint64_t val)
 {
     XlnxZynqDevcfg *s = XLNX_ZYNQ_DEVCFG(reg->opaque);
 
+    s->regs[R_INT_STS] |= R_INT_STS_PCFG_DONE_MASK;
+
     xlnx_zynq_devcfg_update_ixr(s);
 }
 
-- 
2.47.3


