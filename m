Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1873865njc;
        Mon, 16 Jun 2025 06:58:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDx+5J3OJlOYKjJprhI4YyjsySCXhN558IiPbMwGhEWUUNMExsarGlBAq8aEcseWmI5NQbGbm7Yhk4lA==@linaro.org
X-Received: by 2002:a05:6a20:7d9e:b0:201:85f4:ade6 with SMTP id adf61e73a8af0-21fbd65e19cmr14662281637.27.1750082293338;
        Mon, 16 Jun 2025 06:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750082293; cv=none;
        d=google.com; s=arc-20240605;
        b=abpLAxZnCWqbGPt3igWU9aZYIEn7FWJClGmRkg/7bBZ0s4jhwTsYAM1VpNYy82xSIu
         YbrPsxz6Zvd8Rkf0w12ySc1yU9Wj6GM4vWqbtQWqwgW6QwgeudZ72C/Iibesb9zY9TXG
         ycunnprJsUtwbIzL+0sEWyh89hxuvIVLG0tsb068dnNRoZTavX/w4Gt59iWIGGm36jce
         rCjO3XtYK6+2yvmGqKapCS85Z3me1VcJ0emmNwEsqyYerfwz8cdGJLPFneZN6UJVkTgh
         yS+kycV/42hUtEAMEypvYm82vJchW2S5jJclMzZhpAygaIXWzKqkenqPAotl/ZfUdyUA
         cy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=w8YHxwMmQT2dMZDk/cIISk6jqJUWgkRqW39sQK3NAAw=;
        fh=iqDsCFB4Gvfj2FttzUdCAbZcosvUlg6hFkVoJNr/9ro=;
        b=K2uGVPA6P+kEi3HRE4dFO/DZkYPBS5XvDHuKd1uEcdhepEhgs+279LXIKTEakKz6Mq
         8lz+z3Fw4wQ0r2gz7urgo2Kt7q+G4VefRkoFjPLbFmIHrCjeWRlSG/UYnvRC72VtEfyU
         nHF9uUPF2SZDOwQiownK2u+CWPSMZvpnsz78Y6OAnOBYJhholx5c9MZP0bOMOXwlqiOF
         q101MzwV2hdePhvW4eqpPaQjoNwgX0uCpyCJFUPI1zz7XpovKAjrjok5dNAIVSd3DS6n
         77gyXYDhGR+rHKzT0BktJiif5A6FbXbhRPC7TXG6KXgdqFY02Po4EqWw50M+rMxCztPB
         zlFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUeER7IP;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b2fd5e8fc72sor6863365a12.0.2025.06.16.06.58.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FUeER7IP;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750082293; x=1750687093; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w8YHxwMmQT2dMZDk/cIISk6jqJUWgkRqW39sQK3NAAw=;
        b=FUeER7IPy12M38vY4GedyHcKS5bw8MBJaQPr1agRaZ9CM8Y68Gy/IRrOyMJEOCvCI/
         OvNwrAWUWZ+m6CCiJJnaMLEQIxYcZxNz7J19ywIyLT/4He0nX3eZe2prF90vZQSDn0cB
         jIWT0Z07o36/p25qISXigujbynVDDmhz06eZ7aEAFt6DqrSz8/g5LdLxCVB9Hor2Q5Vq
         VzmRl9IKjDe9VL4VHDv/xjgNDHkQPQWTrHAiQeD7c56IFP71HPCdQ8UtBiteBaKTRj+E
         G3vX+oV9LJVfYNLfMm10EEyFcJjiuF2k0rsVuUzYhDZipyLFh/VPiZ8XHKMbOER1G3k5
         IAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082293; x=1750687093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8YHxwMmQT2dMZDk/cIISk6jqJUWgkRqW39sQK3NAAw=;
        b=QX9gEg7YRcudqHvry3F8FgtZHnZjMO2UXnxQxKttRicDXIOgpU3HBuULlOHbYqxDSt
         NQq3y5Ed4/PkegS/G85m7ubmsYxGb0IAns9V8VwJhshInfiBmYoTF2XcdwVVcqiI/pfU
         u5XDCUyNX32V57OD4VjiTGuRup6EtMCIhQAd/hZojB9QLGr/rshFiNSoSVtpbaCWyGp1
         WqPsANPSYoW5l1pxZeCdUgf8jPrCQ5VijhS1ihnuSTsqLq2OiSrBVSQjHDX6p+9a8Yz0
         8SKwiEtbbrPpljYO1ftgrwoMst0Lfm2nkYv1K6fwQv0erUbFigE//fII80U/92mkV/XA
         znmw==
X-Forwarded-Encrypted: i=1; AJvYcCXF59EPt7b7+zwhIF/SjIUywn2vAiYz62Jyd/4C8T7aqU5cMvPB7VVh4xD085gWGwTXC9E3ebfTupvJog==@linaro.org
X-Gm-Message-State: AOJu0YxxJEKkMmh35LKq3+UBoK3d4xFFlmGIEf6/SX3C3+gCD49uIKkO
	CklINC+oevIAr1mWi7uaV72j8HE7jwDm7lkv3XPDlWNqoEdVegiD7T6Vlu2ucupx3BEZag==
X-Gm-Gg: ASbGncsey4yxikGMCP9Furl8pV+GE2M+eW8fDLkNzy1llvtsgXbAnYo7vWhaDIbOX/1
	fIGphodar6Ns5Gx32QoTBqjTyNMSOublj2KgGbMQ7fhyKKk41/y7SVwHGtDUWt6eiyUxPIrkOPH
	GZ8NiKoWd9I3pDKGfCfGUvXAzoU1Hn74G3sVoe/SDc21QtdG2VjEZf3n9aUyIBHfck9xQrbk74d
	wtODLPJEbFAyz4aWSXaLh++EShnX0xhITnbe1Z50MGNIlqSncJ6KJ0CnTbrZRFnV6p9FPGvybUM
	r+vQgImYRa7k+EmS5tpKb0aajKDElZTaO/1TagfHlAP/dnVk25IpezQSLUYegPgv+TDfbFMiFw=
	=
X-Google-Smtp-Source: AGHT+IHEQ71sYRD9lXreOK86iZrdzV+jd04+z28rTqgrMo/3stsd6RGkCd/0GYHKK067LwLQAn3M7w==
X-Received: by 2002:a05:6a21:9210:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-21fbd54a6eemr12568905637.1.1750082292789;
        Mon, 16 Jun 2025 06:58:12 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cc047sm7072670b3a.147.2025.06.16.06.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:58:12 -0700 (PDT)
Message-ID: <09652baa-2f0f-4fee-82ba-35847461242d@linaro.org>
Date: Mon, 16 Jun 2025 10:57:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] hw/intc/gicv3_its: Do not check its_class_name()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, eric.auger@redhat.com, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, Richard Henderson <richard.henderson@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
 <20250616131824.425315-2-gustavo.romero@linaro.org>
 <70853fdc-ef08-40ad-85a9-5cb02146cf23@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <70853fdc-ef08-40ad-85a9-5cb02146cf23@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GR/TSgWjpZfW

Hi Phil,

On 6/16/25 10:33, Philippe Mathieu-Daudé wrote:
> Hi Gustavo, why reset authorship?

It was not intentional. hmm maybe it changed because I tweaked
the commit message and the code due to rebasing as well? Do you
know how to restore it?


Cheers,
Gustavo

> On 16/6/25 15:18, Gustavo Romero wrote:
>> Since commit cc5e719e2c8 ("kvm: require KVM_CAP_SIGNAL_MSI"), the single
>> implementation of its_class_name() no longer returns NULL (it now always
>> returns a valid char pointer). Hence, update the prototype docstring and
>> remove the tautological checks that use the its_class_name() returned
>> value.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   hw/arm/virt-acpi-build.c               | 32 +++++++++++---------------
>>   include/hw/intc/arm_gicv3_its_common.h |  2 +-
>>   2 files changed, 15 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 7e8e0f0298..9eee284c80 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -737,20 +737,18 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>                                             memmap[VIRT_HIGH_GIC_REDIST2].size);
>>           }
>> -        if (its_class_name()) {
>> -            /*
>> -             * ACPI spec, Revision 6.0 Errata A
>> -             * (original 6.0 definition has invalid Length)
>> -             * 5.2.12.18 GIC ITS Structure
>> -             */
>> -            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
>> -            build_append_int_noprefix(table_data, 20, 1);   /* Length */
>> -            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>> -            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
>> -            /* Physical Base Address */
>> -            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
>> -            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>> -        }
>> +        /*
>> +         * ACPI spec, Revision 6.0 Errata A
>> +         * (original 6.0 definition has invalid Length)
>> +         * 5.2.12.18 GIC ITS Structure
>> +         */
>> +        build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
>> +        build_append_int_noprefix(table_data, 20, 1);   /* Length */
>> +        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
>> +        build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
>> +        /* Physical Base Address */
>> +        build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
>> +        build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
>>       } else {
>>           const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
>> @@ -969,10 +967,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>>                             vms->oem_table_id);
>>       }
>> -    if (its_class_name()) {
>> -        acpi_add_table(table_offsets, tables_blob);
>> -        build_iort(tables_blob, tables->linker, vms);
>> -    }
>> +    acpi_add_table(table_offsets, tables_blob);
>> +    build_iort(tables_blob, tables->linker, vms);
>>   #ifdef CONFIG_TPM
>>       if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
>> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
>> index 7dc712b38d..3c7b543b01 100644
>> --- a/include/hw/intc/arm_gicv3_its_common.h
>> +++ b/include/hw/intc/arm_gicv3_its_common.h
>> @@ -128,7 +128,7 @@ struct GICv3ITSCommonClass {
>>    * Return the ITS class name to use depending on whether KVM acceleration
>>    * and KVM CAP_SIGNAL_MSI are supported
>>    *
>> - * Returns: class name to use or NULL
>> + * Returns: class name to use
>>    */
>>   const char *its_class_name(void);
> 
