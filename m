Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626B9CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 15:34:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPMRw-00005Y-Dx; Tue, 19 May 2026 11:33:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPMRh-0008P3-JQ
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wPMRf-0002h5-Kq
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779204802;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9CmurJWHD/yOfGiATVWH6rJ0ebR7zVSRl0aCJVdJMg=;
 b=MxRXX1muBXVNe1pZ/36NKP6sPT998ipns6d7xmihGH2mP398qOFX4R5iJ8OlHDqx1Z7lIE
 fV8HnA5509LtOFrlvZOQw3GVqUbZpLKDbm+JBCdg0zGXEeiHOj/Sc1wg1zhy3mZbdap/RN
 dXJOsF/3Zl7ZBAa/5Vczt9fSU7vqrz4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-fG_4QNC2NQm03ss7UBSnmQ-1; Tue, 19 May 2026 11:33:18 -0400
X-MC-Unique: fG_4QNC2NQm03ss7UBSnmQ-1
X-Mimecast-MFC-AGG-ID: fG_4QNC2NQm03ss7UBSnmQ_1779204797
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-488d1b5bca0so15176115e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 08:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779204797; x=1779809597;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9CmurJWHD/yOfGiATVWH6rJ0ebR7zVSRl0aCJVdJMg=;
 b=Q0+rHEkiRmGIUDgPM7sTJrkSs6mB/r2WsTOWqULVgqEfT3PPqTp4HQhF0wVX6jgEqD
 97WaJ6pfQmTwqa4FJBt1iKkEpS1+yEk38G9kvp6ZuH9hQjoxpi3ZZysP6P1ZN2MxqTpO
 ktF10rMoKkvDxQ7Cgt6wH0k+x9hs2LzOQ7b4jEoZVRwTa6/GRc5M7Yrzfmd0LIdCHCV1
 nuE36jufQGicB3E9AZfdMy+1wFobRec8gCWRePR3ahsdUjZHApuJ9ZSD6lXDhse9zupE
 mcxwF1k57vjZQ3iC0K9FisHqenRmtkuTPfsYGm4hxTH/1pxfpAMJlltJa3dRb9QQ0ljL
 oV0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CJUoWJfcgATqGp53e33twdz231kM/cTRp3sZJMLI27JBui53D4Bz8nbLp7QSlOUX0lsK5lWcFPQ==@nongnu.org
X-Gm-Message-State: AOJu0YyKM7Q091BTQAW6QjmB6yNPmoBpUSyZiF0gQesVqjdWPiAYr/Mh
 ezxtcw+yfrrbC0MCjmBjD3BJUUPuX90c3KhYaY8rltUnAbvS389SGtGYKTIeGf56dz9Yn5gOpbp
 Taz7HBxpdgLYB8cmznfuWZBBTIh5krC+/Py3NM/ysR9oEez3KrXoYHw==
X-Gm-Gg: Acq92OFaZOLnlNQQulxUfLNSPyBNxNDGNsZJodJ/SBSZPDRY8kC7x4GWd7oxXjaJGr3
 +ZA7tXQ6xLSWxsrI/0HxEyR7yYhWyb3QQD/10yUhQy8VpGTqvNcczeQyW3R9M4I5pNykz1Z8k1x
 6BiStMMzy4AnnbwuesOpQUVX4XvDew01o3TSmtP3HOHaeqXMREn2leolnzFT7t391Pw9BJuGSm+
 9sFmqVtOPKjg/8Fe6MHxiUoomSShV01Gdlg3DkOSJJZIec7xAFmtaBLlmagmHY9GJW3NN06jLEW
 pS+MwLXCOGOxPu8yxvwZKCRbc8cC6NORN9psDQeIGUfQC7fC9q3DzNF8gHqNvuvQ/UtzQWbA9wW
 /Bpao5rvnjYi3EFkK2lBG9eH+gQfgZNMrbA069dIrvm5epq09gORjVphJwxehI2VdLC46kyRDUT
 /Am0Qt
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id
 5b1f17b1804b1-48ff1997aaemr154694805e9.27.1779204797383; 
 Tue, 19 May 2026 08:33:17 -0700 (PDT)
X-Received: by 2002:a05:600c:1593:b0:48f:f199:79f7 with SMTP id
 5b1f17b1804b1-48ff1997aaemr154694325e9.27.1779204796966; 
 Tue, 19 May 2026 08:33:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a562dsm47067643f8f.33.2026.05.19.08.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 08:33:16 -0700 (PDT)
Message-ID: <db1bf173-7365-448a-81c0-ef8c62262644@redhat.com>
Date: Tue, 19 May 2026 17:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] hw/arm/smmuv3-accel: Implement "auto" value for
 "ssidsize"
To: Nathan Chen <nathanc@nvidia.com>,
 Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>
References: <20260512193520.3109172-1-nathanc@nvidia.com>
 <20260512193520.3109172-5-nathanc@nvidia.com>
 <CH3PR12MB7548125AB6137EF2D9954810AB072@CH3PR12MB7548.namprd12.prod.outlook.com>
 <b04586fa-51e9-4b8d-a683-8026d075f0e1@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <b04586fa-51e9-4b8d-a683-8026d075f0e1@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tzyZnDGgrqZs1CCahNf6V_ZGLPMI5pgNBQbiWSfwa6w_1779204797
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Hi Nathan,

On 5/14/26 10:14 PM, Nathan Chen wrote:
>
>
> On 5/14/2026 7:24 AM, Shameer Kolothum Thodi wrote:
>>
>>> -----Original Message-----
>>> From: Nathan Chen<nathanc@nvidia.com>
>>> Sent: 12 May 2026 20:35
>>> To:qemu-arm@nongnu.org;qemu-devel@nongnu.org
>>> Cc: Eric Auger<eric.auger@redhat.com>; Peter Maydell
>>> <peter.maydell@linaro.org>; Philippe Mathieu-Daudé<philmd@linaro.org>;
>>> Zhao Liu<zhao1.liu@intel.com>; Matt Ochs<mochs@nvidia.com>; Nicolin
>>> Chen<nicolinc@nvidia.com>; Shameer Kolothum Thodi
>>> <skolothumtho@nvidia.com>; Nathan Chen<nathanc@nvidia.com>
>>> Subject: [PATCH v3 4/7] hw/arm/smmuv3-accel: Implement "auto" value for
>>> "ssidsize"
>>>
>>> From: Nathan Chen<nathanc@nvidia.com>
>>>
>>> Allow accelerated SMMUv3 SSID size property to be derived from host
>>> IOMMU capabilities. Derive host values using IOMMU_GET_HW_INFO,
>>> retrieving SSID size from IDR1. When the auto SSID size is resolved
>>> to a non-zero value, PASID capability is advertised to the vIOMMU
>>> and accelerated use cases such as Shared Virtual Addressing (SVA)
>>> are supported.
>>>
>>> Reviewed-by: Eric Auger<eric.auger@redhat.com>
>>> Signed-off-by: Nathan Chen<nathanc@nvidia.com>
>>> ---
>>>   hw/arm/smmuv3-accel.c | 18 ++++++++++++++++--
>>>   hw/arm/smmuv3.c       | 20 ++++++++++----------
>>>   2 files changed, 26 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
>>> index a5973bd499..5b1af062ee 100644
>>> --- a/hw/arm/smmuv3-accel.c
>>> +++ b/hw/arm/smmuv3-accel.c
>>> @@ -62,6 +62,12 @@ static void
>>> smmuv3_accel_auto_finalise(SMMUv3State *s,
>>>                                  FIELD_EX32(info->idr[3], IDR3, RIL));
>>>       }
>>>
>>> +    if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
>>> +        /* Store for get_viommu_flags() to determine PASID support */
>>> +        s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SSIDSIZE,
>>> +                               FIELD_EX32(info->idr[1], IDR1,
>>> SSIDSIZE));
>> Nit: Not sure that comment makes sense. We need to update it
>> anyway, right?
> After ssidsize is stored in s->idr[1], smmuv3_accel_get_viommu_flags()
> will call smmuv3_pasid_supported() and enable the
> VIOMMU_FLAG_PASID_SUPPORTED flag if AUTO is specified for ssidsize and
> s->idr[1] is non-zero. Maybe we can remove the comment or come up with
> a better wording such as:
>
> /* PASID support will be enabled if ssidsize is non-zero */
>
> But this is already documented in qemu-options.hx. I think it would be
> cleaner to omit the comment here. What do you think? 
Yes I think you can remove it

Thanks

Eric
>
> Thanks,
> Nathan
>
>>
>>> +    }
>>> +
>>>       accel->auto_finalised = true;
>>>   }
>>>
>>> @@ -822,6 +828,13 @@ static AddressSpace
>>> *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
>>>       }
>>>   }
>>>
>>> +static inline bool smmuv3_pasid_supported(SMMUv3State *s)
>>> +{
>>> +    return s->ssidsize > SSID_SIZE_MODE_0 ||
>>> +           (s->ssidsize == SSID_SIZE_MODE_AUTO &&
>>> +            FIELD_EX32(s->idr[1], IDR1, SSIDSIZE));
>>> +}
>>> +
>>>   static uint64_t smmuv3_accel_get_viommu_flags(void *opaque)
>>>   {
>>>       /*
>>> @@ -834,7 +847,7 @@ static uint64_t
>>> smmuv3_accel_get_viommu_flags(void *opaque)
>>>       SMMUState *bs = opaque;
>>>       SMMUv3State *s = ARM_SMMUV3(bs);
>>>
>>> -    if (s->ssidsize > SSID_SIZE_MODE_0) {
>>> +    if (smmuv3_pasid_supported(s)) {
>>>           flags |= VIOMMU_FLAG_PASID_SUPPORTED;
>>>       }
>>>       return flags;
>>> @@ -975,7 +988,8 @@ bool smmuv3_accel_init(SMMUv3State *s, Error
>>> **errp)
>>>       smmuv3_accel_as_init(s);
>>>
>>>       if (s->ats == ON_OFF_AUTO_AUTO ||
>>> -        s->ril == ON_OFF_AUTO_AUTO) {
>>> +        s->ril == ON_OFF_AUTO_AUTO ||
>>> +        s->ssidsize == SSID_SIZE_MODE_AUTO) {
>>>           s->s_accel->auto_mode = true;
>>>       }
>>>
>>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>>> index 7ec4241ecf..cd30275717 100644
>>> --- a/hw/arm/smmuv3.c
>>> +++ b/hw/arm/smmuv3.c
>>> @@ -626,7 +626,10 @@ static int decode_ste(SMMUv3State *s,
>>> SMMUTransCfg *cfg,
>>>       }
>>>
>>>       /* Multiple context descriptors require SubstreamID support */
>>> -    if (s->ssidsize == SSID_SIZE_MODE_0 && STE_S1CDMAX(ste) != 0) {
>>> +    if ((s->ssidsize == SSID_SIZE_MODE_0 ||
>>> +         (s->ssidsize == SSID_SIZE_MODE_AUTO &&
>>> +          !FIELD_EX32(s->idr[1], IDR1, SSIDSIZE))) &&
>>> +        STE_S1CDMAX(ste) != 0) {
>>>           qemu_log_mask(LOG_UNIMP,
>>>                   "SMMUv3: multiple S1 context descriptors require
>>> SubstreamID
>>> support. "
>>>                   "Configure ssidsize > 0 (requires accel=on)\n");
>>> @@ -1965,10 +1968,6 @@ static void smmu_reset_exit(Object *obj,
>>> ResetType type)
>>>
>>>   static bool smmu_validate_property(SMMUv3State *s, Error **errp)
>>>   {
>>> -    if (s->ssidsize == SSID_SIZE_MODE_AUTO) {
>>> -        error_setg(errp, "ssidsize auto mode is not supported");
>>> -        return false;
>>> -    }
>>>       if (s->oas != OAS_MODE_44 && s->oas != OAS_MODE_48) {
>>>           error_setg(errp, "QEMU SMMUv3 model only implements 44 and
>>> 48 bit"
>>>                      "OAS; other OasMode values are not supported");
>>> @@ -1989,7 +1988,8 @@ static bool
>>> smmu_validate_property(SMMUv3State *s, Error **errp)
>>>               return false;
>>>           }
>>>           if (s->ssidsize > SSID_SIZE_MODE_0) {
>>> -            error_setg(errp, "ssidsize can only be set if accel=on");
>>> +            error_setg(errp, "ssidsize can only be greater than 0 "
>>> +                       "bits if accel=on");
>>>               return false;
>>>           }
>>>           return true;
>>> @@ -2173,11 +2173,11 @@ static void smmuv3_class_init(ObjectClass
>>> *klass, const void *data)
>>>           "are 44 or 48 bits. Defaults to 44 bits. oas=auto is not "
>>>           "supported.");
>>>       object_class_property_set_description(klass, "ssidsize",
>>> -        "Number of bits used to represent SubstreamIDs (SSIDs). "
>>> +        "Set number of bits used to represent SubstreamIDs (SSIDs). "
>>> +        "Valid values are 0-20 and auto. Defaults to 0. "
>>>           "A value of N allows SSIDs in the range [0 .. 2^N - 1]. "
>>> -        "Valid range is 0-20, where 0 disables SubstreamID support. "
>>> -        "Defaults to 0. A value greater than 0 is required to enable "
>>> -        "PASID support. ssidsize=auto is not supported.");
>>> +        "A value of 0 disables SubstreamID support. A value greater "
>>> +        "than 0 is required to enable PASID support.");
>>>   }
>>>
>>>   static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>


