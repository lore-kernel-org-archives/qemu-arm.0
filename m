Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA62BCCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 10:30:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIlcf-0008Ku-3F; Tue, 11 Nov 2025 05:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcH-0007Vi-J0
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:49 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1vIlcB-0000F8-0q
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 05:28:45 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b5a8184144dso527886166b.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762856918; x=1763461718; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5aPLj5bYoMuosO6hZB892xXH3RS2ipC25que2tpo1vI=;
 b=aNb/yyYnx6u9mQ6cTVDFnZXU1WYizxs82O2Q9VWq6gzQGTj8e3RfpGURREZ3kTm/xD
 3PqaatyFdLVsfKE0DTt+lfWOeg+2Nr2uYCiHoO/s0ImuoaWDWQy5uBKWl3CyRFMpFJ4v
 K/cJLRrfZwiRQky/9DZ6GI2aYnAMxfjaMsmt6pvNMfK87E44m7auhcrahke+zQ28KJ1S
 CA/5UbTlL6X4LkAmZvsGFKdojzXoOmSzd6Ja+je6NutIcTdGyTT8T/5r/Mtag7ElfdcI
 8iOqovnuw5N6nDcs+q1WE6xoZx3f+whhqlOBsuiCvU7ykl1nj/I4Yn3jRDrIgEAh+onW
 IYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762856918; x=1763461718;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5aPLj5bYoMuosO6hZB892xXH3RS2ipC25que2tpo1vI=;
 b=l8PIJwH8GVFfRszxOHoNFB1Q6pmn3G2kSzcqq2yAaHyRFJpEw1vMJhzc3khCbVnjcH
 74HAE/eECtQSS18G1zUBvoByhNFIpUuIqKoiT+PDBSPmnO4yj1tSUimKUW/i0nYuWyGt
 cYGvdjiTzJqNUJeTxO2lHSgxPg0m0yhRKGPEbh7XTmOoe4qENtK74k7gdczop03bwqGk
 +sotnJuGPNA3dSEKB6pcqHFXOyi92RHZ/42/IsYdjU7Qh5uEdaV/omDVAysfG856Mmeh
 PCdPL7ouEjrJaQHmJeHE1hvLvk/NUyQnM7MSP27k6msOAtNUO0ImZuEBPe3oL4IoSdKA
 AkcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb9nxTMV904/RKavzXKi8g3o9S4IZupke5BlGNGgfjtjHNKtL0KSjW0talSVGYE1Gehmf6ConZpQ==@nongnu.org
X-Gm-Message-State: AOJu0YwHUF1IOrImHELCqVhbhoy7rHmxPm0JUKtyM23DCiTVTW24IUEk
 iGHDv/dk1o+RGYTh31mmWWfZ2YiszNF5vPmBqfVu1/nCc34kQnyAls5X
X-Gm-Gg: ASbGncvu3Qdq9FMCqQqRbUjn0BSW0KXrtvL8aEu+0lVJDhjbOxeULlTY8pCxuFbT4y/
 Fh2v06bTc3SHiSGxy6bE0OASN/NGA0vAzS6n7r0z877ln7cH1FBFYU2nrqgo2Bs+Hqr31QwdE6M
 h6OawCCeLz9aogR965cPBbsHYA4yMK8EKFdDdP42ws7EpkjoWwghZrTPkMoGLHdO1K16NhDr6mI
 Ypv3OlsII89I0Dpgw2HMqIu8YFn2s/c6ugwzMhkEYtr1zJwcEQUnPFg8e8KyY3WF81vUqGXbElD
 qiMNlNR1waqnYAUU4n0tvFPxvJejGdTstrK/Zd1s34Sr7zNqkYMJCLz6uTtguM6YjMgkwMWd4nH
 XOhqzlUYr1CcKEdX1b64kG4cbt8SJvfl+lVepd5b51600hPG0gc2hfwMsPsmJ6PuSmHkgtnRdzM
 PokXaLBjR1pKVcskATOeIBPw==
X-Google-Smtp-Source: AGHT+IGMDXKjC6WykjK0RiPLlNBYBMn8MANxlmLnLRzIao003X/Lbl0L4O0oEip85q0tNUBz7eew1A==
X-Received: by 2002:a17:907:7fa0:b0:b72:91bc:9b35 with SMTP id
 a640c23a62f3a-b72e05215f5mr1157280166b.39.1762856917986; 
 Tue, 11 Nov 2025 02:28:37 -0800 (PST)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc12:ce00:ae91:a1ff:fe8b:15a7])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bdbd1ecfsm1290619366b.10.2025.11.11.02.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 02:28:37 -0800 (PST)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 00/15] hw/arm: add Beckhoff CX7200 board
Date: Tue, 11 Nov 2025 11:28:21 +0100
Message-ID: <20251111102836.212535-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

YannickV (15):
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
  tests/functional: Add a Beckhoff CX7200 test
  docs/system/arm: Add support for Beckhoff CX7200

 docs/system/arm/beckhoff-cx7200.rst          |  57 +++
 docs/system/target-arm.rst                   |   1 +
 hw/arm/Kconfig                               |  18 +
 hw/arm/beckhoff_CX7200.c                     | 443 +++++++++++++++++++
 hw/arm/meson.build                           |   1 +
 hw/block/m25p80.c                            |   3 +-
 hw/dma/xlnx-zynq-devcfg.c                    |  29 +-
 hw/misc/Kconfig                              |   6 +
 hw/misc/beckhoff_ccat.c                      | 338 ++++++++++++++
 hw/misc/meson.build                          |   2 +
 hw/misc/xlnx-zynq-ddrc.c                     | 413 +++++++++++++++++
 hw/misc/zynq_slcr.c                          |  31 ++
 hw/timer/a9gtimer.c                          |  26 +-
 hw/timer/arm_mptimer.c                       |  32 +-
 include/hw/misc/xlnx-zynq-ddrc.h             | 148 +++++++
 include/hw/timer/a9gtimer.h                  |   2 +
 include/hw/timer/arm_mptimer.h               |   4 +
 tests/functional/test_arm_beckhoff_cx7200.py |  19 +
 18 files changed, 1561 insertions(+), 12 deletions(-)
 create mode 100644 docs/system/arm/beckhoff-cx7200.rst
 create mode 100644 hw/arm/beckhoff_CX7200.c
 create mode 100644 hw/misc/beckhoff_ccat.c
 create mode 100644 hw/misc/xlnx-zynq-ddrc.c
 create mode 100644 include/hw/misc/xlnx-zynq-ddrc.h
 create mode 100644 tests/functional/test_arm_beckhoff_cx7200.py

-- 
2.47.3


