Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp447834njb;
        Thu, 5 Sep 2024 04:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXryQg78Bk0KS3uFb8vUgtkq+BaS2njlaYeETNveYvMvRJN3+6O4RdfqlBtQxb+ublltlscD+xMKBE1rw==@linaro.org
X-Received: by 2002:a05:600c:1c1b:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-42bb01b4c35mr172160185e9.13.1725534832701;
        Thu, 05 Sep 2024 04:13:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725534832; cv=none;
        d=google.com; s=arc-20160816;
        b=MAWIrdl7yJvJRXqBCdaliLZ8ZVxfhW+h95RUKaJEhjFla5sia6dW+6i5XUvBxH3sAH
         hT6Aqh5LYaDCP22laMADLp5si4oL8mBIwPKdOOD1/6km4vqzjPP2QUmoHB6DcnTzHhI7
         ZRj8MbE615NgN1F+pTS4MbSzEzwqUrufFF1BIjDu4AAqHSwqeZaGq6FARzDdlafaJ/jg
         6ABP7V6RMzeE+Kq6cBtNx1FNdaY+f3G3spva+gacXmEfBWI5XYZqxcSNUYjjvtjzJNWv
         i2Cx4OwMR78+/3Xe1egu6N8p8q2TMvRXMMEtxrcUwgB6Ugby/ffNNe+DN6D5gVa4c1jS
         AH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=JJH05I8SviTnOEWRieNaZX2qI3IbrIciBphhGGxywBA=;
        fh=sIc+Bd0V01GaEX+4TbmRtUY1diAFPgUWGHrqvai5zXk=;
        b=wRJr4uBoudyfiaG2CYR/cwIZJQd/2kCCWM3vScDvg5RCbp3E/yMfeJYAcWBcKneUlr
         Ax9yjaOgIXMF9JLdFz5NXJJcYAJyjmPYfEunZ9baQfwXO6XYeaDQz47DdXlHBgruwAmC
         TDuOw/DDGGnWoNvLdAytzs44lC4w6+Q12c9DQvCieJNv3Xv6bE48zZ1CXcgpGturqYkO
         UxtUvbCMkF69w9gN/YNpMIzmFb8iBfFSKBol4r0hTZLon/gouzuj+hyjXL3TDdyeAT05
         UpHcVu5WtyFACCwSpWXkCVjym3zx5L+F8V8VmgHEHuH1jsYEkU/s9HU9KwC4HBM/uQVy
         pNOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz51sxdS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42bb70b8a3dsor60434305e9.13.2024.09.05.04.13.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Sep 2024 04:13:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kz51sxdS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725534832; x=1726139632; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JJH05I8SviTnOEWRieNaZX2qI3IbrIciBphhGGxywBA=;
        b=kz51sxdS4DsFtSeDIjZayF226gPl2wARB6OJ1EMnrE2hDotf7u9ufHr5k7Vg9a7J1c
         QpqB0eopwbiTK9UUze+XGUlrrhG0rS67yPSwIKW9f2GAdjf3ukzNf1oyh/wYtwHkacBK
         FjixmIJD2LmbvetibQN/fVungqg5T5N1fxWIKOJgAXhEX4XGiXBNFgEoWo8/vHZd7pXt
         AISTyD/lRN7OSrPLqyc5i23UeCShX342zPhN/XxHeRacZtzi/EnkSpExE/XCiOiZ+MOD
         DcLukYc+4Upbqgm95ry2d8YWjHweHu8YwcpawqhsMvFQ/5oKJGoHSRTMut+R6aP0V7m+
         x5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534832; x=1726139632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJH05I8SviTnOEWRieNaZX2qI3IbrIciBphhGGxywBA=;
        b=xNHHj5JtTOjy+IkGOYtokHB2mEkfA6v6E4bX0LiW7l3Whr/+sz296GTK9FP/19F459
         9y5Qi/3meJRVPYliruDi+P1dcnMtVh90qq9ma7+i7R+ZX9rs08ronYZNUwgY3eimwxh1
         qIVIYhcoWkPPOmWAApqSkBL6t1WhRH+eAkzQ2NHmFvsqj8JCECxs7ECt/WesoJf3e3TT
         fg3mOL2Axnty45ms2I2oJPY+5nEHgvlu1OkYOsJfrA/AEBRi9AYWh3zy0Ios2+zRoipG
         rGe3cNy1kOviksgbnE1Jcid4eva2pHJfSawVEz0XCX866esgn7XZIM1UVJnUPlTRfC+K
         SIKg==
X-Forwarded-Encrypted: i=1; AJvYcCVMSeiAs/dXGmFcwyFvaGb1E0I0U+gykaouFWOaYjRCotrp2wbh4nIaZKUlqblJ4l+0E4PMcdlfGOggTA==@linaro.org
X-Gm-Message-State: AOJu0YzDnj3pLb0I/qY/plnaCzmAdnMJwdwnLd8OSwZMjJnLpW3caa4p
	yKQOeVH0LnN4k+4RDcHSEyFtXtn3tGB/RlYgk5o/f147EddDiO2rcDG24WGjE0b5sg==
X-Google-Smtp-Source: AGHT+IHlhtTy9at+KdO9f/fBaE3yzwdg+k26gsV8rN2gaUHJSw0s2iTLo/1Mxu3hqgFXvfz7eOGIpw==
X-Received: by 2002:a05:600c:470f:b0:426:5ef5:bcb1 with SMTP id 5b1f17b1804b1-42bb01aa115mr166295275e9.6.1725534831939;
        Thu, 05 Sep 2024 04:13:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.67] ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c554f0c2sm12606055f8f.43.2024.09.05.04.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 04:13:51 -0700 (PDT)
Message-ID: <08360075-385e-4083-8dea-5e2275d02834@linaro.org>
Date: Thu, 5 Sep 2024 13:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hw/char: Extract serial-mm
To: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Helge Deller <deller@gmx.de>,
 Song Gao <gaosong@loongson.cn>, Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Hao Wu <wuhaotsh@google.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <arikalo@gmail.com>, Jia Liu <proljc@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bernhard Beschow <shentey@gmail.com>
References: <20240905073832.16222-1-shentey@gmail.com>
 <20240905073832.16222-4-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240905073832.16222-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QiIgi0NgUsPQ

Hi,

On 5/9/24 09:38, Bernhard Beschow wrote:
> hw/char/serial currently contains the implementation of both TYPE_SERIAL and
> TYPE_SERIAL_MM. According to serial_class_init(), TYPE_SERIAL is an internal
> class while TYPE_SERIAL_MM is used by numerous machine types directly. Let's
> move the latter into its own module which makes the dependencies more obvious
> and the code more tidy.
> 
> The includes and the dependencies have been converted mechanically except in the
> hw/char directories which were updated manually. The result was compile-tested.
> Now, only hw/char makes direct use of TYPE_SERIAL:
> 
>    # grep -r -e "select SERIAL" | grep -v SERIAL_
>    hw/char/Kconfig:    select SERIAL
>    hw/char/Kconfig:    select SERIAL
>    hw/char/Kconfig:    select SERIAL
>    hw/char/Kconfig:    select SERIAL
>    hw/char/Kconfig:    select SERIAL
> 
>    # grep -r -e "/serial\\.h"
>    include/hw/char/serial-mm.h:#include "hw/char/serial.h"
>    hw/char/serial-pci-multi.c:#include "hw/char/serial.h"
>    hw/char/serial.c:#include "hw/char/serial.h"
>    hw/char/serial-isa.c:#include "hw/char/serial.h"
>    hw/char/serial-pci.c:#include "hw/char/serial.h"
> 
> Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/aspeed_soc.h         |   2 +-
>   include/hw/char/mchp_pfsoc_mmuart.h |   2 +-
>   include/hw/char/serial-mm.h         |  52 +++++++++
>   include/hw/char/serial.h            |  19 ----
>   hw/arm/allwinner-a10.c              |   2 +-
>   hw/arm/allwinner-h3.c               |   2 +-
>   hw/arm/allwinner-r40.c              |   2 +-
>   hw/arm/aspeed_ast2400.c             |   2 +-
>   hw/arm/aspeed_soc_common.c          |   2 +-
>   hw/arm/kzm.c                        |   2 +-
>   hw/arm/msf2-soc.c                   |   2 +-
>   hw/arm/musicpal.c                   |   2 +-
>   hw/arm/npcm7xx.c                    |   2 +-
>   hw/arm/pxa2xx.c                     |   2 +-
>   hw/char/omap_uart.c                 |   2 +-
>   hw/char/serial-mm.c                 | 157 ++++++++++++++++++++++++++++
>   hw/char/serial.c                    | 126 ----------------------
>   hw/display/sm501.c                  |   2 +-
>   hw/hppa/machine.c                   |   2 +-
>   hw/loongarch/virt.c                 |   2 +-
>   hw/microblaze/petalogix_ml605_mmu.c |   2 +-
>   hw/mips/boston.c                    |   2 +-
>   hw/mips/jazz.c                      |   2 +-
>   hw/mips/loongson3_virt.c            |   2 +-
>   hw/mips/malta.c                     |   2 +-
>   hw/mips/mipssim.c                   |   2 +-
>   hw/openrisc/openrisc_sim.c          |   2 +-
>   hw/openrisc/virt.c                  |   2 +-
>   hw/ppc/e500.c                       |   2 +-
>   hw/ppc/ppc405_uc.c                  |   2 +-
>   hw/ppc/ppc440_bamboo.c              |   2 +-
>   hw/ppc/sam460ex.c                   |   2 +-
>   hw/ppc/virtex_ml507.c               |   2 +-
>   hw/riscv/virt.c                     |   2 +-
>   hw/sparc64/niagara.c                |   2 +-
>   hw/sparc64/sun4u.c                  |   2 +-
>   hw/xtensa/xtfpga.c                  |   2 +-
>   hw/arm/Kconfig                      |  20 ++--
>   hw/char/Kconfig                     |   4 +
>   hw/char/meson.build                 |   1 +
>   hw/display/Kconfig                  |   2 +-
>   hw/hppa/Kconfig                     |   2 +-
>   hw/loongarch/Kconfig                |   2 +-
>   hw/microblaze/Kconfig               |   2 +-
>   hw/mips/Kconfig                     |  10 +-
>   hw/openrisc/Kconfig                 |   4 +-
>   hw/ppc/Kconfig                      |  10 +-
>   hw/riscv/Kconfig                    |   2 +-
>   hw/sparc64/Kconfig                  |   1 +
>   hw/xtensa/Kconfig                   |   2 +-
>   50 files changed, 276 insertions(+), 206 deletions(-)
>   create mode 100644 include/hw/char/serial-mm.h
>   create mode 100644 hw/char/serial-mm.c


> diff --git a/include/hw/char/serial-mm.h b/include/hw/char/serial-mm.h
> new file mode 100644
> index 0000000000..62a8489d69
> --- /dev/null
> +++ b/include/hw/char/serial-mm.h
> @@ -0,0 +1,52 @@
> +/*
> + * QEMU 16550A UART emulation
> + *
> + * Copyright (c) 2003-2004 Fabrice Bellard
> + * Copyright (c) 2008 Citrix Systems, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */


> diff --git a/hw/char/serial-mm.c b/hw/char/serial-mm.c
> new file mode 100644
> index 0000000000..2f67776b19
> --- /dev/null
> +++ b/hw/char/serial-mm.c
> @@ -0,0 +1,157 @@
> +/*
> + * QEMU 16550A UART emulation
> + *
> + * Copyright (c) 2003-2004 Fabrice Bellard
> + * Copyright (c) 2008 Citrix Systems, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */

Could we start recommend to also add SPDX tags for new files committed
to the repository? They are clearer than mis-copy/pasted license with
typos and can be parsed by tools.

Regards,

Phil.
