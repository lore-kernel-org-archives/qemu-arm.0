Received: by 10.25.77.65 with SMTP id a62csp693871lfb;
        Sat, 18 Feb 2017 10:39:10 -0800 (PST)
X-Received: by 10.28.5.70 with SMTP id 67mr10369508wmf.32.1487443150771;
        Sat, 18 Feb 2017 10:39:10 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com. [2a00:1450:400c:c09::22a])
        by mx.google.com with ESMTPS id r127si6137741wmg.114.2017.02.18.10.39.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Feb 2017 10:39:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) client-ip=2a00:1450:400c:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22a as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22a.google.com with SMTP id c85so43171095wmi.1
        for <alex.bennee@linaro.org>; Sat, 18 Feb 2017 10:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=n+TznCARoSYM2rlnZXxFCbwDHsDsAYllpahuxgX1+xI=;
        b=GKIPRScARYH28Td0xChGl1/bFcWYL52mWghAHNrJ1aKsXBs3p1A/OMZeQXcNKw+AQW
         6HDHOc3Rb0FZYMmgG3kSB9U/LNXI4fvM9+bMG1vNh7fzypkia1am8nCrDsHB760vS5+/
         6+UNPIwU5K760PT066fa5wzayMtK87bd20urg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=n+TznCARoSYM2rlnZXxFCbwDHsDsAYllpahuxgX1+xI=;
        b=qO+XY1Tp3xg+1uP4+8OfPuIpyoSrdVNoAJcekFKjykA0zPMOdO43K9oTUcAe2Fod+V
         JVt+Os7QyeIO0SNiP5yDKojvW6WXOrC9xTDRo8nfR3bEFttQP0kMfsLyMJ4H6Q5WKmkF
         Ku/SV7VsRu+70TTqalOF2k7spnP9Y0Dzd2yU+dTLsIfFA9YoXXXWdkTQH77zDrhhel0T
         elGG1U5zPZkMfqllnfC3FDQLdTTpniUnt0TUWfvgLsHiGdoZhX/XwjeWlKEEZoHbSFkH
         imCLp7a2/nVOyDjEpxXhE8eKsL3z3bxFKPgT9YxKuW0TCYO/1gN7yYnRfpmHx9recoYt
         AoqQ==
X-Gm-Message-State: AMke39lUoGVTd7B2AikCmLGm3vcGkoSb/R1OdLB5uM2wekElxHN5ZJ1wXUPnAgSpebFmpQ4SR5ja4tZaiRHT0FZOEAk=
X-Received: by 10.28.157.70 with SMTP id g67mr9985968wme.111.1487443150487;
 Sat, 18 Feb 2017 10:39:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 18 Feb 2017 10:38:49 -0800 (PST)
In-Reply-To: <1e2962d7-1b50-9543-3e1d-9c388d4167c3@gmail.com>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-4-git-send-email-peter.maydell@linaro.org>
 <87mvdnvcxx.fsf@linaro.org> <CAFEAcA-PFJp_9=NOCFqiQp=xF6Y-TnmE3bfU3zDa6xH7nK2Zfg@mail.gmail.com>
 <CAFEAcA8X1qvweDHBWQjZwH68xWdn4K+Wfqv0yRhjM5QCxd=VBA@mail.gmail.com> <1e2962d7-1b50-9543-3e1d-9c388d4167c3@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Feb 2017 18:38:49 +0000
Message-ID: <CAFEAcA-9w-bKJY=gb9Bo9c45vLParh8zVwit3t4GPHqTJZxnJw@mail.gmail.com>
Subject: Re: [PATCH 3/9] armv7m: Rewrite NVIC to not use any GIC code
To: Michael Davidsaver <mdavidsaver@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset=UTF-8
X-TUID: gpj5Gey+yK6j

On 18 February 2017 at 17:45, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 02/16/2017 09:11 AM, Peter Maydell wrote:
>> I haven't actually checked real hardware behaviour, but I think
>> we can fairly safely implement this as not checking the IPSR
>> exception field. (We might as well go with the "reads 1 in
>> handler mode" choice of UNKNOWN that the M3 documents, though.)
>
> For what it's worth, I dug up my TI TM4C1294 eval board and re-ran
> test10.c [1] which is designed to probe this behavior by nesting
> exceptions PendSV within SVC.  RETTOBASE is 0x800 in ICSR.

That's a Cortex-M4. From the test it looks like it
has a different choice of UNKNOWN behaviour for
the value in Handler mode, so real code in the field
isn't going to be relying on that and it doesn't
matter what we choose.

I don't think the test looks at the "what happens if the
exception in the IPSR exception field isn't actually
active" case, right?

thanks
-- PMM
