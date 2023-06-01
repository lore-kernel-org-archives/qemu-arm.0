Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp295854ejb;
        Thu, 1 Jun 2023 02:47:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ63IhWOJGzWUASNoWaRgQqobPRZUK82hCX7weEfZRqAWZbJ/rFznWTdb12lU5NdC2x1MSwh
X-Received: by 2002:a05:622a:1901:b0:3f0:b5c4:f73c with SMTP id w1-20020a05622a190100b003f0b5c4f73cmr1025242qtc.8.1685612845624;
        Thu, 01 Jun 2023 02:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685612845; cv=none;
        d=google.com; s=arc-20160816;
        b=wyjToy75QnfqZrjWJyaYjabM1sFET3QVcNgQndBsZqYR1uG5txzZzzQx2QmfFQdL0h
         bzteCMmJJ+ekBNMiAYp6Nq1lMWomw+z+hPiCk9IvZGUh48ZRTMeu+cNX8WsxGLVhtPy+
         W3W8xyi84s+G2dc6wJTKHe5DSyqS6ew+oWMbIPSXyUDC3NrVO+YZlS02AQuRbEc5gOVq
         X+3GUFZ6PTDgeuVZ7RMvyDnRrKSmSihBWNozs6vknG8V8GwkkyX73asr1Mc1J/kB0OUn
         +DhorweLI9ojWO7THjG1hkhbqDMDDYBtgXwP2JlZJshnCtrRk1O1ElQXFAG7VmEczN0V
         VskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=xVGSZwAt7AXVa/ubDegQbPdDRtDFbRsFr2MQJ9cPIiE=;
        b=Zd7Cii1IARgkLFYruOyVmChy9Irq6cRP3ByQ9yDh0KeyZTdcAWm4V57PfxPvGlDc1h
         kMIsDBGzhO5eUmbxfH0IAqf19hVikheMtR01AceaCy2EsePjQ5pFwI6r0HLpoUcvu9TV
         /IYgDJUB27reioIlv2eafMOn5BKWrB3Ge6HgSVXB1aR8X+FwbvPn8ZLRiP91q8OxjikZ
         Vmtb3sSDY+ydQEuvP/AT+gnMk5KAPNRWzv9I6Ol/6UMg11e6Qt3GekbSNQRAaaU1QnKm
         v7+GhdNbD8NTYZu4hJ9iR9X9QepqB1V4q06d0uB4lUUr6IPVKcLA3gy8g9fjh1mjEDA+
         5WTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlJ63ut9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020a05622a045400b003f7f9d31712si9391184qtx.308.2023.06.01.02.47.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 02:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlJ63ut9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4et6-0004g4-Tt; Thu, 01 Jun 2023 05:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4et5-0004fQ-Ja
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4et3-0004AK-OI
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 05:46:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3094910b150so683745f8f.0
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685612788; x=1688204788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xVGSZwAt7AXVa/ubDegQbPdDRtDFbRsFr2MQJ9cPIiE=;
 b=TlJ63ut9BFXRdiXzOqlxWZ1yDXZxaxHNwX4J/hVyeTUwmtzEc8J7bvyC0eTrIEIeSr
 UsTCT5oTJuEW5xPytKJEtm+ML4VbZmgJUdu5n4X+fGVhTAUHDPqiY2cOsckIdpjE+1zD
 CyfjzTectE8NyToPpq6dTWOV+x5fkHJI17fTk9xI6RU0xrWTs1ix/UC84zeEz0Kwoam4
 Gpxb7rgdto/Za3gCZj5VOjZ3cpMt7rXs1pp+8kHWBEIjSBnRTExYFPz8v41uBRzxxbVW
 RqQ65WDNUoJTPW1rsOSwN3rrjmmEFFmi4YE7BtJk9w7i6b4l3VxGtS338m9MP0qF/w1A
 fAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685612788; x=1688204788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xVGSZwAt7AXVa/ubDegQbPdDRtDFbRsFr2MQJ9cPIiE=;
 b=W73X2AbNp5aLgL+B085/gEFX+I3rF5IsWu4nj4nZlTDKGRs7fW7xVpNI0Z6e1CASLy
 md3uk1Tz8ZUgH5KCQqGi7vFzSH+hR+rH0MA+GC7XCxoKfhQPHOjbwjdHfg03vaDs7hon
 kEB1Uo8sF7l0YZsI9OShQjhWEfUmSXNr3JQEOmY/DnZL5LWmu577mEXkdW03SMdOJ6j+
 qIpRmjfwlQ3Tc3LLCNurYKMYsuDxqciWzZShhhLrX56wGqEuOLmQcJ0t0a8yy+auO/qG
 AhVU66Vbf7ae7XY8mgTGynXFNzXBEofWEVkOhPxNhGk2VTUhrIZO6Rhdfw/IFFn+oCYE
 Qa7A==
X-Gm-Message-State: AC+VfDwxuYfiyiOmqGlyw9J+o/+gFszq3CR2EqG8Jgx4MHYT7s+PWN8p
 OOynAeiwW0PnIpac9aPfeuncAQCke3qHJxRD934=
X-Received: by 2002:a5d:564b:0:b0:306:45ff:b527 with SMTP id
 j11-20020a5d564b000000b0030645ffb527mr1287541wrw.45.1685612788093; 
 Thu, 01 Jun 2023 02:46:28 -0700 (PDT)
Received: from localhost.localdomain ([176.176.141.224])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a5d4607000000b0030647449730sm9635446wrq.74.2023.06.01.02.46.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 01 Jun 2023 02:46:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/sysbus: Add sysbus_init_irqs and reduce
 SYSBUS_DEVICE_GPIO_IRQ scope
Date: Thu,  1 Jun 2023 11:46:18 +0200
Message-Id: <20230601094625.39569-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: iwcKwMqhs7oJ

Since v1:
- Removed pointless QOM casts on a preliminary series [*] (Markus)
- Added Richard R-b tags

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

Based-on: <20230601093452.38972-1-philmd@linaro.org>
          "bulk: Remove pointless QOM casts"
[*] https://lore.kernel.org/qemu-devel/20230601093452.38972-1-philmd@linaro.org/

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

