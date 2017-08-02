Received: by 10.25.44.15 with SMTP id s15csp6362198lfs;
        Wed, 2 Aug 2017 09:53:18 -0700 (PDT)
X-Received: by 10.237.35.179 with SMTP id j48mr31576116qtc.59.1501692798312;
        Wed, 02 Aug 2017 09:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692798; cv=none;
        d=google.com; s=arc-20160816;
        b=XtJaciyHmCj2cvoq6iVizxYnLScwib1WQCYpSxNQKr8kP1ZdLgsqX+uPRFU6Q+AS4k
         4Ix+qjOyAQrTw4C/M/lFxpynQxL3/05ICDfn6wtOB8aOYZ4TQX5Yo4oSelterGggSNBm
         j4yscO1GVxpwIJNK7hjtleMkgO77KVEa1kuTjeSpD8fqSA5ym0tseFl3/tTwEID6Ywlv
         etJKIRX4So7xzwcU75aVUCwJLYeNHiGv52F0UgS7e9BFhT7zOd/4eYqv4F7X+k4C3rrf
         9AbqQnmjXUq4YlzXReDUlx6qKZd9HvU1TB75BJr/SNoOvAgXHKPkGTAJu2AdwqKzAT0f
         DvlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=9ZwJ1l/1FlJKdDm3OukcUnEgOMc1e5e4MdlHrOsr4jI=;
        b=lRC8fygZ+acrEziw5VyGCfRw/4Zs0L9PmWHm9s3tkmLuTOfoYobJO6A9cqlG/mk1BT
         R7R4fhOdF8848GbKU8KovwQ4SjZQj9PIyks91ndfnkQWOJDIE5wCF78aieP+cbactcf+
         Rt/0MAuz3nOfEAtjGmfqwkWJtQU4GyIIJuODhXaBlxWmAgaAVrkqZJP26if3lTMGwJa6
         QoDPY++PVfO5Q6UgW2gt7fGkXybn6gEucizNvovPQSvyE+70Hc0StWBfNlrNoCTqzJy0
         RpFbsZi5IqIIR8qy4xPsdsBi7xVy/vlJJntcj2MX9AskFGzyTfAsKiBD3lshoybinAL0
         KVpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r64si30897511qkr.100.2017.08.02.09.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwtX-0002QY-N2
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:53:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlE-0003ei-Ee
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwlD-0004ru-HH
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwlD-0003zA-9M; Wed, 02 Aug 2017 12:44:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwkc-0003w1-Bt; Wed, 02 Aug 2017 17:44:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:46 +0100
Message-Id: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/15] v7M: cleanups and bugfixes prior to v8M
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
X-TUID: BJMgsFqJwtsv

(This is 2.11 material, obviously, but it's a coherent and
large enough set of patches that I figured I might as well
push it out for review now.)

This patchset is a collection of cleanups, bugfixes, etc to
the existing v7M code which are either necessary preliminary
to implementing v8M or just things I noticed along the way.
The non-trivial stuff is:
 * migration for M profile is shifted to not use read_cpsr()
   and write_cpsr() which assume A profile semantics
   (back compatibility with old migration state is maintained)
 * we implement the "user accesses should BusFault" behaviour
   for the memory mapped registers in the SCS, though this
   won't actually kick in until we turn MEMTX_ERROR into a
   BusFault (I have patches for that)

thanks
-- PMM

Peter Maydell (15):
  target/arm: Use MMUAccessType enum rather than int
  target/arm: Don't trap WFI/WFE for M profile
  target/arm: Consolidate PMSA handling in get_phys_addr()
  target/arm: Tighten up Thumb decode where new v8M insns will be
  hw/intc/armv7m_nvic.c: Remove out of date comment
  target/arm: Remove incorrect comment about MPU_CTRL
  target/arm: Fix outdated comment about exception exit
  target/arm: Define and use XPSR bit masks
  target/arm: Don't store M profile PRIMASK and FAULTMASK in daif
  target/arm: Don't use cpsr_write/cpsr_read to transfer M profile XPSR
  target/arm: Make arm_cpu_dump_state() handle the M-profile XPSR
  target/arm: Don't calculate lr in arm_v7m_cpu_do_interrupt() until
    needed
  target/arm: Create and use new function arm_v7m_is_handler_mode()
  armv7m_nvic.h: Move from include/hw/arm to include/hw/intc
  nvic: Implement "user accesses BusFault" SCS region behaviour

 hw/intc/armv7m_nvic.c                  |  68 +++++++++++-------
 include/hw/arm/armv7m.h                |   2 +-
 include/hw/{arm => intc}/armv7m_nvic.h |   0
 target/arm/cpu.c                       |   5 --
 target/arm/cpu.h                       |  54 ++++++++++----
 target/arm/helper.c                    | 124 ++++++++++++++++-----------------
 target/arm/internals.h                 |   3 +-
 target/arm/machine.c                   |  54 +++++++++++++-
 target/arm/op_helper.c                 |   5 ++
 target/arm/translate.c                 | 106 +++++++++++++++++++++-------
 10 files changed, 286 insertions(+), 135 deletions(-)
 rename include/hw/{arm => intc}/armv7m_nvic.h (100%)

-- 
2.7.4

