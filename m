Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2991588njj;
        Tue, 6 May 2025 02:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqyQB1/emKa0w6OPTG9OosXYhVtlaumyBAWzSCyhn8jj3em0Hml4Rz8hwvnXxbjPP15z7nMyfpEfR/MA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMh7JXrTzARwRj79K1+L+voZSRrN/eS3kijHAc/YmYw4ZWCzoPRjKqjKhMy+NxcwLC2Msy
X-Received: by 2002:a05:6512:3987:b0:549:8cc8:efed with SMTP id 2adb3069b0e04-54fb4a6eb38mr660508e87.48.1746524129767;
        Tue, 06 May 2025 02:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746524129; cv=none;
        d=google.com; s=arc-20240605;
        b=QfjqxVID4dluW0uR86sbYxF8pnoedSyFXOUYFesdK7GCMLzlkc/EnwXf90JrKkrx6C
         gMkIbabo96jHEcWrDlHYsh8mBszo6JPBi8E2Z9d0M64K8vKNHO7sY2ChChfECamTIs8T
         F6p5uIGScaFQ+PtwD4fBIhwpbVf/fcNMB6IH7CSKcUcb134erNf5dE88FYZRLG20brS+
         zCWLN+9v92y+yX3MJ+btZKqZLeOeB3/4VQROBVDdiIvCd3H3W8p8HQ32HqMJHg9iTpaw
         J9xLsrUdgBMcVPinWasygeoJsNcQ3hwLmerTpcw12o7H4tikueaGedgOzSIL9kkLRjvV
         1sqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=m9Nj0TTI4/KXc+zG295t2eZu7dXoGbjXFPHXgCwgiT0=;
        fh=KCCeGxXJiftc12UB8r0SbDBBRXFjWPwNY8i8y04pDSI=;
        b=ZHc7l2Qgys5z+gBCoTSJyDJVallOnQT9EFFPL/sfn9o255m4jSi4lcDTdsvjqUwnMI
         EE64y9jyyBPjTFeLmrEOlGwPcTCN3UpHrIAyj0GxgdoiPqcLJQJVPZndmIpXBXT/FMxX
         dgvpwEZCMjmwN1PUWzndxHNcbTrUoL9gxwFVaeH8bZGK9ZXR1tDoJXirDDWmPq2Wgr+3
         kkQgcWQ0cr+moIRjyl80zNV+WWb0VG70NRaa7lqHJysERSyXBolGsx7i2EdKdUnvj+na
         IsrR8UbVezfEI+Nwb07E884mt5+EIw59rto2NAhj+TcUkBa0lcguXbdRgPlQq/2RYszb
         f3RQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R72NUBrG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 2adb3069b0e04-54ea94e22f3si3960888e87.192.2025.05.06.02.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R72NUBrG;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746524128;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m9Nj0TTI4/KXc+zG295t2eZu7dXoGbjXFPHXgCwgiT0=;
	b=R72NUBrGUUkXuyQJx1sb9+EFV4ZOMl4CEZMOePxoFY/pYq22XrEjvIp7ypSq18i63r3QEm
	n7Xibcrsk5e+mz3bn3GYPv/uuFrT4GGKjV3lhlHpWS85ev56Qrds4/wMQgLLuerKOPR1Gg
	86Tqagf8azmEN5uvQTGwMzt9la7ii/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-AaaR5BeBNcGacJ6U3HqaUA-1; Tue, 06 May 2025 05:35:27 -0400
X-MC-Unique: AaaR5BeBNcGacJ6U3HqaUA-1
X-Mimecast-MFC-AGG-ID: AaaR5BeBNcGacJ6U3HqaUA_1746524126
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43f405810b4so27772545e9.1
        for <alex.bennee@linaro.org>; Tue, 06 May 2025 02:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524126; x=1747128926;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9Nj0TTI4/KXc+zG295t2eZu7dXoGbjXFPHXgCwgiT0=;
        b=Y4kQ5llUuY6hyTbDcqpsq5h2zBteUiKKOdM2Ow9FzohJ39yv08KbquQoo5NsVt3KYQ
         8ythvCWY62mxeJBQKvz3YigrdllXhNBKKveS3eupnNbqHxsb04X9mKVE9s7IdudWtOD/
         xgyy3mPDE3JOWrTjUzuT7y4qY8wNw44l3QWgdXn5LfcfCyUZIHANFlQO0DCV5rP6WTVa
         Y/86ZyyJ/y19DfDsSWO9JYVvl6ckpk8OjcpWluH+g7U1FBbN29OG3KEWqWtGRLzlT5gv
         /pYyeHkNMiEQSPW88oMSzxl70eUdtHqfGzZKX70vv6uhIpErzSpXuQwate22d4aSRJYT
         1WyA==
X-Forwarded-Encrypted: i=1; AJvYcCUG8gBeFfu3IygWXapvH7GnWNIPoYjmHEVYiI7wYN/QSitsAxxKRZDHt05S1tWq++fwNlsPukLBxEzpvw==@linaro.org
X-Gm-Message-State: AOJu0YxnVxPRy1ZhDdyVAElExCPWiz+qL/5KMXYIi7MdLOUya82CJ0oX
	bG5IiQJ/ku3lCkV4ny/YdKpEn33G+KWy1odYUYiJUN/MVRfexE6yoaNpo36T7uf8cKgHw3FSI+d
	CSYrJM7IBT4f3hGkmvGm/oT4sSyKzewBFNUIhdZ3EN54WMIo3NPT93Q==
X-Gm-Gg: ASbGncubWd+joCE27rWdh8QoZExxzsKGFeoIHW7W9x1XcS8VGGxJfs94iyeEJRluOVJ
	bl/vW0cBLl5vgeM2up/1dQjwT6iVvkwhulZJwS1SiRuBKDjvzuTAqh9PmZ2JOqsnIw9TicUrnyw
	20pga3115BKIhLD3f1yAetv9EoIf4VGYUBiRuFRswxuFqVu3H3fB6+wd4EmyD45EUaHPCdB+83Y
	70hazYDTvtyPLiOPB9cxPVajMaXCiUlpQ5oH6CmYSHTTHgLM3HnPJuvE+ehv4NkfYScmhqeu3cR
	IN9BIlpSZc0v/whjDiX/xJyomB3yNWrauLfYahzVLEC9ShKM7pLi1/yWcIA=
X-Received: by 2002:a05:600c:4ed0:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441d053bc13mr21103755e9.31.1746524125970;
        Tue, 06 May 2025 02:35:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4ed0:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441d053bc13mr21103435e9.31.1746524125561;
        Tue, 06 May 2025 02:35:25 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm164379135e9.6.2025.05.06.02.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:35:24 -0700 (PDT)
Message-ID: <f1b91034-be2a-493e-9229-c164e0895825@redhat.com>
Date: Tue, 6 May 2025 11:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Donald Dutile <ddutile@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: "jgg@nvidia.com" <jgg@nvidia.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <03c31d89-ad24-4470-99d0-a77e693e3ba2@redhat.com>
 <fd3219d3-bab3-4991-afbe-fd80549bbca4@redhat.com>
 <aa895207758d4515986fd6cfe05b5917@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aa895207758d4515986fd6cfe05b5917@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EujmpcSwEnDcJzyfm41gczIwnH4J94Verzyp_DV1JzA_1746524126
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hGN7iXhz2OZS

Hi Shameer,

On 5/6/25 11:07 AM, Shameerali Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Monday, May 5, 2025 9:19 AM
>> To: Donald Dutile <ddutile@redhat.com>; Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org; Markus Armbruster <armbru@redhat.com>;
>> Peter Maydell <peter.maydell@linaro.org>; Daniel P. Berrange
>> <berrange@redhat.com>; Alex Bennée <alex.bennee@linaro.org>
>> Cc: jgg@nvidia.com; nicolinc@nvidia.com; berrange@redhat.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com; Linuxarm
>> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
>> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a
>> PCIe RC
>>
>> Hi,
>> On 5/2/25 8:16 PM, Donald Dutile wrote:
>>>
>>> On 5/2/25 6:27 AM, Shameer Kolothum wrote:
>>>> Although this change does not affect functionality at present, it lays
>>>> the groundwork for enabling user-created SMMUv3 devices in
>>>> future patches
>>>>
>>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>>> ---
>>>>   hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
>>>>   hw/arm/virt.c   |  3 ++-
>>>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>>> index ab67972353..605de9b721 100644
>>>> --- a/hw/arm/smmuv3.c
>>>> +++ b/hw/arm/smmuv3.c
>>>> @@ -24,6 +24,7 @@
>>>>   #include "hw/qdev-properties.h"
>>>>   #include "hw/qdev-core.h"
>>>>   #include "hw/pci/pci.h"
>>>> +#include "hw/pci/pci_bridge.h"
>>>>   #include "cpu.h"
>>>>   #include "exec/target_page.h"
>>>>   #include "trace.h"
>>>> @@ -1874,6 +1875,25 @@ static void smmu_reset_exit(Object *obj,
>>>> ResetType type)
>>>>       smmuv3_init_regs(s);
>>>>   }
>>>>   +static int smmuv3_pcie_bus(Object *obj, void *opaque)
>>>> +{
>>>> +    DeviceState *d = opaque;
>>>> +    PCIBus *bus;
>>>> +
>>>> +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    bus = PCI_HOST_BRIDGE(obj)->bus;
>>>> +    if (d->parent_bus && !strcmp(bus->qbus.name,
>>>> d->parent_bus->name)) {
>>>> +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
>>>> +                                 &error_abort);
>>>> +        /* Return non-zero as we got the bus and don't need further
>>>> iteration.*/
>>>> +        return 1;
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>>   static void smmu_realize(DeviceState *d, Error **errp)
>>>>   {
>>>>       SMMUState *sys = ARM_SMMU(d);
>>>> @@ -1882,6 +1902,10 @@ static void smmu_realize(DeviceState *d,
>> Error
>>>> **errp)
>>>>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>>>       Error *local_err = NULL;
>>>>   +    if (!object_property_get_link(OBJECT(d), "primary-bus",
>>>> &error_abort)) {
>>>> +        object_child_foreach_recursive(object_get_root(),
>>>> smmuv3_pcie_bus, d);
>>>> +    }
>>>> +
>>>>       c->parent_realize(d, &local_err);
>>>>       if (local_err) {
>>>>           error_propagate(errp, local_err);
>>>> @@ -1996,6 +2020,8 @@ static void smmuv3_class_init(ObjectClass
>>>> *klass, const void *data)
>>>>       device_class_set_parent_realize(dc, smmu_realize,
>>>>                                       &c->parent_realize);
>>>>       device_class_set_props(dc, smmuv3_properties);
>>>> +    dc->hotpluggable = false;
>>>> +    dc->bus_type = TYPE_PCIE_BUS;
>>> Does this force legacy SMMUv3 to be tied to a PCIe bus now?
>>> if so, will that break some existing legacy smmuv3 configs?, i.e.,
>>> virtio-scsi attached to a legacy smmuv3.
>> Previously the SMMU was already always attached to a PCI primary-bus
>> (vms->bus ie. pci0). virtio-scsi-pci is the device being protected. The
>> SMMU is not able to protect platforms devices atm.
>>
>> My only concern is we are highjacking the "bus" prop to record the bus
>> hierarchy the SMMU is protecting. While the SMMU is a platform device
>> and does not inherit the PCI device base class its bus type becomes
>> "TYPE_PCIE_BUS". So in terms of qom hierachy is is seen as a PCI device
>> now? I don't know if it is a problem. An alternative could be to keep
>> the bus pointer and type as it was before and introduce a primary-bus
>> property. Adding Markus, Peter, Daniel and Alex in to.
> Yes. The SMMUV3 is a platform device and we are making the bus type
> here as PCIE which is a bit odd. As replied elsewhere in this thread,
> in the initial RFC we had a specific "pci-bus" property associated with 
> SMMUv3 device, 
> Eg:
> -device arm-smmuv3,pci-bus=pcie.0,...
>
> But then there were feedback that, it is more intuitive and easy for libvirt
> if we can just use the default "bus" property associated with a  Qemu device.
> Hence the change.
I also think that using the bus property was natural. It is only when
you look at the actual implementation and potential implications on
hierarchy introspections that it may be frown upon. That's why I call
for specialists feedback ;-)
>
>> At some point it was envisionned to support protected platform devices
>> (I think this was need for CCA). My fear is that if we turn the bus type
>> to PCIE it may be difficult to extend the support to non PCIe protected
>> devices. The SMMU shall remain a platform device being able to protect
>> either PCI devices and, in the future, platform devices.
> Ok. So in the case of platform device how do we envisage to specify the "bus"?
>
> -device arm-smmv3, primary-bus=sysbus
The problem is on a SOC not all platform devices are protected by an
SMMU. One needs to be more precise I think

>
> Or something like having a SMMUv3 dev without any bus and each platform
> device has to specify the SMMUv3?
> Eg:
>
> -device arm-smmv3,id=smmuv3.3
> -device xxxx,smmuv3= smmuv3.3
Yeah I think this would look that way instead.

The last attempt was
https://lore.kernel.org/all/20210902081429.140293-1-chunming_li1234@163.com/
if I remember correctly but it did not go further. It defined a
peri-sid-map[%d] prop array to define SIDs but I don't really get how it
defines which device is protected.



> If later, I think we can stick to current one. 
That's also my pov.

Cheers

Eric

>
> Thanks,
> Shameer
