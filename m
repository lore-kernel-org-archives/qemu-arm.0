Received: by 10.25.208.211 with SMTP id h202csp1377523lfg;
        Mon, 22 Feb 2016 12:26:06 -0800 (PST)
X-Received: by 10.55.75.203 with SMTP id y194mr37622142qka.2.1456172766597;
        Mon, 22 Feb 2016 12:26:06 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si20074706qga.111.2016.02.22.12.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 12:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXx3W-0005zZ-42
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 15:26:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXx3A-0005gW-9C
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 15:25:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXx33-0000Xz-93
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 15:25:42 -0500
Received: from orth.archaic.org.uk ([81.2.115.148]:48157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx32-0000XS-R2; Mon, 22 Feb 2016 15:25:37 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2s-0001QJ-3r; Mon, 22 Feb 2016 20:25:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:15 +0000
Message-Id: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 81.2.115.148
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-devel] [RFC 0/5] GICv3 state structs and migration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BpqUBxzd3bTK

This is a very rough-and-ready RFC that takes Pavel's patch
series from last year:
https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05284.html
and applies the various changes I recommended in code review.

I haven't tested this beyond compile-testing, but I think
that the general shape of it, and in particular the set
of information in the state structs, is correct. (In
particular I have removed several state struct fields that
should definitely not be present.)
There are a few fixme-type comments scattered in the code.

Shlomo, I think this should be a sensible thing to base your
GICv3 emulation patches on.

thanks
-- PMM

Pavel Fedin (4):
  hw/intc/arm_gicv3_common: Add state information
  kernel: Add definitions for GICv3 attributes
  hw/intc/arm_gicv3_kvm: Implement get/put functions
  hw/intc/arm_gicv3_common: Add vmstate descriptors

Peter Maydell (1):
  migration: Define VMSTATE_UINT64_2DARRAY

 hw/intc/arm_gicv3_common.c         | 161 +++++++++++++-
 hw/intc/arm_gicv3_kvm.c            | 437 ++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           | 147 +++++++++++++
 include/hw/intc/arm_gicv3_common.h | 106 ++++++++-
 include/migration/vmstate.h        |  15 ++
 linux-headers/asm-arm64/kvm.h      |  17 +-
 6 files changed, 869 insertions(+), 14 deletions(-)
 create mode 100644 hw/intc/gicv3_internal.h

-- 
1.9.1

