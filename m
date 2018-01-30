Received: by 10.28.71.27 with SMTP id u27csp1473755wma;
        Tue, 30 Jan 2018 07:02:55 -0800 (PST)
X-Google-Smtp-Source: AH8x224wsJOgmMwQu0ppuH9ed8uTusDRKlcG4HBVB9EFhhk2MIqB+xYYBMxIx0/Kbtd8TjW4ZuQM
X-Received: by 10.13.197.134 with SMTP id h128mr20424860ywd.335.1517324575567;
        Tue, 30 Jan 2018 07:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324575; cv=none;
        d=google.com; s=arc-20160816;
        b=FUg9cFTQenoI8kmWqrt+K6SntVImozkVFEg62TqFFmfrjYIxQdp1bS7UAUOZ3c8i45
         Jw/ecDyz1Hp6S32skrcWn4Ktn0BzAhkDrEvx8vV2KhRnptqjptQWhwxEZctf5niIg7N5
         dZ/2W/IxXLvTzqKeRMTBPfgNGQgrZYXMplFUApoQxGLbkit0IbHnI0S/zRINoqgSwqNJ
         Ag0EOSzGxNKLFlq9xhp0CZSXZyz/+V2kqbIgjb/FkPWNwkJmVx3WnrIeekmqMU50ynlO
         rAlTvQqTg0qPi/RkStkdvPFrgqyUzg1MBqouX0bxrZtgX+lrH/hXx8HK3Ih8gbv0eIas
         V5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Dd9neTs4Ks0sPUrFLhn2fTyA9pMU+1pxHz7N9zmWD7o=;
        b=W+JNLAaPw0Bz312/SS9hh8DDxFB5iCzqYnNTu2r2Vb4t6SkXk4LWj3mnbF5JjUl3Tl
         8HqGVh2O0wO+F0ycVDVuOyXYHYdaFHLvgcufEQhj5rOVXUTdn8ddIc/YkX5dYmSpyvOf
         bYFzXLKb4b4ZnsYJXilVYMaO945TKhVlS7zatPbiro+Ml8sgAbArXMBBhfG0x8AW2wCW
         eON6ZZlo0fBQT73vUcq0DbqRdRDsIVIQhpxNAUAWMl+o7XiZsbTulSKF9pmy1KAACzvs
         RwCUSrc7PXRNiwCZVxF8veYdEzQHZXow99FlNBCfjZK7jzXqmvMAFote9IWDjU8U2Pd7
         KCjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127si2672323ywh.763.2018.01.30.07.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXR0-0000G3-UY
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:02:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQh-0000BQ-P1
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQY-0005TU-2l
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQX-0005SC-RF; Tue, 30 Jan 2018 10:02:25 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQV-0005s6-Jx; Tue, 30 Jan 2018 15:02:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:15 +0000
Message-Id: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/7] target/arm: Implement M profile derived
 exceptions
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
X-TUID: Y6jzoCrNs+Kb

In the Arm M-profile architecture, the process of taking or
returning from an exception can itself cause an exception
(for instance if there is an MPU permissions fault when
writing or reading the exception stack frame). This is called
a derived exception. Currently we don't implement this at
all in QEMU, instead just doing direct physical address
loads and stores which bypass MPU/SAU checks.

This patchset changes all the loads and stores we do on
exception entry and exit so that they do the MPU and SAU checks
and handle failures in the architecturally required way.

A note for reviewers: the way I've structured handling of
derived exceptions on exception entry diverges a bit from the
structure of the v8M Arm ARM pseudocode. In the pseudocode,
derived exceptions cause the attempt to process the original
exception to be abandoned (either without calling TakeException,
or bailing out of TakeException partway through). Then at the top
level the pseudocode calls DerivedLateArrival to prioritize the
derived exception and call TakeException from there.
For the QEMU implementation, I chose to let the NVIC do the
prioritization and continue forward, so that the call to
v7m_exception_taken() will then take either the original or the
erived exception. The effect is the same, but this structure works
better for QEMU, because we don't have a convenient top level place
to do the abandon-and-retry logic.

(The motivation for filling in this missing bit of functionality
is that the Zephyr RTOS would like to implement stack-overrun
checking on v7M cores using the MPU, so noticing permissions
failures when exceptions frames are written to the stack is
important.)

Peter Maydell (7):
  target/arm: Add armv7m_nvic_set_pending_derived()
  target/arm: Split "get pending exception info" from "acknowledge it"
  target/arm: Add ignore_stackfaults argument to v7m_exception_taken()
  target/arm: Make v7M exception entry stack push check MPU
  target/arm: Make v7m_push_callee_stack() honour MPU
  target/arm: Make exception vector loads honour the SAU
  target/arm: Handle exceptions during exception stack pop

 target/arm/cpu.h      |  32 ++++-
 hw/intc/armv7m_nvic.c |  98 +++++++++++--
 target/arm/helper.c   | 392 ++++++++++++++++++++++++++++++++++++++++----------
 hw/intc/trace-events  |   5 +-
 4 files changed, 435 insertions(+), 92 deletions(-)

-- 
2.7.4

