Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp277298dyb;
        Tue, 24 Jun 2025 08:56:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUShuFLnmKUceaZRHn60TIZF16Qcte+HCmrjm2byA/E6WdgIbwmSiMmJRrchkrnzPQKvi48LtazQkt8oQ==@linaro.org
X-Google-Smtp-Source: AGHT+IExuD1a/Ip1c6RC0wsHSj+/nh1pY6HvdhLkE5BA5vkW9gOw8ZGu0ihvc0LYk+Vm5osNfUpo
X-Received: by 2002:a05:6214:413:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-6fd0a57a172mr317460306d6.37.1750780617393;
        Tue, 24 Jun 2025 08:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750780617; cv=none;
        d=google.com; s=arc-20240605;
        b=G5N2+eFE1RGSI5IJsOs1A4LrRtCfrMF8s/IODMHPvkHbaSJjyynB/u7hbue5wI7tMc
         JEBtEm+AbqPxGM8dG3XPmMHW84PEdtIF3jJ9E/4o+30n3peKbeRObXbX2878i5ys8dpC
         iVjrwZd50JnYojJ98Mf4dh3yJMnOeX4Ic5x6xFZ+cBJAhq2v8bfaHedQ/CWlm2Nv8KHo
         AAlvTWrUWQZgfIMLqyRZmkGeZNrS7cNLE+dXZN4OutztfmDm/k6W1o+xCKNbBzMJkP8x
         K/+h6B2EW8sfWZaaEAd5gsqBV9C9kLQF+97iiTfQmQOSoZzVRX1CxuyXjbwINdmJpLPw
         NQ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/OSL/LcuHhu0TYe397VwHKcVqyQgV01Edt6gbFWcJXo=;
        fh=NeTsEca+exS/YicRzl4WhJ9NXlst4GuaQjqDGN9eDSo=;
        b=kSsEvsHP4dAOojxqGP9L9+7eJbs60wpUpFxtS6VLAME4TN4E/7zTbmTNQixlZOsNwQ
         O+L57n/cyDJQtfdwv/ynqi0NiVXGFhdCr3iuigMTys09VC3O3go/VnC8BpbvimWqN73i
         3lvAGsV0Wu3rIkNAZ20scyG7UGSlTpu/K6qRA4CJwqlbZPd72U5f47RLDwYA0H1dbu1/
         HCHkAQZ3wOVaIubUgrIFN5SnkbjVlGGTB1gWRhC9IJFqSxdENbvJEpn3TYUHegTSU9Yw
         yuuSafLREKQIiB86RL5objfd+TVTHKKJPUmeEL/oExBlj8EC3ld+w5Ie3iCGGrQZDGJc
         199Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YuRvO3ci;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd12730d78si94638486d6.487.2025.06.24.08.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YuRvO3ci;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750780616;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OSL/LcuHhu0TYe397VwHKcVqyQgV01Edt6gbFWcJXo=;
	b=YuRvO3cirBBhXMxgNrh1LL08wxd2q7SKS/+9RDrMPHRCuCXFC1HiXBKrWReJrAhFyoz86e
	4xmWLes3u7EPEMh9EdN5EEYtcKEzSYdlvkU/75mbm0BfTnlMtATfy2wREk+COfPGmwxt2M
	dQme/ybFcaJ24z9KaRA66BAHQ74Gx+8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-06L--N32Nz-VGXhvTrL7hA-1; Tue, 24 Jun 2025 11:56:55 -0400
X-MC-Unique: 06L--N32Nz-VGXhvTrL7hA-1
X-Mimecast-MFC-AGG-ID: 06L--N32Nz-VGXhvTrL7hA_1750780612
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450df53d461so40991995e9.1
        for <alex.bennee@linaro.org>; Tue, 24 Jun 2025 08:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750780611; x=1751385411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OSL/LcuHhu0TYe397VwHKcVqyQgV01Edt6gbFWcJXo=;
        b=vnttFD0MiNiDbxnFwVOMkGyghEE5bp5mpsQFl9EecmXzui7fAaTD4s8PFGsZKxTY4S
         ghagFtPiMlXxEvlX+d4hRocfH/jpeUAlwyigrXSkiEKr+ii3bVnUabRJHxDwJMv0S5ZQ
         GDrc91lKCtOKuedBg6u0gowYBxXvk4pC0hdjr3+crSx+Sb4QlXfsTBwBkYgzxKlSvBvd
         Jlk0nse/UjvrNpQpJmYhGhVFE66atyeDfhGIPnaDbIMm4RTfxtvBjOOvtYKaKWb6P1PQ
         S5CSV4nOLwjKjRRy3JIpXEXnGzwjme9RlNDyRwc3g+kwZpmy8sYmQB9KfRvo9zno+fTL
         UHEA==
X-Forwarded-Encrypted: i=1; AJvYcCUULtLgJgpbySauhKf4QjcLaw6XZNWiJ0g4HXXxBEM6YHz8TSOdlgdSki5ggyTkJG8qbGSY2EWCizHtxA==@linaro.org
X-Gm-Message-State: AOJu0Yy7VFWnWCYF7qUnhdjXCGS1pgc+RMB3aFMvDq9B99b0daHK2GqR
	rrOayFkK3erpmOnq1UkqYqmnrbJ5Genz+w/dixYcWgXUuiO2cftzp4w2y1+hZieiGmGur73Y5bs
	i8Bx5cBD4bQgGbLlsaCclmDvkwY/UKeqcPs4GlCctT6X5GgTePEoj5IZsUg==
X-Gm-Gg: ASbGnctykUakZ9KApg9+9tc61NmB0+M5KLAFoJswyE6LfoahR+WX0gD7O8ELz+g8R5f
	Ibm1fszaGsnfpxlKl24C2ZvnETahnryvtQpG/38cMHwfEmhxFBO5l8AUnfYJQM3l4FaI83L+VgH
	/kVjV2Ypu2AYDeHFsWKAsKdFqzPIgGSyll5v3tcSw8jiuFXVyNl1BBPXjyuQ8djQweu/LUqq3Bs
	/AJKqw/SJRyulJ6GuASLkZEyNaQtAXOGpUK9SacDVVt51ttEhiXSxEL3nENih/rYKZG3niYzCZq
	RElHyRdfpFWep6ZtS/pV7AO2rO1a6Y+hWTxQlF6Ljoo/ylkH2sJnDHxf2NCL1j1xdf7vUQ==
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr176392355e9.14.1750780611630;
        Tue, 24 Jun 2025 08:56:51 -0700 (PDT)
X-Received: by 2002:a05:600c:a07:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-453659caaddmr176392065e9.14.1750780611217;
        Tue, 24 Jun 2025 08:56:51 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2339sm183442545e9.28.2025.06.24.08.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:56:50 -0700 (PDT)
Message-ID: <8b09d9bf-a52e-4680-aeb5-71b6d6cb9925@redhat.com>
Date: Tue, 24 Jun 2025 17:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 19/29] hw/arm/virt: Pass the bus on the ged creation
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-20-eric.auger@redhat.com>
 <20250620103856.00006903@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620103856.00006903@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W6Lsvge0LvUk--IEIV8RhlFsGPWmg2mESW8aQlgHUAw_1750780612
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: udSi+va7PkE8

Hi Jonathan,

On 6/20/25 11:38 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 11:46:48 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> The bus will be needed on ged realize for acpi pci hp setup.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> I guess doing this in separate patches for previous and this one
> maybe makes it easier to backport the previous if someone just wants
> to enable this on a different arch.  Otherwise I'd have smashed them
> together.

for me it is also a matter of maintainership/reviewer role separataion,
virt and ged being maintained/reviewed by different people. So if you
don't mind, I will keep it separate all the more so I collected R-b's on
each ;-)

Eric
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> ---
>>  hw/arm/virt.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 08bd808499..2f34877716 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -696,6 +696,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>>  
>>      dev = qdev_new(TYPE_ACPI_GED);
>>      qdev_prop_set_uint32(dev, "ged-event", event);
>> +    object_property_set_link(OBJECT(dev), "bus", OBJECT(vms->bus), &error_abort);
>>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>  
>>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_ACPI_GED].base);
