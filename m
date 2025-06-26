Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp92006dye;
        Thu, 26 Jun 2025 01:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS6Mi5AkOm4lAf+hEPIiU7JzRd0pR3P04Gkoij7eTCgTGQXizRTYkGVFbEDalbBkdkb2dXtjm8Aovx+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGdCwrWLee+NLuC7FwUs96tN7hZS9UFrMc8HEYdRpAbqM4cniNgVUpltSZ45fdzjiNAWskb
X-Received: by 2002:a05:620a:8a07:b0:7d4:3e19:55e with SMTP id af79cd13be357-7d43e190590mr105741585a.10.1750925810941;
        Thu, 26 Jun 2025 01:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750925810; cv=none;
        d=google.com; s=arc-20240605;
        b=IcJph/mnmK14DPDSH2q8D9wz3CJBmJLaDY5h/cEFN3Z2SOClluNyXc9x/FzJPz/XJ+
         +9FcjKAY84t+2ssDpT9GoNPGdUxu2D7rjH236j0pRpmHpmuAwLwHxGQVnennjaNB8wQD
         6HN4iVXP12SbebU3Tk6BcVIf2BcPgttDJbQP0pbHXXvLOxUFJCrjXKHPO/nLIj6azj88
         pnsBWeNVHH1UWBzX9U3chYMmv8p/dZYMK7a+Iwmsz+ZJMRdRbyTsCsI17zYKqv9q5nAb
         iAgyENtrHCoXiS61X9oOb/AngDcM3MmQO/aMzcHkovIyhdMnqJiT00VMboIYn1Wzn42S
         3T5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=kLaCiP+fRMAVbTwIzpfwb5TGbUB5bgOHC/V9Yd1Bbls=;
        fh=f8EiNX0dhoSu9w6inbFzzFKtb03mR0QPn9LNvlAN83Q=;
        b=Cl6ln1iahSkwqu2/j+OxuXTyFeDBfQDiV1wkCVbO81POCYdLwy8OmzPvKuSE7sCsdu
         pE4e8VmgSPzu57JYO+oe+bU9acOZFJvOQsZic2QzcypKpN+73sqaIUDhFzGn02Zjyl6B
         srX7ZWHHsRjrDbeaIvvv02OddltBwh7zQ4muA89SpSSehHhllxH9txqIfd0zGh7awkkR
         E4Pz20AXIj7f54Jdl0lV3rUyDPtFmkNWGHPZMI2mTGMWIc9NmE2gNKuA2Z9BJleHxEqW
         +aar5fzLqsrh1ZIAo9v2Hmdu2VCUd+KfuefDe5MTBxR6LoQoA7V6qkAh3A+6FatvhsFw
         BK4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NvtMiDmA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f999f4a7si1410563685a.130.2025.06.26.01.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NvtMiDmA;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750925810;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLaCiP+fRMAVbTwIzpfwb5TGbUB5bgOHC/V9Yd1Bbls=;
	b=NvtMiDmAf36asbZ+9BcAQ5QxSZCRDDbLHPcokF4uJNTRdUonyTCpe10rmaoi8ecb167N0c
	c8gZGPyCYtG79CrInOHkMspefXSqnnRWAq34L0/DSf39Fn0JCzuAhxwihPB4mOXl/R08Pd
	doEm55NPAqi9+PFLKu3u8qJoaaDwpB0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-6_FPg2U9OqK7D6jZ1xdeGw-1; Thu, 26 Jun 2025 04:16:46 -0400
X-MC-Unique: 6_FPg2U9OqK7D6jZ1xdeGw-1
X-Mimecast-MFC-AGG-ID: 6_FPg2U9OqK7D6jZ1xdeGw_1750925805
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so4190515e9.3
        for <alex.bennee@linaro.org>; Thu, 26 Jun 2025 01:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750925805; x=1751530605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLaCiP+fRMAVbTwIzpfwb5TGbUB5bgOHC/V9Yd1Bbls=;
        b=ZaaMXBqZj3tUsWOIFC71ckhVe+jNN7fTmdS565oeAfgx9pY6EYyBJ6BvmRUhJ5J4GM
         IufmnH5i+KuIbp7D62dpDazS1ALXuscqM2aRTJCl6x5hNAp2RnUzyyIj1how99k5NqLs
         TLinoAOs2UUS175eY0XTKOjo7+ehuql4rRk38X3cLpWNA+y+vTQAOSuliohNRlKFhDPo
         VMAU1W1FCm43iRABklbYC9VIjgIpcWGUufjrAx7XZgrbMeanuS8K5JVWubdfdSvboriZ
         z05KwvEeIHKBb0k74Y9/L3wnNAmeZW44edBwGjgnetXuXKZOsz9/cP2Bv2szI/+57kE+
         NVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw3M6N9FduIcN9QjJG0zFlOpjtCLrxEszWxS8UP8Hrb6yOZJ7CaKe89sMOT8aHmQCjyBOC9rbzcccevQ==@linaro.org
X-Gm-Message-State: AOJu0Yx4GKB4N4+F2YqgJRICIB2BTUHauP9JWJAln9IrA72ddocl+1y9
	BD3X6dwj3VzybpmpgrQeeCyPFIEV4wokQChEUGCQw8eH/3LRfs8Kro9Zs0rEx7mPJ+Lw9OVDylg
	of4CFnPudUESY1sqZsLXlckyfB/CYflPMGaFpqOuP5sh3I8IdG5bfpiSM9A==
X-Gm-Gg: ASbGncs4rwBWCSQGmVK49wRTm99TdW7o32yS7MoDbTIkwp6ExkJFXTk1UVb/z/NATEJ
	Z01ZQUWISYlsBhnQFWofK2/3Q5qY//UYBP78ht3FgU9wgd9Pi4XN5YwjLXDyZA+nBPpcpLQ0Iin
	NkOsk47FQrWwQW0WpfdcWiI2Xm/3SEE4TZNy9xjV5n2XJSVS30tgqFqZUVk/jljdBSJEQOWRcgU
	Ie+zXSnE5zCv9rKFaKd/eixpfeUqov8VpFiSQ7xSeCQFG3FAanGab9Wu+sZmsiAqzKVAsQAQZU/
	uU+BsAPiF/heH9jW99Fh35yfLaxtnm9QcrdOBrWSopi0NwQ0ICrmMVRpx2zfwUJ8PTWJIw==
X-Received: by 2002:a05:600c:3496:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-45381ae9033mr59825365e9.18.1750925804761;
        Thu, 26 Jun 2025 01:16:44 -0700 (PDT)
X-Received: by 2002:a05:600c:3496:b0:450:d012:df85 with SMTP id 5b1f17b1804b1-45381ae9033mr59825045e9.18.1750925804326;
        Thu, 26 Jun 2025 01:16:44 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm6545380f8f.42.2025.06.26.01.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 01:16:43 -0700 (PDT)
Message-ID: <e6dde520-e889-4102-aac9-9a5df3b57f5e@redhat.com>
Date: Thu, 26 Jun 2025 10:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 26/29] hw/arm/virt: Plug pcihp hotplug/hotunplug
 callbacks
To: Igor Mammedov <imammedo@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-27-eric.auger@redhat.com>
 <20250620151033.7fedf673@fedora>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620151033.7fedf673@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MVSmNL9dFKvIE6QoxCf6wuhch0-jFS5n168NzAdwLF4_1750925805
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: oly2ylDnogNj

Hi Igor,

On 6/20/25 3:10 PM, Igor Mammedov wrote:
> On Mon, 16 Jun 2025 11:46:55 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> why do we still need this?
>
> pcihp code should override native pcie bus handlers, and then
> when device_add calls bus hotplug handlers it will be pcihp ones.
It was needed because I did not call qbus_set_hotplug_handler() as done in
ich9.c. So I think I should be able to get rid of this patch

Thanks

Eric
>
>> ---
>> v2 -> v3:
>> - fix cohabitation with virtio-mem-pci device and tested
>>   hotplug/unplug of this latter (Igor)
>> ---
>>  hw/arm/virt.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 69 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 8c882e0794..06b87e1050 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1747,6 +1747,22 @@ static void virt_build_smbios(VirtMachineState *vms)
>>      }
>>  }
>>  
>> +static AcpiPciHpState *get_acpi_pcihp_state(VirtMachineState *vms)
>> +{
>> +    AcpiGedState *acpi_ged_state;
>> +    AcpiPciHpState *pcihp_state;
>> +
>> +    if (!vms->acpi_dev) {
>> +        return NULL;
>> +    }
>> +    acpi_ged_state = ACPI_GED(vms->acpi_dev);
>> +    pcihp_state = &acpi_ged_state->pcihp_state;
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>> +        return pcihp_state;
>> +    }
>> +    return NULL;
>> +}
>> +
>>  static
>>  void virt_machine_done(Notifier *notifier, void *data)
>>  {
>> @@ -2907,6 +2923,13 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>>  
>> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        if (get_acpi_pcihp_state(vms)) {
>> +            acpi_pcihp_device_pre_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
>> +                                          dev, errp);
>> +        }
>> +    }
>> +
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_memory_pre_plug(hotplug_dev, dev, errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>> @@ -2961,6 +2984,15 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>>          }
>>      }
>>  
>> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
>> +
>> +        if (pcihp_state) {
>> +            acpi_pcihp_device_plug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
>> +                                      pcihp_state, dev, errp);
>> +        }
>> +    }
>> +
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_memory_plug(hotplug_dev, dev, errp);
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>> @@ -3017,12 +3049,27 @@ out:
>>  static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>                                            DeviceState *dev, Error **errp)
>>  {
>> +    bool supported = false;
>> +
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_dimm_unplug_request(hotplug_dev, dev, errp);
>> +        supported = true;
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>          virtio_md_pci_unplug_request(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev),
>>                                       errp);
>> -    } else {
>> +        supported = true;
>> +    }
>> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
>> +
>> +        if (pcihp_state) {
>> +            acpi_pcihp_device_unplug_request_cb(HOTPLUG_HANDLER(vms->acpi_dev),
>> +                                                pcihp_state, dev, errp);
>> +            supported = true;
>> +        }
>> +    }
>> +    if (!supported) {
>>          error_setg(errp, "device unplug request for unsupported device"
>>                     " type: %s", object_get_typename(OBJECT(dev)));
>>      }
>> @@ -3031,11 +3078,27 @@ static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>>  static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
>>                                            DeviceState *dev, Error **errp)
>>  {
>> +    bool supported = false;
>> +
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_dimm_unplug(hotplug_dev, dev, errp);
>> +        supported = true;
>>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI)) {
>>          virtio_md_pci_unplug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
>> -    } else {
>> +        supported = true;
>> +    }
>> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +
>> +        AcpiPciHpState *pcihp_state = get_acpi_pcihp_state(vms);
>> +
>> +        if (pcihp_state) {
>> +            acpi_pcihp_device_unplug_cb(HOTPLUG_HANDLER(vms->acpi_dev),
>> +                                        pcihp_state, dev, errp);
>> +            supported = true;
>> +        }
>> +    }
>> +    if (!supported) {
>>          error_setg(errp, "virt: device unplug for unsupported device"
>>                     " type: %s", object_get_typename(OBJECT(dev)));
>>      }
>> @@ -3045,11 +3108,14 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>                                                          DeviceState *dev)
>>  {
>>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>> +    VirtMachineState *vms = VIRT_MACHINE(machine);
>>  
>>      if (device_is_dynamic_sysbus(mc, dev) ||
>>          object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
>>          object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MD_PCI) ||
>> -        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI) ||
>> +        (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE) &&
>> +                             get_acpi_pcihp_state(vms))) {
>>          return HOTPLUG_HANDLER(machine);
>>      }
>>      return NULL;
