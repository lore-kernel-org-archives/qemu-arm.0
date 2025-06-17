Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2535812njc;
        Tue, 17 Jun 2025 07:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCNOgQHUwQmn4xhlNLbCDF8xcX4I8iGOntMUce9A7l2znrIc3B7fQRgFwllPzpDGTcB673aKQxA/84LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IECueBaNNLTWlU2J4OZS4r0pp/EmPZ17XC4LNbYosPQI2Wq21oSCgf0FDCT1NlU1cxli+YP
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr10278462f8f.22.1750169103291;
        Tue, 17 Jun 2025 07:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750169103; cv=none;
        d=google.com; s=arc-20240605;
        b=IgFF6yBScZRt0b2xxBmVzK2IbCQweQiR8x0ixmpqW07HSP4igJ7eaOrGgo4a46Te0q
         ri+rlFXCY7r7z4wWQmiYhvDJx0oKGSAaPg9y5Jrov++yskJJcL2x4HO5aNiQF3sNZ9zP
         hhGCAYHzbpQSy9iXTzCLyahhI8R9gVRb9Gr3J5CFX0r/Wg+C9H9ZWlV/4lpAQILUCuFg
         iz4Y2JOfhu27A/nNFkV5dfK6EYsle3lpS4u0rT9cp8E/La6YYaHuu0xPJGaWbmJOKWly
         60/y1j75rr8KWSiVoCBjbhfzzbERtj+9Byl/mF5Q8JUlPAbs7clGPQSjm1BEtG3k5m7q
         YKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=t7fvMTs02Yc4ySb+1f1Y2yV8qjqLU6pID/iGbEfUA1g=;
        fh=M6/acHeq57KypT0f9VIx3zXmq5UiyLC0sO5K2KpogTE=;
        b=BeEMsxt4qUQNoDbRgEQfL/jB55cpv8OqyNixDoexUkBMKGo5bp+w7CshRoUqRH3+4w
         fXVXBcdWoUe8XLHJmJlc8o+qDheM98TbD6XRqFJEEOcQpZzq7vDyYnc8PvIyEQyEtrhg
         p9N1IO8DstMKFlDaZk9PvZFckOkEqvX7rt4tp2uo+EDxmgbGDKxW63rRsheNpo/i9KlL
         CAdq+VY9RJeEMA4z/LN8cbtXoGH5vltBDTr59g7CGDZM/ijOXCyHffHWUcUm/S2koPRE
         e7V+BqOQW63ykATBR4jwMwui3UoZtMVk1sRoMecww3MrZ7sMnGaUnVY4pdGy7qmYf3Rx
         o2GQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iw4lDjEN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a568b7cdfbsi7337450f8f.650.2025.06.17.07.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:05:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iw4lDjEN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750169101;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7fvMTs02Yc4ySb+1f1Y2yV8qjqLU6pID/iGbEfUA1g=;
	b=iw4lDjENBI7o/ThXVqbcYjOwSAYNLgSxwKEhE+8mrWTVLFp8x3yCu49RprtxpJ1fhns/8C
	e9LVFhohnOP4V8ifITE3GZrFzTxcFJn1Tplc6Kvk3pV+nHuG+P7MYFwRM60a04pHwxP3Dq
	31Cmkl6OYxpGut3aiWrFLRGG8icmK7g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-7HxpZEivN6m0EbQQvcmayw-1; Tue, 17 Jun 2025 10:05:00 -0400
X-MC-Unique: 7HxpZEivN6m0EbQQvcmayw-1
X-Mimecast-MFC-AGG-ID: 7HxpZEivN6m0EbQQvcmayw_1750169099
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso37432445e9.2
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 07:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750169099; x=1750773899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7fvMTs02Yc4ySb+1f1Y2yV8qjqLU6pID/iGbEfUA1g=;
        b=tfQLS7lK0KD+FPMnCNK2KbVilmey1iFx9TSxJwMknNnhaU1JpDxoeTCOF9MOPWrzDI
         tqbK24AruZc5j1tZon3hYWcy3mqK8pTIrIlOvQfwotcgUKUchbkGDCaxW4/svRDxkh2n
         3yAUi1m0PZ1OWR8Lbw4SId/gpJ8R0YtKzCsiptYse8PMXxVRUQM86Gxt24Lyz27W4K/d
         r4fZ4DfyPriL5Hho1fiJ68kit24dxjFYkbuxOQqT+hLoEIz9XRsa1+/u6P/tzlFl7NS/
         AxR+o8SG2QiNVKScH9LW+SPM2PL6DN08aAy3ShO1laF2F74DUstlXyzv2aFV2yKzcDtQ
         Phnw==
X-Forwarded-Encrypted: i=1; AJvYcCWeqP9r9kaU96rk5E5R7bUxS9+pzFhdUdoFWWQ/w+qYAIZnHfEzDq3U5KKg++A/djufkxbySPAy2mdWzw==@linaro.org
X-Gm-Message-State: AOJu0YxzxyEstzikUNNuWjzIwCRmFaBORzi5Gf4F6gMJsbcic+NjbZ1G
	l2Ehw+EXUS9saSIPS6tHAymA7+zgjEbrNXI61/fpaVxj2a4jbvKLVyVYe8TN9UVhlb71IpU+c0O
	DxROKrAMsSUAQTIiyXI6715cn2nLj9/hWTaChGscDLYOCsYh7zvFAEa9mTQ==
X-Gm-Gg: ASbGnct9ObxfTRQOPG+Y3JDU9ftiNdiOgZQkzXHmVT7rOWrMyd5E+XSIz2I7xfKI/ZC
	EmkUoZhFKcaSnyRoKcoNcb4yswoPuRe5GBOug+N+dD59uN5OrFSNxaWFk5zo6it1x2UYn5mFExb
	AHfMEw+043pP9pW6/+xH3c7x8WgoQAcEW4JBInIqDVKlCpP92pnAMEIft3SkV943OozfGS/852/
	BpUW5GrDotIalt+TRLBrhTXeohwihlpC4B9j6+UUQPYiJVMAa1L1Y9kKdVifCXnDZq2DEwV7MS9
	OpPyqpkyy+P0Tti4aszla+o10JyDgs5U7RsdU7w+WUXX0U+5D6wSE+Y1wlU28BWHbF76IQ==
X-Received: by 2002:a05:600c:620b:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-4533cb4bea8mr119324715e9.23.1750169098271;
        Tue, 17 Jun 2025 07:04:58 -0700 (PDT)
X-Received: by 2002:a05:600c:620b:b0:450:d4a6:79ad with SMTP id 5b1f17b1804b1-4533cb4bea8mr119323835e9.23.1750169097480;
        Tue, 17 Jun 2025 07:04:57 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232219sm175153485e9.9.2025.06.17.07.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:04:56 -0700 (PDT)
Message-ID: <2ccdf511-825b-41fc-9a59-1cb4c662a002@redhat.com>
Date: Tue, 17 Jun 2025 16:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 7/8] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-8-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616131824.425315-8-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dHMmzlXOr1akGG3du5ElKg6V0ISqyNv5jDMfH-7-1Kg_1750169099
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wbOqVT3GLuZS

Hi Gustavo,

On 6/16/25 3:18 PM, Gustavo Romero wrote:
> Currently, the ITS Group nodes in the IORT table and the GIC ITS Struct
> in the MADT table are always generated, even if GIC ITS is not available
> on the machine.
>
> This commit fixes it by not generating the ITS Group nodes, not mapping
> any other node to them, and not advertising the GIC ITS in the MADT
> table, when GIC ITS is not available on the machine.
>
> Since the fix changes the MADT and IORT tables, add the blobs for the
> "its=off" test to the allow list and update them in the next commit.
>
> Reported-by: Udo Steinberg <udo@hypervisor.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c                    | 152 ++++++++++++--------
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 +
>  2 files changed, 93 insertions(+), 61 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6990bce3bb..2240421980 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -295,32 +295,42 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
>  
> -        /*
> -         * Split the whole RIDs by mapping from RC to SMMU,
> -         * build the ID mapping from RC to ITS directly.
> -         */
> -        for (i = 0; i < smmu_idmaps->len; i++) {
> -            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> +        nb_nodes = 2; /* RC and SMMUv3 */
> +        rc_mapping_count = smmu_idmaps->len;
> +
> +        if (vms->its) {
> +            /*
> +             * Split the whole RIDs by mapping from RC to SMMU,
> +             * build the ID mapping from RC to ITS directly.
> +             */
> +            for (i = 0; i < smmu_idmaps->len; i++) {
> +                idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> +
> +                if (next_range.input_base < idmap->input_base) {
> +                    next_range.id_count = idmap->input_base - next_range.input_base;
> +                    g_array_append_val(its_idmaps, next_range);
> +                }
> +
> +                next_range.input_base = idmap->input_base + idmap->id_count;
> +            }
I think I would create a helper that populates the its_idmap from the
smmu_idmaps. To me to would make the code more readable. Also we could
add a doc comment bout the helper explaining what it does.
>  
> -            if (next_range.input_base < idmap->input_base) {
> -                next_range.id_count = idmap->input_base - next_range.input_base;
> +            /* Append the last RC -> ITS ID mapping */
> +            if (next_range.input_base < 0x10000) {
> +                next_range.id_count = 0x10000 - next_range.input_base;
>                  g_array_append_val(its_idmaps, next_range);
>              }
>  
> -            next_range.input_base = idmap->input_base + idmap->id_count;
> +            nb_nodes++; /* ITS */
> +            rc_mapping_count += its_idmaps->len;
>          }
> -
> -        /* Append the last RC -> ITS ID mapping */
> -        if (next_range.input_base < 0x10000) {
> -            next_range.id_count = 0x10000 - next_range.input_base;
> -            g_array_append_val(its_idmaps, next_range);
> -        }
> -
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> -        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
>      } else {
> -        nb_nodes = 2; /* RC, ITS */
> -        rc_mapping_count = 1;
> +        if (vms->its) {
> +            nb_nodes = 2; /* RC and ITS */
> +            rc_mapping_count = 1; /* Direct map to ITS */
> +        } else {
> +            nb_nodes = 1; /* RC only */
> +            rc_mapping_count = 0; /* No output mapping */
> +        }
>      }
>      /* Number of IORT Nodes */
>      build_append_int_noprefix(table_data, nb_nodes, 4);
> @@ -329,31 +339,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>  
> -    /* Table 12 ITS Group Format */
> -    build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
> -    node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
> -    build_append_int_noprefix(table_data, node_size, 2); /* Length */
> -    build_append_int_noprefix(table_data, 1, 1); /* Revision */
> -    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> -    build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
> -    build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
> -    build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> -    /* GIC ITS Identifier Array */
> -    build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
> +    if (vms->its) {
> +        /* Table 12 ITS Group Format */
> +        build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
> +        node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
> +        build_append_int_noprefix(table_data, node_size, 2); /* Length */
> +        build_append_int_noprefix(table_data, 1, 1); /* Revision */
> +        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> +        build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
> +        build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
> +        build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
> +        /* GIC ITS Identifier Array */
> +        build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
> +    }
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> -
> +        int num_id_mappings, offset_to_id_array;
> +
> +        if (vms->its) {
> +            num_id_mappings = 1; /* ITS Group node */
> +            offset_to_id_array = SMMU_V3_ENTRY_SIZE; /* Just after the header */
> +        } else {
> +            num_id_mappings = 0; /* No ID mappings */
> +            offset_to_id_array = 0; /* No ID mappings array */
> +        }
>          smmu_offset = table_data->len - table.table_offset;
>          /* Table 9 SMMUv3 Format */
>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
> -        node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
> +        node_size =  SMMU_V3_ENTRY_SIZE +
> +                     (ID_MAPPING_ENTRY_SIZE * num_id_mappings);
>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>          build_append_int_noprefix(table_data, 4, 1); /* Revision */
>          build_append_int_noprefix(table_data, id++, 4); /* Identifier */
> -        build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
> +        /* Number of ID mappings */
> +        build_append_int_noprefix(table_data, num_id_mappings, 4);
>          /* Reference to ID Array */
> -        build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
> +        build_append_int_noprefix(table_data, offset_to_id_array, 4);
>          /* Base address */
>          build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>          /* Flags */
> @@ -370,8 +392,10 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>          build_append_int_noprefix(table_data, 0, 4);
>  
> -        /* output IORT node is the ITS group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        if (vms->its) {
I would use num_id_mappings
> +            /* Output IORT node is the ITS Group node (the first node). */
> +            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        }
>      }
>  
>      /* Table 17 Root Complex Node */
> @@ -415,20 +439,24 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                    range->id_count, smmu_offset);
>          }
>  
> -        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
see my previous comment
> -        for (i = 0; i < its_idmaps->len; i++) {
> -            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> -            /* Output IORT node is the ITS Group node (the first node). */
> -            build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, IORT_NODE_OFFSET);
> +        if (vms->its) {
> +            /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
> +            for (i = 0; i < its_idmaps->len; i++) {
> +                range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> +                /* Output IORT node is the ITS Group node (the first node). */
> +                build_iort_id_mapping(table_data, range->input_base,
> +                                      range->id_count, IORT_NODE_OFFSET);
> +            }
>          }
>      } else {
> -        /*
> -         * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
> -         * nodes: RC -> ITS.
> -         * Output IORT node is the ITS Group node (the first node).
> -         */
> -        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        if (vms->its) {
> +            /*
> +             * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
> +             * nodes: RC -> ITS.
> +             * Output IORT node is the ITS Group node (the first node).
> +             */
> +            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        }
>      }
>  
>      acpi_table_end(linker, &table);
> @@ -741,18 +769,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                            memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
> -        /*
> -         * ACPI spec, Revision 6.0 Errata A
> -         * (original 6.0 definition has invalid Length)
> -         * 5.2.12.18 GIC ITS Structure
> -         */
> -        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
> -        build_append_int_noprefix(table_data, 20, 1);   /* Length */
> -        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> -        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
> -        /* Physical Base Address */
> -        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
> -        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
> +        if (vms->its) {
> +            /*
> +             * ACPI spec, Revision 6.0 Errata A
> +             * (original 6.0 definition has invalid Length)
> +             * 5.2.12.18 GIC ITS Structure
> +             */
> +            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
> +            build_append_int_noprefix(table_data, 20, 1);   /* Length */
> +            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> +            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
> +            /* Physical Base Address */
> +            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
> +            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
> +        }
>      } else {
>          const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>  
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..a88198d5c2 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> +"tests/data/acpi/aarch64/virt/IORT.its_off",
Thanks

Eric
