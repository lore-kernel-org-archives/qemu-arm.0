Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0301C982D9
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Sep 2026 10:12:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7VZf-0003HW-4M; Fri, 18 Sep 2026 06:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1x7VZb-0003H2-U7
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 06:12:05 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1x7VZZ-0007Z1-Qw
 for qemu-arm@nongnu.org; Fri, 18 Sep 2026 06:12:03 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912e64ccso4590485e9.0
 for <qemu-arm@nongnu.org>; Fri, 18 Sep 2026 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789726320; x=1790331120; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=hnKCbrC0Zs/mZbt9e5kbgGMShsQaKsoLEnuOqJTSAUA=;
 b=eR3dKhoHIPHKdZTGeyIsPXGuFz7UIR9y6KY5WUmO1mAfR3MsA3reqehOMVPCTH0nnZ
 ib8R51Kb9nZr+tuUOcGSv3mGAMZZ1xRRBIy82meT3+oIvh7ujV1e8bAasVkP0VGH5/Ha
 Xu0Z9NH1MXy9b5ELfFivwf4Hl1O6cM3Riphl9E4rKY5jS3ogXZ9+eIulsuH8N6wYR61A
 DZ/XYjMi1yYWEOUSD1l9GcajJk5+kTxkUdR1iJ7X5Cy2oFfQRmXWKtWngEwpyKJLl15v
 Lh0PIxggYhZnACISEDUzbXW6269RS9J9mWzCg2F6/NrSknv0rYlNIJRzuxmy6uZW/ZJX
 E/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789726320; x=1790331120;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=hnKCbrC0Zs/mZbt9e5kbgGMShsQaKsoLEnuOqJTSAUA=;
 b=u3ioo5kPKM98+66j8wH5IAGsc0CMyEcR3N4dL6qGb4U3H65I3Qj3zZ0kvPbhoCXqvv
 9NZb7IMrX0V4/KfwO20jt2M3E+rfyw8aaNGJFbZ7Hr3BhnE8NzeOEyWRFsktJ+N2zeQf
 VJX7FbPrl/k5rRA0AO8+88G0mQVli1L9HzI4XYtim1U3OyE2SLkiiTWBlSomWZBaGR4w
 SMkeaNV1v6h+ykLBrlBhx/p5mtA895ZcPCtj+LWkSGYKVfX8PWTLDq73Tdb89qwrWLK0
 X6zobQXzg9Q7kwt/DWirQrTGIyI3Ku8t5CQiTGDTeTY2AFVJ4VArXfv+qtGOetU0toTy
 j/7A==
X-Forwarded-Encrypted: i=1;
 AKwUvBxh0lQan9RNAz/8/8ALg/zvj05167IAxejct9+SXjFvNd8KEstCJkqTniAIf7wxNuwUTfAN/fVXJg==@nongnu.org
X-Gm-Message-State: AFuF++k8DVr7BBOmxU2VzFg4LQ6BqoAG30dC9vngA3/hX+llaSmwMhWS
 1d8GFRzv88V7uTSJ9G8bRO4Jb9H23CEPyHDPvAjdtBlEHXD8ZH4oFgNI
X-Gm-Gg: AYBFou28z11XZWXwLE6YN8pzZX4Y8sYEmbwItYPQusZFof4NeF3lmHblnTLuQdUzl8f
 ET+KWapOMJKyAUZ9fbq/E1eyLQHDzP5U0fvzBcue+ue+Y4htrLDDrtD7hTzJagiPFIGz8TwAMPH
 Q9IQpppdTab/JdCYTjKSJEkCpLH1w8YVPhZhye5BvEF0JObGSgrH3JJxyvGzk8Rnlbb5NsKKcyN
 RkLD9/p1m/QAovUnlEXwqRaqlkW/WTe8x+ZczTnZoGVoGUgSVxW4RR8lohzh4acUA5TqQOYsMB5
 9S4WVg3ZCyrj2fW5pEn8J3eO6C8ka6OQ3t/YmBhHZsmH3PACKJm9ddiTTmX1eUwC75cC95NrPYk
 zZZbO3Yvdau7mdhjmTAdkvNX9UObzYuqLjWiYYBzEX0hhtoKlnwZhgIhNDXChvGfV2rBbk+EN0F
 xarR+cch9nsmqYFgto0k+gB6wkCbbKVRIJjsuLTHLwqmNdKwFbPZZl6o0fXtV5Uz4ql5YZA+C6S
 LFoLQL1qnahY2EMlJ89SsEcM0HE846n
X-Received: by 2002:a05:600c:354e:b0:49f:bd3c:bc1d with SMTP id
 5b1f17b1804b1-49fc573a7famr22729335e9.24.1789726319860; 
 Fri, 18 Sep 2026 03:11:59 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc20:5e84:de9d:56c6:df83:7819])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd225898sm153886245e9.9.2026.09.18.03.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 03:11:59 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Corvin Koehne <C.Koehne@beckhoff.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yannick Vossen <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v8 0/7] hw/arm: add Beckhoff CX7200 board
Date: Fri, 18 Sep 2026 12:11:51 +0200
Message-ID: <20260918101158.42101-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

YannickV (7):
  hw/misc: Add Beckhoff CCAT device
  hw/arm/xilinx_zynq: Add flash type as machine class property
  hw/misc/zynq_slcr: Add CPU clock outputs and ratios
  hw/timer,cpu: Add Clock API support to A9MPCore timers
  hw/arm/xilinx_zynq: Make PS frequency configurable
  hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX7200
  docs/system/arm: Add support for Beckhoff CX7200

 MAINTAINERS                         |   9 +
 docs/system/arm/beckhoff-cx7200.rst |  68 ++++++
 docs/system/target-arm.rst          |   1 +
 hw/arm/Kconfig                      |   7 +
 hw/arm/beckhoff_CX7200.c            |  79 +++++++
 hw/arm/meson.build                  |   1 +
 hw/arm/xilinx_zynq.c                |  23 +-
 hw/cpu/a9mpcore.c                   |  12 +
 hw/misc/Kconfig                     |   2 +
 hw/misc/beckhoff_ccat.c             | 347 ++++++++++++++++++++++++++++
 hw/misc/meson.build                 |   1 +
 hw/misc/zynq_slcr.c                 |  37 +++
 hw/timer/a9gtimer.c                 |  42 +++-
 hw/timer/arm_mptimer.c              |  19 +-
 include/hw/arm/xilinx_zynq.h        |   9 +-
 include/hw/cpu/a9mpcore.h           |   1 +
 include/hw/timer/a9gtimer.h         |   1 +
 include/hw/timer/arm_mptimer.h      |   2 +
 18 files changed, 643 insertions(+), 18 deletions(-)
 create mode 100644 docs/system/arm/beckhoff-cx7200.rst
 create mode 100644 hw/arm/beckhoff_CX7200.c
 create mode 100644 hw/misc/beckhoff_ccat.c

-- 
2.47.3


