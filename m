Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A7DCA0FED
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 08:35:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuRuh-0006uM-Ra; Fri, 05 Sep 2025 04:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuRud-0006t9-QM
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 04:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuRuW-00053K-Uo
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 04:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757061304;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5R1ozEOGiftEhMlw5PpLG8LK23YADtHKCGXnoZsK4g=;
 b=RAXAeqgqz2MDNE+BVONolI4lHzjCgvAxmcF16u+YR+WG+3/KCZO1XMd2vTTytJrz0jNple
 1IZww2GGDbf1G+93bFCkLPju//d6YiSYuDbvsO+wsVlEwwZRUHLnMxGGnLuJKgCA6gNfzr
 IM+t29jBbeo694RtP86x2DeItZNsekU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-zGEZgreSNLSTy9Y5NNAEow-1; Fri, 05 Sep 2025 04:35:03 -0400
X-MC-Unique: zGEZgreSNLSTy9Y5NNAEow-1
X-Mimecast-MFC-AGG-ID: zGEZgreSNLSTy9Y5NNAEow_1757061302
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45b990eb77cso12035995e9.0
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757061302; x=1757666102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d5R1ozEOGiftEhMlw5PpLG8LK23YADtHKCGXnoZsK4g=;
 b=Dn5y1Ev3wMXzoj2pmB5tu9WRgVRSyLZEMNURZmBiYlEmMhnUMysrk5ZuQqnqFioOVq
 8ezX0ALaXMENGhZ8B3nbh/6u1fKGetKbkc3bn3l+ziJhx7dMzGe71DzNSWhA0JFSSSQw
 z6r4b/awrCWOvCoGJd4KzqWLEI5LUM8NXQUgrcE+160XEkbfmPbGRsfJI3jYM3PsQJzv
 8NeAWJc1pqyqhze1XVV16gmbbaQ/7dSjcVHXtz2Eegwcdzqtya/Q7Wf/GXsDaqCnLBTK
 ATkG2NKt3BGzh5mybksDjYehI3X0y36zGpAvogW3AR7Et8NGqPJw4/L2UOEeOsv71C6Y
 W5fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGUrkgAqpDYiZWnNMN/IP+Pa+45OB2TK6hVrO1t6XYg08HshlEnp1M5GLnlxC88qlJsJw6bVht7w==@nongnu.org
X-Gm-Message-State: AOJu0Yxku3VtLMj9B185Xn28eYigU4hGiFMYfwTvcrZt8/N32HXxs+ti
 Ay41e7fI6NAMkoDmyMVfTYsbLKJ6/GJvSWQST6pawLwIoG3ImsrqN1qrWhkErPNfhISl8B3hPaf
 3kFCTbAMqQ2uEZGHgVRmT3Gl8A5us7i/o26Yd4ajQSb/l1OuEyiJt5A==
X-Gm-Gg: ASbGncspFOrZQYg5Knu3kbcOqeJU7q8LVg6RDPeFcQGMrt/Pr+wx5uvKEMzVDS2HKs8
 mc+vcEjNTrP5iKBltGYDrC70nMZt8C0rKdkB9OH3Na1+SO9RVR7myS5O9uKkjKNLU1tSROzVLgJ
 MGgpZTFq/dEZyTccBOZKL+idRkOjhncc0QvpMQKsxlaoPtsA6Ji+X9sSjPCXY8I8P/1LZbTio3T
 4Id0Kyw7gSZtbcEaQuDlLIM4RBXLW7FkYU76tqr3gum1xgbCmRK+iagTCIdU/VaSyeYWcKVXNKE
 49Vr8T3PxRU8W+EwTLJvfk+rR8w856CLujsW6WBU2emkWZcyGrZIwmoIzUVYFA0ReF31GGBau1x
 zLHJhQDmZXo4=
X-Received: by 2002:a05:600c:3b01:b0:45d:d202:77f0 with SMTP id
 5b1f17b1804b1-45dd5b3c05fmr20470845e9.5.1757061302338; 
 Fri, 05 Sep 2025 01:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+LR3/jbP3yoAyvxK+7HO6EG5KUTPtKcL7xxaBopvBTP+E2DDLLj3PHzBiAMBtFQ64e8aL/g==
X-Received: by 2002:a05:600c:3b01:b0:45d:d202:77f0 with SMTP id
 5b1f17b1804b1-45dd5b3c05fmr20470475e9.5.1757061301871; 
 Fri, 05 Sep 2025 01:35:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd0869b33sm69347195e9.9.2025.09.05.01.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 01:35:01 -0700 (PDT)
Message-ID: <4e93485f-0dc5-4708-958e-4cb4162fc922@redhat.com>
Date: Fri, 5 Sep 2025 10:34:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict accelerated
 SMMUv3 to vfio-pci endpoints with iommufd
To: Nicolin Chen <nicolinc@nvidia.com>, skolothumtho@nvidia.com
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "shameerkolothum@gmail.com" <shameerkolothum@gmail.com>
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-7-shameerali.kolothum.thodi@huawei.com>
 <IA3PR11MB9136A660E9FAE540037986FB9257A@IA3PR11MB9136.namprd11.prod.outlook.com>
 <aHaW9IpjbaVcRUpA@Asurada-Nvidia>
 <IA3PR11MB9136E0D793F99E3837D208229256A@IA3PR11MB9136.namprd11.prod.outlook.com>
 <798f739303f74fbca49a09a623a0a118@huawei.com>
 <aHfmmdXXKcFDnJLP@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aHfmmdXXKcFDnJLP@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U4Kz8uWrQ_aG2ldosXV1S-oD4p7OsGu19I548r0Boos_1757061302
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Nicolin

On 7/16/25 7:51 PM, Nicolin Chen wrote:
> On Wed, Jul 16, 2025 at 09:34:04AM +0000, Shameerali Kolothum Thodi wrote:
>>>>> Seems aggressive for a hotplug, could we fail hotplug instead of kill
>>> QEMU?
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
>>> capable
>>> device can work with pasid.
>> Thanks for this information. I think probably we need to take a look at this as
>> this doesn't have a dependency on cold-plug device to be present for SMMUv3.
>> Will go through intel vtd implementation.
> I see. A compatibility test sounds promising.
>
> It still feels tricky when dealing with multi vSMMU instances, if
> some instances don't have a cold-plug device to poll hw_info. We
> would need to pre-define all the feature bits. Then, run the test
> on every hotplug device attached later to the vSMMU instance.

This is what looks the most sensible to me
>
> Maybe we could do something wise:
> The sysfs node provides all the IOMMU nodes. So, we could compare
> the node names to see if they are likely symmetric or not. Nodes
> sharing the same naming pattern are more likely created by the
> same IOMMU driver. So, as a speculation, a vSMMU instance with no
> coldplug device could borrow the bits from a vSMMU instance with
> a device?
Then instead of trying to match names, I think it would be cleaner to
pass the sysfs path. But I would rather explore the "collect info as the
come" way

Thanks

Eric
>
> Sure, individual IOMMU instances could differ in specific fields
> despite using the same node name. This would unfortunately lead
> to hotplug failure upon the compatibility check.
>
> Thanks
> Nicolin
>


