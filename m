Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6372108njd;
        Mon, 7 Apr 2025 06:30:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpa+bxuGT6kUwHUtA2CB+J+Lq6Xp8OvS3aJZs7oCXnQnRdFWjOHjKigZqq/ma3J0EAuv90x6Gb2qw4yA==@linaro.org
X-Google-Smtp-Source: AGHT+IE7ckPaXTt+Cnb6I+KEhDghTNbFDw0dPkLWzOEOCTRwsO1uQ7amqQHYJQHQCHBHzCrFCCXG
X-Received: by 2002:a05:620a:2447:b0:7c5:65fb:fe0e with SMTP id af79cd13be357-7c77dd6b226mr1514554085a.6.1744032633106;
        Mon, 07 Apr 2025 06:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744032633; cv=none;
        d=google.com; s=arc-20240605;
        b=BEP6PCQGeevWnLEfpQfkjB3m/3Vn8XT6pExTLyv14huruHYN+V3g55ZndeeYT3zYEM
         Mt8a0C2zgjHLO6WYTBB03kg9/q0LjGB8xQnNn94C1coRkXplu34CgUPNXG01axca/Ggt
         TfUDxPtG4pATk2Ur8b1DzGGJUSpB+/x7Q3pogbBi87ZBa2f4YHe5PLkJ4jH5fp48n+3P
         Gx2bZJite8WrYtkWvH79VKHJFWVlPDzrJeBWdbZFkTyTmMBSLcZPHMgM4i9qvHadmzJr
         s0h8gSezZRk6IsHlob5qHNH79gi7K10wQkDG6O8H0U3k3PGsxjZX7XQqHyhpaZdMGhJm
         3jJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5yYQ8iH6g2DJrpmcWfAUZDWMJZm83Xuy4dF4K7MbYHo=;
        fh=osz4PMbrZWZlXWkB6Rp9NvlWtWkwIBu6oLZhq5GQEyU=;
        b=ctWwvf8mr8xo97ax2loivwT2T7XlcIVuhjWIYOZOJDEI3zsuc3Mo7raSJHMmZTmAOP
         NmaSpbIKqocy/byg/wUOhk+Fb5MgiJ/oZ1xM2lTxb/WqBX6OqDwNGi9g9Y7YU4Ph4Age
         8S4XcVi3YCrED9n2B4YZWla+OEpJXEUaSAueB9T9VD6RsNHGIE3Yk/Y9B8lLbgPSygzs
         XpZkTl8sH13nMLw5sCGs1Q3w78BzAScSPMvW9caqqdlvYWuIYwqNY/fAtNxsSa2JivEY
         510XgvAwOr/tbAN7HiLGTAo2tvNzS1nBJJLTYQbiKDLZQvnk0ExSxJ15Xg8/YAeCIRn2
         dAmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIcALQDu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c76ea97331si853980085a.419.2025.04.07.06.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZIcALQDu;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744032632;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5yYQ8iH6g2DJrpmcWfAUZDWMJZm83Xuy4dF4K7MbYHo=;
	b=ZIcALQDuASXveJjtrTmkcO6r5gqTUxVn6WJuEA8tuofwVdkmzpSNGMe3jTtFxbhlFmrM0I
	70n8Os8/6O7PIyr0lOw/MkbHurYN3hxh71dgg9V/S7bAdrI/NdMZkXxQliRspv2/OOUe/8
	SfYZn8ipIwOonBg5/pIUfFDNNVsHL3w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-2DXMvqFVN22nnDOFjdUZiA-1; Mon, 07 Apr 2025 09:30:11 -0400
X-MC-Unique: 2DXMvqFVN22nnDOFjdUZiA-1
X-Mimecast-MFC-AGG-ID: 2DXMvqFVN22nnDOFjdUZiA_1744032610
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso26466125e9.3
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 06:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032610; x=1744637410;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5yYQ8iH6g2DJrpmcWfAUZDWMJZm83Xuy4dF4K7MbYHo=;
        b=pAsaNDHbblQD/bEYhwZYEnJsCqsO9g3B0d8NSKuIQY+DRio/bVOpUmOjpgTh23Hn0g
         xli3HreuECSq6pRnUWDUBdzxKxSeSn1MoTBVzuuillktvTjPOyYJDDByjvvrDmsefspT
         bM553vLLgt6hwvwKOpynozIXsN9AUuNRIb398p7FJj1C/XTU0K6b2sZp0wfdffPEO/BI
         2GuOpu20WVvso2G4phnZI1ytgb6L6U/aVFD6qd3X6RCk8So0QpFxguYElHvcjGE4C7n2
         VHs2YcCW3WglqVG/05DFPsIOzc7qYYrbo8NWAmUeC9/IVXb7GS1ZEhEc+wcorG/MT2z7
         5lBw==
X-Forwarded-Encrypted: i=1; AJvYcCWYAEnaD/Oyzxl2CNn50zmY7zKeTyiAQMrr1ZPTbGo5fezZOyX0+trFBbMM9lXrdaMxAynehLJdPyLS1A==@linaro.org
X-Gm-Message-State: AOJu0YyesGZP7O11xlZ3a68LM71heKo1ucS1CJvFCYDG0vy+jN6Yndrh
	TAUedDobC/8/sFHrOWDtAm5i/oS3wPzW63n7kSAOfR4llebTsV8VNKN+hbl2QRNwMKdfB182zmw
	LGS6Yaacu8KM5szgA5tv3bw2UCVxfm6hkpkytub0BOGLWf/VERY3qzA==
X-Gm-Gg: ASbGncunM/z2olHg5C0NbYos041ejePQ1YZhPE0Ut7sFU8dqAnmeFUDtEy+RaBCVb0W
	fQH4U4uqTRskKul4ihUqnayxdoe5/G6H6ypcRtympAZioZuiQvO/t7mB7M8NnTx5VGKiBuI0PIT
	6ZByQPKGYpfcdvgdX1YD4WY0NvXkGZlE+PRFF7y5MEv6TOcjn4DWMqPLKr0Kf+jCQRKunUOZw/N
	6Zso4HK0iIPqh+mbllLxmpi1WYRlNFdfppr/b3FmzCB3j/D1QQc9dYSGAu+QwCeMDYxM3zj/foU
	C11mwMt/+niut5I6wFt1xFpIZ9WoZXQT82F9SUiz64wYF+4ocwJ2eOqsUpkPOkk=
X-Received: by 2002:a05:600c:3494:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43ecfa0714emr99010325e9.28.1744032610391;
        Mon, 07 Apr 2025 06:30:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3494:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-43ecfa0714emr99009925e9.28.1744032609928;
        Mon, 07 Apr 2025 06:30:09 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm129643265e9.25.2025.04.07.06.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:30:09 -0700 (PDT)
Message-ID: <0a69bd8b-c053-46b7-80a9-c9f3ea374dd7@redhat.com>
Date: Mon, 7 Apr 2025 15:30:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 7/9] hw/arm/virt-acpi: Always build IORT table
 (even with GIC ITS disabled)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-8-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250403204029.47958-8-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pLY6Pw26KpSix7lPuoG3g-6_RJfxIYWrfWAGHLyWRic_1744032610
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xevw+abiqfL9

Hi Philippe,

On 4/3/25 10:40 PM, Philippe Mathieu-Daudé wrote:
> Citing Gustavo [*]:
>
>   Gating IORT table generation entirely based on the presence
>   of ITS looks wrong because IORT table has data beyond GIC ITS,
>   like for SMMUv3 etc..
> [*] https://lore.kernel.org/qemu-devel/bae6e29a-7290-47d2-8caf-14702ee091f0@linaro.org/
>
> Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 38 +++++++++++++++++++++-----------------
>  1 file changed, 21 insertions(+), 17 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1c389ef5cdb..e7e27951cb9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -287,6 +287,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      uint32_t id = 0;
>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    bool has_its = its_enabled(vms);
>  
>      AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> @@ -325,9 +326,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>          nb_nodes = 3; /* RC, ITS, SMMUv3 */
>          rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
> -    } else {
> +    } else if (has_its) {
>          nb_nodes = 2; /* RC, ITS */
>          rc_mapping_count = 1;
> +    } else {
> +        nb_nodes = 1; /* RC */
> +        rc_mapping_count = 1;
>      }
>      /* Number of IORT Nodes */
>      build_append_int_noprefix(table_data, nb_nodes, 4);
> @@ -336,17 +340,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
> +    if (has_its) {
> +        /* Table 12 ITS Group Format */
> +        build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */ //
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
Do we allow configs where we have SMMU and no ITS?

The IORT spec says "
ID mappings that are defined in an SMMU IORT node can only have an ITS
Group node as an output reference,
or no IDs in the case of a system that does not have ITS units. All
other object types are explicitly forbidden.
"
So in case we do not have any ITS we also need to take care of ID
mappings of SMMUs

Eric
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>              build_iort_id_mapping(table_data, range->input_base,
>                                    range->id_count, IORT_NODE_OFFSET);
>          }
> -    } else {
> +    } else if (has_its) {
>          /* output IORT node is the ITS group node (the first node) */
>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
> @@ -979,10 +985,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                            vms->oem_table_id);
>      }
>  
> -    if (its_enabled(vms)) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        build_iort(tables_blob, tables->linker, vms);
> -    }
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_iort(tables_blob, tables->linker, vms);
>  
>  #ifdef CONFIG_TPM
>      if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
