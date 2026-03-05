Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4670F30955
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 12:13:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy7aR-0000gZ-7B; Thu, 05 Mar 2026 07:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1vy7aQ-0000gK-AG
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 07:13:50 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1vy7aN-00080t-BX
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 07:13:50 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso3233730f8f.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 04:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772712821; x=1773317621; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o9ySsJCPRrRpMMsEvO5GNe2voaD7Aa2RjkICMkm45GA=;
 b=Usa2+eSqRF7NZkQzoX3tTsQBIz9ILFkyUpJ5CEHKe76v03rseP0xXuXrrtnSrzYMXi
 XzUp9gKDHggthSBOVBhg02Dm12RAQ37RZO528tQoARjNg3oRVk4toUaNCbKn+p5J/91g
 gKIxmgN0HavK3qpo9CqVX7boprd76GGF15JEYANc5EaInMx11y2/Z9eDhokWEnMk4ERT
 YkrXFxAGfIQ/yQO3/eFtvCZRVqRQXUzzYSx33/UOS70NZ3+XDG+h4Xy+/vzomIppoYNC
 ZQvHXm+xu0IOa8ukv1/+EznXBjgMT2Pxz0UrqvCxc47M36XBrji8Ql6JLJ5nZdoLvXXN
 6LMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772712821; x=1773317621;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9ySsJCPRrRpMMsEvO5GNe2voaD7Aa2RjkICMkm45GA=;
 b=XOE8VWocXPJAoVMQnhhGo611giC8ZeoY4fpL65DFl5wV//PHclCWyKqwaK7XusFHmN
 AL4dCJkGSCH/Pvj0k+nLbB+FT0Py2zk66FqjEkwUtondHkB4bYh3HCTfy5rPjSC2Zajm
 54J/9DeQnPPDjOCT3X+j2Qoe7mfrFuw/PlzmBN8NuLmvzW3G4ZtfOjufwumoYmSjWpqo
 pSauBDr5Vt/HYDzp0JL+bSDs9mbNYgQFgfzA5Nmh4tYdvZV5xiLkM/ZJiX89+AdY7roR
 mYU2vizz+W5IoCFhBggdHP6NYcp+ME7lDpB8Gh2X5mHCgekvGGI1or3vn0iw/4NnnE3u
 5XNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ewsJtoAG9vEIF2NLsfCz65wBPfS1VJnm89wsmGMSmN22JVe3Ifw+MyCQ/te1mVvfY5x3AMvSyw==@nongnu.org
X-Gm-Message-State: AOJu0YxFOYwdZkjxTDDVr29QU3F05Zr9hN2RnVjD/XzUwzoufkkpVhhh
 2yyor47r7RHsaJRvXRbn+dqxvncyJGyXOeLcrkIyshBAhv/l+tS3BN00GR87SZlg55M=
X-Gm-Gg: ATEYQzzTyVb+FGMTrY+piYXUJJ11JKaAIGNvDkcQrk5KGJcNqMptXRXv+l3nLDOk+2g
 V5p/gJGj/Ss/CzRnIN4TU7/ITL6K536+PCm/fTRmyUqiWHw9vx1O/Bb1LF7YEqGKzfqwOQ/5qUe
 XIHyzFPGoqUNApQw3jZGWyM2xPIYCF3jFberdwbpPQtkpK3pHt6VdUpopbTXScLLAUusfSCK9no
 TOEFprnAKDeMxW0a0F+whrZ8DCyU7j+jDxYbOZ41xbblD6SuB2xN4E6u22Deet5Fa7AVhniiTO+
 2VWQcbaWVb3OwCbm40eKnke4m0WRuPDQaq9kkXukaXH5Tg86xr82I88egAN7SRPKNyVJ6RAbD6t
 4A8+Yv05ialQn3gCz2L5ney+8p6tmbVSIoGaN8g4nkx9x7F9/2DwPFV9eVXDuekdnmWmFDxw2Ja
 lU34ykkge0kmMR
X-Received: by 2002:a05:6000:3113:b0:439:b541:a088 with SMTP id
 ffacd0b85a97d-439c801f74dmr10840149f8f.54.1772712820859; 
 Thu, 05 Mar 2026 04:13:40 -0800 (PST)
Received: from [127.0.1.1] ([2a10:d582:31e:0:e891:67d5:3e8b:cb48])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439ac9f3e5bsm40337904f8f.37.2026.03.05.04.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 04:13:40 -0800 (PST)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 05 Mar 2026 12:13:03 +0000
Subject: [PATCH] hw/net/xilinx_axienet.c: Prevent writes to PHY
 Identification registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-xilinx-phy-protection-v1-1-ffc9edd84e58@linaro.org>
X-B4-Tracking: v=1; b=H4sIAE5zqWkC/x3MTQqAIBBA4avIrBswI/u5SrQQm2ogTFTCiO6et
 HyL7z0QKTBFGMUDgS6OfLoSdSXA7sZthLyUBiWVlo1sMfPBLqPfb/ThTGRTEWibQRvd9ovsFBT
 rA62c/+80v+8HXwiGYGcAAAA=
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>, 
 qemu-arm@nongnu.org, Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42b.google.com
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

There are other registers in the PHY model which should be partially or
entirely read-only, but this solves the immediate issue.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3297

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
See:

https://gitlab.com/qemu-project/qemu/-/issues/3297

https://lore.kernel.org/qemu-devel/CAJy5ezqTAMr=A3uAfmuWLepK66AdLRu4Q8AmFMh4+4q2HtDrkA@mail.gmail.com/

IEEE 802.3-2022 does not explicitly state that these registers
should be read-only, but suggests it in 22.2.4.3.1 which says this
information should be entirely manufacturer-supplied information.

The standard does mention several other registers in the set which
should be partially or entirely read-only, so further work may be
required.
---
 hw/net/xilinx_axienet.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index d85f8bb23f..970732b162 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -141,6 +141,10 @@ tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
     regnum = req & 0x1f;
     DPHY(qemu_log("%s reg[%d] = %x\n", __func__, regnum, data));
     switch (regnum) {
+        case 2:
+        case 3:
+            /* Writes to PHY Identification registers are disallowed */
+            break;
         default:
             phy->regs[regnum] = data;
             break;

---
base-commit: 3fb456e9a0e9eef6a71d9b49bfff596a0f0046e9
change-id: 20260305-xilinx-phy-protection-c396a658d072

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


