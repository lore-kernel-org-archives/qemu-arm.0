Received: by 10.25.21.156 with SMTP id 28csp478732lfv;
        Fri, 12 Aug 2016 23:06:25 -0700 (PDT)
X-Received: by 10.55.8.129 with SMTP id 123mr22330203qki.198.1471068385160;
        Fri, 12 Aug 2016 23:06:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z45si7067609qta.27.2016.08.12.23.06.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 23:06:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYS5Q-0000tS-Jp
	for alex.bennee@linaro.org; Sat, 13 Aug 2016 02:06:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bYS5N-0000tI-Jf
	for qemu-arm@nongnu.org; Sat, 13 Aug 2016 02:06:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bYS5I-0008Al-Hh
	for qemu-arm@nongnu.org; Sat, 13 Aug 2016 02:06:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bYS5I-0008Ab-Bb; Sat, 13 Aug 2016 02:06:16 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CB9761E50;
	Sat, 13 Aug 2016 06:06:15 +0000 (UTC)
Received: from [10.10.57.223] (vpn-57-223.rdu2.redhat.com [10.10.57.223])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7D66DoX020504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 13 Aug 2016 02:06:14 -0400
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
	<1470058019.3971.13.camel@redhat.com>
	<CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <da84a3fb-79d9-bb15-0784-9f635b6363cf@redhat.com>
Date: Sat, 13 Aug 2016 01:06:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 13 Aug 2016 06:06:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fpllxyZOclMT



On 08/01/2016 08:32 AM, Peter Maydell wrote:
> On 1 August 2016 at 14:26, Andrea Bolognani <abologna@redhat.com> wrote:
>> On Mon, 2016-08-01 at 15:08 +0200, Andrew Jones wrote:
>>>> I'm not sure a warning is enough: if I start a guest and
>>>> explicitly ask for a PMU, I expect it to be there, or for
>>>> the guest not to start at all. How does x86 behave in this
>>>> regard?
>>>
>>> Peter had a good suggestion for this. We need to wrap the property
>>> addition in an arm_feature check like the has_el3 property. That will
>>> remove it from all cpu types that don't support it.
>>
>> Wouldn't that mean that you'd be unable to use
>>
>>   -cpu foo,pmu=off
>>
>> if CPU model 'foo' doesn't support a PMU? I'd expect that
>> to work.
> 
> The current precedent (has_el3) doesn't work like that: if
> foo isn't a CPU which can support EL3 then the property doesn't
> exist, and it's an error to try to set it.

V1 sent. I tried to follow everyone's advice. See the following:

* set default pmu=off
* like el3, add a new feature ARM_FEATURE_HOST_PMU
* "pmu" property becomes CPU dependent. Only cortex-a53/cortex-a57/host
under certain mode support this option
* change struct ARMCPU field name "has_pmu" ==> "has_host_pmu" because
IMO "has_pmu" is misleading

BTW answering Andrea's question above: "-cpu foo,pmu=off" won't be
allowed in this patch if CPU "foo" doesn't support host-backed PMU. QEMU
will fail to run in this case. Maybe this is what we want?

Thanks,
-Wei

> 
> thanks
> -- PMM
> 
