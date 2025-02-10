Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2116336njb;
        Mon, 10 Feb 2025 10:02:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXga8T2OvQ6fybxAVePIWfGiqFlrcgbqdvdNbXIbi5sz+EIC8FhK4Fm2YeSmhdLgeSibgJeTAQruyNcww==@linaro.org
X-Received: by 2002:a05:690c:2789:b0:6f9:871e:6903 with SMTP id 00721157ae682-6f9b29e23e2mr146543207b3.37.1739210560685;
        Mon, 10 Feb 2025 10:02:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739210560; cv=none;
        d=google.com; s=arc-20240605;
        b=gzn/xE4m+Sm0S39H7e75RvlqDnEg4sMZfokcyqqoY/xPHONVGIL7eUnZaCbVCKhGle
         nn6m1dIAQHBiI3E3IEaOc4dJfYABVO8xqbhJy/gULRAahZ+9WkiwyfJMfxIoMrenni9+
         jJ6U5p0/HAw/p8wVYIaODO7CX+T23hZ56DcbYUpxkhUt7F6SmSYoSCefkBSSuif57I0n
         +e4RoN1yrygbM4s7Hr38eFx7Y8jFp98aFUho6ENm8mDRZAVHrMlA3hKsv+kPtVWxaePY
         ORfwk51i/s+DezlotviJsEmNfD1CdY3yLtNQYwuR0FgjJl60FO4/PuRF4KcDt2nbkg2q
         u07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uqH2AE5SNm8gHbGrysSz+Efk5ie7Lp/oyn2NiJoVcYs=;
        fh=kXVHYplYH0iddJxYQXkcqMhMkJTGoLDtBTrCbOnashw=;
        b=So+Zvbr5qixWOReizCXMFCfwjPiQkwCuIrTRw5hmnXyVWyydDxh+aWWdJLOjCVOh5F
         pPh0kdaSk2QxVmTcUDQQAK0AFyF0V1Huqa9rpH57IAsDDAAHRva5Ci3myO/vR3ZL1iPY
         ALvg6mXIzLvD+0bTjQMauj/5SN+xqjxp4D7lgH+qhXcnWIsVGYTWNWn6NeCR23tdUhRH
         livTYIZKi81WAQnPBMS8uBQsT1nm3P5y2hiK35j7RROcKVlykxybUQ0/M/COPx9fR1Ux
         haceKDNLfT0LaCV3yTh+Nj4J9Pv6lqdQBQI0HVK+mQJ1x1qgYQNYAo/C7SU2LmPWE6BF
         kvFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7wL5W2Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f9ca59b1c3sor28536667b3.8.2025.02.10.10.02.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 10:02:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7wL5W2Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739210560; x=1739815360; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uqH2AE5SNm8gHbGrysSz+Efk5ie7Lp/oyn2NiJoVcYs=;
        b=x7wL5W2YfaxxZ9qDWxfuuO+9KF7hrLMvfIzWhOGLzkN2EmuLLcWoJizjY9AXp2wqOW
         YB0qw7atD7ieuls0v3dlXSE+ASKfkHoazc8C7jw3LX8XTtsH3G+/PbUBs9ka00GZomup
         BYPpFgQuIf7QURxWvVBazthcTcxNYDuhOmgYB3pPvoNH8nG8XlDO9r3f19brgHO/+pzb
         YO7tePMYoy2lMp+usZAQ43HHCgyBoWpwK32V/XdFeu30RMqDqts7BtRkoFP541ndSfqD
         nbLCoGnjCKXg6ERBm4D09/EAWFR0hTUeHQNbaYCwruL03nzKNP8bq5P0VXNEEpjiBuZ0
         MRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210560; x=1739815360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqH2AE5SNm8gHbGrysSz+Efk5ie7Lp/oyn2NiJoVcYs=;
        b=HuAgaCTJu39oPdG1G0nNhwJrKszcW7xrhdUFZr7DF78p1AQAI/NJWGo9YZtNFKwLrH
         llyCU5+feFesTMZ3ssYnLchQZOIvbVpn/KBdLcl/wfy6r2bI18oj9DbKXdYAjg0yrBrI
         1tbh7KGdErfJealN4L1fTMLzMqdAoIXzKa3iF4zSW/YYf0F5zw0qUpnpIg6xUzmm3Vi7
         YRgaiGKmv1+aYmEXeOq0LEKrgtqtngwFZMA75x3vdNIG/MgoItOUel8jm0W7F8xXB7Ks
         sdn1ThPz4+kBncK1JF87HugygXWZbg7MhMxfR+LfFDn37oZkxf+Xayy2YnQUUpE3Nec4
         WcnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtswLjnTKyfxHAhsLHxDXpflZ5TG2uRsYnt9+9Qvyt3h9yyUlDquZJApUYuNlxI1Tp1ScIY9rDPvJ2Bw==@linaro.org
X-Gm-Message-State: AOJu0YxSOb/zjU2A1pvKsocDfvrrzOnTHpmo2Tu9bgrftkrCuuTSi+9v
	omuhcCekNcHwsfAUzPcu29d+8QvJ6rXOtx60D/zNHsTCUnL/iuXovA3ovSxKgpOYlZqX4gRfVxV
	0dUXIAKrifGwfr0xf9VvrSsvjV0pDF9zt54iQYMeG
X-Gm-Gg: ASbGncug05+az5hwWPe6MArcgVzzKjxdqu/9r17tdypFQ8xacABkgcQSInLzi8wxeEW
	UVxax3uKvb3c95Pvt5Te7uIcUC9ikMsctjorPfAp7Z5az6sECMIApXKQC1/8Uq6oCoQFPCSDgPw
	==
X-Google-Smtp-Source: AGHT+IEX8rykgJcjhEM1jsSJbj9aQQ8BMFCHJxnIdG02Yaqj6ZGriODVQqqmY7abeAeRjEhGezXV+TtLsYOhscIkENc=
X-Received: by 2002:a05:6902:168f:b0:e25:ca37:b669 with SMTP id
 3f1490d57ef6-e5b461e366cmr11739935276.24.1739210560285; Mon, 10 Feb 2025
 10:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20250210135804.3526943-1-peter.maydell@linaro.org> <CAFEAcA97TpSfRVpNOg025GMw3pduR+73gr2LDmncoCpTDfV3jg@mail.gmail.com>
In-Reply-To: <CAFEAcA97TpSfRVpNOg025GMw3pduR+73gr2LDmncoCpTDfV3jg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 18:02:28 +0000
X-Gm-Features: AWEUYZlRF2sH9Wxq2UhlG70fyBOuI8f9qZGhmjfnU3rW4ChOZ0EKoSc-3gdHLbQ
Message-ID: <CAFEAcA96VYUbp6L33O9A461=0GWbyBB8gP0rbDm+QkamY8daHg@mail.gmail.com>
Subject: Re: [PATCH] util/qemu-timer.c: Don't warp timer from timerlist_rearm()
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: F6HWw0+EDDLC

On Mon, 10 Feb 2025 at 14:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 10 Feb 2025 at 13:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Currently we call icount_start_warp_timer() from timerlist_rearm().
> > This produces incorrect behaviour, because timerlist_rearm() is
> > called, for instance, when a timer callback modifies its timer.  We
> > cannot decide here to warp the timer forwards to the next timer
> > deadline merely because all_cpu_threads_idle() is true, because the
> > timer callback we were called from (or some other callback later in
> > the list of callbacks being invoked) may be about to raise a CPU
> > interrupt and move a CPU from idle to ready.5A
>
> (oops, stray editor damage "5A" at end of line)
>
> >
> > The only valid place to choose to warp the timer forward is from the
> > main loop, when we know we have no outstanding IO or timer callbacks
> > that might be about to wake up a CPU.
>
> This raises actually another question: should the call to
> icount_start_warp_timer() in main_loop_wait() maybe go after
> qemu_clock_run_all_timers() rather than before? (Haven't tested
> whether that breaks anything ;-))

After further thought, I don't think this matters. If we
call warp_timer before the run_all_timers callback then
the warp will only warp the timer forward to at most the
earliest timer deadline (and then run_all_timers will
execute it); if there's already a timer whose deadline
has expired then warp_timer won't do anything.
If we call warp_timer after the run_all_timers callback
then I think the only difference is that we would go
round the loop another time before executing the
timer callback. Either way, that bit of the code doesn't
need changing.

-- PMM
