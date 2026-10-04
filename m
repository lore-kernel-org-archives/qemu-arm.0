Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEA7CA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJa-0006NG-0H; Sun, 04 Oct 2026 08:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJZ-0006Mv-0X
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:37 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJW-00075E-Eq
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:36 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ccf3ca626so6608885e9.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116853; x=1791721653; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7sakvyes7NT4OfipHDWVNzjXnqZB1BRxnrGq5lE8L+0=;
 b=e5sDrAoXQxM+rp2bX7NmZdkXs5o8vcMWhTDPir8g2FBG5r6SUalzareW9VYnZD58oi
 AiYpd2Q6EWwORUH7a9d2eeVkEl/RPqkyhlnV0xLMObKZ+8ycFgMv2NI2mjJXsNFc5Klx
 smL1jUxNy1Ilv78RoIQqPQVHdlb8x9UD8ZPt0AeeAXbKzCcy9wJzDkoRlwoECzgur44R
 8BvBF0PgQ6vVP5XpcI72HJLIKZiSJxPKZfTazIc8LOEa90NujswPRZPN6FHSnGYxKfBp
 /mJsWgwT1ATESvPmhwWJhqVyUUwHQfk1ZaseJhoO2h2Ffo12CgTE3m0uyOnXO10Qn5md
 LVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116853; x=1791721653;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7sakvyes7NT4OfipHDWVNzjXnqZB1BRxnrGq5lE8L+0=;
 b=hru/rqITMKb1x6yIU2vL+6ibQ9rm13JLqdEj8lXoAA+mdj8IDNDCoQRSk1hV2HHCLc
 zeNziHhsqEV5p3eU3x3ULnv2MdmxZc9toKmZz2W8lEyLDHXfeRjTGY1dBVxxz5jeHKre
 csGBiKAPBzty7biuv4+9nhxpKZrvNXk++3x2qebsp5DvlhFptiUZlQXpMn+Zpz5/ke3r
 PUVLWLJv4ty06lOEfcBwRuO+eWWje+LRubKAkfGPd7QEd5sk/OYWsJPGmMVHHZXqMdoc
 oRuVUXE4Pa05CPhPoGMRX9iTi8rRdE67yLvszm+zCkd2/8sVt/Wd38CWvx173/PzXQ5W
 pzzw==
X-Forwarded-Encrypted: i=1;
 AKwUvByQ3nIUWRh4FHsCgijeNyPtb9l14Kr/IwGl1lAzRe46RD/BsNBVtQaT76gt6FTagUBabunGPH9J5Q==@nongnu.org
X-Gm-Message-State: AFuF++k5cN1YQ+W8tDDLikcFPA67fOBIbn2BRTOqMYB9b/PZ9sgU72Ap
 M50gBPP8pZDgq698Nck8JXZjoe+jVcR0xmQsuGlkuATMDJpPb4C7XZDj
X-Gm-Gg: AYBFou0kGqiG4qqT/rcfvsF4Pr00onbXJTOHMCBBKKzZuj4O00tf0i5nbdHmO60hmq2
 2kfZtI7o3Ivk4LnbLP1JneNC2y2Xevl0EFZmU2+T2SN3Fy/HSM2kXAv1Dio0vIMbnoh57yAUOiy
 A/xJZpksAbRWbV+k56tFmp1c8kke+V20oUJxupX6CUwUKsMppQa6EZCD8RKO6pBqfH4HvlkMBSZ
 /DpgJYwA9yi1wcI8BEZXl7dxrAbqEKX9sY4uE11tnPabgUhj3BFV4Ac7FYau5nVAzloJYUHbXUz
 5noobsVXZi7tDboU9fcIiZxyPWsl1QqEwSySlqEnZE0oXYjB3057/iGoVNBeWa6hqDeodmpaem2
 ul6PEBoamG9W3xMOlUX/lWLpb4ps/YfOjO16SpMcjvVHvjglUc7bfqgdd8ms1lAvixXSN/oj59e
 x0UkJhZE7QcSiNcKF5sloi2xhzHycEnSspvVmcyVNUGWkMBm3MEiyG//i3Chz+m3/Jr9JdbnZoF
 Ju3kOFifJG7EhbiyWUb18huvTl3h6ParjC61w==
X-Received: by 2002:a05:600c:6992:b0:4a0:1a7f:2abf with SMTP id
 5b1f17b1804b1-4a02755fd98mr133380725e9.7.1791116852552; 
 Sun, 04 Oct 2026 05:27:32 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 00/30] i.MX fixes and cleanup
Date: Sun,  4 Oct 2026 14:26:16 +0200
Message-ID: <20261004122647.3913-1-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

This series fixes various issues in i.MX device emulation, cleans up i.MX=0D
Kconfig handling, improves tracing, and improves some code. Functional cons=
ole=0D
tests for the remaining i.MX boards are added where images are publicly=0D
available, except for imx6ul which is taken care of in a different series [=
1].=0D
Fixes which appear safe for backporting are cc'd to qemu-stable.=0D
=0D
The series is structured as follows: Patches 1-4 fix some issues and are=0D
mostly marked for backporting. Patch 3 is a follow-up on patches 1 and 2=0D
and should not be backported since it breaks migration.=0D
=0D
Patches 5-10 add and improve functional tests for i.MX devices. While at it=
,=0D
saner defaults for the amount of RAM and number of CPUs are established.=0D
=0D
Patches 11-15 turn the remaining i.MX SoC device models into SySBus devices=
=0D
which fixes their reset behavior.=0D
=0D
Patches 16-29 are Kconfig cleanups where CONFIG_IMX gets split into dedicat=
ed=0D
config items.=0D
=0D
The last commit just fixes some typos in the code.=0D
=0D
Changes in v2:=0D
* Remove patch adding `mc->ignore_memory_transaction_failures =3D true;` (P=
eter)=0D
* Rework wdt_imx2 patches (Peter)=0D
* Remove all but "hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from co=
nfig=0D
IMX" already queued by Phil. The preserved patch is required to remove all=
=0D
dependencies from CONFIG_IMX such that it can be removed.=0D
* Pick up R-b tags=0D
* Rebase onto latest master=0D
=0D
Testing done:=0D
* Run functional tests for sabrelite, imx8mp-evk, imx8mm-evk, mcimx7d-sabre=
.=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20261004090500.3082641-1-bin.meng@pr=
ocessmission.com/=0D
=0D
base-commit: d7a65d1793d691d356a56833620f7d1e6f5d653b=0D
=0D
Bernhard Beschow (30):=0D
  hw/watchdog/wdt_imx2: Fix handling of write-once WCR bits=0D
  hw/watchdog/wdt_imx2: Clear WDT lock on reset=0D
  hw/watchdog/wdt_imx2: Remove redundant attributes=0D
  hw/arm/imx8mm-evk: Fix reference count of SoC object=0D
  docs, tests/functional: Drop redundant CLI arguments in imx8m*-evk=0D
    invocations=0D
  hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by default=0D
  tests/functional/arm: Add console test for `sabrelite` machine=0D
  hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default=0D
  hw/arm/mcimx7d-sabre: Have 2 CPUs and 2 GiB of RAM by default=0D
  tests/functional/arm: Add console test for `mcimx7d-sabre` machine=0D
  hw/arm/fsl-imx25: Derive from TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx31: Derive from TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx6: Derive from TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx6ul: Derive from TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx7: Derive from TYPE_SYS_BUS_DEVICE=0D
  hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from config IMX=0D
  Kconfig: Extract config IMX_AVIC from config IMX=0D
  Kconfig: Extract config IMX_GPCV2 from config IMX=0D
  Kconfig: Extract config IMX_RNG from config IMX=0D
  Kconfig: Extract config FSL_IMX7_GPR from config IMX=0D
  Kconfig: Extract config FSL_IMX{6, 7}_SRC from config IMX=0D
  Kconfig: Extract config FSL_IMX7_SNVS from config IMX=0D
  Kconfig: Extract dedicated config FSL_IMXx_CCM from config IMX=0D
  Kconfig: Extract config IMX_GPT from config IMX=0D
  Kconfig: Extract config IMX_EPIT from config IMX=0D
  Kconfig: Extract config GPIO_IMX from config IMX=0D
  Kconfig: Extract config IMX_SPI from config IMX=0D
  Kconfig: Extract config IMX_SERIAL from config IMX=0D
  Kconfig: Remove config IMX=0D
  hw/arm/fsl-imx8m: Fix typo=0D
=0D
 MAINTAINERS                                 |  2 +=0D
 docs/system/arm/imx8m.rst                   |  2 +-=0D
 docs/system/arm/sabrelite.rst               |  4 +-=0D
 include/hw/arm/fsl-imx25.h                  |  5 +-=0D
 include/hw/arm/fsl-imx31.h                  |  5 +-=0D
 include/hw/arm/fsl-imx6.h                   |  5 +-=0D
 include/hw/arm/fsl-imx6ul.h                 |  5 +-=0D
 include/hw/arm/fsl-imx7.h                   |  5 +-=0D
 include/hw/arm/fsl-imx8mm.h                 |  4 +-=0D
 include/hw/arm/fsl-imx8mp.h                 |  4 +-=0D
 include/hw/watchdog/wdt_imx2.h              |  2 -=0D
 hw/arm/fsl-imx25.c                          |  7 +--=0D
 hw/arm/fsl-imx31.c                          |  7 +--=0D
 hw/arm/fsl-imx6.c                           |  4 +-=0D
 hw/arm/fsl-imx6ul.c                         |  4 +-=0D
 hw/arm/fsl-imx7.c                           |  5 +-=0D
 hw/arm/fsl-imx8mm.c                         |  2 +-=0D
 hw/arm/fsl-imx8mp.c                         |  2 +-=0D
 hw/arm/imx25_pdk.c                          |  2 +-=0D
 hw/arm/imx8mm-evk.c                         |  4 +-=0D
 hw/arm/kzm.c                                |  2 +-=0D
 hw/arm/mcimx6ul-evk.c                       |  3 +-=0D
 hw/arm/mcimx7d-sabre.c                      |  4 +-=0D
 hw/arm/sabrelite.c                          |  5 +-=0D
 hw/watchdog/wdt_imx2.c                      | 22 ++------=0D
 hw/arm/Kconfig                              | 56 ++++++++++++++++++---=0D
 hw/char/Kconfig                             |  3 ++=0D
 hw/char/meson.build                         |  2 +-=0D
 hw/gpio/Kconfig                             |  3 ++=0D
 hw/gpio/meson.build                         |  2 +-=0D
 hw/intc/Kconfig                             |  6 +++=0D
 hw/intc/meson.build                         |  3 +-=0D
 hw/misc/Kconfig                             | 41 +++++++++++++--=0D
 hw/misc/meson.build                         | 24 ++++-----=0D
 hw/net/Kconfig                              |  2 +-=0D
 hw/ssi/Kconfig                              |  4 ++=0D
 hw/ssi/meson.build                          |  2 +-=0D
 hw/timer/Kconfig                            | 10 ++++=0D
 hw/timer/meson.build                        |  4 +-=0D
 tests/functional/aarch64/test_imx8mm_evk.py |  4 +-=0D
 tests/functional/aarch64/test_imx8mp_evk.py |  4 +-=0D
 tests/functional/arm/meson.build            |  2 +=0D
 tests/functional/arm/test_mcimx7d_sabre.py  | 46 +++++++++++++++++=0D
 tests/functional/arm/test_sabrelite.py      | 46 +++++++++++++++++=0D
 44 files changed, 271 insertions(+), 109 deletions(-)=0D
 create mode 100755 tests/functional/arm/test_mcimx7d_sabre.py=0D
 create mode 100755 tests/functional/arm/test_sabrelite.py=0D
=0D
-- =0D
2.56.0=0D
=0D

