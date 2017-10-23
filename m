Received: by 10.223.161.27 with SMTP id o27csp229635wro;
        Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
X-Received: by 10.37.161.103 with SMTP id z94mr8639000ybh.126.1508789496860;
        Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508789496; cv=none;
        d=google.com; s=arc-20160816;
        b=gVgkv8Lb2x3q3kTmx/+9EFadmoh1iOIHk7TKgDesqdY0ayYg+uAodbWf3bRcoSYgKF
         53hVC4krsDfRgoEklEfUxTcPNqunVnUBit7xdOZjSPfNsT9AUNro803hLHIMdy+I5Uqj
         NuBp69MlUqMtlEZs0zFKr1+6CCJDLiXlM+ImWT3bZ+0AkS7O6iYMlZyJdRKafgLhkEj/
         yfFQmd86B6bgCsPxqwzm2vYX5NT+Zx4L/oYXXvGLNAQDoFmKNtqw3tR4+SN/1LP1bl0v
         horSEBhbXuOyUqARQZNnYCnZvCOWYXDCrV6ASmY6G6bZ+75tdnnqYnrGstz5uFbD97K7
         XpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=iRleB96N8sQ6lSLAiRMEVq6u/8kfNPuPSUi8eNpkLDk=;
        b=Gpo9l2aBWmwJQJkoSeEalBRJnU3vkcmIGccJYY6N725DeWr6yOSnPpsqdyGDOJFtQW
         U4O9aSaGJVEZjBVJtkY0mP1hjtwRzdDqtoVDL7cJcMwhy/8NAozbtXyQtcenmCvJClEq
         +7kxLaDzqIvpyQNHuHBnd3HJznYjLpmmoK2p7v5Mx9hC0F6DbPGjCKeYeHNAszBE3pww
         vlz+PFF6YaM/fKe208KY2mkvlRm5pWnqfqN4OVM0of+e7U/HXKxm9xChbWh7KRUoH6pw
         LbZ3vEfp7TfokBe0PqFdm4itinh+5sTslBoc1OHaj4oDlMgLUxOW6xehazMp5L8nlyTK
         ujvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BLcmx1e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si875552ybm.452.2017.10.23.13.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BLcmx1e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6j4S-00007s-87
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:11:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4B-00007K-VV
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j48-0002Pf-No
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:19 -0400
Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235]:48570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j48-0002PK-FT; Mon, 23 Oct 2017 16:11:16 -0400
Received: by mail-pg0-x235.google.com with SMTP id v78so12627350pgb.5;
	Mon, 23 Oct 2017 13:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iRleB96N8sQ6lSLAiRMEVq6u/8kfNPuPSUi8eNpkLDk=;
	b=BLcmx1e9qNLYHZE07oCtjL6XWuHye8DaoKQ6l5ldnfSs1EJkU4q1ksKT3/GFZZcy+3
	ymwgCQejreyMOwLJlXejkCf6MoS8mIeuoOp6wNpmzCZfQRYtL3aCzhHKLSxXuOTgSF+l
	ktwpYXQyuTXtvXn2E8cgNHQpC0XhzkfsrB8vv96A+JushjyKJwyuNwPBoE/c2jm8Lhki
	mPVKi+flShyoor2TGOoncoOP8qNm1Wq57rGD4XJX2DI8Ki17jsDbKPJmbhx5gtd/86RS
	F/ae6AYqlZU8NaPV+77Q0cKrMaRaFuQBPSlGI9uFOiZ8Z0Krdoa5PaVuZuslF83sdw4i
	eChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iRleB96N8sQ6lSLAiRMEVq6u/8kfNPuPSUi8eNpkLDk=;
	b=Wuv9Vs8Ovd3wxYV+zfYwS6G/F5le7GDlLxZZJYSVJGTkawGkaonRrDT89a8bTnM3dI
	Yv8Z90o+BjvxP32y+fmw2U6AbtJ2Ctnjnq44X4TY3AdrttRwlXRBF0HpOCOBHdkR5r58
	8RvZYreFfoAjx0zpVZx95itSoJIUodPFg6kd7SfzoQUFLkrRhApbZJlsS7vA2IvGP+Mp
	7cvCLc/MfXIkpmHR6HWmE6/zOb+CTpGS+Dd4scQZggr8qigQkc1Q3MjaBLrSxtHMP19e
	uCUpe5nY3gwJ3mwvpL2IKAziHHNrucULMRWZJ10wW0m1eId8nRzRIjCsWvWdiSOggKCq
	3Mxw==
X-Gm-Message-State: AMCzsaUNyEzpuQumlXF7bEb+DFU3m2XGZo+2sKtBSjsuXmVIgSejpmT2
	sv4TRrOZhdH9P0WppNVS2NE8iC1b
X-Google-Smtp-Source: ABhQp+SYBGgXV7odzb5R3S+mI/KRrgBDEphKZO9H0OMBLQmfvdnoo8bs8nP171QoGgYiheSE4g9UFA==
X-Received: by 10.84.177.36 with SMTP id w33mr11319380plb.215.1508789474679;
	Mon, 23 Oct 2017 13:11:14 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:13 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:28 -0700
Message-Id: <20171023201055.21973-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::235
Subject: [Qemu-arm] [PATCH v2 00/27] Initial i.MX7 support
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
X-TUID: ZVyvXH9qWZeU

Hi everyone,

This v2 of the patch series containing the work that I've done in
order to enable support for i.MX7 emulation in QEMU.

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

Feedback is welcome!

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


Peter, I didn't hear anything from you about the code of
mcimx7d_add_psci_node(), as discussed here:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg486874.html

so I kept the original code intact. As I mentioned before, my goal was
to be able to boot into vanilla Linux kerenel and have working SMP
without needing to use a PSCI implementing bootloader. If that is
something that new board code shouldn't do, please let me know.

Thanks,
Andrey Smirnov

[v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html

P.S.: I don't know the best way to specify mailing list message
archives, so if I did it wrong please let me know.

Andrey Smirnov (27):
  imx_fec: Do not link to netdev
  imx_fec: Refactor imx_eth_enable_rx()
  imx_fec: Change queue flushing heuristics
  imx_fec: Use ENET_FTRL to determine truncation length
  imx_fec: Use MIN instead of explicit ternary operator
  imx_fec: Emulate SHIFT16 in ENETx_RACC
  imx_fec: Add support for multiple Tx DMA rings
  imx_fec: Use correct length for packet size
  imx_fec: Fix a typo in imx_enet_receive()
  imx_fec: Reserve full 4K page for the register file
  sdhci: Add i.MX specific subtype of SDHCI
  sdhci: Implement write method of ACMD12ERRSTS register
  i.MX: Add code to emulate i.MX7 CCM, PMU and ANALOG IP blocks
  i.MX: Add code to emulate i.MX2 watchdog IP block
  i.MX: Add code to emulate i.MX7 SNVS IP-block
  i.MX: Add code to emulate GPCv2 IP block
  i.MX: Add code to emulate i.MX7 IOMUXC IP block
  i.MX: Add i.MX7 GPT variant
  i.MX: Add code to emulate SDMA IP block
  i.MX: Add code to emulate FlexCAN IP block
  i.MX: Add implementation of i.MX7 GPR IP block
  pci: Add support for Designware IP block
  i.MX: Add code to emulate i.MX7 USBMISC IP block
  i.MX: Add code to emulate i.MX7 ADC IP block
  i.MX: Add code to emulate i.MX7 SRC IP-block
  i.MX: Add i.MX7 SOC implementation.
  Implement support for i.MX7 Sabre board

 default-configs/arm-softmmu.mak  |   3 +
 hw/arm/Makefile.objs             |   2 +
 hw/arm/fsl-imx6.c                |   1 +
 hw/arm/fsl-imx7.c                | 596 +++++++++++++++++++++++++++++++++++++
 hw/arm/mcimx7d-sabre.c           | 101 +++++++
 hw/dma/Makefile.objs             |   1 +
 hw/dma/imx_sdma.c                |  99 +++++++
 hw/intc/Makefile.objs            |   2 +-
 hw/intc/imx_gpcv2.c              | 125 ++++++++
 hw/misc/Makefile.objs            |   8 +
 hw/misc/imx2_wdt.c               |  88 ++++++
 hw/misc/imx7_adc.c               |  99 +++++++
 hw/misc/imx7_ccm.c               | 233 +++++++++++++++
 hw/misc/imx7_gpr.c               | 119 ++++++++
 hw/misc/imx7_iomuxc.c            |  99 +++++++
 hw/misc/imx7_snvs.c              |  83 ++++++
 hw/misc/imx7_src.c               |  93 ++++++
 hw/misc/imx_flexcan.c            |  99 +++++++
 hw/net/imx_fec.c                 | 163 ++++++++---
 hw/pci-host/Makefile.objs        |   2 +
 hw/pci-host/designware.c         | 614 +++++++++++++++++++++++++++++++++++++++
 hw/sd/sdhci-internal.h           |  15 +
 hw/sd/sdhci.c                    | 130 ++++++++-
 hw/timer/imx_gpt.c               |  25 ++
 hw/usb/Makefile.objs             |   1 +
 hw/usb/imx-usbmisc.c             |  99 +++++++
 include/hw/arm/fsl-imx7.h        | 217 ++++++++++++++
 include/hw/dma/imx_sdma.h        |  22 ++
 include/hw/intc/imx_gpcv2.h      |  22 ++
 include/hw/misc/imx2_wdt.h       |  34 +++
 include/hw/misc/imx7_adc.h       |  22 ++
 include/hw/misc/imx7_ccm.h       | 130 +++++++++
 include/hw/misc/imx7_gpr.h       |  28 ++
 include/hw/misc/imx7_iomuxc.h    |  22 ++
 include/hw/misc/imx7_snvs.h      |  35 +++
 include/hw/misc/imx7_src.h       |  22 ++
 include/hw/misc/imx_flexcan.h    |  22 ++
 include/hw/net/imx_fec.h         |  24 +-
 include/hw/pci-host/designware.h |  92 ++++++
 include/hw/pci/pci_ids.h         |   2 +
 include/hw/sd/sdhci.h            |   8 +
 include/hw/timer/imx_gpt.h       |   1 +
 include/hw/usb/imx-usbmisc.h     |  22 ++
 43 files changed, 3581 insertions(+), 44 deletions(-)
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/dma/imx_sdma.c
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 hw/misc/imx7_adc.c
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 hw/misc/imx7_gpr.c
 create mode 100644 hw/misc/imx7_iomuxc.c
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 hw/misc/imx7_src.c
 create mode 100644 hw/misc/imx_flexcan.c
 create mode 100644 hw/pci-host/designware.c
 create mode 100644 hw/usb/imx-usbmisc.c
 create mode 100644 include/hw/arm/fsl-imx7.h
 create mode 100644 include/hw/dma/imx_sdma.h
 create mode 100644 include/hw/intc/imx_gpcv2.h
 create mode 100644 include/hw/misc/imx2_wdt.h
 create mode 100644 include/hw/misc/imx7_adc.h
 create mode 100644 include/hw/misc/imx7_ccm.h
 create mode 100644 include/hw/misc/imx7_gpr.h
 create mode 100644 include/hw/misc/imx7_iomuxc.h
 create mode 100644 include/hw/misc/imx7_snvs.h
 create mode 100644 include/hw/misc/imx7_src.h
 create mode 100644 include/hw/misc/imx_flexcan.h
 create mode 100644 include/hw/pci-host/designware.h
 create mode 100644 include/hw/usb/imx-usbmisc.h

-- 
2.13.5

