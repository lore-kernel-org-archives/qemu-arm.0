Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2807540wrt;
        Mon, 22 Oct 2018 03:17:33 -0700 (PDT)
X-Received: by 2002:a25:b88d:: with SMTP id w13-v6mr32494505ybj.213.1540203453615;
        Mon, 22 Oct 2018 03:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540203453; cv=none;
        d=google.com; s=arc-20160816;
        b=viRNLrGwZRl5Rqp014Ym3TW0ia3ve9N6GKSTuP0bt7ESTlaAL7jNpLmJ66T50J7d5P
         mJ98SiYnmEI8N+gbDC92aKjkdQplbzRIRdwR88QOnvM9To+V2OldL/VwfgKOwlDuV/mM
         vACvqv2sVCxtOG+3lB5lJuNjlyyxZgch7QEF7PTRK0C15eVGaI+T5LxRg6YoD7GrmM6O
         vqPJ6e24f4eHMbriFfN5BJK1GVOdgkY5FFfRJQlwKxioJsUkeIlZ+9CT+FRkm12kiB+9
         leXhy1K8yGAkCYoHjnBMTRKSgOwmDdAWgUbtR4CLqunLFM9yIcCuAefZbfvKlwrlu7ZQ
         vp6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=fSqqSFPc4ulHl5E/EDiZEBCZNg5SxYnhPSa2pi2EUTE=;
        b=qF5ZzwwLOHJK1G7wSYXL0qf8XJzwEfisfDj9Upvo+Pb1zdTHUtTjQcjg+klsZ4ZhWJ
         /vftor+ReTO75IMn0IlkpOGGutETSIioPBV5NSeQPOOFEo5A1KYfbyPJx+iSIk1aPDZ5
         EGjDVWma+wWt69qIzQZbC3DGOCouf9/1QFjjbiVReQaXhEmZgylEi3g5F9WiegDN7ch6
         scriZY6WgZXfga3l5swu203pfkwchdpEj0TOjNlqyzXmE5b0290n6+qebR/WHL4I5zDD
         097Hz2lBdu3rwK2abxC4EhEJ2zhqQb61l6ajem9aSA3HVFNNC2PKgBianQ4dbgFwLlUl
         HKbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYd0YWBw;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l82-v6sor184407ybb.104.2018.10.22.03.17.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Oct 2018 03:17:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jYd0YWBw;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=fSqqSFPc4ulHl5E/EDiZEBCZNg5SxYnhPSa2pi2EUTE=;
        b=jYd0YWBwhhx7wGJXQflyCeaHydfeSMb6gLNZ6EIV/fqyk0lirq3J+cGkbdt7APK2RB
         dotI+eeIvJAgtP6L8nx3Ppu5VGxkJCAjdwhNUfcuZqODgRv0ALx6Oxxfc/c+KGHJuQoE
         G0qogcVip/0hFjxm6UafZc2vy8TQtgRTvgOes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=fSqqSFPc4ulHl5E/EDiZEBCZNg5SxYnhPSa2pi2EUTE=;
        b=C5oUbjAsjRrKk+mgo+HVSIXWWaPsjK4kiEyiGousAzU8swRZ7JAHdvKSEWp5CxPCxB
         hA8727x3A4tjBww4QAwgTum4apMpeeV0Bj75iiZ3i8Jx71G2Oo413Tqo6JCdvIPpax4q
         BX1nL3KCNI+DAYkjCsQ3DgNTwL+sNougGL8PHW2lq3OTHNUfV/dC8u3gd+7VlxvnHGAq
         pcWeWp/OyKjyKMjT9eVFyqgL2+6NI+J/VqZdbhC5Oxdclq62cKTkWs9M4IzlqtWv/N1r
         oD2J/oDCcn1lL9hd5a6aw+u0DO8TY7tUnTtKOW8n95MH0fn+k0ZEnCWk31lk1tUCF5J8
         IqMw==
X-Gm-Message-State: ABuFfogS1wORB3/3WLqk8eGj2UsD4ixBnnfd/E6v2PTIoAZAXi79hoMB
	VNecFHlDMU0q30XZYiL73NB2VaAam+TabO80cK9cRuxuC2pforBP
X-Google-Smtp-Source: ACcGV62dQBSu5XKxvLnGdmGdjKttuuB4OxrNuVjNsGeckgIxjQq7nvnhYeBv+jIyCgvasleMkIgu6HxBqt8DZcFY354=
X-Received: by 2002:a25:7ac1:: with SMTP id v184-v6mr30894186ybc.387.1540203453044;
 Mon, 22 Oct 2018 03:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:428f:0:0:0:0:0 with HTTP; Mon, 22 Oct 2018 03:17:32
 -0700 (PDT)
In-Reply-To: <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com> <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 22 Oct 2018 18:17:32 +0800
Message-ID: <CAHmQWvAb7pyKY92=q0cKbJpZtAtr9upb0CEEezgBQkd1Li9Z3Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: remove unused header files
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: I67MjA5wCBSm

On 22 October 2018 at 09:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 19 October 2018 at 19:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>> Remove the unused herder files, 'virt' can be compiled and run without
>>> including them.
>>>
>>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>>> ---
>>>  hw/arm/virt.c | 8 --------
>>>  1 file changed, 8 deletions(-)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 9f67782..f0066cb 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -30,9 +30,6 @@
>>>
>>>  #include "qemu/osdep.h"
>>>  #include "qapi/error.h"
>>> -#include "hw/sysbus.h"
>>> -#include "hw/arm/arm.h"
>>> -#include "hw/arm/primecell.h"
>>
>> Dropping primecell.h makes sense, we don't use what it provides.
>> But I suspect the others are "unused" only because some other
>> header we include drags them in implicitly. I think it's better
>> to explicitly include what we need, in case that other header
>> changes in future.
>>
I think at least another "hw/arm/smmuv3.h" can be removed too, even if
we want to explicit including.
Will check others one by one.

>> How did you determine which #includes to drop here?
>>
> Well, while I was working on the 'sbsa-ref' machine, I believed I
> could remove some header files because I deleted some functions for
> that platform, so I did.
> And later, I thought I can try to test to remove part of what I did
> for 'sbsa-ref' for 'virt' too, tests showed me that 'virt'  can be
> compiled and run without them.
>
>> thanks
>> -- PMM
