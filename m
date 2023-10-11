Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp621712ejr;
        Tue, 10 Oct 2023 23:13:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMyAwqvDVhCulPLi3nTy4Hhsv4+tE0Tquq/RO9iVYh4aEYKlQLii0OQXU5h/8oV+ektMYJ
X-Received: by 2002:a05:6a21:7989:b0:171:a2df:4e68 with SMTP id bh9-20020a056a21798900b00171a2df4e68mr4914197pzc.36.1697004830769;
        Tue, 10 Oct 2023 23:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697004830; cv=none;
        d=google.com; s=arc-20160816;
        b=yr7Mxc9JxK68CcdldT5nrfulxThDiZMoJkhhYLsh+GXYB0LuQc0a+GysdWB+5nULkJ
         wmjKcEpdmA+qHJLOEwyjzXOyatAxRTSB+Nj9N+mdHNYbiZqqvN4uqTvsHlnws2P5cxXS
         dcpcOSARNKuqNl5XMkTuree0ffosrVn6oBa0rCHGCf7ugIaWWI7jLvPhXcQzjITiB+8F
         wJpfCsnFKM177AurGxkn33IoHnS0gCwN35t0avl3HdHynVjSgpD9nFvNQB3C5gq3BCFV
         4tzlIS4olW1JkBrBgW/NBQJQBbZ9uQ4WUOGHMuTfN30rJpYi0jwakdNe6fqkGWgxMldm
         g4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=+II0w00pAz3qbVLqeK/fQSXHnKJhhIaktnyVxC5Zawg=;
        fh=F0DVeRWf0UPOleYXVju89QoGcoXjEr3rthOZrc/74Yk=;
        b=ynf+OqPf6c/PazzrNZkjex7OYAHFBA+0pCSxDR3DmaaeTGdOgeZGpxvljnDKtHlwpb
         sfW2u0gjihkr18A1NzNMp7iaiXY2YArNrQZ1QnfGUfA5JVLffR/AdFWqznol5pO6qUSk
         gH6XhBrigFuD1FR/EO+DI4wvQnIMcCc/nVlYC5eipMDz8naII4yZm8T0gYNU8XjB4Lms
         lhzwiJz0xgiKssr8YzxcB4ouO1G1jPDmN24WrBNs6W8mHCyIPl8uSSuQfCuyTbfr6I9U
         R3gVM8vEQXp4J4HqEAdKKhsyBeSihslSdv4rczoIJQakjZV2neMi3bgTLhzvnSy8qPc8
         kF+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhiwei_liu@linux.alibaba.com designates 115.124.30.119 as permitted sender) smtp.mailfrom=zhiwei_liu@linux.alibaba.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Return-Path: <zhiwei_liu@linux.alibaba.com>
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com. [115.124.30.119])
        by mx.google.com with ESMTPS id z1-20020a170903018100b001c5f80bf574si12713054plg.487.2023.10.10.23.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 23:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhiwei_liu@linux.alibaba.com designates 115.124.30.119 as permitted sender) client-ip=115.124.30.119;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of zhiwei_liu@linux.alibaba.com designates 115.124.30.119 as permitted sender) smtp.mailfrom=zhiwei_liu@linux.alibaba.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R771e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=zhiwei_liu@linux.alibaba.com;NM=1;PH=DS;RN=47;SR=0;TI=SMTPD_---0VtvF12m_1697004820;
Received: from 30.221.100.88(mailfrom:zhiwei_liu@linux.alibaba.com fp:SMTPD_---0VtvF12m_1697004820)
          by smtp.aliyun-inc.com;
          Wed, 11 Oct 2023 14:13:42 +0800
Message-ID: <c8bcb233-62a8-4ce3-a08d-1da49d896c86@linux.alibaba.com>
Date: Wed, 11 Oct 2023 14:12:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] target: Declare FOO_CPU_TYPE_NAME/SUFFIX in
 'cpu-qom.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gavin Shan <gshan@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Brian Cain <bcain@quicinc.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
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
 <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <f8b3cb2c-8e80-19e4-d59f-2ccacff0a413@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fJBnERqA9hA2


On 2023/10/11 11:21, Philippe Mathieu-Daudé wrote:
> Hi Zhiwei,
>
> On 11/10/23 04:51, LIU Zhiwei wrote:
>>
>> On 2023/10/10 17:28, Philippe Mathieu-Daudé wrote:
>>> Hegerogeneous code needs access to the FOO_CPU_TYPE_NAME()
>>> macro to resolve target CPU types.
>>
>> Hi Philippe,
>>
>> I don't understand why should we use FOO_CPU_TYPE_NAME macro to 
>> resolve target CPU types? In my opinion, we should pass the
>> CPU typename from command line for heterogeneous case.
>>
>> Could you make it clearer how should we use FOO_CPU_TYPE_NAME macro 
>> to resolve target CPU types in heterogeneous case?
>
> To be honest I start to feel a bit lost with the "cpu
> resolving type" design.
>
> We are not quite there yet to "create from command line"
> or "create from QMP", so I'm prototyping in plain C.
> One of my test is:
>
>   #include "target/arm/cpu-qom.h"
>   #include "target/hexagon/cpu-qom.h"
>   ...
>
>   static void
>   my_machine3_init((MachineState *machine)
>   {
>     CPUState cpu[2];
>     ...
>
>     cpu[0] = CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a72")));
>     cpu[1] = CPU(object_new(HEXAGON_CPU_TYPE_NAME("v68")));
>     ...
>   }
>
> The machine code need access to the per-target
> FOO_CPU_TYPE_NAME() macros. 

I see what you mean. It works if we will pass the cpu model instead of 
cpu typename to the machine state(Not yet).

Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> I'm not sure what each macro
> expands to is considered stable, so IIUC I can't inline and use:
>
>     cpu[0] = CPU(object_new("cortex-a72-arm-cpu"));
>     cpu[1] = CPU(object_new("v68"-hexagon-cpu));
>
> That said, maybe I'm mistaken.
>
> Kinda related discussion with Gavin/Igor:
> https://lore.kernel.org/qemu-devel/35653f53-a977-02ea-28f6-6fe85b1efd5a@redhat.com/ 
>
> (related to 
> https://lore.kernel.org/qemu-devel/20230907003553.1636896-1-gshan@redhat.com/).
>
>>
>> Thanks,
>> Zhiwei
>>
>>> Move the declaration
>>> (along with the required FOO_CPU_TYPE_SUFFIX) to "cpu-qom.h".
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   target/alpha/cpu-qom.h   | 5 ++++-
>>>   target/alpha/cpu.h       | 2 --
>>>   target/avr/cpu-qom.h     | 5 ++++-
>>>   target/avr/cpu.h         | 2 --
>>>   target/cris/cpu-qom.h    | 5 ++++-
>>>   target/cris/cpu.h        | 2 --
>>>   target/i386/cpu-qom.h    | 3 +++
>>>   target/i386/cpu.h        | 2 --
>>>   target/m68k/cpu-qom.h    | 5 ++++-
>>>   target/m68k/cpu.h        | 2 --
>>>   target/mips/cpu-qom.h    | 3 +++
>>>   target/mips/cpu.h        | 2 --
>>>   target/rx/cpu-qom.h      | 5 ++++-
>>>   target/rx/cpu.h          | 2 --
>>>   target/s390x/cpu-qom.h   | 5 ++++-
>>>   target/s390x/cpu.h       | 2 --
>>>   target/sh4/cpu-qom.h     | 5 ++++-
>>>   target/sh4/cpu.h         | 2 --
>>>   target/sparc/cpu-qom.h   | 5 ++++-
>>>   target/sparc/cpu.h       | 2 --
>>>   target/tricore/cpu-qom.h | 5 +++++
>>>   target/tricore/cpu.h     | 2 --
>>>   target/xtensa/cpu-qom.h  | 5 ++++-
>>>   target/xtensa/cpu.h      | 2 --
>>>   24 files changed, 47 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
>>> index 1f200724b6..d596d1b69f 100644
>>> --- a/target/alpha/cpu-qom.h
>>> +++ b/target/alpha/cpu-qom.h
>>> @@ -1,5 +1,5 @@
>>>   /*
>>> - * QEMU Alpha CPU
>>> + * QEMU Alpha CPU QOM header (target agnostic)
>>>    *
>>>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>>>    *
>>> @@ -27,6 +27,9 @@
>>>   OBJECT_DECLARE_CPU_TYPE(AlphaCPU, AlphaCPUClass, ALPHA_CPU)
>>> +#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>>> +#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>> +
>>>   /**
>>>    * AlphaCPUClass:
>>>    * @parent_realize: The parent class' realize handler.
>>> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
>>> index e2a467ec17..ba0d9e3468 100644
>>> --- a/target/alpha/cpu.h
>>> +++ b/target/alpha/cpu.h
>>> @@ -428,8 +428,6 @@ enum {
>>>   void alpha_translate_init(void);
>>> -#define ALPHA_CPU_TYPE_SUFFIX "-" TYPE_ALPHA_CPU
>>> -#define ALPHA_CPU_TYPE_NAME(model) model ALPHA_CPU_TYPE_SUFFIX
>>>   #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>>>   void alpha_cpu_list(void);
> [...]
