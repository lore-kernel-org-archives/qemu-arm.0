Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1644701dye;
        Sat, 28 Jun 2025 12:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCi7NH3sOF/cZiQT6mNg6J9K/ziisj/asmTVd9MSCv6pHalD7mkLIouicrLO6G8FtKvLMxVi94WtP2dA==@linaro.org
X-Received: by 2002:ac8:4d48:0:b0:4a7:f541:4e1e with SMTP id d75a77b69052e-4a7f54150d1mr119807801cf.7.1751139825628;
        Sat, 28 Jun 2025 12:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751139825; cv=none;
        d=google.com; s=arc-20240605;
        b=HWDY/uFb5x7cr/76nXlrzcUfyoQGiHQmMSgVZJ7pJP150Il9PDFCp/YFYWtZUeatTg
         0Zqb2DZDwTTrZUjzprX2yx3q0M/X3dYnNokWkn6Rokrw9S1Bkri7QdLQw40py2JstDpq
         JJm79rfPlsabZTNBDih1tUCPAKX9rTP8xP5VUgu9TGi0fBwR2idUgrGhLIYNJ4Ubt/Lt
         uvkTIuxLJoxQu057gNVIi+oD3I3n2J+gnAbPVlnD6VFYO4c7Kp3WIn0OCNMWJhAzmV+h
         oV5NI6RIRmrTZYz1jBTRp3XFIMPhFEKMeJj+CxmH/0FmxdZbuDcQ6n3alD9rOb17GgS/
         k5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3febMVu0X5KFhPdL2zwTsQIDWAfULnvvVNn5EAdat80=;
        fh=TlYxMV65pwArWfdaMrPvmp2IGiSrZpLUfko+s0ICFG8=;
        b=RjqGOaiHrPA+BQskvEKtvMroPstwYRpcl3FK+89r7VvZT7kQyOGq1y1uY3147iouzg
         Qf8j5nD0m578hqADK9aLQ4PFTiWaouDG57mD4dgfJLviql12o7dt0Zz7vMW9y9mSFbo6
         mZ8Z4A57Nfo8ppenOsb3ZVJDrkuhepNkUxxm8Syx40KsFQuvVYMSQBGduujchLNBRLaX
         dHSZw6Ul71Qkswerv72KPnS78qCfX3WgFhmxDbGvllYymO1Oh6qgN5g/GeKCNeZnSvZ+
         v3GIXLYGBXRz/ODMWRoKnPJCc3586o9LrJlEwJKSKXFme+f7By7zYtbUsbCDB3N6Pvpq
         naqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLmMvQPs;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d443228030sor376497385a.8.2025.06.28.12.43.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CLmMvQPs;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751139825; x=1751744625; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3febMVu0X5KFhPdL2zwTsQIDWAfULnvvVNn5EAdat80=;
        b=CLmMvQPsug92dHnRPc+oILvJSMtQz1m+CD/YoCUf+jR9qkjn9nZYjdkKAC1TIUMAXF
         gFacpPEf/up3kmt54yw1WPa+vOOjeCPZjnzeMWoEpFuZKts5N3XcZedj7AMzHM8YNR6K
         gg559RN6aI7iIthcjQqTj+ZOEPyTpCHFYP3H6z+Z8fxipJG1dk8dl6Q9Dfshl1M76QH1
         5OvzYrjb9w3U1LZX0eXfaFIWufEyLEG2SQsL2ZHBjAued75bURO6Glzrnq/LVQa1lPdK
         kync2FlcViSiA/0RmqYOUCu0w1SyvZM14jhCLBGFkDhAlegH0IfKWcS5bReDXOSqCKro
         ZjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751139825; x=1751744625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3febMVu0X5KFhPdL2zwTsQIDWAfULnvvVNn5EAdat80=;
        b=PU+EapTZa7c2b7Z3KjSMQvvnuTYKVOOfDl6M12ZPicFrLyno7pHwiXecVZnKuDZl7a
         HFNpyhhkl2VCOa90AKoFT4r1UH9eKK0Z6oj7Hl1yvWq6TKRRD1QJ9xYyIA/awCR8wnmd
         3yyTytOhWDR/QVjcQIz4yC36wyDngMLQSRKg+PKqYN2EmNYFxkQBwEujBFAxA07VoWHh
         NWciQ67UV7MiUtwrfdl/yktSAf9cCN0HqKETCqyRNDkY5EXtZBcE9tlelQTZXliXxuf1
         omVRAzYrdUUZv8daKrAtcBcfZI5vdUmRGUNo5drL0fiNOza7ARcjw4IV35ECNPA8FcF8
         4oyA==
X-Forwarded-Encrypted: i=1; AJvYcCUWagcz5r/++cVcGaROmjaKGXRQInZmmWGwQL8JnEbuq6zZWUROlv6sID68LuN4SnbIJSNn2ENK5zVQfA==@linaro.org
X-Gm-Message-State: AOJu0Yz4SXmxO3S8H2LuD5ceoqHHuzXGVQgg35hQVKZL3BrJIR7pdCrt
	AUrwZ/sjwjeqGqqqOhdKt5kujkqyIKy8AjGoV4h2KU4GyENKHqfu1u0I7dOAjm6l1YvcDg==
X-Gm-Gg: ASbGnctAxOAC0dujjmgeLDuk/herwNRinC082jjBRffEAxiENt9LumQUU8jxp+tvYYv
	PnFZFPRvA6Ucd0qEecFAhIMTjdn0O/Z7/cu7gnvunMKyX2/pgMKE2pI5w7JpA1uOKtCvzv2lgc1
	+DaPpHzdbYhcnolmOeLwthEfBx9g9U/4gpUWlXOxfpgSLAb35k9yp1CqSlZSRiimZZiKN30L/hY
	ZDV8QwiRW5+IFNFbsnf+9k8yg0KNeBmFNCHMNOKZh4dr9IxDyiYfeVAwCIeE1t6RKRinyaKEad4
	OpnkgGIogTn8FZlBuO8BerYm0vWMODgHyVjAbthUtYpimpeaC0nTrHF3VK49tb9qKko51jTjRi0
	sZ8b8Va2x
X-Google-Smtp-Source: AGHT+IGguvOPNXhWsYjleLw6zKR6nVVKQ0gnbcCBPqK0K/Q9ZZlNsVp3PTCV3IIsPJRuw+awwCSX1g==
X-Received: by 2002:a05:620a:6983:b0:7d0:9acc:c86b with SMTP id af79cd13be357-7d44418ce27mr757932185a.19.1751139824792;
        Sat, 28 Jun 2025 12:43:44 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44322d63csm332921885a.95.2025.06.28.12.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 12:43:44 -0700 (PDT)
Message-ID: <85259079-e40c-4550-b251-c35110557d3f@linaro.org>
Date: Sat, 28 Jun 2025 16:44:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
To: eric.auger@redhat.com, qemu-devel@nongnu.org, philmd@linaro.org,
 mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-9-gustavo.romero@linaro.org>
 <5e0e0aa6-cc09-4aa3-b48c-65de8273549c@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <5e0e0aa6-cc09-4aa3-b48c-65de8273549c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Udrp4EB2k1py

Hi Eric,

On 6/27/25 12:44, Eric Auger wrote:
> Hi Gustavo,
> 
> On 6/23/25 3:57 PM, Gustavo Romero wrote:
>> Currently, the ITS Group nodes in the IORT table and the GIC ITS Struct
>> in the MADT table are always generated, even if GIC ITS is not available
>> on the machine.
>>
>> This commit fixes it by not generating the ITS Group nodes, not mapping
>> any other node to them, and not advertising the GIC ITS in the MADT
>> table, when GIC ITS is not available on the machine.
>>
>> Since the fix changes the MADT and IORT tables, add the blobs for the
>> "its=off" test to the allow list and update them in the next commit.
>>
>> Reported-by: Udo Steinberg <udo@hypervisor.org>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Co-authored-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/virt-acpi-build.c                    | 128 ++++++++++++--------
>>   tests/qtest/bios-tables-test-allowed-diff.h |   2 +
>>   2 files changed, 80 insertions(+), 50 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 40a782a498..17ae46804a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -328,17 +328,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           /* Sort the smmu idmap by input_base */
>>           g_array_sort(smmu_idmaps, iort_idmap_compare);
>>   
>> -	/*
>> -	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
>> -	 * determine the ID ranges from RC that go directly to ITS.
>> -	 */
>> -        create_its_idmaps(its_idmaps, smmu_idmaps);
>> -
>> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
>> -        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
>> +        nb_nodes = 2; /* RC and SMMUv3 */
>> +        rc_mapping_count = smmu_idmaps->len;
>> +
>> +        if (vms->its) {
>> +            /*
>> +             * Knowing the ID ranges from the RC to the SMMU, it's possible to
>> +             * determine the ID ranges from RC that go directly to ITS.
>> +             */
>> +            create_its_idmaps(its_idmaps, smmu_idmaps);
>> +
>> +            nb_nodes++; /* ITS */
>> +            rc_mapping_count += its_idmaps->len;
>> +        }
>>       } else {
>> -        nb_nodes = 2; /* RC, ITS */
>> -        rc_mapping_count = 1;
>> +        if (vms->its) {
>> +            nb_nodes = 2; /* RC and ITS */
>> +            rc_mapping_count = 1; /* Direct map to ITS */
>> +        } else {
>> +            nb_nodes = 1; /* RC only */
>> +            rc_mapping_count = 0; /* No output mapping */
>> +        }
>>       }
>>       /* Number of IORT Nodes */
>>       build_append_int_noprefix(table_data, nb_nodes, 4);
>> @@ -347,31 +357,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>       build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>>       build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>   
>> -    /* Table 12 ITS Group Format */
>> -    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>> -    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>> -    build_append_int_noprefix(table_data, node_size, 2); /* Length */
>> -    build_append_int_noprefix(table_data, 1, 1); /* Revision */
>> -    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>> -    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>> -    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>> -    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
>> -    /* GIC ITS Identifier Array */
>> -    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>> +    if (vms->its) {
>> +        /* Table 12 ITS Group Format */
>> +        build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>> +        node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>> +        build_append_int_noprefix(table_data, node_size, 2); /* Length */
>> +        build_append_int_noprefix(table_data, 1, 1); /* Revision */
>> +        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>> +        build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>> +        build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>> +        build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
>> +        /* GIC ITS Identifier Array */
>> +        build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
>> +    }
>>   
>>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>           int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>> -
>> +        int num_id_mappings, offset_to_id_array;
>> +
>> +        if (vms->its) {
>> +            num_id_mappings = 1; /* ITS Group node */
> While at it, I would suggest to rename num_id_mappings into
> smmu_mapping_count for consistency with
> 
> rc_mapping_count.
> 
> Also I would recommend to rename smmu_idmaps and its_idmaps into rc_smmu_idmaps and rc_its_idmaps to make things clearer. But that be done outside of thise series if you prefer.

Thanks, that's indeed a nice change for clarification. I've done it in v6.


> Otherwise this looks good.

I was not sure if I had to add your R-b in v6 after I addressed your comments so
I left v6 without a R-b.


Cheers,
Gustavo

> Thanks
> 
> Eric
> 
>> +            offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
>> +        } else {
>> +            num_id_mappings = 0; /* No ID mappings */
>> +            offset_to_id_array = 0; /* No ID mappings array */
>> +        }
>>           smmu_offset = table_data->len - table.table_offset;
>>           /* Table 9 SMMUv3 Format */
>>           build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>> -        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>> +        node_size =  SMMU_V3_ENTRY_SIZE +
>> +                     (ID_MAPPING_ENTRY_SIZE * num_id_mappings);
>>           build_append_int_noprefix(table_data, node_size, 2); /* Length */
>>           build_append_int_noprefix(table_data, 4, 1); /* Revision */
>>           build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>> -        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>> +        /* Number of ID mappings */
>> +        build_append_int_noprefix(table_data, num_id_mappings, 4);
>>           /* Reference to ID Array */
>> -        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>> +        build_append_int_noprefix(table_data, offset_to_id_array, 4);
>>           /* Base address */
>>           build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>>           /* Flags */
>> @@ -387,9 +409,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
>>           /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>>           build_append_int_noprefix(table_data, 0, 4);
>> -
>> -        /* Output IORT node is the ITS Group node (the first node) */
>> -        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>> +        /* Array of ID mappings */
>> +        if (num_id_mappings) {
>> +            /* Output IORT node is the ITS Group node (the first node). */
>> +            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>> +        }
>>       }
>>   
>>       /* Table 17 Root Complex Node */
>> @@ -430,7 +454,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>            *
>>            * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
>>            * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
>> -         * ITS Group node.
>> +         * ITS Group node, if ITS is available.
>>            */
>>           for (i = 0; i < smmu_idmaps->len; i++) {
>>               range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> @@ -439,15 +463,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                                     range->id_count, smmu_offset);
>>           }
>>   
>> -        /*
>> -         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
>> -         * node directly: RC -> ITS.
>> -         */
>> -        for (i = 0; i < its_idmaps->len; i++) {
>> -            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>> -            /* Output IORT node is the ITS Group node (the first node). */
>> -            build_iort_id_mapping(table_data, range->input_base,
>> -                                  range->id_count, IORT_NODE_OFFSET);
>> +        if (vms->its) {
>> +            /*
>> +             * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
>> +             * node directly: RC -> ITS.
>> +             */
>> +            for (i = 0; i < its_idmaps->len; i++) {
>> +                range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
>> +                /* Output IORT node is the ITS Group node (the first node). */
>> +                build_iort_id_mapping(table_data, range->input_base,
>> +                                      range->id_count, IORT_NODE_OFFSET);
>> +            }
>>           }
>>       } else {
>>           /*
>> @@ -768,18 +794,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                                             memmap[VIRT_HIGH_GIC_REDIST2].size);
>>           }
>>   
>> -        /*
>> -         * ACPI spec, Revision 6.0 Errata A
>> -         * (original 6.0 definition has invalid Length)
>> -         * 5.2.12.18 GIC ITS Structure
>> -         */
>> -        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
>> -        build_append_int_noprefix(table_data, 20, 1);   /* Length */
>> -        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>> -        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
>> -        /* Physical Base Address */
>> -        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
>> -        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>> +        if (vms->its) {
>> +            /*
>> +             * ACPI spec, Revision 6.0 Errata A
>> +             * (original 6.0 definition has invalid Length)
>> +             * 5.2.12.18 GIC ITS Structure
>> +             */
>> +            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
>> +            build_append_int_noprefix(table_data, 20, 1);   /* Length */
>> +            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>> +            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
>> +            /* Physical Base Address */
>> +            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
>> +            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>> +        }
>>       } else {
>>           const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>>   
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..a88198d5c2 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,3 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> 
