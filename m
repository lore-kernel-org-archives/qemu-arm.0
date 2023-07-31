Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2174174ejb;
        Mon, 31 Jul 2023 06:28:06 -0700 (PDT)
X-Received: by 2002:a05:600c:2143:b0:3fe:2140:f504 with SMTP id v3-20020a05600c214300b003fe2140f504mr1831963wml.20.1690810086756;
        Mon, 31 Jul 2023 06:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690810086; cv=none;
        d=google.com; s=arc-20160816;
        b=M4IM05/FU6fSrQn13MOSHfqC9ZiH6HrfI+oI7bdlrqHLaG1DhJNoVQk+dQSyjN9v+4
         g3X7WbTcDIUsUMh13Ga9WxeOfnVHgx78MLLW0cB8jnvwm6JNvQkKIGSEG/lGlb6N6ePv
         NnEhjMXXk6PmZLzgIDJ67rbfxnXNbUV4wHqgrHiMoJMET3D2sMGbdF1nrYWtSfPAYJIg
         FfcfcjkQyljNkGkhhfICkqm2h6Zk/6P/QftNpTw2nglI5zFgahSvBrFc6nen13TuYUnA
         p4yQgUL4mwYMyOM+gPSst9rs/wJOK/SHqIRbD07IlweBLYgl3qYE2SLZ0MRxHGylIxCE
         +JOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8gMMA/S+lNdmt0rM5meRi6+/oF86zlRB/iWExxnovjs=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=Ik4XkKqmBf4ziC6TpKUsXRNU1BehSktzukA8WeB6z0Y+v7Bdr70KlyH1frzFAf5JSL
         38NS9T5g8cs6fJ6k0kRtUnGXWwVEKmM1d0vvVifyG8gF7QuP6AAlWloff9UD3srLsDrA
         /ZmQJnGCS0indChpUOkRWDrLOPxTRHuir91oYZRXRmLXrRAq3fNcVeECtDoifMoDYb+X
         OPXaQ0usoRo+d7SaVHiNBvTNmJLXu6ZXim7urWpGlSeyVWpIEdk2kHgkMB97QF6mYUcz
         /td/NbHcVTEDH101USugHLskHxndas46/5zZ2Pz0dsPCR4cL2j6fOQOZWk+EHOJ0ryDt
         vwMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKyept5p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3-20020a1ced03000000b003fae92e7a86sor3103969wmh.7.2023.07.31.06.28.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:28:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eKyept5p;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690810086; x=1691414886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gMMA/S+lNdmt0rM5meRi6+/oF86zlRB/iWExxnovjs=;
        b=eKyept5pR0+LCuvgVtuHqz+gUkYvmH1fOnCKrWkN1C4/AHre8Gr9NuFwoqKkGNYnzM
         HGfZHqhlFvvuZUoDH5xVpuaNGge3GabK4g69MYb/eDBlK9MI7NIUn+fecjwmWhHwzOWd
         7WAuLe11k9DIdATZ0J/grBL5tZkDft8E8DtL5wwBTi60ja7v8XzfpE95Xh9nEIYqPlfQ
         lNwXEcxGkHpa+deZoQoz+P7iTnhh4hRqsTEw6bu0fPMBDNQDvtsbRnqVB45ynma1QbIU
         qwCPbmXoG9SII0AMySgmiCVxOvyH8luhT+xFnkbNDWc8io9dV5rqMiAmLUs+29ETR2p0
         MgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690810086; x=1691414886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gMMA/S+lNdmt0rM5meRi6+/oF86zlRB/iWExxnovjs=;
        b=PPeZ6AexpTfpGhnBaNOdjBktj7VNyOsDVhCokui4yMV8fTNERS3EqlwSaoQwrGYSMp
         QX5H6ewhh0sVrtU93s/4llIxqQ/JEDbPe+sfuAjtfvaZHTGXfxlNMhBKkryhsKzp3FMn
         NXO0Vko1STMlUXCxSAqU5tmnfvhjDwXq0v4xIlie0WYnXnNxXv7E9ggLpH2Sb4ACRRoC
         h/S5mc9rKnUSapXg1LGC9YU5hv/e4uslSRYixhrPQSg2GCEWlL0bPL4Thzyo2KjBnuTD
         dvMS1pJaZtTmZN7SzFKzT/p1iIhKEMbSvyf3oEm/7cSP13kjddd8lRB67Rr9aEDq8R8t
         ahSQ==
X-Gm-Message-State: ABy/qLYKVlZUtO8F0tbzTvnhVpH7ZRoDowb/jk6PcOQVB1+zN4u3Cuav
	Z4lrwrr8x8GYvl9A3rTujrv+XPD11quNlP8NRQ8ggA==
X-Google-Smtp-Source: APBJJlHMwNoxRxepGnxKznkemeh+5H/tbO8K1yA/ssP05TfXPMen4vhX1EkgXRhaigZL+EBcbX0dSw==
X-Received: by 2002:a1c:7c1a:0:b0:3fc:f9c:a3e6 with SMTP id x26-20020a1c7c1a000000b003fc0f9ca3e6mr7632898wmc.9.1690810086070;
        Mon, 31 Jul 2023 06:28:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id f2-20020a7bc8c2000000b003fbc9b9699dsm11464862wml.45.2023.07.31.06.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:28:05 -0700 (PDT)
Message-ID: <09cad822-85c2-3e0b-9414-e1da9de2a2d1@linaro.org>
Date: Mon, 31 Jul 2023 15:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-7-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: HcMGq/Emd4gf

On 31/7/23 10:43, Akihiko Odaki wrote:
> This is a tree-wide change to replace gdb_core_xml_file, the path to
> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
> also replaces the values assigned to gdb_num_core_regs with the
> num_regs member of GDBFeature where applicable to remove magic numbers.
> 
> A following change will utilize additional information provided by
> GDBFeature to simplify XML file lookup.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/hw/core/cpu.h   | 5 +++--
>   target/s390x/cpu.h      | 2 --
>   gdbstub/gdbstub.c       | 6 +++---
>   target/arm/cpu.c        | 4 ++--
>   target/arm/cpu64.c      | 4 ++--
>   target/arm/tcg/cpu32.c  | 3 ++-
>   target/avr/cpu.c        | 4 ++--
>   target/hexagon/cpu.c    | 2 +-
>   target/i386/cpu.c       | 7 +++----
>   target/loongarch/cpu.c  | 4 ++--
>   target/m68k/cpu.c       | 7 ++++---
>   target/microblaze/cpu.c | 4 ++--
>   target/ppc/cpu_init.c   | 4 ++--
>   target/riscv/cpu.c      | 7 ++++---
>   target/rx/cpu.c         | 4 ++--
>   target/s390x/cpu.c      | 4 ++--
>   16 files changed, 36 insertions(+), 35 deletions(-)


> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d71a162070..a206ab6b1b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>   #ifndef CONFIG_USER_ONLY
>       cc->sysemu_ops = &arm_sysemu_ops;
>   #endif
> -    cc->gdb_num_core_regs = 26;
>       cc->gdb_arch_name = arm_gdb_arch_name;
>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>       cc->gdb_stop_before_watchpoint = true;
> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>       CPUClass *cc = CPU_CLASS(acc);
>   
>       acc->info = data;
> -    cc->gdb_core_xml_file = "arm-core.xml";
> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");

Can we have:

   cc->gdb_core_feature = gdb_find_static_feature(cc->gdb_core_xml_file);

once in hw/core/cpu-common.c::cpu_class_init()?

(haven't verified, just wondering)

> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
>   }

