Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2780072njc;
        Wed, 11 Jun 2025 05:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW0kgYobWtdrqQm9ZMoua2lZmbWnvQu+WF+SJmSOf14/MQXTxQwFRTkpQ04cXYBIkTboXCSQ1oaystEWg==@linaro.org
X-Google-Smtp-Source: AGHT+IEXsRbbTSOTjCaRWBnE/G3uPvp/DzySHtBoPKn1ueYRC0YE0WmDf5A6RfkG6lPFHDiVixLM
X-Received: by 2002:a05:6214:f25:b0:6fb:f00:48ad with SMTP id 6a1803df08f44-6fb2c32e4ebmr47964576d6.18.1749644316834;
        Wed, 11 Jun 2025 05:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749644316; cv=none;
        d=google.com; s=arc-20240605;
        b=akb7c2pvgQNl5lUdFHRSc/yUWolmCEIRP81gs4lJmRqdokGK7JJj//91MDkOUEiDtP
         KEQzbWQov/rZr32GLSzim/TeP7tomKqouiD/Vo7u5v9znauChPCaVSfboDhICSStb635
         zLf8Cta+49oCJv03CJuXRxruIwypER3j3TVvuHvKa7vipNyfBe3Z2irKRnJhN16gqw+f
         QtJOZu9s25emTX/zSR49wl2Bfh1LwrCMP9AUxzm21Kda8S280Gg+fwQoBNnqwI5R/cpC
         WGlUvnBb5ygQ/ApLKOrK0W3KMh9dPEAAWafT7iytNIBA7H0UQ4Fwnn0Y1AEp39gzQyjS
         lkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=zZSdbNeeun/D3AOo2VIU282r8Vag0AFvMKttLfsQ7vo=;
        fh=TY83NndQSWfi5O7cQSv7i3BaJbUFaB0zWlzUqEgLeZ8=;
        b=C3K2yfW5dEJ5K95WzBoY/QhzDXHjkAW6gPeyW8xsiS8IaV1IQfEkkwPCmqg0KXQtnM
         kPhQKe/Rr28069oG+jaW2RGhbDO0HVYzy3SC55Hn65QreWsaceT5iqBXtLx3i5UUpssv
         Ul2+JKNyMmlvEJmOuXisjEs0jYBTDqGzd3Ix7tiw/9oHAqY+JY0Xfp7750dxlHSmiDL3
         Flk+bXYndHdGX8O0EujwzNC0ikIPl0cvXOdh0d63xgHeuSrgNZJIFt3CofjEYWmci1G5
         xrA2VpN4W3HuYD/e6DQDqpouFeWWhIfSkSn8Bou7zSONjna1G34rcbRVbkPXZSTsnbkK
         qcVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fSNf7qii;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09ab04cbsi126510236d6.25.2025.06.11.05.18.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fSNf7qii;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749644316;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZSdbNeeun/D3AOo2VIU282r8Vag0AFvMKttLfsQ7vo=;
	b=fSNf7qiiocgyjNHEphPS7KkbzlpAYQT2HYVL39qT0wqRx09layiyIwSTk8nKv5Hv6yKA8F
	Ilr9OrnSiJJanVwQY8ks5V0z3ZhY/P6CqIWyl3sX3DQMpBcb/T4PHN8FRp1eJVOdTmIAmI
	R35+q+ZUiAsA348c7QtKWfg5ynWqwc4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-CL-lc5EFOl-GvORe9SICwA-1; Wed, 11 Jun 2025 08:18:35 -0400
X-MC-Unique: CL-lc5EFOl-GvORe9SICwA-1
X-Mimecast-MFC-AGG-ID: CL-lc5EFOl-GvORe9SICwA_1749644314
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso3786125f8f.2
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 05:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644314; x=1750249114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZSdbNeeun/D3AOo2VIU282r8Vag0AFvMKttLfsQ7vo=;
        b=T/4AXDN/B4btkPHlmsJ9ltG3defDuVD3gFC51qxGsn88zZCGOGT+T/wxkzj1+hNRLN
         H7U4biGNERSfOt8MLUbCgGw4p3boqOON15QwwCskga2QeIexRybZOOi6aFCQuIshnNrW
         b7QGc03HCKOfWV96/zUAHOQ7QU5PlIoMV4HBfNmBakcm7VucD9sY2NK+BMGSrB3+O46N
         LmpuqPlVIWqTi8ONJYdieBpnrHCNXRiNoD+3Ll050pJIlm09PptNat+jJ6K/0FVjh4UG
         /LhwY0nCJVPKZ2HwmUN8MDtQFY55huHBOgPnCek7B5QG2OtL8kUNxrf1IqzbeWoCfnLP
         V6mw==
X-Forwarded-Encrypted: i=1; AJvYcCWX40e+1yRuHjn2tXDY+Wn8Xu3lJDrRPSjXOFmXeoedKn0gy+L4g0kfwAt4qaFjBIns5FxdwjIBQ0/n9w==@linaro.org
X-Gm-Message-State: AOJu0YzOK+iE5ggcwhObleS8NznvQY1MBUp5fS2/8Ke+154Xr9a+PdLv
	qZ1XfHCifIkQuuNNHTLJfj/J04kdXnsDQhcPWPq2zPNu5FBxJ9bJSKJK+bdAYt+B6Tf3G0j51jK
	98Cpao7yInVlG4f4tY/qCdkUNreMS9QvmtL/6vD7wVm5VzZR8SwS1fBNnzw==
X-Gm-Gg: ASbGnctZ9pouWBxOOyNXPhucdBJJ7Xngq5QUoy+mLJAkCzMJCtAEyBYujfGZYWAKwIm
	G+kbP0IdG7sp0WRat1/UDxAierO2GrCzRAV9rh6vnV65HxqmU7xW/wep3fMGHo7tjE5zCefILx5
	JgsxD19W1Hi/3AVo2u3pI/e40T55SQgDV3lCx4UgAthhpKA+WrnNIPF3Z77PJRQ7gZgqBL5Anev
	5+gXNRBMI0jdiUjhXo6lmprfs1laxKOXe6Spaa75PnJtNWhmfaRUZsbTLbbd+Jx3c0l2izMAsx9
	GD2ROaA1AMiSs80Gt24YIGg11PHtYQ733ncVhhu9x3SJTgbKipobVWqs6qKwPsLZQtIOUA==
X-Received: by 2002:a05:6000:1b8a:b0:3a5:2ddf:c934 with SMTP id ffacd0b85a97d-3a55881dbb9mr1737206f8f.30.1749644313748;
        Wed, 11 Jun 2025 05:18:33 -0700 (PDT)
X-Received: by 2002:a05:6000:1b8a:b0:3a5:2ddf:c934 with SMTP id ffacd0b85a97d-3a55881dbb9mr1737177f8f.30.1749644313223;
        Wed, 11 Jun 2025 05:18:33 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229ddebsm15293387f8f.17.2025.06.11.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:18:32 -0700 (PDT)
Message-ID: <a2f97bcb-4986-421d-937f-1b571b790a8e@redhat.com>
Date: Wed, 11 Jun 2025 14:18:31 +0200
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
X-Mimecast-MFC-PROC-ID: ZH0NB6pVv0OxJBRfF1qp80VynnJtLBEoEChYi3ZLl_Q_1749644314
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: RA7+Y+jOGOLf

Hi Jonathan,

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

Done

Thanks

Eric
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
