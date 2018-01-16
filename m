Received: by 10.28.173.206 with SMTP id w197csp3376647wme;
        Mon, 15 Jan 2018 17:37:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCjFZBG9ltYqkJD4Fd9TgWmq++KeacqKF3cBq8cFEzSJuitKjhuv7uZAcnSsQC4N/g4DLh
X-Received: by 10.37.19.69 with SMTP id 66mr17316952ybt.292.1516066665293;
        Mon, 15 Jan 2018 17:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066665; cv=none;
        d=google.com; s=arc-20160816;
        b=K3wk/c112azdsA1d59/US8wtoThfym3Kt0ZNSRijVoO8YHAfumfLK7FmiJJxegny74
         3e45Qqxf1tcSO+xViCVoYVa8BG6GZB1HO+BW46hl9hoOYl1/vAv2+4XaBnqJGzsHhaXV
         2K/HDKukLgylrh/3yGBwhHkzS3jpg2tUU3b6AeyD0PXmFJSdFD6zD2ewZjEEkGjwCHNi
         xeIAtIpNIpGLSMlypg+Ei32Zhm0QlnWl+lx62nGbHC13EV/9HL2iz94lDeBmNQLYw7lO
         vnBWodQ1IAbwE/XduIJwsHFh23DcKlm2zD+dxvaKFCddu3d7t7sUbyNX6+EoqCxbeMPa
         ujkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=BqteKKVPLpffPDA0tBMXigNOzZ7a6Sr77+gevbdm0mc=;
        b=vBgcn9ZA7S4Hz0JVC+kqqjp4qZEVeXS61sdL8HAqdlk5bsQTtPTkWTdSh8IyOT4DnO
         RSqm1YyQckZZh0jynClxMLwuXYEe7q6ZBjjjt0Z5eDQpGcuMTTWxxkO2zl+h980or6xz
         aLPaJTcf2hJ8dZdWvvSv8PHow+bOWA7LqyqSZ3KNlDvA+FLyzfEdX2OsChfKIlROj6rO
         myan0+wEbzi/536pcgwEDeY5MRJJEWOh1GP6kppH9KMfVLUx/PIdoFDZjMdnb8G2Q0rp
         PCBgkO5vm1QVRz+SitDG2yH+KCCEkwEHJrPzIvA/qzGpzjrUHj3SA+M9aGdOERhI4hn0
         M/wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZl1UoK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12si232954ybh.155.2018.01.15.17.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:37:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZl1UoK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGC8-0005x6-Jl
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:37:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGBx-0005wQ-Iy
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGBu-0005AY-FJ
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:33 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:40375)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGBu-00059x-71; Mon, 15 Jan 2018 20:37:30 -0500
Received: by mail-pl0-x243.google.com with SMTP id 62so4935854pld.7;
	Mon, 15 Jan 2018 17:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqteKKVPLpffPDA0tBMXigNOzZ7a6Sr77+gevbdm0mc=;
	b=ZZl1UoK+fnxYua+ZEWpeTufQ66+UmET+RtLXFNN4ipRm1KS4xv12C/+dpdx4W5ZUmb
	y6kRqJ88nP72Ixe4oBGfsR8UCsYm4vCTmCoruFLj1l8bvwj7iC1b54QK1NnAey/1Qh0o
	bYQYEVpSoxROQvUiDmuaXSFyaJK/hy9x8KYRvuy4+x2RGJuQoiM904zhy/b3HsFIvHOV
	NpmIJ9ftw3s4xQ3ZKD3tx3fY0T03qfnhNCEfpaufT5EznTDw//wMeQ+7iH98dO/Shm/6
	/rOoRJOG7IkY/oMm+y2tGRtQdB2v/qtcjAQBWPW8hQPBzBEUn+DqYc4rr247VDhkuu0R
	zpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqteKKVPLpffPDA0tBMXigNOzZ7a6Sr77+gevbdm0mc=;
	b=IHf3ZWWULbdTMudnOgnTdjMlzuwryWCGit3w2EHAQe3+FOhnlcqi0gmwrd7BXYDYXn
	a4BsDx2p5y8KjSgQhnaNrEA+cAIcL6fg2ZNn1zRVh2sM6saC6QSgUiFNfwsdULDFusDj
	0NS7oSarYP62z2ZiLp9odBbFSJ+hj0+UkFv7aCV7/Zy9xJvm5p2wEJxkeOPd0bX/U4ZN
	iZAkgG7QkUSmz/e7LXUEvK3VqYHsOA/wAmNgk03IxOOnhPn5EbgqTizsu/2NDnA6hP7o
	wlTe911tGjrNEzWeCKwyJ+IdE0dy6U/h7bnzZ7+nhC1hPscwxxBRRDXIiYgOd3DyQStk
	Ae2Q==
X-Gm-Message-State: AKGB3mLVpEMzeuaS6DSvW9RbwI4B5tLf3IK1O3WLr3c0fPV3UyR0tpff
	UjVfKqw6oIhPh8JdmyxWF59kLeXf
X-Received: by 10.84.240.9 with SMTP id y9mr29678012plk.332.1516066648372;
	Mon, 15 Jan 2018 17:37:28 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:27 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:36:55 -0800
Message-Id: <20180116013709.13830-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v4 00/14] Initial i.MX7 support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ho3AOwm9cGq

Hi everyone,

This v4 of the patch series containing the work that I've done in
order to enable support for i.MX7 emulation in QEMU.

*NOTE*: Patches 1 and 2 are provided for the sake of completness and
	are going to have to be adapted once Philippe's SD changes
	land in master. As such, they are NOT ready to be
	accepted/merged.

As the one before last commit in the series states the supported i.MX7
features are:

    * up to 2 Cortex A9 cores (SMP works with PSCI)
    * A7 MPCORE (identical to A15 MPCORE)
    * 4 GPTs modules
    * 7 GPIO controllers
    * 2 IOMUXC controllers
    * 1 CCM module
    * 1 SVNS module
    * 1 SRC module
    * 1 GPCv2 controller
    * 4 eCSPI controllers
    * 4 I2C controllers
    * 7 i.MX UART controllers
    * 2 FlexCAN controllers
    * 2 Ethernet controllers (FEC)
    * 3 SD controllers (USDHC)
    * 4 WDT modules
    * 1 SDMA module
    * 1 GPR module
    * 2 USBMISC modules
    * 2 ADC modules
    * 1 PCIe controller
    * 3 USB controllers
    * 1 LCD controller
    * 1 ARMv7 DAP IP block

Feedback is welcome!

Changes since [v3]:

    - Changes to FEC were split into a separate set and merged to master

    - Patchest is rebased on latest master

    - Converted to use PSCI DT fixup code that is shared with virt
      platform (now relocated to live in arm/boot.c)

    - Large number of dummy block were converted to use
      create_unimplemented_device() as opposed to its own dedicated
      type

    - Incorporated varios small feedback items

    - Collected Reviewed-by tags from Peter

Changes since [v2]:

    - Added stubs for more blocks that were causing memory
      transactions when booting Linux guest as were revealed by
      additional testing of the patchest

    - Added proper USB emulation code, so now it should be possible to
      emulated guest's USB bus

Changes since [v1]:

    - Patchset no longer relies on "ignore_memory_transaction_failures = false"
      for its functionality

    - As a consequnce of implementing the above a number of patches
      implementing dummy IP block emulation as well as PCIe emulation
      patches that I alluded to in [v1] are now included in this patch
      series

    - "has_el3" property is no longer being set to "false" as a part
      of intialization of A7 CPU. I couldn't reproduce the issues that
      I thought I was having, so I just dropped that code.

    - A number of smaller feedback items from Peter and other has been
      incorporated into the patches.


Thanks,
Andrey Smirnov

[v3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg04236.html
[v2] https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg05516.html
[v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html

Andrey Smirnov (14):
  sdhci: Add i.MX specific subtype of SDHCI
  hw: i.MX: Convert i.MX6 to use TYPE_IMX_USDHC
  i.MX: Add code to emulate i.MX7 CCM, PMU and ANALOG IP blocks
  i.MX: Add code to emulate i.MX2 watchdog IP block
  i.MX: Add code to emulate i.MX7 SNVS IP-block
  i.MX: Add code to emulate GPCv2 IP block
  i.MX: Add i.MX7 GPT variant
  i.MX: Add implementation of i.MX7 GPR IP block
  pci: Add support for Designware IP block
  usb: Add basic code to emulate Chipidea USB IP
  ARM: Add basic code to emulate A7MPCore DAP block
  i.MX: Add i.MX7 SOC implementation.
  hw/arm: Move virt's PSCI DT fixup code to arm/boot.c
  Implement support for i.MX7 Sabre board

 default-configs/arm-softmmu.mak  |   3 +
 hw/arm/Makefile.objs             |   5 +-
 hw/arm/boot.c                    |  65 ++++
 hw/arm/coresight.c               | 120 ++++++++
 hw/arm/fsl-imx6.c                |   2 +-
 hw/arm/fsl-imx7.c                | 583 ++++++++++++++++++++++++++++++++++++
 hw/arm/mcimx7d-sabre.c           |  90 ++++++
 hw/arm/virt.c                    |  61 ----
 hw/intc/Makefile.objs            |   2 +-
 hw/intc/imx_gpcv2.c              | 125 ++++++++
 hw/misc/Makefile.objs            |   4 +
 hw/misc/imx2_wdt.c               |  89 ++++++
 hw/misc/imx7_ccm.c               | 277 ++++++++++++++++++
 hw/misc/imx7_gpr.c               | 119 ++++++++
 hw/misc/imx7_snvs.c              |  83 ++++++
 hw/pci-host/Makefile.objs        |   2 +
 hw/pci-host/designware.c         | 618 +++++++++++++++++++++++++++++++++++++++
 hw/sd/sdhci-internal.h           |  19 ++
 hw/sd/sdhci.c                    | 228 ++++++++++++++-
 hw/timer/imx_gpt.c               |  25 ++
 hw/usb/Makefile.objs             |   1 +
 hw/usb/chipidea.c                | 176 +++++++++++
 include/hw/arm/coresight.h       |  24 ++
 include/hw/arm/fsl-imx7.h        | 223 ++++++++++++++
 include/hw/intc/imx_gpcv2.h      |  22 ++
 include/hw/misc/imx2_wdt.h       |  33 +++
 include/hw/misc/imx7_ccm.h       | 139 +++++++++
 include/hw/misc/imx7_gpr.h       |  28 ++
 include/hw/misc/imx7_snvs.h      |  35 +++
 include/hw/pci-host/designware.h |  93 ++++++
 include/hw/pci/pci_ids.h         |   2 +
 include/hw/sd/sdhci.h            |  14 +
 include/hw/timer/imx_gpt.h       |   1 +
 include/hw/usb/chipidea.h        |  16 +
 34 files changed, 3261 insertions(+), 66 deletions(-)
 create mode 100644 hw/arm/coresight.c
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 hw/misc/imx7_gpr.c
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 hw/pci-host/designware.c
 create mode 100644 hw/usb/chipidea.c
 create mode 100644 include/hw/arm/coresight.h
 create mode 100644 include/hw/arm/fsl-imx7.h
 create mode 100644 include/hw/intc/imx_gpcv2.h
 create mode 100644 include/hw/misc/imx2_wdt.h
 create mode 100644 include/hw/misc/imx7_ccm.h
 create mode 100644 include/hw/misc/imx7_gpr.h
 create mode 100644 include/hw/misc/imx7_snvs.h
 create mode 100644 include/hw/pci-host/designware.h
 create mode 100644 include/hw/usb/chipidea.h

-- 
2.14.3

