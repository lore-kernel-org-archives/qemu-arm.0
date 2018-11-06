Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp704359wrw;
        Tue, 6 Nov 2018 02:26:43 -0800 (PST)
X-Received: by 2002:a25:59c1:: with SMTP id n184-v6mr24977294ybb.28.1541500003842;
        Tue, 06 Nov 2018 02:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541500003; cv=none;
        d=google.com; s=arc-20160816;
        b=uoAT79bW4v/cOCZdRlcCf5oj1MU6w28SJvFO2DChZIXscvTOa+YJePNSEdIyvkcUhm
         /ssj6hH4KzZZoab/BqGn+/FVe4PPwObkthmclFXNYDX5DqpzYjG5S+aVbofaLxBbR6zR
         OxjMvYqoVLu9Yj00//APaenVhCKRKN9Eu2VKSyhKrydVQc9kR0J9678DXZSFCDOp2WCz
         2bIwDJqjVBytE95aaOdI1QpeOVegO9embLN2Fh2AvcDf2rq/LHftCjvFMzv+PIHsrhao
         XJigt5T0YSYzJG2zvA7EP6rLZk2hOdM6OWO0uelWSYmJ8Id8r7wvCuQbkiVqKBKQzm2G
         wyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=mm+5Va9VMm9aPu6+dV+pWUYrDmqWaQlgvNRXIlACrAU=;
        b=ovY9CUGqhE57XxxAr/eSDrU1tCjrhyLnRZeZI0dufMvOsek08feCqYeqiztXjcMk9c
         mKYOgm2TGkvdd8lDLMrMHkdQou6JdHOP81RiLdKW+D59i0V1C+WAkPm7Tg/6pGkZZtPx
         EtnQaFuknbqnJ6uxeOXbX3zbDZNVUdiqqC5p+zEsYCWxQNLonn9PN/SuwhLdELN1X15+
         oGsz2m/KQiNyHnHMBist3kCLBWr7byb2ER4Q5BxFd3JZlbFTWZ5PfWUltw/xOTq5jg6i
         xMZOaoOwcCnhgEZcdH4sXPG3xFA9mbKgc99R7sMSIXDjO4YODLmT70v/FPzOmvarBWIF
         6lbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ffnb43tJ;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c135-v6sor5755591ywb.163.2018.11.06.02.26.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Nov 2018 02:26:43 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ffnb43tJ;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=mm+5Va9VMm9aPu6+dV+pWUYrDmqWaQlgvNRXIlACrAU=;
        b=Ffnb43tJYjgLqmoYrpCeQCJLgmKRex6yV0KcM4EmwNg5SguQ9wFewU1jzRC6GH6eBB
         uLw6NoJErt1kyyx2Cm+ymARnn8Vxg9oGjx4tYl2YuQgOF2isWHq0b5rD+z43QwpcJRIg
         h97Hxg4umss80yw/MhcTlvn0sK43wwSJ+afSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=mm+5Va9VMm9aPu6+dV+pWUYrDmqWaQlgvNRXIlACrAU=;
        b=IL7xO9IqPs4DrqolGvOGwaVK/1bwTzOkXNQPticMOlD28lpaciLtjNhOD9ujtwUeLd
         SN1zLRH6qA/JlC6bDYPz4oGkvp+qk2EQMwI0pWT3jodvI1cPi9ZlxFaCdAuuxjGFnwzA
         rxrWNJzcOaXivq3SxajLrlF5QLVTZIVzlrcw+rQkSLYocjtyOee9pa4aJd/C5+8ndxX3
         5Ga88hNzYHwEctFEtXqtp0hwE5iagOYXw58T/129JReSYttivp9fFm5y6jZPjgok5Un7
         npuavZPiDnXzcoNRdzLsc5cDZaOV+yqaYL58MrpBOnRhuKIPNSNzKw3psGDRKoHdhyMS
         dt6Q==
X-Gm-Message-State: AGRZ1gJ9ZAYWl4Y29UFZxUAEHKUmC0kUhOvZ/MO8wUsmk3NATa3CL/UB
	GRlI8uVlPK7gWQWg0IIgfeIapeOAsiySsCQa680FMnWUAD20ZP7LuG4=
X-Google-Smtp-Source: AJdET5dKXVRcetITFAy3bmHb1V3BQQM6t9pkOIy4HN029jJB+PZbHOsg8+qwrxEQdCHG3bIoDVD4zgdh8qwXo45jvf0=
X-Received: by 2002:a81:5f03:: with SMTP id t3-v6mr4488229ywb.98.1541500003426;
 Tue, 06 Nov 2018 02:26:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:428f:0:0:0:0:0 with HTTP; Tue, 6 Nov 2018 02:26:42 -0800 (PST)
In-Reply-To: <5f1373d9-7f43-a481-3f12-44ed0ff2e311@redhat.com>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
 <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com>
 <CAHmQWvAb7pyKY92=q0cKbJpZtAtr9upb0CEEezgBQkd1Li9Z3Q@mail.gmail.com>
 <CAHmQWvBqUaEGdRt+QVJkq=D8_wc=aVNqiGbrTr=X4yAH4Cvkgw@mail.gmail.com> <5f1373d9-7f43-a481-3f12-44ed0ff2e311@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Tue, 6 Nov 2018 18:26:42 +0800
Message-ID: <CAHmQWvCKA8N=iFPrYRbCR=Vt879SAwZhufNNnsdsKHxdW7sqVA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: remove unused header files
To: Auger Eric <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: VirMEqM2wPap

On 5 November 2018 at 21:26, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Hongbo,
>
> On 10/23/18 12:21 PM, Hongbo Zhang wrote:
>> Well, after checking manually, the header files
>> "hw/arm/primecell.h"
>> "qapi/visitor.h"
>> "hw/arm/smmuv3.h"
>> are really not used in virt.c, still can be removed.
>>
>> On 22 October 2018 at 18:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>> On 22 October 2018 at 09:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>>> On 19 October 2018 at 19:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>>>>> Remove the unused herder files, 'virt' can be compiled and run without
>>>>>> including them.
>>>>>>
>>>>>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>>>>>> ---
>>>>>>  hw/arm/virt.c | 8 --------
>>>>>>  1 file changed, 8 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>> index 9f67782..f0066cb 100644
>>>>>> --- a/hw/arm/virt.c
>>>>>> +++ b/hw/arm/virt.c
>>>>>> @@ -30,9 +30,6 @@
>>>>>>
>>>>>>  #include "qemu/osdep.h"
>>>>>>  #include "qapi/error.h"
>>>>>> -#include "hw/sysbus.h"
>>>>>> -#include "hw/arm/arm.h"
>>>>>> -#include "hw/arm/primecell.h"
>>>>>
>>>>> Dropping primecell.h makes sense, we don't use what it provides.
>>>>> But I suspect the others are "unused" only because some other
>>>>> header we include drags them in implicitly. I think it's better
>>>>> to explicitly include what we need, in case that other header
>>>>> changes in future.
>>>>>
>>> I think at least another "hw/arm/smmuv3.h" can be removed too, even if
>>> we want to explicit including.
> Yes I think you can safely remove this one.
>
Thanks.

As my summary, I think these three can be removed,
"hw/arm/primecell.h"
"qapi/visitor.h"
"hw/arm/smmuv3.h"
Peter confirmed the first, Auger confirmed the third, anybody has
comments for the second? so that I can send out a v2 for this.

> Thanks
>
> Eric
>>> Will check others one by one.
>>>
>>>>> How did you determine which #includes to drop here?
>>>>>
>>>> Well, while I was working on the 'sbsa-ref' machine, I believed I
>>>> could remove some header files because I deleted some functions for
>>>> that platform, so I did.
>>>> And later, I thought I can try to test to remove part of what I did
>>>> for 'sbsa-ref' for 'virt' too, tests showed me that 'virt'  can be
>>>> compiled and run without them.
>>>>
>>>>> thanks
>>>>> -- PMM
>>
