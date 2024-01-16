Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp983375ejf;
        Tue, 16 Jan 2024 08:25:47 -0800 (PST)
X-Received: by 2002:a05:600c:2b0e:b0:40e:4271:69e7 with SMTP id y14-20020a05600c2b0e00b0040e427169e7mr4019418wme.218.1705422347003;
        Tue, 16 Jan 2024 08:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705422346; cv=none;
        d=google.com; s=arc-20160816;
        b=Ac6jqLqD7LTrYVcY3rzvhfWKjAaRXOH6D0D3h5UNuGWZ3pNMqDy5aiH36naSCxGgLN
         W77gPAXXgwRRt4UPpapSB8zhLUleUeTRIgMV/hVs1v6r3ISXHWBC2heOTQ0IpPHDSK0c
         OXzdRmeFoSXYvbHgVNNBDmPt+ZN7cTder7AlnyeymeSk262VbeNb+GDcFLN5xPVUtT/c
         T3AJRAbuHovO4tZQj7ZKvtGYcFZm4CcrT8t7cfJaoZbRSjy4MhIZ1sKvrinvnOkrj0kf
         xKaOGGjyyzhgRiwoHYyCWUknkZ8mzSinULM/qBcYWH7xQHt3gOxTFG/5xKzNKjTmKLTp
         eV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Sb8ewZWwHpfNyDhnqAuVoxp7WG7jOe/slKL1LcWRMgA=;
        fh=h5za0Tuk79K26f0pDBJXjGFMyFjZAtOa3cm3bh485sc=;
        b=Vt8SEXbGIJRobEfC/EgqloztBr0XUA3rE33xd4SuaGHQC+4bcib3tgeqCy5CaGWwZn
         66a02rMHQejiWnzpsDlpTQRsv9fihYRaHEUSvjUFsTFOLtqzVzXcVKTlS7Frmw451brg
         f1nYa9kBVsMF9hshXPNDCtqD8JN5AzQ7wu1T+oH7XqJqjaxHzPHckgcyniPyXOYBnvTc
         CAS9naloTzUq0cajeR836/A1+rvUN+HDdjqGCoCpZM+4lxCwax5piukt3PaGPDRLwQH7
         cXURskZXcvB0gf/jLoP5vQG6FG99c7agii3+ry3eqTyvYzk2LBv9EWih4F2tbchpefYB
         MRfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mpo8bY8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x1-20020a05600c21c100b0040e622ce9b5sor770198wmj.11.2024.01.16.08.25.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jan 2024 08:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mpo8bY8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705422346; x=1706027146; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sb8ewZWwHpfNyDhnqAuVoxp7WG7jOe/slKL1LcWRMgA=;
        b=Mpo8bY8i0uNa47/eD3kPmtu0sC16nj4BlqciegaUzHupt3NdZu+mCgStrWSnxPXeyw
         /TLpBMiTXvNxEJF6mwClT55O4ZiTBzOEvPqB2rchulDPxNYGGAydj9Fni+g3hbdUET9l
         cHT+DKe4odIt6otkRB+pGPP0uBd3BHj6zkknMPQ5PLk2juo2CtehkWP7Snm1DTPC9q30
         xlWR8u1o18Qjp32PTgSJfgfPr1UQJ+K6a900ksjAYDMV5UUQSNTNaydEWsRzaulckOOj
         zutAlyRrkphGNuwnOsMorznvKJ1X+r9xMokHwqgH4x2YgphtXx2XGAXYF3tfUTSJKGJt
         X9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705422346; x=1706027146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sb8ewZWwHpfNyDhnqAuVoxp7WG7jOe/slKL1LcWRMgA=;
        b=V86ItyYtryPB+cG2GI6Pdi+pfwOoSHtuynkhu5VWicP9rM3rqtx0b4Loq3LckFUrMM
         u0WBWlFAOxZBK50+0deklbQFyHeHeojr92BsUvaBv2EKuDTwGtwBhf8oYNTKjO/NXrpH
         sh8J1TfCF3thg7UeEtzjx4Nvcvl9IH6DRvr6kxrG8LIfRjEwA4Vyfgw/qQjBppPOgbPv
         rDau+wvrqljJkJun/CBhXxFogb7CQIhNBuVhxqqOb/CrNBKVa4fTWH1SOSEmzsXrFiux
         DMGAA+MyKgtBWRgERJHKFpBYbyBs5xdjiXOJqkFYYoWL0Tl/vo7W+JLvkHjxyvqL43lJ
         u1Yw==
X-Gm-Message-State: AOJu0Yxj8t6MSAHmo637slxfRbY+t4aZceY98XiFDY3Kl6q35IeTDCu9
	rosSOE1iBtoAv2JQ1tAe/qr5TUvOcnymyZf/
X-Google-Smtp-Source: AGHT+IEd9iSQRr5FpCis06jN1hSBln9tMu7sGM83eRoAmH6A1XUDsRO3hLrvkGmIeRagMBTD2XPoSw==
X-Received: by 2002:a05:600c:5398:b0:40e:62b1:58a5 with SMTP id hg24-20020a05600c539800b0040e62b158a5mr3902845wmb.15.1705422346579;
        Tue, 16 Jan 2024 08:25:46 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.102] ([176.176.156.199])
        by smtp.gmail.com with ESMTPSA id q14-20020a1709060f8e00b00a2a61b9c166sm6639819ejj.33.2024.01.16.08.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 08:25:46 -0800 (PST)
Message-ID: <501c1bfe-fb26-42ab-a925-9888755c72ad@linaro.org>
Date: Tue, 16 Jan 2024 17:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] hw/cpu/arm: Handle 'has_el2/3' properties once in
 MPCore parent
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Anton Johansson <anjo@rev.ng>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20231212162935.42910-1-philmd@linaro.org>
 <20231212162935.42910-15-philmd@linaro.org> <87y1cudyp2.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87y1cudyp2.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: v1Fe0etas2tm

On 12/1/24 22:33, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Move the 'has_el2' and 'has_el3' properties to the abstract
>> QOM parent.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/cpu/cortex_mpcore.h |  5 +++++
>>   hw/arm/exynos4210.c            | 10 ++++++++--
>>   hw/arm/vexpress.c              |  6 ++++++
>>   hw/arm/xilinx_zynq.c           |  6 ++++++
>>   hw/cpu/a15mpcore.c             | 18 ++++++------------
>>   hw/cpu/a9mpcore.c              |  5 +----
>>   hw/cpu/cortex_mpcore.c         |  3 +++
>>   7 files changed, 35 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/hw/cpu/cortex_mpcore.h b/include/hw/cpu/cortex_mpcore.h
>> index 0e7cca9e93..387552468c 100644
>> --- a/include/hw/cpu/cortex_mpcore.h
>> +++ b/include/hw/cpu/cortex_mpcore.h
>> @@ -30,6 +30,8 @@
>>    * QEMU interface:
>>    *  + QOM property "num-cores" which set the number of cores present in
>>    *    the cluster.
>> + *  + QOM properties "cpu-has-el3", "cpu-has-el2" which set whether the CPUs
>> + *    have the exception level features present.
>>    */
>>   #define TYPE_CORTEX_MPCORE_PRIV "cortex_mpcore_priv"
>>   OBJECT_DECLARE_TYPE(CortexMPPrivState, CortexMPPrivClass, CORTEX_MPCORE_PRIV)
>> @@ -53,6 +55,9 @@ struct CortexMPPrivState {
>>   
>>       /* Properties */
>>       uint32_t num_cores;
>> +
>> +    bool cpu_has_el3;
>> +    bool cpu_has_el2;
>>   };


>> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
>> index 9c138f4442..54949314f8 100644
>> --- a/hw/cpu/a9mpcore.c
>> +++ b/hw/cpu/a9mpcore.c
>> @@ -51,7 +51,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>>       SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
>>                    *wdtbusdev;
>>       Error *local_err = NULL;
>> -    bool has_el3;
>>       CPUState *cpu0;
>>       Object *cpuobj;
>>   
>> @@ -86,9 +85,7 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>>       /* Make the GIC's TZ support match the CPUs. We assume that
>>        * either all the CPUs have TZ, or none do.
>>        */
>> -    has_el3 = object_property_find(cpuobj, "has_el3") &&
>> -        object_property_get_bool(cpuobj, "has_el3", &error_abort);
>> -    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
>> +    qdev_prop_set_bit(gicdev, "has-security-extensions", c->cpu_has_el3);
>>   
>>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
>>           return;
>> diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
>> index d7ea633e4e..549b81f708 100644
>> --- a/hw/cpu/cortex_mpcore.c
>> +++ b/hw/cpu/cortex_mpcore.c
>> @@ -27,6 +27,9 @@ static Property cortex_mpcore_priv_properties[] = {
>>       DEFINE_PROP_UINT32("num-cores", CortexMPPrivState, num_cores, 1),
>>       DEFINE_PROP_UINT32("num-cpu", CortexMPPrivState, num_cores, 1), /* alias */
>>   
>> +    DEFINE_PROP_BOOL("cpu-has-el3", CortexMPPrivState, cpu_has_el3, true),
>> +    DEFINE_PROP_BOOL("cpu-has-el2", CortexMPPrivState, cpu_has_el2, false),
> 
> Are we missing setting cpu_has_el2 somewhere else? This^ results in fewer
> cpregs being registered and is what breaks migration.
> 
> You can test with:
> 
> $ (echo "migrate file:migfile"; echo "quit") | ./qemu-system-arm -M ast2600-evb -monitor stdio
> $ ./scripts/analyze-migration.py -f migfile | grep array_len
> 
> Before series:
> $ ./scripts/analyze-migration.py -f migfile | grep array_len
>          "cpreg_vmstate_array_len": "0x0000010a",
>          "cpreg_vmstate_array_len": "0x0000010a",
> 
> After series:
> $ ./scripts/analyze-migration.py -f migfile | grep array_len
>          "cpreg_vmstate_array_len": "0x000000df",
>          "cpreg_vmstate_array_len": "0x000000df",

Thank you Fabiano for helping debugging. Indeed there is a problem
with properties, so this patch is bogus.

The good news is the QOM reparenting happened 2 commits earlier,
so this discarded the doubts on qom-path change possibly affecting
migration :)

Regards,

Phil.
