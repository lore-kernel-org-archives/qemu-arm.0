Received: by 10.28.71.27 with SMTP id u27csp1158720wma;
        Fri, 9 Feb 2018 08:58:40 -0800 (PST)
X-Google-Smtp-Source: AH8x224ve/45V4UuZXeak3W1pKxa7dFxcuoC6OjC2CQ9Mj17AwTy257woeXsL+d/Kn1L9eUcpQdx
X-Received: by 10.37.196.133 with SMTP id u127mr2303391ybf.10.1518195520552;
        Fri, 09 Feb 2018 08:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518195520; cv=none;
        d=google.com; s=arc-20160816;
        b=rO/kRF5NNVuHbgXk6N0lXAG5I3jXFklLmKYKXkBMfZ0z//nh4F3WeuGUB3xWl70oZQ
         XN7gAtkxg/blMLEiAkcr0Cs+1pLKe0jZF2YFCznOCCsX68RGwspR5EiOzy8PDjdsI3al
         Y1l9OCP+nMdtXFl6sBf+smTWJybLkDE2NbhQhchl5esFpUFUeH5spBGeIHkjZBsgJvJ1
         VVlg9lXN0Ctf5ygQ7ZmzA5V0bbX418MYb7N5gNAvnq4kyiOzbYlTXGM3HSqXvAtgV7if
         k8blzmoZ7ZXl6QozyPG0RlkwlHvNwJ8hmLb5AlP4kYFDToxJxHSrtQrsy9NOet0tMQBu
         7ceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=nsBKBcvT9fOOIQAMYM5K3Uzzx2jj37iwATt9cwFRwO0=;
        b=jW/Pn1Mo1tS7duvamVwEsVkZYuMIgiWlkpEOd1q3u9zeoC/rzodvOwWgHQQgMJIEJk
         WDj9IFbaCjrNuN+m3s83D3DYQPaTtUcnK84sEZpp7ICQY16iXTabj7id7L9UwlFIxJLv
         6L03YUfrJpy5SQl57UkU5PFCTgq/I2kAF9aMTjcU4MsRbnU1ZaEGP4Xouo0lZJVrsuNw
         jYfG2c0sH91qKKdD5McV2xVH5QYexSAMBcDtB+t53MpjpSb7xEUEkuPtFSARWD/DXlc+
         UtptXnQ9fJzYp9v/hfWboUgc0Q6siF2jjm2OUpxFPOIf3MmkFfkd1Ree9a3ixlBvP+Xo
         nNWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m2si480474ywi.502.2018.02.09.08.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 08:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekC0W-0003xj-1q
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 11:58:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC07-0003rz-TH
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ekC07-0007gq-6Q
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 11:58:15 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ekC06-0007fy-VL; Fri, 09 Feb 2018 11:58:15 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ekC04-0002z5-0C; Fri, 09 Feb 2018 16:58:12 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Feb 2018 16:57:59 +0000
Message-Id: <20180209165810.6668-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 00/11] v8m: minor missing regs and bugfixes
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUCfSzf8HQ2A

This patchset is the result of comparing the registers
listed in the v8M Arm ARM against what QEMU was implementing.
It adds a collection of generally unexciting missing registers
(most of which we can simply NOP or make reads-as-written).
There are also a couple of bug fixes in there, of which the
worst is the byte-to-interrupt-number conversions being
completely wrong in several places.

Version 2 adds 3 new patches at the end:
 * we had a couple of things we were forgetting to migrate
 * implementation of MSPLIM and PSPLIM, which were the missing
   special registers

I've updated the cache ID registers patch to use some constants
for register bit fields; otherwise the first 8 patches are the
same as v1. The derived-exceptions patches are in master now,
so this should apply to master.

thanks
-- PMM

Peter Maydell (11):
  hw/intc/armv7m_nvic: Don't hardcode M profile ID registers in NVIC
  hw/intc/armv7m_nvic: Fix ICSR PENDNMISET/CLR handling
  hw/intc/armv7m_nvic: Implement M profile cache maintenance ops
  hw/intc/armv7m_nvic: Implement v8M CPPWR register
  hw/intc/armv7m_nvic: Implement cache ID registers
  hw/intc/armv7m_nvic: Implement SCR
  target/arm: Implement writing to CONTROL_NS for v8M
  hw/intc/armv7m_nvic: Fix byte-to-interrupt number conversions
  target/arm: Add AIRCR to vmstate struct
  target/arm: Migrate v7m.other_sp
  target/arm: Implement v8M MSPLIM and PSPLIM registers

 target/arm/cpu.h      | 35 ++++++++++++++++++
 hw/intc/armv7m_nvic.c | 98 ++++++++++++++++++++++++++++++++++++++-------------
 target/arm/cpu.c      | 28 +++++++++++++++
 target/arm/helper.c   | 56 +++++++++++++++++++++++++++++
 target/arm/machine.c  | 84 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 276 insertions(+), 25 deletions(-)

-- 
2.16.1

