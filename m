Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp475495ejb;
        Thu, 5 Jan 2023 09:30:51 -0800 (PST)
X-Received: by 2002:a7b:ce89:0:b0:3d2:3239:2fd7 with SMTP id q9-20020a7bce89000000b003d232392fd7mr37809509wmj.41.1672939851369;
        Thu, 05 Jan 2023 09:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939851; cv=none;
        d=google.com; s=arc-20160816;
        b=EUeXqgF430r4P4/4pYvkmomg/iv6aQqgwrnVOcycHTG6kDEwWhdCYEgDKiCMm7oN/8
         9cXx3KFEoflrJVJbbHY6B9QW7G88Hx6FBaWXwIWRVeTCTRZ2bNVyh2uy4gi7bEpCmAFk
         gEZXRaX8p+i+giL+VscNzLXI1z4s9iuqPd0ZMGRjv39BGKXAhy8DQyydenbQb8PMsGKR
         szW0fBXOiU1cvcAIE+lmCv37x5tvbGe9klTD+BtF6wRnPBuPMXxDnMcb62lOTvkNlKe8
         JmQqH/kHS7DZiD3ILlCEavuWuEvDSrrCx1WTI5LHfu1fHXH127lSEoNu9btgKHvKnahO
         UBBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1XSMKE/5EB1bpbXcBjrkxqRLay8QBqdRXQ4g4OxlKas=;
        b=wq+R7gSQ3qTXiqwHzRwe9IfnzAvm5lVEajBSJIcT+8rt3r8UMx+Sk7Ro0mi8I/Q2td
         w/BkdtA8H1eNUGM5cmHKZem3bMRDJHTdlZQEEyaqiJCTzcNaru0cOmHO52TClrDMIETi
         KXFtadOEnltwYQfrosEOCeZxxlAYhWfyHeoCMhTS7ocdVJrXJp7TUr5c8zBfMd/pgPSE
         /4ihLYIe/xSL4JYHdFlX7VnZYAVW2CalejWsqDvkqXOEsav5D+qo7tFx0CQTpoEGeTpv
         aPqf2BfK7jXl6Zbgrztmr82B+6q0ZOc9gh1Me0aDT4qg0RYkFzakB2n7/tSH3OtDmF2D
         A94w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF3iR0Ql;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r8-20020a05600c2f0800b003c43f57e907sor873758wmn.0.2023.01.05.09.30.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IF3iR0Ql;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XSMKE/5EB1bpbXcBjrkxqRLay8QBqdRXQ4g4OxlKas=;
        b=IF3iR0QlAzQbtNh5PZvukBynNxG6WmcjaC+y5AYGPVFiffqpNkPNurBB6n+7OUKaMS
         RhtBuGxJyN0rFlS4EFpLP0ipdciXkBniWFAy9l3/luaNTohi1FyZPtCJ36SAB1BNZ51m
         sinBBGFINSlLcfemBVSuhwiYPc+KLpC1HpSzeAtqHeHzQWxgOIr45+txY4Jcy6EN9jGH
         X9UZA2QGtkvAaCtVzLI1vQLr9y7h75+9qSF23NvCVGV+0Gd+2/wgRArQJiHO9BHEjEvk
         52NBZVFki1sW+LFiAJuiQj9CUrG0HB9ZDsW/mF4IjbWdTXvbbZqvOxJPGtoFP9v6KYtv
         SS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XSMKE/5EB1bpbXcBjrkxqRLay8QBqdRXQ4g4OxlKas=;
        b=ljyghIRoJD+Sm0g/bjm2sYO1kGbonHqNiCs+LzmNKlUZdM0yHn2OZzzGQbl1gxfRk6
         1HvhUDwUI+4l0aPj9KOfZqqehFn1rDylxiiK4E4/QqFFPb9OlwOe+XbAw3rB2bjRRMgF
         xIOji/t3gaf7ier1YdneAgPJkLUsdQLBvc+5M/RG9tyuQASCoYLNCunceNFQX3+SgFJY
         S1R/ukMD+xqCrVPJ/6GOkFa3MheOD/LeF6dCFgqPxKxTWtK+R6+mSlyKI93gU3gD2wPc
         nMyXgUkjJbx045d9TRZLYfYIh0AzV9L4exNLZJwTbCyBkI3Htihdgiw2UQ+mPPC1/4s/
         R/+A==
X-Gm-Message-State: AFqh2krRVFDSUsTrE8aeBxU0PRWBQLLVOHBI481M1LA2riWunXxMgSQZ
	IuZSHyAKjFR2JTXzEIsOVMX9f5LAK9CDEusHpro=
X-Google-Smtp-Source: AMrXdXullybworR9QQQLRTJsj7FIQUrHdLLVkmcuoAHB2iNZk9CVkB0nL7sUfBxwS0clQa/mjPWYBg==
X-Received: by 2002:a05:600c:8a9:b0:3cf:6e85:eda7 with SMTP id l41-20020a05600c08a900b003cf6e85eda7mr37622567wmp.14.1672939850822;
        Thu, 05 Jan 2023 09:30:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id s35-20020a05600c31a300b003cfa81e2eb4sm2886611wmp.38.2023.01.05.09.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:30:50 -0800 (PST)
Message-ID: <63479354-031b-add3-72b5-f32719f33f3a@linaro.org>
Date: Thu, 5 Jan 2023 18:30:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 19/21] gdbstub: move register helpers into standalone
 include
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /WPcdQyrrf1+

On 5/1/23 17:43, Alex Bennée wrote:
> These inline helpers are all used by target specific code so move them
> out of the general header so we don't needlessly pollute the rest of
> the API with target specific stuff.
> 
> Note we have to include cpu.h in semihosting as it was relying on a
> side effect before.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/gdbstub.h                 |  86 ---------------------
>   include/gdbstub/helpers.h              | 103 +++++++++++++++++++++++++
>   semihosting/syscalls.c                 |   1 +
>   target/alpha/gdbstub.c                 |   2 +-
>   target/arm/gdbstub.c                   |   1 +
>   target/arm/gdbstub64.c                 |   2 +-
>   target/arm/helper-a64.c                |   2 +-
>   target/arm/m_helper.c                  |   2 +-
>   target/avr/gdbstub.c                   |   2 +-
>   target/cris/gdbstub.c                  |   2 +-
>   target/hexagon/gdbstub.c               |   2 +-
>   target/hppa/gdbstub.c                  |   2 +-
>   target/i386/gdbstub.c                  |   2 +-
>   target/i386/whpx/whpx-all.c            |   2 +-
>   target/loongarch/gdbstub.c             |   1 +
>   target/m68k/gdbstub.c                  |   2 +-
>   target/m68k/helper.c                   |   1 +
>   target/m68k/m68k-semi.c                |   1 +
>   target/microblaze/gdbstub.c            |   2 +-
>   target/mips/gdbstub.c                  |   2 +-
>   target/mips/tcg/sysemu/mips-semi.c     |   1 +
>   target/nios2/cpu.c                     |   2 +-
>   target/nios2/nios2-semi.c              |   1 +
>   target/openrisc/gdbstub.c              |   2 +-
>   target/openrisc/interrupt.c            |   2 +-
>   target/openrisc/mmu.c                  |   2 +-
>   target/ppc/cpu_init.c                  |   2 +-
>   target/ppc/gdbstub.c                   |   1 +
>   target/riscv/gdbstub.c                 |   1 +
>   target/rx/gdbstub.c                    |   2 +-
>   target/s390x/gdbstub.c                 |   1 +
>   target/s390x/helper.c                  |   2 +-
>   target/sh4/gdbstub.c                   |   2 +-
>   target/sparc/gdbstub.c                 |   2 +-
>   target/tricore/gdbstub.c               |   2 +-
>   target/xtensa/core-dc232b.c            |   2 +-
>   target/xtensa/core-dc233c.c            |   2 +-
>   target/xtensa/core-de212.c             |   2 +-
>   target/xtensa/core-de233_fpu.c         |   2 +-
>   target/xtensa/core-dsp3400.c           |   2 +-
>   target/xtensa/core-fsf.c               |   2 +-
>   target/xtensa/core-lx106.c             |   2 +-
>   target/xtensa/core-sample_controller.c |   2 +-
>   target/xtensa/core-test_kc705_be.c     |   2 +-
>   target/xtensa/core-test_mmuhifi_c3.c   |   2 +-
>   target/xtensa/gdbstub.c                |   2 +-
>   target/xtensa/helper.c                 |   2 +-
>   47 files changed, 148 insertions(+), 121 deletions(-)
>   create mode 100644 include/gdbstub/helpers.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
