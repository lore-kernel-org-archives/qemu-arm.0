Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4166032lfa;
        Tue, 27 Oct 2020 13:44:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:111:: with SMTP id t17mr3620351ilm.79.1603831470955;
        Tue, 27 Oct 2020 13:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603831470; cv=none;
        d=google.com; s=arc-20160816;
        b=ILNETI5a8iSH7W0pjZYV/93rRl+HpAc8gBDbd7B2owLTRBvrP0mhgCd2/9aO7+8zWH
         rGDsBP2iNZmk66XrQX4UE8az7SSelUxbD350NavwDF4m8yje+7I4Z7XWLpe/uY74+EKF
         rpZU55Z8CT82TZRgT4Rq1eBoklyk4Vbbl9toTh1oaTrdDFtrETRml18KMu7AKzaOlkoR
         HkxpbcrT85zzj7NHNkHoFiqUsZsygwflvj8n9y0MmE8T17u4Z2W0tb7L41W+WaA/S4dj
         xLcelSr0JRF8OlHwDLgwzGXzR2Nk12jw/KM9RX+7AfFP1yzSgC8XUQD0/Z1pbg5coatS
         6f0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=geKCiEuVs4Vr5RFHereyk+gtB55kHNUfsY0dTfRlKTU=;
        b=PO2xzqTUhyUaEFvowmHpuBYpP2XZlYNqe04L0g2Hv9xUI2zHOS4N2K+ZX1GeVKwRBw
         JqgtBh0naIKH0nq/q/9O/1sLuETVrNXRVCue1V0vjA5og+E4DfduLQDl11C5drEEvLtz
         Kq2CV7ud63txWCGds2m3r9BH4t88AYlZGA5VXL2R6JNw2HT/1jcVMan1yVWgIayik45c
         5ofKotZMYCY+45cJhEbLN6mNmy3UQBPDX5VIu6XLGH//51TOTn0eWxeBfIda2db/DQoh
         xxLotR5BVKhTkNGMrjGTsYD5jERAOpk2h4u2K8l/V2D5oymBXmpDGyN38aUd8hBuulei
         ZXoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="IWGM/oVb";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l69sor1892670ill.44.2020.10.27.13.44.30
        (Google Transport Security);
        Tue, 27 Oct 2020 13:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="IWGM/oVb";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=geKCiEuVs4Vr5RFHereyk+gtB55kHNUfsY0dTfRlKTU=;
        b=IWGM/oVbSNgJ4SPQ0iYUo96HuJjPDiDezcjt1bWKy01J9BJHWEo8VkwYyxAOOQ+egt
         PUWYxcoS/b+n9GJtEhRw2yZqBWPnKITadQGwAAhCo0U3pr2jH/K1lT0HJ2VklAjQ1Oh5
         DJchF2rTHZJrzqxcLZLGkW+CKfY7i6BR4LQylSGy4nn7cAfCU+8KQG/TAt1Oj/ViWl0d
         R9S8+ujgqDJNyMjHFLFlUq/lMQyFX1O+6j7D6o1hPcTI9mRgMs+Y0P0PdNwtzUxFq6C6
         3NTA1RKzC8d2qZGwkC31P9Nu7J9fm6gGQUeTgCZvn+9QB+h2sWTMHCMs7fmrt7mjD9AN
         3Ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=geKCiEuVs4Vr5RFHereyk+gtB55kHNUfsY0dTfRlKTU=;
        b=SP9NhzhPpGp1OywfNDmh0SKk56m/EDYaHmN7uT8wvtrY4akHzLdruKORCFr4PSmkMQ
         xEaoa51FvwcDpd5zC3erSN01zJ5UZTE4+GDffy07a9lTfXV/oHTT/UPvFiuettlFsyUx
         WVxRtzgwIor9FnzpWMjRiRnVF4+2gWWTyqCfpRmRN37H1k324WQBoAHiwv0NpIK3mCI8
         W7t5BUVJV5e6V/zbdRomxecjNvn6/AEMM/SFiVo67XdSgJcnjhZmq/wiMI+nKhfl3vHz
         8R8AE/D46Fx2THdvp/Kx4kolXVy2CRwyJaLU0QCeiicet6UKw5kzEb8F/kFMKPPe63mb
         Vk4g==
X-Gm-Message-State: AOAM531q+ca8QzX4i+gCGUMROk/gAQqQxnWnq4vAa5ogsu4eTP74xm5l
	8GwLfa0vLQEas8/yvrDHkR7BWL9ZhasCJ8za8mE=
X-Google-Smtp-Source: ABdhPJwnqLZsLikrq+Hmvm9NLslm4HdoWMQ4BnKfLW2n0tA+GJETTLLbMb1eCw5FGI0UgjDSbbcVpx/TWZors3eW29M=
X-Received: by 2002:a05:6e02:c:: with SMTP id h12mr3585818ilr.177.1603831470526;
 Tue, 27 Oct 2020 13:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201026212853.92880-1-keithp@keithp.com> <20201026212853.92880-2-keithp@keithp.com>
In-Reply-To: <20201026212853.92880-2-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 27 Oct 2020 13:32:40 -0700
Message-ID: <CAKmqyKPFAz=UhDAYC7frbeNgPOUYST_wcKO5u_5hugwRRZanMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared directories
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ySgos8n6085j

On Mon, Oct 26, 2020 at 2:34 PM Keith Packard via <qemu-devel@nongnu.org> wrote:
>
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
>
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>
> The build system was modified to reflect this change, but the contents
> of the two files are unchanged.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  hw/semihosting/meson.build                            | 2 ++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 2 ++
>  linux-user/{arm => }/semihost.c                       | 0
>  target/arm/meson.build                                | 2 --
>  6 files changed, 4 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)
>
> diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
> similarity index 100%
> rename from target/arm/arm-semi.c
> rename to hw/semihosting/common-semi.c
> diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
> index f40ac574c4..fbd2841e59 100644
> --- a/hw/semihosting/meson.build
> +++ b/hw/semihosting/meson.build
> @@ -2,3 +2,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
>    'config.c',
>    'console.c',
>  ))
> +
> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
> diff --git a/linux-user/arm/meson.build b/linux-user/arm/meson.build
> index 432984b58e..5a93c925cf 100644
> --- a/linux-user/arm/meson.build
> +++ b/linux-user/arm/meson.build
> @@ -1,6 +1,3 @@
> -linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
> -linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
> -
>  subdir('nwfpe')
>
>  syscall_nr_generators += {
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index 2b94e4ba24..2fdd12cee5 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -17,6 +17,8 @@ linux_user_ss.add(rt)
>  linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
>  linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
>
> +linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
> +linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
>
>  syscall_nr_generators = {}
>
> diff --git a/linux-user/arm/semihost.c b/linux-user/semihost.c
> similarity index 100%
> rename from linux-user/arm/semihost.c
> rename to linux-user/semihost.c
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..15b936c101 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -32,8 +32,6 @@ arm_ss.add(files(
>  ))
>  arm_ss.add(zlib)
>
> -arm_ss.add(when: 'CONFIG_TCG', if_true: files('arm-semi.c'))
> -
>  arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
>
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> --
> 2.28.0
>
>
