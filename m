Received: by 10.223.134.117 with SMTP id 50csp6995807wrw;
        Fri, 29 Dec 2017 09:50:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBotaHUgUJgb5NL3LU6Ak5+B1yGxFNOIM8WH7Ks869fFSVB0H3hLWw7xSWdks2DbhcRc4nsLu
X-Received: by 10.37.37.12 with SMTP id l12mr14607065ybl.283.1514569830307;
        Fri, 29 Dec 2017 09:50:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514569830; cv=none;
        d=google.com; s=arc-20160816;
        b=zJkuUB49fH8SMSI0ZMKJDu1V03rg3ZSqRQLHTDyL8aSfM0c/rRHY4vGM8Ji4J3VWjO
         lam3YZNAKRQ32QepJBr1nfW4IdmZLURbjZaX2dlSeJPjL7P1sFtWb7+7MSy/Bx/EvgYA
         m0vrqDolMdtRlZNMWphcPTA1VeKFs3HEMtrTlC2LPs/HfQO0ZJIa0Zig7y4Lu7FsxTP7
         OhaBRioubJRdK7fSdXLPhCKtfYB8ax9IyBgB/4Tg3LQBzcKYcQOHwNxq+lVxqLpuylyR
         XssDnX4kXkhcHRfUKS5/iMqDQdVpLvHjojfwIm5hYFJSOk1RPIft9WK3LtuzwYI27zmU
         XHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=2x8pd2gIcBY81vc0q/y/rTQLoztgYMSkplzmMhBE0Xc=;
        b=rtnPIyfPMoLTjkZqvQ1X3E7r5PS4cOqdgA0y38BYAdwDP8tK5K9akaLHMvo9Cuy2PD
         bRd/V2FhfGo9x6c7wiNDspphQbNl1L2ybp0DSmsyzxvlHZF6TqrTfU4zyDMwVh33wE+c
         /PQ5b9zRIUQlFTCYtqDvN8Awk3IjttdiENXlmgAPG9qkEEn4/oOvxsHTg4rHffxVtdig
         D0BPtofqy7eiATvlQpqHkfQ5liRnjVpmUxG0VSjWDoIuVTCe2ruXnxvaQPT2ujC1XbCm
         UYoZz7g4QCY6IZLOtg4dgCOIEITQM5xMMiq/94EAtcQdYyFq1CY9Vhtva1dlvcJDq66c
         QcVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fm1ex4BB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f64si1610512ybb.771.2017.12.29.09.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 09:50:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fm1ex4BB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUynd-0002lE-Mu
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 12:50:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyn3-0002iH-45
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:49:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyn0-00057S-1K
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:49:53 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:39566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUymz-00056g-Qo; Fri, 29 Dec 2017 12:49:49 -0500
Received: by mail-qk0-x244.google.com with SMTP id u184so53569362qkd.6;
	Fri, 29 Dec 2017 09:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2x8pd2gIcBY81vc0q/y/rTQLoztgYMSkplzmMhBE0Xc=;
	b=fm1ex4BBOw5I0ppcbf7QbL0SRvpcRDUpNjbcKBHw9MZgTHJZOu0KAWtPlWnUCxgAxI
	gp6PLPbbHWLjdmnDL7eXLYOtNAp66cKdTNZi0+8KqNDrU1AEpo5rdRB7CLjmQdMXz/eQ
	M/BK5K+8ILGqewPiyxhwi9PXhYZ7Ueb76tMU4slHrcq5FkI2QIvlDrrEYvdcihLjQjSZ
	mr/qm8sBzRzPtKZao3AQykPvxDJPHTT9j97CJhATpA4p/6xo18anALo0HpUMjQGa5i9j
	gDwrscYeBcEhoWbqqun5MRT83p5tYJThL7K20Q2PMXC84HkRS2ADfiiMk9ifxJ5CtGAI
	IioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=2x8pd2gIcBY81vc0q/y/rTQLoztgYMSkplzmMhBE0Xc=;
	b=BaDip0DG/fyLDT5flcHq28HeGit4uEZq/XV3B5f3mSz895zjd8lA98McLv6t7Kdgj8
	bOaSRZdLfGPv9mc/eIKh2w4ug/QXb3zNchUiaPgzLehjUtudx1q+/xtzUz7KzNVa6Ctu
	hvXS5kXb5q6+qdSu9kpZMxaSsMsrhKC2Y+9JyIJe3Nl085HOWPL/Q2/u+HZKKTSZGUgw
	eF/yrV5tkMtlDaZY/HrxmKY42qp9pkK5Vts0k03p9P8twp2ZEwY/zaHnOyCjngfa0COv
	Pf7oSvqMIVBqQt2xM6sfZ8V2Q7PAsA+0UfodOAf9iBolzNnCqmZ/ceQvxKQwtQYnzAIG
	CGJQ==
X-Gm-Message-State: AKGB3mIpBlAby5vFjQXX/pFA7Ddl5vipghRsA2YNxZNpl9me+a9sfQpy
	cxve3W3c8Pbs+aKirxdEo5w=
X-Received: by 10.55.212.204 with SMTP id s73mr37091145qks.142.1514569788965; 
	Fri, 29 Dec 2017 09:49:48 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.49.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:49:48 -0800 (PST)
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
Date: Fri, 29 Dec 2017 14:48:51 -0300
Message-Id: <20171229174933.1781-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v3 00/42] SDHCI: housekeeping,
 add a qtest and fix few issues
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
X-TUID: qs2tYNxyJzAx

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

$ git backport-diff
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/42:[0003] [FC] 'sdhci: clean up includes'
002/42:[down] 'sdhci: sort registers comments'
003/42:[down] 'sdhci: remove dead code'
004/42:[----] [--] 'sdhci: refactor same sysbus/pci properties'
005/42:[----] [--] 'sdhci: refactor common sysbus/pci class_init()'
006/42:[----] [--] 'sdhci: refactor common sysbus/pci realize()'
007/42:[0001] [FC] 'sdhci: refactor common sysbus/pci unrealize()'
008/42:[----] [--] 'sdhci: use qemu_log_mask(UNIMP) instead of fprintf()'
009/42:[----] [--] 'sdhci: convert the DPRINT() calls into trace events'
010/42:[down] 'sdhci: add a GPIO for the 'access control' LED'
011/42:[----] [--] 'sdhci: move MASK_TRNMOD with other SDHC_TRN* defines'
012/42:[down] 'sdhci: use FIELD_DP32() macro for the WRITE_PROTECT flag'
013/42:[down] 'sdhci: rename the SDHC_CAPAB register'
014/42:[0008] [FC] 'sdhci: fix CAPAB/MAXCURR registers, 64bit and read-only'
015/42:[----] [-C] 'sdhci: Implement write method of ACMD12ERRSTS register'
016/42:[down] 'sdhci: use deposit64() on admasysaddr'
017/42:[----] [-C] 'sdhci: add a "dma-memory" property'
018/42:[down] 'sdhci: add a spec_version property'
019/42:[down] 'sdhci: add basic Spec v1 capabilities'
020/42:[down] 'sdhci: add max-block-length capability (Spec v1)'
021/42:[down] 'sdhci: add clock capabilities (Spec v1)'
022/42:[down] 'sdhci: add DMA and 64-bit capabilities (Spec v2)'
023/42:[down] 'sdhci: default to Spec v2'
024/42:[down] 'sdhci: add a 'dma' shortcut property'
025/42:[down] 'sdhci: add BLOCK_SIZE_MASK for DMA'
026/42:[down] 'sdhci: Fix 64-bit ADMA2'
027/42:[down] 'hw/arm/exynos4210: implement SDHCI Spec v2'
028/42:[down] 'hw/arm/xilinx_zynq: implement SDHCI Spec v2'
029/42:[0022] [FC] 'sdhci: add qtest to check the SD Spec version'
030/42:[down] 'sdhci: check Spec v2 capabilities qtest'
031/42:[down] 'sdhci: add v3 capabilities'
032/42:[down] 'sdhci: rename the hostctl1 register'
033/42:[down] 'hw/arm/bcm2835_peripherals: implement SDHCI Spec v3'
034/42:[down] 'hw/arm/fsl-imx6: implement SDHCI Spec v3'
035/42:[down] 'hw/arm/xilinx_zynqmp: implement SDHCI Spec v3'
036/42:[down] 'sdhci: check Spec v3 capabilities qtest'
037/42:[down] 'sdhci: remove the deprecated 'capareg' property'
038/42:[0008] [FC] 'sdhci: add check_capab_readonly() qtest'
039/42:[0009] [FC] 'sdhci: add a check_capab_baseclock() qtest'
040/42:[0011] [FC] 'sdhci: add a check_capab_sdma() qtest'
041/42:[----] [-C] 'sdhci: add a check_capab_v3() qtest'
042/42:[down] 'sdhci: add Spec v4.2 register definitions'

Andrey Smirnov (1):
  sdhci: Implement write method of ACMD12ERRSTS register

Philippe Mathieu-Daudé (40):
  sdhci: clean up includes
  sdhci: sort registers comments
  sdhci: remove dead code
  sdhci: refactor same sysbus/pci properties into a common one
  sdhci: refactor common sysbus/pci class_init() into sdhci_class_init()
  sdhci: refactor common sysbus/pci realize() into sdhci_realizefn()
  sdhci: refactor common sysbus/pci unrealize() into sdhci_unrealizefn()
  sdhci: use qemu_log_mask(UNIMP) instead of fprintf()
  sdhci: convert the DPRINT() calls into trace events
  sdhci: add a GPIO for the 'access control' LED
  sdhci: move MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"
  sdhci: use FIELD_DP32() macro for the WRITE_PROTECT flag
  sdhci: rename the SDHC_CAPAB register
  sdhci: fix CAPAB/MAXCURR registers, both are 64bit and read-only
  sdhci: use deposit64() on admasysaddr
  sdhci: add a "dma-memory" property
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

 include/hw/sd/sdhci.h        |  59 ++++-
 hw/sd/sdhci-internal.h       |  81 +++++--
 hw/arm/bcm2835_peripherals.c |  35 ++-
 hw/arm/exynos4210.c          |  13 +-
 hw/arm/fsl-imx6.c            |  12 +
 hw/arm/xilinx_zynq.c         |  64 ++++--
 hw/arm/xlnx-zynqmp.c         |  38 +++-
 hw/sd/sdhci.c                | 513 +++++++++++++++++++++++++------------------
 tests/sdhci-test.c           | 177 +++++++++++++++
 hw/sd/trace-events           |  15 ++
 tests/Makefile.include       |   3 +
 11 files changed, 718 insertions(+), 292 deletions(-)
 create mode 100644 tests/sdhci-test.c

-- 
2.15.1

