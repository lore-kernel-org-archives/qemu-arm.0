Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A8BEA813A
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 16:01:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpqBG-0001Uf-Qv; Tue, 10 Feb 2026 11:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vpqBF-0001UN-Jn
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 11:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vpqBD-0006Ym-Vv
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 11:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770739295;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX1FfvGUqj0Obv8a5Pl1RjMyLWiLnvD7U1LpzfPXPCw=;
 b=ivzwJv05+dTEGwJbd16lPG0uJvXI0adGhOX2NmWpVdpVt8bWewMGGG+nYUjtSGYr3b/JS4
 X5eq6wciyluFXcLoXYio/ODonjyPKPmt4iQ6tSe4nih6ji6NNjuvrzfG8Nl90E4IWc3wTY
 8vVldWseoc/3E4r1VD9R27+QU82dDt8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-REkF5KCsNj6jLODYRA0q-g-1; Tue, 10 Feb 2026 11:01:33 -0500
X-MC-Unique: REkF5KCsNj6jLODYRA0q-g-1
X-Mimecast-MFC-AGG-ID: REkF5KCsNj6jLODYRA0q-g_1770739292
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-48057c39931so52576195e9.0
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 08:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739292; x=1771344092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XX1FfvGUqj0Obv8a5Pl1RjMyLWiLnvD7U1LpzfPXPCw=;
 b=AgSSZ6jdpCIxoKVOQw2KwcTvXCxjU+V1xwlpVtKtiYWZwL51I/2RqFm1T67RVKc3x0
 iuuBiZhs6chYBfcR+ySwq416tyiZOIUQwAwJfnfxs7Q+Db4ybwII9oIG+eimqf3RZskS
 FA1Zqrfo/s74L6xp9wT9mjnNRyVxDRq/cdSS8zhRi+qfMEe6X4p5hN+5tJh03FxMlwNT
 Js/QMBC9S56skKYtED3CdvFPfXWghFpSOepk8oaxowaFMPSVKVRTdnqMiMQ6w0ScK4k9
 ly6HB9ZMUGwZTLjAn5gSF5J1DkdA56K8ZAKEHLdfjy4DwVU1P6tzYe/QMfGAMr5qRqbv
 CHug==
X-Gm-Message-State: AOJu0YxIHJPPdwdoLNqdf0tXcJHOANsmYtUgb1HnFgAEpl8Wqb9G9U1n
 kWciI/F71wB57IKsOpzADVnmkh4Wrw68goMgXAHcIeOrC5LK9uxvRLOggNBw1CrYoJKSaQFog9j
 NWymsUBbRKV+QV8f8m4P+SGqkPV87hhZeo9uKtc1npUQ4EA7jjK2GTQ==
X-Gm-Gg: AZuq6aKZ+fbGrAoWE5n2eM7C8RoG76OHKnLN/yw0rHvswY/p1xWJCp+67StD/EUPqEc
 uB7B121M2/q4/IouBDt/Qg9BVL8jNFIaXIVtdBp1OaXH2LVNWUZ50t58WUpCxQJc0pXpSf9clMS
 yItNIa0gFS4knsMMBLJrASwMqw+TStjQ1w9pxGAo3zv1iu/iEti5QnhBYDj/uxczS25mcy0k57Y
 WmYKg3qbqD9rRHoSFI8DO1r3cjqL/HrLcCH3Baii99eckMJfcwxbPM5Im0As7wwooPEOcNRq+gv
 qd8YsQ8UyzbAIvWLj2q7FUcnVRdciQx8m26oDl2h8jwqV3LPU3d2lfkE9iQ4DfCL2fck9zdJpSH
 hJ1Q2O/oTviGD438B/QGA4pm0RScSp6IHSxqg7A2devOntyN6kDSdQ8QyBpqbfwZQBfWh9Q==
X-Received: by 2002:a05:600c:46d5:b0:480:1a3a:5ce6 with SMTP id
 5b1f17b1804b1-483201e4bcamr212476375e9.14.1770739290698; 
 Tue, 10 Feb 2026 08:01:30 -0800 (PST)
X-Received: by 2002:a05:600c:46d5:b0:480:1a3a:5ce6 with SMTP id
 5b1f17b1804b1-483201e4bcamr212475725e9.14.1770739290145; 
 Tue, 10 Feb 2026 08:01:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e64b0sm83195635e9.11.2026.02.10.08.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 08:01:29 -0800 (PST)
Message-ID: <03282286-c99e-467b-8192-695d973ea656@redhat.com>
Date: Tue, 10 Feb 2026 17:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 31/37] hw/arm/smmuv3-accel: Add property to specify OAS
 bits
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Nicolin Chen <nicolinc@nvidia.com>, "ddutile@redhat.com"
 <ddutile@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>
References: <20260126104342.253965-1-skolothumtho@nvidia.com>
 <20260126104342.253965-32-skolothumtho@nvidia.com>
 <d9192ae6-a94f-479a-b19f-734cc52a6be0@redhat.com>
 <CH3PR12MB754867E986856DC7718D4051AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20260202151917.GO2223369@nvidia.com>
 <CH3PR12MB754835BE4A5C54387122504AAB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <20260202160000.GR2223369@nvidia.com>
 <CH3PR12MB7548DFE7F7CE555A3B3BF947AB9AA@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CH3PR12MB7548515EDA96BD03F64DCAA2AB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548515EDA96BD03F64DCAA2AB62A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XzPDOwL0jCWO94Th1prdwXjGfGM-fXkG25zpSnW3Ihs_1770739292
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

Hi Shameer,
On 2/10/26 4:12 PM, Shameer Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Shameer Kolothum Thodi
>> Sent: 02 February 2026 16:04
>> To: Jason Gunthorpe <jgg@nvidia.com>
>> Cc: eric.auger@redhat.com; qemu-arm@nongnu.org; qemu-
>> devel@nongnu.org; peter.maydell@linaro.org; Nicolin Chen
>> <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> clg@redhat.com; alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>;
>> Matt Ochs <mochs@nvidia.com>; smostafa@google.com;
>> wangzhou1@hisilicon.com; jiangkunkun@huawei.com;
>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>> zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>
>> Subject: RE: [PATCH v9 31/37] hw/arm/smmuv3-accel: Add property to
>> specify OAS bits
>>
>>
>>
>>> -----Original Message-----
>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>> Sent: 02 February 2026 16:00
>>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>
>>> Cc: eric.auger@redhat.com; qemu-arm@nongnu.org; qemu-
>>> devel@nongnu.org; peter.maydell@linaro.org; Nicolin Chen
>>> <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>>> clg@redhat.com; alex@shazbot.org; Nathan Chen <nathanc@nvidia.com>;
>>> Matt Ochs <mochs@nvidia.com>; smostafa@google.com;
>>> wangzhou1@hisilicon.com; jiangkunkun@huawei.com;
>>> jonathan.cameron@huawei.com; zhangfei.gao@linaro.org;
>>> zhenzhong.duan@intel.com; yi.l.liu@intel.com; Krishnakant Jaju
>>> <kjaju@nvidia.com>
>>> Subject: Re: [PATCH v9 31/37] hw/arm/smmuv3-accel: Add property to
>>> specify OAS bits
>>>
>>> On Mon, Feb 02, 2026 at 03:38:50PM +0000, Shameer Kolothum Thodi
>>> wrote:
>>>
>>>>> We can treat ATS as a per-PCIe device property.. I think it would
>>>>> be fine to tell the SMMU that it always has ATS support, it will
>>>>> never do anything with it unless it sees a PCIe device with an ATS
>>>>> cap, and the physical STE generated by the hypervisor should sanitize the
>> EATS.
>>>>> BIOS overriding it should be reflected as the devices being
>>>>> reported as not supporting ATS, qemu should have a per-device flag
>>>>> to disable ATS.
>>>> Do we have way to detect that(IOMMU_FWSPEC_PCI_RC_ATS) from
>>>> userspace now?
>>> I don't think so.. I was describing how I suspect that should work.
>>>
>>> The iommu driver is the only entity that decides if ATS should be
>>> enabled per-device, so it should report back to userspace in iommufd
>>> if the device is allowed to enable ATS or not. That should roll up any
>>> FW overrides and the PCI cap block.
>> Right. May be just like the out_max_pasid_log2. Will take a look.
> Looking at adding the ATS detection support through iommufd, one
> idea is to extend the enum iommufd_hw_capabilities with
> IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED. The question I have
> now is whether we need to differentiate an old kernel which doesn't
> have this support or not.
>
> This is how the usage would look with an added "ats" property on the
> vfio-pci device:
>
> -device vfio-pci,...,ats=on
>     if ATS_NOT_SUPPORTED then reject
How do you distinguish an old kernel which is not capable of returning
the cap info from a new kernel that effectively returns the capability
is not supported.
> -device vfio-pci,...,ats=off
>     keep ATS off
> -device vfio-pci,...,ats=auto (default)
>    if ATS_NOT_SUPPORTED, disable ATS
>     otherwise, enable ATS if the PCIe ATS capability is present

I am not sure how it works with an old kernel. auto or on would keep
ATS=off while it is currently set today, no?

Thanks

Eric
>     (this also covers behaviour on older kernels)
>
> Does the above make sense?
>
> Thanks,
> Shameer
>


