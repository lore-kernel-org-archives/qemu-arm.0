Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B58ECCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 14:06:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDNrG-0000a4-Vk; Mon, 27 Oct 2025 10:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNqw-0000X5-67
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDNqj-0002Ao-FU
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 10:05:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761573923;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSQRCj4KaPGs7uorAnGS8HDOdi8ZFHjPriteS/dBpXA=;
 b=Jcb9QqFnJILSykZNWwLyNl1gCInUmHjtynqK9XZ5AqCTLwBdWmb6OLR5tBH+yVVlIRdi0D
 iKoNVOuOxEV6IjAEUjRFvAJ2KcGR1xOIpoXuGJBG3QUEWvIGBhqwRtlMFD673Ueuztaybk
 akfcl5EGVSbcWWUTL2IZYAwuypkCGlw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-Wu5JvPMrPhi94WCF87oilw-1; Mon, 27 Oct 2025 10:05:22 -0400
X-MC-Unique: Wu5JvPMrPhi94WCF87oilw-1
X-Mimecast-MFC-AGG-ID: Wu5JvPMrPhi94WCF87oilw_1761573920
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-475de0566adso21369925e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 07:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761573920; x=1762178720;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WSQRCj4KaPGs7uorAnGS8HDOdi8ZFHjPriteS/dBpXA=;
 b=NPWKaiWRG3/7uHGa9bFKy8NBtQEZ71kOWM8QWO6Daq9CuIH5O7aSnFBnlkfY2bvjsM
 XkhlimXRHfhVTNHtcBuPKyfcti6YdYUB3sUZLX/2k8E7mkVLSMclgK76RCKPKYGwvuzE
 dYcNInj7oU30HhejphCT3gDndy/RjFDQqhrVtL63DG4y2gRlN+us6hXWljqWzrGSoPJY
 CQriiFTKL5DyZEPgCS9jda38OxXD0QrQBciDO9/lSBLDwCcCXIlRnviEQdcUmPgZ7k6i
 yWa3LlcLkqAwJioKdKuaQ4U2rR/AIacwLNlddrTS4mwU58wvu576XSBObra9iyAjDEjf
 j/0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJNkr5i9UBaZfXO5dCxzrd4gr3EHYrcRXPYMM3VVo/LvwAxxuztFtz6hXULoYGESDmogiK3bcjzw==@nongnu.org
X-Gm-Message-State: AOJu0YxfcF6Au8cQSACsLdfrNT+u0LRjm7RfgfSHQY+inxF5RTE2zKh8
 tu0+v5FHE4r3AShsXSkXgE8m3ixR7I5O97mke3qZjEYFa+IeM/zAX/MVe8S2hhpBsb0yFXEys00
 KiBND7tE1FJqFlXOL5FGqZq163jE55LVG51juMRI8novL4QFPha7LqQ==
X-Gm-Gg: ASbGncsheb89I40Ixj4Dm4OJCrQ6tRHNzdQYDWAJhnE9apNxXs8CegFWDGCgyfgassR
 K5L9W1zFSUCHP3rWI37j975+cVmnKFvnjUil40unaqtUq5PiS/sbPfoy093GhWdPWyAdJgfOdt8
 DSg7cbMomdy234Vha8tPL48UAa9KzI6Rw+xL0DN0/3aSp4zUBiwo80MOznOfUriWVIszRGfvQcp
 tERFZmsxGubhQ6yPWiHPRTV5O+iLyoM9lX2zAQNYc9Ybg+1Kw8EamsgInwGA3XZCDLBvOXQRgJy
 izVZVU0Eaok3MT0yBmEGrdP/PfVzIGB+CneVnRrRVu5NlG7+9/rFIdnMBOu/9jxO/+rZR5mtDlQ
 WtZI9UhFnyAo9MwhRhBvKy2DseKFJOczjkv9MUGVfpfJUXQ==
X-Received: by 2002:a05:600c:6214:b0:475:dd59:d8da with SMTP id
 5b1f17b1804b1-475dd59dbe1mr68252705e9.40.1761573918599; 
 Mon, 27 Oct 2025 07:05:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9+2VRwhH/3TdstVIqcPufqMlAxK3spqj7uQpKTBIhGFCV4h3E6kq24MpsEiBBtufe0lrDIw==
X-Received: by 2002:a05:600c:6214:b0:475:dd59:d8da with SMTP id
 5b1f17b1804b1-475dd59dbe1mr68251375e9.40.1761573916637; 
 Mon, 27 Oct 2025 07:05:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475ddad455fsm70328895e9.2.2025.10.27.07.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 07:05:16 -0700 (PDT)
Message-ID: <1dff400c-f338-4223-871c-3fd9abd51a26@redhat.com>
Date: Mon, 27 Oct 2025 15:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/27] hw/arm/smmuv3-accel: Add support to issue
 invalidation cmd to host
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
 <20250929133643.38961-14-skolothumtho@nvidia.com>
 <ae832b8b-5f37-41d1-b259-5bff0843eac0@redhat.com>
 <IA0PR12MB7555A43B79F8C8B2B7ED18E1ABFCA@IA0PR12MB7555.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <IA0PR12MB7555A43B79F8C8B2B7ED18E1ABFCA@IA0PR12MB7555.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qxlLQ3BWWb6ZThTfwwhZxDgNNLULvsSkwYGBhvioGYw_1761573920
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/27/25 1:20 PM, Shameer Kolothum wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 27 October 2025 10:14
>> To: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>; Nicolin
>> Chen <nicolinc@nvidia.com>; ddutile@redhat.com; berrange@redhat.com;
>> Nathan Chen <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
>> smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 13/27] hw/arm/smmuv3-accel: Add support to issue
>> invalidation cmd to host
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>> Provide a helper and use that to issue the invalidation cmd to host SMMUv3.
>>> We only issue one cmd at a time for now.
>>>
>>> Support for batching of commands will be added later after analysing
>>> the impact.
>>>
>>> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
>>> ---
>>>  hw/arm/smmuv3-accel.c | 38
>> ++++++++++++++++++++++++++++++++++++++
>>>  hw/arm/smmuv3-accel.h |  8 ++++++++
>>>  hw/arm/smmuv3.c       | 30 ++++++++++++++++++++++++++++++
>>>  3 files changed, 76 insertions(+)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c index
>>> f4e01fba6d..9ad8595ce2 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -218,6 +218,44 @@ bool
>> smmuv3_accel_install_nested_ste_range(SMMUv3State *s, SMMUSIDRange
>> *range,
>>>      return true;
>>>  }
>>>
>>> +/*
>>> + * This issues the invalidation cmd to the host SMMUv3.
>>> + * Note: sdev can be NULL for certain invalidation commands
>>> + * e.g., SMMU_CMD_TLBI_NH_ASID, SMMU_CMD_TLBI_NH_VA etc.
>>> + */
>>> +bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd,
>> SMMUDevice *sdev,
>>> +                                Error **errp) {
>>> +    SMMUv3State *s = ARM_SMMUV3(bs);
>>> +    SMMUv3AccelState *s_accel = s->s_accel;
>>> +    IOMMUFDViommu *viommu_core;
>>> +    uint32_t entry_num = 1;
>>> +
>>> +    if (!s->accel || !s_accel->viommu) {
>> Can you explain/document why !s_accel->viommu is handled as no error?
> !s_accel->viommu basically means there are no vfio-pci devices with iommufd 
> backend.  I will add a comment.
>
>>> +        return true;
>>> +    }
>>> +
>>> +   /*
>>> +    * We may end up here for any emulated PCI bridge or root port type
>> devices.
>>> +    * However, passing invalidation commands with sid (eg: CFGI_CD) to host
>>> +    * SMMUv3 only matters for vfio-pci endpoint devices. Hence check that if
>>> +    * sdev is valid.
>> Only propagate errors to host if the SDEV matches a VFIO devices?
> The vdev is only allocated for a valid idev device. The below !accel_dev->vdev
> checks that.
yes. I was suggesting a rephrasing
>
>>> +    */
>>> +    if (sdev) {
>>> +        SMMUv3AccelDevice *accel_dev = container_of(sdev,
>> SMMUv3AccelDevice,
>>> +                                                    sdev);
>>> +        if (!accel_dev->vdev) {
>>> +            return true;
>>> +        }
>>> +    }
>>> +
>>> +    viommu_core = &s_accel->viommu->core;
>>> +    return iommufd_backend_invalidate_cache(
>>> +                   viommu_core->iommufd, viommu_core->viommu_id,
>>> +                   IOMMU_VIOMMU_INVALIDATE_DATA_ARM_SMMUV3,
>>> +                   sizeof(Cmd), &entry_num, cmd, errp);
>> what shall we do if iommufd_backend_invalidate_cache() succeeds with
>> output entry_num is different from onput one? In current case we have
>> entry_num = 1 so maybe this is not possible but we might leave a comment at
>> least?
> Ok. I will add that to comment.
>
>>> +}
>>> +
>>>  static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs,
>> SMMUPciBus *sbus,
>>>                                                 PCIBus *bus, int
>>> devfn)  { diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
>>> index 6242614c00..3bdba47616 100644
>>> --- a/hw/arm/smmuv3-accel.h
>>> +++ b/hw/arm/smmuv3-accel.h
>>> @@ -46,6 +46,8 @@ bool smmuv3_accel_install_nested_ste(SMMUv3State
>> *s, SMMUDevice *sdev, int sid,
>>>                                       Error **errp);  bool
>>> smmuv3_accel_install_nested_ste_range(SMMUv3State *s,
>> SMMUSIDRange *range,
>>>                                             Error **errp);
>>> +bool smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd,
>> SMMUDevice *sdev,
>>> +                                Error **errp);
>>>  #else
>>>  static inline void smmuv3_accel_init(SMMUv3State *s)  { @@ -62,6
>>> +64,12 @@ smmuv3_accel_install_nested_ste_range(SMMUv3State *s,
>>> SMMUSIDRange *range,  {
>>>      return true;
>>>  }
>>> +static inline bool
>>> +smmuv3_accel_issue_inv_cmd(SMMUv3State *s, void *cmd, SMMUDevice
>> *sdev,
>>> +                           Error **errp) {
>>> +    return true;
>>> +}
>>>  #endif
>>>
>>>  #endif /* HW_ARM_SMMUV3_ACCEL_H */
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c index
>>> 1fd8aaa0c7..3963bdc87f 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -1381,6 +1381,7 @@ static int
>> smmuv3_cmdq_consume(SMMUv3State *s)
>>>          {
>>>              uint32_t sid = CMD_SID(&cmd);
>>>              SMMUDevice *sdev = smmu_find_sdev(bs, sid);
>>> +            Error *local_err = NULL;
>>>
>>>              if (CMD_SSEC(&cmd)) {
>>>                  cmd_error = SMMU_CERROR_ILL; @@ -1393,11 +1394,17 @@
>>> static int smmuv3_cmdq_consume(SMMUv3State *s)
>>>
>>>              trace_smmuv3_cmdq_cfgi_cd(sid);
>>>              smmuv3_flush_config(sdev);
>>> +            if (!smmuv3_accel_issue_inv_cmd(s, &cmd, sdev, &local_err)) {
>>> +                error_report_err(local_err);
>>> +                cmd_error = SMMU_CERROR_ILL;
>>> +                break;
>>> +            }
>>>              break;
>>>          }
>>>          case SMMU_CMD_TLBI_NH_ASID:
>>>          {
>>>              int asid = CMD_ASID(&cmd);
>>> +            Error *local_err = NULL;
>>>              int vmid = -1;
>>>
>>>              if (!STAGE1_SUPPORTED(s)) { @@ -1416,6 +1423,11 @@ static
>>> int smmuv3_cmdq_consume(SMMUv3State *s)
>>>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>>>              smmu_inv_notifiers_all(&s->smmu_state);
>>>              smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
>>> +            if (!smmuv3_accel_issue_inv_cmd(s, &cmd, NULL, &local_err)) {
>>> +                error_report_err(local_err);
>>> +                cmd_error = SMMU_CERROR_ILL;
>>> +                break;
>>> +            }
>>>              break;
>>>          }
>>>          case SMMU_CMD_TLBI_NH_ALL:
>> do we check somewhere that accel mode only applies to stage=1?
> See patch #7. We mandate stage-1 for accel=on case.
Yes. I noticed that later on. thanks

Eric
>
> Thanks,
> Shameer
>


