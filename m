Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3998553wru;
        Mon, 30 Jul 2018 10:03:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcmDdMcA53yZGmu6tHmMOiE4ySZEdlCQ/fBDKD0TC14rNLTH/OAU60B0v3YfKYVIVgmE7BP
X-Received: by 2002:a37:bac7:: with SMTP id k190-v6mr8385564qkf.138.1532970197274;
        Mon, 30 Jul 2018 10:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532970197; cv=none;
        d=google.com; s=arc-20160816;
        b=fOt/5MOepkgUcWGlHSD20b0Rza86T0PaL+1xIFoh/e29LVKozwz8gpdD3St+HmkTSj
         8mfa/i/4Tt3j0v5LuCWWbW/pupsisFMJg3ftteTx0in6vTIOUzr35nwGYTMdH/6PZwHi
         TGamMz0fefdCWXAUPES5EFEuz7gncC33x6eD6ZnnuMZmNFnUQK2USnjSwbnAPyFpcYlF
         9Ub6gsYBsaJCqBLQUNIFsCtCKo/sKGpwKQ1oJKVt0mrahxZB0pCwL+HIT618kgAtUrbm
         PJllllh0s6+cMycpOkJWS2ztMY0Ewr0Oe/SrfRDFc9lNyMbNoNadi29DZKLehY51L3y1
         SMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=AUpfJgDfKSN2M4fFTg7Zem1kihLJpnhiHqGPfQu5YqQ=;
        b=enzlvlBP0Vj0p8/62WTpNkfa/2xwaojWuZ5bmxCBcmhyIsUWnidqR2JwCfaZjRomn8
         eXJ0KwgS/YY4Nvf7iS2WdXoFDuMHZumYyFRyWR3U2FeWsGnOFfceHts05gYtJIZVPlim
         HTdpNIXW0LAwAYYLTIJRPVmDa7QsUBn+Rd8rzc3MKIe296vqO5XPyKrS8nhwB+U72OEo
         unimgV3VUoCvy4qsv+aUs7ngURicsE5Of+B0OAopqvFAykk1EARr83ZUiuKRC0SeAh5F
         31JJmx5sL0aADDl0/hdvc/zwbXCWNTLo+LdREXHYRZb5XBYZ5EJSTpnAwD0j3VcZEMZa
         m7nA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w31-v6si642348qtg.3.2018.07.30.10.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkBZk-0000mV-F1
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:03:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAyn-0001J5-Ok
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fkAym-0001Bn-Lm
	for qemu-devel@nongnu.org; Mon, 30 Jul 2018 12:25:05 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fkAyj-00019i-QN; Mon, 30 Jul 2018 12:25:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fkAyh-0004KA-6o; Mon, 30 Jul 2018 17:24:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 30 Jul 2018 17:24:53 +0100
Message-Id: <20180730162458.23186-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 0/5] mps2: Implement FPGAIO counters and
 dual-timer
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yyFHwSo9PlMI

This patchset adds some missing timer and counter devices
to the MPS2 boards:

 * the MPS2 "fpgaio" register bank includes some registers
   which provide various kinds of free-running counter
 * the boards have an instance fo the CMSDK "dual timer module"

Together these are sufficient for QEMU's mps2-an505
emulation to pass the "timer test" subsection of the
self-test program which can be found (behind a clickthrough
EULA) in the Cortex-M33_IoT_kit_2_0.zip at:
 https://developer.arm.com/products/system-design/development-boards/fpga-prototyping-boards/download-fpga-images

The dual-timer patch ended up a bit big; I can try to split
that up if people would prefer that for review.

thanks
-- PMM

Peter Maydell (5):
  hw/misc/mps2-fpgaio: Implement 1Hz and 100Hz counters
  hw/misc/mps2-fpgaio: Implement PSCNTR and COUNTER
  hw/timer/cmsdk-apb-dualtimer: Implement CMSDK dual timer module
  hw/arm/iotkit: Wire up the dualtimer
  hw/arm/mps2: Wire up dual-timer in mps2-an385 and mps2-an511

 hw/timer/Makefile.objs                 |   1 +
 include/hw/arm/iotkit.h                |   3 +-
 include/hw/misc/mps2-fpgaio.h          |  10 +
 include/hw/timer/cmsdk-apb-dualtimer.h |  72 ++++
 hw/arm/iotkit.c                        |   8 +-
 hw/arm/mps2.c                          |  11 +
 hw/misc/mps2-fpgaio.c                  | 146 ++++++-
 hw/timer/cmsdk-apb-dualtimer.c         | 515 +++++++++++++++++++++++++
 MAINTAINERS                            |   2 +
 default-configs/arm-softmmu.mak        |   1 +
 hw/timer/trace-events                  |   5 +
 11 files changed, 767 insertions(+), 7 deletions(-)
 create mode 100644 include/hw/timer/cmsdk-apb-dualtimer.h
 create mode 100644 hw/timer/cmsdk-apb-dualtimer.c

-- 
2.17.1

