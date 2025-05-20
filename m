Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp463823njc;
        Tue, 20 May 2025 05:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM0avldmN/leIjUbgBc6y8pt0YB5U5ihcarzht195DccGqIc25gHjTCcBN9bg9XvvLR5PQ7zoqJRUQ8A==@linaro.org
X-Google-Smtp-Source: AGHT+IEWvWAN+v+0Rl7GxaCCfa2oixn7zjLm8evBhXlxpBsXhYpcm+lwmDDVN/te8paOJbviDqg9
X-Received: by 2002:a05:6602:4c82:b0:85b:3677:fa8b with SMTP id ca18e2360f4ac-86a2324baafmr2054587639f.13.1747744303350;
        Tue, 20 May 2025 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747744303; cv=none;
        d=google.com; s=arc-20240605;
        b=fwjm5p8qheD+EgpubZ8uz3HwLAGyGytnFLXFXyz4jPjNoK16VttQIPyr3kHfLvXov8
         67w6R+sNeJfHTdKuGWK6b39sfWZlrqcFshb5mnhOwjYWFUQX7YSm95dmknG7RFbAMQ+n
         8oNn2bAiRR2WTVMFBnJdB2VoTMkeSPDQzD+APPOyqoJO1ZYhDa+Tva5+YJ9Nw2mqBkP4
         rxQJuURujHP+bI57ZzP1iKmpV2djxz4Sh7Fam7VOcoMJQgwxeDH0cyAMe5cCGyhRWMy4
         IY8dZxJ3Mo7/nMHKyhVWcmoLXUCnhfDpDZdkjGFr5x79U1twmcN9unKtzkM5vaNjWRDw
         nt4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UJGR+g/Y+CLu5+h11cSkPA43CVX76D8jK97YeC0XAaM=;
        fh=Rg0fJoo9u/v1adX9rTbk+Yi4iu01zgiRpUTbKaI02pw=;
        b=SdzPd+OPj6U38WxPL7tVjxIrs1EFEX0sAAIvPMOfenpyOsVA4rABXLT2HbA47iGBAL
         o7/E16Kc4qbsFQmrk5AwuZ+dJh8CYpLfKg58ahL3Zd9vxfHndAl5ig2HUO+n654pdKQI
         oS3R6lHWbD13DDicH4ZswKqRB+HBhDTpigx4yS4GeemLiJpkfedqTLx1AwDlp5cE3EYc
         8wA4ftvjs4MKIViQmDfnPUf9FoCQYPsqXpBHY41ZJmYD1k+dCmcH7KznYJmc1Wd/WGyh
         X9T5HX/OVz24p+UkYf0WK3Y5/w8oBZwqPrImHqqKWcnP2EGMT1Z8SfdVWlcq5r+Z/xUT
         qW3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ks2uB2Y6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4fbcc4938b3si5491196173.86.2025.05.20.05.31.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 05:31:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ks2uB2Y6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHM7l-00039A-KL; Tue, 20 May 2025 08:31:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHM7f-00038F-1e
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:31:10 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHM7Z-0004ex-NE
 for qemu-arm@nongnu.org; Tue, 20 May 2025 08:31:06 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-527a2b89a11so1771561e0c.2
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 05:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747744257; x=1748349057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UJGR+g/Y+CLu5+h11cSkPA43CVX76D8jK97YeC0XAaM=;
 b=Ks2uB2Y62TF1BIsTKwTI8KF9b803j6Kgoy0qpGr6O80sOsYcXNtYCm47vxM6jQrU5Z
 J/vzv3t28yZLAc8gh2aAadhdsyBrTEUltMltMAudcPm9V+gSIG2TV0bGsD2MmT9ogeYY
 Pz7z4IsOO2XU8UrEPpemUxpYM/SBe/gRDC5e2KIGZ4yQjHb3IhlKv1c6Cd3I5jlpBwNX
 Ej0d3u16GEw1L3tcOMgI8NajLyx6/Ue7DQmFlfb63DQYXxrftyYqKMhQpbXGlI9npvzW
 BYBj72pXEeUM2GAEvMzXXKqv0L7pDKvet2B+fjBevnYv1FSVmTW0h0XIs3eGJxDWeh2N
 cCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747744257; x=1748349057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UJGR+g/Y+CLu5+h11cSkPA43CVX76D8jK97YeC0XAaM=;
 b=k2dPTb2MHJOBZOGDA/JNkeDXPkRMBSwtQ99NDvFRO0fIKAnbAqG0aoXfYkWY5zWSoS
 dGmbd0OZDMDV2Uho3KRSQBezov3ewSrI1lPBVwEEs/c6pKsJ2ecfTzYuKQqjofoHmAKG
 x+E+8RdtpR4uHBNunjG2BiGpgvu7yUAjOSbr0sRwrKoKuoGSBbOUGMc7ze8PyLo5RyjM
 SDl9CUYSGlDG4ZJwcO/OhfNvPvUe02+HrpXTOJaEJFoS7bFFsgKwsvFP79Mgi/OWDB5A
 rPqDFXwfSQ1ql9MyCa1z/fjkOu+MUvM+oug34ANpVDuUElNBYQHwEVymRYi4hqbVjzyj
 tUkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX04exBx4g1XRp/meHspEolu3OVrPFGVnJVn8oCzrQukeURE+lGw01e8AmLOuRt3OwaLbtT5ypDMA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/Wnvb3QJg0iZ73FYBh9nn4Ag/XBQuRMGR9Oqj8X7jTNqqj/+C
 BMwzKIzc5Pv9TpTpnqdmW6lej7Fl5Q9dLclKXwxud303H1TUjloBU9dgRJEzgw7zNjs=
X-Gm-Gg: ASbGncs6DGZTZWLGlAHzSroKTiHWVPdcZK1uFoKm3TnHqqpWFYm8AjvoaWI5tPEseEv
 40j2RlKWtclxF1cc91aopDrfMn3ANOyepsHN4GoBjGxc5xim5sTFAFLK8O62qkPkTq7i4gTUvKs
 pZY4y0GRi3tApF0++T2ql22LJCHLtCas+K+fcZkG9GzqWI5Q5NsHR4OVRPjthtQ3LYpbCNH9xXt
 x2CDBQGZ9ZRQ/OeAPBTHSZmXfU0lauY9MqnPwEcfDimd0E07+L0BjoDYazr4343Udzufx6ccUp+
 odqsPkeQd21/8lmrh7BQtsIKm9K13Baw2VtMZTzLkkWozkRFu9Yn83XIYPZfkke5+2BdaT8vBL5
 IlHBpzsEhmmI158bjasE5brkfIedaWw==
X-Received: by 2002:a05:6122:16a7:b0:52a:ee1a:4249 with SMTP id
 71dfb90a1353d-52dba8d624fmr14816806e0c.7.1747744256846; 
 Tue, 20 May 2025 05:30:56 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52dba910a60sm8454649e0c.9.2025.05.20.05.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 05:30:56 -0700 (PDT)
Message-ID: <a0275df9-7e4d-41ad-b417-7c27f820df9d@linaro.org>
Date: Tue, 20 May 2025 09:30:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] hw/i386/acpi-build: Make aml_pci_device_dsm() static
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-2-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fG/oqfa1w+Ya

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> No need to export aml_pci_device_dsm() as it is only used
> in hw/i386/acpi-build.c.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pci.h | 1 -
>   hw/i386/acpi-build.c  | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 6359d574fd..ab0187a894 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -36,7 +36,6 @@ typedef struct AcpiMcfgInfo {
>   
>   void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
>                   const char *oem_id, const char *oem_table_id);
> -Aml *aml_pci_device_dsm(void);
>   
>   void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
>   void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index f40ad062f9..9e584e69fd 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -338,7 +338,7 @@ build_facs(GArray *table_data)
>       g_array_append_vals(table_data, reserved, 40); /* Reserved */
>   }
>   
> -Aml *aml_pci_device_dsm(void)
> +static Aml *aml_pci_device_dsm(void)
>   {
>       Aml *method;
>   

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
