Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp987687dye;
        Fri, 27 Jun 2025 08:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYCuRXP0zjxz7lT1Suiq60XlMFloNFUmXzF0m+BaeIFssB5ZPS2lnfFomknpy5sNOyoqiKCNdzmppLlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE3LsqdVbrZCeFaf/GSKCgH8Xo/GuS8gArtnrHBY9+IhR/SUMehvKU/oaAUQgZJXcQxJoQv
X-Received: by 2002:ac8:5f50:0:b0:4a7:14c4:2385 with SMTP id d75a77b69052e-4a7fcbdc556mr57463201cf.42.1751039227347;
        Fri, 27 Jun 2025 08:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751039227; cv=none;
        d=google.com; s=arc-20240605;
        b=f9GA7zsL4jQPUJfAXpRH3g9inbpAetEWXwPRQKR4UpjTKvTkOdfNMatjp3nIAFmuXH
         h7IjMch76RzO4FSuiaP2CZdvN3m4AJX7WWV2livyr6GWfE565k7WDdC68z7OFx5XDYdy
         ukY6pxBmsVMxK1+0m+ebOOifBVShkU4ODBnF4ThuTuFhHNde3Yzp57ippqGKrSQF0rv/
         qRH+bFhhOl5fXxQPh7k4fbOf+FWxcaxs+fu7KURjsKZiXaPXBoJSQSgWQjs1QNNK8vhL
         K74c0HuPOOrml9VK/rnpnVLfC8CI9U3nhbmkCbEMwPw6dLlmfS9gdFM/hTBP5tLv93pq
         TEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=n5bu4/TsTdKxZFjoa4BOk3ofw9VJdnkdSPOu5b/ivgE=;
        fh=94E6DZWZhNCXYmx93WWkg8Od8g4sgAysyOYJjhl7zKY=;
        b=H7x1kuVUPxbckQjO0L2Vr/QTbHNu0QNWn4jUNtK6RU/yQQ9sAIlsf/J4DpE/qTrVVH
         0P51nWTFmTN04KCN76vrQkqub4419HQdw3p+3jwS7x8xluG3nEyo3DwzilUnv7rYhSxs
         7Tco5Xnnpx4jRjRcVtehT3NDhZ2J+aeRvh8X8mp6BSzdUhwTFDn8yjLwx4HctHGvqoVF
         Z5cmU3hHbSFsbmGCNddriW29WS7Npi5giBXTFtDMGk4bpSCzRDmsr9oYO6God+ErUNB+
         UYw0o2ZPZ+WgxwnzJ/HkxXxjBLrSI/9Q513U+iqAjE/ie8+VTf50Ty6QaPn9Hj4QBZU/
         tvDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3Gm4niO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7388si24748951cf.294.2025.06.27.08.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3Gm4niO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039226;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5bu4/TsTdKxZFjoa4BOk3ofw9VJdnkdSPOu5b/ivgE=;
	b=h3Gm4niObErs+udYKUwHoLVepoz32IuNTGI8O2v8H2RWSAn+E4Gg5VAnYONcyxXra2s6in
	py5+Qb0LjprNGeESz2H7gweeBBkhQQGjnXs/5UaOQeGNPc3Sr9iVC1aRPolCp0Ix6T3Uqc
	wkwKyxn0JkR1l+DxRU9PYRp3BaHEULg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-AK-tsoX3N0SKcTW3qGHVpg-1; Fri, 27 Jun 2025 11:47:03 -0400
X-MC-Unique: AK-tsoX3N0SKcTW3qGHVpg-1
X-Mimecast-MFC-AGG-ID: AK-tsoX3N0SKcTW3qGHVpg_1751039222
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso211255e9.0
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039222; x=1751644022;
        h=content-transfer-encoding:in-reply-to:references:reply-to:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5bu4/TsTdKxZFjoa4BOk3ofw9VJdnkdSPOu5b/ivgE=;
        b=AjKP1D0hBzoJdUJ0IQn2HFc2lILCRTDbKopWm5J8vx4N7okLUKbXG5ISXzyyc4PTd8
         7yeUFpmlSf9ckvCWlp0LWSnXYrlfwVpb2e0iXgLR9u5/p74yArxqHN8EA/U5sIyEOBY1
         9f6/tLQvRPahlIKyXYDXCq3C68c80/jZw5bypHSL7jjcw/t7WOmJwMaxEVBOllrzeUQe
         TVbBl4tNP8Vlovo15qOWYDpSuyh/SzLOPKb0lC+0S8yaWRGGHU0KdUSjVwNKuFBNbPOH
         K6Pzd05vmvNwEXN4yCIbJav6vK6brX5NWgQr25SFqp6eyShfcDa1ca/Sy3ZHRq+MPmYo
         f5fw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2FQH+Av9YeDgYDmedGymaxJ4EOr/9pJ/4posVcNRVhI0Iz4dv9f7Qb9fWmPgnDjvi+A+QCukXhy1Cw==@linaro.org
X-Gm-Message-State: AOJu0Yx5kMblvy9NGmsZGEMYRSKym7KokR6QFDxfJX9qiueItezcRVfq
	zDSKXjmlXObGgMpaU0TUjI8f32mFcl1iSYey3Sq8eokart9ZzSphOBKsLvisWEoAuTtqEdYkvxY
	3897/RKTglSn8Z5HIuMIo3WMeC6EQ+SUK4i1npw/C2O5Ec3nlBlwhXW11LA==
X-Gm-Gg: ASbGncsYKBjIDfW/+ltsX6BwaY263W3Z7lpR5R6uWsglrRp5VohTlPPcLZuCH5sKlIy
	MQJ7+TvMxZRqXmEFKZ94pGANP5+EY06Reyqwzbi54cT3oQIbIRE/UnaQCoWagxZPHzmbPcU9xvg
	Z0SdPsUfxiF/LVUChBD1v/frZyeUz2NyCqMoVmWS9PUSETDukeEcu/5SuKt9/tAOYCCEU10sYbX
	qVPXS8yXOxDmfRZADSF6bCMrFmyl3VeWbHZENS9AK3X0OLoUxa0rdZ13rvTdG0fI9T55c9OQkQc
	wabq2g2MrAjQiHvbEchDEKE0sdYF6igMelgRttMouxK7he2UsluVrAj5xHIbXgPpLxl7tg==
X-Received: by 2002:a05:6000:21c8:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a8fda35a01mr2355923f8f.13.1751039222139;
        Fri, 27 Jun 2025 08:47:02 -0700 (PDT)
X-Received: by 2002:a05:6000:21c8:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a8fda35a01mr2355909f8f.13.1751039221632;
        Fri, 27 Jun 2025 08:47:01 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c99sm2976187f8f.49.2025.06.27.08.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:47:01 -0700 (PDT)
Message-ID: <ec56f7f2-1397-4bd8-9451-6f98e4a350dc@redhat.com>
Date: Fri, 27 Jun 2025 17:46:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
From: Eric Auger <eric.auger@redhat.com>
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
Reply-To: eric.auger@redhat.com, eric.auger@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-9-gustavo.romero@linaro.org>
 <91976510-de0d-45b7-a9ea-68927e505db7@redhat.com>
In-Reply-To: <91976510-de0d-45b7-a9ea-68927e505db7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SR7xWfS9Hv6nhFYGJ7yf6k61Z1_XnMETBG_YArBPMA8_1751039222
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E3VSfw9h0qid



On 6/27/25 5:45 PM, Eric Auger wrote:
> 
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
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
revoking that one. Sent on the wrong patch :-(

sorry for the noise

Eric
> 
> Eric
>> ---
>>  hw/arm/virt-acpi-build.c                    | 128 ++++++++++++--------
>>  tests/qtest/bios-tables-test-allowed-diff.h |   2 +
>>  2 files changed, 80 insertions(+), 50 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 40a782a498..17ae46804a 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -328,17 +328,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          /* Sort the smmu idmap by input_base */
>>          g_array_sort(smmu_idmaps, iort_idmap_compare);
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
>>      } else {
>> -        nb_nodes = 2; /* RC, ITS */
>> -        rc_mapping_count = 1;
>> +        if (vms->its) {
>> +            nb_nodes = 2; /* RC and ITS */
>> +            rc_mapping_count = 1; /* Direct map to ITS */
>> +        } else {
>> +            nb_nodes = 1; /* RC only */
>> +            rc_mapping_count = 0; /* No output mapping */
>> +        }
>>      }
>>      /* Number of IORT Nodes */
>>      build_append_int_noprefix(table_data, nb_nodes, 4);
>> @@ -347,31 +357,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>      build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
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
>>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>> -
>> +        int num_id_mappings, offset_to_id_array;
>> +
>> +        if (vms->its) {
>> +            num_id_mappings = 1; /* ITS Group node */
>> +            offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
>> +        } else {
>> +            num_id_mappings = 0; /* No ID mappings */
>> +            offset_to_id_array = 0; /* No ID mappings array */
>> +        }
>>          smmu_offset = table_data->len - table.table_offset;
>>          /* Table 9 SMMUv3 Format */
>>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>> -        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>> +        node_size =  SMMU_V3_ENTRY_SIZE +
>> +                     (ID_MAPPING_ENTRY_SIZE * num_id_mappings);
>>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>>          build_append_int_noprefix(table_data, 4, 1); /* Revision */
>>          build_append_int_noprefix(table_data, id++, 4); /* Identifier */
>> -        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>> +        /* Number of ID mappings */
>> +        build_append_int_noprefix(table_data, num_id_mappings, 4);
>>          /* Reference to ID Array */
>> -        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>> +        build_append_int_noprefix(table_data, offset_to_id_array, 4);
>>          /* Base address */
>>          build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>>          /* Flags */
>> @@ -387,9 +409,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
>>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>>          build_append_int_noprefix(table_data, 0, 4);
>> -
>> -        /* Output IORT node is the ITS Group node (the first node) */
>> -        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>> +        /* Array of ID mappings */
>> +        if (num_id_mappings) {
>> +            /* Output IORT node is the ITS Group node (the first node). */
>> +            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>> +        }
>>      }
>>  
>>      /* Table 17 Root Complex Node */
>> @@ -430,7 +454,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>           *
>>           * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
>>           * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
>> -         * ITS Group node.
>> +         * ITS Group node, if ITS is available.
>>           */
>>          for (i = 0; i < smmu_idmaps->len; i++) {
>>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
>> @@ -439,15 +463,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                                    range->id_count, smmu_offset);
>>          }
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
>>          }
>>      } else {
>>          /*
>> @@ -768,18 +794,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                                            memmap[VIRT_HIGH_GIC_REDIST2].size);
>>          }
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
>>      } else {
>>          const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>>  
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..a88198d5c2 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,3 @@
>>  /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
>> +"tests/data/acpi/aarch64/virt/IORT.its_off",
> 
