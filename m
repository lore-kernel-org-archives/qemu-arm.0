Received: by 10.25.77.65 with SMTP id a62csp125374lfb;
        Fri, 20 Jan 2017 10:45:23 -0800 (PST)
X-Received: by 10.55.23.194 with SMTP id 63mr14363319qkx.125.1484937923309;
        Fri, 20 Jan 2017 10:45:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u16si5439177qka.100.2017.01.20.10.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56746 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeBc-0003Lh-Hc
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:45:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBG-00036p-Ra
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBF-0002YN-TY
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:58 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeBF-0002QO-Nk; Fri, 20 Jan 2017 13:44:57 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeB2-00046W-1v; Fri, 20 Jan 2017 18:44:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:44:37 +0000
Message-Id: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/6] ARMv7M: some simple bugfixes and cleanups
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gilWKZqDRmUb

This set of six patches is some simple bug fixes which
I've pulled out of Michael Davidsaver's old NVIC rewrite
patchset, as an initial start on getting it upstream.
None of them are particularly exciting, but they're
self-contained so they might as well go through code
review and get into master ahead of the main rewrite.

NB the patch which pulls the FIELD macros out of register.h;
they're too useful to be only accessible in softmmu builds.

I've CC'd Michael as the original author and Liviu
as somebody interested in v7M; if either of you would
prefer not to be cc'd let me know and I'll leave you off
subsequent respins and later NVIC related patchset emails.

thanks
-- PMM

Michael Davidsaver (5):
  armv7m: MRS/MSR: handle unprivileged access
  armv7m: Replace armv7m.hack with unassigned_access handler
  armv7m: Explicit error for bad vector table
  armv7m: Fix reads of CONTROL register bit 1
  armv7m: Clear FAULTMASK on return from non-NMI exceptions

Peter Maydell (1):
  hw/registerfields.h: Pull FIELD etc macros out of hw/register.h

 include/hw/register.h       |  47 +-------------
 include/hw/registerfields.h |  60 ++++++++++++++++++
 target/arm/cpu.h            |   1 -
 target/arm/internals.h      |   7 +++
 hw/arm/armv7m.c             |   8 ---
 target/arm/cpu.c            |  28 +++++++++
 target/arm/helper.c         | 147 +++++++++++++++++++++++++++-----------------
 target/arm/machine.c        |   6 +-
 target/arm/translate.c      |  12 ++--
 9 files changed, 195 insertions(+), 121 deletions(-)
 create mode 100644 include/hw/registerfields.h

-- 
2.7.4

