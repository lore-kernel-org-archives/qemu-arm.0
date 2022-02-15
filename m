Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp617114lfl;
        Tue, 15 Feb 2022 14:03:23 -0800 (PST)
X-Received: by 2002:a1c:7311:0:b0:37c:3ceb:71c3 with SMTP id d17-20020a1c7311000000b0037c3ceb71c3mr4670075wmb.154.1644962603145;
        Tue, 15 Feb 2022 14:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644962603; cv=none;
        d=google.com; s=arc-20160816;
        b=zrXLquQd35+m3zMe4peiFbaQilN4K2sE4fsAcK2LpvES7qXD0YkFUwMgkiPNzXqhJW
         ImW01npTudwf1meDEmGIJbCnfS+Uxo8ya5IupyzuUbXgyl5W81GlCNvFcOPEqlvQKxFI
         VdEBHGhn9NPhxuXLPqaf4KcB6PT5tTzYVc6/uwadVxyMD3JZVMxENolpKyBdnwapLV3f
         WVX5nOht2q4llqrFIIyQGbClmUlzY13LxLvZVhmtIB8iZiIMVvWW4pCbhSVHIHM+wREo
         DhdY920L8G5UVnxqkle79QQlpWit+harPMCr1DrKLqOPSplGqvfCWkfdJyhto0WRoA2j
         gfDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lez2I1+JDs0T5dxCUfNGxGo5ZQgrc54gk+UNfLAs7RU=;
        b=q8BkEk5HSZg4k+Z1m54FtZEwdVasTvKY5KM1SrXTKNgjBVC8zgzYaqNWgSS3tADRfZ
         ozLUDK9UQtRdsCAj+RbyZZ6aLhLPEcGBBPM936eiCTScFiKHJNElsoJD5bdhHKffS1us
         Y/WGjoiNmLUSz7xvdpXXnvoKfsS3G3lC82oMPHrz5AzMW/Rs3xQIZdQtex608NFaXmbb
         BaFJJTjmhjSVfLqN9tBVDb1rhOQPALdOs0W7qD6cCTAGMM5Zc8nmDT88KYtSLkVlVaxQ
         T7+4xNZgNKbPsDha0k4YCmnts5mmh5VhHTOI9XNDrMXhwW3yetHJAnGT08pd3ofzJvdw
         DMQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyYyPsKQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a15sor3866109wri.69.2022.02.15.14.03.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 14:03:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyYyPsKQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lez2I1+JDs0T5dxCUfNGxGo5ZQgrc54gk+UNfLAs7RU=;
        b=kyYyPsKQhxIlwSMo7E3QLFXYtN7UIydJXwtIawkwj69JzkHIu2GuZ7aQ5pP0wcrrzR
         9hGgfaD3Ul5UoDc8Qf/xs74KFT4ilasfxYokluO7E/zJxi1Vp/P6DXJ9TdlRvDFJ+zZF
         ZVugqoFnwGrK3h7ULpTtnfpzBetb09AmWo4K9Mak1LM0MOBb2jbd0L4vcnPKFsBBu6BT
         NemaWUzvS1ejErPjawBgQsGxoEeECUV2AYyDTHRk4F/vOuDBnHbzuNFOC5BrGqFhnT45
         7sKBHJ/V2G0coU6yVPMdD6bdxkVLtq4cMtfIooTSbFy3Vj86DtWXUbMFNIMwr/cRE6Xk
         rINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lez2I1+JDs0T5dxCUfNGxGo5ZQgrc54gk+UNfLAs7RU=;
        b=c8ZvSuIx2zY0Of0nutpc07GrmoNJiwjI89wiS1iWDbAtODksx8Zn1UqBAdtmTJMI4g
         8uVBzwwM9gn2dKoY50wZVBAG0FHYz0XrL9R+sjIoyfcFVMMKB2tk0M8jziqevJpFGKE/
         CcY3+ci8T2O7qfz+clD1iuz/BiprBULd1tlJraLFSYgUsDCj1tj25KsjAplvxhkZydjD
         7S2D0Lc1yvYc4txuTjHywsFx97b4QUyy2tzE6qZNMSBOfdvHIrkbd5qewmr2VU2lE/48
         gjUq+Z2WwlC/Y/L68MpT/UrF3ZhEQVOvn2MJvJKfqmr0OhIKRGg1VgM3p6zDqJuNcpyC
         WF+w==
X-Gm-Message-State: AOAM531I3aFJQH40e6Qy6TzGauHuJdxIYluTXQrpuy83tyi7t4zdRZSA
	lliiXlxGLyxGT6HkU3Lk4W6FL7wJwweJXabWv9V598lf
X-Google-Smtp-Source: ABdhPJx2FdLfFrxfC2xqYXI6JFhXm7f907NW8QzHFfSxUAEoYzIpS4Q0I4OyJEU1yRgtMsg4r9iJl6v5r58cDEdjT8k=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr747159wrs.521.1644962602936;
 Tue, 15 Feb 2022 14:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-9-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:03:11 +0000
Message-ID: <CAFEAcA-kK1s64RRuicRir6rfLX_39W7yt+VosvV4eYh-uw6FfA@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: zhZsZClSkq4L

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The original A.a revision of the AArch64 ARM required that we
> force-extend the addresses in these registers from 49 bits.
> This language has been loosened via a combination of IMPLEMENTATION
> DEFINED and CONSTRAINTED UNPREDICTABLE to allow consideration of
> the entire aligned address.
>
> This means that we do not have to consider whether or not FEAT_LVA
> is enabled, and decide from which bit an address might need to be
> extended.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
