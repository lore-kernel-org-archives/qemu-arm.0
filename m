Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp523193lfg;
        Wed, 10 Mar 2021 05:30:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9xf1stpTKBqX/i3OIjmkY0YyZZf6wMbFUDANdLQmSDIUyq4hpg/nCrhCzLt83aBFpDb0K
X-Received: by 2002:adf:e54a:: with SMTP id z10mr3542262wrm.87.1615383019707;
        Wed, 10 Mar 2021 05:30:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615383019; cv=none;
        d=google.com; s=arc-20160816;
        b=f3NOHbNfrQXfOxvatTWZN6gXN8W4YP9x/khxuKa/s+jO4wERJu4uF5iP+LyUwOoyOb
         tgH9cnkqcV1wLcdhS6xQ+QO6IWKOG6V8yWUkSDX332cR+ha23HCKhaBxsSgXq2ctx6V6
         H0YVAfa00sj73mwM49Ff+/I5YiLngBGAOVE2FdYjgLpmntOkV4e/rWioh919LOBIB8ni
         KpZj26rlxlGrGnRLxxOqvxulyxZ2FcjdZWW/RgvxO/bs9+beEJYVZBLwdi+mMjPVBgGR
         1cBboWbauWr8dn0nov/bFh+YEHjMOob0e++SbYd1RCGoA0rV+KtYgeJbi+iEn89tz0Ai
         5flQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=P578Fjt8OdjfTMLMB/ej4bNeVnqQnqfS8J2ct68cvnk=;
        b=FuBQb87v9FrfUKgTseCRPGuIrOqKUBUffSid4oM06P1sFHK9NjfSUcbJ+8IUtpMill
         Pc9D47lYNV7cu/RTbzYvE/T1SqFy+gqTyJFC8Zf6b0hpYnMORAl0HfJJOOMeiSIPdr24
         imiIBvwB6abpGwVJUckEglqUVyWWy39PnO5GtWI9XLoYDwOHAcFpl0PbyhtHPRLoG6vI
         d8E8jL3TwUItemJ1lFx7JTKGlOBQG2Qs9/+wXAQmwHiMlklPS2GKx2VWvtgrZov0ym8U
         u5U3nBAbg79NefHo6EkeUuQpjWpIWF6s+qDcJiUNpiE1Pa7bJxV9S7axHmTqxsmJDaQq
         WilQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from mx2.suse.de (mx2.suse.de. [195.135.220.15])
        by mx.google.com with ESMTPS id r12si4912231wrj.389.2021.03.10.05.30.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 05:30:19 -0800 (PST)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) client-ip=195.135.220.15;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.15 as permitted sender) smtp.mailfrom=cfontana@suse.de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 004AFAD72;
	Wed, 10 Mar 2021 13:30:18 +0000 (UTC)
Subject: Re: [PATCH 00/10] target: Provide target-specific Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20210131111316.232778-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <2eca1e78-073f-ae5d-6f82-73f4d21c4e72@suse.de>
Date: Wed, 10 Mar 2021 14:30:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210131111316.232778-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: +TEiOuRg4cb+

Hi all, where are we with this series?

I am trying to figure out how to apply the whole thing,
in order to build only compatible ARM boards and devices for KVM-only builds.

Ie, I would like to combine this with:

"arm cleanup experiment for kvm-only build"

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg02790.html

My series there gets us to a buildable and working KVM-only ARM target, with all make check tests passing.

However, in order to be able to remove more code, remove stubs etc,
I found the presence of incompatible ARM boards and devices as blocking additional cleanups.

Therefore, in order to proceed with additional cleanup in arm, and adding the accel-specific extensions to the cpu class,
I see being able to disable incompatible boards for KVM as necessary.

IIUC there are:

* This series "target: Provide target-specific Kconfig"
* Support disabling TCG on ARM ?
* Support disabling TCG on ARM (part 2) ?

What is the current state here?

Thanks,

Claudio


On 1/31/21 12:13 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series add a Kconfig file to each target, allowing
> to select target-specific features there, instead of from
> the hardware Kconfig.
> 
> This simplifies managing multi-arch features such semihosting.
> 
> Series organization:
> 
> 1/ Some targets use the architecture symbol to select boards and
> peripherals (SH4 and LM32), we need to clean that first.
> 
> 2/ Introduce empty target Kconfig, update meson.
> 
> 3/ Move architectural features out of hardware:
>    - x86 SEV
>    - ARM v7m
>    - generic semihosting
> 
> [following only important to patchew, unrelated to this series]
> Based-on: <20210131105918.228787-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (10):
>   hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_PERIPHERALS
>   hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards
>   hw/sh4/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_PERIPHERALS
>   hw/lm32/Kconfig: Have MILKYMIST select LM32_PERIPHERALS
>   meson: Introduce target-specific Kconfig
>   target/i386: Move SEV feature to target Kconfig
>   target/arm: Move V7M feature to target Kconfig
>   default-configs: Remove unnecessary SEMIHOSTING selection
>   target: Move ARM_COMPATIBLE_SEMIHOSTING feature to target Kconfig
>   target: Move SEMIHOSTING feature to target Kconfig
> 
>  default-configs/devices/arm-softmmu.mak       |  2 --
>  default-configs/devices/lm32-softmmu.mak      |  4 +---
>  default-configs/devices/m68k-softmmu.mak      |  2 --
>  .../devices/mips-softmmu-common.mak           |  3 ---
>  default-configs/devices/nios2-softmmu.mak     |  2 --
>  default-configs/devices/riscv32-softmmu.mak   |  2 --
>  default-configs/devices/riscv64-softmmu.mak   |  2 --
>  default-configs/devices/unicore32-softmmu.mak |  1 -
>  default-configs/devices/xtensa-softmmu.mak    |  2 --
>  meson.build                                   |  3 ++-
>  Kconfig                                       |  1 +
>  hw/arm/Kconfig                                |  4 ----
>  hw/block/meson.build                          |  2 +-
>  hw/char/meson.build                           |  6 ++---
>  hw/i386/Kconfig                               |  4 ----
>  hw/intc/meson.build                           |  4 ++--
>  hw/lm32/Kconfig                               | 10 +++++---
>  hw/lm32/meson.build                           |  2 +-
>  hw/sh4/Kconfig                                |  6 ++---
>  hw/timer/meson.build                          |  4 ++--
>  target/Kconfig                                | 23 +++++++++++++++++++
>  target/alpha/Kconfig                          |  2 ++
>  target/arm/Kconfig                            | 11 +++++++++
>  target/avr/Kconfig                            |  2 ++
>  target/cris/Kconfig                           |  2 ++
>  target/hppa/Kconfig                           |  2 ++
>  target/i386/Kconfig                           |  9 ++++++++
>  target/lm32/Kconfig                           |  3 +++
>  target/m68k/Kconfig                           |  3 +++
>  target/microblaze/Kconfig                     |  2 ++
>  target/mips/Kconfig                           |  7 ++++++
>  target/moxie/Kconfig                          |  2 ++
>  target/nios2/Kconfig                          |  3 +++
>  target/openrisc/Kconfig                       |  2 ++
>  target/ppc/Kconfig                            |  5 ++++
>  target/riscv/Kconfig                          |  7 ++++++
>  target/rx/Kconfig                             |  2 ++
>  target/s390x/Kconfig                          |  2 ++
>  target/sh4/Kconfig                            |  2 ++
>  target/sparc/Kconfig                          |  5 ++++
>  target/tilegx/Kconfig                         |  2 ++
>  target/tricore/Kconfig                        |  2 ++
>  target/unicore32/Kconfig                      |  3 +++
>  target/xtensa/Kconfig                         |  3 +++
>  44 files changed, 129 insertions(+), 43 deletions(-)
>  create mode 100644 target/Kconfig
>  create mode 100644 target/alpha/Kconfig
>  create mode 100644 target/arm/Kconfig
>  create mode 100644 target/avr/Kconfig
>  create mode 100644 target/cris/Kconfig
>  create mode 100644 target/hppa/Kconfig
>  create mode 100644 target/i386/Kconfig
>  create mode 100644 target/lm32/Kconfig
>  create mode 100644 target/m68k/Kconfig
>  create mode 100644 target/microblaze/Kconfig
>  create mode 100644 target/mips/Kconfig
>  create mode 100644 target/moxie/Kconfig
>  create mode 100644 target/nios2/Kconfig
>  create mode 100644 target/openrisc/Kconfig
>  create mode 100644 target/ppc/Kconfig
>  create mode 100644 target/riscv/Kconfig
>  create mode 100644 target/rx/Kconfig
>  create mode 100644 target/s390x/Kconfig
>  create mode 100644 target/sh4/Kconfig
>  create mode 100644 target/sparc/Kconfig
>  create mode 100644 target/tilegx/Kconfig
>  create mode 100644 target/tricore/Kconfig
>  create mode 100644 target/unicore32/Kconfig
>  create mode 100644 target/xtensa/Kconfig
> 
