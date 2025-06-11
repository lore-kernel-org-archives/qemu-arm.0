Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2767866njc;
        Wed, 11 Jun 2025 05:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXRQqdhXFs3E6/5/36k0PEGxc1sN0hAGMm/FvSwlwnOgzb/T83957Dun+yeAAVYvpGCDHfz3saRJHlznQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGq+XkKHzvGAFF4wdqibCzxXu/w4nCjR9VkSnYQjhFFMok/TywLQAk0jrAVrXKhotx3rm1g
X-Received: by 2002:a05:6000:400f:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a558a31369mr1882176f8f.46.1749643507950;
        Wed, 11 Jun 2025 05:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749643507; cv=none;
        d=google.com; s=arc-20240605;
        b=JRcmf+u9Q3UNG6+w8c38u1id9t74urf6cgY8AFG6Ogt73CwGEZBS380ates2GiH9Fo
         7TnP0r65WGeLlrtScD6vZohIsDhbOXmTMLJy9qSVHtdktn9QXhe0Vuj0eTdcV456MPf4
         1BnXteenUYl7kgCSZdwcxySmoHrcQQrjNVsVCMEYw0ICnuO2oWo0gFO+HnhRo1DDX+Zc
         z56FZ1l3WM+iiM7kXnHw+/txv1wPmN5HAwfjuUjzsPAcXhjQkcYcpiwUoESV6JCQBL7n
         nGo2xH+BY8lF8Xuj5JyU2OSWaqhNS5Adn/AiHfBDR9PH3U109HGmIiWdJyBA4bOjEBA0
         hVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ZTOi8eNcnBD9S4r3sPmmoIhTe+QERnirZ7HtVLzvHGM=;
        fh=hr6479CkBWxTh4ZZnvJFx8ZPKy6ZM49LHQc9XEDV6LA=;
        b=HAz77CeDjfBaRCMbPcpdCNd6Ug7XQmVUPBBiN/3rLDv8ib8kOrCJgOd8dnx0xl1OxC
         Q9iDKA93nRo7qaz3F0vy+SXk0eJA3vkQuaaGf7b6AAU/RWYVgpBFf6UQxv7/dgd3hQET
         F8ZFuJ7NFEKMuwDtTzz8QhoGIsJxfGY50QrmEyGTxdf4zKmO/PHWNhbXXMkjNiKx/LLd
         WFfBF43CYltLpnvgvk+GXxrUqfcIufabauBBDWFAJuY6zSua3LG9Np/EtjgxyaRZSMwC
         QETfVqn3Ru9egJnznQZ11OFA24lQ+DGFw8iMgBWoheFoIi7MgZByydOezYqtUoqz5bwI
         BCBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cNfrdKXO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a5324a6a66si8967859f8f.813.2025.06.11.05.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cNfrdKXO;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749643506;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZTOi8eNcnBD9S4r3sPmmoIhTe+QERnirZ7HtVLzvHGM=;
	b=cNfrdKXO8YhGmfK56f7pNh0MeOrub6OJOGSusVN2wCpwGJZWoNjtjh4rxfKmUUPvaqg9uK
	e3lUlIdLnAdRB2X1zXJMNQCGru8UrwZrn/qTh6JR8XxyUKZr4Be6W04U437LESDMziMNF5
	o+b9b18H4lgYwJXRD8iONLfsLfmUdlg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-9GTLgm-RPQelKKmBOjE1bA-1; Wed, 11 Jun 2025 08:05:05 -0400
X-MC-Unique: 9GTLgm-RPQelKKmBOjE1bA-1
X-Mimecast-MFC-AGG-ID: 9GTLgm-RPQelKKmBOjE1bA_1749643504
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d50eacafso37117495e9.3
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 05:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749643504; x=1750248304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTOi8eNcnBD9S4r3sPmmoIhTe+QERnirZ7HtVLzvHGM=;
        b=uThOeotuFObmmVhJ4PSxRxSYJHuM2odSoptB1Yt+RHyo5jE86RWylHvfXaYeOfR7Cz
         1vGMnzh3BiFMQ5wzRimTMy0g4Mf1d8idLKxre5Xu4Rz906SqtT6HABEbA9O3PQOd6k5w
         UToSQ/96TFIuQcE9aALdmOQ9nIOOcTXVyMrq+X1+NxcPjWjvIajEMK1aMOwuKf3Cjt3d
         P/n9JCsoa6Wd+217PMlDJ0+St+ZvTN2mF+iDzuNjHb7qKpHwLj+7+pr9VmOxdv8ClXfh
         eP8xfBwWEEUfx+GCCXx8urF8670myni0xDN4RAvcgPBv4vvYHngOTIJHX9FKyVZ843+j
         PzOA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ38fBw98WuoMPyBbVE4rie+ZqcXmw+Tt581bNXGA9fSNHUXNnqqYD/VA0Irq0bd6iTDX8Bo9foluAgg==@linaro.org
X-Gm-Message-State: AOJu0YzwB0g6/5pUcCS4kKRoiliy3HbM0iwf4Lan/oU2we7eG0LyW5eX
	cCoj1/e8TJfI5ygERSMqwE1x9pUfkDGcsK3wX0elrbL1yZSgdEVpchVFaR5+SjfyqA1gdDQmAoS
	owhCTEg8r58vWMDMASeXcTgETSUs92Xf+Jspmtud+yzInLTZcmpoHHPQeMw==
X-Gm-Gg: ASbGncuGMWZtz8Z6Tfc1yMVImFM5Ghw/p5VEWgVkBWJ+U+aTqvRnSiNYi7A/42hSOLT
	30ZnB/UAye6aruSHW0FZ6V4LaL8jTdzxB00ExlEF/LemVhJIlc+mS4DG4J8RNRnV5JgYu/axQmt
	bqaP8IgJ36pQA+sQB9lAxQtz+i4HTeKm95Q+8y5KiJ9M5MNc9/GgWep86tYXHzsqEbpSAL6lWqa
	k77aNiz7mE47W/XE1P2HkBnLmcdw6BgQNVtnIFIAeIenp7H3xwaOQkknF1GHZHsmfyUs4T88npv
	utWHb8wuPgMcRGvuL0m5dhsPdGIOGLUEn6tcHFhktn/LcdOK5hp05Jpt+AriBY7gut3k/w==
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr25727665e9.24.1749643504195;
        Wed, 11 Jun 2025 05:05:04 -0700 (PDT)
X-Received: by 2002:a05:600c:3d13:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-453248cb4c2mr25726945e9.24.1749643503404;
        Wed, 11 Jun 2025 05:05:03 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f0cbsm14987328f8f.81.2025.06.11.05.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 05:05:02 -0700 (PDT)
Message-ID: <bc4fdea5-4e19-420e-a5a0-779ec5fbb6a2@redhat.com>
Date: Wed, 11 Jun 2025 14:05:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 04/25] hw/pci-host/gpex-acpi: Add native_pci_hotplug
 arg to acpi_dsdt_add_pci_osc
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-5-eric.auger@redhat.com>
 <20250530102711.000034eb@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530102711.000034eb@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rZkq8zZfJA4720UylikZz5itNWm_dJBf7qkRGt6cNgs_1749643504
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: fLbcwXL2XfqL

Hi Jonathan,

On 5/30/25 11:27 AM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:06 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
>> native pci hotplug.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Hi Eric,
>
> Makes me wonder what we should do for CXL - I was expecting
> a very similar change.  Currently seems like those always
> allow native hotplug (__build_cxl_osc_method()) on x86 and
> arm64 (patches on list).
>
> Maybe that has only been working because the kernel is reading
> the PCI _OSC first. Or it's always been doing native hotplug
> an no one noticed.  A quick look at logs shows the kernel
> first gets told no, then yes as it queries the two different
> _OSC types. 
>
> Looks like I should fix that _OSC then it should be carried
> over to this as well (or if you don't mind adding a trivial
> patch to replicate this  patch for the CXL _OSC, even better!)

If you don't mind I would prefer we carry out cxl changes separately as
it may also require some test blob changes and I am not much
knowledgable on CXL yet. I would prefer stabilizing this series before
extending it.

But sure if it is relevant we can then mimic that change on cxl path.

Eric
>
> Other than that, this patch looks fine to me though I do wonder
> if we could unify this with build_q35_osc_method()?
> I'm not the best at reading AML generation code but whilst
> they are written quite differently they seem to be functionally
> very similar, more so after this patch.
>
>> ---
>>
>> rfc -> v1:
>> - updated the "Allow OS control for all 5 features" comment
>> ---
>>  hw/pci-host/gpex-acpi.c | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 0aba47c71c..f34b7cf25e 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>>      }
>>  }
>>  
>> -static void acpi_dsdt_add_pci_osc(Aml *dev)
>> +static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>>  {
>>      Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
>>  
>> @@ -77,11 +77,12 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>>      aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
>>  
>>      /*
>> -     * Allow OS control for all 5 features:
>> -     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
>> +     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
>> +     * and PCIeHotplug depending on enable_native_pcie_hotplug
>>       */
>> -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
>> -                              aml_name("CTRL")));
>> +    aml_append(ifctx, aml_and(aml_name("CTRL"),
>> +               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
>> +               aml_name("CTRL")));
>>  
>>      ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>>      aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
>> @@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>              if (is_cxl) {
>>                  build_cxl_osc_method(dev);
> This was the path I was expecting to change as well.
>
>>              } else {
>> -                acpi_dsdt_add_pci_osc(dev);
>> +                acpi_dsdt_add_pci_osc(dev, true);
>>              }
>>  
>>              aml_append(scope, dev);
>> @@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>      }
>>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>>  
>> -    acpi_dsdt_add_pci_osc(dev);
>> +    acpi_dsdt_add_pci_osc(dev, true);
>>  
>>      Aml *dev_res0 = aml_device("%s", "RES0");
>>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
