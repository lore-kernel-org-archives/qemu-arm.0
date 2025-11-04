Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227B7CCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 16:02:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGJU3-0005X7-8n; Tue, 04 Nov 2025 11:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGJU1-0005WZ-W6
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 11:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGJTz-00051A-3w
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 11:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762272126;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0TGQ9J+cnMFyhGFC5xDk+BGVyD2h9LoJLd+M4RvWBn0=;
 b=F2W784htxonKi1Rwm62SzTBJ6I+tzFRHSZgzBIbF4+6clN3Q3Jo4r6AcCDUqel62cw39qD
 dcT5eXTdfO+uhl4As4kFv+uRu5P4TmlIiuT9qawiQbrxPJGCT0mymgBvWe20A5NN3pnxqD
 HLwMkBU0qwzPuuwIoK5MxIGtfb+Ocpo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-cl649-NdPxWKbdc77OJ0DQ-1; Tue, 04 Nov 2025 11:02:01 -0500
X-MC-Unique: cl649-NdPxWKbdc77OJ0DQ-1
X-Mimecast-MFC-AGG-ID: cl649-NdPxWKbdc77OJ0DQ_1762272120
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4773e108333so20864705e9.0
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 08:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762272120; x=1762876920;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0TGQ9J+cnMFyhGFC5xDk+BGVyD2h9LoJLd+M4RvWBn0=;
 b=s6tr0fDEo8B13RKbtQ+2oO7k/nWCt3VQ4IxQUA6D8a1MYNFG/hF/EyJJBXiUvI65vB
 c/j/DSJ2wywwpnkCfqDh85v6eCNl8hbyoFOjumtQJI+CPofq3WLqXNFpA+tVZokdQ5od
 +qeBEsTfpRLlZnQnWVZ1N6mTaQq1JD3vaJTjqZOUoFNen/JYABZv+Z4pj+t08UhuYkTL
 J42DtiMyCVhYiZKH8jifm5myfjPHNSX0Pd7+DXUyPBoYKKp4Q9EMe79RJjOc837C+i4g
 +grUkBBzKXcauVAyMmwFlcFvFs9+IRtAFTYVk/NzIajaMdMaYSs0SkDyD9tc8zxgedhq
 VXKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwB8QUFhUtbSGWKvAHjAf47ifJA5j240ivuN2SiUQVmQ9nPvMS/yYkL8t8WsoeVD6z11e/Cj/q/Q==@nongnu.org
X-Gm-Message-State: AOJu0YyXKETXCeR1Fvm6srmnLFaw8Hwe2RpRrjteBmC5aXQVS5aRbA9j
 JaL8HlU2GgV4IiIcxlA+J8exljE5XgA1ungojLgWs6PbM+wKLU4t6xmhOpvvmv3x42C8o7f8xQs
 Q+WccTm35FcXQ4/GvDpnW1ZAMZEn7aM6T4+wMzXsxumb6I1+iMMIceA==
X-Gm-Gg: ASbGncvt2lFk7htqkmC2k5LxfdbQbA/kV4hE3foq5XvyLWOpS5uZICaZjWEKMPk2bDX
 uD4l6TTQ+9LSEAP4cmWIc9Ewoqqb2br8ae0PcD66vlAETApCJVohHDkUYtM1k161erdTzCRyQXs
 XlvyjIpb3zUm7U3ZIP/jQfysc0/6HmLQ7nGgJPsB9PoNkjHNv8tuOZGlNeTgcnpqeVwjE3C3S2b
 XPJyohtMXpcfU7JgbApFN1s1jXebfZ0i8owV3vyXKGfG49XmxBsgaE2iAk2DCEv7zw4reZt2rdr
 C7/A+ewSRCZWqayGwtlqqmLCHpce8ES5LI1Iq9gvhbbwUWQA8+V4JIYEajUDf4WMQfcH/eKMLlU
 WVNjDaRbUNDgRkpW1Jidty5AV/wUMtBeUmGqzHxb9i9QZvg==
X-Received: by 2002:a05:600c:46c4:b0:471:13fc:e356 with SMTP id
 5b1f17b1804b1-4773079c96fmr163705665e9.3.1762272119944; 
 Tue, 04 Nov 2025 08:01:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXXRHjILKM5kxlvcGO2x9l3pCq2p1yoU0HLTEwtTCDNX3xj7lAsJUSnXt5f1yx5nARymQ6FQ==
X-Received: by 2002:a05:600c:46c4:b0:471:13fc:e356 with SMTP id
 5b1f17b1804b1-4773079c96fmr163705185e9.3.1762272119330; 
 Tue, 04 Nov 2025 08:01:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383c20sm225733445e9.12.2025.11.04.08.01.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 08:01:58 -0800 (PST)
Message-ID: <3c9e00f5-de9e-4e5c-8312-75eb4fcef81b@redhat.com>
Date: Tue, 4 Nov 2025 17:01:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
 get_msi_address_space() callback
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
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20251031105005.24618-1-skolothumtho@nvidia.com>
 <20251031105005.24618-16-skolothumtho@nvidia.com>
 <318947de-4467-4ced-a5d2-929e3df210ef@redhat.com>
 <CH3PR12MB754815B9B902E7EF66B0A1B9ABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <85f315a2-e49a-4330-9419-48a8a3a4a3e3@redhat.com>
 <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754844745DF256D7FF2CB07AABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gXcJ74_1bgLsn34D4E93CyUBxmxvhINo0NdwLUP6300_1762272120
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.788,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 11/4/25 4:14 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 04 November 2025 14:44
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
>> get_msi_address_space() callback
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 11/4/25 3:37 PM, Shameer Kolothum wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 04 November 2025 14:12
>>>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>>>> arm@nongnu.org; qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>>>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>>>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>>>> smostafa@google.com; wangzhou1@hisilicon.com;
>>>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>>>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>>>> Krishnakant Jaju <kjaju@nvidia.com>
>>>> Subject: Re: [PATCH v5 15/32] hw/pci/pci: Introduce optional
>>>> get_msi_address_space() callback
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Shameer, Nicolin,
>>>>
>>>> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>>>>> On ARM, devices behind an IOMMU have their MSI doorbell addresses
>>>>> translated by the IOMMU. In nested mode, this translation happens in
>>>>> two stages (gIOVA → gPA → ITS page).
>>>>>
>>>>> In accelerated SMMUv3 mode, both stages are handled by hardware, so
>>>>> get_address_space() returns the system address space so that VFIO
>>>>> can setup stage-2 mappings for system address space.
>>>> Sorry but I still don't catch the above. Can you explain (most probably
>>>> again) why this is a requirement to return the system as so that VFIO
>>>> can setup stage-2 mappings for system address space. I am sorry for
>>>> insisting (at the risk of being stubborn or dumb) but I fail to
>>>> understand the requirement. As far as I remember the way I integrated it
>>>> at the old times did not require that change:
>>>> https://lore.kernel.org/all/20210411120912.15770-1-
>>>> eric.auger@redhat.com/
>>>> I used a vfio_prereg_listener to force the S2 mapping.
>>> Yes I remember that.
>>>
>>>> What has changed that forces us now to have this gym
>>> This approach achieves the same outcome, but through a
>>> different mechanism. Returning the system address space
>>> here ensures that VFIO sets up the Stage-2 mappings for
>>> devices behind the accelerated SMMUv3.
>>>
>>> I think, this makes sense because, in the accelerated case, the
>>> device is no longer managed by QEMU’s SMMUv3 model. The
>> On the other hand, as we discussed on v4 by returning system as you
>> pretend there is no translation in place which is not true. Now we use
>> an alias for it but it has not really removed its usage. Also it forces
>> use to hack around the MSI mapping and introduce new PCIIOMMUOps.
>> Have
>> you assessed the feasability of using vfio_prereg_listener to force the
>> S2 mapping. Is it simply not relevant anymore or could it be used also
>> with the iommufd be integration? Eric
> IIUC, the prereg_listener mechanism just enables us to setup the s2
> mappings. For MSI, In your version, I see that smmu_find_add_as()
> always returns IOMMU as. How is that supposed to work if the Guest
> has s1 bypass mode STE for the device?

I need to delve into it again as I forgot the details. Will come back to
you ...

Eric
>
> Thanks,
> Shameer
>
>


