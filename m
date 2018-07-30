Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4063783wru;
        Mon, 30 Jul 2018 11:07:47 -0700 (PDT)
X-Received: by 2002:aca:b585:: with SMTP id e127-v6mr20078558oif.119.1532974067393;
        Mon, 30 Jul 2018 11:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532974067; cv=none;
        d=google.com; s=arc-20160816;
        b=AIMMsy8NGbk3hrvL3yZcjYdJuHQHr4OetRhZip1xx/+wnmJGJeSYALMff7NgDgV35s
         OCWoGocNo0nMup21KzGjs2MYndF0RXKsQOHqWd3dog7C/Mweoxt+iluW4+pXeiOePLIu
         GvSd8yitn+XejVP2PZvdPWYYvhCAHcxF+fVCnGA+D52M/lxckafgcr/ONhUUlJjH9OjA
         tEWhL9fQn9ZNJTYrY3LoDORbQXwygG/cSCbodKwwcv+ZoOo82nx/XR7Gz53q18OWTJL8
         4iSbgtojEQ0xwANCv9/GuzHYYOSTmFUvGb7VAR839gm2H9qQ2423wQCCi1T2z/00/A44
         xphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=rmP0fh0n5XDx1CHAQCCvfvUWE8X02bL9g2IBu36EF2o=;
        b=mU0Z/Rcm+gL7qj810oqrv7/JXQMqukR5/SiPkt8RnJj7NZFUQ5ji71872MKMoDiZD1
         WWPO7fPpcF0VOzA4uUbH3uITPuZftEMl0Sz0CNUtsIqALZBRyKoHC0/1BtBhcIECU69S
         jwRUVi/6GLBZZLz3wQ0cIFaY/kM5pZxDHfOQPfyInRbcwv8tGRvCYcMmoxojtqlIrcnN
         B2fL8IFwFn8IrX2ZjBSKCqWHI46haPKBlAliJOnVGmqjg2D2fCN1L9pBSVHS9j2Nv4aI
         rd87UKPlbWnguPWePowCsADpznB9lbbFfyyIA5XxzQPIsT6/c6smg0BlHssD6zvXO/5V
         dQoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XSf1/Ngs";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c10-v6sor6125390oia.265.2018.07.30.11.07.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jul 2018 11:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XSf1/Ngs";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=rmP0fh0n5XDx1CHAQCCvfvUWE8X02bL9g2IBu36EF2o=;
        b=XSf1/NgsdZHKcd+eDDKTySDn9nSDcJNramzegO6OuDPRQyaAOr4gRNatCX6jCkwV2z
         R6702Bw/SJqyGPokPPs+bsFaL8y7cBQent4SMVDfaIB9k9qFCv/b9Lm6dc7BB5wb0kOF
         cekixmUxpdSoLyhbFJZ/Q9PK3nTRfWJv9Kits=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=rmP0fh0n5XDx1CHAQCCvfvUWE8X02bL9g2IBu36EF2o=;
        b=l+7/jcLoZtMO3ovwFrlLX6PpZSsGxV/txGFNvN9oVKDEN23d3gAfIsk+glgWjjiMhP
         t5DsyQ+Hy4igz4uozpId7/UY44IqAR4WyunnPp/mKdz9pq7UF6wr18RgK0qpnkgmsk78
         AX2CmWx0dFCOL0zq/VO34p51dSErq1q5xOm/p8xM+Hk+356SMmhJySBemKeW6UYkUZ7x
         69RbDyaMxBVs7aNdqJhQ3PwkiRzFAhX2c2Nuuo/VGjPeyzAnSNw8vk/O2JithKtR2FL7
         swZeCZqYjhXCanQcBQC7aSjBPXhLEYphDpVHSIVzMIgnDeOQ3HRK1Rl3RHnylpjUbLbW
         k3AA==
X-Gm-Message-State: AOUpUlFcNZUUS3QS+U6hunwDdNEsbGDFGHPSfOpMBQh3nHxLNA5Q0seR
	h+ebFHSh77wtzZp/lnAVHkNt1OLwLYBl9M49IoPTrMGA
X-Google-Smtp-Source: AAOMgpcDU0D0axQEjlceDnOEqxjTrBn3iH+zE5erjBqqT+K5B3QXrE0Qc2WbFLLUtU1EF/JOveNyklKMlP3TNEZHUNw=
X-Received: by 2002:aca:f5d1:: with SMTP id t200-v6mr19476918oih.12.1532974067024;
 Mon, 30 Jul 2018 11:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 11:07:26
 -0700 (PDT)
In-Reply-To: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 19:07:26 +0100
Message-ID: <CAFEAcA-v+tOzub5V1_3stzNYX9M7hHX0c__jhSWM-q14QdtoTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/arm: check fw_cfg return value before using it
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Ty6xT6khnVWH

On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> The fw_cfg value returned from fw_cfg_find() may be NULL, so check it
> before using.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/boot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e09201c..43b217f 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -930,6 +930,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>      hwaddr entry;
>      static const ARMInsnFixup *primary_loader;
>      AddressSpace *as = arm_boot_address_space(cpu, info);
> +    FWCfgState *fw_cfg;
>
>      /* CPU objects (unlike devices) are not automatically reset on system
>       * reset, so we must always register a handler to do so. If we're
> @@ -960,11 +961,10 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>              info->dtb_start = info->loader_start;
>          }
>
> -        if (info->kernel_filename) {
> -            FWCfgState *fw_cfg;
> +        fw_cfg = fw_cfg_find();
> +        if (info->kernel_filename && fw_cfg) {
>              bool try_decompressing_kernel;

This can only happen if:
 * the user provided a firmware blob
 * the user provided a -kernel option
 * the board does not have a fw_cfg so we can't pass the kernel to
   the firmware blob
right?

I think in this situation we should exit with a helpful error
message to the user (telling them that this board model does
not support using the -kernel option when a guest firmware image
is being booted), rather than silently ignoring the option.

thanks
-- PMM
