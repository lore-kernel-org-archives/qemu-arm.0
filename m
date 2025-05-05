Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2287236njj;
        Mon, 5 May 2025 01:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr04wmFV7UxD9mjnh20nNkmRHEHbAZ88MMkPVfkQKq5oT8peC2yOz9zTA1wiCCDiIYE3jZzxd9PCJLow==@linaro.org
X-Google-Smtp-Source: AGHT+IF0DWCtJzfI7FwPBo6NY0akDltY7uvL8ocKT/II4ckuyEpXh8yldh7xaBQw5VPQ9dOvODbE
X-Received: by 2002:a05:620a:170a:b0:7c5:4d2e:4d2d with SMTP id af79cd13be357-7cae3b0ca45mr894708385a.50.1746433155296;
        Mon, 05 May 2025 01:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746433155; cv=none;
        d=google.com; s=arc-20240605;
        b=UMJc5FpBHry1vhTZ8ji9uysHh4AHfJhrOMQWNuWisfKrpyOq/ilm68/ACSI1XGiSM7
         ylI3RBT55bPZsAogzX50O6pf5PhMyG/p4VSH2fyK0g0cDkiVfyzlL86gGmuOqAquauN9
         LyabrNcyGARt37YqQAUGEkU6oUmLMlEpc4Qd8N3lEAKMUNVfMAeusn/V06j90Qwtyeo8
         pkdcUOLyNahP1IeH2bGO0JRiL+NQBv/PB+7nn86295CnnQGXaTiV0HjZZqn3pKRY7lpM
         2b1x9pSbNuv81Kdyk7l5kmEuMVc6/uaCjlN0JHneCRl1ABcq1cl7TqzfFwkSFcQvUXQ+
         +82Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ZiiD4ub45n6wjGHUVcmoDtrZrSOwJUWD5UkM8L/cXm8=;
        fh=fa9alKsURA/QmA3Et5IqbCWb2Ccj9qXwAApSZSc2yyo=;
        b=HxGIeq5M9PmWLdxEE2NFiwHvC+7EcmHKcGrVStHHm0pqm0PblFLE02REPHsvZs+7IB
         7ArwB3SnpAshvAKWq8rXcB7Sw4CdBnE0RKX8Mp3WmFcWuDCQVgh52QDerBfqrOZKYPP0
         I+GH49Q7bYkpyLr/un6oBTWnfwVCP1FqWOXgc1LAbT6nRlNC3WhloDQY58235Ogk4m4n
         KIImSLm8MwLKMoe6cg+2ELHSRKjANV2mpraVrob4u9w8+esmTIeENpzXPyGYob3NIDQT
         /65OJvNEvWnUHHBIJUX1GZLb4D6P6Gz3Q6TlHaGmvSTLOe8ZAobsrUdpbBVsEAeAjsHo
         DGkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="InrQmx/8";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cad2432664si830383785a.392.2025.05.05.01.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="InrQmx/8";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746433154;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiiD4ub45n6wjGHUVcmoDtrZrSOwJUWD5UkM8L/cXm8=;
	b=InrQmx/8gUZ5oVGOm3nMi7Q3STm17598WmcZUMm1xTHMdw9sUd/IytL408u8l9kDENqM1K
	wgoRjg3l5MTwZOKvkgWPJPvQCfVEBMTymSb3QEgAYI+OmKq3eftW55TjUxUEXocz894ycd
	gTvmMcSx15Z3Cyyz/3M5E64EnY3Nbko=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-Utz6SeqeMDajqCSbBDgidw-1; Mon, 05 May 2025 04:19:12 -0400
X-MC-Unique: Utz6SeqeMDajqCSbBDgidw-1
X-Mimecast-MFC-AGG-ID: Utz6SeqeMDajqCSbBDgidw_1746433151
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so1259520f8f.3
        for <alex.bennee@linaro.org>; Mon, 05 May 2025 01:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746433151; x=1747037951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiiD4ub45n6wjGHUVcmoDtrZrSOwJUWD5UkM8L/cXm8=;
        b=KefjpBkY31YKXEo0KSpqLEPONto1McGzwSlrGIhbWcfbd5VtlrZvJWgRMsXOUCKS8Z
         ZI2aKcndSRVvWNvdrzU/OyY+txjXP+2W1soVG+Gaw72lPveWR7SGrHlC9FbDtSCC1ckl
         hDNwCBNjt4Uy/+0gkVRqC7nOsyNpvk1rBlXVil5bzHovMIju/DPUtHSgCUY9HWUZlnZS
         bPOBK9K3KxLuhnkA1QpvqAWhxSFogC4P0zcpzDSlWZ3byRUYd+FMBB/KqUyxb8YClH1f
         tGSvj3Zj/tlKkr3U0R+3pZOh0WCxHmT+gCgAMzc/r88ig+c7YcxdZmdDBvhlNB3BHhDt
         223g==
X-Forwarded-Encrypted: i=1; AJvYcCXQdYmsYGwg1odM5ILVFb8egr0iASWt45hWuuZR3Bj8te1YE0/vfcqWw3/nzpEreLNSobV0EmfMrZDxyw==@linaro.org
X-Gm-Message-State: AOJu0YxeC4WNLkzUrSkh8WUZBNcek4IXdDa5PPMgvYFYWsFHe3RzcSpu
	G/9Vi4TB+NRkXW0bMK2MjClRxrg6lAROO94rxP4wcWjgjZ4QtQ4T2upOyg4Ti00WMtB6X3SEt4S
	I48nFBrvhBkK9eETmiQnmflwzFk/IlgItdLxWInW/QeElIHwbtVUgvA==
X-Gm-Gg: ASbGncty17iVwXH3pq6J53/lgElzud7wLR7MPnL6JU+e/EOAy+tPk7EiN0l/SgmK2lM
	Sbzv2lKMyCAHmE0GWR34CrE/C6OYez8NBHBd+jA5YXyAeumCsJHI6/F6XVOMEBkkMDpNS3uIdvg
	jNlcXMb/5pMemncvPkReWAvi1lpKdwqzcZZ4hqzKOudrhADT6yGVc63u2qrzlh5rE19hyZ9iiFv
	q5ql6T4ldN8NOtZDOYSdaZnTP0U+j21wSzWVnjBvQTHTHKAR7UCR9Gurl6sOozoS8GSdJab9yCX
	CB/J48xRDhQillWYkXAaLhYg4m1uopIBoOftCUZovX27DPRylAokvLk4owk=
X-Received: by 2002:a05:6000:2583:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3a09fd7c676mr3826653f8f.29.1746433150700;
        Mon, 05 May 2025 01:19:10 -0700 (PDT)
X-Received: by 2002:a05:6000:2583:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3a09fd7c676mr3826634f8f.29.1746433150199;
        Mon, 05 May 2025 01:19:10 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3d3bsm9765237f8f.33.2025.05.05.01.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 01:19:09 -0700 (PDT)
Message-ID: <fd3219d3-bab3-4991-afbe-fd80549bbca4@redhat.com>
Date: Mon, 5 May 2025 10:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Donald Dutile <ddutile@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: jgg@nvidia.com, nicolinc@nvidia.com, berrange@redhat.com,
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com,
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <03c31d89-ad24-4470-99d0-a77e693e3ba2@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <03c31d89-ad24-4470-99d0-a77e693e3ba2@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zNgAAf2QbseLCBbxxeLD34an-rDTZZZ_Gq4W3lcfNx4_1746433151
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NCdjSq80RGN6

Hi,
On 5/2/25 8:16 PM, Donald Dutile wrote:
>
>
> On 5/2/25 6:27 AM, Shameer Kolothum wrote:
>> Although this change does not affect functionality at present, it lays
>> the groundwork for enabling user-created SMMUv3 devices in
>> future patches
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>   hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
>>   hw/arm/virt.c   |  3 ++-
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index ab67972353..605de9b721 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-core.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bridge.h"
>>   #include "cpu.h"
>>   #include "exec/target_page.h"
>>   #include "trace.h"
>> @@ -1874,6 +1875,25 @@ static void smmu_reset_exit(Object *obj,
>> ResetType type)
>>       smmuv3_init_regs(s);
>>   }
>>   +static int smmuv3_pcie_bus(Object *obj, void *opaque)
>> +{
>> +    DeviceState *d = opaque;
>> +    PCIBus *bus;
>> +
>> +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>> +        return 0;
>> +    }
>> +
>> +    bus = PCI_HOST_BRIDGE(obj)->bus;
>> +    if (d->parent_bus && !strcmp(bus->qbus.name,
>> d->parent_bus->name)) {
>> +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
>> +                                 &error_abort);
>> +        /* Return non-zero as we got the bus and don't need further
>> iteration.*/
>> +        return 1;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static void smmu_realize(DeviceState *d, Error **errp)
>>   {
>>       SMMUState *sys = ARM_SMMU(d);
>> @@ -1882,6 +1902,10 @@ static void smmu_realize(DeviceState *d, Error
>> **errp)
>>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>       Error *local_err = NULL;
>>   +    if (!object_property_get_link(OBJECT(d), "primary-bus",
>> &error_abort)) {
>> +        object_child_foreach_recursive(object_get_root(),
>> smmuv3_pcie_bus, d);
>> +    }
>> +
>>       c->parent_realize(d, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>> @@ -1996,6 +2020,8 @@ static void smmuv3_class_init(ObjectClass
>> *klass, const void *data)
>>       device_class_set_parent_realize(dc, smmu_realize,
>>                                       &c->parent_realize);
>>       device_class_set_props(dc, smmuv3_properties);
>> +    dc->hotpluggable = false;
>> +    dc->bus_type = TYPE_PCIE_BUS;
> Does this force legacy SMMUv3 to be tied to a PCIe bus now?
> if so, will that break some existing legacy smmuv3 configs?, i.e.,
> virtio-scsi attached to a legacy smmuv3.

Previously the SMMU was already always attached to a PCI primary-bus
(vms->bus ie. pci0). virtio-scsi-pci is the device being protected. The
SMMU is not able to protect platforms devices atm.

My only concern is we are highjacking the "bus" prop to record the bus
hierarchy the SMMU is protecting. While the SMMU is a platform device
and does not inherit the PCI device base class its bus type becomes
"TYPE_PCIE_BUS". So in terms of qom hierachy is is seen as a PCI device
now? I don't know if it is a problem. An alternative could be to keep
the bus pointer and type as it was before and introduce a primary-bus
property. Adding Markus, Peter, Daniel and Alex in to.

At some point it was envisionned to support protected platform devices
(I think this was need for CCA). My fear is that if we turn the bus type
to PCIE it may be difficult to extend the support to non PCIe protected
devices. The SMMU shall remain a platform device being able to protect
either PCI devices and, in the future, platform devices.

Thanks

Eric
>
>>   }
>>     static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 177f3dd22c..3bae4e374f 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -56,6 +56,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/module.h"
>> +#include "hw/pci/pci_bus.h"
>>   #include "hw/pci-host/gpex.h"
>>   #include "hw/virtio/virtio-pci.h"
>>   #include "hw/core/sysbus-fdt.h"
>> @@ -1442,7 +1443,7 @@ static void create_smmu(const VirtMachineState
>> *vms,
>>       }
>>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>                                &error_abort);
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
>>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>       for (i = 0; i < NUM_SMMU_IRQS; i++) {
>>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
>
