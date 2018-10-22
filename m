Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2380736wrt;
        Sun, 21 Oct 2018 18:37:44 -0700 (PDT)
X-Received: by 2002:a25:8387:: with SMTP id t7-v6mr8403486ybk.384.1540172263980;
        Sun, 21 Oct 2018 18:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540172263; cv=none;
        d=google.com; s=arc-20160816;
        b=WndPMs6UUHrNpV4fHaCEVV5lOjQIGLyuqlPbnhWAyAP3fFxQ3CbaUrwUmvtanMRQhJ
         IBB6hXIIMpoxBDpGMjlnUJKZOz2GhS0duYbhdRP3cycBpuaw1MGHJ7y2PZfCYCErcU+O
         oBKDuvJz8AxicoiWy0lDRNxTDKNMx62tKxhK6t0Oi1xmFN9iacepVRS39gt9JgAbRx/n
         GjFFK6/csTw4CfIwEPuaipR3QZ4Av4s2Sif5bzwpWGPUf5+oTKnCT8Vlp9R8KkzpT+XQ
         YrPVnQy1CcDr53AAGou1D0atY3+m8ZohwbFCyvmDgaeWpbJPcFFNubIUdB9fjQqLB8SB
         sbQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=ovbyL5c0yBjzfj+ieIHG0bq9GBbKmXAKnFOpbO+PL+M=;
        b=FspI4fCHgTxsGcH4KhFs6jPj/bGqXS13mxFKFd/w5fDTF8UiUZnxq7G1pHPvCf2qUo
         03c7dRIVyALu79EupgizkmhRALbR85yrNOOatD3bsx8ziw4Vz9yAc3EFfPBiHXAsSwnc
         IyReoUWVt+UEfXfiSl7Q+5s/e7GHOobbR/h6kdkxTJHT/R3Fv/4j7QvJqyF35JdU/jBT
         ItOj1WixYj/iITEkxee+6hZY+dCRh5AYUCy42IdsYeWj4pfjRulqJnho0VwYn/U3Axko
         Ljn1EMkn/sSoB2O/1En07MLwA6N1N6FenaYCV03l7mut/4D3x4oG4n2kT7vdRxwO92xz
         t9BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPtfZuql;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m14-v6sor13433733ybp.84.2018.10.21.18.37.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Oct 2018 18:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZPtfZuql;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ovbyL5c0yBjzfj+ieIHG0bq9GBbKmXAKnFOpbO+PL+M=;
        b=ZPtfZuqlIHG0mv0dqcwoK7u0XA00FsmOfUUzVuxwGCpzfBliVnqCatkzL3+LJhH4tR
         2TNp7Jici99YikxkOsiWSe22vYTFRh2Ds3PNAVXtwCgczMkzig8iGeqqQi4XwWX22Yjy
         fOF+qAi9PnE36P0YH+RVWN3mcjNXX8fEA2QiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ovbyL5c0yBjzfj+ieIHG0bq9GBbKmXAKnFOpbO+PL+M=;
        b=o1P0qrs/6MvT92xp6JyY7+MDvX1byWTh8Jk2Jg8Ypcwx5eoatCaMFFZvPhwBOXsapH
         2qCTtUsFO3YsZ3os/ssi5dGix9Jo1j2LjpmcMUG/Ip2SlMddH5R/z7K9DHhSLS0J7K2R
         Ko20E50z75k7Y7M0S46skK1HbaKQ5kXKqh+Q331/pI+fPS1JDwlndPcw3MwadZkAhudJ
         ZFytem5eehUMyQ57gabh4fXzKGrRDnEwCYHkcXQaHjsqIANLbAYlV8C98AZkWVJvOFUx
         FWu97xPoOEOHNDlmwJ1GJmOlGV6n3K3oRykQc+Rs8sBHniB4Df/bPOSuRjM8DRR/K/1S
         k7og==
X-Gm-Message-State: ABuFfojq+Fo0ggASXnGLlqQEb6nrNoRKYW6KTFFqgJXiJyoRfi9JR9s4
	ZZ/uy/DzrkO5DqO0OMsgJ0BC49byDyUt4XIaUsGOiuu0
X-Google-Smtp-Source: ACcGV61+kOH594f6HJ6NXODzuAtbsk3Xuoo1tC7z3pppJIqfeF9C+Yi9zVHFJ/4Gzk1S4OQxEIPy3AMcfDAPcBSOoZQ=
X-Received: by 2002:a25:7ac1:: with SMTP id v184-v6mr30003689ybc.387.1540172263527;
 Sun, 21 Oct 2018 18:37:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:428f:0:0:0:0:0 with HTTP; Sun, 21 Oct 2018 18:37:42
 -0700 (PDT)
In-Reply-To: <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org> <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 22 Oct 2018 09:37:42 +0800
Message-ID: <CAHmQWvDfvOJcEdco7xx+g9oTG9=Vmor9CE+p8dpg+ou5zK7Skw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: remove unused header files
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4/NmZ+AVIaZN

On 19 October 2018 at 19:59, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> Remove the unused herder files, 'virt' can be compiled and run without
>> including them.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>>  hw/arm/virt.c | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 9f67782..f0066cb 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -30,9 +30,6 @@
>>
>>  #include "qemu/osdep.h"
>>  #include "qapi/error.h"
>> -#include "hw/sysbus.h"
>> -#include "hw/arm/arm.h"
>> -#include "hw/arm/primecell.h"
>
> Dropping primecell.h makes sense, we don't use what it provides.
> But I suspect the others are "unused" only because some other
> header we include drags them in implicitly. I think it's better
> to explicitly include what we need, in case that other header
> changes in future.
>
> How did you determine which #includes to drop here?
>
Well, while I was working on the 'sbsa-ref' machine, I believed I
could remove some header files because I deleted some functions for
that platform, so I did.
And later, I thought I can try to test to remove part of what I did
for 'sbsa-ref' for 'virt' too, tests showed me that 'virt'  can be
compiled and run without them.

> thanks
> -- PMM
