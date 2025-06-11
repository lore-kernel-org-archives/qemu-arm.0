Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2785209njc;
        Wed, 11 Jun 2025 05:26:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlCpNxU9ppdN2ehozOYXpEeTDrdxcFuDIruYG+JbUn42xOiAPjVxm02U/XE+9JNLx0HRrAm2zQfnPu/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFc/0RYjJBaNtTHI6AfsWLO6S2eLcSuqj20ZTmOWQl5UdiNdUHs0oMoRxQ/nI5/16ZlnXLq
X-Received: by 2002:a05:620a:2714:b0:7d3:a6c7:4eb2 with SMTP id af79cd13be357-7d3a88e0e1dmr470846485a.31.1749644766129;
        Wed, 11 Jun 2025 05:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749644766; cv=none;
        d=google.com; s=arc-20240605;
        b=ckLh4NQOyqmx77Cm7AGNYOdzDc9wvwq6Rz5MH2e+6o6Ge/KsiuLz15U/HzoNBQwWVU
         31O1urVu7Arq0yhwJJ0NcnLXZf2XMfYQC/DlmENoNz7mTdpLAOohI4Wf4Z9z8WFqMfO0
         g+k84+Wc4Si+6CTtUa616JCpORTyA1fqX3/5OKukzoXa6J7bH8iasO6QvO0WP5TuyIl1
         1nuFqoS9nojzzJBQ/OCNKL5YMDd6DS/aISTO8dvOPtqdiyC5aTenLYF+JGMmvPeBoATb
         vxLFj1mlQlQS3vaQw94oviamBeVL9yxN2fPpyiS3KEGCvZXQyk70rtUkgMdyzQbV85oI
         KViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Mwzh7faMG7zQ0TsEOvtyyX6YaFnGx7PDRU43RXr67pk=;
        fh=ORrpSlPkPTsWjUMnElhf/p9JICSslflgJLIdJMvfRWY=;
        b=ZZgihk7SOVaQB/l15CwcnUHbNUHpYMNnW2pfkLiIAg6uYx3WFxSp9VdVxOoTusFpnT
         r9rnYFyfRbIeOgOhTezIVpvbKNHCmti35WylvGLhGAIrJPBDYhPrYLkivJXvgrPyk9Wt
         R50gARspO56eHSnBaZbLVQNjvQTalGzVxM3ynIuW8nGhQrM6OTnTIkekgYos+Krg0XGh
         b2jk4DQm7fX5X/2wdZGd6O7sCAQ6dZj+LCW9xQabncDqdlW3bv9zJssx1QB9KKtULsWy
         Z6g0bO/vtKm8CsgrSpfWLst31ygge9lcaenarqqXB0fcb1W9epqoSqaeV+2b4XoJcyLQ
         SaNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oth91dpA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3d0252si1238258485a.31.2025.06.11.05.26.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Oth91dpA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749644765;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mwzh7faMG7zQ0TsEOvtyyX6YaFnGx7PDRU43RXr67pk=;
	b=Oth91dpAYInGHQLgGLc58jYY2EL7m20sNAK/HRZNXh3nSsqJvY41ACuHedddHWbqpcKTVB
	7PPe0dWToosWFao29CpbInT5q4kg5y6jKD6srX/O3HhhmVQWTAgBml0iwYj0l7H4O5apvD
	aDXK6u70UnTec0gGSrUQEETQmTsyj8w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-xs-JY99BMOCbPlV2SI_LWA-1; Wed, 11 Jun 2025 08:26:03 -0400
X-MC-Unique: xs-JY99BMOCbPlV2SI_LWA-1
X-Mimecast-MFC-AGG-ID: xs-JY99BMOCbPlV2SI_LWA_1749644762
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d30992bcso52191775e9.2
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 05:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644761; x=1750249561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mwzh7faMG7zQ0TsEOvtyyX6YaFnGx7PDRU43RXr67pk=;
        b=SuMYLBvVH+JUmEpPomN+E2GUC86c+gv0j5LLzzHMIcDubrcIr8ChlWTzfhTFTH0aiC
         QklkEYmu/KCb4f6tqJWyDMklEh5ML1nlOzrZKZlVc6QqaIVMvByt2BD7J6mOXSCB5scl
         0COwS2voLdGYmT24EEZrJJKc0Sp076l8XBWGNRhukRUb5hLrdRp+WGD2iCf1Q037vj5x
         lA6a7EBePS7teUiGctTl55jks0+tjhzQNrKLk68BaucWcJtvEx9XnnnTD4fBgK+LILab
         JLYgX7PnzW6fAbrXZ1XByHTYD5absnt/a1bYeB2gZ7Ok1XvR/a3Bh6SX6RjziCnMhd8/
         07zg==
X-Forwarded-Encrypted: i=1; AJvYcCUzp7GBptqjXGufcezuR+iAXyYznRaUwYKcYZhNUtjAY+c/guNpLe4gTp4nrxFTVmyGoHtFMmhnotIQFA==@linaro.org
X-Gm-Message-State: AOJu0Yy6jESfUU2nFMZl8vidZQR3U11FYNFrC/HR2KyySOWhhFZPC60n
	Oos7f4zYjYuF63miYYnaPAg56pEkLVnbY6tFrF1SK36YYYdWuuIkewITYbKpnTONv2jUq6/PdDk
	cTZa4WcDvaLoHsbvFhJsXIH1IpcyG1w5K8faUMR+ohHwoG20swtMMlK3Jsg==
X-Gm-Gg: ASbGncuCrbiyC1tSCjeRyD7uyMX2QJ1z55Lzp1FvRm2KJZOZo727O2RRTWzniKkG89D
	JMNh1uWKVdxjwDBc/eZwDM5yC1sUgVre3ILNTaLajNFwpH1vO196FzS49p9kWuSxTy2iGPUIl2p
	ScpRoVAtY49EGOL1ClzhiPub6oh55jrSV/2tbQ/uDBijcgt3HTl54LiGDsILiE81yJjPGbN28Yq
	7GKYsvphCfDQawJLHYUGt6uzpllS1g8o411u3Bi0j0v0Z/p0s0y5nze4WhjHxljaoWZwAEaXn8o
	sX8dlPBPFrxKwoD8u0PTLJDOCteAxvaUsYE7dS+IvFPE98I7AU7qYOAL9DDa3vQXxsWC6w==
X-Received: by 2002:a05:600c:c8a:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4532487a36cmr29458935e9.4.1749644761487;
        Wed, 11 Jun 2025 05:26:01 -0700 (PDT)
X-Received: by 2002:a05:600c:c8a:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4532487a36cmr29458585e9.4.1749644761010;
        Wed, 11 Jun 2025 05:26:01 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532518ac9asm19629335e9.23.2025.06.11.05.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:26:00 -0700 (PDT)
Message-ID: <38b4d37f-e70c-4494-96ee-02fe97aec4fd@redhat.com>
Date: Wed, 11 Jun 2025 14:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 09/25] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-10-eric.auger@redhat.com>
 <20250530110505.00007430@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530110505.00007430@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V9Ivy_KopKa3OGsyEQsVh6UXDfHB7UXKp6J4fC_7a4E_1749644762
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ZaZv5RQmq5BI



On 5/30/25 12:05 PM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:11 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> gpex build_host_bridge_osc() and x86 originated
>> build_pci_host_bridge_osc_method() are mostly identical.
>>
>> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
>> is same as Local0.
>>
>> So let gpex code reuse build_pci_host_bridge_osc_method()
>> and remove build_host_bridge_osc().
>>
>> The disassembled DSDT difference is given below:
>>
>>   * Original Table Header:
>>   *     Signature        "DSDT"
>> - *     Length           0x00001A4F (6735)
>> + *     Length           0x00001A35 (6709)
>>   *     Revision         0x02
>> - *     Checksum         0xBF
>> + *     Checksum         0xDD
>>   *     OEM ID           "BOCHS "
>>   *     OEM Table ID     "BXPC    "
>>   *     OEM Revision     0x00000001 (1)
>> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>>                  {
>>                      CreateDWordField (Arg3, 0x04, CDW2)
>>                      CreateDWordField (Arg3, 0x08, CDW3)
>> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
>> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> -                    CTRL &= 0x1F
>> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
>> +                    Local0 &= 0x1F
>>                      If ((Arg1 != One))
>>                      {
>>                          CDW1 |= 0x08
>>                      }
>>
>> -                    If ((CDW3 != CTRL))
>> +                    If ((CDW3 != Local0))
>>                      {
>>                          CDW1 |= 0x10
>>                      }
>>
>> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
>> -                    Return (Arg3)
>> +                    CDW3 = Local0
>>                  }
>>                  Else
>>                  {
>>                      CDW1 |= 0x04
>> -                    Return (Arg3)
>>                  }
>> +
>> +                Return (Arg3)
>>              }
>>
>>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - move in the dsdt.dsl diff in the commit message and remove useless
>>   info (Gustavi, Michael)
>> ---
>>  hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
>>  1 file changed, 4 insertions(+), 56 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index f1ab30f3d5..98c9868c3f 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>>      }
>>  }
>>  
>> -static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
>> -{
>> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
>> -
>> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
>> -    aml_append(method,
>> -        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
>> -
>> -    /* PCI Firmware Specification 3.0
>> -     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
>> -     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
>> -     * identified by the Universal Unique IDentifier (UUID)
>> -     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
>> -     */
>> -    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
>> -    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>> -    aml_append(ifctx,
>> -        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
>> -    aml_append(ifctx,
>> -        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
>> -    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
>> -    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>> -
>> -    /*
>> -     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
>> -     * and PCIeHotplug depending on enable_native_pcie_hotplug
>> -     */
>> -    aml_append(ifctx, aml_and(aml_name("CTRL"),
>> -               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
>> -               aml_name("CTRL")));
>> -
>> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>> -                              aml_name("CDW1")));
>> -    aml_append(ifctx, ifctx1);
>> -
>> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
>> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
>> -                              aml_name("CDW1")));
>> -    aml_append(ifctx, ifctx1);
>> -
>> -    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
>> -    aml_append(ifctx, aml_return(aml_arg(3)));
>> -    aml_append(method, ifctx);
>> -
>> -    elsectx = aml_else();
>> -    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
>> -                               aml_name("CDW1")));
>> -    aml_append(elsectx, aml_return(aml_arg(3)));
>> -    aml_append(method, elsectx);
>> -    return method;
>> -}
>> -
>> -static Aml *build_host_bridge_dsm(void)
>> +static Aml *build_pci_host_bridge_dsm_method(void)
>>  {
>>      Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>>      Aml *UUID, *ifctx, *ifctx1, *buf;
>> @@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
>>      aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
>>      aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> This is where they become unused I think...

Indeed.

This means that I need to regenerate the reference blobs accordingly
(for Gustavo's awarness).

Eric
>
>>      /* Declare an _OSC (OS Control Handoff) method */
>> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
>> -    aml_append(dev, build_host_bridge_dsm());
>> +    aml_append(dev,
>> +               build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
>> +    aml_append(dev, build_pci_host_bridge_dsm_method());
>>  }
>>  
>>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
