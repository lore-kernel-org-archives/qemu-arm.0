Received: by 10.28.173.206 with SMTP id w197csp2612623wme;
        Mon, 8 Jan 2018 07:45:41 -0800 (PST)
X-Google-Smtp-Source: ACJfBov7ttYjUnblF9yEI7EbeGMBAz+SglBz5bG3ELl5Bk2Ctb5fFGyE5zL2nA558W+yw40zakMk
X-Received: by 10.37.10.67 with SMTP id 64mr12411433ybk.184.1515426341840;
        Mon, 08 Jan 2018 07:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515426341; cv=none;
        d=google.com; s=arc-20160816;
        b=pJidagpH6mcaVh10aVPmPsL45KlxXa0MEDo4IfdTpnqoCvKnZryf6tFfMlHko87Y0Q
         TpNgbvhBTwLIBefBAHXlSbn+L1lakPwP9hG/vbFjKleTFuVuKBRDqfQQt8423ZHRYmbL
         B0aKgG/38cL0ZC+x7i6o5zA43XoTVUGIWqTA5FpF5JVtu/VjT42Dt0U7mt4d/0NybE/9
         2mQBtzvz/OKuQCGl5VEi8WoA1T6ZAB3MBdUGEJdyDWkyMjlnvUNk6L8mrr31Bqt8yifD
         adQOv/YMMe0Rxf307MAbIhtVzo9VlhpFsRF5NyEs32XiCC/nw5Z9qs22J1N6wGFW5qcx
         M73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=jAKNb370Vh7VetNIcxOCCWhTte5/nqfC8nJg82GBDvA=;
        b=qZK8OXApryHMQG7N0axyUAw9GBRLAxfnBtj7IJ5yBtkeYKC32g/PTO5ixAZFtiFqNF
         oZFilgHiPVBxgcgHdqjTkSgLk6WY+0Mb3B0GTpKjEF03i6Pdmc3wDw52apdNjWFXQrgU
         Z1PlmQUUDH41ndptQiuhPyJilfDBpAdotxMTHZttWO1Se8msiTxoYyPNhAiJfNA2Woz4
         0zzHkCHWkmCsMgeYIVN1XI+F2zP4EidG6lZPlX7EFvN/6/fV6JvPtbbeUTBHKZK7LDZB
         mGVG6cZVJyCyiA3X24XTtQ4rKQjv0Sdt74bcf1YvQJUW5k0LXto90XuD2l0qxlpQH6Bp
         u4VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p5Urrew6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w141si1028533ywd.802.2018.01.08.07.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:45:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p5Urrew6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZcL-0002Ft-6r
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:45:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZa9-000125-Ck
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZa6-0006oK-7g
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:43:25 -0500
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231]:38792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZa6-0006nm-18; Mon, 08 Jan 2018 10:43:22 -0500
Received: by mail-qk0-x231.google.com with SMTP id j185so3816990qkc.5;
	Mon, 08 Jan 2018 07:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jAKNb370Vh7VetNIcxOCCWhTte5/nqfC8nJg82GBDvA=;
	b=p5Urrew6cl2ofTpQPM6PN6ftMJYUUhSQA0vdtGQjF7BWJW5EhKJ5QfaGXMTMFeD7PW
	rxdjen+J0M1pbjE0trBk1cXHBWhqT7uqRMHSk8DBbrRNqoy69mQuFCTy0/NXTeJSCiJq
	3SwTKrRjB7SBChAc1JbQMiLYhvKzWQyoOVFwZbvfQd9slCjc1UiHmhVJYoBV6dMSiLKh
	3MSVJkqRf/IE2SjjxV/SFYWxnZtUDbNnaCScql5/lc/NflFm976jPO3GRHTC8cVKkDrx
	zwt0cJ22NRCoFaCmTeTiB/cYt11tCw/DmAUfstT6eveWVPbBtLQATT/l74EiYpH40uZC
	ZYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=jAKNb370Vh7VetNIcxOCCWhTte5/nqfC8nJg82GBDvA=;
	b=e0LLPHWjEhleshPHNFuYeilnEzoZ6aE9ZqETaOdszEjNDT1fGUBF/5IEaGw8t5y68R
	fRJIDUht1MbLgAwVv0Z9jynUbuqdiZ7ZYHaqOgxK/gHHqXXKva4DNX4am6DR7YIqTUB8
	124g8dgQmX3FClLuSBXGF1Ji5L3ON8RZyY1Wu1pi5FMd+q+F8PJJwAg1kDGEI7DkmqYs
	nU0+UscEf44y8t7BMNotUjI1mHG9GGJXk6SyRhwuUuw/8cjf1ZD3oIG7NFNBUJuLWhLJ
	n7ceZ8OQaDYMhKMStK35rdYCEgzB2VVuvtE99GolbTjRaexmcQk7hGZ/RbYpvE8xE0D9
	pczQ==
X-Gm-Message-State: AKwxyteVQ92fDj/9oqu/cCvTqbaDrGtBVlH13nYZ+EXSfVJ4T/jPmPHK
	rkHpc+0B6kKp9K0QukrQPjo=
X-Received: by 10.55.12.133 with SMTP id 127mr5891613qkm.69.1515426201370;
	Mon, 08 Jan 2018 07:43:21 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.43.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:32 -0300
Message-Id: <20180108154303.6522-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::231
Subject: [Qemu-devel] [PATCH v5 00/31] SDHCI: make it abstract,
 add inherited devices, add qtests
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ne3SWzGAQidv

Since v4 ("SDHCI: add qtests and fix few issues"):
- spec_version default to v2 (current behaviour)
- addressed Alistair review (no v1, tell user about valid version)
- generic-sdhci is now abstract, added more sdhci device following Linux
  Device Tree names:
  - hw/arm/fsl-imx6: "fsl,imx6q-usdhc"
  - hw/arm/exynos4210: "samsung,exynos4210-dw-mshc"
  - hw/arm/bcm2835_peripherals: "brcm,bcm2835-sdhci"
  - hw/arm/xilinx_zynq: "arasan,sdhci-4.9a"
  - hw/arm/xilinx_zynqmp: "arasan,sdhci-8.9a"

Since v3:
- no change, but split back in 2 series, 1st part is "SDHCI: housekeeping v5",
Based-on: 20180103180805.18140-18-f4bug@amsat.org

Since v2:
- more detailed 'capabilities', all boards converted to use these properties
- since all qtests pass, removed the previous 'capareg' property
- added Stefan/Alistair R-b
- corrected 'access' LED behavior (Alistair's review)
- more uses of the registerfields API
- remove some dead code
- cosmetix:
  - added more comments
  - renamed a pair of registers
  - reordered few struct members

Note, the bcm2835 seems to have 1KB minimum blocksize, however the current
model is implemented with 512B. I didn't change the current value.

Since v1:
- addressed Alistair Francis review comments, added some R-b
- only move register defines to "sd-internal.h"
- fixed deposit64() arguments
- dropped unuseful s->fifo_buffer = NULL
- use a qemu_irq for the LED, restrict the logging to ON/OFF
- fixed a trace format string error
- included Andrey Smirnov ACMD12ERRSTS write patch
- dropped few unuseful patches, and separate the Python polemical ones for later

From the "SDHCI housekeeping" series:
- 1: we restrict part of "sd/sd.h" into local "sd-internal.h",
- 2,3: we somehow beautiful the code, no logical changes,
- 4-7: we refactor the common sysbus/pci qdev code,
- 8-10: we add plenty of trace events which will result useful later,
- 11: we finally expose a "dma-memory" property.
From the "SDHCI: add a qtest and fix few issues" series:
- 12,13: fix registers
- 14,15: boards can specify which SDHCI Spec to use (v2 and v3 so far)
- 15-20: HCI qtest

Regards,

Phil.

[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/31:[0006] [FC] 'sdhci: add a spec_version property'
002/31:[----] [-C] 'sdhci: add basic Spec v1 capabilities'
003/31:[----] [-C] 'sdhci: add max-block-length capability (Spec v1)'
004/31:[0002] [FC] 'sdhci: add clock capabilities (Spec v1)'
005/31:[----] [--] 'sdhci: add DMA and 64-bit capabilities (Spec v2)'
006/31:[----] [--] 'sdhci: add BLOCK_SIZE_MASK for DMA'
007/31:[----] [--] 'sdhci: Fix 64-bit ADMA2'
008/31:[down] 'hw/sd: clean/reorder the Makefile adding few comments'
009/31:[down] 'sdhci: add a common class'
010/31:[down] 'sdhci: add a Designware/Samsung host controller'
011/31:[down] 'hw/arm/exynos4210: use the "samsung,exynos4210-dw-mshc" device'
012/31:[down] 'sdhci: add the generic Arasan SDHCI 4.9a PHY controller'
013/31:[down] 'hw/arm/xilinx_zynq: use the "arasan,sdhci-4.9a" device'
014/31:[----] [--] 'sdhci: add qtest to check the SD Spec version'
015/31:[----] [--] 'sdhci: check Spec v2 capabilities qtest'
016/31:[0007] [FC] 'sdhci: add v3 capabilities'
017/31:[----] [--] 'sdhci: rename the hostctl1 register'
018/31:[down] 'sdhci: add the Broadcom BCM2835 SDHCI controller'
019/31:[down] 'hw/arm/bcm2835_peripherals: use the "brcm,bcm2835-sdhci" device'
020/31:[down] 'sdhci: add the Freescale controller for i.MX'
021/31:[down] 'hw/arm/fsl-imx6: use the "fsl,imx6q-usdhc" controller'
022/31:[down] 'sdhci: add the generic Arasan SDHCI 8.9a PHY'
023/31:[down] 'hw/arm/xilinx_zynqmp: use the "arasan,sdhci-8.9a" device'
024/31:[down] 'sdhci: let the SYSBUS_SDHCI type be abstract'
025/31:[----] [--] 'sdhci: check Spec v3 capabilities qtest'
026/31:[----] [-C] 'sdhci: remove the deprecated 'capareg' property'
027/31:[----] [--] 'sdhci: add check_capab_readonly() qtest'
028/31:[----] [--] 'sdhci: add a check_capab_baseclock() qtest'
029/31:[----] [--] 'sdhci: add a check_capab_sdma() qtest'
030/31:[----] [--] 'sdhci: add a check_capab_v3() qtest'
031/31:[----] [--] 'sdhci: add Spec v4.2 register definitions'

Philippe Mathieu-Daudé (30):
  sdhci: add a spec_version property
  sdhci: add basic Spec v1 capabilities
  sdhci: add max-block-length capability (Spec v1)
  sdhci: add clock capabilities (Spec v1)
  sdhci: add DMA and 64-bit capabilities (Spec v2)
  sdhci: add BLOCK_SIZE_MASK for DMA
  hw/sd: clean/reorder the Makefile adding few comments
  sdhci: add a common class
  sdhci: add a Designware/Samsung host controller
  hw/arm/exynos4210: use the "samsung,exynos4210-dw-mshc" device
  sdhci: add the generic Arasan SDHCI 4.9a PHY controller
  hw/arm/xilinx_zynq: use the "arasan,sdhci-4.9a" device
  sdhci: add qtest to check the SD Spec version
  sdhci: check Spec v2 capabilities qtest
  sdhci: add v3 capabilities
  sdhci: rename the hostctl1 register
  sdhci: add the Broadcom BCM2835 SDHCI controller
  hw/arm/bcm2835_peripherals: use the "brcm,bcm2835-sdhci" device
  sdhci: add the Freescale controller for i.MX
  hw/arm/fsl-imx6: use the "fsl,imx6q-usdhc" controller
  sdhci: add the generic Arasan SDHCI 8.9a PHY
  hw/arm/xilinx_zynqmp: use the "arasan,sdhci-8.9a" device
  sdhci: let the SYSBUS_SDHCI type be abstract
  sdhci: check Spec v3 capabilities qtest
  sdhci: remove the deprecated 'capareg' property
  sdhci: add check_capab_readonly() qtest
  sdhci: add a check_capab_baseclock() qtest
  sdhci: add a check_capab_sdma() qtest
  sdhci: add a check_capab_v3() qtest
  sdhci: add Spec v4.2 register definitions

Sai Pavan Boddu (1):
  sdhci: Fix 64-bit ADMA2

 include/hw/sd/sdhci.h        |  32 +++++-
 hw/sd/sdhci-internal.h       |  70 +++++++++++--
 hw/arm/bcm2835_peripherals.c |  19 +---
 hw/arm/exynos4210.c          |  12 +--
 hw/arm/fsl-imx6.c            |   2 +-
 hw/arm/xilinx_zynq.c         |  41 +++-----
 hw/arm/xlnx-zynqmp.c         |   2 +-
 hw/sd/arasan_sdhci.c         | 124 ++++++++++++++++++++++
 hw/sd/bcm2835_sdhci.c        |  77 ++++++++++++++
 hw/sd/dw-mshc.c              |  64 ++++++++++++
 hw/sd/fsl-sdhc.c             |  58 +++++++++++
 hw/sd/sdhci.c                | 240 ++++++++++++++++++++++++++-----------------
 hw/sd/Makefile.objs          |  14 ++-
 tests/sdhci-test.c           | 177 +++++++++++++++++++++++++++++++
 tests/Makefile.include       |   3 +
 15 files changed, 774 insertions(+), 161 deletions(-)
 create mode 100644 hw/sd/arasan_sdhci.c
 create mode 100644 hw/sd/bcm2835_sdhci.c
 create mode 100644 hw/sd/dw-mshc.c
 create mode 100644 hw/sd/fsl-sdhc.c
 create mode 100644 tests/sdhci-test.c

-- 
2.15.1

