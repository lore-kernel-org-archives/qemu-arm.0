Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A636CCD18E
	for <qemu-arm@archiver.kernel.org>; Wed, 15 Oct 2025 09:20:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8xeH-0001st-MD; Wed, 15 Oct 2025 05:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xe4-0001nN-9X
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1v8xdi-0007Bb-Hp
 for qemu-arm@nongnu.org; Wed, 15 Oct 2025 05:18:05 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b3da3b34950so1029378266b.3
 for <qemu-arm@nongnu.org>; Wed, 15 Oct 2025 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519861; x=1761124661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GcrIHW/2gRFYm6+L50as/gXMubw/2sxT0paF0ebbfY0=;
 b=ZAMzyLxULdheAFmx18/XfdfLANTsK9dSLge3BZ6Or3p8/xuyC6zTiM/nEOTf+N43Ta
 B9jxvEnkuS3kG6nU61cad/E+m/zRqCkMv832aFZdPrHIJgwB1VjVMh9NkkingfiiXO/M
 b9az/bhFDNusWqRMMAMUDYE80tBBfmU07xiKENYW57ud36iD0IHs6dIGqZZn/8/LE/A3
 5nkdOPTe+uCiZMa1daZnkndkJSoJ3U1UQWjzfaOCbg/diYVd+s6igZQ0vzJ9vbKb5TAO
 7zBTHi5CUhAtcjgNkr5qmM5MVd90hpYGvLVatZEQJkTHHvufhxndddYGDXLMiySn1aiD
 0vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519861; x=1761124661;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GcrIHW/2gRFYm6+L50as/gXMubw/2sxT0paF0ebbfY0=;
 b=eGlFNnR14FsJf6/yatyebRw1XOt6IidmnTTi8vp9AitWQbA3yAfPQ1GlBDqAoTHiN+
 woh94zNGnGC8C6zhELCURExM6wTYnTFTJIIzV/lKwKFMv/D944eHYUBrRzhwEPqLnCG9
 DyJi8w4CgFumgXLIREDH9LQpRYCC2UZbX56PmwXYTqYHOMAQifmlBmo+lmYbhL+kGWHw
 sB735P3P/M5XqGonqK8pYQTULJat8Qm7J/iVLgvqzOhnqHV2kX5OABpsJ32/OHpasJeH
 06jSxLAbR73KMN3c6+Dm6eFPxZitKP4xSK8J3p/Sx8rM9d2Mdp1fSv99Gd/pMe1c1x2V
 Fgpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCj1BJmVo1cDppHJAy0wwGI2gAnPSeLr4QC6Ow7Z+TnaoeIYnZ5W99YMCsUwUCzs1g5UA9fGzwyA==@nongnu.org
X-Gm-Message-State: AOJu0Yxcb93rdzCz6+YAP3XDLK+N2kM6pVE8c1yEXOS3KBNkCqW4FLRn
 gOAJJITkKVam379SAAc6l4vPoBPnT5C30tQ+bvsodtSySkZ4U7J4GS5J
X-Gm-Gg: ASbGncvFPmlSipmRmOmmlRIhVWzoHako+ggOA6Aq+EbqZoWoV/6uNl7OLbxYE7TYLJh
 fFrHGS9fa5nDM2I2sZaKkK03leJjFEhrFYwAM1iHJQAvLHPuVqY5tV9fEp9iAaiuVBQ7sYMSGyM
 XYYMkz9Sh3GpWMEQMp0WnS5qnmc2kEadOKj6Kba9I7wVnGgYaKf+JJrFpF1TsIioSOnCDJ/v/fu
 hYx9CTFtmVN/uKSQzHhQI/4gG5YTbciBhCX+/EKLnG7Nk9lswVU5eN24dsMexos+sCJTVAZ/7cA
 RpRQazg1r8NU57vjrEKBFRh5mlA6EDw/vqwjUuTBPE69PMA3aCL/7k//hVNFlZZShVK0QKQUA83
 FokDGKeF08PShYwlsU+6d/Ibfwr83P4bz9/cawoqGM5fKSHCloMj6gZ/yJ0s4ms4o/bEsZxjE
X-Google-Smtp-Source: AGHT+IHIt7mRT2qcLLcw7Wnj87DvQIG2jnPJD4UP3CXfpRdpwIAniXW2GjRTNPQz57Vhf8p2DTZVEg==
X-Received: by 2002:a17:907:948f:b0:b40:e7ee:b5ec with SMTP id
 a640c23a62f3a-b50ac6c92d4mr2796147566b.59.1760519861054; 
 Wed, 15 Oct 2025 02:17:41 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cb9e7a23dsm182069966b.23.2025.10.15.02.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 02:17:40 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>
Subject: [PATCH v3 00/14] hw/arm: add Beckhoff CX7200 board
Date: Wed, 15 Oct 2025 11:17:15 +0200
Message-ID: <20251015091729.33761-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Corvin Köhne <c.koehne@beckhoff.com>

Hi,

Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
platform. This commit series adds the Beckhoff CX7200 as new board variant to
QEMU.

The emulation is able to successfully boot an CX7200 image. The image includes
some self tests executed on every boot. Only the cache self test fails due to
QEMU emulating the cache as always being coherent. The self tests include f.e.:

* Network
* Flash
* CCAT DMA + EEPROM [1]
* TwinCAT (Beckhoff's automation control software [2])

[1] https://github.com/beckhoff/ccat
[2] https://www.beckhoff.com/en-us/products/automation/

YannickV (14):
  hw/timer: Make frequency configurable
  hw/timer: Make PERIPHCLK divider configurable
  hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
  hw/arm/zynq-devcfg: Prevent unintended unlock during initialization
  hw/dma/zynq: Ensure PCFG_DONE bit remains set to indicate PL is in
    user mode
  hw/dma/zynq-devcfg: Simulate dummy PL reset
  hw/dma/zynq-devcfg: Indicate power-up status of PL
  hw/dma/zynq-devcfg: Fix register memory
  hw/misc: Add dummy ZYNQ DDR controller
  hw/misc/zynq_slcr: Add logic for DCI configuration
  hw/misc: Add Beckhoff CCAT device
  hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
  hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX7200
  docs/system/arm: Add support for Beckhoff CX7200

 docs/system/arm/beckhoff-cx7200.rst |  57 ++++
 docs/system/target-arm.rst          |   1 +
 hw/arm/Kconfig                      |  18 ++
 hw/arm/beckhoff_CX7200.c            | 443 ++++++++++++++++++++++++++++
 hw/arm/meson.build                  |   1 +
 hw/block/m25p80.c                   |   3 +-
 hw/dma/xlnx-zynq-devcfg.c           |  29 +-
 hw/misc/Kconfig                     |   6 +
 hw/misc/beckhoff_ccat.c             | 338 +++++++++++++++++++++
 hw/misc/meson.build                 |   2 +
 hw/misc/xlnx-zynq-ddrc.c            | 413 ++++++++++++++++++++++++++
 hw/misc/zynq_slcr.c                 |  31 ++
 hw/timer/a9gtimer.c                 |  26 +-
 hw/timer/arm_mptimer.c              |  32 +-
 include/hw/misc/xlnx-zynq-ddrc.h    | 148 ++++++++++
 include/hw/timer/a9gtimer.h         |   2 +
 include/hw/timer/arm_mptimer.h      |   4 +
 17 files changed, 1542 insertions(+), 12 deletions(-)
 create mode 100644 docs/system/arm/beckhoff-cx7200.rst
 create mode 100644 hw/arm/beckhoff_CX7200.c
 create mode 100644 hw/misc/beckhoff_ccat.c
 create mode 100644 hw/misc/xlnx-zynq-ddrc.c
 create mode 100644 include/hw/misc/xlnx-zynq-ddrc.h

-- 
2.47.3


