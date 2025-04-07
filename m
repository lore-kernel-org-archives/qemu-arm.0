Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6313115njd;
        Mon, 7 Apr 2025 04:57:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPFNRZ8spM9Nzv0PCtUWK0FPF19uwkGbODAXx5FAp3onsefMf45CovgwrlOG4LKRpBVUL2ofGDV7flhA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGzy84eQUvtpAO9O8n4CPx12IZ2o2pBswsZPYBmqM+SWiJD7KODpcehG0OR3oEQpT8E5xC
X-Received: by 2002:a05:690c:3686:b0:703:ac44:d37e with SMTP id 00721157ae682-703f42fc111mr152917707b3.37.1744027079537;
        Mon, 07 Apr 2025 04:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744027079; cv=none;
        d=google.com; s=arc-20240605;
        b=i5R16AGLZFGtpLv+wcaZ92ka46w1DcuauAMI6sSLq0cu20a70Pp8QCvdX/rbhV3MXF
         FFc+SwPgcajffUii0p2ExpSd70MhBvdT9YMCl1KyU2shG2B6bLx7TPlbcbTmUMJeMoAZ
         WF3KbJLLlLFQ5Pv4ZpBOr4z3R5vnQbOC7jEySD/FYxa2s7aBMZJ0AXw6JKCklhLETMxD
         eGCr1Ow0vd4pAyyQfaZp34kZdNNbkhqzXJ8LGTnK1ZT2HvZ2YpXsUYYXMbhRNghYZb0a
         YH6tIq1KgrKmWnHtxfBFoOyq6tLx8oJQzPCStbJB399agbqJl/9Awec0Wd2tXDJa6YEG
         CsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=HfCd/rfuyo4t21RXrxy75FbjT51rAw+UXob9nloqexM=;
        fh=kGoRM0SAUVNzcOGTQ6i5F5MGJYc2l8HcZemz+zChax4=;
        b=HyOFZVdN3LnkgX53g/VuPVNHQXIulFMifhPkMzLr1lnXT9VLlxsO2VKO0/e6bC+X6S
         M93WPYMYnz9IwG6sxNRLsusY4QfXeR4raG/HkYv3PMa4zRNrdEZLe+rZo6j8oLxGDyCd
         D3EXwGLYTQOVf3IiEOz2f87DjVaqw/6Osp0qs2ACpOuW7SilKJmdIuPLwOvyrJ7o1bhe
         0a/Mto4iysT4yH2PturJ6P+WK9CPF1HaqqYBcAeXeQo7GSxCVUHY2llMBu5iWNmjkIGZ
         VEYIoFELHadY91XKv9IorObepfccqSSUQAe2yLVKMMc8udPIqzo5eviVDA+FfQBSD7vQ
         dQHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPae3E6n;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e6e0c6c22efsi12963654276.117.2025.04.07.04.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:57:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPae3E6n;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027079;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCd/rfuyo4t21RXrxy75FbjT51rAw+UXob9nloqexM=;
	b=WPae3E6nKFeYYKwBoBbVBg1SHqET2bNo4PrGMJlfOH5nmYjCmmmnEmXTlohevnfJAXgNSF
	76+vbB/QrTPcSWAjUiyCx18OG+BwJf6gVRHlOKMHcmphv3fGasucXp3f0qSV8FKurOq725
	i6q9N/0TKZZirlqX+XpTrfh7TPh32bQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-x5nzjetsMcOePP2L_pwByQ-1; Mon, 07 Apr 2025 07:57:58 -0400
X-MC-Unique: x5nzjetsMcOePP2L_pwByQ-1
X-Mimecast-MFC-AGG-ID: x5nzjetsMcOePP2L_pwByQ_1744027077
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso54033265e9.2
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 04:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027077; x=1744631877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfCd/rfuyo4t21RXrxy75FbjT51rAw+UXob9nloqexM=;
        b=PaOLAW3dL9LfoIMGdtYWe4WaHBta+MAcI3EsEQhhwE6k5gfol4MT1jiNAAeJErFXw2
         tJ3Vm9g5b1+JjaBUFlM5X+r2u1QdkpF+hBK31JnLGuesC2uEYMZiU3WvesNA/SGAacJD
         u/NARzM/ewCqLNXZmQWViEVoGbMYQKFw/qbGSuj4+YIIC9EuCX4Cgpo9quW2hJUSEPXa
         Hjz3W1Sb9YkHirs6PeyhX3dp5aDNaUqvHuPI8ZKyzOPQ55gx+m2KNQA40CUjDJKRFDW1
         FYy1trwILFKb5HERbFcFIcCs76WGcfpjUHSK4KK38EQ9Q75MIfvhlbqwll6TeWQQLNmS
         2tUw==
X-Forwarded-Encrypted: i=1; AJvYcCUT2M0TDuR51X3Zv3ZTOOGHuxy0pvKufDoFDybbeU0/aGig123ZzynBxNYhigXpdl3dm8tj2SlkdNusoA==@linaro.org
X-Gm-Message-State: AOJu0YxXPnbs/iXy2Lqik3LGAy7VO9ewGDKXGKofUcpYk9DEFoLYeak6
	0z5J9NTKyPB4AFn4X+90yc1rvES6JeN8JVSOCmTUSuUcU+Tw3sQTqocODrDlguImVNk6m0DG83I
	2y/rl3Rt6jwVWTzXhPRPdCFPGvOP1j+B3yvivbZMl6ELjG3HZDdfB5w==
X-Gm-Gg: ASbGncunaU/0Gm+hwj1KtebugaFfFDE7rA/i5dOj6bHjr33Kk9fLBOjMQKhegb+ugcI
	LO9hfs6BFhvO7bcaGFSW6y/+hXqscBviDrLE9NqRTuy9Vk2UzTK9NC+LvPk1HANjwh+qx+3j/Tz
	ZpX5PPME/Lxjoctz6sffGfL+B8iUURqco3Ua8NtJ8iHd6VusWdy0m9MBZHo4iAgBhF8pSeZbK9x
	8ixuvIWvH87ZASmgVQMowudMoygspHWbLRrRnB96NI9PVXHRynG+MO6+uoc/2dUt9jeXVpcFpNn
	7OKBkYjtC6+2apVqaYJhekVn6bT+ReA7qx5qsVfFGr9jLrdT4uGKhi2XGYS8Vco=
X-Received: by 2002:a05:600c:35c2:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43ed0b48208mr102185465e9.3.1744027076790;
        Mon, 07 Apr 2025 04:57:56 -0700 (PDT)
X-Received: by 2002:a05:600c:35c2:b0:43d:2313:7b54 with SMTP id 5b1f17b1804b1-43ed0b48208mr102185295e9.3.1744027076455;
        Mon, 07 Apr 2025 04:57:56 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm128003355e9.35.2025.04.07.04.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:57:55 -0700 (PDT)
Message-ID: <8dec4e22-4a7f-4016-83c4-e39eba4203a2@redhat.com>
Date: Mon, 7 Apr 2025 13:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 2/9] hw/intc/gicv3_its: Do not check
 its_class_name() for NULL
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Udo Steinberg <udo@hypervisor.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
 <20250403204029.47958-3-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250403204029.47958-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w8PSJyIKQQQKbkgiAlTXrQM7iLBZ2qn3ezvAH2RkDc0_1744027077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RMIvohdrJdV5



On 4/3/25 10:40 PM, Philippe Mathieu-Daudé wrote:
> Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"),
> its_class_name() single implementation doesn't return NULL
> anymore. Update the prototype docstring, and remove the
> pointless checks.
>
> Reported-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/intc/arm_gicv3_its_common.h | 2 +-
>  hw/arm/virt-acpi-build.c               | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 7dc712b38d2..3c7b543b018 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
>   * Return the ITS class name to use depending on whether KVM acceleration
>   * and KVM CAP_SIGNAL_MSI are supported
>   *
> - * Returns: class name to use or NULL
> + * Returns: class name to use
>   */
>  const char *its_class_name(void);
>  
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e1786..9b7fc99f170 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -741,7 +741,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                            memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
> -        if (its_class_name() && !vmc->no_its) {
> +        if (!vmc->no_its) {
>              /*
>               * ACPI spec, Revision 6.0 Errata A
>               * (original 6.0 definition has invalid Length)
> @@ -973,7 +973,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                            vms->oem_table_id);
>      }
>  
> -    if (its_class_name() && !vmc->no_its) {
> +    if (!vmc->no_its) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_iort(tables_blob, tables->linker, vms);
>      }
