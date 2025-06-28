Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1644448dye;
        Sat, 28 Jun 2025 12:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV380drGa0FASVD7r9UONbTuEW3yFFFbzgVPZA1sXwWIkwBi0Lb+XcgaEahoT6ZDaVZ8IYdTR/R7jVWHw==@linaro.org
X-Received: by 2002:a05:620a:46a0:b0:7d3:9012:75d7 with SMTP id af79cd13be357-7d443976abfmr1245719985a.43.1751139774309;
        Sat, 28 Jun 2025 12:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751139774; cv=none;
        d=google.com; s=arc-20240605;
        b=bMeNlbNjhztyp+DauSqnf6VhaAPmJ+L20D8jOyZEbhE0nVnXJBl4BwbsAe6kstZ4dm
         /S9VyADC0oBhZD0wQf3Z/cfDhENNfcbDhlbXXzH4UEElTgopfKEL/rHQWkwrxOh05CCX
         IJ+/nlUTqwnCZPyk8H1i1A2zWYjHb1jOA3H6byGKkUAPR7nIxFFWYVkQtsiZ5Bd1Kis6
         YWZBqkZvO/kxUCfVsFqMY5vOlpktEvV8baDS5atb46VYj+dA86L3Vfu9EZhWTYUzX4mp
         gcFgZthChigW1ypC9x9Mp0oE7zVc7SgEI8V32/RiekUkCaRI3R32ggxGnKPP/M3V85UE
         t1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8cFAKCpZ94rojrIIQVS0isZGEm4RULTPYcXzNgvCux4=;
        fh=4RKG1YgBwIlmNJjpasM8fje3KweVf5IaexvTG7R+NZU=;
        b=W423LK+rZOcORXcZn6KocEmHLIhk9iq1htFb41j2Y4SC1xee6OAkvVJ+yi5zUnlcMv
         GBKq61eatTTe49kZMmLrrBJ7IH2iLiT9XOaYG68OPy0Y2IsguLY3gZdLNcWF1J8M984/
         pLPvuvufbeHDqcw8Q7FgM2LQ0XX1tv2cvDPuHpmMA2y6SuLQv5ivTkBV4ZQeMqAlneod
         Lbcv/9oxxrCBSNDvtDQQFI8YV7viLCae3ROcsIMecNXOxuWR3ugdwXltmhI+htI/0udK
         1DYebZNkT1d/tD06P3w+74rJ6HFO6NXZ0sjGAA/a26jvl+cHSg7fZ+wTJJRDB/1oVUAr
         d0oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIrSFzbi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d44316dbb3sor484280285a.7.2025.06.28.12.42.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SIrSFzbi;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751139774; x=1751744574; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8cFAKCpZ94rojrIIQVS0isZGEm4RULTPYcXzNgvCux4=;
        b=SIrSFzbizaolAQ46JQdsaa2der3cPE8h9R9WsAetQD8GiZBT2EEC3eL8cUhlUGdlkv
         MyWC7Y0xRfyBXeyLWFHCgY1BHom1ijVcLSOTjiWqCsSwxVSnA0A7c71//wJ+OUH0a78c
         Skqz6czaOZa6G9IPuY6SFE5UjthQQ43ufDij069rRibMPg9GN/se+JRtLd5DZSHYoNwm
         ATXiRF6M6Zybjz/IWlPiiuv8bxOEJuZ7aIExkR0LR2Q9yP619eXeRAHPVY8LTlHILetq
         qCYpU0IHkVDx9H4ak9lgeSuVWUb/Ug9iK4IaBllflJnKak+Yk1tRa6SBa3qEKju7WlaB
         nNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751139774; x=1751744574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8cFAKCpZ94rojrIIQVS0isZGEm4RULTPYcXzNgvCux4=;
        b=Yn143yst/jg/G5YnpPQUyj742hsRODrtzWWg/ztQM2fUmHyE0ZllrSl0mTs/JoicYg
         U/O5BWTt4gsYD/VRRWtxCAhSeEn5oThGj/CZJSmMmooMltgyo50M37CjVwCNpHPKLhgM
         xHtCQlvDlHz6uMoPiYVt5EGIVw5LfDcXKvsv1sd9uO8ssWcu2RyzNUZP9KPLf7VOLVSm
         wUTbiFp3r2FGRPprnzDVJVkODZTE1ZKsdDmT/I56y6jgKNzXjx/qDZ28jqMj+AIdkbTA
         zpPSTiLO95tdz3YUppHRcB0uMHqSUQeOQ2abilTGbmgACdJqN9MJViUBaXS0ZIaqaL33
         wi6w==
X-Forwarded-Encrypted: i=1; AJvYcCUetDf5IO1DDyb8/UdyDs4+eqRKX1KViMwKeYr8BXV2PPfOFDySs5P/hf2qg5t7gE7w/xWUYYr8Mk4uqg==@linaro.org
X-Gm-Message-State: AOJu0YyMT6AW+d43ZBZ0JC8+l1EEI8L8gQaeb6SZCfUSKfO+jwXvQS8A
	zcw+HKsgK5ULBzW0okrHfcISdZDBU+Dw+2nHJurh/tXdNrnzDi0YmlhxTFO8ZGFE3tmcuA==
X-Gm-Gg: ASbGncv+3MpeHb02eCNNh05WJPsUc5rVyyNWVG4wEH3DtYZFOB8yW+tGQHigWnUAtdr
	MgNk2Fz95JlbC4KzDYGCKJVGkQTpER1QmjwSN/2ea3wV0T2MlBkNACEs4zXmBj9GOmezy1/aMw7
	nsfkmY6RMScNs3hw0uaKwDgBvr1sjJ0FTAFe2U3bmgSRsntTBaCHCq9ZiNgA0A54x48xoRT0EgT
	M02RD2RFefJED7IL9gM3o7ld/V0jtHnOl3uPK4DEpfKyZ+rWiuZnBBoEZ1UA2LYYKjFMPe3shRh
	FKNJvE8rFHOVvayTb9F+Rdde+xj0SpuDc0Yjt3jquM14vToXPuW9eWXbLtV+5IgC8n3XcayIJg=
	=
X-Google-Smtp-Source: AGHT+IGCD8YQkKPEdVLSn9wkzwZ4R76YUA1qFX8wuyOw2+qymxi3ua1KPj4FOUQVqo/GNFqhxWSsRg==
X-Received: by 2002:a05:620a:444b:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d443906621mr1102945885a.13.1751139773786;
        Sat, 28 Jun 2025 12:42:53 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443204c00sm335321385a.74.2025.06.28.12.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 12:42:53 -0700 (PDT)
Message-ID: <875034d4-c891-44db-bb09-0036ce932118@linaro.org>
Date: Sat, 28 Jun 2025 16:43:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] hw/arm/virt-acpi-build: Factor out
 create_its_idmaps
To: eric.auger@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org,
 mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-6-gustavo.romero@linaro.org>
 <6990669d-7750-4f30-a11f-6ac06ffb266c@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <6990669d-7750-4f30-a11f-6ac06ffb266c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sCHTI2ZAGFaC

Hi Eric,

Thanks a lot for another round of reviews :)

On 6/27/25 12:28, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/23/25 3:57 PM, Gustavo Romero wrote:
>> Factor out a new function, create_its_idmaps(), from the current
> I would call it build_rc_its_idmap() to be clearer on what relationship
> we build.
>> build_iort code. Add proper comments to it clarifying how the ID ranges
>> that go directly to the ITS Group node are computed based on the ones
>> that go to the SMMU node.
>>
>> Suggested-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++---------------
>>   1 file changed, 41 insertions(+), 23 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index e9cd3fb351..40a782a498 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -266,6 +266,42 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>>       return idmap_a->input_base - idmap_b->input_base;
>>   }
>>   
>> +/* Compute ID ranges (RIDs) from RC that do directly to the ITS Group node */
> s/do/go
> Ior use the spec terminology: that are directed to the ITS Group node

Thanks, I stuck to "directed to" in v6.


>> +static void create_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
>> +{
>> +    AcpiIortIdMapping *idmap;
>> +    AcpiIortIdMapping next_range = {0};
>> +
>> +    /*
>> +     * Based on the RID ranges that go to the SMMU, determine the bypassed RID
> same here
>> +     * ranges, i.e., the ones that go directly to the ITS Group node, by
>> +     * subtracting the SMMU-bound ranges from the full RID range, 0x0000–0xFFFF.
> substracting

I believe that "subtracting" is the correct form (but I'm not a native English speaker, of course).
It seems the "substract" is sometimes used in ancient texts and I do see them occurring in the
commit messages, but they occur much less frequently than "subtract":

gromero@gromero0:/mnt/git/qemu_/build$ git log | grep substract | wc -l
13
gromero@gromero0:/mnt/git/qemu_/build$ git log | grep subtract | wc -l
188


Cheers,
Gustavo

>> +     */
>> +     for (int i = 0; i < smmu_idmaps->len; i++) {
>> +        idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> +
>> +        if (next_range.input_base < idmap->input_base) {
>> +            next_range.id_count = idmap->input_base - next_range.input_base;
>> +            g_array_append_val(its_idmaps, next_range);
>> +        }
>> +
>> +        next_range.input_base = idmap->input_base + idmap->id_count;
>> +    }
>> +
>> +    /*
>> +     * Append the last RC -> ITS ID mapping.
>> +     *
>> +     * RIDs are 16-bit, according to the PCI Express 2.0 Base Specification, rev
>> +     * 0.9, section 2.2.6.2, "Transaction Descriptor - Transaction ID Field",
>> +     * hence, the end of the range is 0x10000.
>> +     */
>> +    if (next_range.input_base < 0x10000) {
>> +        next_range.id_count = 0x10000 - next_range.input_base;
>> +        g_array_append_val(its_idmaps, next_range);
>> +    }
>> +}
>> +
>> +
>>   /*
>>    * Input Output Remapping Table (IORT)
>>    * Conforms to "IO Remapping Table System Software on ARM Platforms",
>> @@ -276,7 +312,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>   {
>>       int i, nb_nodes, rc_mapping_count;
>>       size_t node_size, smmu_offset = 0;
>> -    AcpiIortIdMapping *idmap;
>>       uint32_t id = 0;
>>       GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>>       GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>> @@ -287,34 +322,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       acpi_table_begin(&table, table_data);
>>   
>>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>> -        AcpiIortIdMapping next_range = {0};
>> -
>>           object_child_foreach_recursive(object_get_root(),
>>                                          iort_host_bridges, smmu_idmaps);
>>   
>>           /* Sort the smmu idmap by input_base */
>>           g_array_sort(smmu_idmaps, iort_idmap_compare);
>>   
>> -        /*
>> -         * Split the whole RIDs by mapping from RC to SMMU,
>> -         * build the ID mapping from RC to ITS directly.
>> -         */
>> -        for (i = 0; i < smmu_idmaps->len; i++) {
>> -            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> -
>> -            if (next_range.input_base < idmap->input_base) {
>> -                next_range.id_count = idmap->input_base - next_range.input_base;
>> -                g_array_append_val(its_idmaps, next_range);
>> -            }
>> -
>> -            next_range.input_base = idmap->input_base + idmap->id_count;
>> -        }
>> -
>> -        /* Append the last RC -> ITS ID mapping */
>> -        if (next_range.input_base < 0x10000) {
>> -            next_range.id_count = 0x10000 - next_range.input_base;
>> -            g_array_append_val(its_idmaps, next_range);
>> -        }
>> +	/*
>> +	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
>> +	 * determine the ID ranges from RC that go directly to ITS.
> are directed to
>> +	 */
>> +        create_its_idmaps(its_idmaps, smmu_idmaps);
>>   
>>           nb_nodes = 3; /* RC, ITS, SMMUv3 */
>>           rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
> Thanks
> 
> Eric
> 
