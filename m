Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp764847lfk;
        Sat, 16 Apr 2022 11:01:35 -0700 (PDT)
X-Received: by 2002:adf:a35c:0:b0:207:aace:b28e with SMTP id d28-20020adfa35c000000b00207aaceb28emr2997754wrb.233.1650132095429;
        Sat, 16 Apr 2022 11:01:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650132095; cv=none;
        d=google.com; s=arc-20160816;
        b=eDLyDo42kU9GW77A5KHv4DwRildhKn3nHXsfxdwEtdJqWHLiHjutP1geUvvVUbWkRo
         w/awBzOyzHWsOOyhoRCjBDV4ftHm+SpGZWheXrLm7tvbFH9t2AeHqygCIpLN8NxekRen
         S1s/yiyg8w85AFRqne583/+jEBxvvXDTAXUTjg96png1gJ6HISufhGbf61FBx/X4LBih
         QailZXXhuEJIe+dvFa9Kz8m65O5/UiyJZHZZWrGJshR2/syYjjrCLtOy1WHUAIDhtwQN
         rHiuNKSY8CJxiJ4lisruiDi5aVpHyqHYa+xwlvdl54QXIOqCSR1OrB5YUuW/Cz82blJt
         xwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZmqhPo1FcCeCvpPfs6MSRsm8aBEqqCnzKwx66WNqKVg=;
        b=zijQuq9kTna16EIr2mewNiSKkCe668jiYsDteLpU/0JIMRbNRXyIPiFQrRmtWDfXG4
         jwoUBq7cFK6ti9JuogCfTUfcYyBQrevx3P4djYWO8a31cvzYrJ2Qj4S2ZbXZX0vASmrA
         U2DADb80U5G0E9KG7nllZP0k5w+MshIHBzuwPB46rfh3b/WIFA0pGGVUhKQs1ubSvifY
         FMtQNTYCONWSYdzzbKCTcjco8rYSJEvxrxyd9SWbXK0eh3bIFL2fYOMXcXkkD5us3ico
         aNnnY1dNUnm0GOLXsy3XwV09hEIBLkB15N+NWvkWGPamHPJ7aTVS/3Pw7Fh5f0jOI89r
         pnAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fon7Ml7n;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m15-20020a7bce0f000000b0038ccb200446sor1404404wmc.43.2022.04.16.11.01.35
        (Google Transport Security);
        Sat, 16 Apr 2022 11:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fon7Ml7n;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZmqhPo1FcCeCvpPfs6MSRsm8aBEqqCnzKwx66WNqKVg=;
        b=Fon7Ml7nu4eawGP6Kuj+naovFFxBbEyzHfwyH74HSJIYQvhJ+QIf6j82J38dXxA08t
         OKYlpEYGWLpmmKohdx6IHf5c65LbInH4+lMQb4zdunGFQXnfQU4ArXLvJ9ZOqHAYJb8T
         Z9jZtZ79eGes/GkIvFDXDwZhEBIy9lgtV1UYxqEnV1fIb1jeek9OREHp4guHo84GMIgy
         JbTXkE7wd5x+GLHTltatitPmqGTKfrZaKxiAKfQabcbXfHr+jZs1QGIcWGGnjPX/k2Ez
         ff4diAuDVsIKwjX7C6GCkOJtiqVtoJNK0fccBW5bOM7IkaCrPXp8OW0jc9zWvo8O/KYz
         lYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZmqhPo1FcCeCvpPfs6MSRsm8aBEqqCnzKwx66WNqKVg=;
        b=OvnSvW86DaNx4vvBXg/zCONfpbBSAHdokMlZNW/tkopeDv2QKzfPTHNdfgKiEBn+98
         xJSIxMxJMfmHHFCgOLZSaap4bHPlWqxNYv0x/ph831aj3zBvTY1FaVcW8jyRwmKPcT4Y
         6Xl2P+0qAuzc+8ENmqw/z+PLlv+pygx/nHAwF7aBTQuunlrgNcO0Kg7MqSo9NOy5R9Qj
         710ny2KqgSSxulM1a9/sRwz8I8j+Hc1F3n4XongKHzG6jtvDM3eCUnBwE2OivJWsjBio
         X3sZo2s6zrTP9RBjShF58II/ujK7gVV4H/UnvnCqmL06YqoDcaeXMN4ZpZ+f+rjDmIL4
         26Ew==
X-Gm-Message-State: AOAM532xPeXHvCcTaoqQ+r8wU6c7gjaXICTaVkW2jIK/vk9uy5HqTEko
	i0aRX0G440PEU1DBZFJarrM=
X-Google-Smtp-Source: ABdhPJyAdSt8Q8/C+quiDAGu1pQFNpcrx7mbgCiO6IU65PdFwFqm8IG7USqIIK6kutWbU5VxKlCQ3A==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id q11-20020a1cf30b000000b0037bb5dec804mr8073958wmq.166.1650132095015;
        Sat, 16 Apr 2022 11:01:35 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from ?IPV6:2600:70ff:f07f:0:a0d5:a739:3557:2461? ([2600:70ff:f07f:0:a0d5:a739:3557:2461])
        by smtp.gmail.com with ESMTPSA id w17-20020a5d6091000000b00207a89b952asm6609561wrt.77.2022.04.16.11.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Apr 2022 11:01:34 -0700 (PDT)
Message-ID: <4908839f-b3bc-f6bc-cf73-bbf91fe37a8d@gmail.com>
Date: Sat, 16 Apr 2022 20:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 08/18] hw/arm/arm_cpus: add arm_cpus device
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
 <20220330125639.201937-9-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330125639.201937-9-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Eaqk8hm96+Gm

On 30/3/22 14:56, Damien Hedde wrote:
> This object can be used to create a group of homogeneous
> arm cpus.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>   include/hw/arm/arm_cpus.h | 45 ++++++++++++++++++++++++++++
>   hw/arm/arm_cpus.c         | 63 +++++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build        |  1 +
>   3 files changed, 109 insertions(+)
>   create mode 100644 include/hw/arm/arm_cpus.h
>   create mode 100644 hw/arm/arm_cpus.c

> +/**
> + * ArmCpusState:
> + * @reset_hivecs: use to initialize cpu's reset-hivecs
> + * @has_el3: use to initialize cpu's has_el3
> + * @has_el2: use to initialize cpu's has_el2
> + * @reset_cbar: use to initialize cpu's reset-cbar
> + */
> +struct ArmCpusState {
> +    CpusState parent_obj;
> +
> +    bool reset_hivecs;
> +    bool has_el3;
> +    bool has_el2;
> +    uint64_t reset_cbar;
> +};
> +
> +/*
> + * arm_cpus_get_cpu:
> + * Helper to get an ArmCpu from the container.
> + */
> +static inline ARMCPU *arm_cpus_get_cpu(ArmCpusState *s, unsigned i)

Maybe we can avoid using 'State' suffix for CPU (still using Class 
suffixes) and name this:

   ARMCPU *arm_cpus_group_get_cpu(ArmCpusGroup *s, unsigned index);
