Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp653560ejb;
        Thu, 16 Feb 2023 08:22:23 -0800 (PST)
X-Received: by 2002:a17:902:d511:b0:199:4d25:6a4d with SMTP id b17-20020a170902d51100b001994d256a4dmr3207419plg.10.1676564543246;
        Thu, 16 Feb 2023 08:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676564543; cv=none;
        d=google.com; s=arc-20160816;
        b=hHj7b3kyf0ODkOX9NNDwGZE/jR6K2tzgfa1HcKmbvGoff+AyglYiv0Ejboqo5KLust
         haSTQXeBgdCpLVsU0BM8/p48AF0FLWE6/jdZ0bQX1cwo/IKWuPWcLzhJyh6JwTokz3j/
         EVJnVXR/LVkSEw3LuTVnVocSQBgeEbdidSy3unzcrBWw2VEfkKY7op8nVsZxuj+a9/Bm
         YyRUqydm1af1y8x9BgyAHhzdK08S6ukFhtSxocT3cKGpPWYjD6ZFSgMLHKzW0iPPvBrB
         sztQAfb6nfXinJ8xuB5cBFV6PrzLzvcd0+eNJL+Uhj3RLT4uKzAI9NylMGX4vthum04w
         qEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B165yzoaoQ4pNicAlRZpJSozM0YC8BhzYoYDe1uoDBI=;
        b=nuOfpyIPKdXAQImrOH3Bxp5h1PCTk8CW/S1qFAuHPQUtMiTey5iuad4eqJjHIngQAp
         ON6mRcE6fzdcUi6YXpyVFvUntBEweOryMrqV0ubtPLU2xyFbgN0Ygk0gdVqEUquyEQWo
         sr6AAlQPfoy53NK7Pn7QYics0HxgtvnUca6fOqLmA5FYYZEb43xRWvQ6gEtH0ETM7rRh
         s+5MVe4whDr+RPWqRdubbzAX/oPDVmNvrNlRwUNYL+0LfSaCBGY0hmRuZmz0UHVqgXrB
         c0IBbcxBGBFGxIZFvGBAo2SQw+4V/f8nFSXGhkxXBsvmo1P4ZEN3spjdPghAZ86Mux8H
         C6NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xfWVY79z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9-20020a170902bd8900b0019aabeed86bsor847532pls.43.2023.02.16.08.22.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 08:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xfWVY79z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B165yzoaoQ4pNicAlRZpJSozM0YC8BhzYoYDe1uoDBI=;
        b=xfWVY79zZuteURWVs9e86mfCSjXvu4t34HTnh9TBtdCC16tpndhHicL8UbG2X6ea2u
         j/2ZckzKrb8WsRt+gAIMReNtScDfoLI7KzgJvCSNCCiX49AziOUKvBVYnQwjuRaiYLdw
         /gIJyajXY8TE6tVhlVm/1Kco4eNczhjPCKzJmg7kFeECe669cn3mWg84AwXeMXjqGp1A
         mxmOYCMK+2OYWM/9MJosXDrLNwijSaY5WHCLOaHNf1IUwGHh99E2EehQC2dJ/FhsR/Sg
         kC+tl56MQ/jIwD7T81MS3BFfzkFCxD3+UTFZw9uxBucOq4szm3PsGiNO8KT18MWdu+9L
         ggyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B165yzoaoQ4pNicAlRZpJSozM0YC8BhzYoYDe1uoDBI=;
        b=OQ7A+12+QNTwJUm+HdmgJAaJYKmGFNaMw58R+YAnTQWmdmB4wdA/5frYW1Iw73FVqA
         jHRvDlaAwL0LEXUSRR/w13aF00GzML77rL6wjMU7RzEPU9WzpaBHX+w7AcwCAvIOYhqC
         L5fe7uXlCxC4yxrNYbec4dhXL06KKYcEO++El1XUICLODQos1RMkceyuRNb8dB05Mc7P
         kGTrUlBM200YIA36cPHrg6qeH4BkE317gkuKVSZgVdgF0EZLzJDj5Fod080rXsy19/oX
         LJCMKzYeImbaYGuNnUKee2Ffwh6D2g0X+zWj2oDyI3xjGSWCEGE2zFmK9/YtMZ6Mhzge
         oIIw==
X-Gm-Message-State: AO0yUKVkBuNtx4CnRTl5DVZvxV0YltcM6GIAXIp94H6n9si0lSmueyVw
	ased00PXoLgpGFKRydMA/A0LlM/EHEXQrrs1P7Gcfk8h
X-Google-Smtp-Source: AK7set/i7tDNf3b/prKKyZcYfixSmBCcTnSAW2MrM5NCGX8XxjucnyjmgDvBtpRT6iIh+6xr14UddH9y0dHhup/18s0=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr758545pjb.92.1676564542795; Thu, 16 Feb
 2023 08:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de> <20230213202927.28992-8-farosas@suse.de>
In-Reply-To: <20230213202927.28992-8-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:22:11 +0000
Message-ID: <CAFEAcA8CDr110xtvThtoC3+Rhr1hDLjShxBCxca1oC0mdNvYiQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 07/28] target/arm: Move define_debug_regs() to cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NTW2OEAyOXAu

On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>
> The debug_helper.c file will move into a tcg-specific directory, so
> take the cpregs code out of it. That code needs to be present in KVM
> builds as well.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/cpregs.c       | 473 ++++++++++++++++++++++++++++++++++++++
>  target/arm/debug_helper.c | 459 ------------------------------------
>  target/arm/internals.h    |   9 -
>  3 files changed, 473 insertions(+), 468 deletions(-)

I definitely think this is not an improvement. Currently we
have a file debug_helper.c with a reasonably well defined
purpose (debug related cpregs and code). This patch moves
half of that into the already massively too large cpregs.c,
thus undoing the cleanup we did by separating out the debug
register code from the huge pile of code in helper.c.

thanks
-- PMM
