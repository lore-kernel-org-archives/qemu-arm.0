Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F059C982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrX-0006CL-6r; Mon, 21 Sep 2026 17:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrG-000652-4f
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:32 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrE-0008Vl-5K
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:29 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so26349945e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027247; x=1790632047; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=+IwVAR5hQk41iaSDqqRVV9sGGspFHtjxv/N5uIj75rI=;
 b=GkScrwPCV2wxolVL1gz66ZH3Jb5qmavZ8JebnSMBxs2qwitmx0oc90wBR5hd4/UIT5
 IDZyzwOg5irfvaEmRbEsWDOnGNHGzqBYYIXH3jSulMhM9gSl9rFHH03UGze/6OvqBYf+
 fNcw02HuUFuVOgiix4/CiuAfH4MYkbga77dIW31PSkYjw8kvP/yekA9jz3f/wYpFdIlr
 A9LAINY10zinnGp9zRxHA9twX/nGKvIE0xXfoyzpscZM3D+51EAO/40xuYVlqUNBq37h
 Em5SFiuKBIHltZVx15amO+w6qHqEUutbgaaUQCEaVKzhxGCkOaF1Zvf9cHljGK82wku8
 xlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027247; x=1790632047;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=+IwVAR5hQk41iaSDqqRVV9sGGspFHtjxv/N5uIj75rI=;
 b=PBC3dJmsziwslpr1XMiDsrDy6BFJfaDTIymmyx3TQCxYyb0e2NITDQZ1upgtAq9BFv
 s6ZJ8MnPvSvfcSg9lkwpZyW1Jr069o0hXP3Ro0UY3UZa3CPKtmPun7EWbWNCc712jL9B
 jD6kMdsKfGuBddYBshQZZ1HCvsR8eati5qJ/z62zA+9sGZ0t3VWGPa78nAfhA/8u7qHL
 vAngk9vAuXLmMupPPvKbWiI3pYCcLp263hrzZVra2AbhD0X+RRDmp6LbUoWUVTp7ansB
 Oo5vUtHnqZdsZunJ//udDHOD3VG6/1/drT29CXyiUbzfsUN7q/QqC21lkiJwk3PTNa2j
 WBVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxSCg6cHFW/l9OV/fi+JN02F9iHGPpGdIwkFFmr0D7V7gUKihqa9KPv26/SN8nx/ACS0FjGNH3XfQ==@nongnu.org
X-Gm-Message-State: AFuF++n8V5YQT79LZme3sohevksd1TGiRmeL1Ep4GilqbghDO16M9QYO
 uyI684yEiJ6YkxFt+FFXBKorKYQ1EBrXkddI96SFWjYV/PCp8aqzDglE
X-Gm-Gg: AYBFou06c/q1TqaYjHXjPVRCs1ozdlQWWaey9CTn1LeFCPoA1odl3dYFhKDiTeNMe/G
 6KQ+cXvSG1IKl9/0iDf12B0jFYnEvda/BmQdP8o1Ju0kFfQDcnW5bcYKuGnoyJoUrely8YQuOxu
 vel8s+WIPreoS4ms1tfQdGbkwCPmumBIwnqicLmzzTrYELyN5lgl9pzqIQ2I69K39V+Wl3lWt3m
 aGjQkIgIo8xkas8zKdCHQEVOiq+d6fotNDVBVxDtGe7OI2ysy2x/05u2SX1UNWDadZ67bT/Zj3I
 fim2nnO3TXvbkc9D8+lmBaGD28vI96bn9fD3QK6l7BxG1noPKYer3Xd6TNsE78mp3ktycL4bjd1
 UsoWBuNvwGWAmfLQiJruBl6rqk4wg6qX6kvHGT7cKAnv6cQS8VpGipNr6KXcRzNh0xss2NJbsZo
 S5SUqVG9/GvswI65zF2B0oX+YWMapPXaEhSG7Sh65xjk4RI6NhBRegaJzoK/n5HdQu48zzZn0Lb
 4HwmvLbVkjiLmpONokCNU/cMCKuBaNxzrFgmIUaNC7J3ZmGnj3uIh+wkUssPfRx2B1i8GEbbwm3
 A08=
X-Received: by 2002:a05:600c:8b8b:b0:49c:fc6e:a3dc with SMTP id
 5b1f17b1804b1-49fc584fd80mr155526355e9.27.1790027246403; 
 Mon, 21 Sep 2026 14:47:26 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 00/42] i.MX fixes and cleanup
Date: Mon, 21 Sep 2026 23:46:28 +0200
Message-ID: <20260921214710.29422-1-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
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

This series fixes various issues in i.MX device emulation, cleans up i.MX
Kconfig handling, improves tracing, and improves some code. Functional console
tests for the remaining i.MX boards are added where images are publicly
available, except for imx6ul which is taken care of in a different series [1].
Fixes which appear safe for backporting are cc'd to qemu-stable.

The series is structured as follows: Patches 1-4 fix some issues and are
mostly marked for backporting. Patch 2 is a follow-up on patch 1 which allows
patch 1 to be backported while patch 2 shouldn't because it breaks migration.

Patches 5-10 add and improve functional tests for i.MX devices. While at it,
saner defaults for the amount of RAM and number of CPUs are established.

Patches 11-15 turn the remaining i.MX SoC device models into SySBus devices
which fixes their reset behavior.

Patches 16 and 17 are QOM fixes inspired by Phil's comment during the FlexCAN
series.

Patches 18-33 are Kconfig cleanups where the majority is about splitting
CONFIG_IMX into dedicated config items.

The remainder is cosmetics and adding a QOM path to some i.MX trace events.

Testing done:
* Run functional tests for sabrelite, imx8mp-evk, imx8mm-evk, mcimx7d-sabre.

[1]
https://lore.kernel.org/qemu-devel/20260904161438.3838261-1-bin.
meng@processmission.com/

Bernhard Beschow (42):
  hw/watchdog/wdt_imx2: Fix handling of write-once WCR bits
  hw/watchdog/wdt_imx2: Remove unused attributes
  hw/arm/imx8mm-evk: Fix reference count of SoC object
  hw/arm/mcimx7d-sabre: Ignore memory transaction failures
  docs, tests/functional: Drop redundant CLI arguments in imx8m*-evk
    invocations
  hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by default
  tests/functional/arm: Add console test for `sabrelite` machine
  hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default
  hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM by default
  tests/functional/arm: Add console test for `mcimx7d-sabre` machine
  hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE
  hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE
  hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE
  hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE
  hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE
  hw/timer/imx_gpt: Wire clock control module via link property
  hw/timer/imx_epit: Wire clock control module via link property
  hw/arm/Kconfig: Select missing UNIMP in config FSL_IMX8MM
  hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX
  Kconfig: Extract config IMX_AVIC from config IMX
  Kconfig: Extract config IMX_GPCV2 from config IMX
  Kconfig: Extract config IMX_RNG from config IMX
  Kconfig: Extract config FSL_IMX7_GPR from config IMX
  Kconfig: Extract config FSL_IMX{6,7}_SRC from config IMX
  Kconfig: Extract config FSL_IMX7_SNVS from config IMX
  Kconfig: Extract dedicated config FSL_IMXx_CCM from config IMX
  Kconfig: Extract config IMX_GPT from config IMX
  Kconfig: Extract config IMX_EPIT from config IMX
  Kconfig: Extract config GPIO_IMX from config IMX
  Kconfig: Extract config IMX_SPI from config IMX
  Kconfig: Extract config IMX_SERIAL from config IMX
  Kconfig: Remove config IMX
  hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
  hw/arm/fsl-imx8m: Fix typo
  hw/misc/imx6_src: Avoid casting from void *
  hw/char/imx_serial: Avoid casting from void *
  hw/intc/imx_avic: Avoid casting from void *
  hw/misc/imx*_ccm: Avoid casting from void *
  hw/usb/imx-usb-phy: Avoid casting from void *
  hw/net/imx_fec: Trace with QOM path where easily possible
  hw/net/lan9118_phy: Trace with QOM path
  hw/watchdog/wdt_imx2: Trace with QOM path

 MAINTAINERS                                 |  2 +
 docs/system/arm/imx8m.rst                   |  2 +-
 docs/system/arm/sabrelite.rst               |  4 +-
 include/hw/arm/fsl-imx25.h                  |  5 +-
 include/hw/arm/fsl-imx31.h                  |  5 +-
 include/hw/arm/fsl-imx6.h                   |  5 +-
 include/hw/arm/fsl-imx6ul.h                 |  5 +-
 include/hw/arm/fsl-imx7.h                   |  5 +-
 include/hw/arm/fsl-imx8mm.h                 |  4 +-
 include/hw/arm/fsl-imx8mp.h                 |  4 +-
 include/hw/watchdog/wdt_imx2.h              |  2 -
 hw/arm/fsl-imx25.c                          | 13 ++---
 hw/arm/fsl-imx31.c                          | 13 ++---
 hw/arm/fsl-imx6.c                           | 10 ++--
 hw/arm/fsl-imx6ul.c                         | 10 ++--
 hw/arm/fsl-imx7.c                           |  8 ++-
 hw/arm/fsl-imx8mm.c                         |  5 +-
 hw/arm/fsl-imx8mp.c                         |  5 +-
 hw/arm/imx25_pdk.c                          |  2 +-
 hw/arm/imx8mm-evk.c                         |  4 +-
 hw/arm/kzm.c                                |  2 +-
 hw/arm/mcimx6ul-evk.c                       |  3 +-
 hw/arm/mcimx7d-sabre.c                      |  5 +-
 hw/arm/sabrelite.c                          |  5 +-
 hw/char/imx_serial.c                        | 10 ++--
 hw/intc/imx_avic.c                          |  6 +--
 hw/misc/imx25_ccm.c                         |  4 +-
 hw/misc/imx31_ccm.c                         |  4 +-
 hw/misc/imx6_ccm.c                          |  8 +--
 hw/misc/imx6_src.c                          |  4 +-
 hw/misc/imx6ul_ccm.c                        |  8 +--
 hw/misc/imx7_src.c                          |  4 +-
 hw/net/imx_fec.c                            | 28 +++++-----
 hw/net/lan9118_phy.c                        | 10 ++--
 hw/timer/imx_epit.c                         | 14 +++++
 hw/timer/imx_gpt.c                          | 14 +++++
 hw/usb/imx-usb-phy.c                        |  4 +-
 hw/watchdog/wdt_imx2.c                      | 30 +++--------
 hw/arm/Kconfig                              | 57 ++++++++++++++++++---
 hw/char/Kconfig                             |  3 ++
 hw/char/meson.build                         |  2 +-
 hw/gpio/Kconfig                             |  3 ++
 hw/gpio/meson.build                         |  2 +-
 hw/intc/Kconfig                             |  6 +++
 hw/intc/meson.build                         |  3 +-
 hw/misc/Kconfig                             | 41 +++++++++++++--
 hw/misc/meson.build                         | 24 ++++-----
 hw/net/Kconfig                              |  2 +-
 hw/net/trace-events                         | 33 ++++++------
 hw/ssi/Kconfig                              |  4 ++
 hw/ssi/meson.build                          |  2 +-
 hw/timer/Kconfig                            | 10 ++++
 hw/timer/meson.build                        |  4 +-
 hw/vmapple/Kconfig                          |  1 -
 hw/watchdog/trace-events                    |  8 +--
 tests/functional/aarch64/test_imx8mm_evk.py |  4 +-
 tests/functional/aarch64/test_imx8mp_evk.py |  4 +-
 tests/functional/arm/meson.build            |  2 +
 tests/functional/arm/test_mcimx7d_sabre.py  | 46 +++++++++++++++++
 tests/functional/arm/test_sabrelite.py      | 46 +++++++++++++++++
 60 files changed, 393 insertions(+), 190 deletions(-)
 create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py
 create mode 100755 tests/functional/arm/test_sabrelite.py

-- 
2.55.0


