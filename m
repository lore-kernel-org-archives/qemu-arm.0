Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4192319wrg;
        Tue, 14 May 2019 09:25:12 -0700 (PDT)
X-Received: by 2002:a1c:e009:: with SMTP id x9mr20933749wmg.117.1557851112014;
        Tue, 14 May 2019 09:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557851112; cv=none;
        d=google.com; s=arc-20160816;
        b=tYpLJ2/4fqFwdinryE2SlnvH+di7ULGtiHVsu0jJP5yGb4do6PLHrspSBsnySKbIJ6
         3PeMMGLdC/eAyP51BjhiZz88whm53v/WQMtqKQpjr7jh3xRzqDGVxjP2EEp/fpAvJGup
         vVxGu23Rjq5arIIBzUM+rphTxMd6GlEHa7Z+n10Vy0Z8Un4gLtTTGokVIY6slDhfer/e
         h1jRa2Jwmj0ezfojPcDil9tuSTIawtPAhwRDJj2Xjtc2B/QLUctSWtkrpD3dvm0gVhA+
         huROZVho9iVgXD3IpdCQv6s3CgNJgewqIulYbZ7UlsrUO1AvjLI17ibPpBsey07k7IMt
         ffnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=8XHAL2JLnOkpZ716PlK89EkbsNpb0w0W8ZqwLqzZDqE=;
        b=WFsKs1evsi5Zg1hE1BRdtnYUoH1Sl1uQJ9LPMeE/GX+f2d4YQ68w4QgEe2ljO+OW+R
         RCQy7sc3dErL9m8gKsuS0f9WvKdc8Goiy5qPgbp2VcNsTAvjaglmhVuUfvM1PSrAkz39
         ZeQNpGwMj9RI8k5sqvf4WVZ6igjibht2XgsjVCP0Q3o2lwPcs5IYr2b5jdw+C3lXTehE
         i9V/mBzwEhprVWFvx31K4WCE8E1kqrnEid0vJp+hiazP6j2BUs45tUF4DNYGEqjzflqL
         1anka2FbcVO4damYPRPwHfbAlq+8v89l79oe2p90Araszs1LQP86LIcQUmwfON8IyhKv
         Vkug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q8sor3686005wru.29.2019.05.14.09.25.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 09:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8XHAL2JLnOkpZ716PlK89EkbsNpb0w0W8ZqwLqzZDqE=;
        b=qvWhqwmjfhIPYhovI6mifKP3nMSjgGuZ57nPaqE+Mb4rXicBGx6hHo/bzpWfHweiON
         uKNC7kHUd8qiY8G3UHMn7L2PMDM5P2Mfz9/jSmpk50F6l40p18GL3/b4AvwLfSzxjSI9
         Q02cMrcYXXeIByAmdM5Y83TPdqqABbFP/w9klnuK3+viu/UdO+InXYtJJXGd9ICRQV33
         kLOEvG1keaA8HVUmlnDwVah5Q1Lwl1Jfde6MyhZvAZ/LekDrjW8272sixWnx0m4G15S6
         KiY2uu0MW5Vb61xK7cdfJCzYFRZSOwUbQ2u+JGVdhGOd9ERGQX5pIDlAJfW8ZY2kw2OT
         xLyw==
X-Gm-Message-State: APjAAAXoAF4DPj5p/e7Dw32JlBlhAHGaYWd/FQrHusl6L/8fp4aR0oML
	tOE7onsZ8q5gwUWl1RF9fiFI5PC5+QQ=
X-Google-Smtp-Source: APXvYqwYkDHCkEZBnHirHte3a042H8/y+Uka73u915qgUQjsKmKXdTcjJI1T2SvUv2uoLYZRy0Y5/w==
X-Received: by 2002:a5d:4411:: with SMTP id z17mr12482488wrq.168.1557851111805;
        Tue, 14 May 2019 09:25:11 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.43] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id x22sm4384422wmi.4.2019.05.14.09.25.10
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:25:11 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 02/11] semihosting: introduce
 CONFIG_SEMIHOSTING
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Chris Wulff <crwulff@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <dfacf0dc-c74c-c508-5191-0f97da9f60b1@redhat.com>
Date: Tue, 14 May 2019 18:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: TnTw4BtWBeYe

On 5/14/19 5:52 PM, Alex Bennée wrote:
> There isn't much point building semihosting for platforms that don't
> support it. Introduce a new symbol and enable it only for the softmmu
> targets that need it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak         |  1 +
>  default-configs/lm32-softmmu.mak        |  2 +
>  default-configs/m68k-softmmu.mak        |  2 +
>  default-configs/mips-softmmu-common.mak |  1 +
>  default-configs/nios2-softmmu.mak       |  2 +
>  default-configs/xtensa-softmmu.mak      |  2 +
>  hw/Kconfig                              |  1 +
>  hw/semihosting/Kconfig                  |  3 ++
>  hw/semihosting/Makefile.objs            |  2 +-
>  stubs/Makefile.objs                     |  1 +
>  stubs/semihost.c                        | 66 +++++++++++++++++++++++++
>  11 files changed, 82 insertions(+), 1 deletion(-)
>  create mode 100644 hw/semihosting/Kconfig
>  create mode 100644 stubs/semihost.c
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index f23ecfd5c58..1f2e0e7fdeb 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -39,3 +39,4 @@ CONFIG_MICROBIT=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> +CONFIG_SEMIHOSTING=y
> diff --git a/default-configs/lm32-softmmu.mak b/default-configs/lm32-softmmu.mak
> index 6d259665d60..115b3e34c98 100644
> --- a/default-configs/lm32-softmmu.mak
> +++ b/default-configs/lm32-softmmu.mak
> @@ -4,6 +4,8 @@
>  #
>  #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
>  
> +CONFIG_SEMIHOSTING=y
> +
>  # Boards:
>  #
>  CONFIG_LM32=y
> diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
> index e17495e2a0b..4049a8f2ba9 100644
> --- a/default-configs/m68k-softmmu.mak
> +++ b/default-configs/m68k-softmmu.mak
> @@ -1,5 +1,7 @@
>  # Default configuration for m68k-softmmu
>  
> +CONFIG_SEMIHOSTING=y
> +
>  # Boards:
>  #
>  CONFIG_AN5206=y
> diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
> index 8e54a74b7a5..e10ac4b20c0 100644
> --- a/default-configs/mips-softmmu-common.mak
> +++ b/default-configs/mips-softmmu-common.mak
> @@ -35,6 +35,7 @@ CONFIG_MIPS_CPS=y
>  CONFIG_MIPS_ITU=y
>  CONFIG_R4K=y
>  CONFIG_MALTA=y
> +CONFIG_SEMIHOSTING=y
>  CONFIG_PCNET_PCI=y
>  CONFIG_MIPSSIM=y
>  CONFIG_ACPI_SMBUS=y
> diff --git a/default-configs/nios2-softmmu.mak b/default-configs/nios2-softmmu.mak
> index e130d024e62..1bc4082ea99 100644
> --- a/default-configs/nios2-softmmu.mak
> +++ b/default-configs/nios2-softmmu.mak
> @@ -1,5 +1,7 @@
>  # Default configuration for nios2-softmmu
>  
> +CONFIG_SEMIHOSTING=y
> +
>  # Boards:
>  #
>  CONFIG_NIOS2_10M50=y
> diff --git a/default-configs/xtensa-softmmu.mak b/default-configs/xtensa-softmmu.mak
> index 7e4d1cc0979..3aa20a47a7f 100644
> --- a/default-configs/xtensa-softmmu.mak
> +++ b/default-configs/xtensa-softmmu.mak
> @@ -1,5 +1,7 @@
>  # Default configuration for Xtensa
>  
> +CONFIG_SEMIHOSTING=y
> +
>  # Boards:
>  #
>  CONFIG_XTENSA_SIM=y
> diff --git a/hw/Kconfig b/hw/Kconfig
> index 88b9f150070..195f541e50c 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -29,6 +29,7 @@ source pci/Kconfig
>  source rdma/Kconfig
>  source scsi/Kconfig
>  source sd/Kconfig
> +source semihosting/Kconfig
>  source smbios/Kconfig
>  source ssi/Kconfig
>  source timer/Kconfig
> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> new file mode 100644
> index 00000000000..efe0a30734c
> --- /dev/null
> +++ b/hw/semihosting/Kconfig
> @@ -0,0 +1,3 @@
> +
> +config SEMIHOSTING
> +       bool
> diff --git a/hw/semihosting/Makefile.objs b/hw/semihosting/Makefile.objs
> index 546954f4ff4..09c19bf19ed 100644
> --- a/hw/semihosting/Makefile.objs
> +++ b/hw/semihosting/Makefile.objs
> @@ -1 +1 @@
> -common-obj-$(CONFIG_SOFTMMU) += config.o
> +obj-$(CONFIG_SEMIHOSTING) += config.o
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index 269dfa58326..e0d4f11b348 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -39,3 +39,4 @@ stub-obj-y += xen-hvm.o
>  stub-obj-y += pci-host-piix.o
>  stub-obj-y += ram-block.o
>  stub-obj-y += ramfb.o
> +stub-obj-$(CONFIG_SOFTMMU) += semihost.o
> diff --git a/stubs/semihost.c b/stubs/semihost.c
> new file mode 100644
> index 00000000000..1a4e88e5326
> --- /dev/null
> +++ b/stubs/semihost.c
> @@ -0,0 +1,66 @@
> +/*
> + * Semihosting Stubs for SoftMMU
> + *
> + * Copyright (c) 2019 Linaro Ltd
> + *
> + * Stubs for SoftMMU targets that don't actually do semihosting.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/option.h"
> +#include "qemu/error-report.h"
> +#include "hw/semihosting/semihost.h"
> +
> +/* Empty config */
> +QemuOptsList qemu_semihosting_config_opts = {
> +    .name = "",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_semihosting_config_opts.head),
> +    .desc = {
> +        { /* end of list */ }
> +    },
> +};
> +
> +/* Queries to config status default to off */
> +bool semihosting_enabled(void)
> +{
> +    return false;
> +}
> +
> +SemihostingTarget semihosting_get_target(void)
> +{
> +    return SEMIHOSTING_TARGET_AUTO;
> +}
> +
> +/*
> + * All the rest are empty subs. We could g_assert_not_reached() but
> + * that adds extra weight to the final binary. Waste not want not.
> + */
> +void qemu_semihosting_enable(void)
> +{
> +}
> +
> +int qemu_semihosting_config_options(const char *optarg)
> +{
> +    return 1;
> +}
> +
> +const char *semihosting_get_arg(int i)
> +{
> +    return NULL;
> +}
> +
> +int semihosting_get_argc(void)
> +{
> +    return 0;
> +}
> +
> +const char *semihosting_get_cmdline(void)
> +{
> +    return NULL;
> +}
> +
> +void semihosting_arg_fallback(const char *file, const char *cmd)
> +{
> +}
> 
