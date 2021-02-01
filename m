Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3707093lfo;
        Mon, 1 Feb 2021 11:59:54 -0800 (PST)
X-Received: by 2002:a05:6e02:1787:: with SMTP id y7mr13401801ilu.233.1612209594672;
        Mon, 01 Feb 2021 11:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612209594; cv=none;
        d=google.com; s=arc-20160816;
        b=IUMgK1pd+NG+b2lzllX8J1cn9cfBcMqegqz3kIFmKAgu3iNqJ9MFAiM3+slXFyv18p
         wU1lpdJ0PHI3RDFjAUNWRcUg6lt00Bo9F+J9ALrABRNxVVfeB3KHdT8AgHb3PeNtw47f
         vvy0vhkT3X+1ympMmSFnUlwX8cmJwhu/FvoM8crWDqYJSfVcY8MEGZW0PJTMDbp/rmU/
         pXjcFaE0XnJqfElyYc7BcxNdh6UCkGnfDFsZS0usMh0EkAx7vZRbGjAIhS25Tx62ouFU
         YSWIAjAhGzx/OulRrs7ye9l2scpxYV5EUyPa3ElAV6o7NjZXvFR8qkACMXYCSg39JfPi
         XbNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDenK5/Y6Tw0AuufIxmVZZ1MA9L3+vzEFpguQA9Cjls=;
        b=CX4NkXmxnCFReA6T5CiCt3GEKAU87e5AhHQyIXD1nZfcW5nsbVj0xmdeOiKii4QY6/
         NgG1mKeeDKARYQTseINLeCq8g7YeVn/sZOvYE6DSMYC9HhwcuaSYkwzLomHhTtm84KRR
         i81TYAACoJSdf5b9VE5Hqr8zV+Y41QGqYMjdDpFDQaKygsbKMz2YnPkW7XkRnKzde1Zp
         xiLdsUZXlJXf88UrTIGLDpXQ1stR+xKT9lXQmO8DLnVRqvJcAvAMr7i2RuGYNwe73D9F
         C5FVqm8y157x8U8+Ck4Dm64v+BvRdWgVjxKf+U4vB630djk6snwaMuCqrbIi37jGQilJ
         RPiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=niKCoEfu;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i9sor7962523ilb.67.2021.02.01.11.59.54
        (Google Transport Security);
        Mon, 01 Feb 2021 11:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=niKCoEfu;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GDenK5/Y6Tw0AuufIxmVZZ1MA9L3+vzEFpguQA9Cjls=;
        b=niKCoEfugQ5PK78TwJoKKMSo+2T21jM4fPm8pPUGvLZjL82EAWBjwnsKbjY+HYcyU6
         aJjydNfJFTNsN3hsEOI7ubCpVGS74zVa/YExdywLmb9KDyeZIOCDZgomlvyC45q0zK0i
         S2mgH9PWFbGprjrAbzlO5XkiK8k/DK5GVLzsLjpjRYjC1sB/famY9ULIm/snHaGjKccR
         q6EbAIB+5LsPi7hcUqAoH+WmIvBJiWM2R7eNn+T6ft4Lq+qxEsaxMoaqPRBHvjfaVWhS
         yTBIeig1gn//crqBTFH1NcgANVI5Wyvbl1TeY44s0iFiE+Jbp5yDOZFdTVTj6B0FDJ6k
         gA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GDenK5/Y6Tw0AuufIxmVZZ1MA9L3+vzEFpguQA9Cjls=;
        b=EoHGyrqFFt3nvmGDORFv7LsdgneK1bZtRvOu/mK7XfWtEs2S71uD3Ap3QOcBZZv3WE
         Uj/jC880u6JKg4QNOiIeO7ZV49WIL4OO0O8Kck9KTqt69LhtQxA1B15dnmklpaF4c3RB
         DI24Ize8eQP5NXkPIXZA8SFPTSezq0QKyubapE445np/gKPWSoogy2H4mv7jLclgfdru
         Bh0f4hQ25eT6dYOcfLTmEm0y3Pr6RvT+XG4Jdu68Uj9VCBNPd+VCL68bIJJV6D3gwdpu
         ji9ATEYvIbfmTGxfhgJuSLF61Bn1/J4ndRZtgfgHxfVGN0NW4U1521v0weBhsKJteTJN
         RWcQ==
X-Gm-Message-State: AOAM532a1Hkxh+LQK2Kn6BKuozmxi0PHP2btsCAP1O0Du2ygSHnaHZty
	jNL/aSEwCsBo13D/TGOikEb8lf+3HHHvp4v1Lzk=
X-Google-Smtp-Source: ABdhPJwzc0t2XzSS0cYo/LZ3JL+MxIgQ8+UL10QgsFRolJRObMtAeWIIajsriOccHiDvNJLQNtaKuaXteSrX7PanraM=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr14217320ild.267.1612209594110;
 Mon, 01 Feb 2021 11:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131111316.232778-1-f4bug@amsat.org> <20210131111316.232778-10-f4bug@amsat.org>
In-Reply-To: <20210131111316.232778-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:59:25 -0800
Message-ID: <CAKmqyKPukRjL9drhUxeVvL04etQ97AWdWH+SAiOyyBUMJs6sLQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature to
 target Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>, 
	Cornelia Huck <cohuck@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Thomas Huth <thuth@redhat.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, 
	Marek Vasut <marex@denx.de>, Qemu-block <qemu-block@nongnu.org>, 
	David Hildenbrand <david@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Greg Kurz <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Chris Wulff <crwulff@gmail.com>, 
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZOd6U3fuluRf

On Sun, Jan 31, 2021 at 3:14 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
> declaration to each target/ARCH/.
>
> Note, we do not modify the linux-user targets, as user-mode builds
> don't use Kconfig.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  target/arm/Kconfig                          | 1 +
>  target/riscv/Kconfig                        | 2 ++
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 341d439de6f..0824e9be795 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -41,5 +41,4 @@ CONFIG_MICROBIT=3Dy
>  CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index 5c9ad2590ef..94a236c9c25 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index d5b2e25b6df..76b61956489 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 1f05de47ca6..ae89d05c7e5 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,5 +1,6 @@
>  config ARM
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
>
>  config AARCH64
>      bool
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> index b9e5932f13f..c3b9d8a1cf1 100644
> --- a/target/riscv/Kconfig
> +++ b/target/riscv/Kconfig
> @@ -1,5 +1,7 @@
>  config RISCV32
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
>
>  config RISCV64
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
> --
> 2.26.2
>
>
