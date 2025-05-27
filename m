Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4851583njc;
        Tue, 27 May 2025 07:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXoJPRH/DbyjNJmt9Owk5iWPAk2XbhhKXxp3qE5DOuOGPIReRA94VOCgEd7a3w3S34vkFhmcYR3PpEhSA==@linaro.org
X-Google-Smtp-Source: AGHT+IE0UMwRqDMtAn43luaG0LYNwPhHFm+Xr6fgbD7LLBClcJ7ZhfUD69qy1CBxz7oHTkNEHa5M
X-Received: by 2002:a05:6102:358c:b0:4c1:85d9:5641 with SMTP id ada2fe7eead31-4e4240d9a46mr9883168137.11.1748355695146;
        Tue, 27 May 2025 07:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748355695; cv=none;
        d=google.com; s=arc-20240605;
        b=HjoCPz6sNWwJ87aZattXLD34si2ZUTmJsra8Nz1YNVsxDgDr1XZP6JnVaW7RuOTjht
         gzcTX8aOSnjKCcOoMDb5J8VBEwJ3FYNLTQO7cymvjCsCaIPH2i2TH0b0o2NLim/Y/Jvy
         59kB4RipLMg5xq7A0WH7gXDTYLOmPax+Y2E/QVHs6H5JYh3AlUyLQxG8Vxy9v4jhvHM0
         20reTKAnu1BvyqaxmJpqw6gF4V1OSzKOSLecmLdjURPJL03uokiLzs9XqHwlDTYokvz8
         leKQNJy13uhaRnt6Ke0PvHsLYoU28YkjfNdMm/BfmLFTPQJOBVUxhAbkg9ee0PuI9gHn
         G/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=hHmlju6tLlaVUgmSPzTxf9ZO3W6KmL5QKzZOE4IKFd4=;
        fh=OB4zNxglhZG70KAgrgJHj4VWECcQV5U7JjhVZK0BT68=;
        b=WlD6iKp6ybduspxkg6f/CZqrwcIhOa/sxIVITSRN2+Pg/7uNf4rWCbahN0ENSCztBx
         YbjPfhkH/0IucUSHCuXZpUmaJFVp14uEuj+0kGNlRZ4HOJMwgkV1n/NElikApRAQJdoy
         ldhJ/TEQrD1WM19c6sfeWEbauEQr8kKM8CNIJvMS8rSmoiIfGFWI0DtSHRtLE978p4e8
         zv88i4egKMJAiekYD7xBCr0NZUNU9p0OE8BIJ0XEd0I2XOU6XculkN5FyOcDSaM2selM
         r9yrrz6Sp72OfSSj82vY726Rz8O2N6ZtyEDNapJDqzdORjotoT0lA3tb8t9zEzhvVlF4
         +rgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WE6KulTe;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e59987504fsi61259137.174.2025.05.27.07.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WE6KulTe;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHmlju6tLlaVUgmSPzTxf9ZO3W6KmL5QKzZOE4IKFd4=;
	b=WE6KulTer3VfXXd0hp538EvKOLqwX7QzA6VYS8wC4d0OLuWGS+3jZJsNjzaKuOIdWLvTal
	JvNi872adfCK3fpImLlu2nvEucFvgmAvpKS2FrW6HzR9wrwk/pas24kZ0oPlyICRar6s0F
	Fkrk9aCVJZrd3fgsrohZjcdgxy6x/ls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-rdM1YF8hPmiakzqZsB2zZQ-1; Tue, 27 May 2025 10:21:29 -0400
X-MC-Unique: rdM1YF8hPmiakzqZsB2zZQ-1
X-Mimecast-MFC-AGG-ID: rdM1YF8hPmiakzqZsB2zZQ_1748355687
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442f90418b0so18103945e9.2
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 07:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355687; x=1748960487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHmlju6tLlaVUgmSPzTxf9ZO3W6KmL5QKzZOE4IKFd4=;
        b=nD8DWIy0/MqMUWMdgwAF8J74U60DBl3idrW2uqM7VpEE1JqcXG5/axgaj6lNSXEFsK
         N3HPiaNdX7DpA/rnNj3R2I1mJLEjAadKg4UbyW6hJOWrW85GEmku9//L5QBcPQVEJ2xk
         3VarY9uUkJUcJ6fHRWxdNk3E0p+r8hHovhyDBZKEKqN3tluCw1XLDOymAK/eQyeJqZoB
         RqCoydb9cHj6vAcxRb6GJruMZwMnf1j6nVUBqJZMEd9uzWIq4rzWEgLa7y8qacuqdUQL
         GQLFS+4khGMSSzh3A8Ikx+NYk/Npo4A4Fueexni02e5zPdZ9LZsINasVfpA4+Gh0QvVC
         jVcA==
X-Forwarded-Encrypted: i=1; AJvYcCXOvoQNGdFpzKhxgKLU9LzyrY3Any+Mu28Nb4vfmhGFgCgacLfhvO2iKrpLF+uMFymasaoL955sLwDntQ==@linaro.org
X-Gm-Message-State: AOJu0Yw5dute7y14W3mAoTXOifY4iabMGn3OrtWzMWeq/PWiRWpS7I9O
	H1eNPcuRCZWEx2+iBXjycS1hV9x1xEICTcBA/v+3u6voQrnqLyguZ7II63T85VHJ/tWFaRor0Jv
	9lCqirBQPXUzvkt7VAZ6SiJEnBXMylSkfJAvfo9bYbPputMUT0QJMTKfkhA==
X-Gm-Gg: ASbGncsZMw5nZgoC0AxKaNLlgOwPrGY+7unRmKCes0u0Xn8UVwTzAW9kf+/Zx5IkmEo
	KjxhQ8CDOuBV6f8QM19C6CuK3UgumF95zCg3jhwX8dLjwdjRc85n0ewqvkt+vmD6EthnuaV5Om3
	1uf8sHh7pHXMsRfsRJ5F0Lmm385y/7EAtwuejRfOTaldETKPKQ7II4IjkJaqIeNydClwqwBbD7Y
	mZqEJgud9KSyHnGSyn5qvKGd4SURa+CrXrVrrOvJPwjufTdfnZyxSy0tc/RR5VrZHpvVCp5iA0Z
	fTbWBJT3ngv7ul+iktG0xrVzWg2sVJN7
X-Received: by 2002:a05:600c:1f91:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-44c93018fbamr125639045e9.31.1748355687448;
        Tue, 27 May 2025 07:21:27 -0700 (PDT)
X-Received: by 2002:a05:600c:1f91:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-44c93018fbamr125638705e9.31.1748355687017;
        Tue, 27 May 2025 07:21:27 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3d6csm278046025e9.19.2025.05.27.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:21:26 -0700 (PDT)
Date: Tue, 27 May 2025 16:21:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 19/25] hw/acpi/ged: Call pcihp plug callbacks in
 hotplug handler implementation
Message-ID: <20250527162125.19bcb7f0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-20-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-20-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: smb829qG7hUx9eelTVxGs40zg9g8oo9H05m-vcPiVpY_1748355687
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: N6/7cjPQSKMw

On Tue, 27 May 2025 09:40:21 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add PCI device related code in the TYPE_HOTPLUG_HANDLER
> implementation.
> 
> For a PCI device hotplug/hotunplug event, the code routes to
> acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
> unplug_cb).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index f84216a85f..c0dbf9b358 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -17,6 +17,7 @@
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> +#include "hw/pci/pci_device.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
> @@ -235,6 +236,17 @@ static const MemoryRegionOps ged_regs_ops = {
>      },
>  };
>  
> +static void acpi_ged_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                        DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "virt: device pre plug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));

does memory hotplug still work after that?
why?

> +    }
> +}
> +
>  static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>                                      DeviceState *dev, Error **errp)
>  {
> @@ -248,6 +260,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>          }
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -264,6 +278,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
>          acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
> +                                            dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -279,6 +296,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
>          acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
>      } else {
>          error_setg(errp, "acpi: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -494,6 +513,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
>      dc->vmsd = &vmstate_acpi_ged;
>      dc->realize = acpi_ged_realize;
>  
> +    hc->pre_plug = acpi_ged_device_pre_plug_cb;
>      hc->plug = acpi_ged_device_plug_cb;
>      hc->unplug_request = acpi_ged_unplug_request_cb;
>      hc->unplug = acpi_ged_unplug_cb;
