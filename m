Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp916944dye;
        Fri, 27 Jun 2025 06:57:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKt9Yn81IUnt0/7g3b192fB4br2I3iccrYthuPeLw+AmRELfewsZd3waMdyxCM/bPjzGmhHQL8C5MMdA==@linaro.org
X-Google-Smtp-Source: AGHT+IFOq2lBf+yAV2UI7RSzfXtM4b2SJGyuAY2pyEkB1hhzHtD+L73Wy0o59c7KOug6zlnAM9UX
X-Received: by 2002:ac8:5894:0:b0:490:8cc3:d111 with SMTP id d75a77b69052e-4a7fcdc5b59mr54149671cf.27.1751032666558;
        Fri, 27 Jun 2025 06:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751032666; cv=none;
        d=google.com; s=arc-20240605;
        b=NmgjPRlUGAO5fYGjylQorbgePNJvvrPbZNekPGk5Eab49y3HD58KXx9WoWQTVi6VrA
         LF/63QyLco0BKzx+wkkPKLK+u9KaCcaH/zAobfDMTAuggpyJwYHt0IsB3lgxBMjSk6DS
         ZPvWEltJ1dyz3J1llaWHN73lNHVqMeaC7PMi0fZUDkhrBgSYZkt7JhMEE23z+rXcbrWd
         1EPAgAj8r9x4OyqMHarLA20AX5ubfnhE/8HooouTUuIYtr/5qLcc7EieSiCrbH+beLod
         5ERJ0wzDfSFMxh2KCmEnck8PocIgLKrkbKtZTD+dumceXYeDyQDHGthPxCcEHqubXnhJ
         /zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=SVxajDd+Fe0j47/wXGGNaINiJU8SnVsrI0xkdeEuuEA=;
        fh=zWKhKwJaWSFalTzrqZgFB3grL5o7MGcoa2vYPYpa1PY=;
        b=PAR1qr2+q9F4YhwvyteggTG3v0dg5Y7PLu1VBpqdB5QppZnWPh30aqmOCcZXosTpNt
         1nosL2OHMKZf1D0TsmsQs64W+s9wh9Epm9GnaFSlwV/wlpbAHgnLFMw5/z7+MwYxUpHj
         wTiS6Z+FVkR/aGvvVZAT5G/eg7JZjaQHkX25yDgGpQ6kcaSvVqTwKhfVweXA5qKldQQN
         1qqWQ5CwGI8ANSlqyrvpKMdDK5ylXxeZaNEe8V7n85/K+fwLD0AkRtpGwQwVSiSRPHMm
         StG2ME1XtuVU4RhWpD8hTdC7BYAYjJI+xhJqNiX9xb0up+SxOiVslpHOlytfPY4qqurn
         RuNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DY8f9wIR;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc238f0asi22989531cf.308.2025.06.27.06.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DY8f9wIR;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751032666;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVxajDd+Fe0j47/wXGGNaINiJU8SnVsrI0xkdeEuuEA=;
	b=DY8f9wIRdfcHq+EYsH8P34JHx/pFjIZ2oWHRxusEQD350hrIhtpIWl15dbvLFLk2m6/mJk
	iM8M4+/qFXoUn9pnokbM6e45hWw7vvWK816iKL2Wgsgy/dlBdIPcEUGfyU085L4aUkeGN2
	cw/3C+HQ6BbfKwCWHBNtHLMQJN2hvD8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-o3vkc3Y4MRyEeLhHg_agIw-1; Fri, 27 Jun 2025 09:57:41 -0400
X-MC-Unique: o3vkc3Y4MRyEeLhHg_agIw-1
X-Mimecast-MFC-AGG-ID: o3vkc3Y4MRyEeLhHg_agIw_1751032660
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso823674f8f.1
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 06:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032660; x=1751637460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVxajDd+Fe0j47/wXGGNaINiJU8SnVsrI0xkdeEuuEA=;
        b=OyHePJ/KzPqb13qyXN3mcsEwuRB6tQT7z/kOl6xGb3xaWeNUmvCP1x7SuZxNCA2SyO
         tESRbVlesCswzrw3vDLa1bZk9zMgZAR/U1Fjw50A3uSjhF3sI7xYhgL8oq4tYm+xEvLm
         v8ebhu4EyIGLEEe43XTiO/2StmMMsyB6PL0mGkxxFs370eJS0ddIo4oEMFAWGP8b15/Y
         lroa18OisnNePm6myHhj7DiLC1lPIsre45TsP67dY1p1AV+H71KNMyB/P7Tz6goSbhxs
         6FmnBjgDz6uaOAFcV6nOAvTLBnertLjjqaC9+w9O3f0kROmNdNcydunVOi8WsyUMPgEf
         6sZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKpfmm23ZzwZQObfBB5K1SU/GK+SUNH4EKmJVRQ/QJI97kjPEIEefeHJ/eDBmfKW+LRXy3Hie22JDjvQ==@linaro.org
X-Gm-Message-State: AOJu0Yw4dmQaoxc8GGxP5/5nhqQSOKqnbuv38pP0B2c2fiCDidRvMxfl
	E6ZsjubCbpw3+fa7ZWD551dL3C0ketM4VTVBOtOT+4lMHkJ8blWEIooNVQ9IepJi0FsVXJCZ7Q6
	p4TqTh69cKg42AM/7Ud6NHQ6RnQGr1ypmTZrOqyB8TC38gFmdeZ7oTrcpYg==
X-Gm-Gg: ASbGncv7VGV3RTx3q6jbeRC00RK5ivUvcAHO2EnkENONimNpVR/3vBFolH34+6AsRi7
	GfuvZEplGtskx30p6y/81kMb0lmSdBpMOd01yqAv3wudjCPttH8xyQBSlLvMjUbVXebToDqEH3A
	pAUNIg3shh82TWP5ZP4Vm9PhDrfQZWDSiboIxNxs9Hm450oFu9QweqIG/BRe1nlCFaG7pzVRupi
	GBSBeV41zzivoKx/3FlIffrdZW8WoS+M5Fc+3GqsaxSSF3kajIq36tVEAh7KeYntoix9peGyefg
	zfqhdn6CIo3ASjO4NUsjT/z0CznY5m0DK2tXm5LoUZdUaB6oPQxrYVTiBscWcW02ZGaO0Q==
X-Received: by 2002:a5d:5f49:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a8ffccac13mr3261002f8f.29.1751032659738;
        Fri, 27 Jun 2025 06:57:39 -0700 (PDT)
X-Received: by 2002:a5d:5f49:0:b0:3a3:7ba5:9618 with SMTP id ffacd0b85a97d-3a8ffccac13mr3260974f8f.29.1751032659283;
        Fri, 27 Jun 2025 06:57:39 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm2812108f8f.0.2025.06.27.06.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 06:57:38 -0700 (PDT)
Message-ID: <adf5e6e5-e0e3-44f9-949c-620aea3edfa0@redhat.com>
Date: Fri, 27 Jun 2025 15:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 4/9] hw/arm/virt-acpi-build: Improve comment in
 build_iort
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-5-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-5-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6voy1th0GaSF-Ifrid1DOTBEaisZibwM_BeQUK6hs70_1751032660
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: QOwxvojKAJN1

Hi Gustavo,

On 6/23/25 3:57 PM, Gustavo Romero wrote:
> When building the Root Complex table, the comment about the code that
s/table/node? or do you refer to the IORT table?
> maps the RC node to SMMU node is misleading because it reads
> "RC -> SMMUv3 -> ITS", but the code is only mapping the RCs IDs to the
> SMMUv3 node. The step of mapping from the SMMUv3 IDs to the ITS Group
> node is actually defined in another table (in the SMMUv3 node). So
> change the comment to read "RC -> SMMUv3" instead.
>
> Signed-off-by Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9eee284c80..e9cd3fb351 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -370,7 +370,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>          build_append_int_noprefix(table_data, 0, 4);
>  
> -        /* output IORT node is the ITS group node (the first node) */
> +        /* Output IORT node is the ITS Group node (the first node) */
>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
>  
> @@ -407,23 +407,36 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      if (vms->iommu == VIRT_IOMMU_SMMUV3) {
>          AcpiIortIdMapping *range;
>  
> -        /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
> +        /*
> +         * Map RIDs (input) from RC to SMMUv3 nodes: RC -> SMMUv3.
> +         *
> +         * N.B.: The mapping from SMMUv3 to ITS Group node (SMMUv3 -> ITS) is
> +         * defined in the SMMUv3 table, where all SMMUv3 IDs are mapped to the
s/table/node
> +         * ITS Group node.
> +         */
>          for (i = 0; i < smmu_idmaps->len; i++) {
>              range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> -            /* output IORT node is the smmuv3 node */
> +            /* Output IORT node is the SMMUv3 node. */
>              build_iort_id_mapping(table_data, range->input_base,
>                                    range->id_count, smmu_offset);
>          }
>  
> -        /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
> +        /*
> +         * Map bypassed (don't go throught the SMMU) RIDs (input) to ITS Group
> +         * node directly: RC -> ITS.
> +         */
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
> +         * Map all RIDs (input) to ITS Group node directly, since there is no
> +         * SMMU: RC -> ITS.
> +         * Output IORT node is the ITS Group node (the first node).
> +         */
>          build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
>      }
>  
Besides:
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Eric
