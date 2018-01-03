Received: by 10.223.134.117 with SMTP id 50csp12239913wrw;
        Wed, 3 Jan 2018 10:39:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBosayRuQLCYv881ILYOu19MQ47KlfqkSMEfscYlfUrCaAdrRL+l4n1ib/hWHEtuyYEAGHfP9
X-Received: by 10.13.251.7 with SMTP id l7mr2097258ywf.406.1515004777252;
        Wed, 03 Jan 2018 10:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515004777; cv=none;
        d=google.com; s=arc-20160816;
        b=uFvJAR/4NWoAqMCDSMCLi3X/Q27QsaHpSUz6xP9PnnLFRe1EUrCrKE/OZkzWtjyOOA
         pkxAQEpk7HxurvZnPLfjKjA5VAe3TSGgs77B2YXarCYDUaU7CWHGecHB9N51K4Qtnsv6
         8ow6RZwepMHIZRsE/igYuZPq+tb08C7IHuN6avGMAUh/elEtEOTnkrg1FVcDqt3yfLs3
         oh2gfziZx8aqOBf9hdnSfXsjhHGjgeNrm9KA04sX85+5s4kXxtXpt4MHQJwfp21oI2nm
         XMRqXmo20ppepLAWcGvRV7u2e7WEpfhHfl4baiMeVOceiIdkswL8VhXcQLC565pLLlYY
         qOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=uUbBb7a2fDcsAQE72NNmKtvdyelkHEHjhaO4iv5Amo0=;
        b=zKLzulLhtyOzjfkTbAL0C/rH0WVi4hcCEjqFXHpCy7wD9sdv+5nWrPBZVeWRbckam2
         LhIb06C54wuaNvKwxKSVP4K9vABkxMXMADQXQmWC/75xtq71EcrOhBx+/0fbV7XguTox
         H53xXDoY5dSx4Ri0JcQbtLspZDuL5qR9gLh6EQltnDNArOuXWdoG6fz67ie8Kdb8ye3e
         UMxXqYwl6T4QlZyUy3BJKCFzgtDSjQccOqvjyPOeMYMPs2E1fQr8VEg7f6z8qH7EmMza
         LzTIJE0BApqdBSS12oX5+9zDIOsGWkByxrqd1E/+I5h8v3CU8iv+lLq+WT675c6uz5fD
         W5Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=StsSuyGG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si332074ybg.697.2018.01.03.10.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=StsSuyGG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWnwu-0006sa-LZ
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:39:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnrz-0002ub-H1
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:34:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnrv-0007A3-IP
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:34:31 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnrv-00079y-DH; Wed, 03 Jan 2018 13:34:27 -0500
Received: by mail-qt0-x242.google.com with SMTP id w10so3193420qtb.10;
	Wed, 03 Jan 2018 10:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uUbBb7a2fDcsAQE72NNmKtvdyelkHEHjhaO4iv5Amo0=;
	b=StsSuyGGOgiKGKKXhfGL9KECPwwFFiX8rgPZV16ENR8MRNLysBHM6eyugE9txezCco
	9jgGzkBjPd7sYlrsibfhZo0hDcoHOBP3oLguDsho615LqqsVrpecj0ylTKO9BGB3aB6S
	9S/CAe78Oy3f0/WO51ZqXfmFnDTR9FPT9nr3YJsqWllacWODXHWKuJZO4F3KLgmOXNtE
	rFdYsN9W2MVgX/6CAIu3zfrRjyjg/1Sp8kugUxzcVWG/qkhDvmfTneY0Gjy2LnDZMgdJ
	lQCDXQRCRhF7cOKoIFCweEp8EpykvaYdVDRcEPX0QFHQ2TaUYOQaR3aTK/ans3eHrmE6
	sWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=uUbBb7a2fDcsAQE72NNmKtvdyelkHEHjhaO4iv5Amo0=;
	b=f4l3Cv4p45S0yZSR04ztXOqKZhwlCH7obi2U475mtIB9cnQfg4IZH1brp23lEpDOsq
	sDrRCwdretKUcm7vcYqvgbTQU9W4ZOkh8+m6V5tuXnxdW/GL3+MNHxhYkatfxJGUhnJF
	TZNq4+UF5i/HkPIVJIda8MhTx1d2F0Z0Xw2bwWJDbj8mG0u30O/Mcqk5QZTotaVYOlco
	dQr+eNcSllBkkXXeyAfhOoNL34E0U302cXTNlmeyCHTJtWd21+Ft/bWntMwMNIdCr0iH
	d/hE8JgJWDqspp2jhPJygkaAepalK+/HK6kClQlI5SpPhXjxtTEIZQltwA922xxMpJz1
	ecQQ==
X-Gm-Message-State: AKGB3mK48cAcOW0icTZQw02MY1bNkW6RTBKRUMp6hENP6mgzoZdKyx1T
	7aV1YUiKBSd9cYG6UGSZVYw=
X-Received: by 10.200.8.197 with SMTP id y5mr2996298qth.17.1515004466757;
	Wed, 03 Jan 2018 10:34:26 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.34.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:34:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Prasad J Pandit <pjp@fedoraproject.org>
Date: Wed,  3 Jan 2018 15:33:53 -0300
Message-Id: <20180103183418.23730-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v4 00/25] SDHCI: add qtests and fix few issues
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mYALdPOAJpkF

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

$ git backport-diff # with v2
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/25:[down] 'sdhci: add a spec_version property'
002/25:[down] 'sdhci: add basic Spec v1 capabilities'
003/25:[down] 'sdhci: add max-block-length capability (Spec v1)'
004/25:[down] 'sdhci: add clock capabilities (Spec v1)'
005/25:[down] 'sdhci: add DMA and 64-bit capabilities (Spec v2)'
006/25:[down] 'sdhci: default to Spec v2'
007/25:[down] 'sdhci: add a 'dma' shortcut property'
008/25:[down] 'sdhci: add BLOCK_SIZE_MASK for DMA'
009/25:[down] 'sdhci: Fix 64-bit ADMA2'
010/25:[down] 'hw/arm/exynos4210: implement SDHCI Spec v2'
011/25:[down] 'hw/arm/xilinx_zynq: implement SDHCI Spec v2'
012/25:[0022] [FC] 'sdhci: add qtest to check the SD Spec version'
013/25:[down] 'sdhci: check Spec v2 capabilities qtest'
014/25:[down] 'sdhci: add v3 capabilities'
015/25:[down] 'sdhci: rename the hostctl1 register'
016/25:[down] 'hw/arm/bcm2835_peripherals: implement SDHCI Spec v3'
017/25:[down] 'hw/arm/fsl-imx6: implement SDHCI Spec v3'
018/25:[down] 'hw/arm/xilinx_zynqmp: implement SDHCI Spec v3'
019/25:[down] 'sdhci: check Spec v3 capabilities qtest'
020/25:[down] 'sdhci: remove the deprecated 'capareg' property'
021/25:[0008] [FC] 'sdhci: add check_capab_readonly() qtest'
022/25:[0009] [FC] 'sdhci: add a check_capab_baseclock() qtest'
023/25:[0011] [FC] 'sdhci: add a check_capab_sdma() qtest'
024/25:[----] [-C] 'sdhci: add a check_capab_v3() qtest'
025/25:[down] 'sdhci: add Spec v4.2 register definitions'

Philippe Mathieu-Daudé (24):
  sdhci: add a spec_version property
  sdhci: add basic Spec v1 capabilities
  sdhci: add max-block-length capability (Spec v1)
  sdhci: add clock capabilities (Spec v1)
  sdhci: add DMA and 64-bit capabilities (Spec v2)
  sdhci: default to Spec v2
  sdhci: add a 'dma' shortcut property
  sdhci: add BLOCK_SIZE_MASK for DMA
  hw/arm/exynos4210: implement SDHCI Spec v2
  hw/arm/xilinx_zynq: implement SDHCI Spec v2
  sdhci: add qtest to check the SD Spec version
  sdhci: check Spec v2 capabilities qtest
  sdhci: add v3 capabilities
  sdhci: rename the hostctl1 register
  hw/arm/bcm2835_peripherals: implement SDHCI Spec v3
  hw/arm/fsl-imx6: implement SDHCI Spec v3
  hw/arm/xilinx_zynqmp: implement SDHCI Spec v3
  sdhci: check Spec v3 capabilities qtest
  sdhci: remove the deprecated 'capareg' property
  sdhci: add check_capab_readonly() qtest
  sdhci: add a check_capab_baseclock() qtest
  sdhci: add a check_capab_sdma() qtest
  sdhci: add a check_capab_v3() qtest
  sdhci: add Spec v4.2 register definitions

Sai Pavan Boddu (1):
  sdhci: Fix 64-bit ADMA2

 include/hw/sd/sdhci.h        |  21 +++-
 hw/sd/sdhci-internal.h       |  70 +++++++++++--
 hw/arm/bcm2835_peripherals.c |  35 +++++--
 hw/arm/exynos4210.c          |  13 ++-
 hw/arm/fsl-imx6.c            |  12 +++
 hw/arm/xilinx_zynq.c         |  64 +++++++-----
 hw/arm/xlnx-zynqmp.c         |  38 +++++--
 hw/sd/sdhci.c                | 243 ++++++++++++++++++++++++++-----------------
 tests/sdhci-test.c           | 177 +++++++++++++++++++++++++++++++
 tests/Makefile.include       |   3 +
 10 files changed, 521 insertions(+), 155 deletions(-)
 create mode 100644 tests/sdhci-test.c

-- 
2.15.1

