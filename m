Received: by 10.28.173.206 with SMTP id w197csp3749695wme;
        Tue, 9 Jan 2018 06:19:16 -0800 (PST)
X-Received: by 10.157.12.234 with SMTP id o39mr5360860otd.343.1515507556601;
        Tue, 09 Jan 2018 06:19:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515507556; cv=none;
        d=google.com; s=arc-20160816;
        b=KJANmulW1v0vv4aM+wAxKxAT7FNI8BMH2kPbHTagZLjF/ORaMb6yGUXskxT7Cm0eRw
         HyFVNZNpJAZRDKmOzVfvTeYDlVKtGpAFhokv2F54TUrjkbt+Io5MC9QZwAX/JEK/lBqU
         1SJ98GTMDcRrvZAW8lH7RqZOTTzbS46ZPCePoa0WGJF9kt9s3/YN6Uq2edJkpSb1ANsW
         N1H0H18XZJ1D/0sgQFWTOU6oPk52Iq49RBLAIpm7ZiB/R9W7WodOTGjwt1UVI2wNspq9
         Fa9R7Zv7fdTBLCCeawInYBFPKuLl0o/N97emhdoZhNbeGar7rawWLRsZM2uP6rHPwb+G
         FBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=rZF/miYvVMP3IcuNGAoysKATYTI9Qzde6Z9wIEM7yec=;
        b=X3VK/G4/27RxAR79jHi0k4qRQZd/eUBwocxptUjXWIq9EMilBZAnZu0sYggawNtpvG
         44hL+eHGX+JFvLhWxT/6KCLr+vFD1WNjqcT+RdGklGDWe38LRHuvF9T1c7JDbe0S+lZc
         sgxyXH3v3MbV9wNSstObiZr72vxmQojRlb3sQe5GzCuJ45iaoLzp9IAk2cJLrt1pdH7S
         48lv5fN18OGxN2MgzBqVTaUyFIHwA2bFoJEbqDNunqCIzmEYeYyGhNtoTtq74VSiU3QU
         fw9WXZocnstuOEYVx3v1QtPwmyIg1i40vaT0xFTl1+AWk6gQyld9KeUf/1uASo5zjVyc
         Lrqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzSfcAk+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t58sor4844282oti.53.2018.01.09.06.19.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2018 06:19:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzSfcAk+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rZF/miYvVMP3IcuNGAoysKATYTI9Qzde6Z9wIEM7yec=;
        b=HzSfcAk+lx4c7D6gKwtZ19kvm0g0+4JONk6PvM63zNLVQBmP+Ou+WSi8WE8PRRA8iF
         egjVlca8l4QmsXXVv5PqMMRXCeecxAHUJBCdKETPPduClQN2uEYUgo3tOQ61P2H5C3+n
         xgartf6d2gx4MY7rQfrKSeOR5W+5sE5vmhNlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=rZF/miYvVMP3IcuNGAoysKATYTI9Qzde6Z9wIEM7yec=;
        b=f8qRoBDULmvUq4AiiqFLLCTGtusTS3lgr6lTMks6a6Yrh/RSwY0bf16WAVpB6rs+f/
         6OMMjC2QosME/CAWPn577I/3wV8h8nIlmvgWkolJukKP2x0fi0iHZeSfwJffdp/e6Zif
         o75U9wBDu8rKj6xpX4DyC30d9yw9/SgMwnFnJhNg4x9IFG5To/0QlYrvSBOqpYMHQwnN
         QLASaiCkuqVisQqWIsDe+PeJailv+1dtCPfzoFWgoK/iMA8s78brgAuQfemjvujZGNbL
         ZtLiKa2sToQGTs2VVHj379nJcyio+0VE2i2yotbaMYh4eJC7YG63V5XaSAu8KKGupERF
         zqEw==
X-Gm-Message-State: AKwxytctQ2zfRLjb7LWpDN8XMcON3aUdA+1o0HJtf5fV5v+H5NCYFbE7
	pGJ/5LEAy45twbvn87ALO0xh4nCxGYLO412WVcu6z+6v
X-Google-Smtp-Source: ACJfBotYk8wW0WRQcHuSOCeYSRWFHfIVObgWhjRxYEf8hKQsX7DVQ+OIJZPUYarhTF5ayKqXNLebroYTduKdTADcnf0=
X-Received: by 10.157.29.73 with SMTP id m67mr9041950otm.91.1515507556285;
 Tue, 09 Jan 2018 06:19:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 06:18:55 -0800 (PST)
In-Reply-To: <1c99d190-5154-556f-caaf-5abcf4341f96@linaro.org>
References: <1511890447-13601-1-git-send-email-peter.maydell@linaro.org> <1c99d190-5154-556f-caaf-5abcf4341f96@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 14:18:55 +0000
Message-ID: <CAFEAcA-UKGsy=xQKyd8kBCUj06sAcPXdy2H2mU-ukzNoh_Tk6g@mail.gmail.com>
Subject: Re: [PATCH] linux-user/arm/nwfpe: Check coprocessor number for FPA emulation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: z8WWuaP3o3At

On 29 November 2017 at 09:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 11/28/2017 05:34 PM, Peter Maydell wrote:
>> Our copy of the nwfpe code for emulating of the old FPA11 floating
>> point unit doesn't check the coprocessor number in the instruction
>> when it emulates it.  This means that we might treat some
>> instructions which should really UNDEF as being FPA11 instructions by
>> accident.
>>
>> The kernel's copy of the nwfpe code doesn't make this error; I suspect
>> the bug was noticed and fixed as part of the process of mainlining
>> the nwfpe code more than a decade ago.
>>
>> Add a check that the coprocessor number (which is always in bits
>> [11:8] of the instruction) is either 1 or 2, which is where the
>> FPA11 lives.
>>
>> Reported-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> Tested with a chroot of arm debian lenny, which is the last one that
>> still used the calling convention that mandated use of the old FPA11 FPU
>> and thus needs nwfpe emulation.
>> ---
>>  linux-user/arm/nwfpe/fpa11.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks; applied to target-arm.next (since it's as much an arm patch
as a linux-user one).

-- PMM
