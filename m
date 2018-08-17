Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp219657wrd;
        Fri, 17 Aug 2018 06:37:57 -0700 (PDT)
X-Received: by 2002:aca:494b:: with SMTP id w72-v6mr2620062oia.293.1534513077329;
        Fri, 17 Aug 2018 06:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534513077; cv=none;
        d=google.com; s=arc-20160816;
        b=YHQC2oyp3b+Ghy0cy2GEb/TO2qiam/CDLYit+OJhV74/ec4kUmg1TuJg+aJL+VaIZQ
         rBKPwzrhz3hoNHTsrXPHkiMugOrYbYoHs/nd+f4XSt+1tHXhs8+qAsroZUWGPNQDZFas
         yYZAUedTdMpX3y0OAtIoV/9ptThtgD1ogKeoNl0mCvXtDO/XGF+1ay8YkH+KGrkqyKeu
         oEVt8QnFXM4w9cRm2b4yQJWFqEjGQG4kvLNLli56yvuE5tyukTwfYYnKqvGJqkz2u1F9
         jDOpeVRuWXwGYnWHgj1tUuj5Ts/WZFT0y6VBmHCPpzEkGRejV/2MTQepVGBDEXhJWkgO
         oFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=6nYJv5CklofRQIJmOJFvcuTKDaLH2cwAUKr/H45B7Io=;
        b=b1bbRAvGD51Gl2gTdcEJCogspeybl0GW2AAuQbIM9Mg4hioV8JzhfrIri9pEwVbZDl
         AqQMqaIYwMxni9CbuMnG2E9lTnfWOKEc4ZKmjxrbfm7c0DF4np+VFWLRpQWtsTVoJbsj
         vcB3qLxaveYnY4QrQk1dBE/hWfXBH6Cq42s9YEPdvrtvBK7AJajS50g5Y8IwXjHVNXDD
         1/MlIQDuKFWgSIAB3DYZZbC8Xyur5vJ3eogeaGp+SxJ2fZgcwwdgCdFvC1OynRQKPpq0
         dBaY+12OHrnHUe+ykTycldukEaXMPiTJYFPxdVnfbXsP1TPvTvGVioQd8t32vrlhDhXy
         ghNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TLd1/d8k";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n84-v6sor1197338oif.169.2018.08.17.06.37.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Aug 2018 06:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TLd1/d8k";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6nYJv5CklofRQIJmOJFvcuTKDaLH2cwAUKr/H45B7Io=;
        b=TLd1/d8k4uAIhhx1s8iHt5xRoTO9Pik4RVOrWvaDDX4zdsw/TAxnRhvZW4Y2PDJyHM
         DjQct2CTTyPBFZNWuj84/YWPauPqk0Xo8iOoXsqLr9EpLwTJQwWdtx6OQYL9kCBUsZcZ
         OQDxlmAmSc6r+RKNcKsCysZ13vytlnbCqLUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=6nYJv5CklofRQIJmOJFvcuTKDaLH2cwAUKr/H45B7Io=;
        b=Q+xq12t91N5HbbQQOjGQK96oWLRe+eREcvkiqaaTpLaKCvFBlZ8SpIlFVcJLkHqhiK
         BVkoJ2pMZs6XV0/onlBWAkteHU3RxDgl22/jGvCKv6sUhg/7wLJtsgNRdTWWaDbt9uo4
         lMrLLwrE00XxAauB2d9iiGGzw7rsRV85miHwHoe4c8aMc6L3sCI+NQ6Ko4P0GU0iR0ar
         or5I467TuTHTCQT4b8PypTuQqMENsxkTbg7UM6SC2kCQm/y6nRZnaVTd0I42iNh2+Dsq
         jJiiXB52ToKmLcNKhCpiUfkU2m62KRdiCdxIbCRA/Hk2Fa3clHeNdUAabKQ5zOuZvtlb
         U8yA==
X-Gm-Message-State: AOUpUlH4BVZAjB2KMpNp9P5dvcmUSrwAbhLFQuiS8pyru217usUro9aY
	Rs9h6tEm08O8bVZj5KEwEwsCrC88AVCfw36dGBGIIPz3
X-Google-Smtp-Source: AA+uWPwFmd7h0cTn9kMPPT0sWe13qDkHkaJO/VwCLTRM5lkTRRWz9sp61OGi4JGHEIzckin9XIflO2oxFLcO4MsaI74=
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr2571871oif.23.1534513076963;
 Fri, 17 Aug 2018 06:37:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 17 Aug 2018 06:37:36
 -0700 (PDT)
In-Reply-To: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org> <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Aug 2018 14:37:36 +0100
Message-ID: <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: EYOl42s0pO0q

On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware, for supporting
> firmware and OS development for pysical Aarch64 machines.
>
> This patch introduces new machine type 'Enterprise' with main features:
>  - Based on 'virt' machine type.
>  - Re-designed memory map.
>  - EL2 and EL3 are enabled by default.
>  - GIC version 3 by default.
>  - AHCI controller attached to system bus, and then CDROM and hard disc
>    can be added to it.
>  - EHCI controller attached to system bus, with USB mouse and key board
>    installed by default.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>  - No virtio functions enabled, since this is to emulate real hardware.
>  - No paravirtualized fw_cfg device either.
>
> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
> Changes since v1:
>  - rebase on v3.0.0-rc0
>  - introduce another auxillary patch as 1/2, so this is 2/2
>  - rename 'sbsa' to 'enterprise'
>  - remove paravirualized fw_cfg
>  - set gic_vertion to 3 instead of 2
>  - edit commit message to describe purpose of this platform

Hi; there's been a lot of discussion on this thread. I'm going
to assume that you don't need any further review commentary for
the moment, and will wait for a v3. If there are any specific
questions you want guidance on to produce that v3, let me know.

thanks
-- PMM
