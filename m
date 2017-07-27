Received: by 10.25.44.15 with SMTP id s15csp1868889lfs;
        Thu, 27 Jul 2017 03:59:30 -0700 (PDT)
X-Received: by 10.233.232.72 with SMTP id a69mr4839258qkg.330.1501153170662;
        Thu, 27 Jul 2017 03:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153170; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5tqh9vVUZNif0rPt+i0NjxvT1U06XEiT6a98wXqTWwQg5cMCYENhPIvD5KS5FLo/S
         h8UcmEqiYJ5NRkiEvZd70r3kuv8v1pC/xdwJ1q0jULzeMvc4k+1eGKSwqSErcEFcUHG2
         JrAMPIDm94ts3IEeTkr+ZX2v0x8uH4cMGSkUdcomtx22CwNhAeIlG3kL1HmWYHgL9Oh/
         rYhM+gSuDptU7W1vtMIolyN/O+oVFhoxN5Rp9TLy08zkX9jv0o/b8IV7x1qbUyjiG08L
         GMkMk8zLkhNbO2tc47xuYGLvgQI5DtvbYrmIgzyHiTXu5xw77cD56KlL1gcytGyqdOjj
         VNrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=ukhlL9MmlwcExcss72INKcVlEV84ZqVyBsyXh9+7g1A=;
        b=hrXpVhCU9VtAza+TufqCUmWQ6yvEy1dEoTih+XZU1a3yQHWEkFJsWlHz83HY+wiRVM
         rtZGXjPCJh5bObzmwHRzYAzwhm5lvS/Y+vbmAQ5jWkJ7VtgBdndq5fUXN3FLlxbHXKAk
         z6NXEl2k3ia/s1OuKOfrfxAtrWzJn0+rO5JT1CdWswX72WVQrHae+RjtMw+7ad5SS7NH
         qj9HWufnt++3GP3RRvoJTT7Yt4MviVSBvZ9MKfRkq/BUVUQU3mHAgRE16/5T1Mp6bmBA
         moFsIPzGdnHk6sbd1aV8clp4FHz5dBbm8Y9ObZ2pFeLG8CCGDDmesC/kihhTma+qBMq2
         28aA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b72si14893393qkg.336.2017.07.27.03.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 03:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagVs-0006Hc-1B
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 06:59:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVk-0006HO-4E
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVj-00009I-5B
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:20 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVi-0008P0-V5; Thu, 27 Jul 2017 06:59:19 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVb-0003lK-64; Thu, 27 Jul 2017 11:59:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:05 +0100
Message-Id: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 0/5] M profile MPU bugfixes
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
X-TUID: vwKOFjWqhnRm

This patchset fixes some bugs in the M profile MPU code:
 * the guest shouldn't be able to make system space executable
 * PPB region accesses should not be subject to MPU lookups
 * we were not resetting the PMSAv7 MPU state for M profile CPUs
 * we weren't migrating the MPU_RNR state

The renaming from cp15.c6_rgnr to pmsav7.rnr is not strictly
necessary for 2.10, but it doesn't affect many places in the code
and it restores the invariant that no mutable M profile CPU
state is stored in env->cp15.something fields.

thanks
-- PMM

Peter Maydell (5):
  target/arm: Don't do MPU lookups for addresses in M profile PPB region
  target/arm: Don't allow guest to make System space executable for M
    profile
  target/arm: Rename cp15.c6_rgnr to pmsav7.rnr
  target/arm: Move PMSAv7 reset into arm_cpu_reset() so M profile MPUs
    get reset
  target/arm: Migrate MPU_RNR register state for M profile cores

 hw/intc/armv7m_nvic.c | 14 +++++------
 target/arm/cpu.c      | 14 +++++++++++
 target/arm/cpu.h      |  3 +--
 target/arm/helper.c   | 67 +++++++++++++++++++++++++++++++++++----------------
 target/arm/machine.c  | 30 ++++++++++++++++++++++-
 5 files changed, 97 insertions(+), 31 deletions(-)

-- 
2.7.4

