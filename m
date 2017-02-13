Received: by 10.25.77.65 with SMTP id a62csp898588lfb;
        Mon, 13 Feb 2017 06:46:41 -0800 (PST)
X-Received: by 10.200.46.248 with SMTP id i53mr20515074qta.281.1486997201579;
        Mon, 13 Feb 2017 06:46:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w7si7374265qka.256.2017.02.13.06.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Feb 2017 06:46:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cdHtm-0007y3-SJ
	for alex.bennee@linaro.org; Mon, 13 Feb 2017 09:46:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcH-0008Fy-9w
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cdHcG-0005GC-4u
	for qemu-arm@nongnu.org; Mon, 13 Feb 2017 09:28:33 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48495)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cdHcF-0005C4-Uf; Mon, 13 Feb 2017 09:28:32 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cdHc4-00014S-K5; Mon, 13 Feb 2017 14:28:20 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 13 Feb 2017 14:28:15 +0000
Message-Id: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/4] cpu: Implement cpu_generic_new()
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v3BRZfFnNB0S

This patchset adds a new function cpu_generic_new()
which is similar to cpu_generic_init() except that it
does not realize the created CPU object. This means that
board code can do a "new cpu; set QOM properties; realize"
sequence without having to do all the work of splitting
the CPU model string and calling parse_features by hand.

Patch 2 clarifies a TODO comment, hopefully correctly,
based on an email conversation I had with Eduardo a
little while back.

Patches 3 and 4 change the ARM boards which currently
call parse_features by hand to use the new function.


If there's consensus that this is the right general
direction to go in, then I think that some other
architectures could also make cleanups to use this:
 * cpu_s390x_create() is almost exactly this function,
   give or take some fine detail of error handling
 * ppc_cpu_parse_features is almost the same thing,
   except that it doesn't actually create the CPU object,
   it only calls parse_features
 * hw/i386/pc.c does a manual parse_features

I'm not strongly attached to this particular approach
(though it seems like a reasonable one, especially given
the proliferation of different arch-specific helpers
listed above and the bugs in boards which don't call
parse_features when they should), but I would like us to
figure out and document what the right way for a board
to create and configure its CPU objects is...


Michael Davidsaver (1):
  cpu: add cpu_generic_new()

Peter Maydell (3):
  cpu: Clarify TODO comment in cpu_generic_new()
  hw/arm/integrator: Use new cpu_generic_new()
  hw/arm/virt: Use new cpu_generic_new()

 include/qom/cpu.h     | 17 +++++++++++++++++
 hw/arm/integratorcp.c | 22 ++--------------------
 hw/arm/virt.c         | 24 ++----------------------
 qom/cpu.c             | 37 ++++++++++++++++++++++++++-----------
 4 files changed, 47 insertions(+), 53 deletions(-)

-- 
2.7.4

