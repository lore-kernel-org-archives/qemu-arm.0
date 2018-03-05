Received: by 10.28.91.67 with SMTP id p64csp2210288wmb;
        Sun, 4 Mar 2018 22:13:05 -0800 (PST)
X-Google-Smtp-Source: AG47ELvcS3RrYIQO58jVZuPY2LoKFOdoUJXc5VDL19bPJiClMtSysomAFusHKaDK4krRdKmM0LLr
X-Received: by 10.129.141.5 with SMTP id d5mr8724412ywg.510.1520230385337;
        Sun, 04 Mar 2018 22:13:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520230385; cv=none;
        d=google.com; s=arc-20160816;
        b=iqL+T05fLQ0hP4Dhk2HBELb1/0QCTeU0zXih24L8azOHABHIvU0hkN77sSuQAyMAhz
         CVy7PcXH1CYLBf3e7e6oZNmr8cET8dHIf/s+5acf8RIhLtPzsOHeOpr86NLNatjiP4yB
         gKFDhV5lRKhbnhhhiO3WuxuOYF17U783l4vhL/sEV/0se8jnzZ7w2gEArcBcd9dUscjY
         Adxq7EhQQrtAtTgNghzG4sB7aijjcL0xSgFlRx6ZkNalwnbQy8ZTm7gL4IRidCsYs4M6
         YgIGzNk9H+GpEdk18P3ZjE1D/FWvx5kt9M5WJ2ssOCIK0bgE7GkkrZ5zZZmc8XXIaUVq
         R0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=d5BHJFcUbNB0r8QLXl9DWlzIPoiUcp0yaTgxcnJluwg=;
        b=wNhF/L2GptBh6/rsHtwjlQLszQSd7OF4Blk69BjyoC00+K41bshSCzNSC4T5G2y3M1
         BhbTFPCYnz9zHI4YROYoHQpVlTwI5yiuXKoQSBGq9xCQs8dKbpGyZvVGt/eSc+Mb8KL8
         o8Txbp+RztK9jsL1ltIFjuG5DbAPBNQFWd6Lbe0qtvEDYtYw5FexSqIertuf16zpKb5v
         /1nILRFYwgIUrdlno1Svo09aF8qsaOoAIfd0/Kbt36BgncLF+obLnMAEXT3SCScQXZTc
         PTM0MYc+bo1M9nAHBDBNhXB9+u3yjGhrvL+z4ncnfocP4DIsG4gCaasXkdwTg8YkAF4g
         RPDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlLTd1vM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t4si1991748ywi.706.2018.03.04.22.13.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Mar 2018 22:13:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SlLTd1vM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esjMu-0002qg-PM
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 01:13:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esjMk-0002pX-MC
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 01:12:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esjMg-00006Z-LN
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 01:12:54 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:41257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1esjMg-00006L-C1; Mon, 05 Mar 2018 01:12:50 -0500
Received: by mail-pg0-x241.google.com with SMTP id q27so6440497pgn.8;
	Sun, 04 Mar 2018 22:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d5BHJFcUbNB0r8QLXl9DWlzIPoiUcp0yaTgxcnJluwg=;
	b=SlLTd1vMTNbM7+At8Uh6XrFqZAEoRWrbYCB7DGIRakcR7JMVHTTs/hLmzWC6K0uMnD
	qzSKfIErqOtP5HxZgUxG9wsyBVkmu1JX+k6WQbpKPWhEAS2QgIwnJY4GOi5Ztle4n+Z0
	H9HjxjKInfjr4Viu+AqivA0JXw3ZHqdaQmTfoA9AE8Dyq4Ytwm8xIpcayZcWGwgNh1Qi
	Kg9fuKuxfRD9M7NqQVp01qv6WX4urXrB3NvgjJ8VgdfZyE8cqvGONy0M/SLrbTsgvZVj
	6Flc6sU+AcTJRdXNkmYetW10v1/CwUSax1WAFJ+40JKdaqsgDC+GOPZFAE+NHFmHW7np
	vgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=d5BHJFcUbNB0r8QLXl9DWlzIPoiUcp0yaTgxcnJluwg=;
	b=W8Ttm3UovkdEkyo1BM5XVxtfNnpescuGSuckaUsv21NG/gjVP0/hnbiRZMQXJTooEd
	zGCz/UBEJ8X0+8mjsdTGYHY9Z4o0QxG5Z9IkC2CLYAyuU8XJ/R7Y2DmZZqia2xUhYreW
	KleFvvIoqGAIujGTYbBf3RShxFDC61wjdVO7p5bJV8FrcIunr6Y4DHPJt4rWEuR9RWKO
	NfBCbfDinNn4stAmvN6dv9nuyeiE+y9MciNc7j8QZnqH0wN5NsYx0u3kdyG0TnoIfFVr
	JihKNL7aN2AIkPI8BYNRvk23zH6CQpbj689rZF5l3axFHTfxBajrGzYcaKGok2MEJ3t9
	LQCA==
X-Gm-Message-State: APf1xPBtI7rfj95gr50Ndl57G2t9nBRG3ULMwHr6rH6VG0k5FJfUbcck
	3CF8d6fKMDswB/Lox+gR8cBU7vyN
X-Received: by 10.101.72.69 with SMTP id i5mr10975184pgs.78.1520230368901;
	Sun, 04 Mar 2018 22:12:48 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	n76sm21285221pfi.93.2018.03.04.22.12.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Mar 2018 22:12:48 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Sun,  4 Mar 2018 22:12:34 -0800
Message-Id: <20180305061237.21484-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [RESEND PATCH v7 0/3] Initial i.MX7 support
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l+KifxTUlZku

RESEND due to botched original v7 submission (patch 1/3 broken)

Hi everyone,

This v7 of the patch series containing the work that I've done in
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
    * 3 USB controllers
    * 1 LCD controller
    * 1 ARMv7 DAP IP block

Feedback is welcome!

Changes since [v6]:

    - Removed reference to "is_express"

    - All endiannes in Designware PCI implementation is now specified
      as little-endian

    - Patchset rebase on latest master
      (136c67e07869227b21b3f627316e03679ce7b738)


Changes since [v5]:

    - Rebase patchest on top of latest QEMU master, so now the
      patchset is down to three patches

    - Reverted the change to use pci_data_* functions becuase the
      patch supporting this change was causing trouble

    - Fixed endiannes of MSI and configuration space accessors to be
      LITTLE_ENDIAN

Changes since [v4]:

    - Rebase patchest on top of latest QEMU master

    - Reworked PCIE emulation code to create MemoryRegions
      only once

    - Fixed incorrect usages of PCI instead of PCIE

    - Fixed device class reported by PCIE bridge

    - Added patch to make pci_data_read() and pci_data_write() usable
      for PCIE devices as well

    - Converted PCIE code to use pci_data_read() and pci_data_write()

    - Added VMStateDescription code for PCIE

    - Collected Reviewed-by tag from Philippe

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

[v6] https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03587.html
[v5] https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg01558.html
[v4] https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03264.html
[v3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg04236.html
[v2] https://lists.gnu.org/archive/html/qemu-devel/2017-10/msg05516.html
[v1] https://lists.gnu.org/archive/html/qemu-devel/2017-09/msg04770.html

Andrey Smirnov (3):
  pci: Add support for Designware IP block
  i.MX: Add i.MX7 SOC implementation.
  Implement support for i.MX7 Sabre board

 default-configs/arm-softmmu.mak  |   3 +
 include/hw/arm/fsl-imx7.h        | 222 ++++++++++++
 include/hw/pci-host/designware.h | 102 ++++++
 include/hw/pci/pci_ids.h         |   2 +
 hw/arm/fsl-imx7.c                | 580 ++++++++++++++++++++++++++++++
 hw/arm/mcimx7d-sabre.c           |  90 +++++
 hw/pci-host/designware.c         | 754 +++++++++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs             |   3 +
 hw/pci-host/Makefile.objs        |   2 +
 9 files changed, 1758 insertions(+)
 create mode 100644 include/hw/arm/fsl-imx7.h
 create mode 100644 include/hw/pci-host/designware.h
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/pci-host/designware.c

-- 
2.14.3

