Received: by 10.25.21.156 with SMTP id 28csp1390422lfv;
        Fri, 29 Jul 2016 08:08:51 -0700 (PDT)
X-Received: by 10.237.53.157 with SMTP id c29mr66289453qte.75.1469804931251;
        Fri, 29 Jul 2016 08:08:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x184si12446781qkc.18.2016.07.29.08.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jul 2016 08:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bT9P8-0007v3-G5
	for alex.bennee@linaro.org; Fri, 29 Jul 2016 11:08:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bT9P1-0007rb-DJ
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:08:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bT9Oy-0004OC-5I
	for qemu-arm@nongnu.org; Fri, 29 Jul 2016 11:08:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bT9Ox-0004O7-Vk; Fri, 29 Jul 2016 11:08:40 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82F178B13E;
	Fri, 29 Jul 2016 15:08:39 +0000 (UTC)
Received: from [10.10.62.40] (vpn-62-40.rdu2.redhat.com [10.10.62.40])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6TF8bEM031593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 29 Jul 2016 11:08:38 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<CAFEAcA_x+4KesFxPfc-B=m1BF0f-yfVg=xYQLNE-XJUiXNFh=A@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <cc1a272c-c410-88f5-8a63-2258e358ae43@redhat.com>
Date: Fri, 29 Jul 2016 10:08:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_x+4KesFxPfc-B=m1BF0f-yfVg=xYQLNE-XJUiXNFh=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 29 Jul 2016 15:08:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 1/1] arm64: add an option to turn on/off
 vpmu support
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcY1+gj5czHm



On 07/29/2016 02:57 AM, Peter Maydell wrote:
> On 28 July 2016 at 17:38, Wei Huang <wei@redhat.com> wrote:
>> This patch adds a pmu=[on/off] option to enable/disable vpmu support
>> in guest vm. There are several reasons to justify this option. First
>> vpmu can be problematic for cross-migration between different SoC as
>> perf counters is architecture-dependent. It is more flexible to
>> have an option to turn it on/off. Secondly it matches the -cpu pmu
>> option in libivrt. This patch has been tested on both DT/ACPI modes.
> 
> 
> What particular two systems are you trying to migrate between?

One example: APM's Mustang has 5 perf counters while AMD's Seattle has 7
counters.

> In general we don't support migrating between different CPU
> types at the moment, so the PMU sholud be the same on both ends.
> 
> (If we ever do get to supporting cross-cpu-type migration
> then it will probably involve a very long and detailed command
> line to specify exactly a whole lot of things like pmu yes/no,
> number of hw breakpoints/watchpoints, and everything else that
> can differ between implementations.)
> 
> That said, I don't have any objection to making the PMU
> presence controllable (especially if we have similar
> control on x86).
> 
>> --- a/target-arm/cpu.h
>> +++ b/target-arm/cpu.h
>> @@ -579,8 +579,9 @@ struct ARMCPU {
>>      bool powered_off;
>>      /* CPU has security extension */
>>      bool has_el3;
>> -    /* CPU has PMU (Performance Monitor Unit) */
>> -    bool has_pmu;
>> +
>> +    /* CPU has vPMU (Performance Monitor Unit) support */
>> +    bool enable_pmu;
> 
> Why rename the flag? has_foo is what we use for other features,
> as you can see in the context of this bit of the patch.

I will fix it. Maybe follow the suggestion Drew's suggestion, keeping
has_pmu and add another option for turning it on/off.

> 
>>
>>      /* CPU has memory protection unit */
>>      bool has_mpu;
> 
> thanks
> -- PMM
> 
