Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp750844njc;
        Fri, 20 Jun 2025 02:05:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZb8u75NSLHmcS48sVuE3ooxNoQikvNn1SUqsN5RveyoSWhM7f6DHohWGok5N+0LmzRHYhM+15Rdj7hg==@linaro.org
X-Google-Smtp-Source: AGHT+IGlqI8JMqIEYTvXc190yLKW52y3lEGcZ+oBo9RJzT71pJctWehVzXe/YS/jtVGTi9QVGj8Y
X-Received: by 2002:a17:902:c405:b0:234:ba37:87ae with SMTP id d9443c01a7336-237d97c89dbmr38535505ad.4.1750410328267;
        Fri, 20 Jun 2025 02:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750410328; cv=none;
        d=google.com; s=arc-20240605;
        b=O+mAGG61EFus58flF8THBN2YjamWXtvTW5K69fcuDyI2B25sQWOj3OI8y5VfVEd6Yb
         ZpTPp31meo2U5xmmntOlnEZAyh9c/Zq+8hQ3jhy09VCapNV2IcsWz056E7KP0ssBtlam
         fwe24Sx5RtvBOsYnQZX3WeR8Hy5Y64Xj/uIBuRaQozdpucXVIfWCLrRAWSrALEvbykwU
         Y9fr7ggyTXAEMpSNlEJ0RNSezdy4+jsH11F0sXus/oGMClTImXxrULUhUvOIDl+dhgvG
         VMfk6q94tPPLwYXSb7wEAt2UL5NNyYKj86FsxOapIu7aPwrKBnxy+f6Ws2xAMpWbUoU7
         TSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=xT4D2w+180KFVrAO8ct8ETPbBYgxFecYvx0UqtrGMH0=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=N/y+w7xBS8+x5/A91cRRefDFF4DtnKDavKVyMAQgpyjFxcljIdK2kHmKdak3JaOKXR
         LXEbyCsctTsd6yQ7yS7PZC2BCCzHkhIbkt6dwjfQuhcZCohW2rg6gZHNk+MDoSbwuQLZ
         4qia4gsjE6WZpRUcKXFK3X3CdGM9A28xKZfA74ejOYKBPbYzxMVXm1jW2I/SiCR8fpTY
         vTdJ6mMAb0bW4oAkwZ3YPK10OfTgAkBxhh3N9gPDf0JCJ6ULbNfaQuY1LuzUDrdapuzD
         av81sRmqVZyNuiOsbtishoqeA2RRP8oKSf9WwBZMRGlqNqbkJW3aS3Be6riTNlwqG0xZ
         tviw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-237d839300asi20166695ad.111.2025.06.20.02.05.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNs2J4pG7z6L59y;
	Fri, 20 Jun 2025 17:03:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BD3DA1402FE;
	Fri, 20 Jun 2025 17:05:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:05:22 +0200
Date: Fri, 20 Jun 2025 10:05:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 15/29] hw/i386/acpi-build: Use AcpiPciHpState::root
 in acpi_set_pci_info
Message-ID: <20250620100520.00006e4b@huawei.com>
In-Reply-To: <20250616094903.885753-16-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-16-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: /mYhUrr43f8N

On Mon, 16 Jun 2025 11:46:44 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> pcihp acpi_set_pci_info() generic code currently uses
> acpi_get_i386_pci_host() to retrieve the pci host bridge.
> 
> To make it work also on ARM we get rid of that call and
> directly use AcpiPciHpState::root.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
Nice

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> ---
> 
> v2 -> v3:
> - Use AcpiPciHpState::root
> 
> v1 -> v2
> - described the fact we changed the implementation of
>   acpi_get_pci_host() in the commit msg.
> ---
>  hw/acpi/pcihp.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 236e175b69..e79a24b821 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -99,10 +99,10 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>      return info;
>  }
>  
> -static void acpi_set_pci_info(bool has_bridge_hotplug)
> +static void acpi_set_pci_info(AcpiPciHpState *s)
>  {
>      static bool bsel_is_set;
> -    Object *host = acpi_get_i386_pci_host();
> +    bool has_bridge_hotplug = s->use_acpi_hotplug_bridge;
>      PCIBus *bus;
>      BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
>                        .has_bridge_hotplug = has_bridge_hotplug };
> @@ -112,11 +112,8 @@ static void acpi_set_pci_info(bool has_bridge_hotplug)
>      }
>      bsel_is_set = true;
>  
> -    if (!host) {
> -        return;
> -    }
>  
> -    bus = PCI_HOST_BRIDGE(host)->bus;
> +    bus = s->root;
>      if (bus) {
>          /* Scan all PCI buses. Set property to enable acpi based hotplug. */
>          pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &info);
> @@ -266,7 +263,7 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
>  
>  void acpi_pcihp_reset(AcpiPciHpState *s)
>  {
> -    acpi_set_pci_info(s->use_acpi_hotplug_bridge);
> +    acpi_set_pci_info(s);
>      acpi_pcihp_update(s);
>  }
>  
