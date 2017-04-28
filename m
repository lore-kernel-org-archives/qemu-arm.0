Received: by 10.25.0.144 with SMTP id 138csp212386lfa;
        Fri, 28 Apr 2017 06:58:32 -0700 (PDT)
X-Received: by 10.237.62.115 with SMTP id m48mr10103731qtf.192.1493387911898;
        Fri, 28 Apr 2017 06:58:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a3si6056879qth.135.2017.04.28.06.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 06:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d46Pn-00009b-D2
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 09:58:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d46Pi-000098-W7
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 09:58:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1d46Pf-0002y1-Uy
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 09:58:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59872)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1d46Pf-0002xn-O7; Fri, 28 Apr 2017 09:58:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 507F741A3E;
	Fri, 28 Apr 2017 13:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 507F741A3E
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=wei@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 507F741A3E
Received: from [10.10.123.28] (ovpn-123-28.rdu2.redhat.com [10.10.123.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76320183FA;
	Fri, 28 Apr 2017 13:58:21 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
	<CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
	<4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com>
	<CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <8b782ee5-3545-3cb5-3b09-209fcffee7e4@redhat.com>
Date: Fri, 28 Apr 2017 08:58:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 28 Apr 2017 13:58:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Fix compilation dependency
 issues of CONFIG_ARM_V7M
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IptJNDxJzpv0



On 04/28/2017 07:09 AM, Peter Maydell wrote:
> On 28 April 2017 at 01:10, Wei Huang <wei@redhat.com> wrote:
>> In our downstream code, we try to minimize the number of supported
>> devices to reduce the maintenance effort. ARM v7M is not in the
>> supported list.
>>
>> For most unsupported devices, we can remove them by configuring
>> default-configs file, except for CONFIG_ARM_V7M=y. This is because the
>> ARMv7m code in target/arm/helper.c intertwines with NVIC code. As a
>> result we have to keep NVIC and SysTick in order to compile helper.c,
>> which is not desirable.
>>
>> This patchset tries to address the problem by making NVIC and SysTick
>> removable.
> 
> I think that's the wrong way to do it. If you want to not compile
> in ARMv7M support then you need more ifdeffery in the target/arm
> code to disable the v7M code and CPUs entirely. NVIC and systick

We do disable most CPUs, which means only a limited number of CPUs
(host, cortex-a15, cortex-53/57) are left.

Using #ifdef is indeed a cleaner solution. However I can't use "#ifdef
CONFIG_ARM_V7M" & co inside target/arm/cpu.c file because CONFIG_xxx
aren't available as preprocessor directives. From what I saw the
CONFIG_xxx options can only control compiling source file. One solution
is to extract out all v7M code into separate files and use
CONFIG_ARM_V7M to direct compilation. A bit messy though. Any other
suggestions?

> are required core parts of v7M CPUs and so if they are not
> present then QEMU will claim to support the v7M cores but not
> in fact correctly do so.



> 
> thanks
> -- PMM
> 
