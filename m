Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2677894njc;
        Wed, 11 Jun 2025 02:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUELkQ2VmCHxTMPYwwHsE/3VtRZWFJQAwJ1KgbRRTQh8DKjvJdD1R4r0Nc8d4K1pDVD9rSk1f4RqdDnjA==@linaro.org
X-Google-Smtp-Source: AGHT+IEGN8tBeyaMxDBepprBy9TcwNsKwvdmNTH06pWKhs3Lxc5CSjIiVzm7Dtr9BmlLQCjN4WHW
X-Received: by 2002:a05:622a:59c7:b0:4a6:ef86:19a1 with SMTP id d75a77b69052e-4a713ba060cmr45182461cf.16.1749633221286;
        Wed, 11 Jun 2025 02:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749633221; cv=none;
        d=google.com; s=arc-20240605;
        b=HcUK9qI1WqRy1HToOknrkDEKCbWcJzz0IULaDd2QResfTs/0YkC9AZB+8IGaul+33c
         ++qUmgb5bRcXZOlQleRRT9ntvAbSxgSf97sIP7yU/csyq58oYGjVDdsBjtS2VUmOcyL9
         HxhDFlwlsqPFekWjG5aFhtjgyjFxECKnJltuN3IGkSoOBfl9uOnTJjPXYIATNDZs9L2R
         QIVbTYIT9Nfew27tFTftVex/hxRzETNl0zInurfh8f49PLj++yobyf4bqXyNpMv6n+IQ
         PFIEPJqP+xWSuIydmGmteEWsoi7PglD8KsbkMQyvgHcK149Oy/TCIlJxJsnTwA0etNuV
         r7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=NXYfBMXXrdWQCyOd3hAGS6hxjfGiHUcvxYM5pAvvxEw=;
        fh=aoea9PWjbWB5P/UpntOh+yUGrEfInvbPgUiceoBMLb4=;
        b=Ba7/Djir6QPp7DyTipaboIgtsuXb/e88aeLscr3CPoMk9D5sPaSaNR+0hK1m8mewCq
         1KGCzeyzH16jCCbhkQgLvnVWMpHPD44O0Ny0LIh1qRqZzeiUqC5jjRqDnuBOyHDd0vbu
         EZbavOqmrhg6eW78ZkW+gCoqYKTzqxVJZfGOI7RcSDAi7zWKRKuH89uTldmPLRJqtf+/
         GMFj1F58whVIZZ+XFBggWS2uHgPUjqsDtqu3H8Rs2JihK4s0W/G53Vj03jx7RK9mv4je
         x6dO7PD+vi4tGW82OGLAvi7VMBQqJXoXog2hrgXFB6KKmIq8fjya4RAWjiFuu29uku7P
         rlQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmaksY6r;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198aec3csi115984091cf.538.2025.06.11.02.13.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 02:13:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dmaksY6r;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749633220;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NXYfBMXXrdWQCyOd3hAGS6hxjfGiHUcvxYM5pAvvxEw=;
	b=dmaksY6ruaWni5egwwRRl2+dFEPpUZuuYivoavgd2EyxwDZA9rvVSY0I5anBfw3wa3525H
	om+PlXF0cCS8FfKX7H8dmdU/KMjHMbEggUd7TNyPts7kvGQ7wn5egnoNj4WHBZ/CCJasc6
	dfBE/cYqzJxGEQd+cKQfIuWKrdjZMqQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-363-5dtH-QFEMnKTNUHbhuU33w-1; Wed, 11 Jun 2025 05:13:39 -0400
X-MC-Unique: 5dtH-QFEMnKTNUHbhuU33w-1
X-Mimecast-MFC-AGG-ID: 5dtH-QFEMnKTNUHbhuU33w_1749633218
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so4187960f8f.3
        for <alex.bennee@linaro.org>; Wed, 11 Jun 2025 02:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749633218; x=1750238018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXYfBMXXrdWQCyOd3hAGS6hxjfGiHUcvxYM5pAvvxEw=;
        b=SpBzoQzZeZ0/q7TyKROnQpND2yiNiArUBQSzZeoqMQTaSyD/uDn+AI1ySFbcZvHLrA
         FxGOTKFMDzzAH28b0qixpRvV7OUKmovccjZBGSV/cmZ5lNgIUl02eH4GTuQbCRvVG5YA
         +5HRqaals145cGbJzFPKp6mQg0Nw91HK1OoAuomJD/cPeoexMefn+zQUEi0S69dG2L53
         3nEwq+5RDNeFMUw4iQJaaqQcoXNLIg97hdjlbRNbESN+6cMU0HfRSOlKs3GYU7JW9j1B
         QEvIbNDeiaMMkJhli0TFItFuYaMwprqbWMrdwDNaDkVkiPgJFa5nQID2yBCuFd4XwQZn
         V/OA==
X-Forwarded-Encrypted: i=1; AJvYcCUx92Y/mljfhj2JXDGhH5bvPOuuqjLURSpPcLVJH3v/kKzeARoPbTDYGEEQtwUAwmLie8v6lO3320XiFw==@linaro.org
X-Gm-Message-State: AOJu0YyymDseZqLzTm2UdxB05SVcPSjhXpBCJ/cdNNnCZYWXHwji0/UR
	8ByfD/v8imFmEm6QJ2s+YMpwzjRAxzvA4pQDYk1Lm6EfiYw1YJTiSaOoK5dNhR1vERWJOczr4cO
	t3QBX3P6nfmOY6fdr0gu2JX+bafoWCzbbcjE86j+ANxGywBuE6mG/jgujvQ==
X-Gm-Gg: ASbGncvCoV0+jxtsTa0MSre3LbWyt928VrS1OtVa+5ada9/7ymuITSCMhcm9VnbhDAd
	cswcU6IgLER2lX6E26DjGuQ9f+gJGVwz1v/RxDsnyI+hy/gZrtCqylmBZnFVYezo4IvhT2WuRZ+
	7pCR+uWprb+L0ND52ERoxgcSWKY24w62VqCH2aOZ7QUGXicMajpvt7WLOScYvD8sA4BTn6eEr9p
	7FoeEoxN0ghIsc37Vy1Af0SlSPb7v+tXsmhhHI0wL05tla2L7c8bDLFzRmkrvAK40xXxa4mH/EM
	gT1kEuQPu10/VOqb99pWl868AIM0eYhyQeYBQMzqtkV+Q+vMjc9yGGsYFXSfDI2DsNfMDA==
X-Received: by 2002:a05:6000:26ca:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a558a9a08amr1806666f8f.1.1749633218420;
        Wed, 11 Jun 2025 02:13:38 -0700 (PDT)
X-Received: by 2002:a05:6000:26ca:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a558a9a08amr1806628f8f.1.1749633217956;
        Wed, 11 Jun 2025 02:13:37 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532131df6sm14436568f8f.0.2025.06.11.02.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 02:13:36 -0700 (PDT)
Message-ID: <e1b7e7c3-fa13-46f8-8a61-4767ff9f7c89@redhat.com>
Date: Wed, 11 Jun 2025 11:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 06/25] hw/pci-host/gpex-acpi: Propagate hotplug type
 info from virt machine downto gpex
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-7-eric.auger@redhat.com>
 <20250530111413.00003c66@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530111413.00003c66@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JGPTtY4aif_4BWTTsrVk82vZpYMzyw9D63ijSvAdFWc_1749633218
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZpK0Twx+pPWR

Hi Jonathan,

On 5/30/25 12:14 PM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:08 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Propagate the type of pci hotplug mode downto the gpex
>> acpi code. In case machine acpi_pcihp is unset we configure
>> pci native hotplug on pci0. For expander bridges we keep
>> legacy pci native hotplug, as done on x86 q35.
>>
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
> This is awkward but explains why my CXL cases weren't causing trouble.
> A mixed config is counter to the recommendation in the PCI firmware spec
>
> "It is recommended that a machine with multiple host bridge devices should
> report the same capabilities for all host bridges of the same type and also
> negotiate control of the features described in the Control Field in the
> same way for all host bridges of the same type"

Thank for pointing to this spec excerpt.

Maybe the nuance relates to "host bridges of the same type", ie. gpex
versus pxb?
refering to Igor's following reply i will leave it as is. This is
inherited from existing x86 code in
hw/i386/acpi-build.c build_dsdt():

                /* Expander bridges do not have ACPI PCI Hot-plug enabled */
                aml_append(dev, build_q35_osc_method(true));

Eric
>
> I guess if any OS isn't coping with the mix then they can request native
> hotplug.
>
>
>
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
