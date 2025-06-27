Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp976027dye;
        Fri, 27 Jun 2025 08:28:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVj8jbVwMpdh6ye9P8cANz6kRfcjX5pIlIAiHWp2u0W6HKWRyRcNNysM0ChtlOfqUvCpEVMBrVxoPUZew==@linaro.org
X-Google-Smtp-Source: AGHT+IElqvMNE9nI1rgzG0GEuJzkSDeiVVKQHHzr7XpyqgAoSPQaqWA/PfY8sRB7IVCs/gWwWNgp
X-Received: by 2002:a17:902:f78e:b0:234:986c:66d4 with SMTP id d9443c01a7336-23ac462446emr61189895ad.26.1751038113660;
        Fri, 27 Jun 2025 08:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751038113; cv=none;
        d=google.com; s=arc-20240605;
        b=QECT5/BhfxlMaynViOrqNYE9BqmsWOIY1tFhhGmTTm28n0hAHUNity7RBQC7j+esr5
         cps62tCuZbEu8T7NSx74COeq1iNOdlqHnHmzYklrJfywd6uGtADTCRplKpyQDGO/vyMG
         mqHh6+cu/HOj+te7tZhlarce0PbtjyDsQ3v2LYR9g0+vH0te2OUvbUh++toWzW4Wm7yR
         qZ5dgnOxAqyW7bp2LC6uFcaBijndbtGWQZL+VzuqLOtv1wMSWfmwblXjl9C5eDWZdDkZ
         o8XYaHskjsc10AdVmURtZSNHhHAYJc+aUbkcA8xaO+iA8F8sN0OSpkpSmI2FLgKMLqw0
         Ua5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nQV5TtIlKVpVHoY5q6hFUB/cVQO58vzVnNbm5lxm68E=;
        fh=tyBgj6Znh6LUBRlCNC2OvAdtyEwVE5G45keX/XVPLDM=;
        b=e47NQOK2Z0G9azTX3injgJo9LJgiTHYyw3C+ODkK3Hh0YU9DyWY0LeWHtPCKET+0We
         gwJp+0eC1EGXSBfTZjjaEyDddappCHtuvJBamtercWdPcWbtDIlI/krd6TeLwX9ZEmAQ
         o0T6yLmQxb+gm8EABM9zax3t7UhKd0CWptGIxe5NLsd9AJ5/JRs/vgoVBXUjWTJ4x63J
         F4lIjaOjLozdUHZj+N89XPeA9/zVpyEV6tklLlfwWt/1534UqsGlsNpf3PCHrTXpohwJ
         mEMGeLjdL3yk4j3F283RKu8KG/WKb17S8u375ty/13Ddp5CKAEamRKhTuA4Bd3+UV3ps
         nslg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glTvUO42;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-23acb3a1f84si23330435ad.193.2025.06.27.08.28.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:28:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=glTvUO42;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751038112;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQV5TtIlKVpVHoY5q6hFUB/cVQO58vzVnNbm5lxm68E=;
	b=glTvUO42ePnhl/GzQFwfdJFyNRqCdunTVZ96H3fNq6gsQx1Ws/epOz7wTsK8NtlibWmVRs
	ZHn0lFjNYh834SktRVxhY1VZbM5xhhItWokGKpiXssnwV+xk6DA1ZhC6tZ+mvyntzGPaMP
	Io/6Prsuwd3V7tBLhW0T6zm+x2s1SCc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-Rhe85chgMV-U3fpoFZ50sA-1; Fri, 27 Jun 2025 11:28:31 -0400
X-MC-Unique: Rhe85chgMV-U3fpoFZ50sA-1
X-Mimecast-MFC-AGG-ID: Rhe85chgMV-U3fpoFZ50sA_1751038110
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so12085995e9.0
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751038110; x=1751642910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQV5TtIlKVpVHoY5q6hFUB/cVQO58vzVnNbm5lxm68E=;
        b=M3DdhFa3Whc90dj4AysIvqJjD3ezx7C2q0L5Gu3slEhCgzEO5cRbTjIQmSm27GRX3/
         CUGwVR4UrCsTKMCU1W8Bi10AQVFhCw+uHLkembHvHfM+UCnKXlOPtnTZt1t6Pv65RcBv
         /HnjsSBM+uyoXHZ0kaRNy4JAvCmZnZaP4eCPalxnrKjDqFbZJ18qe92gB/lNWykSi4x0
         IHkn9EtC51BmOqzJz4Rd4sSV8nYAd0fwybbcnzDJWqxR1tdnVxNVQxoGuk8norBaRf3t
         fnFad0d/iL5HVlDBxH0QdAWDoy/7C/GixaTX16O18KVhBmmXA3qLeVdDqe4lwKWZ7qxK
         CB/w==
X-Forwarded-Encrypted: i=1; AJvYcCWaI2TW7lr4BuisBb/TW0pYmjIRnqrGuDt1UuLXr91oiSrigwEmddvsfZSx5WtBUDCPSh2cv3rkqWApOw==@linaro.org
X-Gm-Message-State: AOJu0YxA9rrFnIQo1MT9TLO/SttHPoZiv0A1QzKsxshJUsEueYy0UWUU
	X+5/FFHmU6SnvsHDMW1IQqx/yofRRxWxyBtx+YirY8rtBMoTTnJXU7Ez66Usg7UMGbRQRnk2SiM
	1eIvOAQtnHd6QCMKfzfbQfhA46PEwSMg8M58M9c9AhQlxjp+ikURHJjj7/g==
X-Gm-Gg: ASbGncsRt1DjUclVkMCwOHabbwt/HR4bI2TImJieZcfwlHoF3+XqFcIer/66LRckggQ
	hkor2njHtM56WJxLGPWtEUgsjNGBSKwX3K9Zn+FSgbdZuU5uFUaiOLFVQlLb71USJcvt+mVtv0D
	/lUoTxQV9qzT1m7g8TFtzVFbPCsJjpVuLHXaJC7NXqem5x8yRTy1ymYh9aJe3VlJiO8bDcfpKgD
	fH8u8MKb8L1t/Vgd0EbFHigoD3xJ1P0JRW1dPXsuf4Y+rVyr5d61212iis5Vs4IMiIR6q5dBrpY
	N1wClw+3BRHswkRmdsQ0sa0iRSZFKQ0YY3FOCvndtMvzb7hFAKD+P6sit7yG/ODHhdpX/A==
X-Received: by 2002:a05:600c:c172:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4538ee3458amr49038415e9.10.1751038109788;
        Fri, 27 Jun 2025 08:28:29 -0700 (PDT)
X-Received: by 2002:a05:600c:c172:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-4538ee3458amr49037855e9.10.1751038109019;
        Fri, 27 Jun 2025 08:28:29 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b30dsm83759025e9.12.2025.06.27.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:28:28 -0700 (PDT)
Message-ID: <6990669d-7750-4f30-a11f-6ac06ffb266c@redhat.com>
Date: Fri, 27 Jun 2025 17:28:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 5/9] hw/arm/virt-acpi-build: Factor out
 create_its_idmaps
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-6-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-6-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1rub-v3yvTJfOHEQK7IEu1KdgK9nN4yyw6mJJVT21gg_1751038110
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0+s0iauCwxt9

Hi Gustavo,

On 6/23/25 3:57 PM, Gustavo Romero wrote:
> Factor out a new function, create_its_idmaps(), from the current
I would call it build_rc_its_idmap() to be clearer on what relationship
we build.
> build_iort code. Add proper comments to it clarifying how the ID ranges
> that go directly to the ITS Group node are computed based on the ones
> that go to the SMMU node.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 64 +++++++++++++++++++++++++---------------
>  1 file changed, 41 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e9cd3fb351..40a782a498 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -266,6 +266,42 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
>      return idmap_a->input_base - idmap_b->input_base;
>  }
>  
> +/* Compute ID ranges (RIDs) from RC that do directly to the ITS Group node */
s/do/go
Ior use the spec terminology: that are directed to the ITS Group node
> +static void create_its_idmaps(GArray *its_idmaps, GArray *smmu_idmaps)
> +{
> +    AcpiIortIdMapping *idmap;
> +    AcpiIortIdMapping next_range = {0};
> +
> +    /*
> +     * Based on the RID ranges that go to the SMMU, determine the bypassed RID
same here
> +     * ranges, i.e., the ones that go directly to the ITS Group node, by
> +     * subtracting the SMMU-bound ranges from the full RID range, 0x0000–0xFFFF.
substracting
> +     */
> +     for (int i = 0; i < smmu_idmaps->len; i++) {
> +        idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> +
> +        if (next_range.input_base < idmap->input_base) {
> +            next_range.id_count = idmap->input_base - next_range.input_base;
> +            g_array_append_val(its_idmaps, next_range);
> +        }
> +
> +        next_range.input_base = idmap->input_base + idmap->id_count;
> +    }
> +
> +    /*
> +     * Append the last RC -> ITS ID mapping.
> +     *
> +     * RIDs are 16-bit, according to the PCI Express 2.0 Base Specification, rev
> +     * 0.9, section 2.2.6.2, "Transaction Descriptor - Transaction ID Field",
> +     * hence, the end of the range is 0x10000.
> +     */
> +    if (next_range.input_base < 0x10000) {
> +        next_range.id_count = 0x10000 - next_range.input_base;
> +        g_array_append_val(its_idmaps, next_range);
> +    }
> +}
> +
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -276,7 +312,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i, nb_nodes, rc_mapping_count;
>      size_t node_size, smmu_offset = 0;
> -    AcpiIortIdMapping *idmap;
>      uint32_t id = 0;
>      GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
>      GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> @@ -287,34 +322,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_begin(&table, table_data);
>  
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
> -        AcpiIortIdMapping next_range = {0};
> -
>          object_child_foreach_recursive(object_get_root(),
>                                         iort_host_bridges, smmu_idmaps);
>  
>          /* Sort the smmu idmap by input_base */
>          g_array_sort(smmu_idmaps, iort_idmap_compare);
>  
> -        /*
> -         * Split the whole RIDs by mapping from RC to SMMU,
> -         * build the ID mapping from RC to ITS directly.
> -         */
> -        for (i = 0; i < smmu_idmaps->len; i++) {
> -            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -
> -            if (next_range.input_base < idmap->input_base) {
> -                next_range.id_count = idmap->input_base - next_range.input_base;
> -                g_array_append_val(its_idmaps, next_range);
> -            }
> -
> -            next_range.input_base = idmap->input_base + idmap->id_count;
> -        }
> -
> -        /* Append the last RC -> ITS ID mapping */
> -        if (next_range.input_base < 0x10000) {
> -            next_range.id_count = 0x10000 - next_range.input_base;
> -            g_array_append_val(its_idmaps, next_range);
> -        }
> +	/*
> +	 * Knowing the ID ranges from the RC to the SMMU, it's possible to
> +	 * determine the ID ranges from RC that go directly to ITS.
are directed to
> +	 */
> +        create_its_idmaps(its_idmaps, smmu_idmaps);
>  
>          nb_nodes = 3; /* RC, ITS, SMMUv3 */
>          rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
Thanks

Eric
