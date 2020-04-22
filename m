Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp610338lfm;
        Wed, 22 Apr 2020 06:05:56 -0700 (PDT)
X-Received: by 2002:a9d:6295:: with SMTP id x21mr15245382otk.291.1587560756071;
        Wed, 22 Apr 2020 06:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587560756; cv=none;
        d=google.com; s=arc-20160816;
        b=LJjmGCvTqSXsbLPY0w0JZOLsGXUFrlYenaHNTTGckFudzo/FNq+1V9stWOwo6YysK1
         VtQGTB0YuLQvP/XXWj87qFTJgH9aMQI7EDzZeR4HtQCM3fRyrJkbbzoBKiw17VNq2p+p
         JjfUxasRyjJP3E93HeyDPUcF9HEirh27H2qOEQI5BQixSA5lDHzhV3ly4bpAx4C9QbXO
         myXI4dnEHE9zr4xTUAF+/5dtRtVqH53E+vBMDRQunp/o+FdpaApS12s60/Q3Jmxt5Yjp
         BuqmQGJ+gA+s4Rs1dH3o5Y+sEdOuTZ4aQCwI3FL8OIvvfWZvKUQkLsuTmHdhqmr15SIy
         gGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i1R+UL3czKmE85NT+9SniKL1KoeLdWjkivQZRFm6sOo=;
        b=KFjrVB8URDUIHuNCHhelYMEj7QAjWoo0bQsYp+XXfcF29CgaeY+YqIMAnB0sv62KsF
         ZA6+ATlpVACZ7yOCFDrOUlWNx9x6wVtH4qMH9TDr2t+jJLRwpwa4kSsVCGIfx5oFLSgI
         2nQU8Ln9dujjVlXBhDJCJMgV5WkMLlxz0fGahENiLwb9U3wr+jvJXFN1l1NkmLNT5KjD
         p1+A+XmIPoZbYyGpctdCSworY3tkpQrdQomCpsbOocx8DJ9/ypLoRi/PAez7634Xpr+k
         ZTCklMM1T5jeOhuFcpcm/Tb8oZDNZT9IGM5JalgN7NTKR21+snd3fHZXImtDaoD2S9ud
         b2UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUPY9SCb;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <laurent.desnogues@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f9sor4347140otq.142.2020.04.22.06.05.55
        (Google Transport Security);
        Wed, 22 Apr 2020 06:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GUPY9SCb;
       spf=pass (google.com: domain of laurent.desnogues@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=laurent.desnogues@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i1R+UL3czKmE85NT+9SniKL1KoeLdWjkivQZRFm6sOo=;
        b=GUPY9SCbsSCctyV/ntggVRN98jUIWxhEZIpNharXv7yWn0qmyxHzTZNQQhUfBr/fql
         Z5yCNLZ+nTX6ZD73x55KRykyDYhG334SOdMuQnSJZ4BcxN3IHaY0ywd2y+3kDaEIUSVk
         lDlMKg5adqGce9j+K2M1ab8baoH9hAfshQeHcTnDHsYpAYH1E5NxINx7Y4eNYQb1J8He
         4lpTQqwfsXWGVWvwRQrGpR8bc5xO3p5QevT63YpSmVr/LIP2RFFW/OodHojwzKgNJLCo
         EdSTnWGbXgWKT2HJkxlBWPKE6tZTZfvGsncbLtz1HLWfIxO6KtwlRCZi3FDn/atAQedx
         BbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1R+UL3czKmE85NT+9SniKL1KoeLdWjkivQZRFm6sOo=;
        b=lPEOkc9GCXn+cpmpX3y6nKltM2KAwZCRBODQ0ZYdiuE5+YT2GC6/ZAgDceQeR6qf8s
         wY9skIku7Ba3GL0VPQpDTgWry7xIddzp9xM9rx0ODbez+fbyDCfe5MMRj56hs2NCHdPu
         K1gmEFHZZdlZwmMihBo92iK4Tk3tX4UFblzvC3SY3hvl8kPOxnviVZMbj0WClDyLB6Xi
         v/typX036AceJJH0sJpUBvTasu5VSkv8YIpqx862ri2YDMQsBc0APzYep8TX1dKtr9Ny
         e98LW2O0mJcdz6YUmahud1D3/2Zqn7LQcU0PMgPxk1y8zeRPkOwmoaG2C34fxk7AgS9o
         vgtQ==
X-Gm-Message-State: AGi0PubeT2o5lzM3paZPKhnOmGfI7h0lMyoqvrd1Bv6bTBaQVLjy7zUI
	yCjch/OMwNtcTl0t4aASmKWFMtYliVV/KTceIn5LAiSSIJo=
X-Google-Smtp-Source: APiQypKHYnk1YsfBHdZRn8fb9sh/TsUdVI7nLEkOgT3xVGSqp43WP92Y3pUrP+MUhgEHszDOy6j//ogMCkXNCnFGupM=
X-Received: by 2002:a02:9a0d:: with SMTP id b13mr25009973jal.60.1587560755286;
 Wed, 22 Apr 2020 06:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200422124501.28015-1-peter.maydell@linaro.org>
In-Reply-To: <20200422124501.28015-1-peter.maydell@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 22 Apr 2020 15:05:55 +0200
Message-ID: <CABoDooNn+RdZ0FuSu5NfD5=rbPuftgxFA-CHS973EHB1z33FnQ@mail.gmail.com>
Subject: Re: [PATCH for-5.0?] target/arm: Fix ID_MMFR4 value on AArch64 'max' CPU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Q1fPo7/o7zt6

On Wed, Apr 22, 2020 at 2:45 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In commit 41a4bf1feab098da4cd the added code to set the CNP
> field in ID_MMFR4 for the AArch64 'max' CPU had a typo
> where it used the wrong variable name, resulting in ID_MMFR4
> fields AC2, XNX and LSM being wrong. Fix the typo.
>
> Fixes: 41a4bf1feab098da4cd
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Thanks,

Laurent

> ---
> maybe 5.0 just because it's so trivial. I dunno...
>
> There's also an error where we use the uint32_t u variable
> to update the 64-bit ID_AA64DFR0 register, but that's harmless
> because as it happens the top 32 bits of that register are
> all zeroes anyway, so we can just fix that in 5.1.
>
>  target/arm/cpu64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 62d36f9e8d3..95d0c8c101a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -705,7 +705,7 @@ static void aarch64_max_initfn(Object *obj)
>          u = cpu->isar.id_mmfr4;
>          u = FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
>          u = FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
> -        u = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
> +        u = FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
>          cpu->isar.id_mmfr4 = u;
>
>          u = cpu->isar.id_aa64dfr0;
> --
> 2.20.1
>
