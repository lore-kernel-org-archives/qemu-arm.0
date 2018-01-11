Received: by 10.28.173.206 with SMTP id w197csp1005237wme;
        Thu, 11 Jan 2018 12:57:02 -0800 (PST)
X-Google-Smtp-Source: ACJfBotTVKcGVaNcI2J3b9F50/qow1DyhzoEORQcXxBPWQElbySZX0/yqQYgBNBlql/BUxb+gXFs
X-Received: by 10.129.105.8 with SMTP id e8mr14408301ywc.505.1515704222649;
        Thu, 11 Jan 2018 12:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704222; cv=none;
        d=google.com; s=arc-20160816;
        b=RfL1ES+zxiGuHdCLoa141oCG02cVvSQ/K2+He1dQ84aHrCnr/RgAUNOO5ZgsN8YaUA
         wUR10yKcPH1m7xd5njcwDWc5wg7hBK9KUEKITN5nVyE5K+qcu3QNkGANLm6jyD8F9PZm
         jLe/agqGPUML/g0tdP/YyTTwJpqnATYgBIg5uAY/oIp26r1hVFy7+/Yhg8wl1oJFDmR1
         sjpiFUqq08Vh3G72nd74MGkeEXh7xUh1jfFOA2TTlTquSP82oSxCTY3kyeY/7ngxvEEq
         TaQiwt6Rph4KAGcoO6ayeaAzd6Z8CiMMYwjBfzrnZZtoqBjIonNFxCGlfH2Msvngg1KH
         K3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=fkKb8QeoGc8mK6Djg+EHigOOu0dSMwpnzR2atIolMVw=;
        b=XGZihUmf/+6MPdUWQYQS8yO0fy8lRogkwGGZwEW4mTTtTHAugCWKi0gJPTwwqrmCT8
         ErkY1P4rzfH0zB2H18BIdBoStq1YiLD4Z8/KgTtnoC8JAAlpEX7OFWj5/ofR9jkESu91
         SU5qwQQ6q4UDn12oO491yxK/EpetMaYirB997pHpLrFtO47yEZKEY1wXq2aC6jbPWR+n
         HyLjTw/FU3Kb6oOPSmzi9skx8UW8I/qpThtNkBkDBWeRvBDcdjbDKstDzkBOUEOfrfUi
         kS4/rDt3N7vsfKY2n6sMLl2OPCy54twJb19sc9RE28/KRpq+0iyOUVsxxKB0wZZ+eyli
         sgWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cqie/GUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s186si4295099ywf.278.2018.01.11.12.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 12:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Cqie/GUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjuI-0005Cg-3U
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 15:57:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju8-0005Ad-DD
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:56:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju7-0002Bg-72
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:56:52 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:45199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZju0-00028Q-Hk; Thu, 11 Jan 2018 15:56:44 -0500
Received: by mail-qk0-x243.google.com with SMTP id z12so6030629qkf.12;
	Thu, 11 Jan 2018 12:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=fkKb8QeoGc8mK6Djg+EHigOOu0dSMwpnzR2atIolMVw=;
	b=Cqie/GUS0CGyxmikO2Q5Cd0jBfvH3ouTULF8RUGj7EzbMkeaBU9HBJo4/l4pfupX7p
	XcoHgaddqu65K37QrjbFlY8F5aftimJze87TNcM76+UJtbb3gLTg9YqRpiW0qX2PmQPG
	096QcVuTmLA1+Nm9WCY+pLVY7R9jPnwC97cR8ErMFQoMwBNdZuQTSpC/4Y8fT0McJ22X
	+m+O6bPmARRYdecG2XsXHIjOr7X56Z+64499WByyV5CUi/9BCl9Ax6sqE6c3keYcPh1u
	bLRbqeotzYySUnn7pV9bP44WvK4sjttCfG5XZUTt63dgQjbzUqkaRfFX0y9ZJPwIOknx
	I7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=fkKb8QeoGc8mK6Djg+EHigOOu0dSMwpnzR2atIolMVw=;
	b=cUT/3BjTrl0cfk8hJbkV+PdhE3ff8VyBC/IE3jg+MziERM6qUwazNpDBodAp6pNC5H
	nQeg+deQ4L9X2SH+ojSGQEQY0Nb1TEtd+qpaXNNDVHUhHPyaXNigQtpPCuBRdbCz11Kq
	0QWxKxjdg7HftTxbSLXECo6yfLcDrcyhZp6ResNIZhSfH0AdYVxjKxrgaGCNvuerYCG5
	qFnch5pX4WK61j14VrFGhhCINeqfBnJ9yM3XlzByCQf94XCa0KTM7WKr8HnbEnCzhoXd
	pbPqV4GNSwZVSyx5MYIYfkSTRRU5Pg8R9lcpVPqnDsqcIcfGE8RPZ8LzaUCvFSdGYo3t
	Ssqw==
X-Gm-Message-State: AKwxytf/iSmksVUL6jNm1RUil5IcvKy47xN6d+GnHx9eyQb9CEJassIa
	iyiAI0WZV4FFiTj8azsAUbE=
X-Received: by 10.55.78.143 with SMTP id c137mr34947818qkb.122.1515704203786; 
	Thu, 11 Jan 2018 12:56:43 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.56.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:56:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:05 -0300
Message-Id: <20180111205626.23291-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [PATCH v6 00/21] SDHCI: clean Specs v1/v2,
 implement Spec v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9IoANGDtFa9W

Since v5:
- addressed Alistair reviews
- dropped "abstract generic-sdhci"
- dropped Linux Device Tree names
- split qtests in another series
- change the bcm2835 minimum blocksize to 1KB (Andrew Baumann)
- added Alistair R-b
- based on Alistair work:
  - add SD tunning sequence via Host Control 2 to use UHS-I cards
  - add CMD/DAT[] fields in the Present State (used in next series
    to switch card voltage)

based on Alistair work:
- add SD tunning sequence via Host Control 2 to use UHS-I cards
- add CMD/DAT[] fields in the Present State (used in next series
  to switch card voltage)

Since v4 ("SDHCI: add qtests and fix few issues"):
- spec_version default to v2 (current behaviour)
- addressed Alistair review (no v1, tell user about valid version)

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

$ git backport-diff # with v4
001/21:[0007] [FC] 'sdhci: add a 'spec_version property' (default to v2)'
002/21:[0005] [FC] 'sdhci: add basic Spec v1 capabilities'
003/21:[----] [-C] 'sdhci: add max-block-length capability (Spec v1)'
004/21:[0003] [FC] 'sdhci: add clock capabilities (Spec v1)'
005/21:[0004] [FC] 'sdhci: add DMA and 64-bit capabilities (Spec v2)'
006/21:[----] [--] 'sdhci: add BLOCK_SIZE_MASK for DMA'
007/21:[----] [--] 'sdhci: Fix 64-bit ADMA2'
008/21:[0008] [FC] 'sdhci: add v3 capabilities'
009/21:[0002] [FC] 'sdhci: rename the hostctl1 register'
010/21:[----] [--] 'hw/arm/exynos4210: implement SDHCI Spec v2'
011/21:[----] [--] 'hw/arm/xilinx_zynq: implement SDHCI Spec v2'
012/21:[0007] [FC] 'hw/arm/bcm2835_peripherals: implement SDHCI Spec v3'
013/21:[down] 'hw/arm/bcm2835_peripherals: change maximum block size to 1kB'
014/21:[0003] [FC] 'hw/arm/fsl-imx6: implement SDHCI Spec v3'
015/21:[----] [--] 'hw/arm/xilinx_zynqmp: implement SDHCI Spec v3'
016/21:[----] [-C] 'sdhci: remove the deprecated 'capareg' property'
017/21:[----] [--] 'sdhci: add Spec v4.2 register definitions'
018/21:[down] 'sdhci: implement the Host Control 2 register for the tunning sequence'
019/21:[down] 'sdbus: add trace events'
020/21:[down] 'sdhci: implement UHS-I voltage switch'
021/21:[down] 'sdhci: implement CMD/DAT[] fields in the Present State register'

Based-on: 20180111193021.17466-14-f4bug@amsat.org

Philippe Mathieu-Daudé (20):
  sdhci: sdhci: add a 'spec_version property' (default to v2)
  sdhci: add basic Spec v1 capabilities
  sdhci: add max-block-length capability (Spec v1)
  sdhci: add clock capabilities (Spec v1)
  sdhci: add DMA and 64-bit capabilities (Spec v2)
  sdhci: add BLOCK_SIZE_MASK for DMA
  sdhci: add v3 capabilities
  sdhci: rename the hostctl1 register
  hw/arm/exynos4210: implement SDHCI Spec v2
  hw/arm/xilinx_zynq: implement SDHCI Spec v2
  hw/arm/bcm2835_peripherals: implement SDHCI Spec v3
  hw/arm/bcm2835_peripherals: change maximum block size to 1kB
  hw/arm/fsl-imx6: implement SDHCI Spec v3
  hw/arm/xilinx_zynqmp: implement SDHCI Spec v3
  sdhci: remove the deprecated 'capareg' property
  sdhci: add Spec v4.2 register definitions
  sdhci: implement the Host Control 2 register for the tunning sequence
  sdbus: add trace events
  sdhci: implement UHS-I voltage switch
  sdhci: implement CMD/DAT[] fields in the Present State register

Sai Pavan Boddu (1):
  sdhci: Fix 64-bit ADMA2

 hw/sd/sdhci-internal.h       |  74 ++++++++++--
 include/hw/sd/sd.h           |  20 ++++
 include/hw/sd/sdhci.h        |  21 +++-
 hw/arm/bcm2835_peripherals.c |  33 ++++--
 hw/arm/exynos4210.c          |  13 +-
 hw/arm/fsl-imx6.c            |  13 ++
 hw/arm/xilinx_zynq.c         |  64 ++++++----
 hw/arm/xlnx-zynqmp.c         |  38 ++++--
 hw/sd/core.c                 |  61 +++++++++-
 hw/sd/sd.c                   |  29 +++++
 hw/sd/sdhci.c                | 274 ++++++++++++++++++++++++++++---------------
 hw/sd/trace-events           |   8 ++
 12 files changed, 490 insertions(+), 158 deletions(-)

-- 
2.15.1

