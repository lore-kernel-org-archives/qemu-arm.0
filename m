Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2508806njc;
        Tue, 17 Jun 2025 06:22:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSjgKuTdR2Jn5daZt2wWVRYIvfPIV8ZKSGZ1dOwxkMB936f7WtkbSOs49y/HacBARhjWIaMw1Ze8eWAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH1kMU7H3x3XiiZp6TLg/jbBQ/8vGHS+LgKOqJ+IL98cASdU+nGrmFukVq/JukO5eszEzZ/
X-Received: by 2002:a17:903:1a6f:b0:235:129e:f649 with SMTP id d9443c01a7336-2366b344077mr226894255ad.12.1750166550825;
        Tue, 17 Jun 2025 06:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750166550; cv=none;
        d=google.com; s=arc-20240605;
        b=kobwsbPH/evfpWeamdqSB7YtdOe+yTdK/KTvgHLeqwHYG7FwTxpEHpUahpG0NyK31c
         0rwtLM+L4Uy7n/Rnu/t9ERMaFK843j7RW3yCZx0f/BLH9wGUm+Kro9ItwZISX2wvoAaP
         Yj+ZBTzQ61qQu8YmmD2WJ4B/jOehaCiUVjsX2LloGTW4pFLnEouPIOIfTLLNaAXcWL6B
         HUuGnrhy5Yi6ExBxz9QReN5hnuAbpS7K/V+kcX7/pwP03mhMcWdEV7EsK8KN/LK70Uwz
         Glvq280tldgQs2NIFvC3srODGnUzP2apvmdFEvD0KJAtUuqveduffLmQeg0SIVOP9mLU
         D1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=kQxF7NTyRAkBXCaya5YVXdNrm7Ywe0meZG4A7xYxS2Q=;
        fh=kcQlcF6wPQPs+53oBRY5TesBBW0EaF9xYQBbIJ/ljRg=;
        b=kZsmnT+M501kTHKZn4bdTeaNtUdcl9c01f+/IbNVXUD/UIfGn4aS3wuHzImkvxlQDT
         TG99pDJKDvEn8aLaOARgo5sPFD6UMq0P/t6gJStnYCaTRfS3zKiuNRfR6rbjg9KYfRFr
         Hf1IapWAv0Ln2H3DrYRrcsmfPDJFeze/nvUlD6wDm9t5L98nQ6ayRO2KPanqNhGodRGz
         sodk2QwRgeWvgLq82PuPpypfmOVRihzmuww7aLwQPyQJXFsDwue3axfHGlu9+n9hb2HT
         Sxoi4qolehyHU7G1Fz5tlcQlH688Q1QFOJh6YKb1UhTfK/y6lBRiiOCkpZiI/IAyEHk5
         1guQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M4mvxWYW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-2365d59c816si129139995ad.0.2025.06.17.06.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M4mvxWYW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750166549;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQxF7NTyRAkBXCaya5YVXdNrm7Ywe0meZG4A7xYxS2Q=;
	b=M4mvxWYWhspQlEKFTNBqTTvP6w71umq4htPdFY8T4eIp3j86rK3O1CSx16Khd6S8rEb2ib
	eAVoQpz0ibffnsIj5g/UoykPVB7Bx+f7nsVF2+KJYwDMjmYBHOJCqPl1puQz3XrEt3N0FC
	XCwbjtf790cRvhjrW4wfIWdLM+YSlIg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-BghugR9KPYutuOBHPsiNZg-1; Tue, 17 Jun 2025 09:22:26 -0400
X-MC-Unique: BghugR9KPYutuOBHPsiNZg-1
X-Mimecast-MFC-AGG-ID: BghugR9KPYutuOBHPsiNZg_1750166545
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2162241f8f.2
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 06:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750166545; x=1750771345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQxF7NTyRAkBXCaya5YVXdNrm7Ywe0meZG4A7xYxS2Q=;
        b=N1lADQPVRwqtpHmTSss1H7NvRmQC7bfAFsCmLXhwXnlzl8R6K2wXQeimdEnMYq7yJQ
         JN++w3b7u38c9Ozpi9sTbkwNlMUMmTg7BbinryBr/8L2/wCdwK32bVu4VTWACky9pUsF
         7RmcyvZqUDMdUhIsizeEP62nz9T4WP6fzr0VCTNKdbRXciTB8Op6SpwvuV+E2Rg8HUox
         SUId5w5iMUHuMvfG3OIdIoIO2KWJQWYz7/gKU5JHxPkEn/SxV59rgZzmHc+FR1MBwEwv
         cTHAnmxxB6uv1eHK8F4aLaP715hM0PxxnxHd/O+wN+TJyFUKwtYv1MsxsqdyRqzhJH+V
         dLsA==
X-Forwarded-Encrypted: i=1; AJvYcCV7uznMu6d4FSNGViwe3wGAcUkCqRn80ROojpPWot/Z8dF2FmbOUtjqQV8899Hd7tK8ZeyO0YOa4mbeUg==@linaro.org
X-Gm-Message-State: AOJu0YyEU9NYhrpztx+LX7W7S2+PE/YVvQ1bkk5z+pswWK0JX53Ndc+u
	GiiGoTFE0/3NjCDaIWdd0IHdpo6l1F0OpBGyaHzqLoWUdsrLYJEoTzfBBpILoyuDeZDoyHhpJLs
	5GGOTvEpwrg9ndOc261Anq1jT/l6gUnzAAuhvTfCxbUJ03hU3eqbDDo3Z+A==
X-Gm-Gg: ASbGncvtHR2UMpJ0ogg5FZHHshfuwq789iSKh1tHBcUwc6xL2b9p7DaPb0WNTsT+CKD
	EntDnx3PL7n8yimokteI6VygHcdnlXhJnJOP5iturKmDfQA5qbjwzFpUF0X5r30N39sG2473MLh
	VKvMCSJaqmNjOD/aSDlnHDJ9lb8xI4RH/TroKfh0jRl8Tsw8xL53fKlHuMtZ1tUA0mYYCNDxsa5
	3HyHePJPFZVBY8OSv1GNY6m73+v92L6XFveIr6Xrzd+0u2gBuT2SIaJCvBx+tELeIUsnl40EbDe
	sgjr3g97ACafP3ng1VY/UkumrOufOhNkGWxn3xg39wdA2kCqHV+6cphoCEakNai3/HaLBQ==
X-Received: by 2002:a05:6000:4716:b0:3a4:ead4:5ea4 with SMTP id ffacd0b85a97d-3a5723aec40mr9172476f8f.24.1750166545310;
        Tue, 17 Jun 2025 06:22:25 -0700 (PDT)
X-Received: by 2002:a05:6000:4716:b0:3a4:ead4:5ea4 with SMTP id ffacd0b85a97d-3a5723aec40mr9172447f8f.24.1750166544887;
        Tue, 17 Jun 2025 06:22:24 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532ddd29ffsm174874865e9.0.2025.06.17.06.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 06:22:24 -0700 (PDT)
Message-ID: <db5aa1ab-cec7-4de1-b14f-bba978e7d7f7@redhat.com>
Date: Tue, 17 Jun 2025 15:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 4/8] hw/arm/virt-acpi-build: Fix comment in build_iort
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-5-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616131824.425315-5-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vby9yWgKwbdtZINuH_1IehGTwBDesMAJs2qLnN3Vcp8_1750166545
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WNxjIZXS7RUw

Hi Gustavo,

On 6/16/25 3:18 PM, Gustavo Romero wrote:
> The comment about the mapping from SMMU to ITS is incorrect and it reads
> "RC -> ITS". The code in question actually maps SMMU -> ITS, so the
> mapping in question is not direct. The direct mapping, i.e., RC -> ITS,
> is handled a bit further down in the code, in the else block, and we
> take the opportunity to update that as well, adding "RC -> ITS" to the
> text so it's easier to see it's the direct map to the ITS Group node.
>
> Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9eee284c80..6990bce3bb 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -407,23 +407,27 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping *range;
>  
> -        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
> +        /* Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3. */
yes this is what the code builds at this location.
>          for (i = 0; i < smmu_idmaps->len; i++) {
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -            /* output IORT node is the smmuv3 node */
> +            /* Output IORT node is the SMMUv3 node. */
>              build_iort_id_mapping(table_data, range->input_base,
>                                    range->id_count, smmu_offset);
>          }
>  
> -        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> +        /* Map DeviceIDs (input) from SMMUv3 to ITS Group nodes: SMMU -> ITS. */
But here I am confused. To me the its_idmaps matches the idmap between
RC and ITS. I understand this is built from holes left by bypassed
buses. See the build_iort() implementation. The comment at

        /*
         * Split the whole RIDs by mapping from RC to SMMU,
         * build the ID mapping from RC to ITS directly.
         */
        for (i = 0; i < smmu_idmaps->len; i++) {
            idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);

            if (next_range.input_base < idmap->input_base) {
                next_range.id_count = idmap->input_base -
next_range.input_base;
                g_array_append_val(its_idmaps, next_range);
            }

            next_range.input_base = idmap->input_base + idmap->id_count;
        }

is not crystal clear but it looks like filling the holes into its_idmap.


Besides there is another "Its group" instance to be replaced by ITS Group

Eric

>          for (i = 0; i < its_idmaps->len; i++) {
>              range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
> -            /* output IORT node is the ITS group node (the first node) */
> +            /* Output IORT node is the ITS Group node (the first node). */
>              build_iort_id_mapping(table_data, range->input_base,
>                                    range->id_count, IORT_NODE_OFFSET);
>          }
>      } else {
> -        /* output IORT node is the ITS group node (the first node) */
> +        /*
> +         * Map bypassed RIDs (input) (don't go through the SMMU) to ITS Group
> +         * nodes: RC -> ITS.
> +         * Output IORT node is the ITS Group node (the first node).
> +         */
>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
>  
