Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB916C55174
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 19:14:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrh32-0008AC-CB; Wed, 05 Aug 2026 15:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrh30-00088v-67
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 15:13:02 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrh2y-0005a9-31
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 15:13:01 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-4566a5bc186so557501fac.1
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 12:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785957178; x=1786561978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=P+/zS48YlBPvLSJbKrbixNLAeu6upOPlmlNFBogrFVw=;
 b=DnFAgWQRSwIu6meDTeWv5Ss+mRCjHvTosf9E4j4Nzdh3mnRoraVlBYK6RXaPvOtcqn
 J8TedNfw+4Xf67UqATBGVz2WqyMBD9hvvqRL4avt87fuv8Sfxc5bdVlbtWZGg3veWq3i
 XVpxz6jaJzz6OEdLnXp7zP0gBAj1vu5nT+Onl38GPhpNDKG65iNyzaiSuFKyeyYT1AGu
 KTbA8RoPxwyNSM6CiRElzPZALzSqIY7AKytfmNpwg664g7+P0ZeIGMDvdddH1QxXlJka
 vjZGvg/NT9V2RK/WQSpbJ0I1rqrkjs1blzFmctppKBiDCfOyaqGejdLw/Vvwk1hdCd6g
 ZnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785957178; x=1786561978;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=P+/zS48YlBPvLSJbKrbixNLAeu6upOPlmlNFBogrFVw=;
 b=CklE6UaosbkdjUOkQjLzd95RMNYTrla7KY58Bbv03xGJTySj53TipbFc0bkKm197Ur
 z3BUl86BGcA+bd0pBci7enNa5nI0qD78cECWU+S34vo14/U8DrZu4bpGoOmiS/N+/LTc
 izD534cAuwHXoWXt0bnQ1Dqtcf+ecC0n8sKm8oAWtPc5luN2GKppRRsV6jTl1D5/MWQA
 FfOLdROAQJLsFy39Qjl7AyOhooA8em5Zb6mHezCBswPpc1aBKw1hbBx9Fo+g7yWovQLC
 P77zNb5GUjoCtr01cR+mqWCUqDDDXIUu+3LdgQZd3aHSO4ynlcrAAmPZOIjTCToFm+5m
 m7VQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp+Vpk6RodiCCB1taA1R+8LruO3wxObetog6vGBSrJw1n+hwlT64ek0N/Wig249pZDZSrnsbY5+7g==@nongnu.org
X-Gm-Message-State: AOJu0YyyJG+raoxxsEQsQnrX9JfxRrBy/UxMN5IdSd19UjLd3yuvdVYF
 h/SXkOm41nMKKLpgVdbx5P6tkcvMkquCVBA7T/5Ksea/5bIj62QGuP5X
X-Gm-Gg: AR+sD12po1+bKXhIN5xFT+PMsz8Ya9Px2V7HxxYFH51Kz6UzsQaT87gbyMRaSy87yz5
 BlGjn3y9n8jOIJU+PSN8KB+b5j2wf9KLLBOc8mnqNYhPGAZi3EHtffwdcHttyYs6PjAIqczdLko
 ibCBHksp0ENP3zlKEyu8v8+l3CEucls2RLny8dxzCcId9zVw169qG3yDW14bXuktAU9paPtLGnK
 Ijw9zwwiTtwW3x/lPpZvAUOqiaY3V856h1xeo5csOyoVwHWfteR4fkZYnXO9Pz1xT1GBXzQd4xw
 Em2cKHZodrYM6uxzCLlHi5jbuIrIUygz9mMeA4IilKQYLHRT7z6zjgKpwkxO1ezlY01Zjk+4VaY
 ag0Zxalrkv+AMGLZzaC+zN9GWjbKKC+eONY9EVcgmsyYPYFHnMWaogosIs8CXCKOXr6WulH1HhL
 +vXzrmk/oxMWmJ83KGjNnWOkMZJsPpK4H6f44uiVQz4VazXzXwpHqJUlGT8l6C5w4Kdbbyaoi+/
 HGDxFvWje4UbxM=
X-Received: by 2002:a05:6870:2249:b0:448:3eb2:8c8c with SMTP id
 586e51a60fabf-4599eb81db8mr4509912fac.6.1785957178503; 
 Wed, 05 Aug 2026 12:12:58 -0700 (PDT)
Received: from HPE-2MQ6131DV6.ams.hpecorp.net ([170.85.98.248])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4599dd615ecsm3494867fac.0.2026.08.05.12.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 12:12:58 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 0/4] hw/arm: bugfixes for Arm SSE-300 and AN547 models
Date: Wed,  5 Aug 2026 14:12:53 -0500
Message-ID: <20260805191257.11303-1-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This patch series fixes bugs found in another patch series and more:
	SSE-300 SLOWCLK Secure Watchdog address was in non-secure region
	SSE-300 PPU addresses were copied from SSE-200 and not correct
	AN547 MPC ports were not correct
	AN547 was missing the DMA ports on AHB PPC EXP1

https://patchew.org/QEMU/20260723233605.805-1-simonxhy0404@gmail.com/

Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Simon Xu (4):
  hw/arm/armsse.c: fix SSE-300 s32kwatchdog address
  hw/arm/armsse.c: fix SSE-300 PPU addresses
  hw/arm/mps2-tz.c: fix AN547 APB PPC EXP0 MPC ports
  hw/arm/mps2-tz.c: add AN547 AHB PPC EXP1 DMA ports

 hw/arm/armsse.c  |  8 ++++----
 hw/arm/mps2-tz.c | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.53.0


