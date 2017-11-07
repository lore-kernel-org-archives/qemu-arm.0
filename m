Received: by 10.223.150.237 with SMTP id u100csp374491wrb;
        Tue, 7 Nov 2017 10:53:47 -0800 (PST)
X-Received: by 10.28.217.136 with SMTP id q130mr109932wmg.89.1510080827057;
        Tue, 07 Nov 2017 10:53:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510080827; cv=none;
        d=google.com; s=arc-20160816;
        b=NR1xvq9ehJZex7d6hiC8kKz3AwQn8excjYclawxBXSLdd2fnVr0aYXKHI6ocZbaV9l
         LF4kPdFbVDo45CYiDtokGPXJQUE3UbBp2tZjpodNG2swv68uXYhuZSju+jG1JjIuEcu6
         G/VpSLmZ2YGu8K0wAiUVieWDQHBIqdahZf5qqX23pNUkQxQW9v5MYS+9ltK/VmGOm7su
         wmSIcGDcslXWqSLZywoqwVz8r/E9eqXGe8j9JAk06NZdYshUKxlyMFBaGqcN7uwnDrmh
         8Q9M7i5DZQeyvgKBYSSkTHRuCZ2ssIr7lbUt/aFB8kTbqCmoQE8XoRR9ZFB6ZpdF0mxf
         Gukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=En/2cUdJQ0Rf66BWaYOzRS3OOL0w5SlMaAzSd+ZAz2Q=;
        b=x3WRdYUB5OUYn+DmyxxCN9Nw2TiQE7YIDmojH7INBGT5wq+tC9KwIlXH0fVgXDIxnV
         2zzDWhAoEUTnBulcFQeB9QBTOzT/NVIvhYPIF8EyWuwR2/O/AXr+Av3/idtMAd3H+/Rk
         zRGNExuNlqA6QCal7rSF9XpOCYc10DPv1h3mMbDy2dkL29R8ACPEbZVzD+3pehlp9RiS
         tOeqTQmAGtg4NHRMj69k5HVzu3iw11EHSyH2bvLikTt/mYGxZ79A+Ld1uu3MsCvO8Irg
         w0mEAfxmkKa/2+AsCnAor+si4AsdiCd5SOKkbnKJDWMxwmZlodJbwEid1YjSSyyw1MQQ
         dFtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LlR4pNa7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x13sor884949wrg.77.2017.11.07.10.53.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2017 10:53:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LlR4pNa7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=En/2cUdJQ0Rf66BWaYOzRS3OOL0w5SlMaAzSd+ZAz2Q=;
        b=LlR4pNa7XyDtmHOQIQYVuR6CPN/HO86kSMbBvmmTokzmAH1x719qaDbEnIinoW9+my
         vPtu54sROL7PMBwd1CRHohpAPdVyw/WcWimb8KzpHxefJAw0w4hSFu+AYQ7lmHeLVsw0
         o7cVJjTfVuVCB3uxpiGX2eexjbUCJ8YnppldI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=En/2cUdJQ0Rf66BWaYOzRS3OOL0w5SlMaAzSd+ZAz2Q=;
        b=QBxN86Yu7lWdhmM8knXWNeXaDWxhryUGBD86IwinfiNSQkoODfTZGIvbkJPqqnKFqK
         bwGcQlpqR3zCrNLRVNtuKjQ+yyaALAGuzyrZ6yTPh/YPRnrgL/ExDhSOUKZ3lQbQR4+8
         da4YU6mdVV7AZztkNSeVsfSeQgO9E4Bjv7NIhC9u3HexdB8ihuCcLBqg7+bmNwGHbCpt
         UfnG94jyTxxvp9+KnIEVAtc9aGLMkodH2pTmRCR/7Z5FezCaG4M0v6EKJl4xh2NGYsnY
         txGi2oUgGX6uPxMdi4jjm9BZ/r5Q3yw+HUQB7H+SBLYQne4C8d0GQ3jT3ZH40MmftRuu
         mWRg==
X-Gm-Message-State: AJaThX4Soe565Mj+bNUMLONYWqwPiWvhnQAvz45Dagv3ClyyJj0MWp90
	oyvvTe9uiDx0GBXn9UwflfqH3q63x3uQCPNlF8z2NnZZhLY=
X-Google-Smtp-Source: ABhQp+TAZkHYtkj4g1O9cxNCPHXtbiLV4dLFgRBaPjkN7fDVotN1WF+lKW2B+LBY6/HIC21htYXZMd7V/j6tTEsrfr8=
X-Received: by 10.223.151.212 with SMTP id t20mr2348805wrb.2.1510080826626;
 Tue, 07 Nov 2017 10:53:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 7 Nov 2017 10:53:26 -0800 (PST)
In-Reply-To: <87r2taq66h.fsf@linaro.org>
References: <20171107165226.22546-1-alex.bennee@linaro.org>
 <CAFEAcA-E4Tq0gi3q5z+_5JOy0-j0=59p5WiKNFP9qmKG8=r4bg@mail.gmail.com> <87r2taq66h.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2017 18:53:26 +0000
Message-ID: <CAFEAcA_2QhC5BRJX51n4FP7EBOZ2qyq-H3hRhoGRLMTD=gP=Nw@mail.gmail.com>
Subject: Re: [PATCH] accel/tcg/translate-all: expand cpu_restore_state retaddr check
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <rth@twiddle.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: AhNbgj0FV8dK

On 7 November 2017 at 18:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 7 November 2017 at 16:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>> We are still seeing signals during translation time when we walk over
>>> a page protection boundary. This expands the check to ensure the
>>> retaddr is inside the code generation buffer. The original suggestion
>>> was to check versus tcg_ctx.code_gen_ptr but as we now segment the
>>> translation buffer we have to settle for just a general check for
>>> being inside.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Cc: Richard Henderson <rth@twiddle.net>
>>> ---
>>>  accel/tcg/translate-all.c | 20 ++++++++++++--------
>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>>> index 34c5e28d07..eb255af402 100644
>>> --- a/accel/tcg/translate-all.c
>>> +++ b/accel/tcg/translate-all.c
>>> @@ -357,16 +357,20 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t r=
etaddr)
>>>      TranslationBlock *tb;
>>>      bool r =3D false;
>>>
>>> -    /* A retaddr of zero is invalid so we really shouldn't have ended
>>> -     * up here. The target code has likely forgotten to check retaddr
>>> -     * !=3D 0 before attempting to restore state. We return early to
>>> -     * avoid blowing up on a recursive tb_lock(). The target must have
>>> -     * previously survived a failed cpu_restore_state because
>>> -     * tb_find_pc(0) would have failed anyway. It still should be
>>> -     * fixed though.
>>> +    /* The retaddr has to be in the region of current code buffer. If
>>> +     * it's not we will not be able to resolve it here. If it is zero
>>> +     * the calling code has likely forgotten to check retaddr before
>>> +     * calling here.
>>
>> This part of the comment isn't correct -- it's entirely expected
>> that we will get here with a zero retaddr, because that is
>> how the rest of the code tells this function "no state restoration
>> required".
>
> Then why call cpu_restore_state at all? We should be consistent as there
> are plenty of places that do things like:
>
>     if (pc) {
>         /* now we have a real cpu fault */
>         cpu_restore_state(cs, pc);
>     }
>
> I'm happy to make a 0 retaddr officially valid and actually document it
> in exec-all.h. It's not like most callers even bother checking the
> return code.

Hmm, there's more places than I expected that do that "don't call
if 0" check than I thought. Overall it seems better to me to officially
allow the zero, rather than having lots of callsites that all have
to remember to check.

Incidentally if retaddr is zero then
(retaddr < (uintptr_t) tcg_init_ctx.code_gen_buffer)
is always true and you don't need to explicitly check for zero, though
it might be clearer to do so if we think we might change the rest
of the condition in future.

thanks
-- PMM
