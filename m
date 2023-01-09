Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2343561ejc;
        Mon, 9 Jan 2023 07:26:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsQnQhlQYaSTQc8ULBlcFbxLMq2o34SXq3eqheX28yjiRkio2lPJX7rUZMgZsf1pTSYEQyn
X-Received: by 2002:a05:6102:942:b0:3ce:d295:78f8 with SMTP id a2-20020a056102094200b003ced29578f8mr7788501vsi.20.1673277974457;
        Mon, 09 Jan 2023 07:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673277974; cv=none;
        d=google.com; s=arc-20160816;
        b=yd3+9q5+yLVXz4lSjvdOJGH+iQbRl+KCl+QVNiZXkhYQUpBG/50hM2lxF9GNGPQOyc
         x7/vuY8VK52JwpZC6F7JKKMXenSN8NwEj+AF64lbZb7Sgj5oFd71pvnmPfctz4jaV0o3
         G4FesGf7RwY58/nwNt6aXVtimOr5rGJ39UJZiLB/ugptXUoiRkGTAebYodl3Ka97jT/W
         uRTsfZ9XZz4PXwA1jFjM0qfRcjpS7mfdQzGESEr1qmMiyTdFcL6eqOuic98QuQtHSr2I
         yTvKBR018LwMfhXu5OvsV7q+G6GIVPUdbfSMnbpVbmjNEQKZ4rEE1vgE1RXSWplrX/Uw
         7HNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=lpu5SKcEKLbf6iXn0npn8iBGzhoC7Iq9AT+jjeNugWM=;
        b=YG3DFJhFHvBHHvGZgXnTEeaawG29HZJDUxwQM8dgrkG6de9g6VZdjqvnRFbFe29EAc
         SEW8egssGHRUzeq2EXCczUGqbMl01xHpOz6H/qEFhUE/tTKDGT89F2IyyH9O8x8B0BBF
         NDWn5kf4Sxpt16Wd+xJc2AqQ+3uQHqW4Flb4/RPGAQhYT2nV/HPQEYNE8tZ+aUR95C08
         wDHZHtnjNJpKNrO7laf4kxU0nuOhEU5V1fGGwMI7bwPMGbJXbyR04hdK6oGo8DUbuCbg
         OkSJF0QE7P5uAtIEqz7MYVcyZcgjfytRZcB7k7livKDWU2hoQyfDkQLKiRzXi8g9hCJw
         F53g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNmpRDJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24-20020a05620a085800b006ff855486a8si4242999qku.320.2023.01.09.07.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 07:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jNmpRDJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEskA-0001TB-9u; Mon, 09 Jan 2023 09:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk4-0001Nt-Lh
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:15 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsk2-0006LA-Kl
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:03:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so9111396wmb.2
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lpu5SKcEKLbf6iXn0npn8iBGzhoC7Iq9AT+jjeNugWM=;
 b=jNmpRDJWrRKW4WLC/ZFdDoOBGr6KYLN0qDZ5cOLQmDiwJrF7tb/atiYdd86JfbPKP4
 1wD1JaX+rNy+KpwUEUroNRPiwhLbxWexBadI/YHfeSt+rzNuO8joJCQsLqp2GxIdKInZ
 3O+iw47rVpI0Z4rIVD7EQ0UPAhMzTfC6wlvUmAHc6ZcnVLiHw2pN/8dBEhIU/5TK5LLw
 L2Gcb0C8XM2PLQPYhP1gDC2LtikkcEibggdOKMKzfbSQ2YmLXbNmrFT0NvI+aKkqI2al
 f16Gq+wOeNDtBNd/OetSmSW/NDgABZz/w4BcxBdtg+rfgTL59Nc9cSvB2DNexgXkWQXW
 dfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpu5SKcEKLbf6iXn0npn8iBGzhoC7Iq9AT+jjeNugWM=;
 b=5sPCqmlo5biB6N9UsRqea+XqdgdE7PpOK/AY9ierU53rjLlSFx7axKe9kWCf5d+0xh
 6C2pQISjToFSXFFNzy/ELBQ79QY0VnHuBsjQL92PvJDe3b33FT4saNNbjc71+bR6+UYV
 v54zwnTodrYsY0lZ3b7/tEKpiOrMW02nY2BxvaLNtfbRoL2yZyBM71OHTjwcMSFoG90U
 xbuYtLtmKAU2C8FrNX5M/Gq4UerEUU1Ab5jVCf70IsNaPO4cff/NUsMxUSc7GjtUCy6Y
 7y6w1WYpzCqiuiOskYYEFovqfRrdSC0BBaoX5w5T6+y9I1zVWjRTPokCT0nbgM0jSXgA
 4DlQ==
X-Gm-Message-State: AFqh2krxR8RPKRr1AaPm+uosnzPa/IZi35he+ZW3oAybqBInvsMNDc3W
 EgDLZCzEO/g610qFdtxE5FYmPQ==
X-Received: by 2002:a05:600c:35c7:b0:3d3:5d0f:6dfc with SMTP id
 r7-20020a05600c35c700b003d35d0f6dfcmr45837463wmq.30.1673272988854; 
 Mon, 09 Jan 2023 06:03:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c00d000b003cf4eac8e80sm13759902wmm.23.2023.01.09.06.03.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 00/14] hw/arm: QOM OBJECT_DECLARE_SIMPLE_TYPE cleanups
Date: Mon,  9 Jan 2023 15:02:52 +0100
Message-Id: <20230109140306.23161-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OTgY6mw8FzMN

These patches certainly look as churn, but they are required to
be able to update the OBJECT_DECLARE_SIMPLE_TYPE() macro...

Except the OMAP related files, the rest seems to have been
merged shortly after automatic script conversion from commit
8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
was run, so missed the QOM cleanup.

So here we go with yet another boring cleanup series.

Philippe Mathieu-Daudé (14):
  hw/arm/pxa: Avoid forward-declaring PXA2xxI2CState
  hw/gpio/omap_gpio: Add local variable to avoid embedded cast
  hw/arm/omap: Drop useless casts from void * to pointer
  hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP1_GPIO type name
  hw/gpio/omap_gpio: Use CamelCase for TYPE_OMAP2_GPIO type name
  hw/intc/omap_intc: Use CamelCase for TYPE_OMAP_INTC type name
  hw/arm/stellaris: Drop useless casts from void * to pointer
  hw/arm/stellaris: Use CamelCase for STELLARIS_ADC type name
  hw/arm/bcm2836: Remove definitions generated by OBJECT_DECLARE_TYPE()
  hw/arm/npcm7xx: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw/misc/sbsa_ec: Rename TYPE_SBSA_EC -> TYPE_SBSA_SECURE_EC
  hw/misc/sbsa_ec: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
  hw/intc/xilinx_intc: Use 'XpsIntc' typedef instead of 'struct xlx_pic'
  hw/timer/xilinx_timer: Use XpsTimerState instead of 'struct
    timerblock'

 hw/arm/bcm2836.c               |   9 +--
 hw/arm/omap1.c                 | 115 ++++++++++++++++-----------------
 hw/arm/omap2.c                 |  40 ++++++------
 hw/arm/omap_sx1.c              |   2 +-
 hw/arm/palm.c                  |   2 +-
 hw/arm/stellaris.c             |  73 +++++++++++----------
 hw/char/omap_uart.c            |   7 +-
 hw/display/omap_dss.c          |  15 ++---
 hw/display/omap_lcdc.c         |   9 ++-
 hw/dma/omap_dma.c              |  15 ++---
 hw/gpio/omap_gpio.c            |  48 +++++++-------
 hw/intc/omap_intc.c            |  38 +++++------
 hw/intc/xilinx_intc.c          |  28 ++++----
 hw/misc/omap_gpmc.c            |  12 ++--
 hw/misc/omap_l4.c              |   7 +-
 hw/misc/omap_sdrc.c            |   7 +-
 hw/misc/omap_tap.c             |   5 +-
 hw/misc/sbsa_ec.c              |  12 ++--
 hw/sd/omap_mmc.c               |   9 ++-
 hw/ssi/omap_spi.c              |   7 +-
 hw/timer/omap_gptimer.c        |  22 +++----
 hw/timer/omap_synctimer.c      |   4 +-
 hw/timer/xilinx_timer.c        |  27 ++++----
 include/hw/adc/npcm7xx_adc.h   |   7 +-
 include/hw/arm/npcm7xx.h       |  18 ++----
 include/hw/arm/omap.h          |  24 ++++---
 include/hw/arm/pxa.h           |   6 +-
 include/hw/i2c/npcm7xx_smbus.h |   7 +-
 include/hw/misc/npcm7xx_clk.h  |   2 +-
 include/hw/misc/npcm7xx_gcr.h  |   6 +-
 include/hw/misc/npcm7xx_mft.h  |   7 +-
 include/hw/misc/npcm7xx_pwm.h  |   3 +-
 include/hw/misc/npcm7xx_rng.h  |   6 +-
 include/hw/net/npcm7xx_emc.h   |   5 +-
 include/hw/sd/npcm7xx_sdhci.h  |   4 +-
 35 files changed, 282 insertions(+), 326 deletions(-)

-- 
2.38.1

