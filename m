Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541E1CD98C5
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Jun 2026 20:43:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXPlp-0005lZ-Lr; Wed, 10 Jun 2026 16:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlo-0005kd-CP
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wXPlm-0003lL-Sc
 for qemu-arm@nongnu.org; Wed, 10 Jun 2026 16:43:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-460662fcb4eso80117f8f.0
 for <qemu-arm@nongnu.org>; Wed, 10 Jun 2026 13:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781124205; x=1781729005; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DxqTgQRW/DnHgUDBeoM9Pu7HLTkaDba+3CcvLV5ohHE=;
 b=OoSajsLtdGdRmvxD1Uwjtsf8aH2EtZ008Ii881qDga5WtKODFxJOC17OmvshFtWo4B
 JQumSHQ5t8UqCdS86GtBA53ms5bDD/Y+YzjsZJAg78we/YPeCYqOA8t5y08uyU87ZUJr
 2X3p2I3bO9Bt28tPcnG8KOwq7bydkZrPWxrJ2XMFFSrv9+dzpoAakB+A50HBM0nj6YHq
 /MHz7Efg+bm7HRbm6K3lFQKJcyf4TpAepSkBm6gZuWMGfP64VCysb/e3jsqXLhhuL3Si
 V0ACMLcIzLR5rU36LsWegCcDdFmLQdOoxKoE3YtehKDstNUqpOic/o8TkFd3QkDNKcII
 QXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781124205; x=1781729005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DxqTgQRW/DnHgUDBeoM9Pu7HLTkaDba+3CcvLV5ohHE=;
 b=d9sBCLBF0CXGyVcNiP9ij5iNwyVsNLcZO8X/ozjm8o+hMjpN031t5Y3EojOPUWNdcp
 mzk7etBSWNobfwIFb4tyDgX2SHTCOYT0EKkaDy9tPxUfmUeQrJ5l48yENRV6P/uW6D/d
 VN8/czOwPpajxPsV/IqdUnKghgTQt7JJCHwIjQ4S3gos+TxLYWzBvzAx/jZ2v7iyqXYE
 75YT4l1BfPk5DOmBzYrFSKQqFJFnAUIlyZIkk4clOvoaoOjX0UDSPOeSHZWiBsoTeNpk
 ejbOQLDsy82HU+qK2iADN9TDHapeXwW/Ism2qqPDwmGFr5PxJtkUjTLw/PHuxEXAzR8Z
 Dfxg==
X-Gm-Message-State: AOJu0Yw4G9X5bK9uj2f54W5nIBW50md8pRXdWH3ausLVxBK+2JHx+PFB
 QoqCq2Y1clzKr5Yt4pTvL76vdODBfiBhlHfH6uuRCw4Le+PzykindTGh3E61KQ8P9YQ=
X-Gm-Gg: Acq92OFzQRbvbRwk2ZuBKBXndoY3iFpFeuv08NNHXsNxYD26N4l1SFrXjPLIrV3R8tq
 D7knpQavL9Re0Wp2gXAQWR2+KZywiLj4TvU+XFONI2rH1NgU+4y730pnrDpROdHePe5r/gzBl8a
 2UUMM8+bH9wZ5gBdcWPLw+pDtt83cNvKifelNkllGXigvIVwam82MeaX1B4U2J34//7PKKwaS7a
 npAW3xY3IIXQQyYFNXUbPcM44sl6xlFr3vCfM7Ei3lz2vhpsOLHRiYTAJwxhjxyN3CcIOVR0mvz
 2jfi/UVkhepUN9i8CZPRKZDv/Tmm4BVkiiGRAaNBIAg7LjHcyqb1VrvXuNNoH6U6rO5ljTDJbZ1
 07ghtoDjSSDXGDvrAR5Rtdp99+TSuIj10Xb4JACpfNVAVJx8+TsUeXkau3icY7zL9F7ygH2mRuu
 df+H6HiDFq79jyEKTkuCG/gTvQNmzloB1d8A==
X-Received: by 2002:a5d:458d:0:b0:460:e4d:bd46 with SMTP id
 ffacd0b85a97d-46030631c25mr33130163f8f.21.1781124204942; 
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm74424117f8f.20.2026.06.10.13.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 13:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D7845F7C6;
 Wed, 10 Jun 2026 21:43:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/6] target/arm: a few timer fixes while checking
 FEAT_ECV_POFF
Date: Wed, 10 Jun 2026 21:43:16 +0100
Message-ID: <20260610204322.828645-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

While I was checking what was needed for FEAT_ECV_POFF I discovered a
few potential correctness issues. We had actually already done the
work for the feature so the final patch is just documentation.

v2
  - added target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check
  - ensure gt_recalc_timer has updated hcr_el2

The following still need review:

 target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check

Alex.

Alex Bennée (6):
  target/arm: split evaluation of CNTHCTL timer IRQ masks
  target/arm: trigger timer recalculation when toggling CNTHCTL:ECV
  target/arm: trigger timer recalc on SCR:ECVEN change
  target/arm: gate check on scr_el3 behind ARM_FEATURE_EL3 check
  target/arm: trigger timer recalc on HCR:(E2H|TGE) changes
  docs/system: add FEAT_ECV_POFF to the emulation list

 docs/system/arm/emulation.rst |  1 +
 target/arm/helper.c           | 29 ++++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.47.3


