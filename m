Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3932133lfk;
        Mon, 13 Dec 2021 01:48:44 -0800 (PST)
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr35902288wmq.25.1639388924841;
        Mon, 13 Dec 2021 01:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639388924; cv=none;
        d=google.com; s=arc-20160816;
        b=DsNmKWn/HGwYOR/fJpxxpQrwu+FF4KWzv9gL1cWIqUkYieIGFtUOAPnitDh67n4n4n
         WYyI+ffZGPP7+YbIW62zvqNFgZyti+zmF5bKNOsQ2yLkeF3k3xGRmZu5grk/+dsvGRmb
         pLR/qm2YU0Mo0sAlp2pT3Z2Xth51nmTHbN+WCEZBpuEQT1xUsyTjvdT4K2TpY9DiMV2c
         zz11H47Oj7hWVZtCCiS6BEiLJNqR3CsDgJbA1z0GNUTumU3oH6p5CYQnFlPtZNa7sAoR
         Rm7GT8+k+fFvCDWxaSiplIfDwDlAN2jmwB4oUSicNMHNw+BBftQhMIhTMFcAxgLkMCFn
         nLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kHt/d/vHVS/aQ9X6fukyYpmuq9yh199hKrDqQzvmKNw=;
        b=BCZ0vGGhxqsXrwCILySjGi6hWJHO12OKYYOrMSQOR7GrvGGOuKTtZ2oe4GGpTXxOEE
         /DD0Y6ohYiemikZFQn6sMdpgIQSYWSEfYVqoQ/+sTg3gQVbIsno65pchEbGwfOck5cy9
         4x0PWQzSKBVwsjIMRtQuTYPHJ0saanbq5Of4lrpI46InxE+eGtQj6lgixURL/8gPKpJ0
         JBTobB3pfRjCw3lGOgXeCimdS6g3Q/gx8t2CGuV3k3mXmqK2XkI323OGQXzR4Yc/trVf
         HXXT1MgNa+skQPyha5WzcycaYCocWBiNJu8JgMpe9QXcMs/EOY7FUGPnP+4y1Pi8sJwi
         K0dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzy9QIIV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l11sor2859423wmg.4.2021.12.13.01.48.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Dec 2021 01:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gzy9QIIV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kHt/d/vHVS/aQ9X6fukyYpmuq9yh199hKrDqQzvmKNw=;
        b=gzy9QIIVgoY9wAar/wiGgrbBUQnf/bJ52UznLPpIGqz8w4+tpV1X2sMST8/eVGzzY3
         FUGl1on3R2bFKGBBpA6PuXSUE7ORcgj0je2d++Z13Z1MjZ78wT7uiyOr1ss1cGNiATUd
         GrSvdb9ZvsfNsSzWajlnAIbD+QeU1l2lmiftoZzES6YAF7CvxLiHGUyFL7oaP0jelib8
         lckAvfiwT5zJsoLpvrPzJeWGSIxGUukesZeE5v2KZmO9p1p0LpWNYGFRx+nWO8dvNval
         odknO4LWEmHzsx1qu8ouOjxu0totg5q1YLVsIkOnN5oUMW+HvLMjhkOcRKxbb8qqvZVx
         w9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kHt/d/vHVS/aQ9X6fukyYpmuq9yh199hKrDqQzvmKNw=;
        b=Qqau1qoOLsbdecJN0UaSQO5imWVXIfN8CP4eYR+uvtlgDJZG+eEL5UWJIhhZnbUKm3
         FXPimMH+U4yRt4pJoKrhxIzChwGy358jyQsP698QUU++RbVETDVFg1Yb4qOVpJfFkDm7
         Gwz2M8KjXmuExuW9WGIM5H0N8Z/ldB8R/kIYu8diMwWyBZcu+3foVPwmcpl535VzCUxj
         odYxIOzaSGZIV19zYUoauaypPhxwW92OfZsh8lnEGcpQCV/C3oOCQ1UCBkvTDGIzIm0N
         GuCOMAwt7OZSsjXSsNgiM+GaGVMl9fyVJ4Knglkf28N5rrXEkxjuZ2an3PFGqhQ1bYHP
         KfYw==
X-Gm-Message-State: AOAM530Pz4mOw9dg1Bdg/49s0ZVo/eHL5vIWsAGazVZ1e6zJs2b+/xXI
	IthRkP9LBUwT+aVmw6u2ZOKrJmnEypEcNiAioaXdWTM1
X-Google-Smtp-Source: ABdhPJwkA4XNL5WD43Zzcwaac6JlM6FhTt9jAzWiQWsxjWF6cNdmR/5YOAaoRmsJ4JZCJt5gBsYqCyLWpqI7626Hcwc=
X-Received: by 2002:a05:600c:1993:: with SMTP id t19mr36859104wmq.21.1639388920720;
 Mon, 13 Dec 2021 01:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org> <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
In-Reply-To: <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 09:48:29 +0000
Message-ID: <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: rSg+m3nDms3j

On Sun, 12 Dec 2021 at 20:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/11/21 11:11 AM, Peter Maydell wrote:
> >
> >       if (dte_valid) {
> > -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> > +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>
> Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one
> bug by not changing the comparisions, but changing this computation.  E.g.
>
>    max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;
>
> so that the value becomes UINT32_MAX for SIZE=31.

I think I'd prefer to use a uint64_t. I think that part of the reason
for all these off-by-one errors is a lack of consistency in how we
chose to name variables and whether we put in them the max-allowed
value or the 2^n value, so the series tries to standardize on
"always call it num_thingy and always use the 2^n value". I prefer
to keep the consistency rather than rearrange things in this
one case so it can use a uint32_t.

-- PMM
