Received: by 10.28.71.27 with SMTP id u27csp238192wma;
        Tue, 6 Feb 2018 20:25:27 -0800 (PST)
X-Google-Smtp-Source: AH8x227+WVQTi4qQTM6nQXi1yKzvtOWcMB2IM5lWD+uP8Vs6HLbZrr9+aXKrlsAFSoD2B7cOFfeu
X-Received: by 10.129.82.137 with SMTP id g131mr3026251ywb.145.1517977527017;
        Tue, 06 Feb 2018 20:25:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977527; cv=none;
        d=google.com; s=arc-20160816;
        b=lQctIeoB5zwe7Sztn3XEAeKkcvBmJ/RNGryBZG0NWK6I9DNgELbXxwP70kuA0gjiDX
         Shsg49pVPYZpthn6MPKpnOpd1GFkLLG+duGfA38RpPAreXlioGUs76G5wXRBR3zITAP2
         6AMF/mLt4xhjMPyWFmLCKCAU3nvqll+3r4Z+jeTcZMIJBz7qeOrdeXjqhkWDZ4hde5tv
         KZvv1F/rii9UdTWCEVHTdl71uMNSvFVx2ZNsx9jGZ/JuSf2CEg7ecNgF7/ai9VHh/805
         CAHrmP9kDOnKQzAykEq0lw/8h/rUMPJqAGGoA38GR2BPzdC3Jw6HqcKqFdj1I/HYF2Kx
         MpNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=z9fU0vY1XzKUaAko8NagCCfY6dOCvR4y7yCHPcbKKx8=;
        b=fq1pgjzXqNHN7rg1Spgnzjl2JyBekVIBlnhK4go+cDX79gWQgxy+kCAW49LG+Z0XW/
         4W33crWG7vZFCys/8R8c9O1OAw0JjoRiHD/HT2YgUcy8z6qvfPr+mD3u/hPw7BO8hgvW
         hJUepvd2bGVmVElbWvBqr20TNdcuuvLyzqvfcb5osiwhSKTlillSH0tZyiitACesugGk
         lw5f0SYfZDI4gMqXotXi7VBKlsheAp6OLMQDVSwO+MnF+jYuJ2ttzxMiHPxGAET2vmkV
         N81XyPxtwKawpuzwSbREun3iVNlwcVNlEk68TwZfocslHYqcl4zcVL/RLByPHi9daq8i
         /eLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q0pWBEaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g131si119252ybf.2.2018.02.06.20.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:25:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q0pWBEaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHIU-00007w-8p
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:25:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIC-0008WB-8N
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHI9-00033t-1j
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:08 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:34350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHI8-00033e-Nv; Tue, 06 Feb 2018 23:25:04 -0500
Received: by mail-pf0-x241.google.com with SMTP id g17so1648600pfh.1;
	Tue, 06 Feb 2018 20:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z9fU0vY1XzKUaAko8NagCCfY6dOCvR4y7yCHPcbKKx8=;
	b=q0pWBEaKowONKNDtwpsFjJRcS02/RSULF3RqCbypQPWHi5Ji99ZYze2UGf2VMbPV/z
	lYmH4kdOlScUngmnHQMOcJMTNvoM5jBtpvCmdoBo0+LNkfr7NuvgxiU1T7HXwXUigzTH
	a2WUKoqa68E/cSZj5onQy4jxdKJCjTiSpZc0UZCp+pkwEFTQzq4i3qexoEogLNY7EK3u
	t/+ZCAXlvi9HgkyhfxOPx1INbJADIrTrQpmMYWqno5MsXNIoYwfGOxTAjekG5F4cZ60H
	sDU8JZWciyXF8sHhf9F8TxgtV4haEDVT/TSjUIHa0Nt/fKene3MIL9WI/rF0+9WAkPZA
	7DcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=z9fU0vY1XzKUaAko8NagCCfY6dOCvR4y7yCHPcbKKx8=;
	b=aiNKAl+LhAXy3yejNWeku4isL3z9uhqYJVIRc12vT7GetVGCv3UpBAmoOUBLN4drxI
	OAnkcQAQJXFTjlLwgpoliz6YAz+iU2zxxsaAADT6OA2q90BM3kB9aD4J1r79GnLmD8gB
	lP2hPqatM93u/GawEBBCTtifxek3Gm9kYOqhk4OR4TtjkEJEC0mBPpD8UVJRG90QXxNc
	hKKu5FTT8+ExsiSgzXkjiH0kX2chwtm6zyVQbZw4kSz5Fl2vCnGTAw/E/kyFgmqR8b3P
	FuVmsH7B6ncBavZmlp8HH8lkSUzfGjLfYaDFO3mREDWrsQHK+3AB3xiXOZbFihC0x9Dl
	2C6w==
X-Gm-Message-State: APf1xPBLW4UfdXKdmNOAoJcGSn5656CXD2Vf5MrZhUm7bYC6H7pnwI4x
	HeMUn9uXdlAzvUYyx/c5eDN3KTGZ
X-Received: by 10.99.97.79 with SMTP id v76mr3826152pgb.104.1517977503166;
	Tue, 06 Feb 2018 20:25:03 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:02 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:24 -0800
Message-Id: <20180207042438.15422-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v5 00/14] Initial i.MX7 support
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
X-TUID: ILwsYNx2/Kxg

Hi everyone,

This v5 of the patch series containing the work that I've done in
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

[v4] https://lists.gnu.org/archive/html/qemu-devel/2018-01/msg03264.html
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
  pci: Use pci_config_size in pci_data_* accessors
  pci: Add support for Designware IP block
  usb: Add basic code to emulate Chipidea USB IP
  i.MX: Add i.MX7 SOC implementation.
  hw/arm: Move virt's PSCI DT fixup code to arm/boot.c
  Implement support for i.MX7 Sabre board

 default-configs/arm-softmmu.mak  |   3 +
 hw/arm/Makefile.objs             |   3 +
 hw/arm/boot.c                    |  65 ++++
 hw/arm/fsl-imx6.c                |   2 +-
 hw/arm/fsl-imx7.c                | 580 ++++++++++++++++++++++++++++++
 hw/arm/mcimx7d-sabre.c           |  90 +++++
 hw/arm/virt.c                    |  61 ----
 hw/intc/Makefile.objs            |   2 +-
 hw/intc/imx_gpcv2.c              | 125 +++++++
 hw/misc/Makefile.objs            |   4 +
 hw/misc/imx2_wdt.c               |  89 +++++
 hw/misc/imx7_ccm.c               | 277 ++++++++++++++
 hw/misc/imx7_gpr.c               | 124 +++++++
 hw/misc/imx7_snvs.c              |  83 +++++
 hw/misc/trace-events             |   4 +
 hw/pci-host/Makefile.objs        |   2 +
 hw/pci-host/designware.c         | 759 +++++++++++++++++++++++++++++++++++++++
 hw/pci/pci_host.c                |  13 +-
 hw/sd/sdhci-internal.h           |  20 ++
 hw/sd/sdhci.c                    | 230 +++++++++++-
 hw/timer/imx_gpt.c               |  25 ++
 hw/usb/Makefile.objs             |   1 +
 hw/usb/chipidea.c                | 176 +++++++++
 include/hw/arm/fsl-imx7.h        | 221 ++++++++++++
 include/hw/intc/imx_gpcv2.h      |  22 ++
 include/hw/misc/imx2_wdt.h       |  33 ++
 include/hw/misc/imx7_ccm.h       | 139 +++++++
 include/hw/misc/imx7_gpr.h       |  28 ++
 include/hw/misc/imx7_snvs.h      |  35 ++
 include/hw/pci-host/designware.h |  97 +++++
 include/hw/pci/pci_ids.h         |   2 +
 include/hw/sd/sdhci.h            |  13 +
 include/hw/timer/imx_gpt.h       |   1 +
 include/hw/usb/chipidea.h        |  16 +
 34 files changed, 3277 insertions(+), 68 deletions(-)
 create mode 100644 hw/arm/fsl-imx7.c
 create mode 100644 hw/arm/mcimx7d-sabre.c
 create mode 100644 hw/intc/imx_gpcv2.c
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 hw/misc/imx7_gpr.c
 create mode 100644 hw/misc/imx7_snvs.c
 create mode 100644 hw/pci-host/designware.c
 create mode 100644 hw/usb/chipidea.c
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

