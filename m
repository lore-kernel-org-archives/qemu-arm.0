Received: by 10.80.166.35 with SMTP id d32csp749967edc;
        Thu, 27 Oct 2016 10:50:07 -0700 (PDT)
X-Received: by 10.31.59.1 with SMTP id i1mr8015680vka.115.1477590607114;
        Thu, 27 Oct 2016 10:50:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t124si3924996vkf.56.2016.10.27.10.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Oct 2016 10:50:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzooY-0001oq-H3
	for alex.bennee@linaro.org; Thu, 27 Oct 2016 13:50:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzo82-0007i2-Cp
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 13:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzo7z-0000CU-8z
	for qemu-arm@nongnu.org; Thu, 27 Oct 2016 13:06:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bzo7z-0000C6-0l; Thu, 27 Oct 2016 13:06:07 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B7E87AEBB;
	Thu, 27 Oct 2016 17:06:06 +0000 (UTC)
Received: from [10.10.49.82] (vpn-49-82.rdu2.redhat.com [10.10.49.82])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9RH6439019329; Thu, 27 Oct 2016 13:06:05 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <d26e1644-06b0-12e7-2d3c-7e871fe1ecfd@redhat.com>
Date: Thu, 27 Oct 2016 12:06:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_5+bm4xN_m3G+vY9StEvk2s-eqbtdXjcudn+2oFqaS7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 27 Oct 2016 17:06:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V8 0/2] Add option to configure guest vPMU
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
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1U2/8dseUlyD



On 10/27/2016 09:28 AM, Peter Maydell wrote:
> On 26 October 2016 at 07:28, Wei Huang <wei@redhat.com> wrote:
>> This patchset adds a pmu=[on/off] option to enable/disable vPMU support
>> for guest VM. There are several reasons to justify this option. First,
>> vPMU can be problematic for cross-migration between different SoC as perf
>> counters are architecture-dependent. It is more flexible to have an option
>> to turn it on/off. Secondly this option matches the "pmu" option as
>> supported in libvirt. To make sure backward compatible, a PMU-related
>> property is added to mach-virt machine types.
> 
> (Sorry, sent this as a reply to the v7 patch; resending to
> attach it to the right thread...)
> 
> So what actually are we defining as "the PMU exists" here?

"PMU exists" means that PMUv3 presence can be detected and related
driver can be loaded for guest VM:
* For DT: perf_event.c checks the presence of "armv8-pmuv3" in DT and do
armv8pmu_probe_pmu().
* For ACPI: Jeremy Linton submitted an ACPI-based ARM driver for
upstream. This can be loaded when "PMU exists" is detected.

Link:
http://lists.infradead.org/pipermail/linux-arm-kernel/2016-March/415372.html

> The PMU exists in ARMv7 and we do actually implement it
> in TCG for v7 and v8 cores (though it is a minimal
> architecturally-valid implementation which implements no events,
> only the cycle counter).

This option shouldn't affect the existing TCG implementation. It only
touch the recent hardware-assisted vPMU implemented by Shannon. In other
words, it adds an option for users to turn off Shannon's vPMU (for the
reasons of migration compatibility, etc)

> 
> Should the PMU registers in TCG which we currently provide on
> any v7-and-better CPU be hung off ARM_FEATURE_PMU instead ?
> (this would result in the behaviour of virt-2.6 for TCG
> changing in that we stop providing the PMU when we did
> before, but I guess that's OK.)
> 

So you want to disable cycle_count for TCG mode? Reading ARM doc, I
think cycle_count is minimally required for ARM (correct me if I am
wrong). Here is the description for PMCR.N bits:

"Number of event counters. A RO field that indicates the number counters
implemented. A value of 0b00000 in this field indicates that only the
Cycle Count Register PMCCNTR_EL0 is implemented. The value of this field
is the number of event counters implemented. This value is in the range
of 0b00000 , in which case only the PMCCNTR_EL0 is  implemented, to
0b11111 , which indicates that the PMCCNTR_EL0 and 31 event counters are
implemented."

If we want to disable cycle_count, QEMU has to declare PMCR
in-accessible, right?

> thanks
> -- PMM
> 
