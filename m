Received: by 10.25.205.13 with SMTP id d13csp1109669lfg;
        Wed, 11 Jan 2017 23:04:32 -0800 (PST)
X-Received: by 10.55.20.17 with SMTP id e17mr10978672qkh.96.1484204671947;
        Wed, 11 Jan 2017 23:04:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q126si5513101qkb.59.2017.01.11.23.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jan 2017 23:04:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRZR1-0001Vb-G9
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 02:04:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQw-0001UW-PH
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1cRZQr-0005tc-Rk
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 02:04:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58316)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1cRZQr-0005rv-MF; Thu, 12 Jan 2017 02:04:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD73821730;
	Thu, 12 Jan 2017 07:04:20 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0C74JTG008641; Thu, 12 Jan 2017 02:04:20 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Jan 2017 02:04:14 -0500
Message-Id: <1484204658-28058-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 12 Jan 2017 07:04:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V1 0/4] Add vPMU vPMU support under TCG mode
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SKOvEj6S0lr5

QEMU has implemented cycle count support for guest VM under TCG mode.
But this feature is not complete. In fact using perf inside a
64-bit Linux guest VM (under TCG) can cause the following kernel panic
because some PMU registers are not implemented.

[  329.445970] [<fffffe000009e600>] armv8pmu_enable_event+0x58/0x8c
[  329.446713] [<fffffe0000621e74>] armpmu_start+0x4c/0x74

This patchset solves the problem by adding support for missing vPMU
registers. Basic perf test can work now under TCG by applying this
patchset.

[root@localhost ~]# perf stat ls
 Performance counter stats for 'ls':

        226.740256      task-clock (msec)         #    0.312 CPUs utilized    
                76      context-switches          #    0.335 K/sec
                 0      cpu-migrations            #    0.000 K/sec
                64      page-faults               #    0.282 K/sec
       186,031,410      cycles                    #    0.820 GHz      (36.40%)
   <not supported>      stalled-cycles-frontend
   <not supported>      stalled-cycles-backend
     <not counted>      instructions               (0.00%)
   <not supported>      branches
     <not counted>      branch-misses              (0.00%)

Thanks,
-Wei

Wei Huang (4):
  target-arm: Add support for PMU register PMSELR_EL0
  target-arm: Add support for AArch64 PMU register PMXEVTYPER_EL0
  target-arm: Add support for PMU register PMINTENSET_EL1
  target-arm: Hook up TCG vPMU with CPU pmu option

 target/arm/cpu.c    |  2 +-
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++------
 3 files changed, 37 insertions(+), 7 deletions(-)

-- 
1.8.3.1

