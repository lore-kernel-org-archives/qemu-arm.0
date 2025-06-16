Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1859874njc;
        Mon, 16 Jun 2025 06:33:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0aRGnVTZkKkHncXBGLg+Tr8ldd50Ch0GHQy/m2fBZ+MXXksbg1PfpGTfbiUKm+mPXch3RJJ4u/WbKUQ==@linaro.org
X-Received: by 2002:a05:6000:188b:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a572e79d24mr7609623f8f.33.1750080810907;
        Mon, 16 Jun 2025 06:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080810; cv=none;
        d=google.com; s=arc-20240605;
        b=A+BAQCYys4mWjpZeQed8sZaFskowcCCmuNXc5tMJ7n9ScoubFen1fG3S8wCjDir/jf
         P9ss/PgPsEyq+rTpCW/vQjTLxirJZmPRZDuG24dKSe9S6fJiQuqfCOZQwwxaRS+fxOWQ
         IhKiIuWwdo/OgIAP5oYbmUrr2uN81HmOucvNhyYHywD1E3ij1bivnyFo8YcVmIMa+Mlv
         uz6nR7fsJJZdvXHZ3GlSBNeD5jCU530KGmK6OLo8Ai9Sm9pHrsX+59sf5JRAlknFRhfj
         eY9TjBFz6gtZfS7WIO26W1Jsn31NPWAeBDZvluWoRnGPXdR1+QswBOpIzTbQ/IYqLXZs
         W/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OLBiGdFQBYSuCjE9HOzR5RujC6zuqYW1dMFD/IFCbwM=;
        fh=DFEdlSh14UCUK0avu7ESpukroDt240QMFQagDX9hURA=;
        b=HPlTNeDX5ywmcPCcrdrLNY1A4euC/4xs0kazcCrUQrtsQTFrQhX3xGNzXpKvdlBRW8
         DaRQ3xdzK6QjeGgMYUI7WLB4JvcKnwLsJlxcAiMV0hb6Pne3PikYsPNcIlIrWdwoAOcr
         mR+X6/ggDrRlDBjP8u7HbtHNmguaBahXtXEvTklDRODqNcjVlXvjFuYetEkiwsH1NfLI
         kUjCe0ep/0Ql1hHq5pSplZjwyCs3Z+v5Lj2hIUkFDdXSdVI89wzvrKb+Y1ztaGoekVaf
         8Yp2qIAshvhc87t0zyDQYajWhSl94UnScOOikAPUI/WcfNn/GS+iKP+hltPJ2m0e2aa4
         +Ocw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RLNeuFd/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a56196e277sor2520963f8f.2.2025.06.16.06.33.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="RLNeuFd/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080810; x=1750685610; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OLBiGdFQBYSuCjE9HOzR5RujC6zuqYW1dMFD/IFCbwM=;
        b=RLNeuFd/VEhcqYBYz7q1WmkH5As1P7qKmJ2FtsZWQ3WE0Q77JWYiXo5ZshrFn2Ydwe
         tidx+TGFJa1kIIZMwX7B6Cj3gI51ztGWsFZev5rxeGhB6xJah19wKsUh0TO6E9aUyTke
         hJuzzWBoChNTlgFWzt6c4wcAePqqDR7BZ7kudzIwLROL0EMiE9aMZIZDx+9ZXjsA2ab3
         QJeSKghStgrOleh1h8SoUGzSEqKBOj1/aJzIzO9iVQU1OfNwyRJga4BU4NE2RWzVxbN/
         Inx+QtBEDV4jGaVrJoJQo3PsZVrTMFhfcA+AfDRtaG4QI+24VV4QM8FVhM7KB1ZAu1gZ
         BMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080810; x=1750685610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLBiGdFQBYSuCjE9HOzR5RujC6zuqYW1dMFD/IFCbwM=;
        b=WrRXa0Ej0B+ggUvtpYKz3I8EMvxqaZU9aoBYj+oKrfTtPpYQy/cILQValH8wD1nV5D
         oHh/dvvfKbUogJTtE28+KIx9aRJw4lwLUu4x67FsR/3ge9BglFZRZdi/ikLwktkW+s58
         HHbhW76dulzHm3xGl6G/yqrDp7HYkAQQScx9Xjdw8s1oFXGYKEzy9Aot1Ke7t9j1NN5P
         Asr/8s1jWvGToP2KJKfUBCqsQYoJcy+1sOVlUqmW85pEcI8V08R849wCBb9S2cWpl0ev
         vNa/V83Guxxd6xJMrLmavXYH8hXHj+51BrLtRrarJq3VMJku93WW9pnxpMD2xJsfQ8s/
         wEsg==
X-Forwarded-Encrypted: i=1; AJvYcCULi7qHuyfg8TDWOeqaS1ycZK9GzY79lb/x7msXtd4gf3cAea+S4NQX23eO07UzgolEaUFB3UpZ/Ksytw==@linaro.org
X-Gm-Message-State: AOJu0YwaT+LykEFCyDVE/YgF2jj6fLdasKNFLLwnRVAu9w/AqWCSs7BX
	A3Db90aKEKwxTlKeJKZkWSkS92jj4mal5yETafEuPqbSYfVYOPkjMVup4/sTokhAn8wz7w==
X-Gm-Gg: ASbGnctK8HLDCAetxpKd1Aty+jS/xcgG5k3vf+v45k4uNmnXwZ4xY8EPO//UCYnpbS0
	Ijd79tNrAwGHizn9MqsP0PuDgTgOewpki0vgWtyggwwx4Gd9PyEfPCaETMDZLUhymxhsIg38O+0
	EFjRjvdLLqgzyyhJAJrCJ1EQXKQHnI84SD2kUjp5s0O+W8REBRetp6mfDnjBnZrF3DAl0VA1sIp
	EmDq/EKHt+TZ0Wap3yewQHfcwDpdjh98EIh2UPFfW9NfwY/oYBgLc2koPmYPMIz8OkAjXPs9M7U
	E+bm+NPKlWrnZGoDKhT37CIZ04BHhpcgDiyiWv4FTpeLp3IauP5WCnHEtBBABZ6i9xFZA9GzyYE
	Ayg20reN0PD8eQROc9Y1scSKUFfQJsA==
X-Google-Smtp-Source: AGHT+IE580eB4gDixRbSCBfpsvK3enjr+M1j09ArqGPbt+1MBAuB68pk2dqysHu0uKliTlQ68Onp2g==
X-Received: by 2002:a05:6000:25f9:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a572e9a4a5mr7316014f8f.53.1750080810284;
        Mon, 16 Jun 2025 06:33:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08e21sm11236902f8f.52.2025.06.16.06.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:33:29 -0700 (PDT)
Message-ID: <70853fdc-ef08-40ad-85a9-5cb02146cf23@linaro.org>
Date: Mon, 16 Jun 2025 15:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] hw/intc/gicv3_its: Do not check its_class_name()
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 eric.auger@redhat.com, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, Richard Henderson <richard.henderson@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-2-gustavo.romero@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250616131824.425315-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: X+FU2kHXN7+i

Hi Gustavo, why reset authorship?

On 16/6/25 15:18, Gustavo Romero wrote:
> Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"), the single
> implementation of its_class_name() no longer returns NULL (it now always
> returns a valid char pointer). Hence, update the prototype docstring and
> remove the tautological checks that use the its_class_name() returned
> value.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/arm/virt-acpi-build.c               | 32 +++++++++++---------------
>   include/hw/intc/arm_gicv3_its_common.h |  2 +-
>   2 files changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7e8e0f0298..9eee284c80 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -737,20 +737,18 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                             memmap[VIRT_HIGH_GIC_REDIST2].size);
>           }
>   
> -        if (its_class_name()) {
> -            /*
> -             * ACPI spec, Revision 6.0 Errata A
> -             * (original 6.0 definition has invalid Length)
> -             * 5.2.12.18 GIC ITS Structure
> -             */
> -            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
> -            build_append_int_noprefix(table_data, 20, 1);   /* Length */
> -            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> -            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
> -            /* Physical Base Address */
> -            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
> -            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
> -        }
> +        /*
> +         * ACPI spec, Revision 6.0 Errata A
> +         * (original 6.0 definition has invalid Length)
> +         * 5.2.12.18 GIC ITS Structure
> +         */
> +        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
> +        build_append_int_noprefix(table_data, 20, 1);   /* Length */
> +        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
> +        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
> +        /* Physical Base Address */
> +        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
> +        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>       } else {
>           const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>   
> @@ -969,10 +967,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                             vms->oem_table_id);
>       }
>   
> -    if (its_class_name()) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        build_iort(tables_blob, tables->linker, vms);
> -    }
> +    acpi_add_table(table_offsets, tables_blob);
> +    build_iort(tables_blob, tables->linker, vms);
>   
>   #ifdef CONFIG_TPM
>       if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 7dc712b38d..3c7b543b01 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
>    * Return the ITS class name to use depending on whether KVM acceleration
>    * and KVM CAP_SIGNAL_MSI are supported
>    *
> - * Returns: class name to use or NULL
> + * Returns: class name to use
>    */
>   const char *its_class_name(void);
>   
