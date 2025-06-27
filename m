Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp986195dye;
        Fri, 27 Jun 2025 08:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUG51ntuDWHYkdw2SYUUoIvHDo+kfXTEOg0eDVY+hCW8p3tSce02lWvuIVuErXBk1k/mMqikidCaMAdA==@linaro.org
X-Google-Smtp-Source: AGHT+IFnAyq55eaWgGhiBlx64rvpxGTDxEneHWfR/Pj9DJ/mnZxCnXEkAoIKY6BcaXZrcHvCoem5
X-Received: by 2002:a05:6214:c48:b0:6fa:a724:8769 with SMTP id 6a1803df08f44-7000291853fmr62244366d6.35.1751039080639;
        Fri, 27 Jun 2025 08:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751039080; cv=none;
        d=google.com; s=arc-20240605;
        b=aK3jVvg7kFz0+wAXTAWze21ZN8WkuWL9hMV0aEbEduBDi60ZtT36ekml8jboNdsWnI
         l9Y9EULgduBK9g/xYb1xnhpStXWf9obVHww83jqZHTZGd4XO/3O8qF+GORuHPbVp1Y60
         faTahkEKm9lH5ZmxACz4XYvJkldRiqQJo/uoh3Gf13XTQfz8eXmPpvR9GA6VsLfeUZKO
         3AaqeBpkE62gKTD1qRDCaUl0Adept1H9zHzZWdYcofhLgXKcOewhQuAn5jacplHN3BDe
         7D4e0Pu4vtLxmcHyAv9eGD0BKctIMUBvUovH42RSratW/Y/PrDrfXg4GHKwBVhA+C7Ja
         Fk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HEDOUjPtxmsWcDn67nR+IKB3WKWJ3kq0H/uNMQDCfdE=;
        fh=/m2hBs78bz9APkS5mxwaC21rvmK4+nj1/DFQvklcaQI=;
        b=jNc1QwiN01sC+tR8RUau47CDk18+FyloF6ByrZLmvIt4ThEhOFesWU6eKuUV52hWIq
         HxrwqdKvqxkeePim4hh1WR9/3MmPizmlYY+FpSmaLAeHlFZDSPOIpo+gmfEoE6CCquK9
         RlyB28s7d/FsZZBHTr9U3INkQgrsGHfanoeQlrpIlOaAZC6XGZIhqlM5tLt1iCZq+KJ1
         28Z2roCVP4F7i5d0n69NjFiXGYKK3f8s6Og2c78ev1PJ/8nT7Gpc8Tot+VP/7Jn+Uqem
         vG4NRmiZVEPCatQQBKMmgl5voW56n7ctga0QKNllfLQF5RpTBVaiYtU8EfOb6S5S5Jsn
         VIkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E3v57P8C;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77389342si45619866d6.394.2025.06.27.08.44.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E3v57P8C;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039080;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HEDOUjPtxmsWcDn67nR+IKB3WKWJ3kq0H/uNMQDCfdE=;
	b=E3v57P8C9eaTs6GfKJ4+oINTZdKAAjOtQfSN+KRPFPxxKNyGEcvPQ9T95jCnfF9qhBUneG
	AzoUIydl+c47G6GPFLJ6X1V/1f12Rb3PAIC09Bw6gesTVYBK3XaxplDVuN6nuQIELrmPQZ
	DanhyU3MRJ8JuwnzQC/JqUpyXzmtm7I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-2DJJZV5XM6S4rVgYWFaJtQ-1; Fri, 27 Jun 2025 11:44:38 -0400
X-MC-Unique: 2DJJZV5XM6S4rVgYWFaJtQ-1
X-Mimecast-MFC-AGG-ID: 2DJJZV5XM6S4rVgYWFaJtQ_1751039077
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6da94a532so1270552f8f.2
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039077; x=1751643877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEDOUjPtxmsWcDn67nR+IKB3WKWJ3kq0H/uNMQDCfdE=;
        b=ARbxZSVuV46wgUKmLmLB9YxJR3ToxjKet6h9GaNkV43gluyX2LkSumRDj3SdhQ0j9F
         gstUPSkfXV/+GaawGxfoYw9Ch+eyIj67e8z7QWj9egtzRZXm4vDqXJyEGySTqSeVwoH3
         QiC4fMATWDV9WJtFowDa+nJjnJYItBPKRo/MPLfpUv3FYfLPqhcvWjNBQv333skVUhpr
         4c/pc1+jzoML9h+8xLdVvqn8K61rRO0GVhqkpxyhpKUkhnKQ2FoTKvnCDc4ajyDz06Q3
         +ad+eeqMTnUKgh//+zfxQ2s4gS/oD4Nl9hQh5sSq8Tcf2sMpLNZa1cVVvcE2oprae3M3
         n6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXeGpJTmqljDDRq5Spr3VETa3c2k8p92uIxFIONrwKfixPBl42uykF77nWteZq3iDRZJ2L/JX1WJyz23A==@linaro.org
X-Gm-Message-State: AOJu0YwefJbYqOjRNkSqZxMLIbLupcsvpqXL9lLSgbxoNo2tpdGCierW
	28tD059jPtlhSKSDWmLz7oLd9OopUwgGbVEKovvbHLGUAAENBQuRTcxlkIYTVgTkFEnGavsY0p3
	cBFumRkRWHvpOF6PTRrtNj/5bgDctkD2YsMK0aFnQZcNTaYruqqCE/hJPdA==
X-Gm-Gg: ASbGncvnBVsgeaDHz9kbZnej6+9+9qO8X6rNQOwJK04T7EE42gjF/R4jFxYjjUmZ0L1
	xWbDPmkgPx7j18K8KHWPAUAb3POBaZadrNCztjFavtC3Q/ABhV7Rz6ZREKq/etEJ3dAdvZMb955
	qD7AsHGRp4m1ZV+dPvx8xw0bPzetIdszf6h/xoeBx/gWkGhwT2CpObFGUvD7+lSow5UQn72gCwd
	xuCxk4oYGua5i3pxVrn96tSoXgSpWL/Wst6pd3f6xo/nFzAuQg5ymh6/cB36t8RT2fv1h4XR1KR
	PYPynEfsEDPqnJsPsm+B5xvBlUqnhEk3/krrLW9QRceYWxW4JVsQqgMMXCf02kXmYfX7CA==
X-Received: by 2002:a5d:5f46:0:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3a8f58749a0mr4203598f8f.21.1751039077319;
        Fri, 27 Jun 2025 08:44:37 -0700 (PDT)
X-Received: by 2002:a5d:5f46:0:b0:3a5:8d08:6239 with SMTP id ffacd0b85a97d-3a8f58749a0mr4203574f8f.21.1751039076729;
        Fri, 27 Jun 2025 08:44:36 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59884sm2947388f8f.80.2025.06.27.08.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:44:36 -0700 (PDT)
Message-ID: <5e0e0aa6-cc09-4aa3-b48c-65de8273549c@redhat.com>
Date: Fri, 27 Jun 2025 17:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 8/9] hw/arm/virt-acpi-build: Fix ACPI IORT and MADT
 tables when its=off
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-9-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-9-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ysjJydzRRVdYMyae5Pi1XDXz-4O5wrY7TRC7xLhWkTQ_1751039077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: de7jBTepZc/8

Hi Gustavo,

On 6/23/25 3:57 PM, Gustavo Romero wrote:
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
> Co-authored-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c                    | 128 ++++++++++++--------
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 +
>  2 files changed, 80 insertions(+), 50 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 40a782a498..17ae46804a 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -328,17 +328,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
>  
> -	/*
> -	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
> -	 * determine the ID ranges from RC that go directly to ITS.
> -	 */
> -        create_its_idmaps(its_idmaps, smmu_idmaps);
> -
> -        nb_nodes = 3; /* RC, ITS, SMMUv3 */
> -        rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
> +        nb_nodes = 2; /* RC and SMMUv3 */
> +        rc_mapping_count = smmu_idmaps->len;
> +
> +        if (vms->its) {
> +            /*
> +             * Knowing the ID ranges from the RC to the SMMU, it's possible to
> +             * determine the ID ranges from RC that go directly to ITS.
> +             */
> +            create_its_idmaps(its_idmaps, smmu_idmaps);
> +
> +            nb_nodes++; /* ITS */
> +            rc_mapping_count += its_idmaps->len;
> +        }
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
> @@ -347,31 +357,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
While at it, I would suggest to rename num_id_mappings into
smmu_mapping_count for consistency with

rc_mapping_count.

Also I would recommend to rename smmu_idmaps and its_idmaps into rc_smmu_idmaps and rc_its_idmaps to make things clearer. But that be done outside of thise series if you prefer.

Otherwise this looks good.

Thanks

Eric

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
> @@ -387,9 +409,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>          build_append_int_noprefix(table_data, 0, 4);
> -
> -        /* Output IORT node is the ITS Group node (the first node) */
> -        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        /* Array of ID mappings */
> +        if (num_id_mappings) {
> +            /* Output IORT node is the ITS Group node (the first node). */
> +            build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
> +        }
>      }
>  
>      /* Table 17 Root Complex Node */
> @@ -430,7 +454,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           *
>           * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
>           * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
> -         * ITS Group node.
> +         * ITS Group node, if ITS is available.
>           */
>          for (i = 0; i < smmu_idmaps->len; i++) {
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> @@ -439,15 +463,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                    range->id_count, smmu_offset);
>          }
>  
> -        /*
> -         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
> -         * node directly: RC -> ITS.
> -         */
> -        for (i = 0; i < its_idmaps->len; i++) {
> -            range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> -            /* Output IORT node is the ITS Group node (the first node). */
> -            build_iort_id_mapping(table_data, range->input_base,
> -                                  range->id_count, IORT_NODE_OFFSET);
> +        if (vms->its) {
> +            /*
> +             * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
> +             * node directly: RC -> ITS.
> +             */
> +            for (i = 0; i < its_idmaps->len; i++) {
> +                range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> +                /* Output IORT node is the ITS Group node (the first node). */
> +                build_iort_id_mapping(table_data, range->input_base,
> +                                      range->id_count, IORT_NODE_OFFSET);
> +            }
>          }
>      } else {
>          /*
> @@ -768,18 +794,20 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
