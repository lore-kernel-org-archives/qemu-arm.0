Received: by 10.80.166.35 with SMTP id d32csp202195edc;
        Tue, 25 Oct 2016 23:36:59 -0700 (PDT)
X-Received: by 10.55.182.135 with SMTP id g129mr25145933qkf.166.1477463819494;
        Tue, 25 Oct 2016 23:36:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g12si406219qkh.166.2016.10.25.23.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 23:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzHpa-0008Io-Uw
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 02:36:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzHhO-0002Oh-Vz
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 02:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzHhN-0007S3-UQ
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 02:28:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bzHhJ-0007Ql-2x; Wed, 26 Oct 2016 02:28:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDC0F8FCF4;
	Wed, 26 Oct 2016 06:28:23 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q6SM5S009481; Wed, 26 Oct 2016 02:28:22 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Wed, 26 Oct 2016 02:28:19 -0400
Message-Id: <1477463301-17175-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 26 Oct 2016 06:28:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V8 0/2] Add option to configure guest vPMU
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
X-TUID: +iLvfztZ9JEd

This patchset adds a pmu=[on/off] option to enable/disable vPMU support 
for guest VM. There are several reasons to justify this option. First,
vPMU can be problematic for cross-migration between different SoC as perf
counters are architecture-dependent. It is more flexible to have an option
to turn it on/off. Secondly this option matches the "pmu" option as
supported in libvirt. To make sure backward compatible, a PMU-related
property is added to mach-virt machine types.

The following are testing results with this patchset:
 CONFIG (qemu-system-aarch64)                       vPMU   WARNING
  -M virt-2.8/virt,accel=kvm -cpu host               YES    NO
  -M virt-2.8/virt,accel=kvm -cpu host,pmu=off       NO     NO
  -M virt-2.8/virt,accel=kvm -cpu host,pmu=on        YES    NO
  -M virt-2.7,accel=kvm -cpu host                    YES    NO
  -M virt-2.7,accel=kvm -cpu host,pmu=off            NO     NO
  -M virt-2.7,accel=kvm -cpu host,pmu=on             YES    NO
  -M virt-2.6,accel=kvm -cpu host                    NO     NO
  -M virt-2.6,accel=kvm -cpu host,pmu=off            NO     NO
  -M virt-2.6,accel=kvm -cpu host,pmu=on             NO     NO

  -M virt-2.8/virt,accel=tcg -cpu cortex-a57         NO     NO
  -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=off NO     NO
  -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=on  NO     NO
  -M virt-2.7,accel=tcg -cpu cortex-a57              NO     NO
  -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
  -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on       NO     NO
  -M virt-2.6,accel=tcg -cpu cortex-a57              NO     NO
  -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
  -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on       NO     NO

  -M virt-2.8/virt,accel=tcg -cpu cortex-a15         NO     NO
  -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=off NO     "No PMU property"
  -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=on  NO     "No PMU property"
  -M virt-2.7,accel=tcg -cpu cortex-a15              NO     NO
  -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
  -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
  -M virt-2.6,accel=tcg -cpu cortex-a15              NO     NO
  -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
  -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"

  * "No PMU property" msg
    can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found

V7->V8:
  * add back the "pmu" property for TCG mode

V6->V7:
  * change has_pmu variable type from OnOffAuto to Boolean
  * only add "pmu" property to CPU under kvm mode, default ON
  * set no_pmu=true for machvirt-2.6

V5->V6:
  * adapt patches for new machine type 2.8

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
  arm: Add an option to turn on/off vPMU support
  arm: virt: add PMU property to mach-virt machine type

 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            |  9 ++++++++-
 target-arm/cpu.c         | 15 +++++++++++++++
 target-arm/cpu.h         |  1 +
 target-arm/cpu64.c       |  2 ++
 target-arm/kvm64.c       | 17 ++++++++++++++---
 6 files changed, 41 insertions(+), 5 deletions(-)

-- 
1.8.3.1

