Received: by 10.28.173.206 with SMTP id w197csp3093786wme;
        Mon, 8 Jan 2018 16:35:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBosXHxAlOBhXkivlggE+XmKhCfcDnDYEhuRbtnAJbX5/Pi1ChNPt4oFsZ/Km6Flmf5AasBvh
X-Received: by 10.13.214.84 with SMTP id y81mr7590003ywd.499.1515458118541;
        Mon, 08 Jan 2018 16:35:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515458118; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtCvZ6bOk3CkNdqMh9p6gfoPtD4T8v98ahVH0/JUgENfz6fLcVRKAAl7t4TajjE3Bs
         tHF0XP1NGC81PgrzaPjCQUpB1RIpSitrbdJ669f+ze6uakGXg6ETYUW+B3hBIAMmyqqo
         +Mee1AX7ggNeNOcnT/wq3BJS4zoozuHFZHTmf3oEP2A4jMIfmT+dtmtXGbIqbml7zBcx
         JCHxl54rXAX+1LgNp2oqnrdfR57+TsonUhv2IbfLEMp+xeA5SMU35binuNLkNmcZiomp
         pOazYxEb3eafVnBvqxtVSQd1TA+xoxJeemqtnni0wZigYGwAIfM9Xddm4UK77KjjYRkn
         YPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KlmCdve/cVN0vZ3zxijjiV174ba7i7AY1fgWMYvI2aM=;
        b=X0bWO9a3sxJlpYOVnf2ej3R1ZjDOpRpzKTGC/7F06STjcc/LH0tIyeLl8NxAnaAISx
         ks4XwGhz4rT4mIVBp48G7tNdKJCRBimVnOVNgORRvk0936QWA4xi45Cnpt25vdnJd9/X
         jD9/9KXXlgZPHDDVM2YHBC7+9+kX87jWlDjavgRY/ONaAkpXWeHdJ/DrKUAqcgkE/Elb
         lpCMwlu6v5PaVYepmbfj2HRkuhMDfkwCiz/PNrc230gwtDveeQm/VCbS0EUtfeDlRTrU
         ZZDwabNP3wPg2Wut+09jOMstQJoLtPQnGElliGMqPEQz8BUxn7Yt1dQv9oWju5uHTbGS
         UftA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ejuEAGdA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203si665637ybo.352.2018.01.08.16.35.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 16:35:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ejuEAGdA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYhss-00035j-0Q
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 19:35:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYhr8-0002NC-Fl
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 19:33:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYhr7-0000Q0-EB
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 19:33:30 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYhr0-0000NW-Qi; Mon, 08 Jan 2018 19:33:23 -0500
Received: by mail-wm0-x244.google.com with SMTP id b76so17542207wmg.1;
	Mon, 08 Jan 2018 16:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KlmCdve/cVN0vZ3zxijjiV174ba7i7AY1fgWMYvI2aM=;
	b=ejuEAGdAwdoTeT47L5R5QAdSEECom1C31DtKdfaWs5ZtsDULsE5rrgfXEpNqcY4m7u
	FITjf0xHBw+LKh3DsPd/mYrsV9c7vaS1cb312Aw0DtVVnl28rPO1Dl/rMN0dQ/Ay+yur
	Wq3S0mu/XOkR2NQMSY+wEp7aw7O6KhjqAiE/tboGXU5jKoEYVbRBsV+K3cgQTMbMeKcg
	sy7Cim1qlrh0zmlgKkhpmTKSRcppn8lYpbbsu0JxvFvg1EeCSbgalXi5ipN7LucOaU5a
	kmFrIaNaLDr6siakBlCBewgkzdyM5gG+weAukSTPqZ7ncmmvivN+yI4npyX/M34GIVAu
	TAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KlmCdve/cVN0vZ3zxijjiV174ba7i7AY1fgWMYvI2aM=;
	b=pxJXyPzVJPh26N9kJs+5wesm+NoW+67cVgrFfwnCik2iaBf/infSlmR82a6G4XoH5c
	f194GRSS3rX90cPNSdUO0C1qwJyF/YsYtlMldG++GjwXdlexP7kehjdBG6O5eRDw9aLs
	E6FGd+WHOgoxRcT7RoouuIke2ff/C9hahqtON7fE8+UagAW9/LagansQEjfF8uoYL71m
	PEsrWO6CU2oc+gD0mrAx5pvUrtDH6RWM8Hu0HfywqIiUebxsDwHf/ADAS3l3FP8dVvGO
	bmIgZFUogvJOId1p+MhWum2mDb8UJU4MDNboDCXf4O9YK0MPOIkRZbLXhJl1tDWFTxO4
	oDsg==
X-Gm-Message-State: AKGB3mKPR7srUSJ0aLijSEaXlaKazoEuCGcwIzepIUi9JyrmpX75XDAb
	DdoBFgMHIHodGnxYbDyUwErtDNJaiw5kSqN+Np1PLfJDUas=
X-Received: by 10.28.208.79 with SMTP id h76mr9523465wmg.77.1515458001597;
	Mon, 08 Jan 2018 16:33:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 16:32:51 -0800 (PST)
In-Reply-To: <87608k4dsh.fsf@dusky.pond.sub.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
	<CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
	<87608k4dsh.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 16:32:51 -0800
X-Google-Sender-Auth: DDtYIhOfMHXLX15Au4LaJKcU1_0
Message-ID: <CAKmqyKMz2tfJwu0Q5joHm99QLbJ-psU=sSgDQtLuFKjyKRmO-A@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 07bhja1eAkTE

On Tue, Jan 2, 2018 at 4:59 AM, Markus Armbruster <armbru@redhat.com> wrote:
> Alistair Francis <alistair.francis@xilinx.com> writes:
>
>> On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>
>>>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>>>> Second thoughts...
>>>>>>
>>>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>>> [...]
>>>>>>>  #include "qemu/osdep.h"
>>>>>>> +#include "qemu/error-report.h"
>>>>>>>  #include "qapi/error.h"
>>>>>>>  #include "qemu-common.h"
>>>>>>>  #include "cpu.h"
>>>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>>>      /* TODO: update clocks */
>>>>>>>
>>>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>>>> -                        __func__);
>>>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>>>> +                     __func__);
>>>>>>>  }
>>>>>>
>>>>>> This one's different: we neither exit() nor return a "failed" status to
>>>>>> the caller.
>>>>>>
>>>>>> We get here when the guest writes something funny to a certain
>>>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>>>> a user error.  I doubt it should be reported with error_report().
>>>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>>>
>>>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>>>
>>>> That seems like the best option to me.
>>>
>>> Suggest:
>>>
>>> 1. Keep converting fatal errors (the ones that exit())
>>>
>>> 2. Keep converting recoverable errors (the ones that return failure)
>>>
>>> 3. You can leave the prints that are neither alone.  You can also
>>>    convert to logging or tracing, as appropriate, but that requires
>>>    understanding the code.
>>>
>>> Makes sense?
>>
>> Does this apply to new patches after this series or to this series as
>> well? The series is mostly just mechanical find/replace. I really
>> don't want to have to dig through every patch to figure out what to
>> change/not change.
>
> I understand your reluctance to sort patch hunks into buckets 1., 2. and
> 3. manually: there's an awful lot of hunks to sort.
>
> We know we have many fprintf() that should be error_report(),
> error_setg(), logging or tracing.
>
> We know we have error_report() that should be error_setg().
>
> Converting fprintf() to error_report() where we should really use
> something else makes the situation worse, I'm afraid.
>
> Since we need to sort, and sorting manually isn't practical, we need to
> automate.
>
> The patterns to recognize are 1. fprintf() followed by exit() and
> 2. fprintf() followed by return failure.
>
> Recognizing the patterns when there's stuff between fprintf() and exit()
> / return may exceed sed's power.  Feels like a Coccinelle job to me.
> Let's focus on the common case where exit() / return follows fprintf()
> immediately.
>
> Let's start with the easiest case: exit().  I figure that's still in
> reach of your find + sed tooling.
>
> Recognizing "return failure" is slightly harder, because error values
> aren't always obvious.  Common ones are return NULL, return -1, return
> -EFOO.
>
> I hope that peeling off truly simple cases like this will reduce the
> remaining hunks sufficiently to permit manual review.  If it doesn't, we
> should still get a major part of your work without making the situation
> worse.

Ok. So it is becoming apparent that this series is not going to be
accepted. I might just drop it and try and re-group with Coccinelle at
some point in the future.

If there is a subset of this series that is fine to go in I'm happy to
rebase and keep going, but at the moment it looks like starting again
is gong to be the least painful effort.

Alistair

>
