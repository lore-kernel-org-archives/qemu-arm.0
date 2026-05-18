Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF4CD4F48
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:35:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsUp-0000oy-Mj; Mon, 18 May 2026 03:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUN-0000g3-ES
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:17 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUK-0000E7-Ok
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:10 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d73422431so1187139f8f.2
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779089646; x=1779694446; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2UZAwblmFCL8Lm8n5wVmaatXyzHPE9hb4BFthu5ZrY=;
 b=TYHUKti99vSoXzcaZsVgyh+BD/zCT71lMKm5P8un2CuSO5P6oTW9s0HQmcjcp/je+B
 h/39Yf02wN+jmChU093I8F6HPt5s2L/Ws+VWumjK3Jg5Ai0wKbaLZ58b9hZMjxRmdj34
 /nXfaZ2Eow5wvfz3qZ6g3S+mkT9wVTGfGKg94NPgJtl2yqMaGM5zfs8HZwSC0/wkz4he
 KkAyGotzpZMb8TPcG8InsEcxjbTDwJoDF6RZpL/b9lc8fdiFTakhEIwOx4MB4TcoqreH
 2cwf1NvLHIroCPdHE+wzLzJ8K0cVqO2dBe5lzvpdeUP7vMpD9A7BNzCUD/VL3yp3v9va
 UsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089646; x=1779694446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k2UZAwblmFCL8Lm8n5wVmaatXyzHPE9hb4BFthu5ZrY=;
 b=qH/2zZr/j4YReLEP42oD3CFmhjh85j4JXbWcHKnUYyG9JB8SaIoMmlmIKWmYZiPHTF
 gVG1tMSImEFO/ufnQjiDb+okPMkCsAgGzhyfzoO3lfzcPYW4/gUbNDn90jd6/TQw1wqy
 h+iR5AGMUtdGq/VzSGE3PcMfcciXQrpvW02zohLHnioA3e+YSViuuXDDavzcRxk8TaFi
 PhWnu2/oq+TInmUhiq5rghPR8mHyOMrTCVBtXyNmRwxULfAaKtLtH3PRXjHQ9rqV7Wwc
 TEUgnoL+w/2QQgU6Q9dg1ah0n2C9KGdf0OudARJg0ZPAAwRkua73VeBQcLQnZp/1pSJj
 yvXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ93XBe4aFkXOUNRwhr1Lk6gb3nnon/TPYUkj1JxkVeXEpm6Hc6/nEELXo7k1KBKNpPurl1rohKGbQ==@nongnu.org
X-Gm-Message-State: AOJu0YzGxzzHJKxjBt2ouq3K3ku5+ffkT/VOSPdjOFCm4NAbXphxCQ1q
 CScZRBLpjLeRP5izN/USVZKsyoi/Wln9/FbnB3q/99FeJpPUkNiFA0wq
X-Gm-Gg: Acq92OEmdUxrfxz3BE8Z7lkxX/Qe9xlcV/pIAvPlbiFdjrntUHXgs4JvOqK5AJUqe/b
 xKd2PbCzUMn2RRrL1ysj38pVZhI54ERmW4C/vyZ+A3ylAF5bY/Ab33hvJHV3M+YxEQQnixWeOC1
 2GH5ZgPJRBy+xWQCcAA95ltb0kvRxOeGhxYWcFf7swYvlQqzCAwSROnJJzSFKVw7a+m27roYU29
 h2VNE+3AnPLSMXfA36E8ma21Y8oMlKypgkYJ/8qDZVmp60a7Y12pyW6ru9dZ2jg9gKW0w9FYBdo
 FjOTYoVZpwqlRq8PjBLfewzNuJP9vaft8H/caCmQInRRmkBkQX7AosqqyIysqlvtekDsTC2pIpL
 FnZK95ntR5DlQy5aWV5i+x/nTCOH+buWHO8ZsTAVQFd8FauHXRpPb0logJq7HMtmve7vd86/RT9
 y/2e0447gsHYI1tZ/ttJZSdZ+3StXaAOPiaYW1j0qefKZa4w==
X-Received: by 2002:adf:ef83:0:b0:45e:651c:47bb with SMTP id
 ffacd0b85a97d-45e651c4807mr12694222f8f.28.1779089646306; 
 Mon, 18 May 2026 00:34:06 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc08:b284:85e6:f7f4:1a4a:4dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm32590222f8f.11.2026.05.18.00.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:34:05 -0700 (PDT)
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
Subject: [PATCH v7 03/16] hw/dma/zynq: Ensure PCFG_DONE bit remains set to
 indicate PL is in user mode
Date: Mon, 18 May 2026 09:33:48 +0200
Message-ID: <20260518073401.11279-4-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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


