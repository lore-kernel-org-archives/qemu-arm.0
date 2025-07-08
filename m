Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FABC83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:18:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFAX-0003Vm-JA; Tue, 08 Jul 2025 16:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDjn-00011I-K5
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:12:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uZDje-0006I7-RD
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752001927;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mRrWJXx5qrcS1aBI12Benqblc8NnA0a1RoEAr2HASco=;
 b=Su/C/akxzGqBRpLH0r8zO4d6HTZfyUnG96tO3m3K27qsj8ApY2FS2Eaz8V6n23e3OKb3cG
 6IjdcASFDZPcu6U1SqJm3Q+PGktp+ULNkB1CICdHD3kCv+DEPbuVnQ++8IA/UoyUOQqoyz
 waTQKwflUuqRZqdbDnD0Lx2MdMF8CXA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-2v0WB4O0Pi6CzCY80geE1Q-1; Tue, 08 Jul 2025 05:47:28 -0400
X-MC-Unique: 2v0WB4O0Pi6CzCY80geE1Q-1
X-Mimecast-MFC-AGG-ID: 2v0WB4O0Pi6CzCY80geE1Q_1751968048
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4530c186394so16005995e9.0
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 02:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751968048; x=1752572848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mRrWJXx5qrcS1aBI12Benqblc8NnA0a1RoEAr2HASco=;
 b=GRMxJX8kQNqZAMy0LfukqJsO8aVpM2U3w/10brWWrLBNZfyfvS39oeOCHIwhXAsHjB
 ujnAF1wdpxihOQjNEQipetiGiYzjx41XQxo+zvqHo3MRY1IsB2UaQ/BDlQCTpg75p3eX
 1ngyBFaJbxFZ+rJJKSLqPyqvZote4P3qL9eqEzT//JSgw4kO4Y0gvGX9alXQV9ilr50W
 CpiVIeRImYeXN//33ERB10c+nUee1k4m+xrCvA3dO8yQhpt50UvTkb2issUYoMbv2DU+
 F1VbqoAipkafRqVgl7sGEqYss8pyRMMS1Kpya55FUmySHsNstupSxHFN28TncO+/m5Hx
 tX0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXvYT+V7yNKjv6ftcuIaBUPd2nnWZWbPQhTRrH5YZX+swoLpCkHaCQE75lVmn6nxkBqOjSBgVIpw==@nongnu.org
X-Gm-Message-State: AOJu0Yw9QeGkIsaXg5oKP8yQxDI3UIJq/mUbLRJBz2lEax1Cxw36pYRx
 1/vx5ighAbWBfcWGD/57OIH3O5Qvgpwd4V3A6LuUwa2h5bK2dbp1acVkONqc/RKQbkQatNPUjeD
 ob/iS8J1+hfDHkhjVwhJUPz7UE0awTN5ein4dxItazroty6cppRcieA==
X-Gm-Gg: ASbGnctIYKMWjxsigMYHniPg5ySp++6WcMRH1WOTZ6vs9pHBVzPTexdnizdoeT9yQ1U
 yspks9TMU4TQDwMnSOumrWS3SVUg6/N4veA9NDf6jWhLl9hYeev4EXgQrRp+R6sg3K3VoxxUke/
 DyLXsQwhOErc9L8rR/wr6aQWIKNABikCnV9trx1sfR2i7o2R09pc/VvbaigsQdPQHJwkHKVFsCQ
 K17yP6N+1NlaGRBgtkON5wkudilJkIosY7y+IJNC+ybqQ5VrNwLDAuw2ha4Dm3WWaq6Fz10Pi+G
 2z+KkFFLcIkNlW6SgMOxbJKSbI3Kdj1ADgPl25nIVoyJJzr3eVon3eGkSX+MeGBmBgqs1Q==
X-Received: by 2002:a05:600c:3f0f:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-454c81f53a7mr53172035e9.7.1751968047538; 
 Tue, 08 Jul 2025 02:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENoSXQ2UTf8DjWAuOH3p/YeR2S91YyiJFG62xpbTnNJ9KLyf50vPX6WemiYtAk4Ijshv4+3Q==
X-Received: by 2002:a05:600c:3f0f:b0:43d:4e9:27ff with SMTP id
 5b1f17b1804b1-454c81f53a7mr53171615e9.7.1751968047020; 
 Tue, 08 Jul 2025 02:47:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd3d806bsm16913555e9.33.2025.07.08.02.47.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 02:47:26 -0700 (PDT)
Message-ID: <785c5904-001b-4e1b-8fae-9b8539668e96@redhat.com>
Date: Tue, 8 Jul 2025 11:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250703084643.85740-1-shameerali.kolothum.thodi@huawei.com>
 <20250703084643.85740-9-shameerali.kolothum.thodi@huawei.com>
 <b05cd1f5-db7a-45d3-a582-85c808adcd04@redhat.com>
 <e4cd2ccede7b46df9bbcf63dcf492fcf@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e4cd2ccede7b46df9bbcf63dcf492fcf@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OBzDlFWe6hzjxHzUkKxAL4Q2a0nDbZL0ld8-OrFJhrk_1751968048
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 7/8/25 10:54 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Tuesday, July 8, 2025 8:41 AM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; imammedo@redhat.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com;
>> gustavo.romero@linaro.org; mst@redhat.com;
>> marcel.apfelbaum@gmail.com; Linuxarm <linuxarm@huawei.com>;
>> Wangzhou (B) <wangzhou1@hisilicon.com>; jiangkunkun
>> <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v6 08/12] hw/arm/virt: Allow user-creatable SMMUv3
>> dev instantiation
>>
>> Hi Shameer,
>>
>> On 7/3/25 10:46 AM, Shameer Kolothum wrote:
>>> Allow cold-plugging of an SMMUv3 device on the virt machine when no
>>> global (legacy) SMMUv3 is present or when a virtio-iommu is specified.
>>>
>>> This user-created SMMUv3 device is tied to a specific PCI bus provided
>>> by the user, so ensure the IOMMU ops are configured accordingly.
>>>
>>> Due to current limitations in QEMU’s device tree support, specifically
>>> its inability to properly present pxb-pcie based root complexes and
>>> their devices, the device tree support for the new SMMUv3 device is
>>> limited to cases where it is attached to the default pcie.0 root complex.
>>>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>> Tested-by: Nathan Chen <nathanc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  hw/arm/smmu-common.c         |  8 +++++-
>>>  hw/arm/smmuv3.c              |  2 ++
>>>  hw/arm/virt.c                | 50 ++++++++++++++++++++++++++++++++++++
>>>  hw/core/sysbus-fdt.c         |  3 +++
>>>  include/hw/arm/smmu-common.h |  1 +
>>>  5 files changed, 63 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index b15e7fd0e4..2ee4691299 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -959,7 +959,12 @@ static void smmu_base_realize(DeviceState *dev,
>> Error **errp)
>>>                  goto out_err;
>>>              }
>>>          }
>>> -        pci_setup_iommu(pci_bus, &smmu_ops, s);
>>> +
>>> +        if (s->smmu_per_bus) {
>>> +            pci_setup_iommu_per_bus(pci_bus, &smmu_ops, s);
>>> +        } else {
>>> +            pci_setup_iommu(pci_bus, &smmu_ops, s);
>>> +        }
>>>          return;
>>>      }
>>>  out_err:
>>> @@ -984,6 +989,7 @@ static void smmu_base_reset_exit(Object *obj,
>> ResetType type)
>>>  static const Property smmu_dev_properties[] = {
>>>      DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
>>> +    DEFINE_PROP_BOOL("smmu_per_bus", SMMUState, smmu_per_bus,
>> false),
>>>      DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
>>>                       TYPE_PCI_BUS, PCIBus *),
>>>  };
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index ab67972353..bcf8af8dc7 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1996,6 +1996,8 @@ static void smmuv3_class_init(ObjectClass
>> *klass, const void *data)
>>>      device_class_set_parent_realize(dc, smmu_realize,
>>>                                      &c->parent_realize);
>>>      device_class_set_props(dc, smmuv3_properties);
>>> +    dc->hotpluggable = false;
>>> +    dc->user_creatable = true;
>>>  }
>>>
>>>  static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 05a14881cf..8662173c43 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -56,6 +56,7 @@
>>>  #include "qemu/cutils.h"
>>>  #include "qemu/error-report.h"
>>>  #include "qemu/module.h"
>>> +#include "hw/pci/pci_bus.h"
>>>  #include "hw/pci-host/gpex.h"
>>>  #include "hw/virtio/virtio-pci.h"
>>>  #include "hw/core/sysbus-fdt.h"
>>> @@ -1440,6 +1441,28 @@ static void create_smmuv3_dt_bindings(const
>> VirtMachineState *vms, hwaddr base,
>>>      g_free(node);
>>>  }
>>>
>>> +static void create_smmuv3_dev_dtb(VirtMachineState *vms,
>>> +                                  DeviceState *dev, PCIBus *bus)
>>> +{
>>> +    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms-
>>> platform_bus_dev);
>>> +    SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
>>> +    int irq = platform_bus_get_irqn(pbus, sbdev, 0);
>>> +    hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
>>> +    MachineState *ms = MACHINE(vms);
>>> +
>>> +    if (strcmp("pcie.0", bus->qbus.name)) {
>>> +        warn_report("SMMUv3 device only supported with pcie.0 for DT");
>> while testing the series I hit the warning with a rhel guest which boots
>> with ACPI.
>> I think we shall make the check smarter to avoid that.
>> maybe also check firmware_loaded and virt_is_acpi_enabled()?
> Thanks for giving it a spin. Yes, just confirmed that the warning appears.
> The above check will work, but can we make use of vms->acpi_dev for
> this check instead? It is essentially the same and I think that will work. 
>
>     if (!vms->acpi_dev && strcmp("pcie.0", bus->qbus.name))
the logical dependency on acpi_dev is maybe not that straightforward.
Also it has has_ged and aarch64 check
I thing I would simply check !(firmware_loaded &&
virt_is_acpi_enabled(vms)). about the aarch64 check I am not sure this
is needed.

Eric
>
> Please let me know.
>
> Thanks,
> Shameer


