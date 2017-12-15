Received: by 10.223.159.74 with SMTP id f10csp7090062wrg;
        Thu, 14 Dec 2017 19:16:23 -0800 (PST)
X-Google-Smtp-Source: ACJfBouoNoLQv3FjxJY8odV1CeNfYt2JQDK0dsyGcIoVtcs+nMH9F1tyLa8NZL4uFGMbS0n7GJBX
X-Received: by 10.37.130.68 with SMTP id d4mr6195175ybn.249.1513307783722;
        Thu, 14 Dec 2017 19:16:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513307783; cv=none;
        d=google.com; s=arc-20160816;
        b=uOaOGFyyILM4WdlU5zS4sht4gOpT8hL4h9JBOe3V3/1Nu+63ZNaIirQjeBrmrDW3Bo
         4uVjHY1zpq16r3yPhYnWImgY5FWOelLD1PtmMIdiOO9RDvHQrvFTe4wPvVXLoNPlZW8k
         jyY/Pp+Ue/4TpxFWeQuLqRfwI9dUQaXRL+EnFB0jGJ6nOOFjeV8v6KdrFg5OHjQIWFZF
         AqyqcbGbAA95ylaAMdD6v0Z+U0n0TKDF+gyd/e3GK2w0YC4DZRqBmxWeS7fPiSd0Kd1T
         enVGmI4/duxIA0mWTzsSXrug0Tx4RIM6JnHEHCTjU1MGKMO1TJptatzXQ5d858/8/z1W
         shDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=oi9w4kyFKU1pbAGu+spl/Q1cfgLPFo6dsaIGHf3Zgh8=;
        b=rIkj6rVrc6Kh4i+sQsBDYxwGMvDbFvM+PB+zS6Y5q1ZDJBKpdb/TlzFNkVVV8czdPu
         nuHRTNxgPVZLIlLxpfQpFk19509UEQN1QgcxSCoiBXIVHtHiLt0qN1hgb0XiOWkYlWUj
         FSzvZw8sEkjb4bDmu46dcmrcG/ZQoRbcNzF56/AHBFVjc2jZzUJ/zZXJFY3QtIZQRcCO
         wsOUaAjZ7KyIBq2Flij2TgYJ9kDzhSknBr1n3gAFRk9R/GPJU6m+6JdjpePvK8hqHMKA
         yQMggD71S618Zj6e6NEFF0mmknqE6S3E4pJjuTjWU8Z4dZjxzZJCYNMRyQKGUx749SE1
         STIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsxXr0GS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63si1081780ywt.548.2017.12.14.19.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 19:16:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AsxXr0GS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePgU3-0005Vh-3R
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 22:16:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTo-0005UC-NO
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTn-0000gY-Cm
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 22:16:08 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgTi-0000cr-JP; Thu, 14 Dec 2017 22:16:02 -0500
Received: by mail-qt0-x243.google.com with SMTP id g10so10521695qtj.12;
	Thu, 14 Dec 2017 19:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oi9w4kyFKU1pbAGu+spl/Q1cfgLPFo6dsaIGHf3Zgh8=;
	b=AsxXr0GSTuRGyl4ekk72spBP6c8lfAJzi2XLzKFRdFBvOZnYIjco3ReL993Tbqf9oH
	HKqwTaT3uVWm+zOSdOboVsaQNteEXCdB+ppIKt5w4HRlA0ysiO6bAfurCCowqUXn2LpB
	VrRJa4wDUJrCuHplmbTW5APs9VgEHq83Mz/pA4Xkdrf1Yq1LGlPrPgZj2b2e6ekSc1Dh
	DyeeRtRuSONwOd4XVSn0paX4hnoD7rt/I2RM6F1QEHivlWNEVbY7hi9QyBqVs6SMHbay
	xG38zscpBxBqXdK6mwjUnTd5JkPIDUFsaj0jpFRHdf2IQi9GTiEwGrelmaI7v6XwheP/
	uy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=oi9w4kyFKU1pbAGu+spl/Q1cfgLPFo6dsaIGHf3Zgh8=;
	b=MndcYtX4dm0ZZVTw+XoBnWpuaOyQctgHYEkVBDpHE2yGeJ2firFPnZEWI+YAw8JgHz
	62mQLhmZBrL3y3oBic76sROChLsgMxLg4uP3uDSKrEefA7kajrmDAEWbN+2OFursE9uL
	/HLb2BU0jQvGryMPdNBr7bscVGFkebyEw0rYGMH33Tsrb926oD+mK3pl9vUeiX5R5PTa
	NTAXW1BAUZmWI4ef5DtXg3jKOoguxMuzt7HsbT1vdzx88iJzSHW80bV5O4YCk4u+Lvm8
	7w/HvZ8gUjWsDJBMU5msTpkJLPMS19uYi0XeWgOOmMQtgU0WZ449WS+J3Fp3YWb/M5ya
	ahtA==
X-Gm-Message-State: AKGB3mKCcK9kjCnEJ4drvtFDSfLrh5xEviETS0k4Nnewb1k/2LgukxPL
	ezFqjQ9iCULaRdYaJIoV4B4=
X-Received: by 10.200.24.58 with SMTP id q55mr20454675qtj.184.1513307762012;
	Thu, 14 Dec 2017 19:16:02 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	l125sm3484740qkc.3.2017.12.14.19.15.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:16:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Fri, 15 Dec 2017 00:15:27 -0300
Message-Id: <20171215031547.31006-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v2 00/20] SDHCI: housekeeping,
 add a qtest and fix few issues
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rKcqAnssL76V

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

001/20:[----] [-C] 'sdhci: clean up includes'
002/20:[0004] [FC] 'sdhci: use deposit64()'
003/20:[----] [--] 'sdhci: move MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"'
004/20:[----] [--] 'sdhci: refactor same sysbus/pci properties into a common one'
005/20:[----] [--] 'sdhci: refactor common sysbus/pci realize() into sdhci_realizefn()'
006/20:[----] [--] 'sdhci: refactor common sysbus/pci class_init() into sdhci_class_init()'
007/20:[0001] [FC] 'sdhci: refactor common sysbus/pci unrealize() into sdhci_unrealizefn()'
008/20:[----] [--] 'sdhci: use qemu_log_mask(UNIMP) instead of fprintf()'
009/20:[0004] [FC] 'sdhci: convert the DPRINT() calls into trace events'
010/20:[down] 'sdhci: add a GPIO for the access control LED'
011/20:[0032] [FC] 'sdhci: add a "dma-memory" property'
012/20:[0006] [FC] 'sdhci: fix CAPAB/MAXCURR registers, both are 64bit and read-only'
013/20:[down] 'sdhci: Implement write method of ACMD12ERRSTS register'
014/20:[----] [-C] 'sdhci: add a "sd-spec-version" property'
015/20:[----] [-C] 'sdhci: some ARM boards do support SD_HOST_SPECv3_VERS'
016/20:[0001] [FC] 'sdhci: add qtest to check the SD Spec version'
017/20:[----] [--] 'sdhci: add check_capab_readonly() qtest'
018/20:[----] [--] 'sdhci: add a check_capab_baseclock() qtest'
019/20:[----] [--] 'sdhci: add a check_capab_sdma() qtest'
020/20:[----] [--] 'sdhci: add a check_capab_v3() qtest'

Based-on: 20171213051736.17755-5-f4bug@amsat.org
          (Trivial changes in "registerfields.h")

Andrey Smirnov (1):
  sdhci: Implement write method of ACMD12ERRSTS register

Philippe Mathieu-Daudé (19):
  sdhci: clean up includes
  sdhci: use deposit64()
  sdhci: move MASK_TRNMOD with other SDHC_TRN* defines in "sd-internal.h"
  sdhci: refactor same sysbus/pci properties into a common one
  sdhci: refactor common sysbus/pci realize() into sdhci_realizefn()
  sdhci: refactor common sysbus/pci class_init() into sdhci_class_init()
  sdhci: refactor common sysbus/pci unrealize() into sdhci_unrealizefn()
  sdhci: use qemu_log_mask(UNIMP) instead of fprintf()
  sdhci: convert the DPRINT() calls into trace events
  sdhci: add a GPIO for the access control LED
  sdhci: add a "dma-memory" property
  sdhci: fix CAPAB/MAXCURR registers, both are 64bit and read-only
  sdhci: add a "sd-spec-version" property
  sdhci: some ARM boards do support SD_HOST_SPECv3_VERS
  sdhci: add qtest to check the SD Spec version
  sdhci: add check_capab_readonly() qtest
  sdhci: add a check_capab_baseclock() qtest
  sdhci: add a check_capab_sdma() qtest
  sdhci: add a check_capab_v3() qtest

 include/hw/sd/sdhci.h        |  22 +++-
 hw/sd/sdhci-internal.h       |   9 +-
 hw/arm/bcm2835_peripherals.c |   7 ++
 hw/arm/fsl-imx6.c            |   6 +
 hw/arm/xilinx_zynq.c         |   2 +
 hw/sd/sdhci.c                | 267 +++++++++++++++++++++++++------------------
 hw/sd/trace-events           |  15 +++
 tests/sdhci-test.c           | 152 ++++++++++++++++++++++++
 tests/Makefile.include       |   2 +
 9 files changed, 359 insertions(+), 123 deletions(-)
 create mode 100644 tests/sdhci-test.c

-- 
2.15.1

