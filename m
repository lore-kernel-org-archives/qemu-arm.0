Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2783055njc;
        Wed, 11 Jun 2025 05:22:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ/n2weKtkXVTbuQq/OdtarCO7wjSQ2kHkicMMSTIdx1C1vNB7aspUd7xv1pIyHLvClNgZIg+CLjPDvw==@linaro.org
X-Google-Smtp-Source: AGHT+IH7wPSG83dfYNO8zRwpkKjpt6/sKydK4A/RKDNmljQDYPqNRCIAMC8Q73vDiiaFcmMP2SHp
X-Received: by 2002:ad4:5ec8:0:b0:6fa:ce21:cad with SMTP id 6a1803df08f44-6fb2d0fc0f0mr37824536d6.18.1749644525881;
        Wed, 11 Jun 2025 05:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749644525; cv=none;
        d=google.com; s=arc-20240605;
        b=F5zg3WmeGGsNdQ/ZNDkPbbugInRPWPcsS++ShRd/Nuq6EpbF4mUl8qHX0DjR22zCfG
         N+4Q5ydl8JA3t0/OfWikjuzs9ElU5QI/lXQcjp0yNuV3e0QcJ2dwtWcpc6Bb9XP6JLbS
         21+OtURQnG4DVyySKeBrNYZvH8/J7OfQh+i/HvUkHCAzvDRMx5Kc/ObFtW+TdrdfgteO
         hR6YCldQ6v1fshtkCRgmJj9/T0/FT7iAVWtZjmdKcZWm0hmTvB0aglzlczQoueJr69mg
         boYrXAfavUlFZVJlmKZVCepQgnx8OYag1/JQZ8aab69KD+ZxsPV+67VZHy6xn2tDpnmw
         fM9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=TLtGg7+qhUc7f2ZSuUGo+EY1HTON9oeteeb3NukIgDw=;
        fh=bqM4E6wuLAy1A5D1C+uDtbYTBmo4T0sj+TYmlfWwTxg=;
        b=C2WRM3ZYlVOUZ2Y9JjmdQULdquTJoR4xiLVisqkL65cL9STHELzk3kjKF96h2bXmIn
         8k70AIlj4YPHiCLavJthVjOem9dFaaJUE5nifJKGjIRAa5QpTRZCPi2702fsYU9Jxg/j
         +YTxUyo/bGxCqe4E2bC8mjFID0uvhGOJ7TdZokfaRv1STdHiMDB+JM+TnJSlm4K6YaMT
         BioNDmCFm+IK9MjD96yRhTsGRO8mp9HngDBzwkZzZuZ9Nk/BGbUGZ5NZA/OOGlfDgnIy
         1SJJIollJbYXde44u9gG1JF3bfpmoEm2y4jPyvJ81OMSc9VT1/s/47PdTBGYv0OrERH+
         HPww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxYYvNoy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09ab07bbsi127258396d6.34.2025.06.11.05.22.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AxYYvNoy;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749644525;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLtGg7+qhUc7f2ZSuUGo+EY1HTON9oeteeb3NukIgDw=;
	b=AxYYvNoyBSWFnR388UGdf+Aaze9geJSKSA/0hEDvGCoz4CdodT/LBjQbIqxy6KorwfULsz
	NgGXK8M4GhqM1WEeCQXFUkeHLgAFT/kdbNUDvLIbWUAnyFD1sbxRG/Rx8i4bU0FhrVTsWk
	nThGCBiNLO6qKcNKkg5XaGbEDIVc+BU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-hpnUKiRsOa-CgqO22eRsdQ-1; Wed, 11 Jun 2025 08:22:04 -0400
X-MC-Unique: hpnUKiRsOa-CgqO22eRsdQ-1
X-Mimecast-MFC-AGG-ID: hpnUKiRsOa-CgqO22eRsdQ_1749644523
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso4263030f8f.1
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 05:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644523; x=1750249323;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLtGg7+qhUc7f2ZSuUGo+EY1HTON9oeteeb3NukIgDw=;
        b=pUbZIaqJGlSjR/mfOGdagUPocq2hUafe+p1WJL7K3ero/DpQioiZeh10eVKed1+TXw
         /hwc3c/draQc3+M9f5FGKYzXQqllSw5dONSr6J4fWsKnfXmZoPX20X1JjDmH/eSah4yl
         wZKjyjwoglVZ+nge7jjL/2evFu6h/Qt0CY7qTrdnyR+LMVdzoa+grmiaCjgVOWoX/lhJ
         pfT7miqKx5V13uXo/zu1T4wurDtiKrOBEmjjL26bdgMn/JOIX0PTWSUK6u66BJh0HSkV
         p26rx0QCupXcQsW0getbRG6A6ymQYXHtf+t9mOfX7J+QfGsSXpA/1UflkvmWdVuoI2u+
         jIFg==
X-Forwarded-Encrypted: i=1; AJvYcCWKlOEsXXb+d73VMBpBu9BS2c8ewoCKuCeKRPIU4alNRO9MzCYDLLH2rvnTZCLcZZ1uJjmP46WnVAq3bw==@linaro.org
X-Gm-Message-State: AOJu0YzQDE3Z6ErvDYa/EiYEMIwCpyuOYP2PcraYDgmFW3TzyfDcDiY6
	pY2MUu0TajtqYmjcMYdJKayH9PwAKuGdtzFDET5n1w5YmUHLXMhwXExswjX/fx2giKA9RQCBnYI
	3sKzGBRhOr9A6c1xTXLV5QuApG2RxccjvgsOGexyGN5tF3JaAdQBj7pyUTA==
X-Gm-Gg: ASbGncsq+GpXCdmCDMZU0KKtqdRpj/+RktA6sxuc3o+JD2X6Q64KiasCFlB+mxZS7V4
	IcABfuN8wY6w16Dr/bit7ItIUkEYHW1LnvEyb9P7OJm6sGJGp5iwdsLo4QjEvUZs/s7LN+6l31h
	vNrwfi6hbgStvequ4p+9AMwbZoa0nDhj0lQFCkBtPLR4guTWLclhsbVLsEA8a6B6jtlr+cCaT8q
	XrtQuziMpeD3HjVvEFnBFDPBFE3iPrXn6CIzhYdcSY9KNssP8xaZMVq5ugDcMYC6w8oBY54LnP/
	Cuqp4RQ5MMlY4vhB2bgCUTsX35EAyU7x8r5+PemrR3UjRUFzi8eR7UGgLT2Xajrm3BpH5g==
X-Received: by 2002:a05:6000:40cb:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a558a9960amr2285970f8f.9.1749644522626;
        Wed, 11 Jun 2025 05:22:02 -0700 (PDT)
X-Received: by 2002:a05:6000:40cb:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a558a9960amr2285939f8f.9.1749644522193;
        Wed, 11 Jun 2025 05:22:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de70sm14796386f8f.5.2025.06.11.05.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:22:01 -0700 (PDT)
Message-ID: <58188c95-4940-4619-bcba-58eed064d16f@redhat.com>
Date: Wed, 11 Jun 2025 14:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 05/25] hw/pci-host/gpex-acpi: Split host bridge OSC and
 DSM generation
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-6-eric.auger@redhat.com>
 <20250530110227.00003341@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530110227.00003341@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gOgI2D0HcBKU9a55PEnzQsYw_3DUbQdYS8c2bhHSfJM_1749644523
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: kNfW20m651i7

Hi Jonathan

On 5/30/25 12:02 PM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:07 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
>> it appends the _OSC method but in fact it also appends the _DSM method
>> for the host bridge. Let's split the function into two separate ones
>> and let them return the method Aml pointer instead. This matches the
>> way it is done on x86 (build_q35_osc_method). In a subsequent patch
>> we will replace the gpex method by the q35 implementation that will
>> become shared between ARM and x86.
>>
>> acpi_dsdt_add_host_bridge_methods is a new top helper that generates
>> both the _OSC and _DSM methods.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Makes complete sense. I've had local equivalent of this on the CXL
> tree for a while as without it we don't register the _DSM for the
> CXL path (and we should).  However, can you modify it a little to
> make that easier for me?  Basically make sure the _DSM is registered
> for the CXL path as well.
>
> One other comment inline.
>
>
>> ---
>>  hw/pci-host/gpex-acpi.c | 31 +++++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index f34b7cf25e..1aa2d12026 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -50,13 +50,10 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>>      }
>>  }
>>  
>> -static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>> +static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>>  {
>> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
>> +    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>>  
>> -    /* Declare an _OSC (OS Control Handoff) method */
>> -    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>> -    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
>>      method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>>      aml_append(method,
>>          aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
>> @@ -103,9 +100,13 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>>                                 aml_name("CDW1")));
>>      aml_append(elsectx, aml_return(aml_arg(3)));
>>      aml_append(method, elsectx);
>> -    aml_append(dev, method);
>> +    return method;
>> +}
>>  
>> -    method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>> +static Aml *build_host_bridge_dsm(void)
>> +{
>> +    Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>> +    Aml *UUID, *ifctx, *ifctx1, *buf;
>>  
>>      /* PCI Firmware Specification 3.0
>>       * 4.6.1. _DSM for PCI Express Slot Information
>> @@ -124,7 +125,17 @@ static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>>      byte_list[0] = 0;
>>      buf = aml_buffer(1, byte_list);
>>      aml_append(method, aml_return(buf));
>> -    aml_append(dev, method);
>> +    return method;
>> +}
>> +
>> +static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
>> +                                              bool enable_native_pcie_hotplug)
>> +{
>> +    aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>> +    aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> These two declarations seem to be very much part of the _OSC build though not
> within the the method.  I 'think' you get left with them later with no users.
> So move them into the osc build here and they will naturally go away when
> you move to the generic code.
>
> They end up unused in the DSDT at the end of the series.
>
> I ran a quick GPEX + pxb-pcie test and we do get the odd mix that the OSC for
> the GPEX say no native hotplug but the OSC for the PXB allows it.
>
>> +    /* Declare an _OSC (OS Control Handoff) method */
>> +    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
>> +    aml_append(dev, build_host_bridge_dsm());
>>  }
>>  
>>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>> @@ -193,7 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>              if (is_cxl) {
>>                  build_cxl_osc_method(dev);
>>              } else {
>> -                acpi_dsdt_add_pci_osc(dev, true);
>> +                acpi_dsdt_add_host_bridge_methods(dev, true);
> Can you either drop the use of the wrapper for the DSM part here and call
> it unconditionally (for cxl and PCIe cases) or add an extra call to
> aml_append(dev, build_host_bridge_dsm()) for the is_cxl path?

Given the following discussion between you and Igor, I understand we can
keep the code as is for now. cxl alignment would be done later and also
pxb support might be reworked in near future.

Eric
>
>>              }
>>  
>>              aml_append(scope, dev);
>> @@ -268,7 +279,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>      }
>>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>>  
>> -    acpi_dsdt_add_pci_osc(dev, true);
>> +    acpi_dsdt_add_host_bridge_methods(dev, true);
>>  
>>      Aml *dev_res0 = aml_device("%s", "RES0");
>>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
