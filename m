Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A498CCD1BF
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Oct 2025 19:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCN5N-0000uI-03; Fri, 24 Oct 2025 15:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN5L-0000tU-HL
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:04:23 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vCN5J-0004zo-2M
 for qemu-arm@nongnu.org; Fri, 24 Oct 2025 15:04:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so14522795e9.2
 for <qemu-arm@nongnu.org>; Fri, 24 Oct 2025 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761332658; x=1761937458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DI4urzwiBkpvf6sSaNyHt9E181h3FLTAu5FO96TNJJo=;
 b=GwMmGgEak/WOwFj9r5E7CxWN8Mc2vMMqVTgBhV1xqatu3SfqmJEhqVCMEXmhb+xGRD
 eVAF3ALaW1WCHSc5bTXfKhua3hl1aCmKtUpaOGmUAJxelkerh/9Jz0rAddlD8tzJ8FnZ
 GNTz3300Zx/EFTiAGnmuMO2Gk07wwcuLV20afE6uZnjfAa4yawrKIOusUMhZG0ZA7C+M
 7YpSTBpYHS/rXBRr2OiQgKjIbIjxjsJHro0gm3XBRCcMA6NmqQUf+F2pLjXlG7aUBBgP
 /pf+zeIanUPmd9vpTLeB/efCISt6XOrbI9GyhW2l/XaRJFmI0EUk5871qWBknA6C951Q
 brHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761332658; x=1761937458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DI4urzwiBkpvf6sSaNyHt9E181h3FLTAu5FO96TNJJo=;
 b=hXJSlhmTzcAdhZKWFMcABxBddBn+CvreGfZPY7Lh2Zil7pTvnMJ7XRzZ+ryk+dRZrB
 sRJMIsStdu/8qo/ytLgnP97YkFobbAHEiss9vk/KaXUsQqMJcCtt5PDDDi7CLZ9PLRAC
 ZrSZrMQAJ41zZPwFtpNoSPxhw9BIPYe7m4N3LVSGFy1wbS25S3L+GGLrGZ1HkaLIqZ6i
 amoI0wyCw4ZB3dZPNmfevGGfU+XcJxtJuge1Hn219GMvfp9kkcr+PS6D5kqCxY0wBpK6
 UlcT4K4Tt9xIkOdSgQCgl2OUxPCqiB8Z1CcNmlR1b74G9Zfase7Xwij42N+1YYPAkOi8
 iQzw==
X-Gm-Message-State: AOJu0YwBr8W8Mig4whHBcPWa97FKMVwRHmPQ50VUP9hV/7qfY+8E0hPI
 kIAgw29ZwwmiXwMLLvHU9lsekNzcgqk8QMQggmDBhJ3jEh2SqFWS9QukW/QKZhwt62w=
X-Gm-Gg: ASbGncvynos4v365HQH9owlS87gZgQDOAXVn6VB7ISFEmQuPTBOPCEv4ORxKcaxmDTA
 Vm3nnyRi4sWG882iRRuQjIUOhVdTXluQHZsSN5YKxz/whq+YIeLL3bgwdaqZzT5FCDiDJaru03I
 +RQAboE3wzO0dgKp4wmLOaPSTyjTMaj3qtOp1kvA/3OZPTcUrSVZSOkAqyqh60ISrjdLh2IeVBb
 Pxokhz6NhlMnOvh+iNPSi01JXaVnj7b5o36Y41XHz89W4AvAWURl1xK69+TKx0y/Q/aQjzxmEMM
 q/lpIP56IWg9D9SpyVHfcm0TkIJTtp+PCUroQK5OKGG6SZkg5fzlVqFbhYb+fB59nn+eYieSH3q
 kqEAmwzbsR+68V6tHXCQhClD6xybPN1KAVTDBMX9X9b7ChxRsHfLrAAq8XuDdNKeHswHeCfaTlM
 4+HSeZJ6YW8Jlm31PFc9j+RfZ4KMt98iFy3SFQibnj6O19MOCFEg==
X-Google-Smtp-Source: AGHT+IHRTgCZhtm+u8RTYICAZZr5sSX1RA/Uh2bvpsX7iZwxYT/r4c1t3Oq+vhjlWWoItp1FMGaGDg==
X-Received: by 2002:a05:600c:474b:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-47117877525mr210287255e9.15.1761332658488; 
 Fri, 24 Oct 2025 12:04:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf15416sm105328485e9.10.2025.10.24.12.04.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Oct 2025 12:04:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/27] hw/sysbus: Spring cleanups (part 1)
Date: Fri, 24 Oct 2025 21:03:47 +0200
Message-ID: <20251024190416.8803-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

- Constify SysBusDevice argument
- Add sysbus_has_pio() and sysbus_pio_get_address()
- Use proper SysBus accessors
- Include missing 'exec/cpu-common.h' and 'system/memory.h' headers

Philippe Mathieu-Daudé (27):
  hw/qdev: Have qdev_get_gpio_out_connector() take const DeviceState arg
  hw/sysbus: Have various helpers take a const SysBusDevice argument
  hw/sysbus: Use memory_region_name()
  hw/i386/microvm: Use proper SysBus accessors
  hw/timer/hpet: Use proper SysBus accessors
  hw/acpi/cxl: Use proper SysBus accessors
  hw/sysbus: Add sysbus_has_pio() and sysbus_pio_get_address()
  hw/pci-bridge/pci_expander_bridge: Use proper SysBus accessors
  hw/platform-bus: Include missing 'system/memory.h' header
  hw/block/pflash: Include missing 'system/memory.h' header
  hw/misc/unimp: Include missing 'system/memory.h' header
  hw/misc/empty_slot: Include missing 'system/memory.h' header
  hw/uefi: Include missing 'system/memory.h' header
  hw/usb/imx: Include missing 'system/memory.h' header
  hw/pci/pcihost: Include missing 'system/memory.h' header
  hw/scsi/esp: Include missing 'system/memory.h' header
  hw/avr: Include missing 'system/memory.h' header
  hw/input/lassi: Include missing 'system/memory.h' header
  hw/tricore: Include missing 'system/memory.h' header
  hw/int/loongarch: Include missing 'system/memory.h' header
  hw/rtc/m48t59: Include missing 'system/memory.h' header
  hw/rtc/sun: Include 'exec/cpu-common.h' and 'system/memory.h' headers
  hw/xilinx: Include 'exec/cpu-common.h' and 'system/memory.h' headers
  hw/mips: Include missing 'system/memory.h' header
  hw/sparc: Include missing 'system/memory.h' header
  hw/riscv: Include missing 'system/memory.h' header
  hw/rx: Include missing 'system/memory.h' header

 hw/rtc/m48t59-internal.h                  |  2 ++
 include/hw/char/avr_usart.h               |  1 +
 include/hw/char/cadence_uart.h            |  1 +
 include/hw/char/ibex_uart.h               |  1 +
 include/hw/char/renesas_sci.h             |  1 +
 include/hw/char/shakti_uart.h             |  1 +
 include/hw/char/sifive_uart.h             |  1 +
 include/hw/gpio/sifive_gpio.h             |  1 +
 include/hw/input/lasips2.h                |  1 +
 include/hw/intc/loongarch_dintc.h         |  2 +-
 include/hw/intc/loongarch_extioi_common.h |  1 +
 include/hw/intc/loongarch_pch_msi.h       |  1 +
 include/hw/intc/loongarch_pic_common.h    |  1 +
 include/hw/intc/loongson_ipi_common.h     |  2 ++
 include/hw/intc/riscv_aclint.h            |  1 +
 include/hw/intc/riscv_aplic.h             |  1 +
 include/hw/intc/riscv_imsic.h             |  1 +
 include/hw/intc/rx_icu.h                  |  1 +
 include/hw/intc/sifive_plic.h             |  1 +
 include/hw/misc/avr_power.h               |  1 +
 include/hw/misc/lasi.h                    |  1 +
 include/hw/misc/mchp_pfsoc_dmc.h          |  1 +
 include/hw/misc/mchp_pfsoc_ioscb.h        |  1 +
 include/hw/misc/mchp_pfsoc_sysreg.h       |  1 +
 include/hw/misc/mips_cmgcr.h              |  1 +
 include/hw/misc/mips_itu.h                |  1 +
 include/hw/misc/sifive_e_aon.h            |  1 +
 include/hw/misc/sifive_e_prci.h           |  1 +
 include/hw/misc/sifive_test.h             |  1 +
 include/hw/misc/sifive_u_otp.h            |  1 +
 include/hw/misc/sifive_u_prci.h           |  1 +
 include/hw/misc/unimp.h                   |  1 +
 include/hw/net/cadence_gem.h              |  1 +
 include/hw/pci/pci_host.h                 |  1 +
 include/hw/platform-bus.h                 |  1 +
 include/hw/qdev-core.h                    |  3 ++-
 include/hw/riscv/opentitan.h              |  1 +
 include/hw/riscv/shakti_c.h               |  1 +
 include/hw/riscv/sifive_e.h               |  1 +
 include/hw/riscv/xiangshan_kmh.h          |  1 +
 include/hw/rtc/goldfish_rtc.h             |  1 +
 include/hw/scsi/esp.h                     |  1 +
 include/hw/sparc/sparc32_dma.h            |  1 +
 include/hw/sparc/sun4m_iommu.h            |  1 +
 include/hw/sparc/sun4u_iommu.h            |  1 +
 include/hw/ssi/ibex_spi_host.h            |  1 +
 include/hw/ssi/sifive_spi.h               |  1 +
 include/hw/sysbus.h                       | 12 +++++++-----
 include/hw/timer/avr_timer16.h            |  1 +
 include/hw/timer/cadence_ttc.h            |  1 +
 include/hw/timer/ibex_timer.h             |  1 +
 include/hw/timer/renesas_cmt.h            |  1 +
 include/hw/timer/renesas_tmr.h            |  1 +
 include/hw/timer/sifive_pwm.h             |  1 +
 include/hw/tricore/tc27x_soc.h            |  1 +
 include/hw/tricore/tricore_testdevice.h   |  1 +
 include/hw/uefi/var-service.h             |  1 +
 include/hw/usb/imx-usb-phy.h              |  1 +
 hw/acpi/cxl.c                             |  2 +-
 hw/block/pflash_cfi01.c                   |  1 +
 hw/block/pflash_cfi02.c                   |  1 +
 hw/char/xilinx_uartlite.c                 |  2 ++
 hw/core/gpio.c                            |  3 ++-
 hw/core/sysbus.c                          | 23 +++++++++++++++++------
 hw/i386/microvm-dt.c                      |  6 ++++--
 hw/intc/xilinx_intc.c                     |  2 ++
 hw/misc/empty_slot.c                      |  1 +
 hw/net/xilinx_axienet.c                   |  2 ++
 hw/pci-bridge/pci_expander_bridge.c       | 12 ++++++------
 hw/rtc/sun4v-rtc.c                        |  2 ++
 hw/ssi/xilinx_spi.c                       |  2 ++
 hw/timer/hpet.c                           |  3 ++-
 hw/timer/xilinx_timer.c                   |  2 ++
 73 files changed, 114 insertions(+), 24 deletions(-)

-- 
2.51.0


