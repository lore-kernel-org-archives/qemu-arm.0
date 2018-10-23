Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4292146wrt;
        Tue, 23 Oct 2018 03:21:52 -0700 (PDT)
X-Received: by 2002:a25:1585:: with SMTP id 127-v6mr1307857ybv.332.1540290112650;
        Tue, 23 Oct 2018 03:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540290112; cv=none;
        d=google.com; s=arc-20160816;
        b=nUEx8M2cPCRme609vxOhgKUpDqtWvhU/V/V4sq9T8ItwWr4KtW7b7klGBiJYKsDdu1
         y4IsMv3oZ4GePfsA/sAxW7sQXIbIc7T1x7qinXDkRFBZdxJcvFJdWr8evfZ6jzF/1C8J
         1CXv6GqCShvXqGYlFNguEXmDcM240lM6QlNw5kL1vbQy1OwIwvsBfHXtB6ewctw+dFOz
         FCGwwTGMNMSex6tUYmjkc+d8/QHsGK4YqO92OXbj3R+pXzS4bU5nEncs3OTH5ArHhySJ
         EQZGqilnplQWXt9SMjMxHcRvlDy2295/AN3sPqMyBVht3JqyuCMDQrDyMq9KYSFrpkXc
         EKtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=Du8lK8m/DYaBLkK54LYE1DOtBinGylBIvGvRyenFm4M=;
        b=VdGuLQPzJLvI9SCoP94/H5bPexHDOHlSwv7uqllIS+4u5Ix1qzS6yT/598/X1mzyaz
         BzS/mn5kp5ByWNR2ydgPBcFP2L06hnr9G4yA2kLCEtpPFgIXwBHmqm4PA8yypogMJg2r
         dDe4LDYnrz1XS29SyMpbADUZNMnSAdejc2O4MQuXj3fela9nmUC8Lovokl6x3nPIGKKM
         dQDDG4ZtBYRAFeOI+2CmqwLH7gChTniyuX7j20du7CHTGB3ykmjJRVCINpYc7T2k5kNh
         eM81/hphTguswTveYXy24M7Yh97R7o0m5qeYtHYxS7VRrYUCODANt5PQjInQVxGlwRM9
         8+ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfBMToBA;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m63-v6sor311731yba.196.2018.10.23.03.21.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Oct 2018 03:21:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dfBMToBA;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Du8lK8m/DYaBLkK54LYE1DOtBinGylBIvGvRyenFm4M=;
        b=dfBMToBA2taLBFs7cGrnqRBTM4x1okDM+20skRJZ6/9/NDTw/9pKW6OoxYT4tFuDrq
         YlRdBIPbrNOzpUeMVNEohXV/6lsy3IzacYiFPqY0Jpebtf5aMQZkfn4EQOqBOZxt4c6y
         SCj9TTtYMintklL2dgteqSxxJuobl01JBj7dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Du8lK8m/DYaBLkK54LYE1DOtBinGylBIvGvRyenFm4M=;
        b=YmORIQI2sRL5RCkIPdFwUHKxs6F0LAwIMBhiG4RocFgdYkNg3lNEBn6hLM3Mg2FELR
         TPFrJIVuabpeKj7XHjf3vpe7HsLOvrY3go6HPRBp5NqAzhsJLcafgCD3Kiy4L9woE9U1
         IOLqqSb+o7I0ap8FbyCm9zviBuCzTP2ALVfd/c6+p9swpS5sU3h4OqBdcFQ7JbgnHoBx
         cFRj3DE5TCCx9SNgejZk+kqxyHDLFj1Vxfda7KI6JwaOk0Yc7xK1TT0wUb2nUa9N0gC6
         CZ+c1ZEtIGQ0Xecth1CR05Gd400n8I5LbJAEJU9hCyQlwMQFdFrYsx5zzs0QN5Ge6gyE
         qZPQ==
X-Gm-Message-State: AGRZ1gKLxAElQOKnZA0Gz4bmgwgkcfOQo2v8rDlc3WH/pYTAGLF/oFFU
	4ilC7HktgZ99rvgo4CYw0r+miL6WzHOLNq5UPrBP/jKp
X-Google-Smtp-Source: AJdET5fpzaUwjP+zFvJK9SsxZu3jMj9Iboj/q/N4pPPdVfkuOwQepAS2WnG1Z7WG6vqgNn9sFe4rT5soD9vjM5Kwhe4=
X-Received: by 2002:a25:6809:: with SMTP id d9-v6mr336066ybc.291.1540290112092;
 Tue, 23 Oct 2018 03:21:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:428f:0:0:0:0:0 with HTTP; Tue, 23 Oct 2018 03:21:51
 -0700 (PDT)
In-Reply-To: <CAHmQWvAb7pyKY92=q0cKbJpZtAtr9upb0CEEezgBQkd1Li9Z3Q@mail.gmail.com>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
 <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com> <CAHmQWvAb7pyKY92=q0cKbJpZtAtr9upb0CEEezgBQkd1Li9Z3Q@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Tue, 23 Oct 2018 18:21:51 +0800
Message-ID: <CAHmQWvBqUaEGdRt+QVJkq=D8_wc=aVNqiGbrTr=X4yAH4Cvkgw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: remove unused header files
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: q4LGxwqhpHli

Well, after checking manually, the header files
"hw/arm/primecell.h"
"qapi/visitor.h"
"hw/arm/smmuv3.h"
are really not used in virt.c, still can be removed.

On 22 October 2018 at 18:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 22 October 2018 at 09:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> On 19 October 2018 at 19:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>>> Remove the unused herder files, 'virt' can be compiled and run without
>>>> including them.
>>>>
>>>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>>>> ---
>>>>  hw/arm/virt.c | 8 --------
>>>>  1 file changed, 8 deletions(-)
>>>>
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 9f67782..f0066cb 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -30,9 +30,6 @@
>>>>
>>>>  #include "qemu/osdep.h"
>>>>  #include "qapi/error.h"
>>>> -#include "hw/sysbus.h"
>>>> -#include "hw/arm/arm.h"
>>>> -#include "hw/arm/primecell.h"
>>>
>>> Dropping primecell.h makes sense, we don't use what it provides.
>>> But I suspect the others are "unused" only because some other
>>> header we include drags them in implicitly. I think it's better
>>> to explicitly include what we need, in case that other header
>>> changes in future.
>>>
> I think at least another "hw/arm/smmuv3.h" can be removed too, even if
> we want to explicit including.
> Will check others one by one.
>
>>> How did you determine which #includes to drop here?
>>>
>> Well, while I was working on the 'sbsa-ref' machine, I believed I
>> could remove some header files because I deleted some functions for
>> that platform, so I did.
>> And later, I thought I can try to test to remove part of what I did
>> for 'sbsa-ref' for 'virt' too, tests showed me that 'virt'  can be
>> compiled and run without them.
>>
>>> thanks
>>> -- PMM
