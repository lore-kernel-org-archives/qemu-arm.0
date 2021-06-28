Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4074025lfg;
        Mon, 28 Jun 2021 07:55:22 -0700 (PDT)
X-Received: by 2002:a17:906:2306:: with SMTP id l6mr24377321eja.362.1624892122690;
        Mon, 28 Jun 2021 07:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624892122; cv=none;
        d=google.com; s=arc-20160816;
        b=UWO8QwWJZOBvNDIIDc4N6AUXDDoq9E30JkXxXTqhaYMfZA8jCcoy5zpGwARo/CPGcZ
         bKriuQ4ROuzabeYCIuHi02aG4buUT19VSRkR4EYUSgLmMBDF606sH6DDPcA+M+S2nJja
         kzyF8trX0mQ3Tao4D6MnpdTuCy1WbtMVVsWlzoCZhKodxoeM24aODpt4YgEFdLtareFV
         SZBH9y+3ICqcPE/ZD3jUSMIhdL1b69CcNGdF5jCGyipLhonYhd6KtptIeoYDhPwNtYpM
         UfAYXBj//jlO4lIM0BlcZw7qH17sU0QIo7oZHDOzrqJ439YP4gLFPqcDc72/mbxpHMip
         hyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wkX9Ewr6D7LGQNycIsMkpMHL+QSDTjfmW4WxWsgv3t4=;
        b=i104ZO16O31wxVJPnrUVnIqTkudH4+nN8dlTXlhMv9VaHF58SmjtVa3LESKedAP7G2
         V/HghdgndYwoKj5rjTVDROnjKO9cnBNUbjgOhXQNyEn8pZzq028tFGpRtnQV4RklPglQ
         lkqpCH1cz8AM5D1I57QWNj402WCh/5ABLMhDCxL0sc0E7wLHlDWacuM2pRDCVGLFr1ml
         Iv8q58R9oBhAIk2dxWzxc/bmNHt4R6saskEWlTSzHbqAcpRZ9vpKRtjfc9Ys7Lg7xKT6
         HoBUTZH02dauYGYxDJyehaSqNshawgfBfqpTqlP8kRnAmCtD44EvG0xrjzPyW16PmGwC
         22cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NJYl1IRx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hw8sor6133637ejc.25.2021.06.28.07.55.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jun 2021 07:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NJYl1IRx;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wkX9Ewr6D7LGQNycIsMkpMHL+QSDTjfmW4WxWsgv3t4=;
        b=NJYl1IRxm4lGcRthirtBQKFyR3STvIjLM3LzDXnj8FdY2v0OvrUZiggzfiIyW3nWzb
         K7LAzdU3psS+6PsZIJKUORicT8jN3g0JQ1+UDX6txUAbKFj6C2enySMA99SALL6z3zv1
         W8V8wCyf6s+Q1gTKnVSfXKUrhWuLny1fc19WIml+fg8WhRj6FWTqCA4kIrtgOEUVn7my
         v/HicdnUCvhJfcnezR+Jv8mlfFCuEUKfMKwAojNvlP7ZlcmL/W+2M4FP9HhTmQfOuqRI
         X6NqH7YhBo5wZGUcEpToo3h0dJ6m/iVT5l8CEawtizM2N9zCoxoR8C5u4ZtJxGjclr6/
         u91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wkX9Ewr6D7LGQNycIsMkpMHL+QSDTjfmW4WxWsgv3t4=;
        b=CiGQWQpVc/EBSBDrUezluogh69aaxOFBwIP1sUypcbMz9phywkWN6N78YB9K+fjGpO
         TIdvc8FXX1JVcA/JR/Rk+00JXNZnNwsa7Gi6Vy8ihPNylAGKGPKA8i3n097VKLGt1EgE
         H+2m2upmcLnSOEgVI0bNoUwo9iT3nWrq5Jw49FImPh7pCMsp6jh5HzyLaaVa7F6eNZ1Y
         rqI+DzKKGVGd2TOOJqB7bqYZUsanKE66nacmPVFjs9gQPv50e5oYAMRHsTWk1JNAu+Z4
         8NVdnOwmXyVlbOTCAc1wNPqu7WGxtdO4SoL1pCGFLYc+kVyRD5QIVIWCQBIiDr8YcCeS
         ZwqQ==
X-Gm-Message-State: AOAM5336BrWMVocuQf7wGN8K/QYJAuh6eaPZgqvAyVj/yTCfFPl00dCi
	1VB8ZI3W83XWedte479NmgWOKD/25ueVWdkuQJ0vlxMCN43b8T95
X-Google-Smtp-Source: ABdhPJwOoG1Dnrn/K4HlxDXLLsfjvZJjuy36cnZcDxgrD0H3SpA10cllHWPIlP8xjuC13taxeDrviNMwDThYabnepDg=
X-Received: by 2002:a17:907:a064:: with SMTP id ia4mr24927342ejc.482.1624892122426;
 Mon, 28 Jun 2021 07:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:54:45 +0100
Message-ID: <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Joe Komlodi <joe.komlodi@xilinx.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: HN8YSwFYX7Jk

On Sat, 26 Jun 2021 at 00:04, Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> Hi all,
>
> This fixes an assertion that occurs when executing FRSQRTE, FRECPE, or FRECPX
> on a signaling NaN when the CPU has default NaN mode enabled.
>
> When attempting to silence the NaN, we hit an assertion that ensures that the
> CPU FPU status does not have default_nan_mode set.
>
> To avoid this, we check if default_nan_mode is set before trying to silence the
> NaN.
> What happens then is the instruction sets any flags because of the signaling
> NaN, then gets the default NaN value due to default_nan_mode being set.

Richard, Alex: what is the assertion trying to achieve ? It doesn't
seem entirely obvious to me that because we're in default-NaN mode
(which is a property of the *output* of FPU insns) that we should
blow up on calling float*_silence_nan() (which is typically an action
performed on the *input* of FPU insns).

This used to work fine, because we would have seen the assertions
when we tested the implementation of all these Arm insns...

If we do want to keep the assertion, somebody should audit the
other frontends that use float*_silence_nan() (i386, m68k, s390x)
to see if they also need updating.

thanks
-- PMM
