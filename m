Received: by 10.80.163.71 with SMTP id 65csp1335577edn;
        Wed, 21 Sep 2016 00:39:01 -0700 (PDT)
X-Received: by 10.55.8.138 with SMTP id 132mr42050417qki.198.1474443541582;
        Wed, 21 Sep 2016 00:39:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id l21si23790659qtb.119.2016.09.21.00.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Sep 2016 00:39:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmc7R-0005sr-57
	for alex.bennee@linaro.org; Wed, 21 Sep 2016 03:39:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmc7N-0005sl-6R
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 03:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bmc7I-0005LU-Tc
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 03:38:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bmc7I-0005Kl-K9; Wed, 21 Sep 2016 03:38:52 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4744F2203C;
	Wed, 21 Sep 2016 07:38:51 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-108.brq.redhat.com [10.40.204.108])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8L7clcs005765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 21 Sep 2016 03:38:49 -0400
Date: Wed, 21 Sep 2016 09:38:47 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20160921073847.w7izmynmojadyqfq@hawk.localdomain>
References: <1474425234-31412-1-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474425234-31412-1-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 21 Sep 2016 07:38:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V4 0/2] Add option to configure
 guest vPMU
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
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5HD/Q1Nb/5kk

On Tue, Sep 20, 2016 at 10:33:52PM -0400, Wei Huang wrote:
> This patchset adds a pmu=[on/off] option to enable/disable vPMU support 
> for guest VM. There are several reasons to justify this option. First,
> vPMU can be problematic for cross-migration between different SoC as perf
> counters are architecture-dependent. It is more flexible to have an option
> to turn it on/off. Secondly this option matches the "pmu" option as
> supported in libvirt. To make sure backward compatible, a PMU-related
> property is added to mach-virt machine types.
> 
> The following are testing results with this patchset. Other combinations
> should have similar results:
>     CONFIG (qemu-system-aarch64)                    vPMU   WARNING
>     -M virt-2.7,accel=kvm -cpu host                  YES    NO
>     -M virt-2.7,accel=kvm -cpu host,pmu=off          NO     NO
>     -M virt-2.7,accel=kvm -cpu host,pmu=on           YES    NO
>     -M virt-2.6,accel=kvm -cpu host                  NO     NO
>     -M virt-2.6,accel=kvm -cpu host,pmu=off          NO     NO
>     -M virt-2.6,accel=kvm -cpu host,pmu=on           YES    NO
> 
>     -M virt-2.7,accel=tcg -cpu cortex-a57            NO     "No KVM"

We don't want this one above to warn.

>     -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off    NO     NO
>     -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on     NO     "No KVM"
>     -M virt-2.6,accel=tcg -cpu cortex-a57            NO     NO
>     -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off    NO     NO
>     -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on     NO     "No KVM"
> 
>     -M virt-2.7,accel=tcg -cpu cortex-a15            NO     NO
>     -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off    NO     "No PMU property"
>     -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on     NO     "No PMU property"
>     -M virt-2.6,accel=tcg -cpu cortex-a15            NO     NO
>     -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off    NO     "No PMU property"
>     -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on     NO     "No PMU property"
> 
>     * "NO KVM" msg
>       warning: pmu can't be enabled without KVM acceleration
>     * "No PMU property" msg
>       can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found
> 
> V3->V4:
>   * change has_pmu from Boolean to OnOffAuto to handle different cases
>   * "pmu" property is re-defined as DEFINE_PROP_ON_OFF_AUTO
> 
> V2->V3:
>   * revise patch 1 commit msg and if-else statement (Drew) 
>   * move property field into VirtMachineClass (Drew)
> 
> V1->V2:
>   * keep the original field name as "has_pmu"
>   * add a warning message when PMU is turned on without KVM
>   * use the feature bit to check PMU availability, instead of using has_pmu
>   * add PMU compat support to mach-virt machine type
> 
> RFC->V1:
>   * set default pmu=off
>   * change struct ARMCPU field name "has_pmu" ==> "has_host_pmu"
>   * like el3, add a new feature ARM_FEATURE_HOST_PMU
>   * "pmu" property becomes CPU dependent. Only cortex-a53/cortex-a57/host
>     running on kvm supports this option.
> 
> Thanks,
> -Wei
> 
> Wei Huang (2):
>   arm64: Add an option to turn on/off vPMU support
>   arm: virt: add PMU property to mach-virt machine type
> 
>  hw/arm/virt-acpi-build.c |  2 +-
>  hw/arm/virt.c            | 18 +++++++++++++++++-
>  target-arm/cpu.c         | 23 +++++++++++++++++++++++
>  target-arm/cpu.h         |  5 +++--
>  target-arm/cpu64.c       |  2 ++
>  target-arm/kvm64.c       | 17 ++++++++++++++---
>  6 files changed, 60 insertions(+), 7 deletions(-)
> 
> -- 
> 1.8.3.1
> 
> 
