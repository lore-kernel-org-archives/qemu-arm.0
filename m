Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp761910lfk;
        Sat, 16 Apr 2022 10:52:48 -0700 (PDT)
X-Received: by 2002:adf:e84a:0:b0:207:a697:462c with SMTP id d10-20020adfe84a000000b00207a697462cmr3214790wrn.312.1650131568493;
        Sat, 16 Apr 2022 10:52:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650131568; cv=none;
        d=google.com; s=arc-20160816;
        b=jOpGIbuupJ0ACQJ2L9dhqffSHnGETanCr8p4ITDQlXrv+71sbew2o+/CyfyrPUOdYj
         zEqbaIvu6bcrAVrFOOJ++p+5q+0U3C6avh2do1QpF0yr/9h4eimUnXoi1vqoStNZceTj
         ngbER1mAM/JVsIbn3xWKAciyZMOOeMhzEDI5WR4sAKj3G6EzhmRZ0Up6rDXsOvZ08pg+
         bGUf5jN6SU1qYTaRsOkl1p3paogm4uPCT0/5r6YHBdL2OkGC06T2sqEXlF71uK4eIXY6
         9dGCM8ogFWV8yGfGq55ieoyldyEn/NecysoEnYffYUu0KJh5AMffL0uEqjxT1EudwKIt
         /OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Rh7wu6SuBdKMEqLT4CtvggJiEYOfdM+h6YoISZ8ANO4=;
        b=hNEP9lS5n2uWxXv0PaXvr8iLTy3084uWHFwpV1rldFVdpCv7p1xRdjwUJgkl2L+Kak
         0V5tlZCvHcLZPWAqfMS8nI0LLOjSUySY3P57Tw6gjiHtoCfgx9qPRkp0DgOiZfWKMQpe
         2DFNTaeJuYH9RgpN/ReeeaP685NAy9fktwEz1EiA7YbjIvJdsR9xQkTbk0azSs5D2k0/
         bcWsxBX6iqxLp4f97HS9feW7lkvwIJO6bG2tkJI7j++46VmhO2c962hxP443EbTZ7h52
         hE/X/HJ2zcTnlMzGxmTw2Z1rto6OpIYpgT/QjnrhZ5Inphviy1uhzx8/wm/N2JldIwpI
         qJkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJjCyeWc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1-20020a05600c4e0100b00389cf31fdafsor1452265wmq.38.2022.04.16.10.52.47
        (Google Transport Security);
        Sat, 16 Apr 2022 10:52:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qJjCyeWc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rh7wu6SuBdKMEqLT4CtvggJiEYOfdM+h6YoISZ8ANO4=;
        b=qJjCyeWcGHOXZHksgcmSM5bnuIev7EQf6HyaDLhIxYyyZOei9bcKRe/ddso+nNmXcY
         oJtsD7N6CX1SS+69FkCbwf+MkU0O0mSvu9KXrpvDEWQJTAYnq1UUF/xYhKyr7jCK03vh
         AhReWm0f0qQYO7VXMVrapoNyVvOw+aKTSTh6pmTd19W/8IvQW38mDUQ5YDiH9unLls90
         fNhvn/DeYz0DjlKwK2p+RJo/NPpPKr2WiedBq3He0Yga3upazBZWPSSCkGa8FuBcfqsu
         F9CxDq/OXE5ZeqgHmYjMjXrMtZBroJzqhjDiyUOELV47opj/ENnIyxlz58PUm5gbBus2
         zcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rh7wu6SuBdKMEqLT4CtvggJiEYOfdM+h6YoISZ8ANO4=;
        b=UenFoDo3P+0xQQYhWnFmJWq6tUCIt0luk9meV/oAsbxOHrumoqtQ1haVm3Jsp3kL7j
         9xt39snfCjAwOlgeIOIA5NhDbgZLgUNcr6lXk0Ow0pSKnCSaa+ZdM1UVOAZ9wEPM3XU1
         eYH2DITCsMc21/5kAtQiBWMKFR14gBJglRYCpg0uwgKWD496YDpF8pVbXh7w3rx2uK6l
         PJ6s4gcHebRYudNuUJ/NYwXTaexR4qVtcWFAWvU3+xGjRAg7FBPMMsNurWTSw8tYceWt
         N2b+Q4rmhCLeEZPWD9JtFHFedEbDEfLkb03lmuY6JKsKIsBdyEAs2nCXH3GUh2WjIum2
         c7VQ==
X-Gm-Message-State: AOAM5304+f+QBHSAPUuvTBOGTf0Pi49NO7xnyrSacqDgzoabnPRpxix2
	z+ldCe3AEWlGH3hLKlmoyZUVtsh5LJQ=
X-Google-Smtp-Source: ABdhPJxodTFxR6dDYJTd1i/a05IB/z+PLB2fGRfJp5/+HkWl/aAHTIGvjLBpjU/7uDeO6m/RPEyBfA==
X-Received: by 2002:a05:600c:1d8a:b0:38e:d10d:1a89 with SMTP id p10-20020a05600c1d8a00b0038ed10d1a89mr8276028wms.5.1650131567465;
        Sat, 16 Apr 2022 10:52:47 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461? ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
        by smtp.gmail.com with ESMTPSA id e1-20020a05600c4e4100b00392910b276esm338652wmq.9.2022.04.16.10.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 10:52:46 -0700 (PDT)
Message-ID: <2ded9132-c2b5-c428-6554-98c71b50e8bb@gmail.com>
Date: Sat, 16 Apr 2022 19:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 02/18] hw/cpu/cpus: introduce _cpus_ device
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bin.meng@windriver.com>, Vijai Kumar K <vijai@behindbytes.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
 <20220330125639.201937-3-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-3-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +v4E6sazezwl

On 30/3/22 14:56, Damien Hedde wrote:
> This object will be a _cpu-cluster_ generalization and
> is meant to allow create cpus of the same type.
> 
> The main goal is that this object, on contrary to _cpu-cluster-_,
> can be used to dynamically create cpus: it does not rely on
> external code to populate the object with cpus.
> 
> Allowing the user to create a cpu cluster and each _cpu_
> separately would be hard because of the following reasons:
> + cpu reset need to be handled
> + instantiation and realize of cpu-cluster and the cpus
>    are interleaved
> + cpu cluster must contains only identical cpus and it seems
>    difficult to check that at runtime.
> Therefore we add a new type solving all this constraints.
> 
> _cpu-cluster_ will be updated to inherit from this class
> in following commits.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/cpu/cpus.h |  71 +++++++++++++++++++++++
>   hw/cpu/cpus.c         | 127 ++++++++++++++++++++++++++++++++++++++++++
>   hw/cpu/meson.build    |   2 +-
>   3 files changed, 199 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/cpu/cpus.h
>   create mode 100644 hw/cpu/cpus.c
> 
> diff --git a/include/hw/cpu/cpus.h b/include/hw/cpu/cpus.h
> new file mode 100644
> index 0000000000..c65f568ef8
> --- /dev/null
> +++ b/include/hw/cpu/cpus.h
> @@ -0,0 +1,71 @@
> +/*
> + * QEMU CPUs type
> + *
> + * Copyright (c) 2022 GreenSocs
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef HW_CPU_CPUS_H
> +#define HW_CPU_CPUS_H
> +
> +#include "qemu/typedefs.h"
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +/*
> + * This object represent several CPUs which are all identical.

Typo "represents".

> + *
> + * If CPUs are not identical (for example, Cortex-A53 and Cortex-A57 CPUs in an
> + * Arm big.LITTLE system) they should be in different groups. If the CPUs do
> + * not have the same view of memory (for example the main CPU and a management
> + * controller processor) they should be in different groups.

This description calls for a clearer CpusGroupState name instead
of CpusState (which confuses me with CPUState). Alternatively
CpusArrayState.

> + *
> + * This is an abstract class, subclasses are supposed to be created on
> + * per-architecture basis to handle the specifics of the cpu architecture.
> + * Subclasses are meant to be user-creatable (for cold-plug).
> + */
> +
> +#define TYPE_CPUS "cpus"
> +OBJECT_DECLARE_TYPE(CpusState, CpusClass, CPUS)
> +
> +/**
> + * CpusState:
> + * @cpu_type: The type of cpu.
> + * @topology.cpus: The number of cpus in this group.
> + *      Explicity put this field into a topology structure in
> + *      order to eventually update this smoothly with a full
> + *      CpuTopology structure in the future.
> + * @cpus: Array of pointer to cpu objects.
> + */
> +struct CpusState {
> +    /*< private >*/
> +    DeviceState parent_obj;
> +
> +    /*< public >*/
> +    char *cpu_type;
> +    struct {
> +        uint16_t cpus;
> +    } topology;
> +    CPUState **cpus;
> +};
