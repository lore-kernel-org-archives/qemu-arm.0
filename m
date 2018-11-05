Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2576317wro;
        Mon, 5 Nov 2018 05:26:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5foc/nFm+l53CDOYEJrk0EzY0QAzdsg4tHsNMCoVv7S+I1zTbE2ICe4hcURNlyupONSeRjH
X-Received: by 2002:ac8:17f0:: with SMTP id r45mr18236062qtk.206.1541424378322;
        Mon, 05 Nov 2018 05:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541424378; cv=none;
        d=google.com; s=arc-20160816;
        b=dl1rY9bilm3QJ3G4q8mbOHyXq1HIkcYuLssuA1qGuy2tsC+oUhUJfUo8utPufOQyOe
         eImiI3/ZcQAKbPEApNRMKSLB5lRQZadaClKYJpbc4A6gx6rStKh4AksORmx2eQEBguAi
         G8ZbDoDCf5uK/EungWLZ70YRwbknE2YFjWuzYZODvQAVrcIS2MheXeqSXpIFMgmpuRFb
         qQGj0mTBcKnHYmBXXLW2pA04WdLHxZ3c06NKdXXp3PGOMVaEXv9U/dmYxw6dPG28zB9Y
         4ytlVYUbPBgjZe0B5OqyQg1/7RUSetaRoPArzs9I0Y6K7YQmzmmFI4WKeSNAzI5OVyXw
         mnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cY0TOisUD3Tz6I0D5tDMWf1/ZQ5Z6/H1ei43410X6ZQ=;
        b=bR7JjSe9hVi/ierpqsDOHwVhwud5p2scC7DnPZdlbKjPhGammvsFB9gsykLgo3syr9
         WtilJiL9Y8TAd00ep+anDEPSsN/ii6QD9ZmI7k8rJYS/DGtpzWnTn3rPI2+WnOlwMJxq
         6kIZI2tBPNGgv8GkrBuUnBri5Fbf1d+HzYHKQlFCGAWtgW4QQPrwQI31nCjzw459sXhy
         K4vnw2Ii4JVodRGahq25y67Gs32TVWnRzRb69txZa3O1wKIOyjfxuLQ+CMeIbyFmNiAk
         4mHH1trsX54Yxr7Q3V/b4+8cDugoC/6NrQTD0HnfLdqTgFV5OfsU5xaeBsLF1e+JM6Do
         ABtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n84si3494586qki.238.2018.11.05.05.26.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Nov 2018 05:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72744C049587;
	Mon,  5 Nov 2018 13:26:17 +0000 (UTC)
Received: from [10.36.116.55] (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59C655C543;
	Mon,  5 Nov 2018 13:26:16 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: remove unused header files
To: Hongbo Zhang <hongbo.zhang@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
 <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com>
 <CAHmQWvAb7pyKY92=q0cKbJpZtAtr9upb0CEEezgBQkd1Li9Z3Q@mail.gmail.com>
 <CAHmQWvBqUaEGdRt+QVJkq=D8_wc=aVNqiGbrTr=X4yAH4Cvkgw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5f1373d9-7f43-a481-3f12-44ed0ff2e311@redhat.com>
Date: Mon, 5 Nov 2018 14:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAHmQWvBqUaEGdRt+QVJkq=D8_wc=aVNqiGbrTr=X4yAH4Cvkgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 05 Nov 2018 13:26:17 +0000 (UTC)
X-TUID: u3Bfptg/9yeg

Hi Hongbo,

On 10/23/18 12:21 PM, Hongbo Zhang wrote:
> Well, after checking manually, the header files
> "hw/arm/primecell.h"
> "qapi/visitor.h"
> "hw/arm/smmuv3.h"
> are really not used in virt.c, still can be removed.
> 
> On 22 October 2018 at 18:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> On 22 October 2018 at 09:37, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>> On 19 October 2018 at 19:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>>>> Remove the unused herder files, 'virt' can be compiled and run without
>>>>> including them.
>>>>>
>>>>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>>>>> ---
>>>>>  hw/arm/virt.c | 8 --------
>>>>>  1 file changed, 8 deletions(-)
>>>>>
>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>> index 9f67782..f0066cb 100644
>>>>> --- a/hw/arm/virt.c
>>>>> +++ b/hw/arm/virt.c
>>>>> @@ -30,9 +30,6 @@
>>>>>
>>>>>  #include "qemu/osdep.h"
>>>>>  #include "qapi/error.h"
>>>>> -#include "hw/sysbus.h"
>>>>> -#include "hw/arm/arm.h"
>>>>> -#include "hw/arm/primecell.h"
>>>>
>>>> Dropping primecell.h makes sense, we don't use what it provides.
>>>> But I suspect the others are "unused" only because some other
>>>> header we include drags them in implicitly. I think it's better
>>>> to explicitly include what we need, in case that other header
>>>> changes in future.
>>>>
>> I think at least another "hw/arm/smmuv3.h" can be removed too, even if
>> we want to explicit including.
Yes I think you can safely remove this one.

Thanks

Eric
>> Will check others one by one.
>>
>>>> How did you determine which #includes to drop here?
>>>>
>>> Well, while I was working on the 'sbsa-ref' machine, I believed I
>>> could remove some header files because I deleted some functions for
>>> that platform, so I did.
>>> And later, I thought I can try to test to remove part of what I did
>>> for 'sbsa-ref' for 'virt' too, tests showed me that 'virt'  can be
>>> compiled and run without them.
>>>
>>>> thanks
>>>> -- PMM
> 
