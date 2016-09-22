Received: by 10.80.163.71 with SMTP id 65csp56475edn;
        Thu, 22 Sep 2016 08:53:20 -0700 (PDT)
X-Received: by 10.55.166.81 with SMTP id p78mr2847072qke.18.1474559600078;
        Thu, 22 Sep 2016 08:53:20 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id b39si1536766qtc.150.2016.09.22.08.53.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 08:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn6JF-0006L4-4w
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 11:53:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bn5gt-0005hs-CN
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 11:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bn5gs-0006Fy-6j
	for qemu-devel@nongnu.org; Thu, 22 Sep 2016 11:13:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bn5gm-0006Db-JK; Thu, 22 Sep 2016 11:13:28 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27738A4532;
	Thu, 22 Sep 2016 15:13:28 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8MFDR5x006139; Thu, 22 Sep 2016 11:13:27 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 22 Sep 2016 11:13:21 -0400
Message-Id: <1474557203-4977-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 22 Sep 2016 15:13:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V5 0/2] Add option to configure guest vPMU
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sWeu6uNsyO4I

This patchset adds a pmu=[on/off] option to enable/disable vPMU support 
for guest VM. There are several reasons to justify this option. First,
vPMU can be problematic for cross-migration between different SoC as perf
counters are architecture-dependent. It is more flexible to have an option
to turn it on/off. Secondly this option matches the "pmu" option as
supported in libvirt. To make sure backward compatible, a PMU-related
property is added to mach-virt machine types.

The following are testing results with this patchset. Other combinations
should have similar results:
    CONFIG (qemu-system-aarch64)                    vPMU   WARNING
    -M virt-2.7,accel=kvm -cpu host                  YES    NO
    -M virt-2.7,accel=kvm -cpu host,pmu=off          NO     NO
    -M virt-2.7,accel=kvm -cpu host,pmu=on           YES    NO
    -M virt-2.6,accel=kvm -cpu host                  NO     NO
    -M virt-2.6,accel=kvm -cpu host,pmu=off          NO     NO
    -M virt-2.6,accel=kvm -cpu host,pmu=on           YES    NO

    -M virt-2.7,accel=tcg -cpu cortex-a57            NO     NO
    -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off    NO     NO
    -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on     NO     "No KVM"
    -M virt-2.6,accel=tcg -cpu cortex-a57            NO     NO
    -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off    NO     NO
    -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on     NO     "No KVM"

    -M virt-2.7,accel=tcg -cpu cortex-a15            NO     NO
    -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off    NO     "No PMU property"
    -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on     NO     "No PMU property"
    -M virt-2.6,accel=tcg -cpu cortex-a15            NO     NO
    -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off    NO     "No PMU property"
    -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on     NO     "No PMU property"

    * "NO KVM" msg
      warning: pmu can't be enabled without KVM acceleration
    * "No PMU property" msg
      can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found

V4->V5:
  * remove comment change for has_pmu
  * remove warning msg when pmu_default_on=TRUE && has_pmu=AUTO && tcg=TRUE

V3->V4:
  * change has_pmu from Boolean to OnOffAuto to handle different cases
  * "pmu" property is re-defined as DEFINE_PROP_ON_OFF_AUTO

V2->V3:
  * revise patch 1 commit msg and if-else statement (Drew) 
  * move property field into VirtMachineClass (Drew)

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

Thanks,
-Wei

Wei Huang (2):
  arm64: Add an option to turn on/off vPMU support
  arm: virt: add PMU property to mach-virt machine type

 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            | 18 +++++++++++++++++-
 target-arm/cpu.c         | 23 +++++++++++++++++++++++
 target-arm/cpu.h         |  3 ++-
 target-arm/cpu64.c       |  2 ++
 target-arm/kvm64.c       | 17 ++++++++++++++---
 6 files changed, 59 insertions(+), 6 deletions(-)

-- 
1.8.3.1

