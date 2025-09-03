Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D71CA1012
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 22:21:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utvqs-00054i-Mf; Wed, 03 Sep 2025 18:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3R7W4aAkKCOANKZKCQaCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--lixiaoyan.bounces.google.com>)
 id 1utvBL-0005ga-M2
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:19 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3R7W4aAkKCOANKZKCQaCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--lixiaoyan.bounces.google.com>)
 id 1utvBJ-0003RF-MU
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 17:38:18 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-7227bea8b73so6872877b3.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 14:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756935496; x=1757540296; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eZAZlVJGU1iSH4VawZtkXE81cRPSzmk9jg2N8KtV7iA=;
 b=UW2kE9eIhQWSr8MXQQsDHRoY7+3uDw6twJK66SetjbGGyRr/KKiJ+9/t6i3jduQxzH
 RLVBY4pG0xmLbUc9zTSKebnLCQ41TYYIVmlPHqJX7nriiYTM/goHcZWMYEKC0Q1PZLoB
 aHfqa7GXcLRp8uysS8KjJY8KAPd/1dOY7VnrNU5+FDYI0YiM7GlvFixggwp6yAk00lis
 jGXtheOT4XjwrvUEfHkzt5p525rv3y8/hXiOw1nMWVjE8tIKdqKSTFsQ9v1CDhPGn6yN
 l+EdJMS1TIbFx/RTmtvzHwiSVvUrowkTJ6NkK69UkXy2qg0EDJQXefaLx1WHzdMI1DoU
 USJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756935496; x=1757540296;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZAZlVJGU1iSH4VawZtkXE81cRPSzmk9jg2N8KtV7iA=;
 b=iBraNGtphpEvsjWSFCyQZpNMLmPuCUYLZJgwoivCi/NaSVvHQDVdcLEWwjF/8V5ebm
 JbFT2VF5psuxC6Bts3y3PieihDjJ9Nc+lmwAj0y1y4JVO7QiylH9Ud2Fi9LyDAESUmAu
 NP2MzrDUa28gMXtOVXCU2rwJDwydSvHkcdZpIgYDdnz/zsvctYHiTRwZPYSu8FzAKQvZ
 4jOba2YNGP45SSrwKIGg1+Owmkco2jo+znF4Dwuk3HVWmPTWNutGJl6zrU0EUOgJPGho
 QXkThsldUyofxIZwnOdTzsYF0kZfNBw2qCYEy7+t2EWxeWBdMj6mncp55W8y9h1hp+gT
 w4LA==
X-Gm-Message-State: AOJu0YxZGCfwVFUwGT3XsSo2BlxHGONKKoAp+arGoNh98VyIKdXEkkWe
 hZfi0Jd4c7RtwCdvrk8f6t9eU7YFBK1IvvKzoCNSTnQ/I9M4L+IBOmNt4V87gWHkoqkt5AAIdm2
 6eOboO9OyjXujevaiwA==
X-Google-Smtp-Source: AGHT+IFoSq3EkO/IOZ4KWnWvfspMYDicFWq3esxNhYVmhFXdw3fGP5eFEZRbtNGhszpDh/Pno/UEtZT6ccs8KqQ=
X-Received: from ywbfp10.prod.google.com ([2002:a05:690c:34ca:b0:721:60e6:a6a])
 (user=lixiaoyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:45c3:b0:723:be82:c7a1 with SMTP id
 00721157ae682-723be82c87dmr45501097b3.1.1756935495770; 
 Wed, 03 Sep 2025 14:38:15 -0700 (PDT)
Date: Wed,  3 Sep 2025 21:38:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250903213809.3779860-1-lixiaoyan@google.com>
Subject: [PATCH 0/5] Add Aspeed GPIO test and Support Nuvoton Serial GPIO
 Expansion (SGPIO) device
From: Coco Li <lixiaoyan@google.com>
To: peter.maydell@linaro.org, clg@kaod.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Coco Li <lixiaoyan@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3R7W4aAkKCOANKZKCQaCPIQQING.EQOSGOW-CTOPQPIPW.QTI@flex--lixiaoyan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -86
X-Spam_score: -8.7
X-Spam_bar: --------
X-Spam_report: (-8.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_FROM=0.938, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 Sep 2025 18:20:29 -0400
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
This change gives ASPEED GPIO similar behavior as Nuvoton. 

SGPIO series:
Implemented SGPIO device according for npcm8xx.
Two notable implementations left undone in these patches are:

1. Reading the data from the host controlled SIOX via register IOXDATR
2. On-demand with polling reading node

The reason is that both are currently unused/umimplemented by the nuvoton driver.

The changes to qobject is used in both sets of patches.

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
2.51.0.338.gd7d06c2dae-goog


