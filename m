Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp907780wrx;
        Fri, 22 Mar 2019 09:38:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjI/+t2ZLhbLANO53XbPo540kYqz7dRLPIztntKaLUfCmJuQdzTeiVPvvBlYlPeCxmQcMh
X-Received: by 2002:a25:60d5:: with SMTP id u204mr9031033ybb.291.1553272719743;
        Fri, 22 Mar 2019 09:38:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553272719; cv=none;
        d=google.com; s=arc-20160816;
        b=Toe3nRAgjltEwiKWMkRTuIIwdTFbiW2HcNQoCjx3evLs0Ghe73xWJ1FS/YUkSB0F44
         tQt993CMM+H+suVfbqYtpaS21+IoJOHnCbguuhQxybRiYP5b3zcP3u6cRPnvJC0bfusM
         ikQFKzIc7QL6nC6R5Xp+iMRVaIVdnaV6jZXMZPoV2rbYErppaQupNj/RJziR/0E7tSoi
         TGwtEtgpVXvs+e5C+8E0ZNf6vFNRq5s0Af27xHExTK0/KtQExHo9PhXG+hfHObHnGRJe
         51/h5gyabrGNp20i+MeM0T5jd9vNCn28NZ0Q4d9MtwZpIhOtrXckOeBSXSK9NydRkMBo
         uHSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=RtZLCLhITpJ5afceJYz4vP95lFLjbaSD1s/dPNdYWpU=;
        b=gl+5bwbG3Ud9wQ33wou+sHUAfayCNCdd/T9KVP9Ap4sawSHlV4UGkbmWyWLWc2N2x3
         zq0eAHH3TNWbr+PATiJlpsylvTMXJcFkzqakV6yYQN3MtiIYWRmrj67d9fFcB/eBzzqg
         gJgXjA7bDtoApd6z1Wzu12I4YmaZ3BERfU3PGpz64kW1NztElje9Pr5W47SetXEtC5TI
         wpmNt68HGpUU0J6x5LWI5n2d4Eb/MfmwCh+/E/012NlEEwMmCpku+5n0+1Ua26x1ugVO
         CrVNtGXDUbrDTt8ev44DGc4JkSx15MZIDQrrjiuZ55hQaW8H6aiFcqCSUIpMBH3wmXgZ
         7xiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r1si4634160ybb.431.2019.03.22.09.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 09:38:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59987 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7NBn-0007JR-8c
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 12:38:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N6l-0003U5-JB
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N6j-0002xJ-3P
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:33:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7N6i-0002se-4D; Fri, 22 Mar 2019 12:33:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 267BE5D60E;
	Fri, 22 Mar 2019 16:23:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3BA45D9CC;
	Fri, 22 Mar 2019 16:23:34 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Mar 2019 17:23:30 +0100
Message-Id: <20190322162333.17159-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Mar 2019 16:23:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] target/arm: pmu fixes
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
Cc: peter.maydell@linaro.org, aaron@os.amperecomputing.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uVS+taLXsGjT

The first two patches fix a regression I found when running
the arm (as opposed to arm64) pmu kvm-unit-tests test on tcg,

  $ git clone git://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
  $ cd kvm-unit-tests
  $ ./configure --arch=arm --cross-prefix=arm-linux-gnu-
  $ make -j
  $ export QEMU=/path/to/qemu-system-arm or qemu-system-aarch64
  $ arm/run arm/pmu.flat

After checking the QEMU code I found it's also reproducible with
the arm64 test if the PMU is removed,

  $ ./configure --arch=arm64 --cross-prefix=aarch64-linux-gnu-
  $ make -j
  $ export QEMU=/path/to/qemu-system-aarch64
  $ arm/run arm/pmu.flat -cpu cortex-a57,pmu=off

Those tests used to pass, but now QEMU was crashing. I've broken
the fix into two patches because the second patch is a bit of
an RFC since I don't know if it's safe to enable all
ARM_FEATURE_PMU code for PMUv2. Maybe that feature is only for
PMUv3? This patch also enables the pmu cpu property to work with
those cpu types, i.e. we can now do '-cpu cortex-a15,pmu=off' to
remove the pmu. Although it wasn't clear to me if the PMU is
optional (permitted to be removed) on those cpu types from the
manuals.

The last patch is just a trivial cleanup.

Andrew Jones (3):
  target/arm: fix crash on pmu register access
  target/arm: cortex-a7 and cortex-a15 have pmus
  target/arm: make pmccntr_op_start/finish static

 target/arm/cpu.c    |  3 +++
 target/arm/cpu.h    | 11 -----------
 target/arm/helper.c |  8 ++++++--
 3 files changed, 9 insertions(+), 13 deletions(-)

-- 
2.17.2

