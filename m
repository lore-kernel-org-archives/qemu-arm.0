Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF3FCCF9E3
	for <qemu-arm@archiver.kernel.org>; Tue,  4 Nov 2025 13:30:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vGH7E-0007LG-FF; Tue, 04 Nov 2025 08:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGH7B-0007KT-4s
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 08:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vGH78-0006tY-L2
 for qemu-arm@nongnu.org; Tue, 04 Nov 2025 08:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762263021;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQMpFI1rvT0VsnOfwmarg5zR4Dxv/jlNvuXJjZnei8Y=;
 b=MjG9FhU0RCF3aMNhtMmLekFEZghspUSQNlpCfR5ciP3KsFfw7WWSi2AncFLqDVXSvjYMDP
 fPnX44qJWwhQsrvuh7I8PqUeA3jKbQMK+B4X5GvG95FvTviHvsz5r7NIVPhCSFMxAuhtZb
 mdly7sY3jF5krIiJF8B/JOfZfyekXwc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-KKW5xTdzNsC0EZDm4w2scw-1; Tue, 04 Nov 2025 08:30:20 -0500
X-MC-Unique: KKW5xTdzNsC0EZDm4w2scw-1
X-Mimecast-MFC-AGG-ID: KKW5xTdzNsC0EZDm4w2scw_1762263019
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4774836c376so16696865e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Nov 2025 05:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762263019; x=1762867819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JQMpFI1rvT0VsnOfwmarg5zR4Dxv/jlNvuXJjZnei8Y=;
 b=fALKPi60JuHvLYSiyeK6QHI0q+G9WMq8bQQclOsvAJ45/i0yIsnxhyXU8Ce6A9lK5l
 KRyMlvX0VNdPL/TUf5RTiMWIlkTvldphXObEIgFV+eNJigDKdKXS31Z6NUMzR5U52Ek7
 sKOIikKBn4mqIpeQDlPDvCk22UFFullgCXOvsFof4oTasH6D7Ms7CP7jXJFe57O7wT/b
 DMrEWcGkVMHf8rU9wYzJuhLnknlb056RaWeizuN6guKY8wFJchWa+s0AYlurGR7u3WlL
 dWKHNIOrOPdg8/gAf3MF5BbDj5jwCkuK/utn46CLMzxLt2k3i1kUsWeUP082B2qnZd3D
 SjQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM/8QYee/PvgH1U4FxV8nIJTa3egRFguynGwqvQWC9kJMNo5xLsxGQGDmq4TwBTV1ih9kqA3cTwA==@nongnu.org
X-Gm-Message-State: AOJu0Yya5E9gpzwMhwyh5kxNNRjxBWJDhuAEfAzwMfvpsujCMWnLiI8x
 uwwNtiG9XICYbedpI5cm9QsWe36vk2GYLzbZaXgQwvyOrEFAdw5eQ1lRk6rnoH+2sSrSZK+E8uF
 3W+lBbLW0jj0UJa4gEAa8ni+Pi/7SILNb7IVrtDCwwV8aFzc3CCpoxA==
X-Gm-Gg: ASbGncvC3Ccl2TLOXEZHjJDM9YwFyIaSBpjWUeb/Mc0MtoNBnkx3uvqWq3ot8ecSeTO
 cpTmOeW/3trdnVidyFwzMexileowq95RAxbfbZ6ig7o6eaSaGV/2gtYrHWa/H5fVdhMC3LEt1Qz
 Xwxs30LsO6+/JD2r50M87cmp6rLSZbJp6wbrXwffU8vT8K2p7dWnoIHNCJZA0JwhuJpl6liLEGn
 mWqsKOyAMCokmdDcKdUW2kw17iok425arcGLW+3Xky0qECHEgJRQ/FEPn4ShKhs0qFwp5lMH/Aq
 BEHe2etSo1jIC1kEVaMq43s/ugxsEpVns8n0ceBoL06Z8lvJF9iaM7wVkenXIBukBn7FFaltWzW
 059XOoZ8tdyIqpJH5pMCBH3ESIQ9dWzWONd/uB0uLyaStLg==
X-Received: by 2002:a05:6000:25c7:b0:428:4b76:c8cd with SMTP id
 ffacd0b85a97d-429bd6faf24mr14805389f8f.62.1762263019428; 
 Tue, 04 Nov 2025 05:30:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbfgs89karEmbF53UeRNZpKgdpIcoxZXL7bpXCVh+zcc6LshRSM8JJ4QRE+sNUcQgRDBowjg==
X-Received: by 2002:a05:6000:25c7:b0:428:4b76:c8cd with SMTP id
 ffacd0b85a97d-429bd6faf24mr14805337f8f.62.1762263018852; 
 Tue, 04 Nov 2025 05:30:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429dc1f5b93sm4481252f8f.27.2025.11.04.05.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 05:30:17 -0800 (PST)
Message-ID: <e9346763-0df0-4495-9d20-4cf15cfa1124@redhat.com>
Date: Tue, 4 Nov 2025 14:30:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/32] hw/arm/smmuv3-accel: Add nested vSTE
 install/uninstall support
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
 <20251031105005.24618-14-skolothumtho@nvidia.com>
 <987614d8-de6b-4cb5-b5a8-1723e24502f3@redhat.com>
 <CH3PR12MB7548B864AF133DEFFCFCBB2BABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB7548B864AF133DEFFCFCBB2BABC4A@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JEq3Lw3LJ9qw9dicYzVtj_-SuZn9KwwuITa4_ANRkyE_1762263019
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



On 11/4/25 1:26 PM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 04 November 2025 11:06
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> Krishnakant Jaju <kjaju@nvidia.com>
>> Subject: Re: [PATCH v5 13/32] hw/arm/smmuv3-accel: Add nested vSTE
>> install/uninstall support
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 10/31/25 11:49 AM, Shameer Kolothum wrote:
>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>
>>> A device placed behind a vSMMU instance must have corresponding vSTEs
>>> (bypass, abort, or translate) installed. The bypass and abort proxy
>>> nested HWPTs are pre-allocated.
>>>
>>> For translat HWPT, a vDEVICE object is allocated and associated with
>>> the vIOMMU for each guest device. This allows the host kernel to
>>> establish a virtual SID to physical SID mapping, which is required for
>>> handling invalidations and event reporting.
>>>
>>> An translate HWPT is allocated based on the guest STE configuration
>>> and attached to the device when the guest issues SMMU_CMD_CFGI_STE or
>>> SMMU_CMD_CFGI_STE_RANGE, provided the STE enables S1 translation.
>>>
>>> If the guest STE is invalid or S1 translation is disabled, the device
>>> is attached to one of the pre-allocated ABORT or BYPASS HWPTs instead.
>>>
>>> While at it, export both smmu_find_ste() and smmuv3_flush_config() for
>>> use here.
>>>
>>> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/smmuv3-accel.c    | 193
>> +++++++++++++++++++++++++++++++++++++++
>>>  hw/arm/smmuv3-accel.h    |  23 +++++
>>>  hw/arm/smmuv3-internal.h |  20 ++++
>>>  hw/arm/smmuv3.c          |  18 +++-
>>>  hw/arm/trace-events      |   2 +
>>>  5 files changed, 253 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c index
>>> d4d65299a8..c74e95a0ea 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -28,6 +28,191 @@ MemoryRegion root;  MemoryRegion sysmem;
>> static
>>> AddressSpace *shared_as_sysmem;
>>>
>>> +static bool
>>> +smmuv3_accel_alloc_vdev(SMMUv3AccelDevice *accel_dev, int sid, Error
>>> +**errp) {
>>> +    SMMUViommu *vsmmu = accel_dev->vsmmu;
>>> +    IOMMUFDVdev *vdev;
>>> +    uint32_t vdevice_id;
>>> +
>>> +    if (!accel_dev->idev || accel_dev->vdev) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (!iommufd_backend_alloc_vdev(vsmmu->iommufd, accel_dev->idev-
>>> devid,
>>> +                                    vsmmu->viommu.viommu_id, sid,
>>> +                                    &vdevice_id, errp)) {
>>> +            return false;
>>> +    }
>>> +    if (!host_iommu_device_iommufd_attach_hwpt(accel_dev->idev,
>>> +                                               vsmmu->bypass_hwpt_id, errp)) {
>>> +        iommufd_backend_free_id(vsmmu->iommufd, vdevice_id);
>>> +        return false;
>>> +    }
>>> +
>>> +    vdev = g_new(IOMMUFDVdev, 1);
>>> +    vdev->vdevice_id = vdevice_id;
>>> +    vdev->virt_id = sid;
>>> +    accel_dev->vdev = vdev;
>>> +    return true;
>>> +}
>>> +
>>> +static bool
>>> +smmuv3_accel_dev_uninstall_nested_ste(SMMUv3AccelDevice *accel_dev,
>> bool abort,
>>> +                                      Error **errp)+{
>>> +    HostIOMMUDeviceIOMMUFD *idev = accel_dev->idev;
>>> +    SMMUS1Hwpt *s1_hwpt = accel_dev->s1_hwpt;
>>> +    uint32_t hwpt_id;
>>> +
>>> +    if (!s1_hwpt || !accel_dev->vsmmu) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (abort) {
>>> +        hwpt_id = accel_dev->vsmmu->abort_hwpt_id;
>>> +    } else {
>>> +        hwpt_id = accel_dev->vsmmu->bypass_hwpt_id;
>>> +    }
>>> +
>>> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, hwpt_id, errp)) {
>>> +        return false;
>>> +    }
>>> +    trace_smmuv3_accel_uninstall_nested_ste(smmu_get_sid(&accel_dev-
>>> sdev),
>>> +                                            abort ? "abort" : "bypass",
>>> +                                            hwpt_id);
>>> +
>>> +    iommufd_backend_free_id(s1_hwpt->iommufd, s1_hwpt->hwpt_id);
>>> +    accel_dev->s1_hwpt = NULL;
>>> +    g_free(s1_hwpt);
>>> +    return true;
>>> +}
>>> +
>>> +static bool
>>> +smmuv3_accel_dev_install_nested_ste(SMMUv3AccelDevice *accel_dev,
>>> +                                    uint32_t data_type, uint32_t data_len,
>>> +                                    void *data, Error **errp)
>> the name is very close to the caller function, ie.
>> smmuv3_accel_install_nested_ste which also takes a sdev.
>> I would rename to smmuv3_accel_install_hwpt() or something alike
> This one is going to change a bit based on Nicolin's feedback on taking 
> care of SMMUEN/GBPA values.
> https://lore.kernel.org/all/aQVLzfaxxSfw1HBL@Asurada-Nvidia/

OK
>
> Probably smmuv3_accel_attach_nested_hwpt() suits better considering
> that’s what it finally ends up doing.
>
>>> +{
>>> +    SMMUViommu *vsmmu = accel_dev->vsmmu;
>>> +    SMMUS1Hwpt *s1_hwpt = accel_dev->s1_hwpt;
>>> +    HostIOMMUDeviceIOMMUFD *idev = accel_dev->idev;
>>> +    uint32_t flags = 0;
>>> +
>>> +    if (!idev || !vsmmu) {
>>> +        error_setg(errp, "Device 0x%x has no associated IOMMU dev or
>> vIOMMU",
>>> +                   smmu_get_sid(&accel_dev->sdev));
>>> +        return false;
>>> +    }
>>> +
>>> +    if (s1_hwpt) {
>>> +        if (!smmuv3_accel_dev_uninstall_nested_ste(accel_dev, true, errp)) {
>>> +            return false;
>>> +        }
>>> +    }
>>> +
>>> +    s1_hwpt = g_new0(SMMUS1Hwpt, 1);
>>> +    s1_hwpt->iommufd = idev->iommufd;
>>> +    if (!iommufd_backend_alloc_hwpt(idev->iommufd, idev->devid,
>>> +                                    vsmmu->viommu.viommu_id, flags,
>>> +                                    data_type, data_len, data,
>>> +                                    &s1_hwpt->hwpt_id, errp)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    if (!host_iommu_device_iommufd_attach_hwpt(idev, s1_hwpt-
>>> hwpt_id, errp)) {
>>> +        iommufd_backend_free_id(idev->iommufd, s1_hwpt->hwpt_id);
>>> +        return false;
>>> +    }
>>> +    accel_dev->s1_hwpt = s1_hwpt;
>>> +    return true;
>>> +}
>>> +
>>> +bool
>>> +smmuv3_accel_install_nested_ste(SMMUv3State *s, SMMUDevice *sdev,
>> int sid,
>>> +                                Error **errp) {
>>> +    SMMUv3AccelDevice *accel_dev;
>>> +    SMMUEventInfo event = {.type = SMMU_EVT_NONE, .sid = sid,
>>> +                           .inval_ste_allowed = true};
>>> +    struct iommu_hwpt_arm_smmuv3 nested_data = {};
>>> +    uint64_t ste_0, ste_1;
>>> +    uint32_t config;
>>> +    STE ste;
>>> +    int ret;
>>> +
>>> +    if (!s->accel) {
>> don't you want to check !s->vsmmu as well done in
>> smmuv3_accel_install_nested_ste_range()
> Nicolin has a suggestion to merge struct SMMUViommu and
> SMMUv3AccelState into one and avoid the extra layering. I will
> attempt that and all these checking might change as a result.

interesting idea indeed.
>
>>> +        return true;
>>> +    }
>>> +
>>> +    accel_dev = container_of(sdev, SMMUv3AccelDevice, sdev);
>>> +    if (!accel_dev->vsmmu) {
>>> +        return true;
>>> +    }
>>> +
>>> +    if (!smmuv3_accel_alloc_vdev(accel_dev, sid, errp)) {
>>> +        return false;
>>> +    }
>>> +
>>> +    ret = smmu_find_ste(sdev->smmu, sid, &ste, &event);
>>> +    if (ret) {
>>> +        error_setg(errp, "Failed to find STE for Device 0x%x", sid);
>>> +        return true;
>> returning true while setting errp looks wrong to me.
> Right, will just return true from here. I am not sure under what circumstances
> we will hit here though.
>
>> +    }
>> +
>> +    config = STE_CONFIG(&ste);
>> +    if (!STE_VALID(&ste) || !STE_CFG_S1_ENABLED(config)) {
>> +        if (!smmuv3_accel_dev_uninstall_nested_ste(accel_dev,
>> +                                                   STE_CFG_ABORT(config),
>> +                                                   errp)) {
>> +            return false;
>> +        }
>> +        smmuv3_flush_config(sdev);
>> +        return true;
>> +    }
>> +
>> +    ste_0 = (uint64_t)ste.word[0] | (uint64_t)ste.word[1] << 32;
>> +    ste_1 = (uint64_t)ste.word[2] | (uint64_t)ste.word[3] << 32;
>> +    nested_data.ste[0] = cpu_to_le64(ste_0 & STE0_MASK);
>> +    nested_data.ste[1] = cpu_to_le64(ste_1 & STE1_MASK);
>> +
>> +    if (!smmuv3_accel_dev_install_nested_ste(accel_dev,
>> +                                             IOMMU_HWPT_DATA_ARM_SMMUV3,
>> +                                             sizeof(nested_data),
>> +                                             &nested_data, errp)) {
>> +        error_append_hint(errp, "Unable to install sid=0x%x nested STE="
>> +                          "0x%"PRIx64":=0x%"PRIx64"", sid,
> nit: why ":=" between both 64b?
>> +                          (uint64_t)le64_to_cpu(nested_data.ste[1]),
>> +                          (uint64_t)le64_to_cpu(nested_data.ste[0]));
>> +        return false;
> in case of various failure cases, do we need to free the vdev?
>
> I don't think we need to fee the vdev corresponding to this vSID on failures
> here. I think the association between vSID and host SID can remain
> intact even if the nested HWPT alloc/attach fails for whatever reason.

OK then worth a comment

Eric
>
> Thanks,
> Shameer


