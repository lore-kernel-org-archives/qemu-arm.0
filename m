Received: by 10.28.91.67 with SMTP id p64csp2174962wmb;
        Sun, 4 Mar 2018 21:17:12 -0800 (PST)
X-Google-Smtp-Source: AG47ELvAnifmkHHdqilI5GOsY8L6FTpGqfASrlgYCAoM2Y+moVlC+ErlDTsBFd/aCJt2qJpzz58E
X-Received: by 10.13.224.6 with SMTP id j6mr8609566ywe.484.1520227032171;
        Sun, 04 Mar 2018 21:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520227032; cv=none;
        d=google.com; s=arc-20160816;
        b=lBQ03dlb0GhIlk9jMMkksWxqSoxHX4IGfEUNYz5Qgihe8iQNT/zbINBSl8BFq5gcXm
         fd2RYutmwyDQ8BOiBNfK5OYw/jVkBx6GifbVs+Yendgd/F+cVyNRkBfIhriJjFhI9Gwe
         SWl6Hf4B/KcEYgyf0k6cu839U2YRjwMDsJYW+ivz6NCUGPL+QMpwoxGid6hMJ9yFvcd1
         qF79YgrqqhMgTMaVowRA9R0SnTUJdN8g7hQxRt1uyCKam6hr4RMe5ONzAlsUhH5pBFSW
         DXsxh4wK4SFoLE/Lzx8ieZ/Z6WTY2FZr95w3v84Rs5Tvn4LUosE136RuK4bK34R6jdUd
         rWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=AnvZEEpWSQZSvb8tMpvXZDabKKpBtOo1n+r4ql937q4=;
        b=OW1CVET/wzPoxRQWHXJnMYRcVZQHuk1RKXMa5pAY416X3cyKRua52yezvDCXmJwLJt
         Jcra9pifeDewMkobMmo5nvWBlk0pDShI+LFQejaP5fo5OXTAjggBrI3xxnBl5BEtd+Sz
         R9LNsT5We9q2WoyCtdlvuXEN4ctLj5x0dP9cr5mCJF2+D9PPRwWHPYKg1cHjmpFfvPB7
         6MatlqLqLWXYlsIan5cZK59O367rf1bXBwzmDAGW73Y+XO5OEYd6r9/COR6PwWxCzwyX
         Wm2kByDZ8r6SjuUwhYmPLMKzc/a3faJ0muLmWNAkEqwuW0o8fxoHImUheTXfsVDKTTKh
         eK7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BA9g+yDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h130si2037375ywh.404.2018.03.04.21.17.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Mar 2018 21:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BA9g+yDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1esiUp-00041N-J3
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 00:17:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esiUi-000413-Pu
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 00:17:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1esiUf-0006k0-KO
	for qemu-arm@nongnu.org; Mon, 05 Mar 2018 00:17:04 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:46037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1esiUf-0006hh-CI; Mon, 05 Mar 2018 00:17:01 -0500
Received: by mail-pl0-x242.google.com with SMTP id v9-v6so9052515plp.12;
	Sun, 04 Mar 2018 21:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AnvZEEpWSQZSvb8tMpvXZDabKKpBtOo1n+r4ql937q4=;
	b=BA9g+yDz6/LYNjdt3pqgdjaFK4AlgjUWHwTVgM9JmWtYhTRjfssQZyvqh50hl1tY4d
	TFwDFthfN1mKwDmsr1yZytsJMmYIPzfSmIufBlB25tr1apBX5GEc86gQcSsEj9SNOe7z
	rXVmTTSIbutncntdRs/DZ/auuL7RyqYCircECDm5XDcZOkgXobJQEb3gzlMp6BjIchXp
	+dzr09p6+jEaQ1C/VTvtJ/VqLwArXmcqjKH+9wCNAtFK1yXxSRUAZp+nctyxvHnes+XE
	BW0O2Dp39YJbW+Y0mO/f6pv3uENGZEELaU3yJJMMbNp8u8i6DpxD1bFg7gk7P9UZjrVw
	QyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AnvZEEpWSQZSvb8tMpvXZDabKKpBtOo1n+r4ql937q4=;
	b=P7YpHLuRbumwDbSkN3D+q9Tb7D8g92hznhcFI7OX5Bb1a8gzcsL+UTuzUbgIpkReZl
	w20dnI01o8TRk1oENC+CB7OUgNm1nuBsh/FKa8L4on6jpOYDBp/OqfYA/Bwl9dEBnWrn
	xJj02B+KF2CUho5AEs9dr2u7N+ZsBUtVAIR/H6vIHA6V2y3R0abbRuUzj4F6aviX7j+V
	NVAWFPZgrVXcv+gsZyBCnYlROaioP3mSARkzGq5xjHJCs60CG/bTzTZJS8NSF0WShQCN
	qoyBFyn8lmPABcDXnE398tcQDUGR80SXSb6a47nkK1upjK27n5k4kR/XE/PswXqQLDoh
	gP3A==
X-Gm-Message-State: APf1xPCNfacIsRswI5eJxf46n5WK7tTTAiuUe3F+gNmPUWXnFavhU4lo
	To6XE8qLRw+kh8R04zkZWO2bRUqw
X-Received: by 2002:a17:902:858c:: with SMTP id
	e12-v6mr12073675plo.39.1520227019627; 
	Sun, 04 Mar 2018 21:16:59 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	c11sm30108147pfe.109.2018.03.04.21.16.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Mar 2018 21:16:59 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Sun,  4 Mar 2018 21:16:52 -0800
Message-Id: <20180305051655.5944-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v7 0/3] Initial i.MX7 support
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
X-TUID: BBpXj6PJNs1y

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

    - All endiannes in Designware PCI implementation is now specified
      as little-endian

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

