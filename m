Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6320706njd;
        Mon, 7 Apr 2025 05:08:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSUjPnUOlp+juxG7t9gj6SqEhk3JYmvQ193csf09Tje6eHxCHWBs+WrzrcdBbFlHAtt/yK+TXPcKerPw==@linaro.org
X-Google-Smtp-Source: AGHT+IHq6rT+/9tIdRbpB5+ZK9Z3ve+PojX+1KWse3EyGLoK/7UzRRJm6QZ32pvhSSQtuP8OYVT+
X-Received: by 2002:a05:690c:690a:b0:6fb:b2de:a2c3 with SMTP id 00721157ae682-703f417dca7mr145752057b3.9.1744027706807;
        Mon, 07 Apr 2025 05:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744027706; cv=none;
        d=google.com; s=arc-20240605;
        b=Fsj8L3L20fGT5yCDuZAgn6degDJiVYMfkXSs/OKwcR6wIh4kGPkUC9W2T+CiFxEf/2
         rZDitJaMlEb0n19Lc2deOLOwRZoSg8otolMxpkJooXFl9eQfOWhObr52Y7Xn6MMZ0AZR
         ubuHT76X1ka/W+X5hMCaArWNlXKE2OkInO9tMKjd1IW36zD11GJRrJ2ddmlGVxxoUuwP
         /eiKXr5mibIoV6OC8X5x62o6nahOttqKpOPYNt79J5phYqo0PMmbLsGNyi7TqfAVDE+3
         TF0OwYG437LVI+GPQuFxcTnz/ezINlHbSrmE6mQCdxZD3d/sY/ABjAN7iZN1YQjROd+s
         Uc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mj/dzqXQb6D6L5bKjxFn8KcdxD9+qRjWUBiBrM5ZAXs=;
        fh=LjNm0ENY3iVV3nJRy4iCQlPbKCzkejGL1yGGyFIlZXY=;
        b=c0i6Q3MxmJAyXv0wFI3R51TIZSvZw8Y5S6wbKjbhdBMjJvEXEpgUfnSCxA9rJY99Q7
         RiZmOtUimV6H0a1nf2zeWbWLpoKeUTjN5tD8mc3xei1ZkBkuPfwcdn1i2qSNuj0bfg5+
         nqpUTD2l3dLaSK5m7vZc8l1Niu8k0UUYkwpah5qYK5hNpV16noZY2WRgEAIRToTs7HC9
         qA2bBYlfKB3N+f6okUb9KfS3XHQ2NVJPc5bYvaF60O01pfTmOUMjC0gH1mWQ2fKoSHW9
         hOiM07Vd/iG+BrVUEoA323Rlk4DjbC8fKOcrFq2LYQRTE/TtaTYzQf7jZnsVHDEhrtKH
         bRVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NCjmVQ1b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-703d1e6b482si148616427b3.139.2025.04.07.05.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NCjmVQ1b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744027706;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mj/dzqXQb6D6L5bKjxFn8KcdxD9+qRjWUBiBrM5ZAXs=;
	b=NCjmVQ1bX1Cb10+Hrs0btx216gUfhJeFqZlX9TJNJiyMRv+2hu0ag3EOsmWwQpTlUEQukw
	20WkzZBch/6a9/Kx3rPeB4GXxA+dNqm8uRj5mpy8pRjFU7y7tVlWkg1IZF1HcRxxqWQNLD
	GGN0dsmLhnUtCZ43iJMYp7hET8wJ4Ek=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-mMfRhrUnPmKMPQYbM9Q0Vw-1; Mon, 07 Apr 2025 08:08:25 -0400
X-MC-Unique: mMfRhrUnPmKMPQYbM9Q0Vw-1
X-Mimecast-MFC-AGG-ID: mMfRhrUnPmKMPQYbM9Q0Vw_1744027704
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913f97d115so2130540f8f.0
        for <alex.bennee@linaro.org>; Mon, 07 Apr 2025 05:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027704; x=1744632504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mj/dzqXQb6D6L5bKjxFn8KcdxD9+qRjWUBiBrM5ZAXs=;
        b=JWSztiyYUTAVLLOrpoRSL2uMvs3hJkQvgsRN1yfVlXG+2C/KQBrqVtWoIpBw4Mp1Fl
         IKYfADW76JT2up3qWXXitFG/8lAoUQkXCvGmfF3BUONWXgpAXpPERbRc6SSt7YSd7dAi
         CHZR2038YqvpceA2NvnWIZu8j5FCep1wDUbh3WNY4lxs7dZFohkJTHiUqMcpw3pmaw6y
         bNr1T6ltQIf8lzbdPVpMQObapKJjNlPSkWUiR2eq25vClGzDGXZlGHj2M6tmkJOrGL9c
         ZOQa0ZRX+2Lt0pfXABoebXdpT4FJ7ZdFoknNqJ71hhIESGgMwsAOfwtKlvWeq9wuLOkS
         3mTA==
X-Forwarded-Encrypted: i=1; AJvYcCUpzhg7t/cOvLsWzHj1UVgJlPXXu17d/eDz9b2QsFee5m8WuUG4yai5VrQwKA7ptW25J6xfofZwJqjNCA==@linaro.org
X-Gm-Message-State: AOJu0Yzqqe2lLUML0H5orYTCv09dDabd8dmKt5UYPfDzSpdibJqsZz5K
	FZIGF9Z2UCxc0yjoDQ0jAhJxbbVmglahhOb2N8/kfSrc7u85QEdJ8FABrMzIfNGtqUshpklhLVI
	TpzJKsrEkM5kmMTZ6u2j3Ov9oYO5qDzkLZR+CMYTsQZOw44LuiKvDyg==
X-Gm-Gg: ASbGncuulJaiRdIPyDxAJ+8Xk0sGUqvj7CD4UkH8EmQanCSEt39UT0/rYiObCbyZ97z
	8XTt9NDYwVFav/Z3CpnMLMYZfZpg8GP+4qOsZuLybubZJCAWOwgHjzY2PEkt8lFazn0PKmqLRk6
	nSHYSPMn0e8Ks6+Jxj0Qbe53L8sKAv71rEndmy0UPCUdeIh1a/h6xZLcO2H6wsYipmmJad9FYi4
	toXGGNhzB3qkVj5JAkxMuZpe/e3ZhpnQkwHlVBg5tevmAP+ggkvhSJsecqQ1Y2Y4Fn8DaKAup81
	FVPL365H6Pe44wYGQ7AONoY53VmigeFAMxxB6Ij9MnSYo71Rxb7tW9QuVhb4y94=
X-Received: by 2002:a05:6000:4212:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-39c2e6219b2mr14459481f8f.15.1744027704017;
        Mon, 07 Apr 2025 05:08:24 -0700 (PDT)
X-Received: by 2002:a05:6000:4212:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-39c2e6219b2mr14459454f8f.15.1744027703663;
        Mon, 07 Apr 2025 05:08:23 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3428298sm129662595e9.8.2025.04.07.05.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 05:08:22 -0700 (PDT)
Message-ID: <d5b9e64f-6fe3-4de9-ba4b-4cf3b61a5800@redhat.com>
Date: Mon, 7 Apr 2025 14:08:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v3 4/9] hw/arm/virt-acpi: Factor its_enabled()
 helper out
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
 <20250403204029.47958-5-philmd@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250403204029.47958-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J0-GghX67vO14x0sgPiD2m45923XQX1nqNRZyzbfhpI_1744027704
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0rKS5wEjS75o



On 4/3/25 10:40 PM, Philippe Mathieu-Daudé wrote:
> GIC ITS is checked for the MADT and IORT tables.
> Factor the checks out to the its_enabled() helper.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt-acpi-build.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9b7fc99f170..1c389ef5cdb 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>  #define ROOT_COMPLEX_ENTRY_SIZE 36
>  #define IORT_NODE_OFFSET 48
>  
> +static bool its_enabled(VirtMachineState *vms)
> +{
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +
> +    return !vmc->no_its;
> +}
> +
>  /*
>   * Append an ID mapping entry as described by "Table 4 ID mapping format" in
>   * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
> @@ -670,7 +677,6 @@ static void
>  build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
>      int i;
> -    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      const MemMapEntry *memmap = vms->memmap;
>      AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>                          .oem_table_id = vms->oem_table_id };
> @@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                            memmap[VIRT_HIGH_GIC_REDIST2].size);
>          }
>  
> -        if (!vmc->no_its) {
> +        if (its_enabled(vms)) {
>              /*
>               * ACPI spec, Revision 6.0 Errata A
>               * (original 6.0 definition has invalid Length)
> @@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                            vms->oem_table_id);
>      }
>  
> -    if (!vmc->no_its) {
> +    if (its_enabled(vms)) {
>          acpi_add_table(table_offsets, tables_blob);
>          build_iort(tables_blob, tables->linker, vms);
>      }
