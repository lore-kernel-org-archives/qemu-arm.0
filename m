Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4500603lfg;
        Tue, 2 Mar 2021 06:10:39 -0800 (PST)
X-Received: by 2002:a17:906:f296:: with SMTP id gu22mr19856941ejb.20.1614694239105;
        Tue, 02 Mar 2021 06:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614694239; cv=none;
        d=google.com; s=arc-20160816;
        b=xY/nvEz9G3K4S3Gl3wuZ4vaW/avlQdZ8ZJRRJVRnm4AQqcYqispJoyVVPdIYEUuvM3
         MBccNhk5PLcbmfBsZscztW+Jh99hUyllXDGFO80SEb2z7lBLYwQNEevEoLRAfTJ17fMQ
         7F1G7OSVn8qRoC+sSvl0fUcb84M8bSLtLRRWy+8GuPO2vhl84rHvpsTmxzD0UKKAn4BU
         luw8YjeVmQTJv+54t/skhBebLSM9wPNKBfu54kH4aD5YTMBcSnczwu8fm6AAEUFVrpv5
         At3hGwjq0K0I6YA0t5zDc2wqG/Iz4aWlZM9FvAf4moLzvOMCZut5c9gUMDtyDUc6T26p
         RTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=WfvwxWrxxEeBzngpLg0mUnnwLyaVyzyP6BTbo+AU/c0=;
        b=fdNe4Z7FjG+aSasSxtgdxErmcy/XSn+gstFLclp/7rv6k2IbcY6Nx3sm1rKhphHYX1
         HxJVMYyaRKOhHE36rcBz7HK57IGLhH0yLNsk9mq+aYa+V0/UVyuqFdukbN/fxYkq8jaW
         4XIVR5kV+DjSLRUMTPUjQwJ5G8YZxWEkyxuoSneh93BdqEjRSlUm3xHDjrmOFx2rFzrz
         7/SIkNz4xSDe1lFfs+XIBiVQnEgxhzVDYk9wcp5G6N/tWId/iAzmeS1475anwdOessXJ
         NVHzRR3LxQHzbXoP8riqMvlAhxU1C1Q9N57D0CnySz3Oa8l+NW+gOl83lFUVML2av+IY
         vHLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cf6XaUwU;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dt22sor12782365ejc.10.2021.03.02.06.10.38
        (Google Transport Security);
        Tue, 02 Mar 2021 06:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=cf6XaUwU;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WfvwxWrxxEeBzngpLg0mUnnwLyaVyzyP6BTbo+AU/c0=;
        b=cf6XaUwUHWVs/4nqZvc3KjIHVxIqxdNsgQP2lUVTLx8d25WChOOiHbHTo8TM3u6gZL
         g5JG2KohJ/rlwbe/+ZqzR4OkUWEul3F3v4XKhKldvqjdKbvoxMJzBMt6GuxjN7GsA+Fe
         V+w3R7pS5aG2xqq5EQqEx/OF3Tb59TX2iDGzkz1TjEFzO3AIoV5G4HEtERoflkUU0Z0Q
         XkeiaUgfxkPElow67pmZh2VppoAoQF2xHEgH4L0ph8qdzwnshB/ZkvKx7kZXwRy4MjXG
         4n246G5xVNMOC30TsVI3sZA50T0yfXDOBEqpg1tpZWf9D0oDs6TIq2VSJAbXKcnIFHtm
         DCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WfvwxWrxxEeBzngpLg0mUnnwLyaVyzyP6BTbo+AU/c0=;
        b=HrFLMVhK0EiWwItVkL+P8WKZuAQIDmI8EL5PuNooXwIT24OSiE0TXvZsELrquMS7DR
         f7pe4c7fCMDmxa2y5Cew+/YGqnmaUBY/E/1fdxMz2TUNzDl3gFjPrv1F+VlcrBVoDm3G
         +h5VlKQQAUA3+C+qSuPpAFf13pIqchlYvJ2SoX/T5VD7Y1oZ7P33CJzl7zMDVf9GFgko
         0oGRPszlhzuxYAOKA0OzfKkLmDH2qPxo6x69+Q5wdSWXvRkU/lgLYEYlAFVUT/5zap/P
         wrh1T67NLvW/zkZgCKnMvcZJcnJH8g5JXZ/suDeWRQ9hNcmnQOmy58gnxUI2xGVKQZPc
         JQmQ==
X-Gm-Message-State: AOAM530UTzD+x/SUr9chfSVDTeQFCEPzFtA8M3ofh9bdNjzqZC8EUtqw
	fpcT+gQvkOCOtKyx2hjTKgA=
X-Google-Smtp-Source: ABdhPJxHLhUbmSriG1oz2z2e4fYSekgBZG4hpYlUEVLdMe3TMSLYK65lvL7pMrYqQIPQxZy3o9OsSQ==
X-Received: by 2002:a17:906:3a13:: with SMTP id z19mr21565057eje.317.1614694238729;
        Tue, 02 Mar 2021 06:10:38 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id y12sm11958296ejb.104.2021.03.02.06.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 06:10:37 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 0/2] semihosting: Move it out of hw/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Chris Wulff <crwulff@gmail.com>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
References: <20210226131356.3964782-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <463befd2-c384-553b-9a78-bb033d92638e@amsat.org>
Date: Tue, 2 Mar 2021 15:10:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226131356.3964782-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fLcQ54jlKqOa

Cc'ing Claudio.

On 2/26/21 2:13 PM, Philippe Mathieu-Daudé wrote:
> In order to reduce CONFIG_USER_ONLY uses in hw/, move
> semihosting out of it, being a generic feature.
> 
> Philippe Mathieu-Daudé (2):
>   semihosting: Move include/hw/semihosting/ -> include/semihosting/
>   semihosting: Move hw/semihosting/ -> semihosting/
> 
>  meson.build                                       | 1 +
>  include/{hw => }/semihosting/console.h            | 0
>  include/{hw => }/semihosting/semihost.h           | 0
>  {hw/semihosting => semihosting}/common-semi.h     | 0
>  gdbstub.c                                         | 2 +-
>  hw/mips/malta.c                                   | 2 +-
>  linux-user/aarch64/cpu_loop.c                     | 2 +-
>  linux-user/arm/cpu_loop.c                         | 2 +-
>  linux-user/riscv/cpu_loop.c                       | 2 +-
>  linux-user/semihost.c                             | 2 +-
>  {hw/semihosting => semihosting}/arm-compat-semi.c | 6 +++---
>  {hw/semihosting => semihosting}/config.c          | 2 +-
>  {hw/semihosting => semihosting}/console.c         | 4 ++--
>  softmmu/vl.c                                      | 2 +-
>  stubs/semihost.c                                  | 2 +-
>  target/arm/helper.c                               | 4 ++--
>  target/arm/m_helper.c                             | 4 ++--
>  target/arm/translate-a64.c                        | 2 +-
>  target/arm/translate.c                            | 2 +-
>  target/lm32/helper.c                              | 2 +-
>  target/m68k/op_helper.c                           | 2 +-
>  target/mips/cpu.c                                 | 2 +-
>  target/mips/mips-semi.c                           | 4 ++--
>  target/mips/translate.c                           | 2 +-
>  target/nios2/helper.c                             | 2 +-
>  target/riscv/cpu_helper.c                         | 2 +-
>  target/unicore32/helper.c                         | 2 +-
>  target/xtensa/translate.c                         | 2 +-
>  target/xtensa/xtensa-semi.c                       | 2 +-
>  Kconfig                                           | 1 +
>  MAINTAINERS                                       | 4 ++--
>  hw/Kconfig                                        | 1 -
>  hw/meson.build                                    | 1 -
>  {hw/semihosting => semihosting}/Kconfig           | 0
>  {hw/semihosting => semihosting}/meson.build       | 0
>  35 files changed, 35 insertions(+), 35 deletions(-)
>  rename include/{hw => }/semihosting/console.h (100%)
>  rename include/{hw => }/semihosting/semihost.h (100%)
>  rename {hw/semihosting => semihosting}/common-semi.h (100%)
>  rename {hw/semihosting => semihosting}/arm-compat-semi.c (99%)
>  rename {hw/semihosting => semihosting}/config.c (99%)
>  rename {hw/semihosting => semihosting}/console.c (98%)
>  rename {hw/semihosting => semihosting}/Kconfig (100%)
>  rename {hw/semihosting => semihosting}/meson.build (100%)
> 
