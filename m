Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4523971njd;
        Thu, 3 Apr 2025 20:02:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbsRw9JKiIcTKKZcy1IjbZfHtePNXM7cHZYwuWeFcVwoXPgxh/qtuXDvxqJCf4GiqI/SVYjA3YDTrJHg==@linaro.org
X-Received: by 2002:a17:90b:2744:b0:2fa:17dd:6afa with SMTP id 98e67ed59e1d1-306a48aa0bfmr2931899a91.17.1743735726110;
        Thu, 03 Apr 2025 20:02:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743735726; cv=none;
        d=google.com; s=arc-20240605;
        b=jkzPa2ZxN4i1eNin0ntA///WHBwmip5jemyJeCOxxaBB8hHmofWwpDrr+LT5m05TFF
         0nNWPz3hjBEKWTMx+PsqGnImSuVDlFsXuYfNO46PmsLT/QnCl1ypelZqmWQlnfEHummG
         dywO+ecysvsUuE64bwWH+S2cHtZpNc/cZmdD7TGexYxO5fqIXJKDi6PQlyqsPj6G6hio
         B3JNPXfY5stq38mlj5MLTa22ap7fG5WwSL/5XK2pMgTli/VvBu720VnP1wWWqBzFxcCV
         qZBW10Z7adaZHaUd+GSvNid2URjYJ1Tl416AVN0DtWsEWJL9h/Oz6tZ2U58limLI50Nv
         bwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vw8QvdfLBmSPkoH0GrKgyqq86qhGTDGrJmvgU2pUblw=;
        fh=mkcVndszobz464ywMjLjMy0cxecxWyp35a+n55i+Whg=;
        b=Z18DmzvjejpxCFJqxSH3PqszQwdG4Jsdt9MO9nDuKc31lY5a17wpcqLSEI9Lz/BzN8
         Nqg25gAZ2+3uZGxVZqLYpPQiDCm08GnniRRNsgOnoL5YcaNuAA+AajTVllyGwy8KFzVR
         9HJ+OA7NZ3McWypAaQeAzOrODDofEhoo8w/pRTuNUhyVCOCc0vAZ50tjXpfyeVQahJiE
         sKIgCfuxLgXG6ORFoe3OgvAV4EqHjMrp1b2G0WnQJvi1+Oice3HuWbrlQCafZCFHLWvk
         qFjfjNw79WMdhmLPJChtZ64U6j+V8a2Lp12nlbHgbFWqCdySF/Jdl55IZdJffbRHCGek
         N2BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z+/nJ27q";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-3057d9d1f70sor2805327a91.4.2025.04.03.20.02.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 20:02:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z+/nJ27q";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743735725; x=1744340525; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw8QvdfLBmSPkoH0GrKgyqq86qhGTDGrJmvgU2pUblw=;
        b=Z+/nJ27qC91S9qDoR7MJmpAK9cho5FIJasSto2V6w1qlTZqU1069KDTSoUJbySVS4M
         C3XYOk7N1gnp81PdPq1yjo5SNeBpdpnTy11YA/qt/T7qxbYWCbIiyvCtjHnl4LAszOtY
         LRdTSlrrLQhBG+FTSrwu9u/09RAuSjnc79Rx8oIPvezbnkysPZhZWl0RPNYuYXfZShhQ
         rHOyYWxUesgEKpojCq59Q8bnO04dflaX8BB8sY8kYoKyqQ1F8xE+h255NvFnyUHHe3el
         rS+Oe5vxtZ6qOLyIMKao8UxT/qtFE7TekWlEODPqL8FXwP60meupp5AIQ+5OMjJXl+QN
         wRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743735725; x=1744340525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw8QvdfLBmSPkoH0GrKgyqq86qhGTDGrJmvgU2pUblw=;
        b=JV3dt+ibAmaV51aWSChS4KhgJf2fwy0aYLSN/i6kejUc5g5Yi+iZXtg1mLeo5Qc9ry
         Y22wS/vkai6GnD+Z0nWyjCubN+WNUBcEOS+amuxhcBK1luaFnI5+NH/u2zgtv0L9CjVt
         rvjTsjXp3wDBw79FSn3D/4mVjNFTb2lIl8QFLAL+UzDmgls1YAOM6nLSJdn/CNyNXBqR
         C65azvRSGZvZCnMoe8708/c/WiBUFN6H1lqX0QC7xFCFugtAzl+imbtjUrxsvbCmScnd
         FZwRa0zvDyR9284zsher0xnZt29Ig9ybinexxapTRnnpPNOsVHDo0c5ca2WfMdFajCcB
         tQng==
X-Forwarded-Encrypted: i=1; AJvYcCWFcjvHwsQLBqM7dZ7dDk0K5z6gVVG9azQQ/2dh0xJomUqxWWMvTT8MuOmn0ALc27ANsI7mhNSVAtKl8g==@linaro.org
X-Gm-Message-State: AOJu0YwCDgSm9LZpbTILxcX9NaK8F3VdywsWxxCdgsQWUOJDIwwqIk9w
	b7CiYRcQ6RzXqb7S2fnq9sJWcABlphMQUkr82TvAJcKUG9Xstmwwch4zyjZsR9zaAw==
X-Gm-Gg: ASbGnctf/OUv1/y88uGigkC6UBgZD+ATGHypXx48SaVY5pNaQGPtY7QvQ3JxvwODAZR
	s1DPl4iILGt6suJpKjIljcD1dSvm40hdO5QvN095kKlO5YCkc+Co8RuaFtVayWiqqR+GkLMEMiX
	5HwwQE/L76GcdLgB1hEzRta7xi9c9lts/rlRbq6ZT9Dwtx5Syia+QUJjUnq5POx3SPQxiwyAefb
	6X2P9fjvYVM0aVIM2L/clp7LGec6R4YyVewjQtjpjXIV05zCXN8t1aMPYUk7Fg8KXAG01AfuzDU
	baSQG5tqU6O+rdHXWuJ2+SbNw3OpPJ0FwuMsSfmSSElbwdxRHiTyZFnu
X-Google-Smtp-Source: AGHT+IGSJFAuAEwpv4fnhACcbtVeO+XMW+8oDDEM/WpYpcSZSytUy6Z0Qx1Fb6boId3dwJX6CS8s3A==
X-Received: by 2002:a17:90a:d604:b0:2ff:64a0:4a58 with SMTP id 98e67ed59e1d1-306a4970dcdmr2167089a91.22.1743735725670;
        Thu, 03 Apr 2025 20:02:05 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.49.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb90bedsm2494408a91.43.2025.04.03.20.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 20:02:05 -0700 (PDT)
Message-ID: <ecf79fce-9406-4889-91a8-0e0fdf52eb4b@linaro.org>
Date: Fri, 4 Apr 2025 00:02:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v3 7/9] hw/arm/virt-acpi: Always build IORT table
 (even with GIC ITS disabled)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-8-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250403204029.47958-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZboP1JftN6vt

Hi Phil,

On 4/3/25 17:40, Philippe Mathieu-Daudé wrote:
> Citing Gustavo [*]:
> 
>    Gating IORT table generation entirely based on the presence
>    of ITS looks wrong because IORT table has data beyond GIC ITS,
>    like for SMMUv3 etc..
> 
> [*] https://lore.kernel.org/qemu-devel/bae6e29a-7290-47d2-8caf-14702ee091f0@linaro.org/
> 
> Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Maybe it's worth to cite the "IO Remapping Table Platform Design Document",
in particular page 10, which reads:

"the IORT provides an ACPI description for IO topology, SMMUs, and GIC ITSs"

https://developer.arm.com/documentation/den0049/latest/

Now that the target is 10.1, let me thing a bit more about it.


Cheers,
Gustavo

> ---
>   hw/arm/virt-acpi-build.c | 38 +++++++++++++++++++++-----------------
>   1 file changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1c389ef5cdb..e7e27951cb9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -287,6 +287,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       uint32_t id = 0;
>       GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>       GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    bool has_its = its_enabled(vms);
>   
>       AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
>                           .oem_table_id = vms->oem_table_id };
> @@ -325,9 +326,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   
>           nb_nodes = 3; /* RC, ITS, SMMUv3 */
>           rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
> -    } else {
> +    } else if (has_its) {
>           nb_nodes = 2; /* RC, ITS */
>           rc_mapping_count = 1;
> +    } else {
> +        nb_nodes = 1; /* RC */
> +        rc_mapping_count = 1;
>       }
>       /* Number of IORT Nodes */
>       build_append_int_noprefix(table_data, nb_nodes, 4);
> @@ -336,17 +340,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
>       build_append_int_noprefix(table_data, 0, 4); /* Reserved */
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
>   
>       if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>           int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
> @@ -429,7 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>               build_iort_id_mapping(table_data, range->input_base,
>                                     range->id_count, IORT_NODE_OFFSET);
>           }
> -    } else {
> +    } else if (has_its) {
>           /* output IORT node is the ITS group node (the first node) */
>           build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>       }
> @@ -979,10 +985,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                             vms->oem_table_id);
>       }
>   
> -    if (its_enabled(vms)) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        build_iort(tables_blob, tables->linker, vms);
> -    }
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_iort(tables_blob, tables->linker, vms);
>   
>   #ifdef CONFIG_TPM
>       if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
