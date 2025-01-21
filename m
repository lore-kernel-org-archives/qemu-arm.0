Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6559392njn;
        Tue, 21 Jan 2025 01:53:46 -0800 (PST)
X-Received: by 2002:a05:6902:1608:b0:e49:5f2d:e722 with SMTP id 3f1490d57ef6-e57b0bc7f66mr13519632276.14.1737453226703;
        Tue, 21 Jan 2025 01:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737453226; cv=none;
        d=google.com; s=arc-20240605;
        b=g5jcb0wr3Z/qMJ27+BjXxQjpuczIgVXuhox36o9RTqn7TmHnVIQhhx/FntkaZ3nvMo
         qUa+NBHWsrkggVAd9LLUAlE7ZowilmEDMYxallAK5MeOottiZU/r7W2AUM7UDYyIcIoW
         NHbPQaawYGwqgf/GkPXZvPKn26826Sm4sKPhiUjjLMmUizNKMOxwN+zyN3nH8HBtHabA
         4sUxQcYQukvgXT87oVsDZ6/liBvxY9Ye2lL42MosiXmFn7KrOTazfMI/buAEJXSnhnKd
         x4ugfqT3k1ITLq38sNBwyfSna6mr7C0g6hhuxPZA2m9pTeLoxjVqmrMMr+EhA4IqrsXW
         pSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6zxenglKOdTpDVqosoVEBzl8yzpYtl1OVk+4VG4qggA=;
        fh=2WAkoYwmNwyk6LsgCps+2Jmxr8lKhzpm0KteUL/cni4=;
        b=dyj5cU7w2XqCwuSVlz0PApyHtnLi7lyOsCVVSQSNc6YOAvG8GAo6Deu+ri0DbhfQ1b
         /Ljz0sTRXLsIC4jzmf/BzTg4rj02ugrTtTWrdoYfap7pjTwcCGJEpbi1Prbq5K3U8THG
         0E+AY+5xRMa9ND7MPK97CXK8jLx9wjQmt7wRh+K6AZ9EuqJEbRT8M2XSJp6/jF7RFdnm
         e0kUlwszpKYMACPt46h0qHb43fHQaoZQN5vlxRoI4WsVYaDNDyOSv4NWpnBCM+Twhojc
         3YXX09FuDJbdzEYxSLW2pmYoSXVAgljaFP2RD0Yo+HBcsR/s43i4jKVQBu8+hk+YDmJL
         xIeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EESLkyMW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e578be71b81sor6521595276.1.2025.01.21.01.53.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 01:53:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EESLkyMW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737453226; x=1738058026; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6zxenglKOdTpDVqosoVEBzl8yzpYtl1OVk+4VG4qggA=;
        b=EESLkyMW7FHNK3MZE+2mi7ZckvvqPtdZFsmSmA79WF47wM/C+aci2dEpVrGMUBDmfb
         3vMyf1K20OgpG9mZvAg67BSx2qOEqcmP2oP4+qjnqlDp38txHH2HmiI/wbFD5KbTPgba
         TTjwIgy8iDtQY4cKkwFHWJGGcgLEzncXqwaYHJKecTAX/lt7ghtyFJf2ONeKfqkWP2EE
         8L4V23jj21it41hrePv+mbqA7blcboY2gKi52BxCtMHJa0h3eyK+CKoBftXJbsIT6ozt
         iQ3UakFBeJssD6S2blFmQ8FF+S/Bs6EKhFYDKjzCTS1HR4iv4q4nC1fxDV6hIvSNAoMk
         NxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453226; x=1738058026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zxenglKOdTpDVqosoVEBzl8yzpYtl1OVk+4VG4qggA=;
        b=DF0AQaMaWqBvc4ikhDf7gzSYDzAJKs2l4usZo6eeXFpEG4saiKXvWyieOYJwYdskje
         E6xijZu18TUGezNihi1ErNTKjB9xmauTITlshSI5HDp7x0+cixHhgVJXvGl/6V6tBRop
         gKQKZkO1P+GUkSJCo1roSItxnFwC9ozPgloAIkp/wNQ93oxrdQzkBYB03aYt16uBL+aC
         YJfAA5X+F6V6MsHEXY15qNL4cexkNu8NZynLadfFr1HMnQtRSUpCXJFjOEqXNPRKAvRk
         V8K+0x6SLJhZcnz+fY3jgQGj9nZcxShKhHppCfR5y3hFp7wtVAmtYtnDmzg/Hq26vAVW
         UI3Q==
X-Gm-Message-State: AOJu0Yy32xLflzn1QsAm28e5wtea8EoThPZxs3XLOk98jI+zqViJW1FD
	F1ljul+7bKa1QHSQ5AVLXKpvAsh3/UYGDnvsVJiu9RAxds73huVOvY8bD5tDj9zVRbEE1Sieu9k
	yDc5nobdMx0BQ7vJjqoBuschx6fZQ742Uqkn8yG18
X-Gm-Gg: ASbGncv1wvgRJSRCR8nN8shL8FSBolxU9tUQ4/nqGBRG40M5gJUME1djjoKnPM/qH/9
	SlPWrXFqaHK0kjHtXMJbk7crE87hHT4L1jYQ8akbw7Ax+jD/PUe+H
X-Google-Smtp-Source: AGHT+IGdCPU3gdOsfU895As7ssY8E+ToGbAOFY0yFs/FX+th2jo3nT8og/h9HJQNJvDIBXEAfoQ/Z9rL+Ep6p0dpQps=
X-Received: by 2002:a25:aa11:0:b0:e58:a85:e812 with SMTP id
 3f1490d57ef6-e580a85ea1amr276968276.18.1737453226307; Tue, 21 Jan 2025
 01:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20250120150049.3611864-1-alex.bennee@linaro.org> <CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com>
In-Reply-To: <CAGcCb10gHVZdN6CbUm02w7jTaUUoBH4-VTohmy+yiP1OLWFBxg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jan 2025 09:53:35 +0000
X-Gm-Features: AbW1kvZ3JzgpvXIxnIqLALOIGSov5VWxAWAKw90iss4Q0iUbMI_Y11L1lpboUkk
Message-ID: <CAFEAcA93xPuBTN6LSHLjXGfzar2ZUZsBBxJVzLOPM9_FooS5Sg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: don't step clock at start of npcm7xx
 periodic IRQ test
To: Hao Wu <wuhaotsh@google.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, Fabiano Rosas <farosas@suse.de>, 
	Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: s9PCReSne71T

On Mon, 20 Jan 2025 at 23:52, Hao Wu <wuhaotsh@google.com> wrote:
>
> Have you tried that the test can pass with this? If I remember correctly, interrupt won't trigger properly if not advancing the timer
>
> If the test passes it's probably fine to remove that.

This specific clock_step_next() call is done immediately after
resetting the timer device, so there *is* no pending interrupt.
(That's why it's a problem -- it says "step the clock forward
to the next pending timer expiry", and there is no next
pending timer expiry.)

There's another clock_step_next() just after the context
in this patch, and that one is fine, because it's after
the test enables the timer and so there will be a
next pending expiry to step forward to.

thanks
-- PMM
