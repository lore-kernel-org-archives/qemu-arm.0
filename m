Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp29178ejb;
        Wed, 31 May 2023 15:34:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5R0ZnNFRAhE5zNTzns06NJnXVjMFttkjByp04r/kSc1k64ZjDZvRxGFussr5n4/Lt0OsLe
X-Received: by 2002:a05:622a:11c1:b0:3f4:917f:acf3 with SMTP id n1-20020a05622a11c100b003f4917facf3mr8819515qtk.35.1685572462553;
        Wed, 31 May 2023 15:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685572462; cv=none;
        d=google.com; s=arc-20160816;
        b=gV01MXP1CXDP/TBFSbao/xzjld2GHQXbj4xa1GqwnlSpc5fGgXFClPOy0gZY1Jt4dd
         a3U7cl1G2j0Szexecgd4knsjnukrLJPf8Eqeg/rf7QOWAjOTbW0x9f5DyaB1Ca4++pwS
         BGF606SOSpVDwYDMhU/wJc5rmAbBj5X+ymk0eX7Q7MgdAZ2KCjqFVQVzZ5b3zSFUUWjq
         4W3T9fAb7XzhbVQcI9pjMemlDHLddWnR/IRSiEZPmVFXeDHl4BXjUjDgqHXO/nD9wOCi
         5SShvYMsMuq5FHTqMftsBQIuzMg+qqE2IP0lwiIRS15o9Yx+y8+bQW6PTQudpr9CEBPv
         p+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=knDkPGiUsAKV4vjHj0yXucrmS51UBie64TABOaedj0Y=;
        b=AElMZojS0i35F85L+vtVUtuRHE1Pr/i7DCNFYq53OCxZDy/aLmEAeIsImwrZqU8MoO
         dlnMdsDJ7oNufNXYnwKbG6cgrsLSF3zdzgInXdQ43bMBmh+SIOWI1uqBrlY5hXgv3Os4
         RW+y9gG4bqe1s+Fnqlw8+WenGoBHLZUDHt7o0a+e6dmbSwnDLu/wz8/p0GZYoP0JnBAu
         p8wUsUc7qWbVlp6avtMveXhwrxjTKcFgr6gHTk8LAIm7372aCQGPSXbMptEoTxLeSJiT
         FVCvzKra2NqDxLiPOcF6dFluuC5kKbXeQxBREbqwqGp+8tPPVcahm8O77WeCrsBNN42r
         Gj3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1yPop8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05622a148b00b003f6856c175asi8600946qtx.94.2023.05.31.15.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 15:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O1yPop8f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4UO5-0001yz-FP; Wed, 31 May 2023 18:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UO4-0001uZ-Cz
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:33:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4UO1-00050D-NP
 for qemu-arm@nongnu.org; Wed, 31 May 2023 18:33:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6d3f83d0cso1949815e9.2
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685572424; x=1688164424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=knDkPGiUsAKV4vjHj0yXucrmS51UBie64TABOaedj0Y=;
 b=O1yPop8fla84DddZQv5Kg+XTx1UYMGH3Sj/io/AgqjCI8syfnyjYbdJoVg7mre/1Ir
 qpoSnBtEqbVbtXdC4kisQmxxJ+ZXyTugBrbu+ihYMFrw0uyj1K8qImwRwhtCQq/d79vs
 cTTjvUDMnCt1/QijknQyT7bbwylogPT+AGaAre7kL3mwoNcZMykOldP+LsohUIk8SoOa
 afSq6Sva1EpiHrBO/x6E7hgeq/S0f08LWozS4SUal5gx9oeZhZneA2yqDV2nY7NIRnQN
 kFYcP5MSlJVHdQfn78rdSFN4Bof+6bZvtdBuWRHI3YmerMMb8OsF/Wm628nydxOaEr0l
 vuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685572424; x=1688164424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=knDkPGiUsAKV4vjHj0yXucrmS51UBie64TABOaedj0Y=;
 b=HrB7D8qKUW6zFW7F/r/RsNHwGZOyvlnL+2fJX1S9EoPnYHXBbQfCGHk1CGzUzfMZAK
 jw6IdlIAVNsPszytiBmOPztglX9KXiZ2MidHwZfb7FCWW5c2LbfGy57Qlo4aScuEIF/M
 IzzvgmeDhjXKG5dfuAfkBGylolBCeetwcfB9cNFdf2w0NJoHcff12nNU0EzHLA69Xt2w
 l5cR7Njqf3SmNr7xISWnZM9xJuLOzZ8uTRKrbOykf6iNyfWqYswZTJfWZ15N6iFeP6F7
 DWPJj8qAh2Dkx0ar1JXih9uyU/7Gx5BxSmvPP2n/8D1uwUNUhSP+o/1JKF9e6PkAOxDm
 hz4w==
X-Gm-Message-State: AC+VfDw4ODNxXWfC6a59yGgm6fB5ZiQxLHkJEC1D5bANkc4PGLGUKR9f
 24QO75PzsP7mrPVyekrbTndblQ==
X-Received: by 2002:a1c:7206:0:b0:3f5:ce2:9c82 with SMTP id
 n6-20020a1c7206000000b003f50ce29c82mr625426wmc.32.1685572424231; 
 Wed, 31 May 2023 15:33:44 -0700 (PDT)
Received: from localhost.localdomain ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c028900b003f60482024fsm88700wmk.30.2023.05.31.15.33.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 31 May 2023 15:33:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/7] hw/sysbus: Add sysbus_init_irqs and reduce
 SYSBUS_DEVICE_GPIO_IRQ scope
Date: Thu,  1 Jun 2023 00:33:34 +0200
Message-Id: <20230531223341.34827-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9x6Iusd5ITfE

This series:

- Remove uses (out of sysbus.c) to the SYSBUS_DEVICE_GPIO_IRQ
  definition, using proper SysBus API methods,
- Reduce SYSBUS_DEVICE_GPIO_IRQ scope, making it SysBus API
  internal,
- Convert various for() loops iterating over sysbus_init_irq()
  by calling a single sysbus_init_irqs() instead. Mostly an
  automatic convertion except 4 files.

The resulting code looks nicer IMHO, and is possibly less
bug prone.

Philippe Mathieu-Daudé (7):
  hw/arm/xlnx-versal: Do not open-code sysbus_connect_irq()
  hw/usb/xlnx: Do not open-code sysbus_pass_irq()
  hw/sysbus: Introduce sysbus_init_irqs()
  hw/usb/hcd-xhci: Use sysbus_init_irqs()
  hw/sysbus: Make SYSBUS_DEVICE_GPIO_IRQ API internal
  hw: Simplify using sysbus_init_irqs() [automatic]
  hw: Simplify using sysbus_init_irqs() [manual]

 include/hw/sysbus.h           |  3 +--
 hw/arm/smmuv3.c               |  6 +-----
 hw/arm/stellaris.c            |  5 +----
 hw/arm/strongarm.c            |  5 +----
 hw/arm/versatilepb.c          |  5 +----
 hw/arm/xlnx-versal.c          |  4 +---
 hw/char/pl011.c               |  5 +----
 hw/char/renesas_sci.c         |  5 +----
 hw/core/platform-bus.c        |  5 +----
 hw/core/sysbus.c              |  9 ++++++++-
 hw/dma/pl330.c                |  4 +---
 hw/dma/sifive_pdma.c          |  5 +----
 hw/gpio/sifive_gpio.c         |  5 +----
 hw/i386/kvm/xen_evtchn.c      |  5 +----
 hw/intc/arm_gic_common.c      | 20 +++++---------------
 hw/intc/arm_gicv2m.c          |  5 +----
 hw/intc/exynos4210_combiner.c |  5 +----
 hw/intc/loongarch_extioi.c    |  7 ++-----
 hw/intc/loongson_liointc.c    |  5 +----
 hw/intc/omap_intc.c           |  3 +--
 hw/intc/openpic.c             |  6 ++----
 hw/intc/slavio_intctl.c       |  6 ++----
 hw/misc/avr_power.c           |  4 +---
 hw/misc/macio/gpio.c          |  5 +----
 hw/misc/stm32f4xx_exti.c      |  5 +----
 hw/net/cadence_gem.c          |  5 +----
 hw/net/mcf_fec.c              |  5 +----
 hw/pci-host/designware.c      |  5 +----
 hw/pci-host/gpex.c            |  2 +-
 hw/pci-host/ppce500.c         |  4 +---
 hw/pci-host/raven.c           |  4 +---
 hw/pci-host/sh_pci.c          |  5 +----
 hw/pci-host/versatile.c       |  4 +---
 hw/ppc/ppc405_uc.c            | 10 ++--------
 hw/ppc/ppc440_uc.c            |  6 ++----
 hw/ppc/ppc4xx_devs.c          |  4 +---
 hw/ppc/ppc4xx_pci.c           |  5 +----
 hw/ssi/ibex_spi_host.c        |  5 +----
 hw/ssi/imx_spi.c              |  5 +----
 hw/ssi/sifive_spi.c           |  5 +----
 hw/ssi/xilinx_spi.c           |  5 +----
 hw/ssi/xilinx_spips.c         |  4 +---
 hw/ssi/xlnx-versal-ospi.c     |  4 +---
 hw/timer/allwinner-a10-pit.c  |  4 +---
 hw/timer/exynos4210_mct.c     |  4 +---
 hw/timer/hpet.c               |  4 +---
 hw/timer/renesas_cmt.c        |  5 +----
 hw/timer/renesas_tmr.c        |  9 +++------
 hw/timer/sifive_pwm.c         |  5 +----
 hw/usb/hcd-xhci-sysbus.c      |  5 ++---
 hw/usb/xlnx-usb-subsystem.c   |  2 +-
 51 files changed, 70 insertions(+), 197 deletions(-)

-- 
2.38.1

