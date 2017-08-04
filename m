Received: by 10.25.221.202 with SMTP id w71csp2345691lfi;
        Fri, 4 Aug 2017 10:21:09 -0700 (PDT)
X-Received: by 10.200.42.181 with SMTP id b50mr4033324qta.224.1501867269580;
        Fri, 04 Aug 2017 10:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501867269; cv=none;
        d=google.com; s=arc-20160816;
        b=VQKoH1wyZAhhJvFMJ/+zUxWzaRDMZ9HEOt57bP5dBWRonb3WvbO+yhxUrVjKRc9UR0
         jT9/HmWIJks1wCbt9WIy+KZSinIHwasbp8V6jOVXPrykKCs57Q/7pEmu3RoD5PqYAMTA
         O8L18R4xmrzXRplDyYsIoDd3N9cWm3uAn7a4UueoZzsgeouuf1TSKZ6VtXAHCBk1xyAO
         wyTJ3ms1/wnoQCDCwKmUA7QWkx6FJ9NwNp9RPAXInbSHcEKHcLZwQb2ImtLLAJxwUYe2
         ass6XNOuG46QJU3BaVmt6xXPl0n+/XY2t+Vjcpz7tCXqWxDXaqCmrQC/ZRWZrKosmVqr
         lF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=bcaP+Xp5Acnubea+RekwWNcffosiCSCBeRC13F6od2c=;
        b=EpdGpJeWedRMU6i/QqhJihdC4Jnd4vnUd0tEixFAXnomyqWDdqip6LPrTLWm0+FngL
         cWkf1w5j7WJwYAXwQvw64EbSrJhn2bYa7QqIAEkzLtQ60lSgM4M5EOrag+kX4sHlAGFS
         kyasmBeN0wqyfE+oT7PIWdqf+XCd/JydL+af7WC7pyjOcNmlF0F2UNNHd695qBJBG8No
         SnblzULQluPnsoBBPKQI3GU8QjOt0DRpF91HXmSw2RMReO9as0WcveQF16nPoT2AHZ9/
         +90uPcNAtWstK89GzqMP3ff1iHUUwcy8akOs4oX8dGrCbt0zVKxne/RUpr2tJZ5ahbqS
         7o7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v36si2027830qtb.161.2017.08.04.10.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Aug 2017 10:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38506 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddgHa-0007Cp-Lu
	for alex.bennee@linaro.org; Fri, 04 Aug 2017 13:21:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHU-0007C3-Sq
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ddgHT-0001QQ-No
	for qemu-arm@nongnu.org; Fri, 04 Aug 2017 13:21:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ddgHT-0001Dp-Bx; Fri, 04 Aug 2017 13:20:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ddgHK-0006s5-BW; Fri, 04 Aug 2017 18:20:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  4 Aug 2017 18:20:41 +0100
Message-Id: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/8] Implement ARM external abort handling
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
Cc: Richard Henderson <rth@twiddle.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bGhQ8HYzCSGY

Following recent list discussion
https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg00063.html

here's a patchseries which defines a new API for handling CPU memory
transaction failures at the right level in the memory subsystem code,
and implements it for ARM so that we can generate prefetch abort and
data abort exceptions for external aborts.

The first 3 patches here implement the core code support
for the new cpu_transaction_failed_hook.

The next 2 patches add support for turning it off on
a per-board basis, and use that to go back to RAZ/WI
on the legacy ARM board models, because right now we rely
on that so that guest code doesn't blow up when it touches
a device we don't have a model for yet. (We leave the
support enabled for 'virt' and 'mps2'.)

Finally the last 3 patches do some cleanup and then
implement the new hook for ARM.

(I have not as yet audited the target/arm code to check that
we correctly handle failed transactions in all the places
that C code does physical address accesses; but since those
lookups don't generate exceptions today, the series leaves
behaviour there no worse off than they were before.)

thanks
-- PMM

Peter Maydell (8):
  memory.h: Move MemTxResult type to memattrs.h
  cpu: Define new cpu_transaction_failed() hook
  cputlb: Support generating CPU exceptions on memory transaction
    failures
  boards.h: Define new flag ignore_memory_transaction_failures
  hw/arm: Set ignore_memory_transaction_failures for most ARM boards
  target/arm: Factor out fault delivery code
  target/arm: Allow deliver_fault() caller to specify EA bit
  target/arm: Implement new do_transaction_failed hook

 include/exec/memattrs.h |  10 ++++
 include/exec/memory.h   |  10 ----
 include/hw/boards.h     |  11 ++++
 include/qom/cpu.h       |  26 ++++++++
 softmmu_template.h      |   4 +-
 target/arm/internals.h  |  12 ++++
 accel/tcg/cputlb.c      |  32 +++++++++-
 hw/arm/aspeed.c         |   3 +
 hw/arm/collie.c         |   1 +
 hw/arm/cubieboard.c     |   1 +
 hw/arm/digic_boards.c   |   1 +
 hw/arm/exynos4_boards.c |   2 +
 hw/arm/gumstix.c        |   2 +
 hw/arm/highbank.c       |   2 +
 hw/arm/imx25_pdk.c      |   1 +
 hw/arm/integratorcp.c   |   1 +
 hw/arm/kzm.c            |   1 +
 hw/arm/mainstone.c      |   1 +
 hw/arm/musicpal.c       |   1 +
 hw/arm/netduino2.c      |   1 +
 hw/arm/nseries.c        |   2 +
 hw/arm/omap_sx1.c       |   2 +
 hw/arm/palm.c           |   1 +
 hw/arm/raspi.c          |   1 +
 hw/arm/realview.c       |   4 ++
 hw/arm/sabrelite.c      |   1 +
 hw/arm/spitz.c          |   4 ++
 hw/arm/stellaris.c      |   2 +
 hw/arm/tosa.c           |   1 +
 hw/arm/versatilepb.c    |   2 +
 hw/arm/vexpress.c       |   1 +
 hw/arm/xilinx_zynq.c    |   1 +
 hw/arm/xlnx-ep108.c     |   2 +
 hw/arm/z2.c             |   1 +
 qom/cpu.c               |   7 +++
 target/arm/cpu.c        |   1 +
 target/arm/op_helper.c  | 155 +++++++++++++++++++++++++++++++-----------------
 37 files changed, 243 insertions(+), 68 deletions(-)

-- 
2.7.4

