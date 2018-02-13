Received: by 10.28.71.27 with SMTP id u27csp1599305wma;
        Tue, 13 Feb 2018 09:56:04 -0800 (PST)
X-Google-Smtp-Source: AH8x224Tlv0aTyG/xOk4NohBAW1AxrMAwrJWgxnazibef8q8REryi/pGio5fY4GFcPLSFqxUXTou
X-Received: by 10.129.162.79 with SMTP id z76mr1279446ywg.365.1518544563996;
        Tue, 13 Feb 2018 09:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518544563; cv=none;
        d=google.com; s=arc-20160816;
        b=iNs/Pb8nPresokTtyLKy9YRDylLwiBX3a9iSpIrHBU2ufBMnr95io4c4tAPXlcNBKk
         qTuhYd1AkROGS3aZLqwWL2eU8/Q5Zj09JbozDvtFwNPHqzc6Yp0iecJhFcCCHQrJ0B5b
         Xwv96rDWmLCSC7C/kmg/YDIVLHQURZjNt6ZM6Q648/N/hj110IOOzmT2DeOSq0i2kxJR
         AsPIWHPj5LZiEM/us+CAFuA83bPMn33vBXiq3F5LQcosCHbed608ci8VZCxusIlb1oiB
         yTtHUvpDGlYuwLN5PURJPBshC+VSF42mVdIkOP9vU1X8ioId2wcgRLqBKD1YPF0fjQF4
         hLOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=af8zNFNzyi4qP4eO6gH637lA9zUz2vQrXATcIZPlEAk=;
        b=yP61HpcvztrFt2GzeU8aiacfEiOWA20TYhU+tCIXeEbFDZBoHsdWfqS0t6gxRjc234
         LDiZJBMIgY8SxXJonAq+mmay98W6lc++M1zBGC+8UdgEG0L3siy0InHcLozXOcWxIXJA
         ts5y3ZAhU+uiRNS4DokqOGEd8rzNHPlr8Lcx7PG7tkZ4E/LE7B7KCCVD7xeJerXfXqUY
         O3typeMVHgXeujUgQjDCeQy821MPt5Y9Vh21bh63vVzNTYa+PwiEn42w8oL34RvRAvqK
         9y2Yl1rsCfIdhUCghPsBlPJwklZIOusUJTJVW7jkHptIWcgosi4A9LM1mNtBLLUPB3Vn
         +ONw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OA0v4hWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t8si459298ybo.366.2018.02.13.09.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 09:56:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OA0v4hWN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eleoF-0003Yj-AT
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 12:56:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ele3Q-0004mU-CW
	for qemu-devel@nongnu.org; Tue, 13 Feb 2018 12:07:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ele3O-0006ku-Ip
	for qemu-devel@nongnu.org; Tue, 13 Feb 2018 12:07:40 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:43002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ele3G-0006fT-Ss; Tue, 13 Feb 2018 12:07:31 -0500
Received: by mail-pl0-x243.google.com with SMTP id 31so1410395ple.9;
	Tue, 13 Feb 2018 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=af8zNFNzyi4qP4eO6gH637lA9zUz2vQrXATcIZPlEAk=;
	b=OA0v4hWNbdDou+XqYFlAvrCbircp4poKdFb9fnM7ki+Wauxgtb2vE/fV+E1hn1agPt
	7CEJVelh6dSevpWTSde1LBVF4Dhr9jqGdb3pIgasC2tRGAw4vblGsxAIurX8nWNN8yM7
	//gUj4trFbr5lNkDNWvkloNHBhQffHEjTGAHhcmz5xtfZSb7zg/9138q4FLEBEc+W9V6
	o7IP9Nnm4Bzz9dKNXuAbDmHw+Eep6enZhb2SMCdy5/hdWFVLLITmZ5hAk97PVXg+nER9
	xB/zrJ9lXlUdKrMLI41fe5jpy7+snB2nG6EuAlcVvH31Rj+0Gf9WV1sRXBxwG+ZS5stZ
	AOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=af8zNFNzyi4qP4eO6gH637lA9zUz2vQrXATcIZPlEAk=;
	b=HrcB5gaeS19Lb1gfyTYLnt+u3gwvqCI55HLZBApGytatMr03drakPeLff31nMqT5nq
	KVD83eWXNJBXX9ogV9aFIvx9EHvAIbjRlg/kZDz0t3/4bIT9IIROWT2thY0pY6hQgG2q
	Fudn8gy+QbV6lmEkcgti112C0Nm8vtxAYvxU8H7NnIDE2l0tTYE+PwIpC7SOUx6Sm1rN
	O15cpjR5ra5T411F+pzf+xUcTJWUVItxsBbVW1Ohv4BvQXUBbLOEjT5nGAIBl4naRfur
	H9EuvUUlOT7eNtpPYm1Gshdbyq7zUifsUMMl9EZEJv8eu/aQEkSCqOvWNa7XiH3UbmB+
	vh7Q==
X-Gm-Message-State: APf1xPBMqDDgtTjpNqNdyYDd7R8JStzuQ/Lu3B1hmTTFDC+ktyAN/kLz
	YRtUIe1fmC8HVmTUDTuztOLJP3UJ
X-Received: by 2002:a17:902:52f:: with SMTP id
	44-v6mr1707133plf.65.1518541649285; 
	Tue, 13 Feb 2018 09:07:29 -0800 (PST)
Received: from localhost.localdomain ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id b9sm5053495pgv.69.2018.02.13.09.07.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Feb 2018 09:07:28 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue, 13 Feb 2018 09:07:09 -0800
Message-Id: <20180213170712.18239-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v6 0/3] Initial i.MX7 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: alxP9LEI1UHk

Hi everyone,

This v6 of the patch series containing the work that I've done in
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
 hw/pci-host/designware.c         | 755 +++++++++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs             |   3 +
 hw/pci-host/Makefile.objs        |   2 +
 9 files changed, 1759 insertions(+)
 create mode 100644 include/hw/arm/fsl-imx7.h
 create mode 100644 include/hw/pci-host/designware.h
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/pci-host/designware.c

-- 
2.14.3

