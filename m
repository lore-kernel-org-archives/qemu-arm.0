Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E63CD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 12:15:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ6EH-0008LW-91; Mon, 15 Jun 2026 08:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6EF-0008L8-FO
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:15:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <matyas.bobek@gmail.com>)
 id 1wZ6ED-0003SO-Br
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:15:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so24294115e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 05:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781525742; x=1782130542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=avWpqqLXhoPVsAmO/pwtPf7BlT9OOPa6h8N6xRx0cFs=;
 b=QRsXcB7ZtyI1gvpmujdSzlFGLZDU5BCYaQxN+AOyHzmHUkv5XMdS25MDk7C3v6cE3k
 muZ2aUCtD2w9m6856YsSRryCE7p0vJsytkp1IcmqEE4X/K5FZ+4pMJRa0WZV39jIwuhk
 TLdHQlAklZ5rOdkv1Vv/+Hck1x5jRZ3hB1dN/jtBSETFgI45XIgDHTwAH7AVFv1gvdJq
 JMnSKgjQ4FxbR5qziHR4ztW/sJlNTePN2gzbrmgjBsbd5WnuQPZF0gGmWUk1GKuy5jtF
 jxRoDdsoyTBHJEyKhCxRSsItOUEA2K03B99wIlZmtoEdt/LsBl1/ZTvOt46raVd2urPJ
 /cMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781525742; x=1782130542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avWpqqLXhoPVsAmO/pwtPf7BlT9OOPa6h8N6xRx0cFs=;
 b=UNFwxV0kksvB9miUFrCb9/nSuVmgNlsFlRgJr0M5elWEzpGkyDPlZAruQvQnoPR0eR
 32xYLpWIUTsXQpyA7UzTd/8DUdiaTEMtBJhRuAKFZfKXlfx+WxLYnbVDCukLOr0K1O61
 YANWLDH5FtLq+t2e6CljYU1HDhuIt0uXKgRCV6yB6zgWM/b9Lc2ekRBxo3g+kK5lRpyu
 /mX29NJr+aWNQIhzRdKnWvGWSREcGyzBaFjuWxlGIFJLeW6+vuby/UHqGCozjlsob3K7
 ATbhkjxYWptrZaFP8FLZjBelxvN30Z+Rp/14d/G2n5qJj+nzRg+NmG4Ueq22VUroadtE
 zK/Q==
X-Gm-Message-State: AOJu0YwGkC11zG3yp+/GLRzTZMbQsOsMyNCcO+H2HrLcbtyHV2kPxk2L
 zy70vD5nPIyIRMgZHg6KSWJ0b1Aa0Iq/v1sMcfSotzNlvo4V7agHyCbd
X-Gm-Gg: Acq92OFx+mMv2pUDuDcuKE85wLdzRLGwTo2AyHQsrAnd8hYeH6eZGUwHiLXf78ca2Dw
 w7VjIytqdgxeb805+dKPY0r4rUS3J8mg7TLahYUZGHV8I22HXkmySKR6lac2gXnCdPtEgjJhNMc
 9HkXVCY1bgjmONajxvN0U3K/I90cFmeNM9MZ9aLfi8NqUmWuyEuIFGDSrUIj3sawyKZndFcBD3h
 1NF/vAZpfL+BWZ/87agNN02uyuYa2tqylbCj8XCMhg2JPWCi1KHQtxacP+vwhy0u2b9pGsc8LaL
 zd6f6d1+7VCLHgXXkln6z0pOKXFJPL1pBVKGQ5JiF2faWi3AE1K5U4891awtueHooK8b49FX+4+
 JnbDhQYQC6TnHJKudXyebzbkxAFGBoFVEv5K1/zJfpJZ6aN7OwGzogu96JHZA3rYUB1zZEXzUhg
 m63wPwR5RUqceOy4lhh+YE5q8/VAcgzaII7/LH/XC/twGMnnzuEyjBi0S4yudvFx5I
X-Received: by 2002:a05:600c:a203:b0:490:af63:2cb1 with SMTP id
 5b1f17b1804b1-490ec49a025mr90442705e9.7.1781525741870; 
 Mon, 15 Jun 2026 05:15:41 -0700 (PDT)
Received: from acidburn.pod.cvut.cz (acidburn.pod.cvut.cz. [147.32.90.2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm338491345e9.0.2026.06.15.05.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 05:15:41 -0700 (PDT)
From: =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
To: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrey Volkov <andrey@volkov.fr>,
 =?UTF-8?q?Maty=C3=A1=C5=A1=20Bobek?= <matyas.bobek@gmail.com>
Subject: [PATCH v5 0/7] hw/arm/sabrelite: Add FlexCAN support
Date: Mon, 15 Jun 2026 14:15:00 +0200
Message-ID: <cover.1781111270.git.matyas.bobek@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=matyas.bobek@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Changes from v4:
- renamed can in fsl-imx6 to flexcan
- corrected attribution for definitions borrowed from the Linux kernel
- rebased onto latest master
- Link to v4: https://lore.kernel.org/qemu-devel/cover.1779986496.git.matyas.bobek@gmail.com/

Changes from v3 to v4:
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
 hw/net/can/flexcan_regs.h     |  197 +++++
 hw/net/can/meson.build        |    1 +
 hw/net/can/trace-events       |   18 +
 include/hw/arm/fsl-imx6.h     |    6 +
 include/hw/misc/imx6_ccm.h    |    4 +
 include/hw/misc/imx_ccm.h     |    1 +
 include/hw/net/flexcan.h      |  145 ++++
 tests/qtest/flexcan-test.c    |  421 ++++++++++
 tests/qtest/meson.build       |    1 +
 19 files changed, 2342 insertions(+), 10 deletions(-)
 create mode 100644 hw/net/can/flexcan.c
 create mode 100644 hw/net/can/flexcan_regs.h
 create mode 100644 include/hw/net/flexcan.h
 create mode 100644 tests/qtest/flexcan-test.c

-- 
2.54.0


