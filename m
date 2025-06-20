Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp879826njc;
        Fri, 20 Jun 2025 06:10:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXv+edpekZW1MbR6+BzNC9tRyvBpPT82tXENp3gCCLaIM/xj7XO4bw/K9Tz0qy2QEcbDCicl7mxnnNXlw==@linaro.org
X-Google-Smtp-Source: AGHT+IEXtTIdoGERA2HtxgMR0RIagfCq6tUS8trW9kFmVTxc0nPLmPtpLSuTffFAG+1zAhp8uK07
X-Received: by 2002:a05:6214:2e84:b0:6fd:1687:2e1b with SMTP id 6a1803df08f44-6fd168735eamr1589726d6.27.1750425040636;
        Fri, 20 Jun 2025 06:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750425040; cv=none;
        d=google.com; s=arc-20240605;
        b=O0IwteyhAPkPPZ3XgC2KAG5MJeOjYdIidiPUX4DPJjCnf0kWRsRKdYKjqgr+mlVOva
         StZRhKCPnqlGE7USsltnQFmfNlGUi5t28aN7nZ3981TnrHiUkip+XSxc10jfvySVw878
         YOtvpyh5+BkYs3oCukjb8W2MWSb0b4URaI4kl29oG/AXU0uAbYqSNLJzswjaI335+rd9
         I7gyz/vjTw4JP3tNgkLWx8PZb16/NRQwMVLMKDYX5ibXrTXJMKos8UOFHCbIWBMyOYGZ
         4YJXtvEj8NUenxPwhEhIfoSRtbGXVaN1WnuEN9Gt4mwXHntjovNl/Vn2W6bzbYTN/NB0
         g9Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=b6E3ldKAHT76gzfPbKZDc3nqLlogjlvLORH7eAQ0qwM=;
        fh=XIUI+NprgjfoEbxxxzOUAjmkydbi1X3iCXUWGBshUUk=;
        b=VY64ngrvs/OTj6UbdIOWmHachkzrKhjNElaR/Zg2QTEGla9zLw+Ef1MMf49eUUujLh
         asdVcqz4XWHnqW2TG5IxQjRXVTA9njc7jnPdVZJWCAwP9jY/Ds7g9k0t6YRHENvAqllY
         HSXvbs+ZrnjwQalTP+rwnwTBOwikxh8yECjaLvIKpV9MZYPm5WRamtn7qxTgcObY2EXk
         sRpfZxm77LphShLLQl5CTpRLdigmSF3poHiRd71vl7XBQeTE+BSWtJduaz4j7r06/sL3
         j3Qg14UWbZNxGHaofC3g/HpLb71XyPrtFhpjJHl0XD9Hxou4AMQZXXvhH8dD81sgfurD
         nluQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I+Hy79Kg;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09444cebsi19264586d6.137.2025.06.20.06.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I+Hy79Kg;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750425040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6E3ldKAHT76gzfPbKZDc3nqLlogjlvLORH7eAQ0qwM=;
	b=I+Hy79KgcMPUegGucOCfgFhfBhwNrvYcV+TjUnRqVnCXt6yS5OLlwX6piqFdtbfn1Clv/C
	Rk+5vMB9CHAZEJmRjej0Q2Ba5mxRF3MObVji9yyP8zR9pwAcY1i4t0T7LLl8Tdcos7Iw+n
	EqN2fI4xMUm5su//z4bIjVeTw4JdK6U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-UryngdCRPxmsDiq2RqYNyg-1; Fri, 20 Jun 2025 09:10:37 -0400
X-MC-Unique: UryngdCRPxmsDiq2RqYNyg-1
X-Mimecast-MFC-AGG-ID: UryngdCRPxmsDiq2RqYNyg_1750425037
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso12821005e9.2
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 06:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425036; x=1751029836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6E3ldKAHT76gzfPbKZDc3nqLlogjlvLORH7eAQ0qwM=;
        b=UrZKvzYrWi55a1bHfVzNI9T2Z6gCqCH6jZhaArybXe76T6QRPYau2UO43hAu75/J/h
         ChYrmDn9Grm3WEl5RO+vOGt6+m52hpSFKRYHVBSkO/k/NvDsgclZOtCCurAicXXB3LEz
         FfD8BzTUuPWupZJD4nfv7hL7P6FN2c2SgpTqgcZ65isq12jZASY8k8fCdfVc8tF/Vple
         FX3/AvIQn09jdH+9Ay2jcrVo8yXfzKffPbonhEVmaX9ulYkx/DqiYNqzCS9ZilI62sgF
         2MmNxAwNhC6b/lx/giYJeqyTWjibmMqtyh4A66mNVvd3PHPmKmSOBQ7oaap3jcQmT/hk
         gxWg==
X-Forwarded-Encrypted: i=1; AJvYcCWD5Aoh31N1lihipcmOXMYV6kwSLUq1UGebPmqDzJDg/oTiAUp9Gbp3Pyg516aJTY2Ar9CLf1W6UU1+nw==@linaro.org
X-Gm-Message-State: AOJu0YzAdC8m5wWE+B8bI8cBoF/OOTjutX+QXoQb+hhxOE7HYWu7o5f4
	0VkcJjplxQc5pod20B6m2mU6v+hYTD1mzXdUYFfBov8Qy/rlPDIwb1fppZ6RiVr01m5F+gAnQOw
	+En5nU5Q1v/PkYWZxM6JrTAbUPF7BM2ta3SJIPa3qsH2S9MQvYXl8OHbRKg==
X-Gm-Gg: ASbGncscHwsn4sZy3JcCiPK7y35l+eqyQRnSsk/dskjjIebVk/vtMZy8CZu2+dPBXxJ
	MTKQwWp6ClhVYp8REamJ7wuktTmVC73jPkhG8e7lTQs9NNYIpV9K5w4Isj/otZgkpdfBABtnQ0d
	70lQHLGCrSTbnw09qNnR0TdXrpqqTQx6vzHmJI4wu0R2Ai/j38RDAIlWCvBnay5UaoZVNYk7NG6
	kLnGQiqteou5IsbLPP+syrJ+TGVTINee8S/2DaxwmVQ3/qlBz4jehMA9G1yUZrMEnZsYB3wz1DX
	aec6Pgye8R2K
X-Received: by 2002:a5d:5c04:0:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a6d12e5d82mr1959455f8f.50.1750425036493;
        Fri, 20 Jun 2025 06:10:36 -0700 (PDT)
X-Received: by 2002:a5d:5c04:0:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a6d12e5d82mr1959414f8f.50.1750425036060;
        Fri, 20 Jun 2025 06:10:36 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from fedora ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c6b2sm2041443f8f.46.2025.06.20.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:10:35 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:10:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 26/29] hw/arm/virt: Plug pcihp hotplug/hotunplug
 callbacks
Message-ID: <20250620151033.7fedf673@fedora>
In-Reply-To: <20250616094903.885753-27-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-27-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p8pZXQE4oo-GU8Z19Y9GcERent5odh547OU2TJDXbuk_1750425037
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: olstRUZbbdwZ

On Mon, 16 Jun 2025 11:46:55 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Signed-off-by: Eric Auger <eric.auger@redhat.com>

why do we still need this?

pcihp code should override native pcie bus handlers, and then
when device_add calls bus hotplug handlers it will be pcihp ones.

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
> +}
> +
>  static
>  void virt_machine_done(Notifier *notifier, void *data)
>  {
> @@ -2907,6 +2923,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>  {
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>  
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
> @@ -3045,11 +3108,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>                                                          DeviceState *dev)
>  {
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    VirtMachineState *vms = VIRT_MACHINE(machine);
>  
>      if (device_is_dynamic_sysbus(mc, dev) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
> +        (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE) &&
> +                             get_acpi_pcihp_state(vms))) {
>          return HOTPLUG_HANDLER(machine);
>      }
>      return NULL;
