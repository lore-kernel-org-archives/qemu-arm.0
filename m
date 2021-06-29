Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4962300lfg;
        Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
X-Received: by 2002:a17:907:62a5:: with SMTP id nd37mr29882683ejc.148.1624974827701;
        Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624974827; cv=none;
        d=google.com; s=arc-20160816;
        b=pFRZx9wz60vWdStdshUC/fyYsJ33jZBgn3CAftD25YHsQs41aTJ3L3Fsv85GfDqEWb
         Dq7QEixDkkisMyphN0TrHog1tXXL0BQJ7wsKyqfH0OhY+Bo7bJSibhEBxvMFdoX/6Yb5
         VRzpsQj3LthC5e9wrnIb6LOMH9aplk1zneZLpd1euF57QvfwL2qhrwOzRyDrTD/FCww3
         ALq3wF4XTDrCAnpUP+HD5do+9BdmHzxzLuT53fy/yEpcBt0Pv3jVzttA0rdGgQ8jOtCR
         lPMDFVNnBNVsF/KnuCK8MDOlbDRy7g0B1x/yo4Fi0eCbBYHjTIyV+ijEJsWTmT0yuCSP
         LO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2DrScNjcE4u9BJj6JHm/ZK3scJ/nq7wXncOQikRS5Hg=;
        b=qpp+6qRH9atGY7JNwYReKXRqc1BmmlnB8Gm6QDffHI+Vrz8HNCZHGqw0CopQ12IKy1
         Am6mplD4lQDAL8aJ2FCC1Mz9zVQxbkbUmth5XDSw2H5tpl5m86ccoa3Qv6Q2mBeZhkTH
         W0x6IbWi2qeCkqseGDCOD7j4/lFco0G5H28j8JyWw9ZVryrd9AuFwDWFzssMURZHcEIy
         bB96UJ+NaNqVSBDBYAxLe4L/8f9WVre2+DHQZwvzNx+zEgtK97EDD8ibNK+IB+lSHE0Q
         4AWAuRNaYNHWmoXJr97Ne+vS/trtBlBoPVNe5DzhUR2jteLGLXmh1M2n9DZV1R4LS2nU
         3ezg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zlL/hLkS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l21sor9233579ejo.72.2021.06.29.06.53.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zlL/hLkS";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2DrScNjcE4u9BJj6JHm/ZK3scJ/nq7wXncOQikRS5Hg=;
        b=zlL/hLkSHJzSLxMgLy9e7MlcVXGql98ot5MtxCgieyErkTFAk4QlM4cBSZ4GM9gEPp
         xfuIsLncab1e+NhFs4uPjd0r3PIY6eMxRGzyF5rKR47Z2xNxjrLnJXF9CRFQareeBU3q
         /Vid+AM6rnhvDHEb8U3KqkHY+LAbYdtdRic862neLhAiKxeUCK1OFR1LB3Z5fiY/F6s7
         8+EBzkxPF87//EkJt/mw23c1eUwaBEJ/AbYd+cof3HgsDgxtfodytYz4WlIstEZwahCS
         HQa5Doge1KVs1Ym5DsY6TceNaTEom2Hh0gDlNp6/TD/wMmJabYGSEDh29oRTcwmxXt9h
         16zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2DrScNjcE4u9BJj6JHm/ZK3scJ/nq7wXncOQikRS5Hg=;
        b=o39RAhFr1+9aS6L2Eaof+6CWktuxC+i76PO0r1ZPPArsKYx0UsP0bCXmddwl4F5zYU
         AX0bGPGYAJSXC9rCuNgBn4z/VXhgUpo1l8eXWImA+eTLNccN/Fpqls0zI3zI/aWUEXhl
         dCj7P0x+5hJLEyK0mAmaRZUuXeuEgTtamyTsluwZX4YXQQGLxAy6ewOuVkQGlS5p+hgM
         SfyQ20RgtfRi/Zh/zQ3h54QQnY6xWvCPx3LUkkNPEFmnhm94ZGT8mq+93JsPFW/975h+
         PlOL9c1MevqMyVONswtw9JlIOJbQlQtdNKRrk0fRbsZ2MDqLeu5E3s1wAfudifmrSRzw
         z6KA==
X-Gm-Message-State: AOAM531/89w8Gda253dPQo41LaZkK1ntXgZPZ3n51f0V2SUyItSnIf00
	+G/cILp3/TMm5bUneekJwMuIEQ67elaCWwTT+krAYBfg
X-Google-Smtp-Source: ABdhPJwFrKQLDSkrvmupyliyhjYlXiGjJpVfFHeqm2zrP5npqMZx2JtcJnAuJfvxvUpVYn2vafYqRgFjk1UDA8/nmPU=
X-Received: by 2002:a17:907:a064:: with SMTP id ia4mr30421707ejc.482.1624974827397;
 Tue, 29 Jun 2021 06:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210618192951.125651-1-richard.henderson@linaro.org> <20210618192951.125651-4-richard.henderson@linaro.org>
In-Reply-To: <20210618192951.125651-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 14:53:09 +0100
Message-ID: <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
Subject: Re: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lD1FnxliUUF2

On Fri, 18 Jun 2021 at 20:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper function to test for a v2 signal frame.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/signal.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
> index 32b68ee302..cb65623965 100644
> --- a/linux-user/arm/signal.c
> +++ b/linux-user/arm/signal.c
> @@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
>      return 1;
>  }
>
> +static bool v2_frame(void)
> +{
> +    return get_osversion() >= 0x020612;
> +}

Not sure how much we care about supporting claiming to be a 15-year-old
kernel any more (especially since we set UNAME_MINIMUM_RELEASE to 2.6.32...)
so it's awfully tempting to just blow away the v1 frame support instead...

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
