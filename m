Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99692CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:48:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9jry-0003HZ-40; Fri, 17 Oct 2025 08:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9jrv-0003Gz-BS
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v9jrr-0001Dv-Bi
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760705246;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFZfsQ1e9ifEB2nrIjRVRjnmfU8DLcdu7XnN7Tm5euk=;
 b=WKSsiqXb84+P3IqEBBmp3GzZzEMHHqnMW9ynBhcIePH4bc0UUkc0/eN6eqBv2C6YmhH0m6
 IdWc19EitDwMNllQJMXOWYSMRHyZt8KxLTKpscz0AcFieZBKlQb06gyNHHjJhEwsFiRmNG
 SYyKcodWEcmGsde9WBQwS01/GabZZvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-7kMTBMl6OsCGmOAwNJUK0w-1; Fri, 17 Oct 2025 08:47:24 -0400
X-MC-Unique: 7kMTBMl6OsCGmOAwNJUK0w-1
X-Mimecast-MFC-AGG-ID: 7kMTBMl6OsCGmOAwNJUK0w_1760705244
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-471125c8bc1so23383425e9.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760705244; x=1761310044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KFZfsQ1e9ifEB2nrIjRVRjnmfU8DLcdu7XnN7Tm5euk=;
 b=m6uB/9tfNe6J5OxI524NampfTclbD4qNr4Cb2Y4tGt6rG+yoiU8/lGVrSP8Hw8yk0K
 ObbS3jCzYoedI0wePtnKnbXVAd0ZHzN6n62zLpDyUC1OfbBEJ/2VtjDbEOlOUmT/PAdG
 QMmoyLmnacJCd8+DO1h7dA14On198nLclz/qC78JVw1AoqOCOmJq4vU2GWtVUZ+cG1A+
 eR5NFG08Z6khZadJ+azkXeswAc3B7M0NixHL6V0qDd4T7co0z0jldCDIWUSZwdLJHHX6
 Nh+ogiZa+cnTrlu0skQ+4ktpqNcyll3UwBj/S/159qvY9gBlsvQoI+B6vX2lRStBnEj6
 OOQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9VO+YuFBFvXz7SnOavVR16nbSx70/mWThszBw3hvYVCWhSdBJ3QGh6UHITrbRl621lOtJL7JMnw==@nongnu.org
X-Gm-Message-State: AOJu0YwJoM4okBDbw3b9HlZH1ebvisOEz57bPArfyua1XzjkutHaSQMM
 XI9K9Lh995+9+djyREE3eCVpmf43v7IXlO6xqrrBUQoA0J9aHVtNRAFNkrrtaRNH0LkSiTYXrwA
 w3bgESoVcWzskG1lkV4nRZQQQykRXBupFyaUP9/ShVX1CQ+QM1tIGqg==
X-Gm-Gg: ASbGncuJYRJ70lOb81zZJAN80rWNDuvDVEhFYPH5cX5GNDIXQ1mxMRO32C4n9R5wHlU
 OvRhU3uXC9XMRnnj8qCAFLkXYPU2MFp6Jy5wseF0pz4Cwsh61tPqlfiZh0xgMimL+ZVxllviekA
 ZPMpnBYBPrGT26rNonwD4jbeQGgGvVwzRYhXugkHh18ixS04DOe29aocRwnMEzLjtPdTCN7TgOj
 RhM4Epk5/qSDdiq4A7sTIFjgZ25rQ2h1xNxJdF+xysl3XRahFnnfOTHuPtCMC/bhmwpX+rrbL0h
 CyCLeFtvWRlmCtc2rey3uanWY8LdbIUzisJeUEAW42hyMjJnvGfi5Y1g9/xg2Kx1AJxYYWPaKlJ
 QmyJ9HayvSfYOLegqXcNG4PjAz8FUWwyeavayXojW07j5XQ==
X-Received: by 2002:a05:600c:871a:b0:471:14f5:124e with SMTP id
 5b1f17b1804b1-4711791ef9bmr25120575e9.35.1760705243516; 
 Fri, 17 Oct 2025 05:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaJuqioumM3Y+kDaq3VQLgZwoISXzz1BF0j5LShBpOP0/M1psa8Q9q46sF3w0ZHjAFpv7/rg==
X-Received: by 2002:a05:600c:871a:b0:471:14f5:124e with SMTP id
 5b1f17b1804b1-4711791ef9bmr25120385e9.35.1760705243059; 
 Fri, 17 Oct 2025 05:47:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ff65596csm9344710f8f.24.2025.10.17.05.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 05:47:22 -0700 (PDT)
Message-ID: <646bbedb-cfa4-418c-80b2-f143f6f97544@redhat.com>
Date: Fri, 17 Oct 2025 14:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/27] hw/arm/smmuv3-accel: Restrict accelerated SMMUv3
 to vfio-pci endpoints with iommufd
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Nathan Chen
 <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-7-skolothumtho@nvidia.com>
 <cba0a4c0-9d0c-4137-ae0a-7460da56ac56@redhat.com>
 <CH3PR12MB754822A08B7D9D7317DBECD8ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754822A08B7D9D7317DBECD8ABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bnc6gjAar9DCc4_YXjziTiVdtKmB0wqfzd_E4jLYSmI_1760705244
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/2/25 11:30 AM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 01 October 2025 18:32
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 06/27] hw/arm/smmuv3-accel: Restrict accelerated
>> SMMUv3 to vfio-pci endpoints with iommufd
>>
>> External email: Use caution opening links or attachments
>>
>> Hi Shameer,
>>
>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>> Accelerated SMMUv3 is only useful when the device can take advantage
>>> of the host's SMMUv3 in nested mode. To keep things simple and
>>> correct, we only allow this feature for vfio-pci endpoint devices that
>>> use the iommufd backend. We also allow non-endpoint emulated devices
>>> like PCI bridges and root ports, so that users can plug in these
>>> vfio-pci devices. We can only enforce this if devices are cold
>>> plugged. For hotplug cases, give appropriate
>> "We can only enforce this if devices are cold plugged": I don't really
>> understand that statement.
> By "enforce" here I meant, we can prevent user from starting a Guest 
> with a non "vfio-pci/iommufd dev" with accel=one case.  
Ah OK I misread the code. I thought you were also exiting in case of
hotplug but you only issue a warn_report.
From a user point of view, the assigned device will succeed attachment
but won't work. Will we get subsequent messages?  I understand the pain
of propagating the error but if the user experience is bad I think it
should weight over ?
>
>  you do checks when the device is hotplugged too.
>> For emulated device you eventually allow them but you could decide to reject
>> them?
> Currently get_address_space() is a " Mandatory callback which returns a pointer
> to an #AddressSpace". Changing that and propagating an error all the way, as 
> you said below, is not that straightforward. At present we warn the user
> appropriately for both vfio-pci without iommufd and emulated device hot plug
> cases. Perhaps, if required, the error handling can be taken up as a clean-up series
> later?
>
> Also, I think I need to explain the emulated device hotplug case a bit more. This
> is something I realised later during the tests.
>
> Unfortunately, the hotplug scenario for emulated devices behaves differently.
> What I’ve noticed is that the hotplug handler’s call path to get_address_space()
> differs from cold-plug cases.
>
> In the emulated device hotplug case, the pdev is NULL for below:
> PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
>
> Here’s what seems to be happening:
>
> do_pci_register_device() {
>    ....
>     if (phase_check(PHASE_MACHINE_READY)) {
>         pci_init_bus_master(pci_dev);
>             pci_device_iommu_address_space()  --> get_address_space()
>     }
>     ....
>     bus->devices[devfn] = pci_dev;   //happens only after the above call.
> }
>
> For vfio-pci hotplug, we’re fine, since the vfio layer calls get_address_space()
> again, with a valid pdev.
>
> For cold-plug cases, the if (phase_check(PHASE_MACHINE_READY)) check is
> false, and the call path looks like this:
>
> pcibus_machine_done()
>    pci_init_bus_master(pci_dev);
>        pci_device_iommu_address_space()  --> get_address_space()
>
> By then we have a valid pdev.
>
> I’m not sure there’s an easy fix here. One option could be to modify
> get_address_space() to take pci_dev as input. Or we could change the 
> call path order above.
>
> (See my below reply to emulated dev warn_report() case as well)
>
> Please let me know your thoughts.
Can't you move the assignment of bus->devices[devfn] before the call and
unset it in case of failure?

Or if you propagate errors from

get_address_space() you could retry the call later?

Eric

>
>>> warnings.
>>>
> [...]
>
>>> +
>>> +    if (pdev && !smmuv3_accel_pdev_allowed(pdev, &vfio_pci)) {
>>> +        if (DEVICE(pdev)->hotplugged) {
>>> +            if (vfio_pci) {
>>> +                warn_report("Hot plugging a vfio-pci device (%s) without "
>>> +                            "iommufd as backend is not supported",
>>> + pdev->name);
>> with accelerated SMMUv3.
>>
>> why don't we return NULL and properly handle this in the caller. May be worth
>> adding an errp to get_address_space(). I know this is cumbersome though.
> See above reply on propagating err from this callback.
>
>>> +            } else {
>>> +                warn_report("Hot plugging an emulated device %s with "
>>> +                            "accelerated SMMUv3. This will bring down "
>>> +                            "performace", pdev->name);
>> performance
>>> +            }
> As I mentioned above, since the pdev for emulated dev hotplug case is NULL,
> we will not hit the above warning. 
>
>>> +            /*
>>> +             * Both cases, we will return IOMMU address space. For
>>> + hotplugged
>> In both cases?
> Yes, since we can't return NULL here. However, as done here, we will inform
> the user appropriately.
>
>>> +             * vfio-pci dev without iommufd as backend, it will fail later in
>>> +             * smmuv3_notify_flag_changed() with "requires iommu MAP
>> notifier"
> [...]
>
>>> +#define TYPE_PXB_PCIE_DEV "pxb-pcie"
>> I agree with Nicolin, you shall rather move that change in a seperate patch.
> I thought of mentioning this change in the commit log(which I missed) and
> avoiding a separate patch just for this. But if you guys feel strongly, I will
> have a separate one.
>
> Thanks,
> Shameer


