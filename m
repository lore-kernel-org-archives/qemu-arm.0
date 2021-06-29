Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4771993lfg;
        Tue, 29 Jun 2021 02:39:29 -0700 (PDT)
X-Received: by 2002:aa7:cf03:: with SMTP id a3mr39398113edy.27.1624959569121;
        Tue, 29 Jun 2021 02:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624959569; cv=none;
        d=google.com; s=arc-20160816;
        b=loZhvLSSmRcMqXk9VZqqrz2ktzBSgMyQZf6wDi6h6+Pu0QX+5ch4YDqfBXH0ik22W6
         kwz9lnxfq/Umf3qa/N0Zw/AxLi93Dd88onbDu9BCtOML9vc/MhUXwJeLLuOUGD7yhiTD
         LtqaqwoK6q1dSuRcld4y1B3hwB4Dl2tc6Z/X7PzmznYZNnJoFk74QbXs8wZvs5g1gv4x
         TYlc8GCnxbu5UuQcdfSSHlJWhsWGMVCpxrB3H8oPP8aos96jkF7+z6pB9C0exmmslkzw
         35pix7RA4RoMGVfgFaxpMGAYBsm0YYgKZX2vRNbbqIDVd7No4NMI1z62Yaks3owcN8Hm
         ilMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2m1cm4DNjdxFK97J07+kJqGsdUAHFeoMZD6p9ec3dTs=;
        b=fX1YF2tXUifPdWiYcYDQCh1fafZk+sMvrppUNyOCd30rVCrrNX3D9oUxvujSud0M8k
         PQAsHb82KbcbbCYEpDZMbtX1Q6cXki05kWMFvhTVU6GiqeK3oOfNb7VqLDL/MxQqyHke
         UVG9NllYCVxNZF3pfLCA02kcISgW0cRvTFmJpymOMehNZvApiSL+vnNPSq1qf3Dt0rY6
         yKE+Zno+B02JymHnzuLd3bBmcCiyq0HuIxpyerFXcDUzJ8NhyPy2XskwhKVAikA9bDby
         9mxayAdukR+11gmQI399Yps2SbuQ+EzHJHp0ykmd7J2eRciCj+7naBw/M8aO4kP/4vC8
         QWaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgsI38+K;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hw8sor7506561ejc.25.2021.06.29.02.39.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jun 2021 02:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DgsI38+K;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2m1cm4DNjdxFK97J07+kJqGsdUAHFeoMZD6p9ec3dTs=;
        b=DgsI38+KTWaigw4Q4tYn+iz7ZMMmc+e8Mz7IWnRyEqwzI1ZaTsMYCDOyKGvBmj8bHh
         FyHfo7K1plkgSx7hXcqUbS0eg65gZPI/VvBIWDXO/WcFhwah+wUmWwf2h33K2fe1yP6Q
         AiSsE36DFxrww2oC7gpgE/Ev2NWugr4uZqrtyvbBCfsK8wH6HjeWU2uNpkwA1HHgz3FT
         BcKfCHCgspub+cM6JH6NltoVkbUkMzwAlF/lQmnHwAlnudD85uw91Y7xG8G9ue9A6M18
         E1eHuAKK6Z1sEA5s7KjRPZ0JhQ5cwzBudtQB8fYW8FKPv3yj3AFUsHBZdP1UeoIkZ2/b
         p3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2m1cm4DNjdxFK97J07+kJqGsdUAHFeoMZD6p9ec3dTs=;
        b=CkGQHpDRl8p1EtK5Pps5HYlZ5TsTwACGFa7AqJOnJjZeB0LHpua+ychOV6LeQqQ/kU
         MYRkag+xEOLp7YDrPZ/VgBwtTasLtDPofH/j5WR+vXPi7K+11z8EmwdU9vBEhtZwju7b
         kAdvOHDAZbllTqPrtqZn+6dJjQ6q1vfhQA2d/68o5kzS3SB5Ev3xG4EactQ272ChtIaN
         RvOQlm+MbJju2B4eG2DjmW3peVJTUW//vyD/uY2d0rfTbIhuBy+uSFtG/i0ivIzaDwoh
         bc/bcm5ZPKif8kWlFduWypAW9dLaeL0C1u1E3PO6VVrd4Uo27d2ideN/HZW4zC0nr0w+
         SLzw==
X-Gm-Message-State: AOAM5313CquV9OV3ZRC4+D9y/b+F953XaGvIcwq+mkU6y/pKgeCRPkvc
	X8g/+rU2cIyOLbihtKYqvhQKu9omMd6L/Yix9FSkngIX
X-Google-Smtp-Source: ABdhPJwLVelBNDqeZRe4FWYQ7Upvh1ty3HtU8x0P3wuLuo36vBnloNnJW/FrYjR6pZqapK9zEkH3Lgg1cMLvsraNYq8=
X-Received: by 2002:a17:907:98eb:: with SMTP id ke11mr29411177ejc.85.1624959568867;
 Tue, 29 Jun 2021 02:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com> <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
In-Reply-To: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:38:51 +0100
Message-ID: <CAFEAcA_BOGSuFBuW_YczvbT1eFRhq9eL4K7f8EaSwjvPfEXmbQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Joe Komlodi <joe.komlodi@xilinx.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: CVKyrXt0tEBR

On Mon, 28 Jun 2021 at 16:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 7:54 AM, Peter Maydell wrote:
> > Richard, Alex: what is the assertion trying to achieve ? It doesn't
> > seem entirely obvious to me that because we're in default-NaN mode
> > (which is a property of the *output* of FPU insns) that we should
> > blow up on calling float*_silence_nan() (which is typically an action
> > performed on the *input* of FPU insns).
>
> This was in response to e9e5534ff30.
>
> My assumption in adding the assert is that it was probably a configuration error.  If you
> disagree, I suppose we can revert it, as it's not critical.
>
> > If we do want to keep the assertion, somebody should audit the
> > other frontends that use float*_silence_nan() (i386, m68k, s390x)
> > to see if they also need updating.
>
> Easily done.  None of them ever set default_nan mode.

Hmm, I guess this was just Arm, then, and the current code
is silencing the NaN and then ignoring that result in favour
of the default NaN, which is a bit unnecessary. Plus, we have
this patch now thanks to Joe and we don't have the hypothetical
"drop the assert" patch :-)

Applied to target-arm.next, thanks.

-- PMM
