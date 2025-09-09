Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E227CAC583
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Sep 2025 13:35:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uvyUu-0000y3-4t; Tue, 09 Sep 2025 09:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyUj-0000dQ-EU
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uvyUO-0001WA-5L
 for qemu-arm@nongnu.org; Tue, 09 Sep 2025 09:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757424864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BDf2ec//Zgwk83/n5MdyJ11ZiNqCJFNVN2yHeIZeJOg=;
 b=YAYFoQI6Az2wt50HKOrpAzNkqqHlk2TTGTsoJRlvFeGvIln7ZLuVfY9cCfQ7Cd/ekD1VL0
 9ygw3gI+Qo7D/VrqgvpG0CRDiL1nhCEqO/HELu68QYJQXkKze83NyUzFXBQ8ws36gI+Fqf
 7xLF5wx0qljKp5Xd8+1GCYG2pqRnITQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-b8SH433dO2GDi5gcNVaiMA-1; Tue, 09 Sep 2025 09:34:22 -0400
X-MC-Unique: b8SH433dO2GDi5gcNVaiMA-1
X-Mimecast-MFC-AGG-ID: b8SH433dO2GDi5gcNVaiMA_1757424861
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3e04ea95c6cso2665259f8f.1
 for <qemu-arm@nongnu.org>; Tue, 09 Sep 2025 06:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757424861; x=1758029661;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BDf2ec//Zgwk83/n5MdyJ11ZiNqCJFNVN2yHeIZeJOg=;
 b=hWzAnWQId4CVTZd4/4M5g8l+X0MhbWgMxSDXB4FZACWEM6NhwoL3divTl2xkeDj6S4
 NtbHRXX62CM6valxTuDD823QyvXFsgKULizF2/Rh0a5nQ7f8IfI1qVjpSJCmVAgPJUZy
 +8NTsQnAbMvVdWYNvDFSjxpCwvO7MGtSK1joMPUDajP1CcGc1NCETmH1NYeTHQS6dYvj
 8bcs5G6MSR1zrXj5ZU1VAkrdzCVAijqDmaBSSVO0IKj5zITR+GFgeuUXmW4g0o021EfW
 jMgv5pU+ItnrJumnAGW3mV7lW4e4ijzxgbY3kvVKLf1QPt9IpCYLDfdJ8YUuNzCybvR9
 eo9g==
X-Gm-Message-State: AOJu0YxUk8OzSccqO0c5A9hrAzuNUQCJ147iYBicfK5gEiPv60ouEtvx
 +/o3miuP1TZDtgr75a5G2niREn873eniskFzDyAIrmB2nwa5p9r3IGdYG9iP7NKSTN7/n2+6pR/
 Pqlea14itcxQNQhhFGMtSw/buwqETM8rBRUH58fLWbiDtx1nuowMj+Q==
X-Gm-Gg: ASbGncuY+QYe3hGGVYnspc0KSr8HzFgUuorwXFOzTJdHjixfJtF00UO1XeBkqP8rRH6
 qlL11+p5sO6JhyipIxtuoi3U8RGeUWnRxm/EE6k06q57CiSSsU2eQwHeQ6h3q01q4uzb5m7hSXw
 LtAgNG+5Sy1nkqwNJXuNGIM9pVqE5tC9CuIm1msthmHhcRlDZ010Lb/IJGbR5vSGypKkp5HaUcu
 pkxZfxNpVt3+GizCaORhJ5P1P75iwS6GFOhG8oA53kqreAfaSbgkwlz6hMn0y02TgmWOm1FODjo
 24agnjxZw7xgCncydS6pYOZ+BeeTT1irYcbApwlqwIYho/0=
X-Received: by 2002:a05:6000:230e:b0:3df:7b7b:6d20 with SMTP id
 ffacd0b85a97d-3e64317d5cemr8838389f8f.27.1757424859637; 
 Tue, 09 Sep 2025 06:34:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt1Iu6kbdPykNVdXI/8J1EXJmC/OGFK9eIc6Fl9JTvFULPp1BJR69wZRMX+EKPTtGi08qcDQ==
X-Received: by 2002:a05:6000:230e:b0:3df:7b7b:6d20 with SMTP id
 ffacd0b85a97d-3e64317d5cemr8838363f8f.27.1757424859198; 
 Tue, 09 Sep 2025 06:34:19 -0700 (PDT)
Received: from [192.168.43.95] ([37.167.152.186])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e75223885csm2682528f8f.36.2025.09.09.06.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 06:34:18 -0700 (PDT)
Message-ID: <e6c07d2e-d48b-49a2-af6c-c81fb87196ce@redhat.com>
Date: Tue, 9 Sep 2025 15:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict accelerated
 SMMUv3 to vfio-pci endpoints with iommufd
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-7-shameerali.kolothum.thodi@huawei.com>
 <IA3PR11MB9136A660E9FAE540037986FB9257A@IA3PR11MB9136.namprd11.prod.outlook.com>
 <aHaW9IpjbaVcRUpA@Asurada-Nvidia>
 <IA3PR11MB9136E0D793F99E3837D208229256A@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f0b2123a-f7cb-42bf-a7b0-ba326149fcf4@redhat.com>
 <IA0PR12MB7555BC2CAE15B3D7DF216196AB0CA@IA0PR12MB7555.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <IA0PR12MB7555BC2CAE15B3D7DF216196AB0CA@IA0PR12MB7555.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F1qz8pMkkDiWpvi2hrMHBuC56P1RzgICXVxFGjqKj9o_1757424861
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 9/8/25 9:41 AM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 05 September 2025 09:15
>> To: Duan, Zhenzhong <zhenzhong.duan@intel.com>; Nicolin Chen
>> <nicolinc@nvidia.com>; Shameer Kolothum <skolothumtho@nvidia.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>;
>> ddutile@redhat.com; berrange@redhat.com; Nathan Chen
>> <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; linuxarm@huawei.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; shameerkolothum@gmail.com
>> Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict accelerated
>> SMMUv3 to vfio-pci endpoints with iommufd
>>
> [..]
>>>>>> static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void
>>>>>> *opaque,
>>>>>>                                               int devfn)
>>>>>> {
>>>>>> +    PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
>>>>>>     SMMUState *bs = opaque;
>>>>>> +    bool vfio_pci = false;
>>>>>>     SMMUPciBus *sbus;
>>>>>>     SMMUv3AccelDevice *accel_dev;
>>>>>>     SMMUDevice *sdev;
>>>>>>
>>>>>> +    if (pdev && !smmuv3_accel_pdev_allowed(pdev, &vfio_pci)) {
>>>>>> +        error_report("Device(%s) not allowed. Only PCIe root complex
>>>>>> devices "
>>>>>> +                     "or PCI bridge devices or vfio-pci endpoint
>>>> devices
>>>>>> with "
>>>>>> +                     "iommufd as backend is allowed with
>>>>>> arm-smmuv3,accel=on",
>>>>>> +                     pdev->name);
>>>>>> +        exit(1);
>>>>> Seems aggressive for a hotplug, could we fail hotplug instead of kill
>> QEMU?
>>>> Hotplug will unlikely be supported well, as it would introduce
>>>> too much complication.
>>>>
>>>> With iommufd, a vIOMMU object is allocated per device (vfio). If
>>>> the device fd (cdev) is not yet given to the QEMU. It isn't able
>>>> to allocate a vIOMMU object when creating a VM.
>>>>
>>>> While a vIOMMU object can be allocated at a later stage once the
>>>> device is hotplugged. But things like IORT mappings aren't able
>>>> to get refreshed since the OS is likely already booted. Even an
>>>> IOMMU capability sync via the hw_info ioctl will be difficult to
>>>> do at the runtime post the guest iommu driver's initialization.
>>>>
>>>> I am not 100% sure. But I think Intel model could have a similar
>>>> problem if the guest boots with zero cold-plugged device and then
>>>> hot-plugs a PASID-capable device at the runtime, when the guest-
>>>> level IOMMU driver is already inited?
>>> For vtd we define a property for each capability we care about.
>>> When hotplug a device, we get hw_info through ioctl and compare
>>> host's capability with virtual vtd's property setting, if incompatible,
>>> we fail the hotplug.
>>>
>>> In old implementation we sync host iommu caps into virtual vtd's cap,
>>> but that's Naked by maintainer. The suggested way is to define property
>>> for each capability we care and do compatibility check.
>>>
>>> There is a "pasid" property in virtual vtd, only when it's true, the PASID-
>> capable
>>> device can work with pasid.
>>>
>>> Zhenzhong
>> I don't think this is an option not to support hotplug. I agree with
>> Zhenzhong, we shall try to align with the way it is done on intel-iommu
>> and study whether it also fits the needs for accelerated smmu.
> Hotplug is supported. The only current requirement is that we need at least
> one cold-plugged device to retrieve the host SMMUv3 features. These are
> then used to update the vSMMUv3 features during the reset phase so that
> the Guest can probe them at boot.
>
> Based on the discussions in this series, we plan to remove that dependency
> going forward. Instead, the accelerated vSMMUv3 will be initialized based
> on the current emulated SMMUv3 features, plus any additional features
> specified by the user on the command line.
>
> During every device attachment to the accelerated SMMUv3, we will
> cross-check for any disparities and allow or disallow the attachment
> accordingly.
>
> Please let me know if you see any drawbacks with this approach.
This looks aligned with the intel-iommu strategy and up to now I don't
see any cons. Let's try to relax the requirement and we will see if it
brings further issues ...

Thanks

Eric
>
> Thanks,
> Shameer
> 	
>
>
>


