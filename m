Received: by 10.223.134.117 with SMTP id 50csp10778630wrw;
        Tue, 2 Jan 2018 04:59:48 -0800 (PST)
X-Google-Smtp-Source: ACJfBosCJ+GZ9ZUnsEhwqLTzpCFZen7jFf9ocDdxkckaKbjUIU1skJ+VS8Kd0RpTZDiNrBiCEnnm
X-Received: by 10.129.168.136 with SMTP id f130mr31598633ywh.457.1514897988175;
        Tue, 02 Jan 2018 04:59:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514897988; cv=none;
        d=google.com; s=arc-20160816;
        b=xLsMhdSR4zFaUBclySemglrXXcfjB7HlkMxBZciR/H72gCwYSMTkYg89PF1vgTsEnI
         7324fNeWN/9SKFELo2S/KztW8aUfJCIokXYzdFEtbhoFGhvZ8OUdLqQPR4VK/Y/LXXRB
         QsAK3JMIOx1T02tFu061vrLs2t5CH4GtvqF5MTDSfr8AWnEv8QfazrBFKMVkX+dBYKNA
         oTcqvk5RZyOvKQtFM/Xxzn93A+GKfV0v/8an7HwUQb2+sUGE3fpcYZHw9owjuvgzZ8IF
         U4eXUFShyYpkq6Sakfl4VSEwzLpwguoYxU+ZnrxUKcCw9HuH33d+GSeM7N2Bu/dAaTQo
         F4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from
         :arc-authentication-results;
        bh=hrJRK102saKYDnEJB3YZSr3dqG3idpQpuCZuQydXl8k=;
        b=FgxNrnchwmS25z8HulafuPCaO5fIhMKwDudvndHyIgETKLhvA6LeFhoDPf21a+W4/D
         FFKbQs/u8p66S/gQquA4purS3xotc3r9mQUsUTL4hpjnzdAg9xt5ipmUr7cSQlGN/QDt
         i72UurNwOpjuYuWKJyxWGrZt1aTS9e5J5Ezu3andiCLrtvqaUZkxvLB8qQOMNkcub1vf
         FY4AOrrCyJLedCsUyDYh8ssguc2RQ1JavHvaRBulCLfOi6vGLUZrpNUXaOQ6EADoYu6G
         uSe6A3sLEvzBaHveFj96+gXXY7NqMZbtrS0Ig8BQFlqzd/MilwA7rcjQDZy6v4q0V8wM
         XuWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r138si8382020ywe.73.2018.01.02.04.59.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 04:59:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWMAV-00028o-KV
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 07:59:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eWMAH-00027k-Nw
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 07:59:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eWMAE-0003RV-NZ
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 07:59:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eWMAE-0003RG-EU; Tue, 02 Jan 2018 07:59:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD0819D1F8;
	Tue,  2 Jan 2018 12:59:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-115.ams2.redhat.com
	[10.36.116.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 338865D965;
	Tue,  2 Jan 2018 12:59:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A7687113864C; Tue,  2 Jan 2018 13:59:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
	<CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
Date: Tue, 02 Jan 2018 13:59:26 +0100
In-Reply-To: <CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
	(Alistair Francis's message of "Fri, 22 Dec 2017 12:58:53 -0800")
Message-ID: <87608k4dsh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 02 Jan 2018 12:59:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ZJBx2LMyHnt

Alistair Francis <alistair.francis@xilinx.com> writes:

> On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>
>>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>>> Second thoughts...
>>>>>
>>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>> [...]
>>>>>>  #include "qemu/osdep.h"
>>>>>> +#include "qemu/error-report.h"
>>>>>>  #include "qapi/error.h"
>>>>>>  #include "qemu-common.h"
>>>>>>  #include "cpu.h"
>>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>>      /* TODO: update clocks */
>>>>>>
>>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>>> -                        __func__);
>>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>>> +                     __func__);
>>>>>>  }
>>>>>
>>>>> This one's different: we neither exit() nor return a "failed" status to
>>>>> the caller.
>>>>>
>>>>> We get here when the guest writes something funny to a certain
>>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>>> a user error.  I doubt it should be reported with error_report().
>>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>>
>>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>>
>>> That seems like the best option to me.
>>
>> Suggest:
>>
>> 1. Keep converting fatal errors (the ones that exit())
>>
>> 2. Keep converting recoverable errors (the ones that return failure)
>>
>> 3. You can leave the prints that are neither alone.  You can also
>>    convert to logging or tracing, as appropriate, but that requires
>>    understanding the code.
>>
>> Makes sense?
>
> Does this apply to new patches after this series or to this series as
> well? The series is mostly just mechanical find/replace. I really
> don't want to have to dig through every patch to figure out what to
> change/not change.

I understand your reluctance to sort patch hunks into buckets 1., 2. and
3. manually: there's an awful lot of hunks to sort.

We know we have many fprintf() that should be error_report(),
error_setg(), logging or tracing.

We know we have error_report() that should be error_setg().

Converting fprintf() to error_report() where we should really use
something else makes the situation worse, I'm afraid.

Since we need to sort, and sorting manually isn't practical, we need to
automate.

The patterns to recognize are 1. fprintf() followed by exit() and
2. fprintf() followed by return failure.

Recognizing the patterns when there's stuff between fprintf() and exit()
/ return may exceed sed's power.  Feels like a Coccinelle job to me.
Let's focus on the common case where exit() / return follows fprintf()
immediately.

Let's start with the easiest case: exit().  I figure that's still in
reach of your find + sed tooling.

Recognizing "return failure" is slightly harder, because error values
aren't always obvious.  Common ones are return NULL, return -1, return
-EFOO.

I hope that peeling off truly simple cases like this will reduce the
remaining hunks sufficiently to permit manual review.  If it doesn't, we
should still get a major part of your work without making the situation
worse.
