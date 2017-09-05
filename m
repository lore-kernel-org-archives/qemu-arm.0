Received: by 10.223.172.38 with SMTP id v35csp1581047wrc;
        Tue, 5 Sep 2017 08:55:35 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6USZwsqddhVcL5RjXF1BhuPMGITJRByUIA66i7TlXVkz6RN8V9mKHdEYEjUa4KU0XUbvc6
X-Received: by 10.233.244.5 with SMTP id y5mr5717726qkl.162.1504626935153;
        Tue, 05 Sep 2017 08:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504626935; cv=none;
        d=google.com; s=arc-20160816;
        b=BXyTj0a+IEZgbzsrFmiJknC52TuhdNfsSlliDyCx3lWdKOFvmI4etXqtNyUyOHVUUN
         0IdkQqQj/RBSRDR+W38Ii4oZnGt9TsNaP0iDAH8/oA2GhGKwoBnqYjYLLSP4kGxydYdG
         N/rqlu0zUyZ8LZH+fHaNprL+H3FqDlB2vUz13OuBaQai58ta/9LFVMnrIKJnFVx9YfRw
         MSCoe6LzKPZdJtXJPBpiUN7a8XvZWCmpyHjPT9rxvuZUxOSm2P83D+VIKepWuNClBvvr
         gq2TKgfZ2MiSgzSTIsLwbKzy/hxF+Tm3VsD/ZDPLGwi3slGiC7r457JJLnm5Ln78P+Hj
         dbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=emQhqTOaIgP6Th0pqMISubMNmFCFdldOmLuOPO5Ijxw=;
        b=cgZCnqlkjoY+/iF64rgU9E1vGp1rzlHDdlnlQGrWmSkOP/QlrTcOxywkkPsPUHvzje
         wkO859yrdDegXG+V9zs6QKdjadkxTYLdHkQp8mWgGD/fgxQ3eOphnZZEWgjeBg7iX6M9
         C5KbzmQ3IGTeXPkE+tFrdeUJ048dSrPY3npKZuueNdAaA7KSFG6r40RhNuIhGwwZZSwE
         2Um///17icngaCMLligG1mEG6ApnZw3WDIGi8Yvg3NrrvXpJ6wXrdW1lXWBv62GLIMyP
         PVLtCPSHnjohSlgm065HtP99C7GP8EbwYiDaquFnkBZ4q7lwM9US9TRRXSnNtUYEqgQR
         E9AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d194si726960qka.353.2017.09.05.08.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59789 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGCK-0001ow-Tw
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:55:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAR-0000F4-Ez
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dpGAM-0004Di-Mv
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:53:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dpGAM-00045L-Fp; Tue, 05 Sep 2017 11:53:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dpGA7-00079A-Mg; Tue, 05 Sep 2017 16:53:15 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  5 Sep 2017 16:53:31 +0100
Message-Id: <1504626814-23124-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/3] Add do_transaction_failed hook for ARM
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
X-TUID: lOePY1/dQkEm

I sent these patches earlier, but only realized when I
put them in the target-arm pull request that they broke
the user-mode emulators.

Only change in these 3 patches from v1 is that patch 1
now checks that what it gets from qdev_get_machine()
is really an instance of TYPE_MACHINE before using it
(which only happens for the user-mode emulators, where
we don't need to set ignore_memory_transaction_failures).

thanks
-- PMM

Peter Maydell (3):
  boards.h: Define new flag ignore_memory_transaction_failures
  hw/arm: Set ignore_memory_transaction_failures for most ARM boards
  target/arm: Implement new do_transaction_failed hook

 include/hw/boards.h     | 11 +++++++++++
 include/qom/cpu.h       |  7 ++++++-
 target/arm/internals.h  | 10 ++++++++++
 hw/arm/aspeed.c         |  3 +++
 hw/arm/collie.c         |  1 +
 hw/arm/cubieboard.c     |  1 +
 hw/arm/digic_boards.c   |  1 +
 hw/arm/exynos4_boards.c |  2 ++
 hw/arm/gumstix.c        |  2 ++
 hw/arm/highbank.c       |  2 ++
 hw/arm/imx25_pdk.c      |  1 +
 hw/arm/integratorcp.c   |  1 +
 hw/arm/kzm.c            |  1 +
 hw/arm/mainstone.c      |  1 +
 hw/arm/musicpal.c       |  1 +
 hw/arm/netduino2.c      |  1 +
 hw/arm/nseries.c        |  2 ++
 hw/arm/omap_sx1.c       |  2 ++
 hw/arm/palm.c           |  1 +
 hw/arm/raspi.c          |  1 +
 hw/arm/realview.c       |  4 ++++
 hw/arm/sabrelite.c      |  1 +
 hw/arm/spitz.c          |  4 ++++
 hw/arm/stellaris.c      |  2 ++
 hw/arm/tosa.c           |  1 +
 hw/arm/versatilepb.c    |  2 ++
 hw/arm/vexpress.c       |  1 +
 hw/arm/xilinx_zynq.c    |  1 +
 hw/arm/xlnx-ep108.c     |  2 ++
 hw/arm/z2.c             |  1 +
 qom/cpu.c               | 16 ++++++++++++++++
 target/arm/cpu.c        |  1 +
 target/arm/op_helper.c  | 43 +++++++++++++++++++++++++++++++++++++++++++
 33 files changed, 130 insertions(+), 1 deletion(-)

-- 
2.7.4

