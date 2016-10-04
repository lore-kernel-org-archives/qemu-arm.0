Received: by 10.80.163.71 with SMTP id 65csp2349099edn;
        Tue, 4 Oct 2016 14:53:18 -0700 (PDT)
X-Received: by 10.55.147.66 with SMTP id v63mr5763154qkd.298.1475617998353;
        Tue, 04 Oct 2016 14:53:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si3878910qkv.337.2016.10.04.14.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 14:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brXeH-0003Ch-9V
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 17:53:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1brXeD-0003Cc-2C
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 17:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1brXe8-00063M-TY
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 17:53:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1brXe8-00062m-KA; Tue, 04 Oct 2016 17:53:08 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B957C31B319;
	Tue,  4 Oct 2016 21:53:07 +0000 (UTC)
Received: from [10.10.62.185] (vpn-62-185.rdu2.redhat.com [10.10.62.185])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u94Lr5qo030765; Tue, 4 Oct 2016 17:53:06 -0400
To: qemu-arm@nongnu.org
References: <1475617134-28180-1-git-send-email-wei@redhat.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <f06e8589-2f79-6c56-50a1-417d9728304f@redhat.com>
Date: Tue, 4 Oct 2016 16:53:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475617134-28180-1-git-send-email-wei@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 04 Oct 2016 21:53:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V6 0/2] Add option to configure guest vPMU
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P2cehci3MmbR

On 10/04/2016 04:38 PM, Wei Huang wrote:
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
>   CONFIG (qemu-system-aarch64)                       vPMU   WARNING
>   -M virt-2.8/virt,accel=kvm -cpu host               NO     NO
>   -M virt-2.8/virt,accel=kvm -cpu host,pmu=off       NO     NO
>   -M virt-2.8/virt,accel=kvm -cpu host,pmu=on        YES    NO

Hi Peter,

I just updated this patchset to comply with the recent addition of 2.8
machine type. Please let me know if you have any comments.

>   -M virt-2.7,accel=kvm -cpu host                    YES    NO
>   -M virt-2.7,accel=kvm -cpu host,pmu=off            NO     NO
>   -M virt-2.7,accel=kvm -cpu host,pmu=on             YES    NO
>   -M virt-2.6,accel=kvm -cpu host                    NO     NO
>   -M virt-2.6,accel=kvm -cpu host,pmu=off            NO     NO
>   -M virt-2.6,accel=kvm -cpu host,pmu=on             YES    NO
> 
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57         NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=off NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a57,pmu=on  NO     "No KVM"
>   -M virt-2.7,accel=tcg -cpu cortex-a57              NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
>   -M virt-2.6,accel=tcg -cpu cortex-a57              NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=off      NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a57,pmu=on       NO     "No KVM"
> 
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15         NO     NO
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=off NO     "No PMU property"
>   -M virt-2.8/virt,accel=tcg -cpu cortex-a15,pmu=on  NO     "No PMU property"
>   -M virt-2.7,accel=tcg -cpu cortex-a15              NO     NO
>   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
>   -M virt-2.7,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
>   -M virt-2.6,accel=tcg -cpu cortex-a15              NO     NO
>   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=off      NO     "No PMU property"
>   -M virt-2.6,accel=tcg -cpu cortex-a15,pmu=on       NO     "No PMU property"
> 
>   * "NO KVM" msg
>     warning: pmu can't be enabled without KVM acceleration
>   * "No PMU property" msg
>     can't apply global cortex-a15-arm-cpu.pmu=off: Property '.pmu' not found
> 
> V5->V6:
>   * adapt patches for new machine type 2.8
> 
> V4->V5:
>   * remove comment change for has_pmu
>   * remove warning msg when pmu_default_on=TRUE && has_pmu=AUTO && tcg=TRUE
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
>  hw/arm/virt.c            | 19 ++++++++++++++++++-
>  target-arm/cpu.c         | 23 +++++++++++++++++++++++
>  target-arm/cpu.h         |  3 ++-
>  target-arm/cpu64.c       |  2 ++
>  target-arm/kvm64.c       | 17 ++++++++++++++---
>  6 files changed, 60 insertions(+), 6 deletions(-)
> 
