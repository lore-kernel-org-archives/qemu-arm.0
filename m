Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2388226njc;
        Tue, 17 Jun 2025 02:35:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViS/8pjbLYePPkQZbeOI6nVNLXFi6lr2EQ/biQklqZN0Omo5ySJrlSPcEJU+5kOjezCAeQo+Ljl0d05A==@linaro.org
X-Google-Smtp-Source: AGHT+IFaaRzD8IoWXCLo05MWDVzGHxmtK4JVIi1j17XC+eZFaDiQoZhMKgf33G+3AhF5xwc4IwNs
X-Received: by 2002:a05:620a:2a04:b0:7ce:c603:f054 with SMTP id af79cd13be357-7d3c6d08804mr2152044685a.56.1750152907346;
        Tue, 17 Jun 2025 02:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750152907; cv=none;
        d=google.com; s=arc-20240605;
        b=VHIl7mQ0MpYm8LtIOrArrDHLIju+KlX0LxhzJv7urqrYRotN+LkoyWy7ZxwQoFLVPx
         alCpMKEZzS+TWp5xTvO15UaFaMGg3Dzskf9MTOHozA+/pn0mZ8p0Vhz7ZOaG3dIxqJeU
         SOpj4RoirVoWA/VKKUZWZPiSRkcmaOANndUMeGFL83f76VprIKDyS9jU0Wf17IfnmYul
         hLt9dD/v3ZnxicG0LTzopSm0g6dqI7FNK7rsi/aS+suZ1PQLeJ5WIZUnk8feNYWavey2
         fjbMfYIsdtmUZweMmQtDGUpv/w5bG/7JfXCZT2Uur9z9fiFP7nfyetATEAHFR1aXUc31
         rzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=4IxRAZDdRGkQQHubgoZbvwTEto/wqcug0Mn7VTI75TQ=;
        fh=WgiEXtiFp8PKLU6TyZ/KDNqOXGHlRB9CrZ9FG3aa8VM=;
        b=cdBkAtCzJA4G41vWm0UOirLhgFpZGiRkz9CmPIBL3iHxJM0l/LHZ6V4DgcAKcsbtvB
         Q0wrghfRETLNo/+z0KlrxOwAdy8J0+TQ4q0yZyapr7UwGe5eDb2cMisKIcrcr8/WnJz0
         jA1w1HAY71KM7kT2qrd0UjAAHP5TFb7JPMcY1atcFEQgxB8S7nzw3IUY/sRWjz25zdwD
         xXFX8wYPxEDdhfFrnGTbYniJ87xvqu8OJDVpTH3ZTWmtrvj+a3MIWmMlStg/PJ2Ss2ID
         dSPFyivinC+bm17SIWzFq9IhIQ65WGmqOzO9ohKSFYxvrwKetwAFWo/zA/g+u99R/Dqg
         RW0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BOAwPTvC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8ea7269si1175104885a.257.2025.06.17.02.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BOAwPTvC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152907;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IxRAZDdRGkQQHubgoZbvwTEto/wqcug0Mn7VTI75TQ=;
	b=BOAwPTvC1apwn9HL4BrD55j1lFnAMHrK6dJNVurnjOsqcF7PnEY4q9Q+apUQoZC5jk8f4C
	SmRyzwk+aVE8lnADquDOLuHPzxCPWgzbeJtmxEKs+sdNHEXfcw+jCfYmxktTmMiJ4Vod1w
	OR68KHEDWQKNfHt1XTKwxoEoLt0GxKI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-vu1zC-TaPv-KJYdlqm9GJQ-1; Tue, 17 Jun 2025 05:35:05 -0400
X-MC-Unique: vu1zC-TaPv-KJYdlqm9GJQ-1
X-Mimecast-MFC-AGG-ID: vu1zC-TaPv-KJYdlqm9GJQ_1750152904
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so34364885e9.3
        for <alex.bennee@linaro.org>; Tue, 17 Jun 2025 02:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152904; x=1750757704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4IxRAZDdRGkQQHubgoZbvwTEto/wqcug0Mn7VTI75TQ=;
        b=tQLsZYJ7X2rT/STbuAx8qP82eOX1/c7gFTsmxzJWMTC0NTjQCFq/oXzyqYT8TEarhq
         aYqVvVQvuqxNcS2iIdttGr5J/BWoVnCUBzS30FuVdAqL4a5Y8AKcmSbt9CGd3f0m9Y21
         obJaCj6Y/cVN+o39akFlK6hTEcu1NAABHWy2NcVhLaVsGjdIMcUJH7ycMq34R3N5rvJU
         eEX2o6pHr0Lqgx3iBO7RbdXnpwzyDb/REShYf4NbJ74Pk1Dr9i8aNfxRWE0lUWm2amxe
         Fq3ubxyp9KzslPZQOERllKhl1rYsF5FZsIgX8cYePvb3kOtqHIfOGiHIL3w1Hj6u7bFe
         E9dA==
X-Forwarded-Encrypted: i=1; AJvYcCWxMYPJmJpqHo6+KDOlOXf1LWLxDgShw82RbNaMx31CTAFvuTPoCYu9X4G+MqVkikstIUUmZtq9BTZhaw==@linaro.org
X-Gm-Message-State: AOJu0YwNRfoie1IMN4WMiwJRl9hlw944m0caJmuenfHrHJuS6mz5iNQR
	kT3mfZ/6wwNcOAYVhWS3pDmanOz5ggMDc/6vT5stQZto5Zu+kgsXHA4J/pIUt1thoMlQrYpIpLG
	8rBPBGGgSdQxa69g3zky8tWbp2iJKlz4OW45Lk1fGJgkxs8iQP1axc0a5Tw==
X-Gm-Gg: ASbGnctDbDRByylzS/3rdwsvVHx97w8Iz3jG2ITIALETl/evNBURIQ2tLZwWQOk/NAt
	Fv1S9gcf2DlUB4opsP26p+RApEOobB4X9Dprlj2XvGgd+zJZZWA5pzXY+F5CX+D+xnKGIQM07a0
	bE9iXFwgf5Z0UAje9bn5o7DurdG5gqB9oOFxKGx5IVf7FgPLL02VLBel6j3oaJikYKePOJxgjFj
	0UHq9KllWETn41EJMqAyRHg9Xp7HQWuO7abc1ThtWjY7vKPeud0Jj3OWBhQkQ9h22D1jNhcufXG
	UZBj2XRg9nobU/3zO+9HulHaL2Ejr0H74sJ3TBTT3Fcu4cX2d58GI3y2ixVjb/oDI4j5EQ==
X-Received: by 2002:a05:600c:4e09:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4533cb3bb4bmr101297745e9.20.1750152903974;
        Tue, 17 Jun 2025 02:35:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4e09:b0:453:6f1:bdba with SMTP id 5b1f17b1804b1-4533cb3bb4bmr101297365e9.20.1750152903583;
        Tue, 17 Jun 2025 02:35:03 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531febf905sm197876505e9.0.2025.06.17.02.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:35:02 -0700 (PDT)
Message-ID: <5b0f2250-e521-4172-870c-0384c5ef2382@redhat.com>
Date: Tue, 17 Jun 2025 11:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH-for-10.1 v4 0/8] hw/arm: GIC 'its=off' ACPI table fixes
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qvBHvHa_oZS-w7zs5arv8XJykJfKdhtiD15o1LR3-5I_1750152904
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qgQIMRyqqt9p

Hi Gustavo,

On 6/16/25 3:18 PM, Gustavo Romero wrote:
> Since v2:
> - Fixed no_tcg_its inverted logic (rth)
>
> Since v3:
> - Fixed remappings in the IORT table when ITS is no present
> - Rebased on master and resoled conflics, like no more "no_its"
>   flag in VirtMachineClass
> - Dropped patch 1/9 because we actually want the instance flags,
>   not only the class flags, and the instance flags are the ones
>   to be used often when deciding about the presence/absence of a
>   machine feature, instead of the negated class flags ("no_*")
> - Adapted the other patches that depended on 1/9
> - Dropped patch 4/9 in favor of using the instance flag for
>   checking if ITS is on or off
> - Simplified VM options for the new "its=off" test
>
> v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
> v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
> v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
>
> Fix ACPI tables for '-M its=off' CLI option and resolve the issue:
>
> https://gitlab.com/qemu-project/qemu/-/issues/2886

One first comment is that this series will collide with Shameer's SMMU
multi instance series which has been lunder review for quite some time
(adding him in TO):

I think it may be more future proof if you could rebase on it - I know
it is a pain ;-( -. Or if sbdy objects for Shameer's series please raise
your voice now.

[PATCH v4 0/7] hw/arm/virt: Add support for user creatable SMMUv3 device <https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/#r>

https://lore.kernel.org/all/20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com/

Also I understood Shameer intended to write some new bios-tables-test.

Thanks

Eric

>
> Cheers,
> Gustavo
>
> Gustavo Romero (7):
>   hw/intc/gicv3_its: Do not check its_class_name()
>   hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
>   hw/arm/virt: Simplify create_its()
>   hw/arm/virt-acpi-build: Fix comment in build_iort
>   qtest/bios-tables-test: Add blobs for its=off test on aarch64
>   hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
>   qtest/bios-tables-test: Update blobs for its=off test on aarch64
>
> Philippe Mathieu-Daudé (1):
>   qtest/bios-tables-test: Add test for when ITS is off on aarch64
>
>  hw/arm/virt-acpi-build.c                  | 134 +++++++++++++---------
>  hw/arm/virt.c                             |  25 ++--
>  include/hw/intc/arm_gicv3_its_common.h    |   2 +-
>  tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 172 bytes
>  tests/qtest/bios-tables-test.c            |  21 ++++
>  6 files changed, 113 insertions(+), 69 deletions(-)
>  create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
>  create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off
>
