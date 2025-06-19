Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp397705njc;
        Thu, 19 Jun 2025 10:07:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKnTrFHlhI0N0IECChsWPjJxd5eBOABswWNXFLl/M9jgQI5j5U8blPsA6TR013IUfGV2s9IgSnq4G/rQ==@linaro.org
X-Received: by 2002:a05:6a00:cc8:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-7489ce45c6amr29339855b3a.6.1750352835910;
        Thu, 19 Jun 2025 10:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750352835; cv=none;
        d=google.com; s=arc-20240605;
        b=jgmoBe7+HmQfrYDyl3fo1x5NpCtEPEQx8xiwUIQv+SbXgHdv1Defxe1TSiJZie2E9v
         l/0QJF2J9/yWQSTp8Zz7McIbVINLhMt459jxg8CFJPlIF0YYRNJdSg9Ozte4zfTOk7jm
         USl63ytbTV0HgdARWPqtTU/sSaUwemWB+eJtq8uS0qzMvIeqyqQeCYqIhDgnrOk0or+e
         QwqUxo56wfrnbkkdR4lXCi+J2f13egKLOriMlzaq42YyG64897deG4VAM/6rEKlLkB3U
         tjbkOZ/sCY0o+s8hOoEXcoYBt9ScMuZCIr1ScEuRUWmTfRjHGfXfy7S+EDYKNO4pO9p1
         sZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Jll/2OF16vBpj1RgCeTtn0mBj/Ho38D8H1rIBCC+nOs=;
        fh=otv5dBFKSCLeFNWYN7Zzp4Hkpqaw4Xpzk4kG5Q5wCmk=;
        b=i9MkP8ivOGNTreYWLbrB80yDGVkPH5nXnefOHbkTG5LBowDXvRlewm0mZDGUk3PpD5
         F6ZHb4qwjvb/xRNQ+NXCdXLRbEEgaoKXfbMJ6cP7qZ03B1M6K0g4uGG8Njf411XIC1DE
         Lb4Fuevk1+rThGz6x7nlP2vHauY3pNwSf5EKIQJFvCt/Ki2etxV4LLEo+v6edLuPHbEY
         w1+BRHRc1l2JEn2bXn+eBogs9hqRYDiYEGEYXJxWlYMFWM3mZRyr5nMx5EzfDRITLAnH
         aMOllt0EliMWgozL+3Zk7/jLxPc0ccAImnukVKWE2Z+voVn+k2ZsBPdp8xOHvt9rV4Yo
         Pp+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBbwWx3b;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a451044sor172129b3a.4.2025.06.19.10.07.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 10:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oBbwWx3b;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750352835; x=1750957635; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jll/2OF16vBpj1RgCeTtn0mBj/Ho38D8H1rIBCC+nOs=;
        b=oBbwWx3b+Jc3sa5KMFRYeYxsPeROU+kALN8MysTbPULtnKorg9DjIOdy6IiuGPUWoa
         98rd6whxAS5MtlVFwNxOeCPUDrLA37WTVL6Ed6U9VJ33Hm4ccSJQkKxrdo3FXZX9fIHH
         A5tzly+4hEga7FLrZtOARSDGIebh+2faAh5frdejsZdVYiStyinUArEqrRnFa/qZ4uZl
         +6EXzin1matXua66CRNHkNr3a4eRyNgxoIoI2swoAsUAT5WWOsvFRyI5lgR88lRNwNAQ
         B9YxNgsbiS6Bv80h3PpgjZCjQYzOPjIPGc/DRB0Ek8cYeMM99qSzGLMsQu3IwDeirHx/
         ckuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352835; x=1750957635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jll/2OF16vBpj1RgCeTtn0mBj/Ho38D8H1rIBCC+nOs=;
        b=eMmBRyyAbVKZUpCWHmjP/Szl2HAHfIOBqN64MuxIA5px0kL5KssGBIO5fT5QhImj5+
         XUGfS0Fcrx5nWTRke8x9iMWlTcBnqii6BuqLLjrt0RKwaWTYmqz9+h6w3GnVQo6nOKKT
         bxKywKkzfa2RI6pN6RJBsWFeTMfbNAejO9ynVqr977xafp2qg9FmrwTfZqrulAoaDwOD
         njlb/s+CXmVHG0Al9tDx4A1Lysmyf4C6+3q5VjKA8kd62dwNilyhdMqashSJiUhRdt9F
         CK6zO/9VxvhgragclW8X8iUMll/MEek9rd85iEJV5pSUu2DFOdN1YVufmScCbCllvCCB
         gFtA==
X-Forwarded-Encrypted: i=1; AJvYcCWDRpPWKC+YfHhc5SrtwarGIs6sVvAMvoNKQlaiEiOVjQvx43gUo7EaclRzRtXCEex8jpo8+aJNz4Momg==@linaro.org
X-Gm-Message-State: AOJu0YwyjKzt3Y2A3ojg0AiLKYzPyEpo9X3FpNGkl7Zu7DDMxIgN9m/8
	8f6vHGjmI6EMARg2wXd5WPe6qRyHC0FydCrrU25WuIPb1UtDMmBppbBImV5/erSDBPAWkQ==
X-Gm-Gg: ASbGncvFJ57z52STRjkjhKOkOVhYofJMPDD9E5puv+PmsD3/Svd9F4e4bQUzXsn6t0f
	RHy8frTiD9EH1Z7gViz1Xcsu5DQNDKQ1z9GPNPWb2jxXoDkiHA1m5xglcYw58uV99e7MPe4LYd9
	yPhHblKlCn05s6QLaGt848Sk7yWyKMyGNqYIoptUKjGNAX+Awjo4suXRqrvIx6Xz5PrNB51Gs/r
	qYmm3eRwbBKhY6GtAlu4SoGWvB9X8QHVLQ0FrhwSI+XEodKifuZA5EU/lDwLBslKyROGNowTIGe
	EtVn+fBb8nAbqouQM4VplL8abew5MRCJ/hWuzSitu+wcKtE0Xr+C5E7SEYTCIHpgEp6cFzIQ6Q=
	=
X-Google-Smtp-Source: AGHT+IEcQD+iM5dzT1mlqtovayUFGR9kigzcwB+Npw7tH3Lxerm48HzH0/niYYRWnfq99fe88FvJMw==
X-Received: by 2002:a05:6a20:e609:b0:216:1ea0:a526 with SMTP id adf61e73a8af0-21fbd5ddde0mr38311580637.40.1750352835306;
        Thu, 19 Jun 2025 10:07:15 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64be0asm250750b3a.126.2025.06.19.10.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 10:07:14 -0700 (PDT)
Message-ID: <53c901c4-f408-43f6-a9aa-49f8fed59e98@linaro.org>
Date: Thu, 19 Jun 2025 14:07:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] hw/arm/virt-acpi-build: Fix comment in build_iort
To: eric.auger@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org,
 mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-5-gustavo.romero@linaro.org>
 <db5aa1ab-cec7-4de1-b14f-bba978e7d7f7@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <db5aa1ab-cec7-4de1-b14f-bba978e7d7f7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: s4eFwSMUMUDP

Hi Eric,

On 6/17/25 10:22, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/16/25 3:18 PM, Gustavo Romero wrote:
>> The comment about the mapping from SMMU to ITS is incorrect and it reads
>> "RC -> ITS". The code in question actually maps SMMU -> ITS, so the
>> mapping in question is not direct. The direct mapping, i.e., RC -> ITS,
>> is handled a bit further down in the code, in the else block, and we
>> take the opportunity to update that as well, adding "RC -> ITS" to the
>> text so it's easier to see it's the direct map to the ITS Group node.
>>
>> Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 9eee284c80..6990bce3bb 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -407,23 +407,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>           AcpiIortIdMapping *range;
>>   
>> -        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
>> +        /* Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3. */
> yes this is what the code builds at this location.
>>           for (i = 0; i < smmu_idmaps->len; i++) {
>>               range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> -            /* output IORT node is the smmuv3 node */
>> +            /* Output IORT node is the SMMUv3 node. */
>>               build_iort_id_mapping(table_data, range->input_base,
>>                                     range->id_count, smmu_offset);
>>           }
>>   
>> -        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
>> +        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
> But here I am confused. To me the its_idmaps matches the idmap between
> RC and ITS. I understand this is built from holes left by bypassed
> buses. See the build_iort() implementation. The comment at

ah, thanks! I see. Indeed, it's mapping the RC -> ITS, not the SMMU -> ITS.
I'll fix it in v5.

One thing that confused me, which I think is actually ok, is that the
output ID range from SMMU 0x000-0xFFFF) overlaps the output ID range
from the RC (e.g. 0x100-0xFFFF) because the SMMU output range is defined as
always taking the whole 16-bit range in:

[...]
    366         build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
    367         build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
    368         build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
    369         build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
    370         /* DeviceID mapping index (ignored since interrupts are GSIV based) */
    371         build_append_int_noprefix(table_data, 0, 4);
    372
    373         /* output IORT node is the ITS group node (the first node) */
    374         build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET); <=========== HERE
    375     }
    376
    377     /* Table 17 Root Complex Node */


I think that's ok since ITS can disambiguate the Device IDs from SMMU and from RC.


>          /*
>           * Split the whole RIDs by mapping from RC to SMMU,
>           * build the ID mapping from RC to ITS directly.
>           */
>          for (i = 0; i < smmu_idmaps->len; i++) {
>              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> 
>              if (next_range.input_base < idmap->input_base) {
>                  next_range.id_count = idmap->input_base -
> next_range.input_base;
>                  g_array_append_val(its_idmaps, next_range);
>              }
> 
>              next_range.input_base = idmap->input_base + idmap->id_count;
>          }
> 
> is not crystal clear but it looks like filling the holes into its_idmap.

k, I'll create a helper as you suggested in 7/8 to populate the its_idmaps.

  > Besides there is another "Its group" instance to be replaced by ITS Group

Pardon, what do you mean? Another text to be replaced or it's just a comment
about the "else" block when smmu is off?

Thanks!


Cheers,
Gustavo

> Eric
> 
>>           for (i = 0; i < its_idmaps->len; i++) {
>>               range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>> -            /* output IORT node is the ITS group node (the first node) */
>> +            /* Output IORT node is the ITS Group node (the first node). */
>>               build_iort_id_mapping(table_data, range->input_base,
>>                                     range->id_count, IORT_NODE_OFFSET);
>>           }
>>       } else {
>> -        /* output IORT node is the ITS group node (the first node) */
>> +        /*
>> +         * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
>> +         * nodes: RC -> ITS.
>> +         * Output IORT node is the ITS Group node (the first node).
>> +         */
>>           build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>>       }
>>   
> 
