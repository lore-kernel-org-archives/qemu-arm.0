Received: by 10.25.15.230 with SMTP id 99csp668909lfp;
        Sat, 18 Mar 2017 10:36:49 -0700 (PDT)
X-Received: by 10.28.54.89 with SMTP id d86mr3112822wma.137.1489858609397;
        Sat, 18 Mar 2017 10:36:49 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x233.google.com (mail-wr0-x233.google.com. [2a00:1450:400c:c0c::233])
        by mx.google.com with ESMTPS id z23si15787628wrb.20.2017.03.18.10.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 Mar 2017 10:36:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) client-ip=2a00:1450:400c:c0c::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x233.google.com with SMTP id u108so69174537wrb.3
        for <alex.bennee@linaro.org>; Sat, 18 Mar 2017 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=T2adc6TQV1dS9EInAKJiScbBPYFoTd+O+7AXnXnolC4=;
        b=DnJqDy1aQteRttFkv8KvPuwK5v9jOkB3CTV1uFJXkNch4VK2h75ZkGvlV7HffUKtD5
         pUl0BkFDfLu8g5w4JfhoAb8vf3Nkc8s+1RsPuw5iKgKyvmjMZ7yOL/cFqoRh4QQRVAol
         BWD2D4/gzMgdh9vNIpxxdD5Tg+MjGHOHko/tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=T2adc6TQV1dS9EInAKJiScbBPYFoTd+O+7AXnXnolC4=;
        b=C4mfYpVA7Xk44yPZSOTyak9SNyf5PI9rMvJnVnAMdUueJvgUWzAITN6aTBWnLI3odF
         1d/SiJt11tJuE1LVUYD6H8NwaGr06PX3E+E0rWAUVk8RzF3JLTnzkV+lOH637+Gk0Uj1
         1tzUGBpLrgkj7SIR80OlmwvhgjAhY1COBPwhaDxkuOieS2zeC6zDiBgkFLl+/eq+/lJE
         y4vhhOPo9dvt57R0LJMf3+Nwa5hpqQgKkWQKRr6/NKSryefgfItlKjWqkkg1FGL4SNk/
         ZlP6sCLUzqFfgZEkxa7cNWsdfcaO7CoSy8+B3U8N+/5gWJo5BgmHAm/N+lWiRN7BOUA4
         NgLw==
X-Gm-Message-State: AFeK/H2y7GEPUgBsWEND+cfQieL+PFtyGIbgxVbveuqQtdeAbl/qQcaDg001/RIzjD71GOBPBce7IlHUk5UYPC4CG24=
X-Received: by 10.223.150.205 with SMTP id u71mr18023627wrb.195.1489858608783;
 Sat, 18 Mar 2017 10:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Sat, 18 Mar 2017 10:36:28 -0700 (PDT)
In-Reply-To: <CAFEAcA-j1NSm=_H=V5xJNx=Hv3_P7M+UdVB6gMpL-dS+5NXL1Q@mail.gmail.com>
References: <1487616072-9226-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA-j1NSm=_H=V5xJNx=Hv3_P7M+UdVB6gMpL-dS+5NXL1Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Mar 2017 17:36:28 +0000
Message-ID: <CAFEAcA8RHNf-f4iLOJ_i1r+5fAXdaGL4q7fPfzMgSZAf-T2DzA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 0/4] arm: Fix M profile MSR/MRS
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Michael Davidsaver <mdavidsaver@gmail.com>, "patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-TUID: tpmayyM3QuZ2

Last ping for review; otherwise I'll put them into rc1 anyway
since it's fixing a regression.

thanks
-- PMM

On 14 March 2017 at 11:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping for review -- since this is a bugfix it should go
> into 2.9.
>
> thanks
> -- PMM
>
> On 20 February 2017 at 19:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This patchseries fixes up some deficiencies and one nasty
>> bug in the M profile MSR/MRS handling.
>>
>> The first three patches are just cleaning up the decode
>> so that we UNDEF where we should in the MRS/MSR space
>> for M profile -- this won't have caused any problems in
>> practice since real world code doesn't generally execute
>> UNDEFfing instructions on purpose.
>>
>> The fourth patch fixes a nasty bug that I introduced in
>> commit 58117c9bb429cd which broke APSR writes via MSR,
>> and brings them into line with the pseudocode by allowing
>> writes to the APSR GE[3:0] bits when the CPU implements
>> the DSP extensions.
>>
>> Alex -- I should have paid closer attention to your review
>> comments on the patch that became commit 58117c9bb429cd;
>> sorry about that. I knew we didn't get the GE[3:0] stuff
>> right yet but I didn't spot that we'd managed to invert
>> the sense of the SYSm bit 2 test in that patch :-(
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (4):
>>   arm: HVC and SMC encodings don't exist for M profile
>>   arm: Don't decode MRS(banked) or MSR(banked) for M profile
>>   arm: Enforce should-be-1 bits in MRS decoding
>>   arm: Fix APSR writes via M profile MSR
>>
>>  target/arm/helper.c    | 26 ++++++++++++++++++++++----
>>  target/arm/translate.c | 26 +++++++++++++++++++++++---
>>  2 files changed, 45 insertions(+), 7 deletions(-)
