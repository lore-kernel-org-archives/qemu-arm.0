Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp564800ejr;
        Tue, 10 Oct 2023 20:21:42 -0700 (PDT)
X-Received: by 2002:aa7:d046:0:b0:533:45b3:1963 with SMTP id n6-20020aa7d046000000b0053345b31963mr15143880edo.28.1696994502168;
        Tue, 10 Oct 2023 20:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696994502; cv=none;
        d=google.com; s=arc-20160816;
        b=mZbRFQAdadgVatjK7kycft2nmxIjNAefnIDz6YG9epebIUEBiCr2UIeJ2U8F8EUunp
         auJZIw6rc9VFeK2LWpxn9JpTphkLI6769NDkPrLNxjR9ch3VXGRaDMcI7fF/FGA4mT/a
         uXF1ge4SFE09iRWguTD+Ejuz0ejEIzW2lH1PoUB6uu0MtfifabfjbBXdJs+MrtR7K6VV
         kiGEpCom6+31CpXFDf+0su0TtSOtlRwQ5jUOP47bpmyEAv/SD9N3gDSQ4Q/6ajEAjZBT
         U4loV1ZAv4UoItXKO8xdOhrhLFdX8w4/xzcs3tgp/IRjsM+sQL/6agvRmfAi4lyyTtPL
         x+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rf5gxsbp430mWT7/Bc31GPupiZtpSrleCvdmHeu8VwU=;
        fh=euzk7Ez4FtVjUdatABJTliVNmfjIsoORZj0ys5E3108=;
        b=GxD2tZbLtEjdLv6pwqgC1DCtWUsjXdDG3wQ9cyEqSA1fzGTKhVWS/UeLkwrKabsx18
         bFhOwb5Dg4hDwlWJnouch5iKE0ALc6aTrHsrEJU0tBKYEHgoec2+anLaaerLXiGYWMhm
         0m0QrF3G1LIq5P9oK1QhMc9tpHHdXB233SgVvEuIrGkBpYdff3nWTdV4r+1qkwqXFJWN
         dYELhqWDobTbB9cJzq+87KNHPauylxDPUwxl6Y2zPjCRXW1g5U/5dd4ocKmnyBTc+auq
         f5jkacGsiW7Ap7EsSt0lBml0vH88RXfsTPtFdgYIMt0RFCbVlCs9j0HQpKBNakQgwrRx
         LNfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MiEgE/o+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o25-20020a50c299000000b005331505029bsor1811395edf.2.2023.10.10.20.21.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 20:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MiEgE/o+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696994502; x=1697599302; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rf5gxsbp430mWT7/Bc31GPupiZtpSrleCvdmHeu8VwU=;
        b=MiEgE/o+LvcdMU1za6NVvC7/vVTj3rRHePxInq1HxtO1/KpRnmzEV81s6K47Q2+HGl
         FFd6dohdPAkXpxAVnE9S3rsuf+eLtx/T3Df86n4PzBA+74aSaYeFEW0FSQ3S8/F9Q5DH
         xmj/3SE2tQAxVOTPoMteObSDZp0gc+dwLiNjVxKog6XxrO+ol2JpiWKPSd+Yb46az/j3
         kN0BqNQNXWcUCgVcg/ikON8bdZtTSe7n35QM7FaluXhyfRBhu11aj2M8DL+tMMO0UH26
         XK647FGtmg1pXkPxL3wLIc2cJESg6ZUUKHr2NtWTv2WashTdMFjizlhvXWw92PtTNO9y
         AkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696994502; x=1697599302;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf5gxsbp430mWT7/Bc31GPupiZtpSrleCvdmHeu8VwU=;
        b=wQn63cQIhWvhuKkj0kr3ywtCtwNBKy9Sm41PzxASXqONGCU5Z1bIv+j7Ylom+gAz55
         ZLRbGGbQpblV+n4KwZu9nOyjBlDIkGTYx+YqlXJJk2kAKDk3kYaFvI78/gZfPnsseIar
         k1fzkwPRBI6gf45FSm/2nFk05oF5n869xvzVDeQYoAyUEkEGlkuD3PuW7qy9zrTL1XtC
         snYpwAeJEiWjWDcxaM5YxZnZ2ezIHj3y8DLlL3nn/keQPX3LmTPQs7t9PNap4RLcekMU
         3CxPoSgH6Q+sFgSelyWdGwYs+aZd0ZNOVhPVC8UyAaxZ+MmK2DCOzm1tmuiD2yD6ur0v
         mFtA==
X-Gm-Message-State: AOJu0Yw4qArBUTe6FBURsO5oLocKI9k9d8bJgVuOlGqO/sCVObS2emok
	9mJh1C+it4bRKUksMbiiuwnFGlV8
X-Google-Smtp-Source: AGHT+IFsoEg+3hmwPLtWkPthJP1a4BnRC8wMFOGJDp/mP781dneXsFI+nVjx6QPZh61yK1gcooY3tQ==
X-Received: by 2002:a05:6402:6d4:b0:533:4c67:c911 with SMTP id n20-20020a05640206d400b005334c67c911mr17781768edy.19.1696994501830;
        Tue, 10 Oct 2023 20:21:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr. [176.173.161.48])
        by smtp.gmail.com with ESMTPSA id k12-20020a056402048c00b0052ffc2e82f1sm8393286edv.4.2023.10.10.20.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 20:21:41 -0700 (PDT)
Message-ID: <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
Date: Wed, 11 Oct 2023 05:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 04/18] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Brian Cain <bcain@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-arm@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Marek Vasut
 <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, Stafford Horne <shorne@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org
References: <20231010092901.99189-1-philmd@linaro.org>
 <20231010092901.99189-5-philmd@linaro.org>
 <348eaf9c-9fb6-4674-b324-c3f3017f1851@linux.alibaba.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <348eaf9c-9fb6-4674-b324-c3f3017f1851@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: N5Q405RZ41Q1

Hi Zhiwei,

On 11/10/23 04:51, LIU Zhiwei wrote:
> 
> On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
>> Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
>> macro to resolve target CPU types.
> 
> Hi Philippe,
> 
> I don't understand why should we use FOO_CPU_TYPE_NAME macro to resolve 
> target CPU types? In my opinion, we should pass the
> CPU typename from command line for heterogeneous case.
> 
> Could you make it clearer how should we use FOO_CPU_TYPE_NAME macro to 
> resolve target CPU types in heterogeneous case?

To be honest I start to feel a bit lost with the "cpu
resolving type" design.

We are not quite there yet to "create from command line"
or "create from QMP", so I'm prototyping in plain C.
One of my test is:

   #include "target/arm/cpu-qom.h"
   #include "target/hexagon/cpu-qom.h"
   ...

   static void
   my_machine3_init((MachineState *machine)
   {
     CPUState cpu[2];
     ...

     cpu[0] = CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a72")));
     cpu[1] = CPU(object_new(HEXAGON_CPU_TYPE_NAME("v68")));
     ...
   }

The machine code need access to the per-target
FOO_CPU_TYPE_NAME() macros. I'm not sure what each macro
expands to is considered stable, so IIUC I can't inline and use:

     cpu[0] = CPU(object_new("cortex-a72-arm-cpu"));
     cpu[1] = CPU(object_new("v68"-hexagon-cpu));

That said, maybe I'm mistaken.

Kinda related discussion with Gavin/Igor:
https://lore.kernel.org/qemu-devel/35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com/
(related to 
https://lore.kernel.org/qemu-devel/20230907003553.1636896-1-gshan@redhat.com/).

> 
> Thanks,
> Zhiwei
> 
>> Move the declaration
>> (along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/alpha/cpu-qom.h   | 5 ++++-
>>   target/alpha/cpu.h       | 2 --
>>   target/avr/cpu-qom.h     | 5 ++++-
>>   target/avr/cpu.h         | 2 --
>>   target/cris/cpu-qom.h    | 5 ++++-
>>   target/cris/cpu.h        | 2 --
>>   target/i386/cpu-qom.h    | 3 +++
>>   target/i386/cpu.h        | 2 --
>>   target/m68k/cpu-qom.h    | 5 ++++-
>>   target/m68k/cpu.h        | 2 --
>>   target/mips/cpu-qom.h    | 3 +++
>>   target/mips/cpu.h        | 2 --
>>   target/rx/cpu-qom.h      | 5 ++++-
>>   target/rx/cpu.h          | 2 --
>>   target/s390x/cpu-qom.h   | 5 ++++-
>>   target/s390x/cpu.h       | 2 --
>>   target/sh4/cpu-qom.h     | 5 ++++-
>>   target/sh4/cpu.h         | 2 --
>>   target/sparc/cpu-qom.h   | 5 ++++-
>>   target/sparc/cpu.h       | 2 --
>>   target/tricore/cpu-qom.h | 5 +++++
>>   target/tricore/cpu.h     | 2 --
>>   target/xtensa/cpu-qom.h  | 5 ++++-
>>   target/xtensa/cpu.h      | 2 --
>>   24 files changed, 47 insertions(+), 33 deletions(-)
>>
>> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
>> index 1f200724b6..d596d1b69f 100644
>> --- a/target/alpha/cpu-qom.h
>> +++ b/target/alpha/cpu-qom.h
>> @@ -1,5 +1,5 @@
>>   /*
>> - * QEMU Alpha CPU
>> + * QEMU Alpha CPU QOM header (target agnostic)
>>    *
>>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>>    *
>> @@ -27,6 +27,9 @@
>>   OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
>> +#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>> +#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>> +
>>   /**
>>    * AlphaCPUClass:
>>    * @parent_realize: The parent class' realize handler.
>> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
>> index e2a467ec17..ba0d9e3468 100644
>> --- a/target/alpha/cpu.h
>> +++ b/target/alpha/cpu.h
>> @@ -428,8 +428,6 @@ enum {
>>   void alpha_translate_init(void);
>> -#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>> -#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>   #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>>   void alpha_cpu_list(void);
[...]
