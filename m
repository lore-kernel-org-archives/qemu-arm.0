Received: by 10.80.166.35 with SMTP id d32csp743184edc;
        Thu, 27 Oct 2016 10:35:35 -0700 (PDT)
X-Received: by 10.176.65.167 with SMTP id 36mr7700414uap.75.1477589735893;
        Thu, 27 Oct 2016 10:35:35 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si3865775vkd.113.2016.10.27.10.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 10:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzoaV-0006Nd-53
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 13:35:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzoHY-0007zr-QF
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 13:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bzoHX-0004oT-46
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 13:16:00 -0400
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:35836)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bzoHW-0004o4-UM
	for qemu-devel@nongnu.org; Thu, 27 Oct 2016 13:15:59 -0400
Received: by mail-ua0-x22b.google.com with SMTP id 12so34205267uas.2
	for <qemu-devel@nongnu.org>; Thu, 27 Oct 2016 10:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z9YKoH5Nbwrp3n2d8fQrnz/S9zAoVrg9xJTIeiSAcLk=;
	b=j/MWqIgq9lpi8YPwjTKJge35fw8o33X3IkJeEAf9ddcDkJgj+tFvpoaYOpv5rw/kIa
	kZfgGPMuaqtkfVF/Q2yDtA2pv7/1Vj+5xNwdCS61gE+zZjfH84PEZ8jyL0COlt/fnEvL
	DGSNF+f07SUHAIBgks4D9EBBQFwhXT3nF36F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z9YKoH5Nbwrp3n2d8fQrnz/S9zAoVrg9xJTIeiSAcLk=;
	b=TTXLRl7IBhEChk0/t6T05JXCDZx6GHNXOAcmUNyxAsInL4tHk37cjPOGf25vjqUUEP
	pvVqNuWNjnDFdZlRQRS616/F67LG5WKmpFoWQJgvickTFiPFuNMNUCxoAnu8qtSg36J0
	DCrwPA9nv6ZYZ2pMdxhexG4u8oMfZCbhnVGqfuPtFWRwfHkjRRfE40tymvxRlD1yRwCr
	1bJBtT84T2HArv76AzgvNeq7oyeUOPRB3iNgnhBgNSutucpbZN7O1lS7g9M/J2L+43Vd
	xDE/i68dPvoyQJ3Jfk2Dhtcmn+FD7C7dbwJtvbvAHcnfZXRVUdxxlWzVn/P/C0odppMd
	5PNQ==
X-Gm-Message-State: ABUngvcXzQaBTCBH0p+2/FGw4kn3Rj+WiyB3d1WZ9OtWPtiCfvwy+6ee19JmA8cbunji5c6OSJ21HZC9Dno+B390
X-Received: by 10.176.80.101 with SMTP id z34mr7623508uaz.140.1477588558138;
	Thu, 27 Oct 2016 10:15:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 27 Oct 2016 10:15:37 -0700 (PDT)
In-Reply-To: <d26e1644-06b0-12e7-2d3c-7e871fe1ecfd@redhat.com>
References: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
	<d26e1644-06b0-12e7-2d3c-7e871fe1ecfd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2016 18:15:37 +0100
Message-ID: <CAFEAcA8heQy52Z5BtrijWrQQ0Rka1rhgw+JObTYnT6a3jQ2s_g@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-devel] [PATCH V8 0/2] Add option to configure guest vPMU
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBLOeWPlU1jj

On 27 October 2016 at 18:06, Wei Huang <wei@redhat.com> wrote:
>
>
> On 10/27/2016 09:28 AM, Peter Maydell wrote:
>> On 26 October 2016 at 07:28, Wei Huang <wei@redhat.com> wrote:
>>> This patchset adds a pmu=[on/off] option to enable/disable vPMU support
>>> for guest VM. There are several reasons to justify this option. First,
>>> vPMU can be problematic for cross-migration between different SoC as perf
>>> counters are architecture-dependent. It is more flexible to have an option
>>> to turn it on/off. Secondly this option matches the "pmu" option as
>>> supported in libvirt. To make sure backward compatible, a PMU-related
>>> property is added to mach-virt machine types.
>>
>> (Sorry, sent this as a reply to the v7 patch; resending to
>> attach it to the right thread...)
>>
>> So what actually are we defining as "the PMU exists" here?
>
> "PMU exists" means that PMUv3 presence can be detected and related
> driver can be loaded for guest VM:
> * For DT: perf_event.c checks the presence of "armv8-pmuv3" in DT and do
> armv8pmu_probe_pmu().
> * For ACPI: Jeremy Linton submitted an ACPI-based ARM driver for
> upstream. This can be loaded when "PMU exists" is detected.
>
> Link:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-March/415372.html
>
>> The PMU exists in ARMv7 and we do actually implement it
>> in TCG for v7 and v8 cores (though it is a minimal
>> architecturally-valid implementation which implements no events,
>> only the cycle counter).
>
> This option shouldn't affect the existing TCG implementation. It only
> touch the recent hardware-assisted vPMU implemented by Shannon. In other
> words, it adds an option for users to turn off Shannon's vPMU (for the
> reasons of migration compatibility, etc)

Right, but at the moment the commit message says there's no
PMU in TCG at all. What's missing that causes there not to be one?
(I think maybe we just don't report it in the feature register,
which might be a bug.)

>> Should the PMU registers in TCG which we currently provide on
>> any v7-and-better CPU be hung off ARM_FEATURE_PMU instead ?
>> (this would result in the behaviour of virt-2.6 for TCG
>> changing in that we stop providing the PMU when we did
>> before, but I guess that's OK.)
>>
>
> So you want to disable cycle_count for TCG mode? Reading ARM doc, I
> think cycle_count is minimally required for ARM (correct me if I am
> wrong). Here is the description for PMCR.N bits:
>
> "Number of event counters. A RO field that indicates the number counters
> implemented. A value of 0b00000 in this field indicates that only the
> Cycle Count Register PMCCNTR_EL0 is implemented. The value of this field
> is the number of event counters implemented. This value is in the range
> of 0b00000 , in which case only the PMCCNTR_EL0 is  implemented, to
> 0b11111 , which indicates that the PMCCNTR_EL0 and 31 event counters are
> implemented."
>
> If we want to disable cycle_count, QEMU has to declare PMCR
> in-accessible, right?

The cycle counter is required if the PMU exists, but the whole PMU
is optional. If the user says 'pmu=off' then shouldn't we be
disabling the implementation in TCG?

thanks
-- PMM
