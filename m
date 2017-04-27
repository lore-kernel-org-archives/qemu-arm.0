Received: by 10.25.0.144 with SMTP id 138csp885765lfa;
        Thu, 27 Apr 2017 10:39:10 -0700 (PDT)
X-Received: by 10.31.171.206 with SMTP id u197mr2906497vke.22.1493314750581;
        Thu, 27 Apr 2017 10:39:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h86si1793563vkc.155.2017.04.27.10.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Apr 2017 10:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3nNm-0004FR-1x
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 13:39:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3nNa-00048z-Sd
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d3nNX-0005Dd-PE
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:38:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1d3nNX-0005DM-Io; Thu, 27 Apr 2017 13:38:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB3AAC001096;
	Thu, 27 Apr 2017 17:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AB3AAC001096
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=wei@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AB3AAC001096
Received: from weilaptop.redhat.com (ovpn-125-235.rdu2.redhat.com
	[10.10.125.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2FA7996D2;
	Thu, 27 Apr 2017 17:38:52 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 27 Apr 2017 12:38:45 -0500
Message-Id: <1493314727-6951-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 27 Apr 2017 17:38:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] Fix compilation dependency issues of
 CONFIG_ARM_V7M
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zi/DGtDXwyF+

CONFIG_ARM_V7M is used to control the compilation of NVIC and SysTick
Timer in QEMU. These two devices are not available when CONFIG_ARM_V7M
is un-defined. This can cause problems with ARMv7M code as it is tightly
integrated with NVIC for processing IRQ and exception.

This patchset addresses the problem by introducing stub functions when
CONFIG_ARM_V7M is not defined. It also makes the compilation of several
existing v7M-profile SoCs depedent on CONFIG_ARM_V7M.

Thanks,
-Wei

Wei Huang (2):
  armv7m: Make armv7m SoC compilation dependent on CONFIG_ARM_V7M
  armv7m: Use stub functions if CONFIG_ARM_V7M is not defined

 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Makefile.objs            |  7 +++----
 target/arm/Makefile.objs        |  1 +
 target/arm/armv7m-stub.c        | 43 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 6 deletions(-)
 create mode 100644 target/arm/armv7m-stub.c

-- 
1.8.3.1

