Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1881369njc;
        Wed, 11 Jun 2025 02:00:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtDWvbQ1RuP9CCW0UjXNDufkeNnEN5FNtax12ik0Gjme691GbA7cJ2tJMrxiLLM1/+MCVawRbRcWfXGA==@linaro.org
X-Google-Smtp-Source: AGHT+IFP3Lzkni6gaTFcKWHs7iGJvWjdJnO2Q2O7JMgHCLdeWL/qZuCqzLcXcoJ875uRRE+Yh9gK
X-Received: by 2002:a05:622a:1e93:b0:476:8e3e:2da3 with SMTP id d75a77b69052e-4a714c5a7dcmr31689231cf.30.1749632410484;
        Wed, 11 Jun 2025 02:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749632410; cv=none;
        d=google.com; s=arc-20240605;
        b=DfRWQug/chSAkjjBGQVpZb7vJGCVmft9XpFdGkEZAVUC/PF06pDJRb/c1i67QFbsIC
         3FVeXALdX/qi87sA7KpZ9iZlTpJFYrSpkkz21ykfTnXL/dkI3QgQTtiBSSYRGXpuhnVg
         YLsLpFdoQNVITyMZJ0bbkJOtcUcls2Zz/l34L+1GadhWvyZlQfYrRhuaQ6fNdt/ewHUl
         adpNinbLt+9oNtfBWM+VE610LNaTdsyM6aZvLe/1if5aSj/o0rr6jxVro25f8IkSWh/3
         pKoJMBcieBexbkSxT6jGTEO91tMu+MmImHPOhjOEEySe3coRut6XCmF/76xbsyIYAaV+
         nKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+MHfoli/1u5+jXUbahISFH6LvKqHhzM56wbkbSnXS2s=;
        fh=jLOKIaoXKMY0pwe3a7Ix79nk5hEe1y6Wu0j4FMNOYWE=;
        b=KDpKUznWjSo6BvQetPfLB4UUYR+AX03q+wN1dT1HWDx152rnGrCRkU7AKMwCJhYdLv
         WHLlOH+WSj5R1lI6BuBzfL+lmwit2qegcFZLoFTSTtCLie0NhAWWA3r/hDEwvlMz3qsd
         vUAOpP2AVgTu6pTNyoRcNh/TCZS7lMG8oRh6QEzNPTIjMtMw4JPGlUFl+F3i0VdVjYv9
         mVXbsLrfHKOo58Qxr2DGvWxwfhyz/TsAN93xs5WfU9G2hlcPk7qt2xhcW2PpBBi6EImz
         yk6VbOk08wfihYYGjnURGPYfO94MZd9ZpL4/YBgA08bxlzaNI3Uvy5iViRKWalwOMsye
         utnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqtbPLwa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198cd178si119048191cf.631.2025.06.11.02.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LqtbPLwa;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749632410;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MHfoli/1u5+jXUbahISFH6LvKqHhzM56wbkbSnXS2s=;
	b=LqtbPLwal19vqfvnsr16h1umxqpIJVp8RLWZPdpf3rjvAIHRytIJR5KYthtYykJsq922cg
	EQmpNyIJCCxkDZCLoKHaz9XVzAkU+f1rZiUgoae+hjOIVis2bQWugyFgLzKEAeT/3KNxYp
	fcHLERQtBOKqH5PNOszZp3LndfpetmQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-MiuaOjuQNYqmvVKw88FtUw-1; Wed, 11 Jun 2025 05:00:06 -0400
X-MC-Unique: MiuaOjuQNYqmvVKw88FtUw-1
X-Mimecast-MFC-AGG-ID: MiuaOjuQNYqmvVKw88FtUw_1749632406
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so2807755f8f.1
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 02:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749632405; x=1750237205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MHfoli/1u5+jXUbahISFH6LvKqHhzM56wbkbSnXS2s=;
        b=q9qt0Z0j9bziC5IP6VUjRBad6oLUoxz9H5ehmi4RQtv9QjWyCEBa/kvNKZ+qJND3Tx
         rYe/xew9mX8DddWmt88mq18p/9KgGvdmqL/t/G0LfLutc96976u02wccZj2SxleZReIk
         Op8rZitDTCcw+KKDzZ4A8J/YhG7aSHs3IqF+a0B+0fNqqzo0AgCthbtR7jdxBJm9XZ2W
         O5CiPbioHwBcgo7kOG8kpJ7bdem2jt1MOah9jc2icS8hRpvuSkUMIAFLjB3J2b/m7DGD
         k+2RnQ8RbqBJJ6aSiL4ot7/sMFsrcsr0tXXGLF011l3KgeqpEe38wCD6KCkg0RXdTiKP
         gNZw==
X-Forwarded-Encrypted: i=1; AJvYcCXg+Il6XXithGwk66ArxDvt8LOvTLbGJD9GssjiPsnqLOIeK7HoxnRuI4jlA1SqZD77jmyAosiBvnd1jg==@linaro.org
X-Gm-Message-State: AOJu0YyIuvd7ZVe2d2i7MQY16YUI3FvHMPz0FS17GU2kdA9+HzC6+4NT
	75LtIsY5YKszFJlwLD3tlU1OPOJ9zH9iDMW0Q0WUIYFC38FUI81IvJ/kHTCiUbJ1EyogL017cCk
	YJ82yDswMfP8yRFcpDEGW8i5/Vp0fhCZFkoNOaCRPstjsy+LYgG1NVSdVOg==
X-Gm-Gg: ASbGncuGW9skpBVKC9FvbEE66LdUUegjKcGIPfWbRnis519x30faJ47rOubKuudBr5E
	20zBvkZooGLdpvTtuSxAmeph8Ou7mCwWqHA7Pavz/Zh8uhvkmR1TdSpDplpD/KrbJUgLqp74NKs
	edcCCSdY2DkxSID8EUqZmTgFYhoWJ+yop4FNveBCeh3XWV+Oqk4RSC664u0b5DPsacVfJVOF8Nr
	m++IW6BBRDibjiLpe/kEa/Cu0Q6cysxpS7+9yfmeHBXIGTSiVBXVCepEKPw+h+g3ryHo4MhbPOJ
	TWlvSx1lkFL4Ljav+NR60kR4tgPGtYz/+1ISRdHAutJfiF0xgyBgt1Z1K8xlcK13R3SIJA==
X-Received: by 2002:a05:6000:2210:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a558ae65d0mr1796256f8f.50.1749632405463;
        Wed, 11 Jun 2025 02:00:05 -0700 (PDT)
X-Received: by 2002:a05:6000:2210:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a558ae65d0mr1796204f8f.50.1749632404984;
        Wed, 11 Jun 2025 02:00:04 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm14860062f8f.71.2025.06.11.02.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:00:04 -0700 (PDT)
Message-ID: <72c84565-3879-4c08-a73c-15bc5543ee2b@redhat.com>
Date: Wed, 11 Jun 2025 11:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-7-eric.auger@redhat.com>
 <20250527143301.77f5bfd1@imammedo.users.ipa.redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250527143301.77f5bfd1@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hx-PY-Lnh9KNGQmy_-vyUX4d7hn3XfHhG7D8fmwxicI_1749632406
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 1Fd1v5q1D9Dv

Hi Igor,

On 5/27/25 2:33 PM, Igor Mammedov wrote:
> On Tue, 27 May 2025 09:40:08 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Propagate the type of pci hotplug mode downto the gpex
>> acpi code. In case machine acpi_pcihp is unset we configure
>> pci native hotplug on pci0. For expander bridges we keep
>> legacy pci native hotplug, as done on x86 q35.
> this is not needed if done as suggested in 2/25
So since the property would be applied to the GED device we will still
need a patch that retrieves the GED setting and propagate it to the GPEX
device.

Thanks

Eric
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
>> ---
>>  include/hw/pci-host/gpex.h | 1 +
>>  hw/arm/virt-acpi-build.c   | 1 +
>>  hw/pci-host/gpex-acpi.c    | 3 ++-
>>  3 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
>> index 84471533af..feaf827474 100644
>> --- a/include/hw/pci-host/gpex.h
>> +++ b/include/hw/pci-host/gpex.h
>> @@ -45,6 +45,7 @@ struct GPEXConfig {
>>      MemMapEntry pio;
>>      int         irq;
>>      PCIBus      *bus;
>> +    bool        pci_native_hotplug;
>>  };
>>  
>>  typedef struct GPEXIrq GPEXIrq;
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 7e8e0f0298..be5e00a56e 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -129,6 +129,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>>          .ecam   = memmap[ecam_id],
>>          .irq    = irq,
>>          .bus    = vms->bus,
>> +        .pci_native_hotplug = !vms->acpi_pcihp,
>>      };
>>  
>>      if (vms->highmem_mmio) {
>> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
>> index 1aa2d12026..f1ab30f3d5 100644
>> --- a/hw/pci-host/gpex-acpi.c
>> +++ b/hw/pci-host/gpex-acpi.c
>> @@ -204,6 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>              if (is_cxl) {
>>                  build_cxl_osc_method(dev);
>>              } else {
>> +                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
>>                  acpi_dsdt_add_host_bridge_methods(dev, true);
>>              }
>>  
>> @@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>>      }
>>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>>  
>> -    acpi_dsdt_add_host_bridge_methods(dev, true);
>> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
>>  
>>      Aml *dev_res0 = aml_device("%s", "RES0");
>>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
>
