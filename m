Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FC11091913
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 19:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3JRM-0008UE-6n; Thu, 19 Mar 2026 15:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3IoV-000471-Rb
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:13:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1w3IoU-0000jc-1M
 for qemu-arm@nongnu.org; Thu, 19 Mar 2026 15:13:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso1274623f8f.2
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2026 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773947624; x=1774552424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ywZ1GmTJodY+SxToPZAaitU2YGMuOYeoq0joshXkXEs=;
 b=hCf4QdHXZtAbnunNT0jlr4mLFaR+wXp0J7D+KCOEn9U2GQro8Jf9fi1BdA/s1sHpOT
 oUSeSbkXfqsgw1wf+KV7O9KJj+tseypdSwr7J7aOe5WRQojyqTQ+kz5aFXDB3isq55Yj
 t52bayABGc6xwv7k30ywUUzBGoAzEnLu5uOKkBxbPhH2JuUxWwAE/TMRovB2fPLVfMEh
 NBeqD4boa/o5e3fjoQO6su5lVlXj2lxvSOcMU37QZ3WQEEUyjwPGRad1RO1BuNBE1tz4
 vz2fSxQDLR34Nko6jZHjGaO4/l3VewMmsGJ63QT+HXaNpbrUvsVWL/e1aTN1kwjGv8F/
 X8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773947624; x=1774552424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ywZ1GmTJodY+SxToPZAaitU2YGMuOYeoq0joshXkXEs=;
 b=gncfO8iv8dZaifflOGBndZy7cHbNqM/80Cz7AigzTi2DYyCTflJzmnT+h4jGGYBSGX
 Khc1kcdYdWcF5n7MwHdYBkMleGtGUIoZ+rMKhBC0YIZc4z9UQcWPda/5u9LGGQkIBdR3
 K6nALYYOeyqRT8eCKlie56mJYEUMtWzMVETzIjQEMkjtGllgdgeG4unJlA/I8u9OPs5H
 wuvTJo7V8x/gROB3cIWOAAdBSbzr5n40LSsuBAScKS5iekPUqBQNDmB76YOPHj4Lhjmk
 oEzm91NH1oArgLfVUMd+QVt7L0XsEvX9edOdPjwkWxadWH7snwIYsT+zNVLrPf9jkPQ6
 XwAg==
X-Gm-Message-State: AOJu0Yx3a/kkd3bB/Sr00AL5ygU3/4RgB/zHvhxVPDeLgfeiBUkDBRZn
 TZgfpi7EafbIcU2aTZgJ4FFJn4yRk3Utc1i5mX/vkOVotEYsesCJcYaJ
X-Gm-Gg: ATEYQzzupE7PKdX7wl0O5RrLkZlyQmC+CNgPS2EPuZMNdFYXiHZ1kQSu7JDPcdHwKOc
 Q0XtiL3WGrgBZgJGfUo/QhPu5H3WpSvcZNQOfc3KEt8SJbE4N+mKRhY3rBK4D/lGqt3pMCFS/Q6
 qEhXNMnfto0bgrXBWk6Cd687Sq9B5Pa0dGBt1sTNHrxiWwEOwGqOv/IuTpYUPZFsC/tdO3yJXke
 i5R/mFnBTlg1eEsFILYquizTDNx4Q0IhIiZfoedqmOTj1Jv3UhBqhPZT0ljyc+Q9b+VmOmfLJhp
 5r8kMsSPb964+jkq/X747DDFT4RsAynheWRn8UW0NoCZ39euetCyaGAf6qrtBSYtVH0fhM3V8Gm
 HstKfm11V5/gXYunFo410RMKiROkHcZrep495PjFy7M1BUEUs4TsS4ondMPHKiWaGINWWB5vHt3
 ZZ046GoQnmSEvN74nl/KLMfsTddQayqlWE6H+XrsB1IeSt0YS8j4lUdw==
X-Received: by 2002:a5d:5d13:0:b0:43b:5753:d380 with SMTP id
 ffacd0b85a97d-43b64244e46mr847244f8f.24.1773947623746; 
 Thu, 19 Mar 2026 12:13:43 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64714e2esm635921f8f.32.2026.03.19.12.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 12:13:43 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v2 0/7] hw/arm/sabrelite: Add FlexCAN support
Date: Thu, 19 Mar 2026 20:13:07 +0100
Message-ID: <cover.1773866323.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Mar 2026 15:53:55 -0400
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

The headers (struct FlexcanRegs and flexcan_regs.h macros) were copied
from the Linux kernel. Marc Kleine-Budde is the copyright holder. He
has been kindly asked to provide consent, to confirm his approval for
the inclusion of said header fragments into QEMU.

Changes from v1:
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
 hw/net/can/flexcan.c          | 1407 +++++++++++++++++++++++++++++++++
 hw/net/can/flexcan_regs.h     |  193 +++++
 hw/net/can/meson.build        |    1 +
 hw/net/can/trace-events       |   18 +
 include/hw/arm/fsl-imx6.h     |    6 +
 include/hw/misc/imx6_ccm.h    |    4 +
 include/hw/misc/imx_ccm.h     |    1 +
 include/hw/net/flexcan.h      |  142 ++++
 tests/qtest/flexcan-test.c    |  424 ++++++++++
 tests/qtest/meson.build       |    1 +
 19 files changed, 2350 insertions(+), 10 deletions(-)
 create mode 100644 hw/net/can/flexcan.c
 create mode 100644 hw/net/can/flexcan_regs.h
 create mode 100644 include/hw/net/flexcan.h
 create mode 100644 tests/qtest/flexcan-test.c

-- 
2.53.0


