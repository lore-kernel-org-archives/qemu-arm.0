Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp596800wrq;
        Fri, 15 Jun 2018 01:59:32 -0700 (PDT)
X-Received: by 2002:a9d:5a99:: with SMTP id w25-v6mr436539oth.130.1529053172569;
        Fri, 15 Jun 2018 01:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529053172; cv=none;
        d=google.com; s=arc-20160816;
        b=UcG5m8Q6YVtOnInTATEDGByd4DdG8lFly/tSc+ADrKrO9rNZlJhPSbniJ2niXPTdV2
         nT441CSLEFiafGS0IqTmPjTzXVvheorYv+/bHh3pjuiGGwAX7T721TgXC+tHJkn4fSSE
         kAIbJkFzYfMZuQpy3oAZhW8jURYqwTBSXmKL3BH7sq5Nq03V+BBdD5PqTGB/hoqGyEqw
         igvyFKqOS1qh58szuC2FNnEC5M0SBaSpZNWkdVxhh68rRjr/9+ko4dl1ODt6AVVBc2j/
         Xbrafq9Ua5cmFXiOtlY5cHq4qV2w2xr8kg4J+KIX+SpsU9qmEPhchJnh2IZBi5aku3FY
         uVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=/5/Ae02ncNF6YPcM9nZeGsNaiHkUgt3r6seawGl9Tbk=;
        b=0J+Yn2EYC46qr+h/AOZ7GE9+a8tEc00qOZbQRolbaPidcHh8BEER+VrfaoRbV3CSXz
         LnoOeLUX+2dWYxGVeFkk8cSHqyhGCQABV8YIN8hORebr64mrF19gazLJ8K2rMQ+wWLvG
         GwuaassgEyB4n9DxSJAAsjQh10u+NfrutE5D5BaPx+iIV0GE/5r4vnecSXPstpaMrwgX
         oFjXqg0fjwYya8o90ImzMEsD6QPbCAQ08PykfgHxQgz+37OsbKuPd0wANQmP7ZANVvYR
         dFaefmxFAa51x2S4ILTgCVkiJFnmzE/eOxbVlrc9GwnXewWF3azKq2n62povSbn1mAGn
         UbgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehhkGZgG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 30-v6sor3070585otk.7.2018.06.15.01.59.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 01:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ehhkGZgG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=/5/Ae02ncNF6YPcM9nZeGsNaiHkUgt3r6seawGl9Tbk=;
        b=ehhkGZgGvUss/KOokjFQ8la4a9/xPBmwB3dsCznXrlJSyCoyz/E+TDQ7U4d6uU3ZSH
         KCjBBbpvBKc2vEiJYgEa3SOSHKZ3x9rXs1ko7fWwgnlxvgs1W2RKTNIJldvjxzv0aQtc
         brz7R1redYPoYoZHQlu7qxtajCiJjPJmf6RPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=/5/Ae02ncNF6YPcM9nZeGsNaiHkUgt3r6seawGl9Tbk=;
        b=eyHcEADnYszA5Yjtf1NAwMNs1CQXuyTt51eA/YKQmHvw8nlLHikxO3hofIKqZF3zDg
         pgs669qeU5iHI3eJqBeh1wEntjcUlQy17fxWSRse9ze0KD+ku4aQMK1xnL0EB96BKkST
         PamOKqMYHoeYF0UTCXmozfFX/hG3gH5cikDjIESMmvyZM1rW9W1tRlD14K+z+RLBntCh
         gLWN+ZDazhxlFD6tAVd1AAfN8tARMpwhp36U4vWo7gfzIa/CkvOgsRh2DTQXbZc6AVoF
         BKaNxd/XDaMBeG2FXWVAY2YT5KVi6M9VhIRzJspSv4hZxdD1P0uFLRI0ApZxiG4Q9lBv
         3ViQ==
X-Gm-Message-State: APt69E1EkGT9ffHq+pFxGjd5gGU7Jhg7BvTNWIZ5c8kgq5657zUubAkr
	OBCUJQSjfmy7U6TBzX9RhB6m3YnNbdVUSJPk0mUnGY1M
X-Google-Smtp-Source: ADUXVKLCR1PhkyuuYOM2eDWX/vu/+jpDIF1IJidCWFlOB2F8to8gmAxgsbFZCfWYGNEkw+So6NCk2xx/bsNXODQFfb0=
X-Received: by 2002:a9d:1a0b:: with SMTP id a11-v6mr408642ote.205.1529053172218;
 Fri, 15 Jun 2018 01:59:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 01:59:11
 -0700 (PDT)
In-Reply-To: <a99ad0cb-89f5-1241-7992-d133546e28c7@redhat.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-7-peter.maydell@linaro.org> <a99ad0cb-89f5-1241-7992-d133546e28c7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 09:59:11 +0100
Message-ID: <CAFEAcA8AfiaJqJxgbOothdY8JDZ3dK9qLCVZL=k=J_nxtwMXJQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] hw/misc/tz-mpc.c: Implement registers
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: FK3g7laP69TJ

On 14 June 2018 at 21:14, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 06/04/2018 05:29 PM, Peter Maydell wrote:
>> Implement the missing registers for the TZ MPC.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

>>  static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
>>                                     uint64_t *pdata,
>>                                     unsigned size, MemTxAttrs attrs)
>>  {
>> +    TZMPC *s = TZ_MPC(opaque);
>>      uint64_t r;
>>      uint32_t offset = addr & ~0x3;
> I don't get where do we check if the access is secure or not. Shouldn't
> we test attrs.secure somewhere (PPROT[1] == 0)? Also the spec says
> IDregs can be read by any type of access. Where is this differentiation
> done?

I'd missed that bit of the spec -- yes, we should be checking
attrs.secure to see if we should allow access to the non-ID registers.
For the MPS2 boards it doesn't matter because the registers are
in a part of the memory map that is enforced as secure-access-only
by the IDAU.

thanks
-- PMM
