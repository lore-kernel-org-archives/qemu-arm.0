Received: by 10.25.77.65 with SMTP id a62csp623950lfb;
        Fri, 10 Feb 2017 10:55:43 -0800 (PST)
X-Received: by 10.55.64.139 with SMTP id n133mr9646723qka.38.1486752943558;
        Fri, 10 Feb 2017 10:55:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e184si1905301qkc.72.2017.02.10.10.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Feb 2017 10:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ccGM9-0001gK-1O
	for alex.bennee@linaro.org; Fri, 10 Feb 2017 13:55:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ccGM2-0001eQ-LF
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 13:55:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ccGLz-0000X1-BG
	for qemu-arm@nongnu.org; Fri, 10 Feb 2017 13:55:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53576)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ccGLz-0000WT-4c; Fri, 10 Feb 2017 13:55:31 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 522A08048A;
	Fri, 10 Feb 2017 18:55:30 +0000 (UTC)
Received: from [10.3.117.54] (ovpn-117-54.phx2.redhat.com [10.3.117.54])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1AItTFG002609; Fri, 10 Feb 2017 13:55:30 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1486504171-26807-1-git-send-email-wei@redhat.com>
	<CAFEAcA8+3+ZwOeA0cNXF_BRs-kivTye5bj7pcRsDAsJ4S1HwTg@mail.gmail.com>
	<CAFEAcA8QFWi8-XmJyiWM15y8dUqFCbaqt9wuZ70Y7_Qgsa=CyQ@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <513c93db-34fc-ab17-aa12-fb956f8f1467@redhat.com>
Date: Fri, 10 Feb 2017 12:55:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8QFWi8-XmJyiWM15y8dUqFCbaqt9wuZ70Y7_Qgsa=CyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 10 Feb 2017 18:55:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V3 0/4] Add vPMU vPMU support under TCG mode
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
X-TUID: qybZcXyEXtnC



On 02/10/2017 09:11 AM, Peter Maydell wrote:
> On 10 February 2017 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 7 February 2017 at 21:49, Wei Huang <wei@redhat.com> wrote:
>>> QEMU has implemented cycle count support for guest VM under TCG mode.
>>> But this feature is not complete. In fact using perf inside a
>>> 64-bit Linux guest VM (under TCG) can cause the following kernel panic
>>> because some PMU registers are not implemented.
>>>
>>> [  329.445970] [<fffffe000009e600>] armv8pmu_enable_event+0x58/0x8c
>>> [  329.446713] [<fffffe0000621e74>] armpmu_start+0x4c/0x74
>>>
>>> This patchset solves the problem by adding support for missing vPMU
>>> registers. Basic perf test can work (both ACPI and DT) now under TCG
>>> by applying this patchset.
>>>
>>> address@hidden ~]# perf stat ls
>>>  Performance counter stats for 'ls':
>>>
>>>         226.740256      task-clock (msec)         #    0.312 CPUs utilized
>>>                 76      context-switches          #    0.335 K/sec
>>>                  0      cpu-migrations            #    0.000 K/sec
>>>                 64      page-faults               #    0.282 K/sec
>>>        186,031,410      cycles                    #    0.820 GHz      (36.40%)
>>>    <not supported>      stalled-cycles-frontend
>>>    <not supported>      stalled-cycles-backend
>>>      <not counted>      instructions               (0.00%)
>>>    <not supported>      branches
>>>      <not counted>      branch-misses              (0.00%)
>>>
>>> V2->V3:
>>>  * Remove PMXEVCNTR_EL0 support
>>>  * Add read access support for PMXEVTYPER and change the CONSTRAINED
>>>    UNPREDICTABLE behavior of PMXEVTYPER to RAZ/WI.
>>>
>>> V1->V2:
>>>   * Change most PMU registers to 64bit and the behavior of PMXEVTYPER
>>>   * Add support for PMXEVCNTR_EL0
>>>   * Misc fixes (DT, ID_AA64DFR0_EL1, ...) under TCG mod
>>
>> Applied to target-arm.next, thanks.
> 
> ...though patch 1 breaks compilation of linux-user targets. I've
> fixed it up by moving the #ifndef CONFIG_USER_ONLY to the right
> place to cover the new regdefs.

My bad. I normally did compilation for all targets + "make check" before
sending patches out. But on that particular machine, qemu was configured
for aarch64-softmmu only, thus missing this compilation error ...

> 
> thanks
> -- PMM
> 
