Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp986746dye;
        Fri, 27 Jun 2025 08:45:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWF+Zoxu1syKL+kRLDQeTQhfz6+szZq0xpz/7nD3qIGC9SHucs/TcEhMG6Spdrsfv+SO57oZpkZMvwX0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFQfCJyEV7bCb6Agy+g/tgVt+FiyXHR9h4b9/ZiiFULCpWdpMr/Q1ilr1RwXBRFePmZC6w6
X-Received: by 2002:a05:622a:296:b0:4a6:f6e6:7693 with SMTP id d75a77b69052e-4a7fc9d8522mr55812351cf.6.1751039129680;
        Fri, 27 Jun 2025 08:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751039129; cv=none;
        d=google.com; s=arc-20240605;
        b=L4J6TQzJz9Mat4On/PvRTiHf/EhWI8dQQRNYlbVhIXeg0sMJ4QIp2j9PTzgugHVhgQ
         fVTBq5XC9jiMTSdlZ3xu510sCW4cnBH6EovsEXX7O3t9sNQ9o8DecU9OpRuXrH9hubAE
         d1yYWIsJ7j8/dPOQBYzVwb+5NIq7Y+wbx+P1zl4vvj90aglUnA8JsXeKUrmSLe7IZku1
         D878d50HTz9FhGee0t5Wxq8/qZcqvZsqIwFgjRH/ylPB0KZfjnYPXq0rH7TiMJn5Gkrh
         XnKYy0jn48cwvXgqpGhqk8cHCCKk6WxEC9tZaT2Ts4BrGWyOvtKW58uceymTom0JRz5d
         LzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tbhSGpYnnKPSj+oh98w7vQyURqNZ7CCnKJwgu/azLNE=;
        fh=dktQBrkgVP93oNz/ZTzmD/7+MmrnBE40mtl9jXOZSfw=;
        b=XnMQyMqlEZ9u90zyeVSiS45Fhh7ZPCxLu6au1lVoREw6qjdXVQLJYV5zpw84Xrdr+w
         2HBdO+hTQqRz4mnvfpM1OMCtlRPC9S9PC37gO46tYXh8N9n6mcrkqpWGEba5vj8CCAb2
         JMX/VqEGsKovzlM6tmjXve9+tVhDqMUeHFo87fUVIGkAJ34BL10zfk7R2ABrCrTQE/cd
         AVrQiJFBdgNPzIzNH0aCAZX2n9P4tQawVpt1ZAAfSuUi3shmNkqsB4o4abhcVS8EeTAt
         fDDLcVj0C6l+cbuYwh7u2l6y0X77cufwUMWyp7+BAw9yHsCi8e+stuOqnMGb+Wgh49hW
         D2ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J6SAcEIO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc12c66fsi24557191cf.154.2025.06.27.08.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J6SAcEIO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039129;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbhSGpYnnKPSj+oh98w7vQyURqNZ7CCnKJwgu/azLNE=;
	b=J6SAcEIOD34m0pK3TwERlBiE4rJxdvBh/mSUpmSAILU1xdSCCkA9RsOc81g5NoNbFQbGQJ
	cLQM2xX2FtXQAkMSjVmSx5mFFBc487fqQZUb4+yIYlLeRU8wnIY6Sjl/3/E7w7UYqpfFIU
	0ck5uFRbo9/Nub2gGWmzTMTD7+mcCWc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-J41OLuVoMjq4LQxefloI-Q-1; Fri, 27 Jun 2025 11:45:27 -0400
X-MC-Unique: J41OLuVoMjq4LQxefloI-Q-1
X-Mimecast-MFC-AGG-ID: J41OLuVoMjq4LQxefloI-Q_1751039127
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso864537f8f.1
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039126; x=1751643926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbhSGpYnnKPSj+oh98w7vQyURqNZ7CCnKJwgu/azLNE=;
        b=d3nJaRBj7Sq8KdM117gS6NsNwD71nYNIxsS3uR6Bgc5zwjMekn4zBL5SfsJljPbtEf
         HmlOMwXftNnQyp5R4xobCBzjiUfUu4ktQvI/SmDiQK97o9hsjnWBQZGQRT3z/Zz+3Def
         cfTL7CoarRdAWUTozWaSBHyo6iWmW7CdN4VsV//EcYOUtPVDTp5BDNCvFFuYCzI+Os67
         9ccffJXc/fBb07/LPkSO7EQ+EfCVNDjg92lvigqBoZKFJEyi8d2g0NcbCWV/sQHXY4jD
         lcdyv+/SE4d27lBH4M064/cCPwUeevl3ltlyVUatkcNetrt4EFU2jfPPc3aplgvxtD7Y
         uCSw==
X-Forwarded-Encrypted: i=1; AJvYcCXqcQlXPEnsQKh7p3HGltePRXbHfBlw2dsn9V0ImGJ4YI86d3TreACM4xNHCBR2kAqCJFs44G4wVKQ3aw==@linaro.org
X-Gm-Message-State: AOJu0YyOWcrHeZfl3FAkrENSxkH3M2J/ZmdiNQi8nkW95dNFCL8o8M6Y
	p1B6UqB1T1ktjTKpmR5Xp0ZTHwhLP3hPxpQCaMaWJJ6p+74gESMqeUa9GA71rYlJJ5eNMHr0xum
	qmMO2ayNH7KKmKtOaFKl9Xocsdk7mwSWQdpNIZ3NLu/ceybPsMJR4yDPIlw==
X-Gm-Gg: ASbGncuhhUNbNbKovkedHvu+wuvbJ97g6TGXoSstahceb7aommBYsRsZO9NOUZemSd2
	zGQye7wfAIUfq0I7mlrSgfkvWxkduP324hnTafzPf76wOBaHu/hq/f6wqyGcmz0iZwxeXpvVdXb
	TTVRqu71aLFHUEDTmCAZSMqaXv7AsXj/SxP3g6+q6BPJU0e5thZiNhARBz4YdoeMdE/vTxMgevp
	Oy3HwJAeAo3gdaJuJ+Nn7P6n3+yWP5hipB2P+/TzpcTLGJuthXSZ+L1hYSuMr41iM/y5oMy9h/V
	PmuMo8w27r/XN+CG745IJnmQsBX7RmPi1RSqtSLfxMIIRlt3sNq8J42UGXvfYdRzlyYaeg==
X-Received: by 2002:a05:6000:4009:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3aa9fc2002dmr1103285f8f.16.1751039126521;
        Fri, 27 Jun 2025 08:45:26 -0700 (PDT)
X-Received: by 2002:a05:6000:4009:b0:3a8:2f65:373f with SMTP id ffacd0b85a97d-3aa9fc2002dmr1103259f8f.16.1751039126017;
        Fri, 27 Jun 2025 08:45:26 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm3087624f8f.50.2025.06.27.08.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:45:25 -0700 (PDT)
Message-ID: <91976510-de0d-45b7-a9ea-68927e505db7@redhat.com>
Date: Fri, 27 Jun 2025 17:45:23 +0200
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
X-Mimecast-MFC-PROC-ID: Pjau3fjLceDay_E-3AmarMilTqWjwAADW-5Tx4F5U8w_1751039127
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: y7p7xbxvXyFF



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
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
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
