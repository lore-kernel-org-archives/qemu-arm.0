Received: by 10.80.166.35 with SMTP id d32csp828703edc;
        Thu, 27 Oct 2016 13:53:28 -0700 (PDT)
X-Received: by 10.31.146.131 with SMTP id u125mr8486421vkd.16.1477601607712;
        Thu, 27 Oct 2016 13:53:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i187si4485552vkd.94.2016.10.27.13.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 13:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzrfz-0008Hi-4L
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 16:53:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzrfv-0008HQ-0F
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 16:53:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzrfr-0005Re-TS
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 16:53:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46020)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bzrfr-0005Pz-La; Thu, 27 Oct 2016 16:53:19 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F7CEC057FA5;
	Thu, 27 Oct 2016 20:53:18 +0000 (UTC)
Received: from [10.10.49.82] (vpn-49-82.rdu2.redhat.com [10.10.49.82])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RKrGsY027075; Thu, 27 Oct 2016 16:53:16 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
	<d26e1644-06b0-12e7-2d3c-7e871fe1ecfd@redhat.com>
	<CAFEAcA8heQy52Z5BtrijWrQQ0Rka1rhgw+JObTYnT6a3jQ2s_g@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <379c3411-a2ff-1004-370e-e6bb976c1d7a@redhat.com>
Date: Thu, 27 Oct 2016 15:53:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8heQy52Z5BtrijWrQQ0Rka1rhgw+JObTYnT6a3jQ2s_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 27 Oct 2016 20:53:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V8 0/2] Add option to configure
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wzpZeoW8JL0j



On 10/27/2016 12:15 PM, Peter Maydell wrote:
> On 27 October 2016 at 18:06, Wei Huang <wei@redhat.com> wrote:
>>
>>
>> On 10/27/2016 09:28 AM, Peter Maydell wrote:
>>> On 26 October 2016 at 07:28, Wei Huang <wei@redhat.com> wrote:
>>>> This patchset adds a pmu=[on/off] option to enable/disable vPMU support
>>>> for guest VM. There are several reasons to justify this option. First,
>>>> vPMU can be problematic for cross-migration between different SoC as perf
>>>> counters are architecture-dependent. It is more flexible to have an option
>>>> to turn it on/off. Secondly this option matches the "pmu" option as
>>>> supported in libvirt. To make sure backward compatible, a PMU-related
>>>> property is added to mach-virt machine types.
>>>
>>> (Sorry, sent this as a reply to the v7 patch; resending to
>>> attach it to the right thread...)
>>>
>>> So what actually are we defining as "the PMU exists" here?
>>
>> "PMU exists" means that PMUv3 presence can be detected and related
>> driver can be loaded for guest VM:
>> * For DT: perf_event.c checks the presence of "armv8-pmuv3" in DT and do
>> armv8pmu_probe_pmu().
>> * For ACPI: Jeremy Linton submitted an ACPI-based ARM driver for
>> upstream. This can be loaded when "PMU exists" is detected.
>>
>> Link:
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-March/415372.html
>>
>>> The PMU exists in ARMv7 and we do actually implement it
>>> in TCG for v7 and v8 cores (though it is a minimal
>>> architecturally-valid implementation which implements no events,
>>> only the cycle counter).
>>
>> This option shouldn't affect the existing TCG implementation. It only
>> touch the recent hardware-assisted vPMU implemented by Shannon. In other
>> words, it adds an option for users to turn off Shannon's vPMU (for the
>> reasons of migration compatibility, etc)
> 
> Right, but at the moment the commit message says there's no
> PMU in TCG at all. What's missing that causes there not to be one?
> (I think maybe we just don't report it in the feature register,
> which might be a bug.)

This sounds like a bug (or incomplete). In current version of QEMU, if I
forced vPMU declaration in the feature register under TCG mode, PMU
driver will be loaded in VM. But as soon as "perf stat" is executed,
guest VM panic. I think some features, like PMU IRQ, is still missing
for TCG to turn vPMU on. I will debug it further.

> 
>>> Should the PMU registers in TCG which we currently provide on
>>> any v7-and-better CPU be hung off ARM_FEATURE_PMU instead ?
>>> (this would result in the behaviour of virt-2.6 for TCG
>>> changing in that we stop providing the PMU when we did
>>> before, but I guess that's OK.)
>>>
>>
>> So you want to disable cycle_count for TCG mode? Reading ARM doc, I
>> think cycle_count is minimally required for ARM (correct me if I am
>> wrong). Here is the description for PMCR.N bits:
>>
>> "Number of event counters. A RO field that indicates the number counters
>> implemented. A value of 0b00000 in this field indicates that only the
>> Cycle Count Register PMCCNTR_EL0 is implemented. The value of this field
>> is the number of event counters implemented. This value is in the range
>> of 0b00000 , in which case only the PMCCNTR_EL0 is  implemented, to
>> 0b11111 , which indicates that the PMCCNTR_EL0 and 31 event counters are
>> implemented."
>>
>> If we want to disable cycle_count, QEMU has to declare PMCR
>> in-accessible, right?
> 
> The cycle counter is required if the PMU exists, but the whole PMU
> is optional. If the user says 'pmu=off' then shouldn't we be
> disabling the implementation in TCG?
> 

Let me clarify. Assuming we can get TCG mode to support VM's PMU driver
(see discussion above, only cycle counter supported for TCG), will the
following be sufficient?
(1) ,pmu=on
perf driver can be loaded in VM, and "perf" command can use HW counters
to profile.
(2) ,pmu=off
perf feature can't be detected, so the perf driver can't be loaded
inside VM. "perf" can't use HW perf counters. But PMU registers (PMCR,
PMCCNTR, ...) can still be accessed inside VM.

OR

You prefer to disable access permission for PMU registers in (2). Note:
this is very strict. I am not sure if current KVM already follows this rule.


> thanks
> -- PMM
> 
