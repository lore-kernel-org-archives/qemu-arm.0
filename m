Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7D5CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 00:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1aJs-0001ie-HQ; Wed, 24 Sep 2025 20:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u5PUaAkKCIIro3ogu4gtmuumrk.iuswks0-gxstutmt0.uxm@flex--lixiaoyan.bounces.google.com>)
 id 1v1aJq-0001iM-Eo
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 20:58:46 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u5PUaAkKCIIro3ogu4gtmuumrk.iuswks0-gxstutmt0.uxm@flex--lixiaoyan.bounces.google.com>)
 id 1v1aJm-0004lY-0W
 for qemu-arm@nongnu.org; Wed, 24 Sep 2025 20:58:46 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2697410e7f9so8685575ad.2
 for <qemu-arm@nongnu.org>; Wed, 24 Sep 2025 17:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1758761916; x=1759366716; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rDRs9+aBCn+Jy+mgU9sdV4/Nc3+ZKmTx3yGeyVeIeSo=;
 b=GG3uIwOpXgsYGfvE3aGhZhUR0PWhugosoZAJ+w2syeRUKztl68Wv3dUXnN4uwR/s0P
 87wBeYBToCd2wIxvS6S+Vv+TRDlmc9b+HLTXfEvFsfM2EpflijbG91pnmYQiDk62tBK7
 ynhFc2a2OJYPmLYDUFyuv2o7wl57MNmKxLq2S3jM+36muhwyaYk2smi6scDLCAz92Gry
 D8SVOkk+iJvNNk3Br4w1jq33Iw/eOoVJEXKddMibi1+KhI89fmo/5xCwNZWOWabUSDG1
 zJ1FnKDDyZ4Ha2gybAAOjrqVxZ0rWsrEltcBSPNf2jLFGgwZZ12YCYFl61EnilrbVDlJ
 VSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758761916; x=1759366716;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rDRs9+aBCn+Jy+mgU9sdV4/Nc3+ZKmTx3yGeyVeIeSo=;
 b=mf/Ys6xVuo5IJTY14pa4Nh64JYMqhGjXke1ULrHIljIAPfgq8SKoy+L/JUMHIM8e8N
 wQc9qordClGr2nBrVlFm6BsqVBGs46JhYJl69w6/nfj/em1Ree2MNqSSKJso1CCrIckb
 2vp005rNOmytyv7dp/N23i60kGZkiW1rYNvdINC1pPF2EhiW2YWDPE6uvlgd0iOA+1Cr
 vpL1s90wgOh1nnuHLQKlG3vWNdH0p7H42/BMi5gb8g+sQ6LW+INrEalgeYqHY0Sb/lCy
 XaXTw7zA+Lza74JLcWWLJTTEM0wwKpZKPDNPWQgDCSYebX1akRkolDYu17hdRV7mJX89
 YPhg==
X-Gm-Message-State: AOJu0YyHwvzP8zgNlREL4Pilae7TPQVq5D1jp0pxUz7961/wVmsKXSS4
 dTkxub3ldWV75iVeHlPUsTMaFQNK4LFGBksVaV/+zHU9IX84m2PYiokfN5x5r/ylqfWr2CWl4DH
 kRKvIfKbFd0L7zbfABQ==
X-Google-Smtp-Source: AGHT+IH0g9HD0leCGXPaN+R6mtwGGBgj+5vInWL3WnzGQL77s1vklJX87y1/3Y/1AbbqEqNAI48jXEdHY4NkcEg=
X-Received: from plco15.prod.google.com ([2002:a17:902:e28f:b0:267:e964:bc69])
 (user=lixiaoyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:27cc:b0:269:63ea:6d4e with SMTP id
 d9443c01a7336-27ed4a3de18mr10978115ad.37.1758761915807; 
 Wed, 24 Sep 2025 17:58:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 00:58:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250925005832.3708492-1-lixiaoyan@google.com>
Subject: [PATCH v1 0/5] Add Aspeed GPIO test and Support Nuvoton Serial GPIO
 Expansion (SGPIO) device
From: Coco Li <lixiaoyan@google.com>
To: peter.maydell@linaro.org, clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lixiaoyan@google.com, 
 flwu@google.com, andrew@codeconstruct.com.au
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3u5PUaAkKCIIro3ogu4gtmuumrk.iuswks0-gxstutmt0.uxm@flex--lixiaoyan.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

GPIO series: 
Added 32 bits property for ASPEED GPIO with updated qtests.

SGPIO series:
Implemented SGPIO device according for npcm8xx.
Two notable implementations left undone in these patches are:

1. Reading the data from the host controlled SIOX via register IOXDATR
2. On-demand with polling reading node

The reason for this ommitance is that both features are currently unused/umimplemented by the nuvoton driver.

The changes to qobject is used in both sets of patches. The patch series implements indexing gpios with array indices on top of accessing with registers.
The reasons for this is becasue it creates another easier way to access gpio. In our internal tests, we model complex behaviors with a large number of gpios, such as in fault injection, or in networking behaviors.
Indexing multiple gpios at once allows qmp/side band client no longer hardcode and populate register names and manipulate them faster.

Updates since V0: added more descriptions on qobjects change in cover letter.

Coco Li (3):
  hw/arm/npcm8xx.c: Add all IRQ ENUMs
  hw/gpio/npcm8xx: Implement SIOX (SPGIO) device for NPCM without input
    pin logic
  hw/gpio/npcm8xx: Implement npcm sgpio device input pin logic

Felix Wu (2):
  hw/gpio: Add property for ASPEED GPIO in 32 bits basis
  tests/qtest: Add qtest for for ASPEED GPIO gpio-set property

 hw/arm/npcm8xx.c                 |  66 +++-
 hw/gpio/aspeed_gpio.c            |  57 ++++
 hw/gpio/meson.build              |   1 +
 hw/gpio/npcm8xx_sgpio.c          | 533 +++++++++++++++++++++++++++++++
 hw/gpio/trace-events             |   4 +
 include/hw/arm/npcm8xx.h         |   2 +
 include/hw/gpio/npcm8xx_sgpio.h  |  45 +++
 include/qobject/qdict.h          |   1 +
 qobject/qdict.c                  |  13 +
 tests/qtest/aspeed_gpio-test.c   | 105 +++++-
 tests/qtest/meson.build          |   3 +-
 tests/qtest/npcm8xx_sgpio-test.c | 222 +++++++++++++
 12 files changed, 1039 insertions(+), 13 deletions(-)
 create mode 100644 hw/gpio/npcm8xx_sgpio.c
 create mode 100644 include/hw/gpio/npcm8xx_sgpio.h
 create mode 100644 tests/qtest/npcm8xx_sgpio-test.c

-- 
2.51.0.536.g15c5d4f767-goog


