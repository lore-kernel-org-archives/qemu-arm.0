Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3262350njd;
        Tue, 1 Apr 2025 23:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX//TA2OgC0kTYUMd+YPWSRy04A/lOheuPBRYcaIR78rMLGBc7o6tV6GPv+wjDQQ0snrbdwsePYs9HQjA==@linaro.org
X-Google-Smtp-Source: AGHT+IHtrDY+qK8YFI/iqRkEB5EIejA0jVW9b8AEb2WADVtoJ2icNKuutST0d+B59TZarVzYQGTJ
X-Received: by 2002:a05:620a:430e:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7c76634c2a0mr240683185a.0.1743576254346;
        Tue, 01 Apr 2025 23:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743576254; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKbzSXE84UNkaowk7oSzJWuoae9B0qjiwXcqKtdl93gbHULVdSuJpZRH0n0pOLBoJ/
         CZAPWhpKanCRtm7vkqtDVJrrfRlBRXrZ6Hfdw/KIsmKzXSw3IOxzZdpiW0W03qqZjMFX
         7c5dpV75HW5o1ce6EaEbsOMw64v7KzDXEZKWK/e93ZSKerHxZGiPY7zOu2WsSohYsHot
         ss9UATBAEQEIEteQQQnP9MOJyypV826VHdJes2mPXSbbsJq+gT+2rD8iZhO7lcA8duTX
         rosWtjhuQ2qSwyANJTLKH04F1Nd1YhTOuYDsTeiFfDjKLazYeBxEHUIye2VgBfqYGt9z
         xTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lpOEkBT50AOkXMKAy4M+CiYOtuUAnzqRKkSj7urq1aE=;
        fh=89UDueLRS95nWJK9lvzKwfZQD97UOxwKH+QUHz5IJbY=;
        b=JbmiEOs2csj4lthwe5/wcd/hBBMnMC4n6zyZPzU/6ftWY+jeXrbRgo9w4S2DzbIfSS
         4AZSSoDcNxIKAsdksYSjNXaFnPOOhEGo9A+wfrwgjCbHf+8eD3rwM6O/UJyl2QaJp9eq
         LjPfReoLszEeq6rsgS3Qind4FMwJSKOVzzoGMzOGKHAUYiCiNTJjdqMK8WGi2VYQBQzq
         ANyqyyq8KDv0q+nXD0GXGu7b3EqvcTzMoB0K60Ky/bvuEkheYWC0WyU/bpx4KVvON+NC
         PHaQu6E6lKdUMbZzvpv3U2C8sIShDpIDkl6BbNfgnKjjm2CWeAO7oL3SkDNm6+9siLmg
         f7dQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwKFqo9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f776caebsi1011137785a.307.2025.04.01.23.44.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 23:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NwKFqo9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzrpU-000202-O8; Wed, 02 Apr 2025 02:44:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrpN-0001po-S9
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:43:58 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrpL-0001EJ-U3
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:43:57 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-224341bbc1dso107740035ad.3
 for <qemu-arm@nongnu.org>; Tue, 01 Apr 2025 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743576234; x=1744181034; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lpOEkBT50AOkXMKAy4M+CiYOtuUAnzqRKkSj7urq1aE=;
 b=NwKFqo9hM7A3Anw0K0wbr98/7EzwxXSiaj3S5g/bSPid5FKRmbxtdTW9LU+cSRUuCO
 9nreNRXBlHpQl1LBn7LqI7sAXrjoH0IL25pir+rxn5c+WO6xbwozaeiWHsMUTIWmiXwp
 YiD4wUTj2QdV457xEorsteo4RLbJp28VrwHLpLxJpRYt4C3QQNwA4nfW61a9MljetFdE
 oxhIOxzc25RU4JjAK8H7eA6qAQmqLFxfBmqNMS/edJ6aoeuCeO24gAdR41E2ZSOpUF5O
 t9e9Su8Nt55HQhl5p4zkvvhLesD9wDy8zggU8Re8s7Y+wU+2zIcAf3r2JzTgigP2ZBoj
 b79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743576234; x=1744181034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lpOEkBT50AOkXMKAy4M+CiYOtuUAnzqRKkSj7urq1aE=;
 b=wHilPAxHWZMsi2p/N0or1/M7k74uTkcA7f2uByB8zfN8/eLsZZeXiNIuen0Od3A2L+
 aTbpT9wo71lyTrIkGImV3Hhbo+8D5u7aPnIm90wbhzinhS7xgHPwhYJarMTLLJj2L0KV
 +CkBfVLQOwtbhttyPFdNigGvWrFt+g56y/7vgjJKvCQfBp3Me+NfW2CZ2y5akCK20B8j
 0QR5ypQ4hp2Bw42OoC5Woxa0XE+Y6M5L2jZVVvpPIb5KaUksXw7SKIqlaSqCnuewlcF0
 rkDWIyo+c9S9isqy4BQxxfLMGolLv8U3Gu6dWA3bXDPcqGLiRBknz3OHIXe/Bii0BDeC
 B53w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKM6UJ4NCkGLjqb78dqBXK0JE2goof+8ENqMT0/j15RvrAoxD+keTb40guC2S7EiUes7DhSem94w==@nongnu.org
X-Gm-Message-State: AOJu0YxvhIzGtEzXMYpG2kSTAaImyXTJEC7A8J0EoSz+YLY7WhJbDcwz
 eYh/dvY1t5wQLZOV/cSF2pB0U1+X6+7CKp04vRMYKSpZwoXqSGFkzHd/c2mwGvk3vqsTFbLHQQb
 o
X-Gm-Gg: ASbGncvbI/AKSLfdwJZq12F73Qcnm4l2JbP5m6RrnWmf25CXQP+iKUHDyNBe2P198Wi
 Gjl4GfuoX5sUYHZVHd8KQrRgnnn2TpGZojB1EkvSWrxR7NJPx4PNi0bwUNVhF0X2I7MHjghNUY/
 AX1QKMy3wz40TjcZ6cELKHddOfN+NbFDTqi2YVOQEnJtHbaExpUxbAtyUSEvjs9U2SUgzEdkeSU
 dwE18YueZv0J5uOXNI5DiEl8WP4+jFvru8qSGyMgik9MHFrfrkabVq81Rjj9Ve6E+BexgT6jzfl
 Ck0JTcLhSHmjtQexcPowv+OzFAo15CZRGsYODrGkeUDDxQc7HUzY35rE
X-Received: by 2002:a17:903:1b6b:b0:210:fce4:11ec with SMTP id
 d9443c01a7336-2296c6053bamr18089375ad.1.1743576233907; 
 Tue, 01 Apr 2025 23:43:53 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1cf688sm100463285ad.121.2025.04.01.23.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 23:43:53 -0700 (PDT)
Message-ID: <80dd971a-2a45-44a5-9454-43257ead30a5@linaro.org>
Date: Wed, 2 Apr 2025 03:43:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 3/5] hw/arm/virt-acpi: Factor its_enabled()
 helper out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-4-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250331221239.87150-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Pz4mLuByG7kZ

Hi Phil,

On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
> GIC ITS is checked for the MADT and IORT tables.
> Factor the checks out to the its_enabled() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt-acpi-build.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e1786..fdc08b40883 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>   #define ROOT_COMPLEX_ENTRY_SIZE 36
>   #define IORT_NODE_OFFSET 48
>   
> +static bool its_enabled(VirtMachineState *vms)
> +{
> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> +
> +    return its_class_name() && !vmc->no_its;
> +}
> +

Isn't its_class_name() always "true"?


Cheers,
Gustavo

>   /*
>    * Append an ID mapping entry as described by "Table 4 ID mapping format" in
>    * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
> @@ -670,7 +677,6 @@ static void
>   build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
>       int i;
> -    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>       const MemMapEntry *memmap = vms->memmap;
>       AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
>                           .oem_table_id = vms->oem_table_id };
> @@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>                                             memmap[VIRT_HIGH_GIC_REDIST2].size);
>           }
>   
> -        if (its_class_name() && !vmc->no_its) {
> +        if (its_enabled(vms)) {
>               /*
>                * ACPI spec, Revision 6.0 Errata A
>                * (original 6.0 definition has invalid Length)
> @@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                             vms->oem_table_id);
>       }
>   
> -    if (its_class_name() && !vmc->no_its) {
> +    if (its_enabled(vms)) {
>           acpi_add_table(table_offsets, tables_blob);
>           build_iort(tables_blob, tables->linker, vms);
>       }

