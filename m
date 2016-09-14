Received: by 10.80.163.71 with SMTP id 65csp1383357edn;
        Tue, 13 Sep 2016 23:09:14 -0700 (PDT)
X-Received: by 10.55.197.9 with SMTP id p9mr933583qki.225.1473833354827;
        Tue, 13 Sep 2016 23:09:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r48si2048749qtb.104.2016.09.13.23.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Sep 2016 23:09:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bk3Ni-0001LW-Bc
	for alex.bennee@linaro.org; Wed, 14 Sep 2016 02:09:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bk3Nf-0001L4-2g
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 02:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bk3Na-0006US-Sn
	for qemu-arm@nongnu.org; Wed, 14 Sep 2016 02:09:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bk3Na-0006UE-NH; Wed, 14 Sep 2016 02:09:06 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEFFFC00FBBF;
	Wed, 14 Sep 2016 06:09:05 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8E694Sw002896; Wed, 14 Sep 2016 02:09:04 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Wed, 14 Sep 2016 02:09:01 -0400
Message-Id: <1473833343-31531-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 14 Sep 2016 06:09:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH V2 0/2] Add option to configure guest vPMU
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jcDgzgPDqbJl

This patchset adds a pmu=[on/off] option to enable/disable vPMU support 
for guest VM. There are several reasons to justify this option. First,
vPMU can be problematic for cross-migration between different SoC as perf
counters are architecture-dependent. It is more flexible to have an option
to turn it on/off. Secondly Secondly this option matches the "pmu" option
as supported in libvirt. To make sure backward compatible, a PMU property
is added to mach-virt machine types.

V1->V2:
  * keep the original field name as "has_pmu"
  * add a warning message when PMU is turned on without KVM
  * use the feature bit to check PMU availability, instead of using has_pmu
  * add PMU compat support to mach-virt machine type

RFC->V1:
  * set default pmu=off
  * change struct ARMCPU field name "has_pmu" ==> "has_host_pmu"
  * like el3, add a new feature ARM_FEATURE_HOST_PMU
  * "pmu" property becomes CPU dependent. Only cortex-a53/cortex-a57/host
    running on kvm supports this option.

-Wei

Wei Huang (2):
  arm64: Add an option to turn on/off vPMU support
  arm: virt: add PMU property to machvirt machine type

 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            | 14 +++++++++++++-
 target-arm/cpu.c         | 22 ++++++++++++++++++++++
 target-arm/cpu.h         |  1 +
 target-arm/cpu64.c       |  2 ++
 target-arm/kvm64.c       | 17 +++++++++++++----
 6 files changed, 52 insertions(+), 6 deletions(-)

-- 
1.8.3.1

