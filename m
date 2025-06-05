Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp398977njc;
        Thu, 5 Jun 2025 10:06:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgPhwq7LCwY2Nq67oo0ZkODs2th06T6fpU2m/GE4AxYIrOEZucHm8gThv7xIi772ElEOT0xv8uqGlu6w==@linaro.org
X-Google-Smtp-Source: AGHT+IGrkyMNpieuGR+SMDHhpJRYMWYKHqpQJ/Uy9huiB4aAN4nzd2CyUgmmbWoWSvYCY8JOUdIN
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr7292416f8f.1.1749143213452;
        Thu, 05 Jun 2025 10:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749143213; cv=none;
        d=google.com; s=arc-20240605;
        b=iQCgpSh7PX+hwcQfayJIXsJ0sIq1OTc5Yg/wxfOWzTID/x1+QdxeO3zJLqKSSr4o33
         aKo0IzCm/rGb8Kp3CA308CCtTh0+oJ2gjymg3gBrAs3+ta0gJal/R5W6e0HaUdNoZuMz
         L6ImZVztPIvZ7fmn0Aob7nMNQgdc6m4kw1+Wi+O+CirH0xG8wIN/SyMG0yv5Mf+7Z2nP
         EnLGqq4zwPFsg5mMP5lj1SiUGyM7zRxzmUtMENCCtN+Rk4iZPVnFE6+DIGfGCSbJwf4C
         D8HR60g3yKZao8Uk4AFfvqQGytJ3Nxzt2lV9dOiLMV8BDemZl3W2qrW7h+LqCzpGYZ0R
         UYxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=s15N0T4/xnYnO7RKr5aWAWdsH88cqDAnX2oSjGhvUi0=;
        fh=l8fnTBpPs/syX/H4i3Evqc18n+q3NN+1SnHUhZGFmPc=;
        b=aFLoghhkE2y6CQu8JfGBT+XaBtw6EiMvI5dO5Lpt13OFr5XD2UAI77kPq8Ra1zRTsp
         nYGCfbl3XUDjDyyE9kcjlzvpjgqj29KdBC5EwskLiEUxUSkH5fErYBxTprZl9V8tmYWE
         xyNlgGwOdbTozEBj0Yv4a7Mdix8N840Kgl67Ggce3gUZ0kM+ZLUckcGAQPv36iaY3bZk
         qNxnJAZXe/bhvQo9DBPLRJsiyOamZaeNGcU+eX2kQCaZEjDFWp8S4LoKaTyZEui88N+L
         0gDqli7lGkaOLA4D/pRqG6FiSPS1+Vgnir62WFMXbQ3itprj9SIiNT6OqKH2Om2nbNnB
         eUXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CX+Q4lMD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4f009b341si13232062f8f.799.2025.06.05.10.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CX+Q4lMD;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749143212;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s15N0T4/xnYnO7RKr5aWAWdsH88cqDAnX2oSjGhvUi0=;
	b=CX+Q4lMDMgqIVruTWAG8j9K3rapZrDbiJzwbJjZGsU043197WtlOJQ0kSyDcyuJR/NS+dT
	ZEs66K+dZTiyT8IEnXjoz5K7zD6J8GB8XxKsTi+JflGR1LRB+lCDvexrttLZ9JvgwokNNo
	NNZe+TxTUGL5hDtb9V1AUSEHHkTZXEQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-41sEAk15PdOZakMFBqMFpQ-1; Thu, 05 Jun 2025 13:06:51 -0400
X-MC-Unique: 41sEAk15PdOZakMFBqMFpQ-1
X-Mimecast-MFC-AGG-ID: 41sEAk15PdOZakMFBqMFpQ_1749143210
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f3796779so884924f8f.1
        for <alex.bennee@linaro.org>; Thu, 05 Jun 2025 10:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143210; x=1749748010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s15N0T4/xnYnO7RKr5aWAWdsH88cqDAnX2oSjGhvUi0=;
        b=xKlLJwke+RlRxG+gSIQbhMlXxnpQvhWWNHl7TTqZqsCiPS/dapDQbhLWg8CjyhBxot
         T5KioYzOKXJcjjkMGlVYaxYaMj/DEYHSG/U9SiwFEWHXtSz8N+mIr26RuexX6ywGa/Rp
         elSL797w1WZbnjE9u+RatauUmFHG5t49L22jHYlNDHtxRVdsDfIon3sMrw2Uohdl7rzJ
         eRoh8sAttvMf09f9Dsym/EJnWRitGSqrO3oXF597QoCtMzFUHQFHc4CxIX6Myx2pKU1b
         2OCu9QaAZqndtWbSKYgyUeFmf63O7zYbPwCjLTHyLNl4sbn2WpgVgx8f6EjhqyTe20kU
         KBPg==
X-Forwarded-Encrypted: i=1; AJvYcCVCKhflSZ2TBJDFOhXzaMBOX2V1XZdkJqch0+vRKmHcALIJ5/Q0nts9RyR0h2G6kRB+SPe1JkFDbHZ4Ww==@linaro.org
X-Gm-Message-State: AOJu0Yz71oc0hZNuoXxLudV9OZnU/iIh6XAnWjcWvTJrhNu4lW9i2w4K
	326WV4Ej7dSh2XJ1IZW84upzbhJeWtoME/dvV5bi7EXRTDa0/Zd7IfY3JkRNnxnByDmvGUz/mnB
	YaE1xhRq8OLllfdAEgebxZejkvI8w8548QJhotBlXVYlsRRLnP+s42Hn8nw==
X-Gm-Gg: ASbGncuOaLjKbXXhRCyfFMqybXX/zRHKDI22XhNPORAeSSrl30LzFX461aD2r2cTfqI
	cmorn1st3Zxy/GMxsmPs7b3ru8LVhsfHyDzMvra08FGorhtyfXWAVekLYz2Anys4tMEhL9IY8Ie
	Hq5ITEX5OUEtzSwoDAu3eFz9ICbIEhpGff69todqijh1fYiNqkM+4hMak1pzJ7Gw4BP5EDkvsXu
	Hs3rTMc+V0pNU7N3lBn/mJnH2xx9gzseHAPfLX49aHUP/c8OyD02CTAvkXxWD00DocVhWlnKqMj
	SMHeTiRQszojsHoxnkFIu+WnM5Qbirb2omnvAxcQpwFwPCo1PSEYN5ha85n1E078gXfBKg==
X-Received: by 2002:a5d:5f51:0:b0:3a4:e667:9242 with SMTP id ffacd0b85a97d-3a51d8f60famr7209309f8f.3.1749143209711;
        Thu, 05 Jun 2025 10:06:49 -0700 (PDT)
X-Received: by 2002:a5d:5f51:0:b0:3a4:e667:9242 with SMTP id ffacd0b85a97d-3a51d8f60famr7209248f8f.3.1749143209095;
        Thu, 05 Jun 2025 10:06:49 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f9816ccfsm31408505e9.15.2025.06.05.10.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:06:47 -0700 (PDT)
Message-ID: <7033bbc1-2f65-4cf6-a64d-df0bace9a555@redhat.com>
Date: Thu, 5 Jun 2025 19:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 11/25] hw/i386/acpi-build: Introduce
 build_append_pcihp_resources() helper
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-12-eric.auger@redhat.com>
 <20250530111719.00005714@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250530111719.00005714@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: krNQ-KFub5PzWcAXBDb6QVMMU09D60uCybNyDDHHTKI_1749143210
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 4sGYzyfmq+Mb

Hi Jonathan,

On 5/30/25 12:17 PM, Jonathan Cameron wrote:
> On Tue, 27 May 2025 09:40:13 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Extract the code that reserves resources for ACPI PCI hotplug
>> into a new helper named build_append_pcihp_resources() and
>> move it to pcihp.c. We will reuse it on ARM.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Trivial comment inline.
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>> ---
>>  include/hw/acpi/pcihp.h |  2 ++
>>  hw/acpi/pcihp.c         | 20 ++++++++++++++++++++
>>  hw/i386/acpi-build.c    | 15 ++-------------
>>  3 files changed, 24 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index 971451e8ea..8a46a414cc 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -75,6 +75,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>  
>>  void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
>>  void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
>> +void build_append_pcihp_resources(Aml *table,
>> +                                  uint64_t io_addr, uint64_t io_len);
>>  
>>  /* Called on reset */
>>  void acpi_pcihp_reset(AcpiPciHpState *s);
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index e0260f67e6..fb54c31f77 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -685,6 +685,26 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>>      aml_append(table, scope);
>>  }
>>  
>> +/* Reserve PCIHP resources */
>> +void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
>> +                                  uint64_t io_addr, uint64_t io_len)
>> +{
>> +    Aml *dev, *crs;
>> +
>> +    dev = aml_device("PHPR");
>> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
>> +    aml_append(dev,
>> +               aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
>> +    /* device present, functioning, decoding, not shown in UI */
>> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
>> +    crs = aml_resource_template();
>> +    aml_append(crs,
>> +        aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len)
>> +    );
> Trivial but this doesn't match local style.  It is even inconsistent with
> the _UID line above.
>> +    aml_append(crs,
>> +               aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len));
> maybe?

definivitely. Will be fixed in next version

Thanks!

Eric
>
>> +    aml_append(dev, aml_name_decl("_CRS", crs));
>> +    aml_append(scope, dev);
>> +}
>> +
>>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>>      .name = "acpi_pcihp_pci_status",
>>      .version_id = 1,
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 91945f716c..52cef834ed 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1432,19 +1432,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>  
>>      /* reserve PCIHP resources */
>>      if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
>> -        dev = aml_device("PHPR");
>> -        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
>> -        aml_append(dev,
>> -            aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
>> -        /* device present, functioning, decoding, not shown in UI */
>> -        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
>> -        crs = aml_resource_template();
>> -        aml_append(crs,
>> -            aml_io(AML_DECODE16, pm->pcihp_io_base, pm->pcihp_io_base, 1,
>> -                   pm->pcihp_io_len)
>> -        );
>> -        aml_append(dev, aml_name_decl("_CRS", crs));
>> -        aml_append(scope, dev);
>> +        build_append_pcihp_resources(scope,
>> +                                      pm->pcihp_io_base, pm->pcihp_io_len);
>>      }
>>      aml_append(dsdt, scope);
>>  
