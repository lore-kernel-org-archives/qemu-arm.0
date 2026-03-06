Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E06FCB60B
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 15:22:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyWzt-0000tw-2a; Fri, 06 Mar 2026 10:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyWzr-0000tC-8d
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:21:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyWzo-0006jY-89
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 10:21:47 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439c9bdc1eeso3053715f8f.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 07:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772810502; x=1773415302; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nTtO4V15SBXsLaKOKeV9ZGa2ZuUKS907kHv5RI3m5qA=;
 b=o8a/YZ2KTdpTzFgrb8WExTTHNCGPLc5ansqzOLmR/yy3ipX0TQYpqQdw3uK7U4UrQI
 mTclN/sQA6vdzLrDUDSoeCOYgM9b2qAIx2rIZdruK2Ta+wpHUr4rXOqrNhoj/LqyFSOd
 rtp/lcnk9/C7LKvi8ZbYN+yla9J+luB/q2LgxYfF9kA52Fkydhad3z9K7k58EggMdo5O
 ZKQ8vOzUjpghn1bszvuXXszAL8FFVFQDSyYJLzsStGjXiPhESSxbWwRP126eNRpTY3qM
 05iISPZvPyEcTkpnyWSDVvRksP0rq9ogz720QlFSfKvC1A7mPOyD8E5EmOOzQHO22IUW
 PKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772810502; x=1773415302;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTtO4V15SBXsLaKOKeV9ZGa2ZuUKS907kHv5RI3m5qA=;
 b=b3pg6Vz6eF9uhrlxMoU9Q1RdVs1ATz4VfDrF2NszdyBipXTJT4JeFRwkv8b1JiowDe
 KyeKcm6e28nGEIpZ4FjcuBMOEK1xjx/fVW8DSFvU2c1Rcf0t9HI9v/ZfLI+zO2/8FeKO
 fueKwB7AZ5WVQCa32XxXR7riq3WST4uD9f9K85YF56cAnmFq1x6OfiOXHAXC2IiwKv87
 XcL+9IQncrVseca9Diw2dFBAGoPB7buNzQx2PZr+PoU9osXpa3uJXAA20EbH2H1y/Tlm
 N9cnaw99kP0WSuvEq+A7WpHDZP0a6unpcAwYoHyIA6P/Zg4VM2tg1twlO+UV7mF8PrDQ
 Kx+Q==
X-Gm-Message-State: AOJu0Yw63VvZxM/Xht4FIh2I34oWumjnCsgy40F/BZNP/pRfO20BLUXA
 z2SPWz1S/wt7sca3pbbLEMNoq9aDTg9qlCvn5+cMDyKkjO7u4nspzmWNEwdUyPDeMscRpNOtCes
 yugh8
X-Gm-Gg: ATEYQzwbpQJ+JdGydwq1iP2MIr3G0/SPgQk4AdNaiWIokkyZVuHOlnM8KoHIola/lGt
 kA5zMsPWKCX5ATNRcmm8V9Epp6zOXw/YHF6bnyOphrT0UvryI+0kVk50vQd54JPpgf8kaqs6i7c
 MQZNsjcQ9wraWEiT3BGEYYjEhRYuwdri5U1FgX5xQevQe60kV4OSR6nR/ZKbbutxDLDwh0Xau67
 c6adnxKtfvqVPb1axRayfVgykrWvz9qcwxwE9ixvcy2MGlbk1XfwEyWDw8mUpFJo5osS579ncAU
 SbFmaY9emUJrws1DYXdnY8XQKnVv/BDpYZcKEaT4sofuFihHmEXRjDwqjeibZ75uXNwnRxsulUa
 nyt2PlPbhxnO+omLFSX8OWY8mpJmwu58CPETF5KwicEG/q1FkFNF6fS634hmy6o1/S/aG/gl4Ba
 H+0/VSxFxmuxg13Nbcsk/sCF1DYveHjlkg3marVj3D11GaMdKmyUHZQs9TNJPNYUdaESonKxbRk
 7tD97b8bgxQ7Mgqixke2kYL2aizTZw=
X-Received: by 2002:a05:6000:2c10:b0:439:ab3d:1c27 with SMTP id
 ffacd0b85a97d-439da354a23mr4101198f8f.2.1772810502004; 
 Fri, 06 Mar 2026 07:21:42 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8daf2sm4951307f8f.2.2026.03.06.07.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 07:21:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] hw/dma/pl080: Handle bogus swidth and dwidth in transfers
Date: Fri,  6 Mar 2026 15:21:40 +0000
Message-ID: <20260306152140.2191653-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The PL080 TRM states that the DWidth and SWidth fields of the channel
control registers can only validly specify widths up to 32 bits (i.e.
values from 0 to 2) and all other values are reserved.

Currently we don't check this, so if the guest specifies an invalid
value we will transfer more data into our local 'buff[]' array than
it can hold.

Check the widths; since the TRM doesn't clearly specify any behaviour
for what to do on invalid values, we choose to log them and then
ignore the channel for transfers.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3203
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/pl080.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 3f8acb03de..6262c3f3df 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -164,6 +164,21 @@ again:
                destination widths are different.  */
             swidth = 1 << ((ch->ctrl >> 18) & 7);
             dwidth = 1 << ((ch->ctrl >> 21) & 7);
+
+            /* Only widths of 1, 2 or 4 are valid */
+            if (swidth > 4) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "pl080: channel %d: invalid SWidth %d\n",
+                              c, extract32(ch->ctrl, 18, 3));
+                continue;
+            }
+            if (dwidth > 4) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "pl080: channel %d: invalid DWidth %d\n",
+                              c, extract32(ch->ctrl, 21, 3));
+                continue;
+            }
+
             for (n = 0; n < dwidth; n+= swidth) {
                 address_space_read(&s->downstream_as, ch->src,
                                    MEMTXATTRS_UNSPECIFIED, buff + n, swidth);
-- 
2.43.0


