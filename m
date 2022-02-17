Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp199152lfl;
        Thu, 17 Feb 2022 06:07:57 -0800 (PST)
X-Received: by 2002:a0d:d610:0:b0:2d1:ea5:4f6d with SMTP id y16-20020a0dd610000000b002d10ea54f6dmr2676088ywd.208.1645106877440;
        Thu, 17 Feb 2022 06:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645106877; cv=none;
        d=google.com; s=arc-20160816;
        b=BydN5ZOmWkEAt75HwmimQw3Tpf+Gx2SpYpvDjcALeBX540akPoxZZB5IOHdDlOen/G
         NBK+ZpYSHupVWl+nVOFdKH0l7g2aZJNBlMTBxxiyk2FIx315dPl374VOrXSzjgL2ncQh
         dJ35ir/cNKXuu/eP2RVqZfI1AwYAdfIYIciZMQ441kOq/BUp+e+6/p8YpTXp9Ipt6IQy
         BOXJYbGF7fWJP0T8qq79DtU/xk3EiNn0ACpQFfk6YFGFFr27Epm4i6IQhn9/Gt/MJ1yV
         GMBCEFxfk8uhk7BnoFaup6Sz/agyGNVa+Uc73wxBTwQ75qxE2a48ccWRMvjwkj5wyXih
         J9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tl48z0epbBl7QP/CjWHzxMWZfj2iC8QYDyAt9TKidpg=;
        b=Xz/qN1lwee+gYgmG1Rz2Ac68Vh/lN3oxgd2NMr9yBdN/dTXS9yBwlkvNI1yoNKtylQ
         S51U50mpxf79goJEY8GpD5R5FelxNzdGoHx7I2NMSxH5fhVaCCejaujjByagxeiLAizW
         3yfvTt9y6itjvNBw08h5b7znesWtjRFQ7I8vqb+vGjItcPsAjSxxEEOGWBlQOk9i/Gp9
         q+c7uEWm0YbZxM/wfS1nHDyLp0nBeVhpH26iU3uzkLcwB+T5kDqlO/UJI21zC/0aDGuI
         BR6rAIGuTqCEPpXgxC5FvnLW7c8ji40Z05LZ/d6NM/RHtNOsmd2YxT9qS4ejiZMpKrMF
         VUOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RcrM8KY5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t204sor2312303ywt.49.2022.02.17.06.07.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Feb 2022 06:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RcrM8KY5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tl48z0epbBl7QP/CjWHzxMWZfj2iC8QYDyAt9TKidpg=;
        b=RcrM8KY5XeIZVeQnG5cZJvdAXSZFu1AZn99kSF/KlwaH7zSOobU6XS5JfYB08TvtIw
         eqhr6ovGvItgfAbums2Ofxp5tyqPgFdjw3NG+81DCkuOH+px/g/2ZZAfOwB6r9Hw2rpq
         zxsiSFgCLP4+0s+Z4J7mRaC9f3gAmF68ynHgKezkEUXyPROL7akX51a3/M78W0TiAmdW
         prH0vzRiAYIDcwMZ+xQNftZ2BpGKaTCx9MtUOIlNIbEjVet5+m05knbzSs7NduoMsa9b
         QcAeb4/5ZltyV/2mWb00Rwqpe0PP5163vDNzFHYTJNAXZlA5HUm01Vys2jPAwA5fPry2
         8dCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tl48z0epbBl7QP/CjWHzxMWZfj2iC8QYDyAt9TKidpg=;
        b=CBOpsU/rAL1u646zgPS5BTkluwIjBWGLkv8bgOcJqzYns+40Do4C3yvw3zVovOCf4X
         7/RCrASvTImmzdqX9nh8PdNudnZBc4eg9EVdNqqHKT4i4n0h64ClgVnPRT9ZH8vJWQ7P
         hxt+SsapO1acvMK2qcdl2o4X+pT6LoEvxTYUb9ojWLSI6J3I9/kEihoKCbj+WqXtGI8f
         p2jCvbyFme7f2KCYlNIss9t+Q/i58BeF9VIaSGLnfCgAYTIe4ZvU2TJ01HenG3xd3Gmx
         5TZPBfudjrwzdMecEb00JOnGqB7sihUCqOK7E9LkKoBMPYT9b44wGDmKj/hdG990F9lK
         WhqA==
X-Gm-Message-State: AOAM533qA3eNWVpuxP6Q6kBuYpW6Ath2ToHhjFNj9XOBW5JggRD8ho1R
	KyFSkFzLLzPCEuVlFCRObMU7a5cJhYvboPJtSBExd5xd
X-Google-Smtp-Source: ABdhPJz0f2AtC2TnxNopoga8n91/h3VoYrukh0eMLSB3OfGH+ey8OAYSuN9s9xlIU7xLYXxqCVDcE3KCjDna1djHDUU=
X-Received: by 2002:a81:bb51:0:b0:2d6:997b:131c with SMTP id
 a17-20020a81bb51000000b002d6997b131cmr2193081ywl.64.1645106876042; Thu, 17
 Feb 2022 06:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Feb 2022 14:07:44 +0000
Message-ID: <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: z63YuZsDqgbS

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v2:
>   * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>   * Set TCR_EL1 more completely for user-only.
>   * Continue to bound tsz within aa64_va_parameters;
>     provide an out-of-bound indicator for raising AddressSize fault.
>   * Split IPS patch.
>   * Fix debug registers for LVA.
>   * Fix long-format fsc for LPA2.
>   * Fix TLBI page shift.
>   * Validate TLBI granule vs TCR granule.
>
> Not done:
>   * Validate translation levels which accept blocks.
>
> There is still no upstream kernel support for FEAT_LPA2,
> so that is essentially untested.

This series seems to break 'make check-acceptance':

 (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
(900.74 s)
 (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
Timeout reached\nOriginal status: ERROR\n{'name':
'02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
(900.71 s)

UEFI runs in the guest and seems to launch the kernel, but there's
no output from the kernel itself in the logfile. Last thing it
prints is:

EFI stub: Booting Linux Kernel...
EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services and installing virtual address map...
SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
(0x0000000000000008)
SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
(0x0000000000000008)

This ought to be followed by the usual kernel boot log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
etc but it isn't. Probably the kernel is crashing in early bootup
before it gets round to printing anything.

thanks
-- PMM
