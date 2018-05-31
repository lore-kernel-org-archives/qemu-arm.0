Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5725700wre;
        Thu, 31 May 2018 02:54:49 -0700 (PDT)
X-Received: by 2002:a9d:7147:: with SMTP id y7-v6mr4441184otj.206.1527760489063;
        Thu, 31 May 2018 02:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527760489; cv=none;
        d=google.com; s=arc-20160816;
        b=DYBf6Y1cUwjtRfU+sfRYY3qFB8Idd/zhZEr9s2t/Jdkc38Xw3Z+uezQfqRMgh5fR6T
         W6yW+HCniLWvlxLvEowpjr1tX7acEtDROl3yt/2/P5so8u0ba5YViCyjs0TjXuapFxML
         8uPXRVaWkWp5aE88Eng3RIr1TWWJhy4IdhSONH8AQ0wRZv5Le/dB/7JgyQJllwA9V7ee
         PhUwODT4Xy8lhghd0KCKVWrS5WqJyzTbTg6s+fO9DuIVCFxvNGYvwi6+3dUN5xOliZns
         wePCqeDNXIg2Dx8WAUmBJrTvmpOdm3Rd88KwdCEqtidEOG+ZtfqWQkE65SV+FRugqGzR
         Wcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=0f5c8Y50xoKL7CHQwI1uvvxJomJJar9688DFu2VIzbU=;
        b=RyqSx0xjyYgTDTQs8n3BSKAc+UrxFVUp+RZpCM9pXZPj7R0pQr4DEQXprZzK6eqpqm
         llmx6ch2bI4NCNACFr/A7DrpmfHkLO4m/F6T60oqBwFC4CQMOBGUnJAu9Q1GCbOFO0UE
         ahKWlWILJtPXYijHcT3awx13PB788U9f5IU/Dd3AlPChZ3Wpkllsv8/Vv89zHxJF7UbD
         TII71qV39PNyL+xzfi7hiRQSMjVsir4OGF+EKkehTfdmLEJ59CaAffRPRhzlzXJiNGew
         beeqUzl9UvHx1wLtrZ0u7M9KFyXVkeYQwDW/m6i+E7+ICaWOsCZo0Itu1vPNJhHoquVP
         Wb2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtoIEbGj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b202-v6sor16582300oih.242.2018.05.31.02.54.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 May 2018 02:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QtoIEbGj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=0f5c8Y50xoKL7CHQwI1uvvxJomJJar9688DFu2VIzbU=;
        b=QtoIEbGjZNcBjnKAnK7fUwhQ6IYjQ3m36CsWCFr/E8q56L+F6hqvyB0deJViZF+5H1
         edBCwvn89mcjMmgXnaojBU5w4+zu2EsPLrU3Epljtp9X5yTsiY4E474fwNYtNUA3e1qS
         +1uhzJNSpvTUNM0eLiRlIU5fUofv0GbYHgC/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=0f5c8Y50xoKL7CHQwI1uvvxJomJJar9688DFu2VIzbU=;
        b=Q+hmfags3bf0m2mXzxIGOU7yTkbwjx5hLyxAYcIN5Up5/8YoPYk5DX9hEQqw9wsHu7
         W50qRwvLRNDpBAIBfrO5wd6u/trJpSJAp5CVLJS/BPw+On/fVZgFYJ+S6kie5QqbsEg6
         HwmV2lc097RLb4GazEgQiGJpcVTEs9w4t0riW4roYL7ZbwoylNa62KACOE4KyMxvAFfC
         cPike/hW2EIY8xopBodWn+fxcmSblgjOhlWmfDfsPLe8rwuu3ddgcUyhVuVlIXlhx85p
         VaD/LmeKqwQidMps20Ku86IUIwA0ke+/qiKEqShFOxCDawilCbM9lmHt8C9jYWAulgte
         6KGw==
X-Gm-Message-State: APt69E0pSlahlf69OBLEBI2gytRkrWfNytscLq6vk9+y1cEaRDIOv/Ju
	0JASyw2SHarQq4QZAL5wVh1srjy24Th+5mVtaBuUt2n6
X-Google-Smtp-Source: ADUXVKL/HqdbcB7+kAIYDf37RIwyMiwQqjgXbGEIK7GBJGV7CZHKr2kMm/XG3OKD+Nq6pSt+SzJjAVpuhOuBJAYyLsE=
X-Received: by 2002:aca:4ad2:: with SMTP id x201-v6mr3210816oia.11.1527760488631;
 Thu, 31 May 2018 02:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Thu, 31 May 2018 02:54:28
 -0700 (PDT)
In-Reply-To: <87a9fff7-0a53-6b52-eb2c-e721556cf87b@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org> <87a9fff7-0a53-6b52-eb2c-e721556cf87b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 May 2018 10:54:28 +0100
Message-ID: <CAFEAcA8XkCAK1GKHXKEBgxrVW75E9i3cDFw0iF68V7y7x8h-0A@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 00/27] iommu: support txattrs, support TCG
 execution, implement TZ MPC
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: jxjLusgVu1rR

On 30 May 2018 at 17:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 21/05/2018 16:03, Peter Maydell wrote:
>> This patchset is a rather large one, but the first half is all
>> fairly simple plumbing. It does four things:
>>  * support IOMMUs that are aware of memory transaction attributes and
>>    may generate different translations for different attributes
>>  * support TCG execution out of memory which is behind an IOMMU
>>  * implement the Arm TrustZone Memory Protection Controller
>>    (which needs both the above features in the IOMMU core code)
>>  * use the MPC in the mps2-an505 board
>
> Go ahead and apply it through the ARM tree.  Thanks!

It needs a v2 (there are some patches that need fixing),
and some of the tail end of the patchset hasn't been reviewed,
and I'm not sure if we have consensus on the IOMMU API changes
completely yet. But if you're happy we're going in the right
direction I can apply 1-13 via target-arm.next (that's the
"plumb TxAttrs through various functions" patches). That will
reduce the size of the patchset and make conflicts less likely.

thanks
-- PMM
