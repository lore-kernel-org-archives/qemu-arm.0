Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp788376njc;
        Fri, 20 Jun 2025 03:28:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9H3bxAltDnCETMqClirvMN5I2qk55Y0SAiMvYmxzfREE4iRmd3BGHESQ127s5aeLnYJiQkbjKChIscA==@linaro.org
X-Google-Smtp-Source: AGHT+IGmd0iLBaJVx1QnTj22dlwyrht3uQjZnrf7fYyZUGi3YNW9L0/fMYzRy+DhsB2idx5fwzgf
X-Received: by 2002:a05:6000:4b0b:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a6d12dbda2mr1849722f8f.16.1750415324673;
        Fri, 20 Jun 2025 03:28:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750415324; cv=none;
        d=google.com; s=arc-20240605;
        b=LI2ky1Hm+h85aILj5Ezj9cxoaPwKnrhlMHPgDzbhpSb+mP+Q92TkywaHjLAmx6qtU/
         68MOtvyhaKyYFoNlp0hRoW4JrpCf/qTSG8OvhBpMOGJtVgogu6yNAldL5HjgL/T7kBGC
         ON9DmQHTAC1ITcRrhuy4stkbr4cyjVK8RB+ZKdRWuvoZbuexudsfersUHOylUGl3qePg
         IjeTkOddQLjY0GM1PscOVlQxCJy6qqDSAw9uyE0I9cWwCmkRpySJsVIQvTjElXv3hvxX
         KGVzUuBq94Lu1RJokOnh5LjP42vKJaz/hSDGoZsMleWVdRxRnciEa0J/MNeHNrTP4UWX
         kHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=USAZHHd8DDsge6+8gHfLDA5RJZE86E26/0JMPpuXnF0=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=huQqe5powK6cammc3/gIzFL1k+XLiU/r1pvkyegtEaQLkTig125AQWqpKV91MWK9gc
         DPwwG1STqKo/OqZDoqy3pgAgXys8iVgwZhppwxHYNkYgALKZZYt9iCUp6mhD2hisuJfZ
         a/Z9z+EA4yaYMgImPcHywIN+mVx/CuWS8WC923IXGrV13JRjM12bz9j/egydWc4R7dUz
         /hyMoiWlp91h/ZxZ+Uneu2/kXq5XFuShHZgfkvr2LHXiFRphZ2eVag0BNwBE29XQx61X
         TVz6QqlGk4ojMk1eWFsBC8iX5Zi0dlWeJUkNrKk7ZvJ5i/+oG/tJF1+owkalcZ1sz1rm
         v3Hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d117e617si1047475f8f.342.2025.06.20.03.28.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:28:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtqd4nm1z6L565;
	Fri, 20 Jun 2025 18:23:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D098514027A;
	Fri, 20 Jun 2025 18:28:43 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:28:42 +0200
Date: Fri, 20 Jun 2025 11:28:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 26/29] hw/arm/virt: Plug pcihp hotplug/hotunplug
 callbacks
Message-ID: <20250620112841.00007cb2@huawei.com>
In-Reply-To: <20250616094903.885753-27-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-27-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: HoTEdSnvRAvb

On Mon, 16 Jun 2025 11:46:55 +0200
Eric Auger <eric.auger@redhat.com> wrote:

Maybe needs a little bit of description.

> Signed-off-by: Eric Auger <eric.auger@redhat.com>

A few trivial things inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> ---
> v2 -> v3:
> - fix cohabitation with virtio-mem-pci device and tested
>   hotplug/unplug of this latter (Igor)
> ---
>  hw/arm/virt.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8c882e0794..06b87e1050 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1747,6 +1747,22 @@ static void virt_build_smbios(VirtMachineState *vms)
>      }
>  }
>  
> +static AcpiPciHpState *get_acpi_pcihp_state(VirtMachineState *vms)
> +{
> +    AcpiGedState *acpi_ged_state;
> +    AcpiPciHpState *pcihp_state;
> +
> +    if (!vms->acpi_dev) {
> +        return NULL;
> +    }
> +    acpi_ged_state = ACPI_GED(vms->acpi_dev);
> +    pcihp_state = &acpi_ged_state->pcihp_state;
> +    if (pcihp_state->use_acpi_hotplug_bridge) {
> +        return pcihp_state;
> +    }
> +    return NULL;

Really trivial but if this isn't going to gain extra stuff I'd consider
the NULL return the 'error' path and prefer that out of line for consistency.
That is.

    if(!pcihp_state->use_acpi_hotplug_bridge) {
        return NULL;
    }

    return pcihp_state;


That just ends up a tiny bit more consistent with the !vms->acpi_dev test
earlier in the function.

> +}
> +
>  static
>  void virt_machine_done(Notifier *notifier, void *data)
>  {
> @@ -2907,6 +2923,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>  {
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>  

Maybe add a comment on why this is not in the if/else stack.  I assume
because a few of those are also TYPE_PCI_DEVICE.
Something in the patch description would also work for me.

> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        if (get_acpi_pcihp_state(vms)) {
> +            acpi_pcihp_device_pre_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
> +                                          dev, errp);
> +        }
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_pre_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> @@ -2961,6 +2984,15 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>          }
>      }
>  
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
> +
> +        if (pcihp_state) {
> +            acpi_pcihp_device_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
> +                                      pcihp_state, dev, errp);
> +        }
> +    }
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_plug(hotplug_dev, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
> @@ -3017,12 +3049,27 @@ out:
>  static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> +    bool supported = false;
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_dimm_unplug_request(hotplug_dev, dev, errp);
> +        supported = true;
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>          virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>                                       errp);
> -    } else {
> +        supported = true;
> +    }
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
> +
> +        if (pcihp_state) {
> +            acpi_pcihp_device_unplug_request_cb(HOTPLUG_HANDLER(vms->acpi_dev),
> +                                                pcihp_state, dev, errp);
> +            supported = true;
> +        }
> +    }
> +    if (!supported) {
>          error_setg(errp, "device unplug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
>      }
> @@ -3031,11 +3078,27 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>  static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> +    bool supported = false;
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_dimm_unplug(hotplug_dev, dev, errp);
> +        supported = true;
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>          virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
> -    } else {
> +        supported = true;
> +    }
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
> +
> +        if (pcihp_state) {
> +            acpi_pcihp_device_unplug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
> +                                        pcihp_state, dev, errp);
> +            supported = true;
> +        }
> +    }
> +    if (!supported) {
>          error_setg(errp, "virt: device unplug for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
>      }

