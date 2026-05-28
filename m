Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B59CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 17:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSeMZ-0006XP-SY; Thu, 28 May 2026 13:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeML-0006TF-Ds
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wSeMJ-00046M-F4
 for qemu-arm@nongnu.org; Thu, 28 May 2026 13:17:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48e8132c6d0so82999435e9.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 10:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779988645; x=1780593445; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lEwSIvtM/DW6o/9k7MPGdac3VdkV9MgPLv8CbJiO3YY=;
 b=X1Q35wk9+7OMwOGut07tBaV+khAUyuqyBnUK2ZFpDppo7pLAnWPLkRaqNCteDl/nM2
 NG/6GlfwjGvtWQEHT6GufOSYrY82hlD3rgo8YVM49jW1B14KRPNVHx0HnzSDDFn6Apn5
 ErG40aR4o/9Auopd4iMShETC9u58WiSVgF9CY6pWW1F1JZf5VnDAd4PzRulw6eOavWM5
 zpAgSW2i+M/NIRtovf/x8tFr7xGvO8cSW+FZRtVKT3xmmbEOfxrK1O8Hdp87rogL5vQK
 yneGZ+nFc3Ylo6XlIcoJ9wQ9rTF4fdVc9QzYXpieoqGF6s804aQ+3v5cKUHbtRQ1aySt
 ehFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779988645; x=1780593445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lEwSIvtM/DW6o/9k7MPGdac3VdkV9MgPLv8CbJiO3YY=;
 b=Cek46/KXb2CItOaehQjFhxHexoDe+XNmW8wfuhrjVFrKK8l2MZKY7514ZHNrbctyBh
 3+aqJPjjRUGbPCxHdLsogpURlRvyD2WTpbkxIS3zCHLHihHuRWc0pe91CJ4ww0IqFUnU
 Fm9eyq2YqlljAcHeayvtUbjx2ZoionNQ8K0G49kkS0BkRebnTQlHQ8MNQDvCuG9II7fJ
 e/HdIt8iwkRVAdBTgj5kqEnWZ2UV0bF7xEchaAwCEpq8fjD6Xw60WbOAkUMhAYjZqkJB
 vvEcv+VCb5bBjpT3BfsBTS1/WoovP41+R1F7iROaIZFNuH5AjEmDKNOfdf09p9bzTX7o
 UwTA==
X-Gm-Message-State: AOJu0Yy31WpQN0CzhyDLqPMRPIlFJE44uehun3SrgJBTdl9Udrw+TWNz
 Bm7vHgt5B50A9mvLzeXtGsfrBjSAMQoBJmjlpPiDQ22kdatV5XxZbXNQ
X-Gm-Gg: Acq92OFeVERmbcsN/rBhTOHWkCHiugT+edPpO/s+gRaJX3WDXqCFa5jmXS/kCzPeUhL
 rKfyD+cAoJypOwl/Va8ps8h11Txxu+1xzWxyeclIfepcWn3a+uGT6STJW8LDF0YUe2m+U07kMWe
 lz8IW+qqrllfMvQBblP5/YenlpoDkHa6VfZEB2ra2/4jUcjshnT4kcZfHI2PmooXcEMRMjeMaZH
 Zh7Ygi4vE+FI9HrmQQw6CMs4Kpfcq7+FeqbF+HQNAfrYsh80EceKglg8IbHlMt/lyxKkId0WEUf
 epQI1AbFFRspED+B51Kixn76UXc5znk0B/9sNYWREDPks3gwArsKaON5SpRA8ElMNJjIbgNcoOz
 /8rsQexBLfqUM7TzuD1CmtpWLCIwfmTJdlOcv07qkcTwLibOryXlFYpQK9QJ4gWZVVkONMQmTF8
 V9Tob7G9z2MGz2TvNPqKd3ZriEKexMER4yh5HuSQrT4aOG7g8kGLTuz76qnW40Fh8c
X-Received: by 2002:a05:600c:a402:b0:48f:e6de:1cba with SMTP id
 5b1f17b1804b1-490426c5b3emr392563345e9.17.1779988645078; 
 Thu, 28 May 2026 10:17:25 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092968066sm53774085e9.15.2026.05.28.10.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 10:17:24 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v4 0/7] hw/arm/sabrelite: Add FlexCAN support
Date: Thu, 28 May 2026 19:17:10 +0200
Message-ID: <cover.1779986496.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x32a.google.com
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

This series adds emulation of the FlexCAN CAN controller, version 2,
found in NXP i.MX6 series SoCs. The controller is integrated into
fsl-imx6 and the Sabrelite ARM board.

The chip has two FlexCAN controllers, but the Linux Sabrelite
device tree enables only one by default. Linux kernel with both
controllers enabled has been tested to work properly (using a custom
device tree).
See docs/system/devices/can.rst for an example of QEMU command line
invocation.

More information about the implementation can be found in my bachelor
thesis [1].

Changes from v3:
- corrected attribution for definitions borrowed from the Linux kernel
- rebased onto latest master
- Link to v3: https://lore.kernel.org/qemu-devel/cover.1777571962.git.matyas.bobek@gmail.com/

Changes from v2 to v3:
- moved variable declarations to the top-of-the-block
- cleanup
- removed redundant license boilerplate
- rebased onto latest master
- Link to v2: https://lore.kernel.org/qemu-devel/cover.1773866323.git.matyas.bobek@gmail.com/

Changes from v1 to v2:
- removed DPRINTF (turned into traces or guest errors)
- removed gotos and unnecessary continues
- register memory region shortened to actual length w/o padding
- make flexcan_* fns private
- used DEVICE(s)->canonical_path instead of allocating new strings
- changed DEVICE_NATIVE_ENDIAN to DEVICE_LITTLE_ENDIAN
- removed ugly USE macro
- used enums instead of define sequences in flexcan.c
- fixed FlexCAN KConfig conf (fixes build on non-arm-softmmu)
- fixed style and other issues from Bernhard's review
- better wording in docs
- rebased onto latest master
- Link to v1: https://lore.kernel.org/qemu-devel/cover.1765826753.git.matyas.bobek@gmail.com

Thanks Bernhard Beschow for the review and his patience.
I borrowed some fixes from his flexcan branch at [2].

[1] http://dspace.cvut.cz/bitstream/handle/10467/122654/F3-BP-2025-Bobek-Matyas-BP_Bobek_FlexCAN_final_4.pdf
[2] https://github.com/shentok/qemu/tree/flexcan

Matyáš Bobek (7):
  hw/arm/sabrelite: Open code DEFINE_MACHINE_ARM
  hw/arm/sabrelite: Introduce class SabreliteMachineState
  hw/misc/imx6_ccm: Add PLL3 and CAN clock
  hw/net/can/flexcan: NXP FlexCAN core emulation
  hw/arm: Plug FlexCAN into FSL_IMX6 and Sabrelite
  tests: Add qtests for FlexCAN
  docs/arm/sabrelite: Mention FlexCAN support

 MAINTAINERS                   |    9 +
 docs/system/arm/sabrelite.rst |    1 +
 docs/system/devices/can.rst   |   24 +
 hw/arm/Kconfig                |    1 +
 hw/arm/fsl-imx6.c             |   29 +
 hw/arm/sabrelite.c            |   68 +-
 hw/misc/imx6_ccm.c            |   24 +
 hw/misc/trace-events          |    2 +
 hw/net/Kconfig                |    5 +
 hw/net/can/flexcan.c          | 1395 +++++++++++++++++++++++++++++++++
 hw/net/can/flexcan_regs.h     |  196 +++++
 hw/net/can/meson.build        |    1 +
 hw/net/can/trace-events       |   18 +
 include/hw/arm/fsl-imx6.h     |    6 +
 include/hw/misc/imx6_ccm.h    |    4 +
 include/hw/misc/imx_ccm.h     |    1 +
 include/hw/net/flexcan.h      |  144 ++++
 tests/qtest/flexcan-test.c    |  421 ++++++++++
 tests/qtest/meson.build       |    1 +
 19 files changed, 2340 insertions(+), 10 deletions(-)
 create mode 100644 hw/net/can/flexcan.c
 create mode 100644 hw/net/can/flexcan_regs.h
 create mode 100644 include/hw/net/flexcan.h
 create mode 100644 tests/qtest/flexcan-test.c

-- 
2.54.0


