Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1602941lfa;
        Fri, 4 Jun 2021 17:27:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4504:: with SMTP id iu4mr7703000pjb.110.1622852843259;
        Fri, 04 Jun 2021 17:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622852843; cv=none;
        d=google.com; s=arc-20160816;
        b=d1WRXFTEcYBzrr2+fBz2fd0nza4wYKJib8Iv1OyS+kxGO7LDwqt3r3bqihTlM5ZMEP
         UdbtNaiRfrHk0j91VU5cgfpjUtNdyKuOoH0FrfXRM3C4tba3oTXIBRVcloHJmIfEswWr
         7WYBRgLt/uNPbl6y4VqaLtxYPUqAfqvm12X89gNpPRAz83XRiBdSnzey8qGLggUl+g3O
         syZRxNxsl4c9uQ61A25jcDb48+SNbDcr2Z3NLvgE0LYzQPbh+H3IfvRtWmiByDrY3+84
         jQPZK3v1ld2hx9xrPSWThJar6cG5brEp3JDdMGcZGfzAxgYeEQIoLr/zjB0HxqFKG543
         XYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MbIW4uMsR0lTBT446lTKlhTg79AXP8x4USmz0r+2nBA=;
        b=K87W+kXthgv3nH/U+nFSThiz9t+nGa7tE8NhftuNC0/lelamq15zWNKPzT7i/E3vNM
         dggsQGZo4mReb60/dj6ieGJ3UDtqtUxo3FAiROh95IcbQURzU44F9OvbHZPi3q4Q3r3d
         JzatAGB9EdoVhSN6Nt0Y8jnX6Ox3ygqOnQELmfl2MCNW6/tzu0DtpMGhpfMrj3+7TBYt
         rxWUYSnjcUm/eNNrciAcL2rBHKTzk0NIt2PaqvlkrYslLhHIdCgVJTVUllsNwG3mneDj
         4kXiF6BgqVByntOImkWSRAn0aWEjwdr6CwoiceTLsKt+OmWDp1bn4JDQtkiGxwtAKPUx
         WzHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLk6f7av;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11sor1953708pfd.29.2021.06.04.17.27.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 17:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JLk6f7av;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MbIW4uMsR0lTBT446lTKlhTg79AXP8x4USmz0r+2nBA=;
        b=JLk6f7avBChex3GsZBX++AYNaD5WPnsVHwXH3F2177I3PJSRGND+nD2/Va2TS9N+q/
         82PSWr7mnFU/XFwOLqjQSWcSkkJBfG8xZqAR4bXCcY/gskVtM4tprRcRxtwCUaoDc9XB
         BYxhM4GKTGNBdA/Z94fUdicTdBhlKQPpWKKV2G0c3vxmK7jY+wdUdUYfUJRsVdI+wWC4
         tbHIrjUuWhaWnPddZcstnwnvxUBDODLW9Zsp1mMGP2mG9P4/4P3q1NOAgazRvx4b+JP3
         PMINlT1I90OzeCHbnyfk/avYVT8ByjSA3qyK/EhEnJI2Ee/e+TnYUuk3K0Wnodapc6mS
         0XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MbIW4uMsR0lTBT446lTKlhTg79AXP8x4USmz0r+2nBA=;
        b=DNbm5QxcBJSTRnNB0duWZNR48ZfyjWlDT/B9Hm0q6IWi2SxWeB9euCHTIZrMYXS2TF
         dXmykNvWBbwdEaL21Ek7kbakMZx3Z9KiCs8wv3SxbGWPqIfJND3M9OKFxpq8vxAWt0Ss
         Ds+qs02XsoNrLweIbm2H1/JG+mC1FeD1izsonfbRv0zyVXBZ6w8wLEYB+SajZcHTCR4w
         zto6QZY1fjDkT/k+04S4kgWG4sZpYGVhH53rB94lFO+UuVzmN6AV6NAcAWtst6B0sv6h
         3O4uc3lOjqBJlcdQnxW1V/UtCXdym322wICj2fEIunSD+ocB45s81acfJGS5GSPonaqw
         L3Ug==
X-Gm-Message-State: AOAM530K6fAPPgDh6FE1poOJF5r/gFMAAJLmI9bJmHJe1ml333Ks+mfY
	P6eLrYB0yvYMjA84ffNbqhSxD2Ve
X-Google-Smtp-Source: ABdhPJy1FgpZ58d69KUP7jnVPbVmeDkYVs6cvTpIRNGkwlRngXmAXNjJFgXgKh++oRBNDBgGjhK+zQ==
X-Received: by 2002:aa7:8543:0:b029:2e9:e077:21f6 with SMTP id y3-20020aa785430000b02902e9e07721f6mr6867647pfn.69.1622852842761;
        Fri, 04 Jun 2021 17:27:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id q13sm218034pff.13.2021.06.04.17.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 17:27:22 -0700 (PDT)
Subject: Re: [PATCH v16 43/99] target/arm: move a15 cpu model away from the
 TCG-only models
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-44-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <51fbcf63-a205-8848-95f7-b2c7e74754a9@linaro.org>
Date: Fri, 4 Jun 2021 17:27:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-44-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: nBTJs4p2++AR

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> Cortex-A15 is the only ARM cpu class we need in KVM too.
> 
> We will be able to move it to tcg/ once the board code and configurations
> are fixed.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu32.h   |  4 +++
>   target/arm/cpu32.c   | 73 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 67 ----------------------------------------
>   3 files changed, 77 insertions(+), 67 deletions(-)

I don't follow this one.  Why would kvm, which is 64-bit only, require a 32-bit 
only cpu?

I guess I can accept that our board configurations are old and fragile, and I 
realize there are already 99 bottles of beer on^W^W^W^W patches here, but what 
needs to happen to fix this properly?

I guess I can give it an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

if it helps us move forward.


r~
