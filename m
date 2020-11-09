Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4072480lfb;
        Mon, 9 Nov 2020 15:29:57 -0800 (PST)
X-Received: by 2002:a92:d60f:: with SMTP id w15mr12004950ilm.235.1604964597633;
        Mon, 09 Nov 2020 15:29:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604964597; cv=none;
        d=google.com; s=arc-20160816;
        b=Hkwk4cuVN1YzsQzmlvYFol6Mw8OnwDyCXfFfyYWX6RiXaLFjAM08hEm6dJko2XHzTC
         PCMxYguqQ8LuWXW8sUrVG3Pi74srJIWmJjPhY6FzT/umiGioMdR8Fkb8MxbxaH0ABVST
         pRrmfvJLdp+CGBGdXNV8Leyq2MbJRpEBwlUT9S2y8r9nVPJgfDg0vHunLZmLeTs5v6bM
         /rwY7E3Wp3z8NnB2yT9HyPGZ7Djj7DLmDEXU/6gLckvKJ3kHA4sXgPjrS/HnAO0xfMIU
         flre/dhkvMWB1+RZU/9XFdP3jROs53/e6X/iDUoh0B1qeg5T4x9v/eQVjmN77DvtICpH
         mBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9zhmEwHuPdfGZDmJDkilGO+uesabvVPYWIlifT6IxQw=;
        b=FCVLWvG66gPwf2fr+vYLaDhPCmWL5Br3ewnH4uSXQ6GTXOZeUpl18OXe/tvbrSuMMK
         QeZg6lFa7Pts9MRklCEYQa3XQ9ZoK+9qtY1HaWF38ziyy0lyMOuiADm3pekelfdnLuA8
         2E6dbtyV9p7+RtmFYLWBKp3U0Y+xeXDQ8V0JLC6bgVIqQDBh9AK7nmN7iJhAiEUeSUoj
         GI+k285re6I2yM/3+ZH8+ccCIdPxk1dFGBXXzp2+8IfCCtyOMFt+oGG/MRfN0wa7C/Zu
         Ni7Z9Eqsbp2I/c+ZXRxwqiFja2xJat3bHWwTutBVj+CavspqH4d1QmVL4ViCAYefW6cB
         L5+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDUJhjcb;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u190sor4893542ilc.37.2020.11.09.15.29.57
        (Google Transport Security);
        Mon, 09 Nov 2020 15:29:57 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PDUJhjcb;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zhmEwHuPdfGZDmJDkilGO+uesabvVPYWIlifT6IxQw=;
        b=PDUJhjcb10gs6MU7sTR3MUaHkX7Xc2HC8UWp0y+8ocZoE4XQFREbTMNfVzc/GU0/OG
         5SOJS2eo4VoIM63lEnHGpqHLhjGjv9uG/6xHOvXqSGuHyNSk8AiDrHxOrl2upOx9N612
         2+MGSTftdWVs93nFEFkoHjc/Lkahwn2c/Bcoge4jSlc577TghsaBjA6I+ihE7J2gcJjy
         0dju29dQ0GtGPe+AnS53v+whIjQx0moCD3aS5dIoReCfHoznaLegBrflQjYWtJ2xTgvP
         1+XtjJYbe3EP3vn2oyOaqEj3exgq9rnLKQ5M5tLWMqC4PVo4aNWfMrd0WIOXVqVYiKK+
         pFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zhmEwHuPdfGZDmJDkilGO+uesabvVPYWIlifT6IxQw=;
        b=r63Wa37DLXdMo4CCop5f7vRPrrO37A+HVllNEGZstAeLBcjRn0QMBwD2LUpUXIyVA/
         YHtAOjDQwuHSwiOWr+PBAJm2D9Va/a8Qwm92LFg4pB9HuL1PMQgOtvLWnjrFjmTvlrQX
         8yPxwyD84ENkkWGUmfeTzCwoABw3uuEj3FTrfxfy6dTdGWLWIK0PttYJNtRs3PPYrrSa
         P/aulb3hfBLOtEOyG/mi5pPtuoNw2ABgD2XLg1/p6y7nbftpTtJzcVJ8Ki3JLC+4J6Uv
         8tj8D3aNBHV4CL23dTS8GRmkNg6IjpksY9EpFLPtfSYEx+uCjBtpgyqJqD+6vAoLJYev
         j1tA==
X-Gm-Message-State: AOAM530noSLcUpfOeu47b6Ws0iiHzHNQ2122p6nURdTHMq30H1Lq+Sox
	9eMN0suR30YGw9p/CkAOz3wcB46VsLuq429CjGk=
X-Google-Smtp-Source: ABdhPJzLVHEAPyidN5FJxvybj3CMMiz4wDCiBMadBkmSLsd3zfxzCSbEswT8McDGzWPjhhvfLRqcf7LUKS24JuYhXtI=
X-Received: by 2002:a92:c5ce:: with SMTP id s14mr12298087ilt.40.1604964596913;
 Mon, 09 Nov 2020 15:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20201028185722.2783532-1-keithp@keithp.com> <20201028185722.2783532-2-keithp@keithp.com>
In-Reply-To: <20201028185722.2783532-2-keithp@keithp.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Nov 2020 15:17:56 -0800
Message-ID: <CAKmqyKP1kiitjexn9jPxNq=qrC3sm88++a_LF5rjNEcxiU1C=w@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared
 directories [v3]
To: Keith Packard <keithp@keithp.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: v4c3o7U5kNoQ

On Wed, Oct 28, 2020 at 11:57 AM Keith Packard via
<qemu-devel@nongnu.org> wrote:
>
> This commit renames two files which provide ARM semihosting support so
> that they can be shared by other architectures:
>
>  1. target/arm/arm-semi.c     -> hw/semihosting/common-semi.c
>  2. linux-user/arm/semihost.c -> linux-user/semihost.c
>
> The build system was modified use a new config variable,
> CONFIG_ARM_COMPATIBLE_SEMIHOSTING, which has been added to the ARM
> softmmu and linux-user default configs. The contents of the source
> files has not been changed in this patch.
>
> Signed-off-by: Keith Packard <keithp@keithp.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ----
>
> v2
>         Place common-semi.c name in arm_ss, just as arm-semi.c was
>
> v3
>         Create CONFIG_ARM_COMPATIBLE_SEMIHOSTING and assign in
>         arm config files
> ---
>  default-configs/devices/arm-softmmu.mak               | 1 +
>  default-configs/targets/aarch64-linux-user.mak        | 1 +
>  default-configs/targets/arm-linux-user.mak            | 1 +
>  hw/semihosting/Kconfig                                | 3 +++
>  target/arm/arm-semi.c => hw/semihosting/common-semi.c | 0
>  hw/semihosting/meson.build                            | 3 +++
>  linux-user/arm/meson.build                            | 3 ---
>  linux-user/meson.build                                | 1 +
>  linux-user/{arm => }/semihost.c                       | 0
>  target/arm/meson.build                                | 2 --
>  10 files changed, 10 insertions(+), 5 deletions(-)
>  rename target/arm/arm-semi.c => hw/semihosting/common-semi.c (100%)
>  rename linux-user/{arm => }/semihost.c (100%)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 08a32123b4..0500156a0c 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -42,4 +42,5 @@ CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
>  CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
> diff --git a/default-configs/targets/aarch64-linux-user.mak b/default-configs/targets/aarch64-linux-user.mak
> index 163c9209f4..4713253709 100644
> --- a/default-configs/targets/aarch64-linux-user.mak
> +++ b/default-configs/targets/aarch64-linux-user.mak
> @@ -2,3 +2,4 @@ TARGET_ARCH=aarch64
>  TARGET_BASE_ARCH=arm
>  TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
>  TARGET_HAS_BFLT=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/default-configs/targets/arm-linux-user.mak b/default-configs/targets/arm-linux-user.mak
> index c7cd872e86..e741ffd4d3 100644
> --- a/default-configs/targets/arm-linux-user.mak
> +++ b/default-configs/targets/arm-linux-user.mak
> @@ -3,3 +3,4 @@ TARGET_SYSTBL_ABI=common,oabi
>  TARGET_SYSTBL=syscall.tbl
>  TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
>  TARGET_HAS_BFLT=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> index efe0a30734..4c30dc6b16 100644
> --- a/hw/semihosting/Kconfig
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,6 @@
>
>  config SEMIHOSTING
>         bool
> +
> +config ARM_COMPATIBLE_SEMIHOSTING
> +       bool
> diff --git a/target/arm/arm-semi.c b/hw/semihosting/common-semi.c
> similarity index 100%
> rename from target/arm/arm-semi.c
> rename to hw/semihosting/common-semi.c
> diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
> index f40ac574c4..5b4a170270 100644
> --- a/hw/semihosting/meson.build
> +++ b/hw/semihosting/meson.build
> @@ -2,3 +2,6 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
>    'config.c',
>    'console.c',
>  ))
> +
> +specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
> +               if_true: files('common-semi.c'))
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
> index 2b94e4ba24..7fe28d659e 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -16,6 +16,7 @@ linux_user_ss.add(rt)
>
>  linux_user_ss.add(when: 'TARGET_HAS_BFLT', if_true: files('flatload.c'))
>  linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
> +linux_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING', if_true: files('semihost.c'))
>
>
>  syscall_nr_generators = {}
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
