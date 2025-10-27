Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEAECCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDNwC-000222-TI; Mon, 27 Oct 2025 10:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNw9-00021S-FX
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:11:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNw3-00036X-AW
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761574248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yf1l1mcFurb3xeUN/ct7dLCgFOHzBGDvmzN/RLcixfs=;
 b=E0hyVkJXTHaYHWJlv6XefmjqJCvreAAApKns2Xq8gGY1n0KFKEoUFdFQVbdSU7S2RLmnDR
 SI1LE97fAVAo6gKdaXfdPuvPdvCfg6nbLyLx8DKtbaxE0H2OYQR57Novts9w6Uux//jXV8
 2/fcf2TGvBPKaTda8rybFZ1scpmW11Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-B1HxYUyYMdy3dECJALbzkw-1; Mon, 27 Oct 2025 10:10:47 -0400
X-MC-Unique: B1HxYUyYMdy3dECJALbzkw-1
X-Mimecast-MFC-AGG-ID: B1HxYUyYMdy3dECJALbzkw_1761574246
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4770be47bfcso4984845e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761574246; x=1762179046;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yf1l1mcFurb3xeUN/ct7dLCgFOHzBGDvmzN/RLcixfs=;
 b=OPpTGNyg1xy1zDRQrsesNp+BsC9xheLpEPBs4HNTvs2J0tg/6tM5stQl++S3fltCPl
 gn8pPNq7kq3jIqHSNoVhEITOTblo2DS7Uu8gxxvYyHced+5i2PdJro/FOVHlwhQ7FuY1
 iVYIeYkug0SzIeKpAwMKo35pXIsLINF/v5GOB9Ql+1jbr1AGWw5gaBYqsCNhjQOCbREC
 4QF4+YMZ5zE3yL0ZJegDLnuexxAMpuG8/Fp4EUnMAp7879lULX+TKGhzc374nMwiMx4s
 GtS1KLZPmbs6RvFeV63jw3RtnL5Y6oztP+lEQBlfTzt1H2qREtHBkvfFf/eCNHIybTtP
 bqNg==
X-Gm-Message-State: AOJu0Yy3MmF8JyTB8AOs2XHU3jkqAP5rBWA6283s8HnvxqVkCuf1RhJM
 D68PxiuAWj8Z+Lx7GHLsHvKt/ursP8cQwmQeh14uCYc9wSEf6/BMCYbr68ee2waR7S5i1Kr4RTq
 kaGsf/1b3/T8/ywaIBQ/tpGPzI9zD+eg6ixVy2B6pGmjqJbudjyIrmA==
X-Gm-Gg: ASbGncvQmrSJEQItKTTMkFSnJ7dqluLlour49Kvbzt+6G1LAEfjbVj4vFyN4BliRaNR
 CF+KI8oyej3qDYLM6IFuNMc9aN9pJbjSFpSzWmg0IoMelDPZf2YDgfpwzHiRzVu75bHSADHiAGB
 oI2oa6oZ/h39ib26Zt7irfHHF+vsZWLC8Q7uD8y5T40F9qrVpcE6p6SiCl2wVRj8SLxuZNHJNSl
 q2+Gv1EJ1b5FQZNYtXuUnwbzvb88kpW698g4V9ULkiVPDc0zMfhljx1vEO1rGjrDHZoKkdgKTpl
 iujknpBRrM0FnkmaTyRsYcLfTYbIKNq37BToUBMezDweFtChY5l30wGFHGkgO2L47bZ+WDkbqQC
 LqGSdoDodk8ICbFVPhKfeTTBOvtbRFQpqkRbKamok4PJCRQ==
X-Received: by 2002:a05:600c:4f81:b0:475:dd9d:297b with SMTP id
 5b1f17b1804b1-475dd9d29bamr60957035e9.33.1761574246228; 
 Mon, 27 Oct 2025 07:10:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3SqSLyo1/s8LqFWmTXeRXvZfKYGXeEhhZl3IzgS5MYitrxROYcZW4vVJ1esvxNhMghPMeLA==
X-Received: by 2002:a05:600c:4f81:b0:475:dd9d:297b with SMTP id
 5b1f17b1804b1-475dd9d29bamr60956555e9.33.1761574245714; 
 Mon, 27 Oct 2025 07:10:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02cd6dsm143039245e9.2.2025.10.27.07.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:10:45 -0700 (PDT)
Message-ID: <6a64b4a6-1913-4ed8-9c28-b567679f25ad@redhat.com>
Date: Mon, 27 Oct 2025 15:10:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/27] hw/arm/smmuv3-accel: Add set/unset_iommu_device
 callback
To: Shameer Kolothum <skolothumtho@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Jason Gunthorpe <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
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
 <20250929133643.38961-9-skolothumtho@nvidia.com>
 <7167d287-f0d0-4bb8-8750-e38e9e31df10@redhat.com>
 <CH3PR12MB7548C5CB7B9BE18AAE5492BEABE7A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <aN6r4n2F1s2ZLm9d@Asurada-Nvidia>
 <IA0PR12MB7555B6D390BC37EE85BF6D42ABFCA@IA0PR12MB7555.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <IA0PR12MB7555B6D390BC37EE85BF6D42ABFCA@IA0PR12MB7555.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6Ko4JbZK5GkbF6IvGT10QlB_eKPrEz7e0t2IE_1XETo_1761574246
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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



On 10/27/25 12:56 PM, Shameer Kolothum wrote:
> Hi Eric,
>
> Based on further off-list discussions, this needs some clarification.
>
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: 02 October 2025 17:44
>> To: Shameer Kolothum <skolothumtho@nvidia.com>
>> Cc: eric.auger@redhat.com; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; peter.maydell@linaro.org; Jason Gunthorpe
>> <jgg@nvidia.com>; ddutile@redhat.com; berrange@redhat.com; Nathan
>> Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 08/27] hw/arm/smmuv3-accel: Add
>> set/unset_iommu_device callback
> [..]
>
>> There are a couple of things going on here:
>> 1) We should not attach directly to the S2 HWPT that eventually
>>    will be shared across vSMMU instances. In other word, an S2
>>    HWPT will not be attachable for lacking of its tie to an SMMU
>>    instance and not having a VMID at all. Instead, each vIOMMU
>>    object allocated using this S2 HWPT will hold the VMID.
> The above statement is not 100% correct as per the current kernel
> and QEMU implementation. At present, VFIO core allocates an s2
> HWPT when IOMMU_HWPT_ALLOC_NEST_PARENT flag is set and
> attaches to it. 
>
> In the set_iommu_device () path, we use this s2 HWPT id to create a 
> vIOMMU and pre-allocate bypass and abort IOMMU_DOMAIN_NESTED
> HWPTs, which are ready to be attached if required.
those are s1 ones (bypass and abort) , right?
>
> On unset_iommu_device() path, we attach back to the s2 HWPT as it
> does today.
OK
>  
>> 2) A device cannot attach to a vIOMMU directly but has to attach
>>    through a proxy nested HWPT (IOMMU_DOMAIN_NESTED). To attach
>>    to an IOMMU_DOMAIN_NESTED, a vDEVICE must be allocated with a
>>    given vSID.
> Also, it became clear that we need to relax the above restriction and allow
> attaching proxy nested HWPTs without requiring a vDEVICE. This is necessary
> to handle cases where the SMMUv3 operates in global bypass or abort modes,
> as controlled by the GBPA register, which do not have any associated devices.
>
> Please see Nicolin’s kernel patch [0] that introduces this relaxation.
>
> I’ve updated this QEMU series accordingly. SMMUv3 GBPA based HWPT will
> now be attached during both reset() and GBPA update paths.

OK

Thank you for the update

Eric
>
> The commit log and documentation will also be updated to reflect above
> change.
>
> Thanks,
> Shameer
> [0] https://lore.kernel.org/linux-iommu/20251024040551.1711281-1-nicolinc@nvidia.com/


