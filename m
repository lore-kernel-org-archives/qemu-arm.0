Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF17DCD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 13:53:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRsDF-0003ME-3u; Tue, 26 May 2026 09:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRsDC-0003LX-OI
 for qemu-arm@nongnu.org; Tue, 26 May 2026 09:52:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wRsD9-0003e0-Vv
 for qemu-arm@nongnu.org; Tue, 26 May 2026 09:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779803566;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXrULs/oSXmIN2UzJZ/abXzzQGkCIlcShXbpCnKwkKo=;
 b=DNPxHlA7h+Zfk4/2IIXR51Q2aTWnk6FbSLQyweoEm9dgpgnw3LLhRasDbLDWx1hz4OeGkC
 iqlzRJSm8PnRRMKNNIy2oWqnicBaauLsp71YM8Tw6UEa8wJGJ5oZL94qbda/ClMpgsAiA0
 MpgBfGs8kq+EPk2AkMl1kku4KiIMZLI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-BVqjPwfQOVSwWjr9L7Mitg-1; Tue, 26 May 2026 09:52:44 -0400
X-MC-Unique: BVqjPwfQOVSwWjr9L7Mitg-1
X-Mimecast-MFC-AGG-ID: BVqjPwfQOVSwWjr9L7Mitg_1779803563
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-48fd3dbd16aso87513875e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 06:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779803563; x=1780408363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXrULs/oSXmIN2UzJZ/abXzzQGkCIlcShXbpCnKwkKo=;
 b=c3vgEGAFvbngwu/xjiA1gY2HNfJggDDsmNJ+qnFc3DA/goJ7VoAzSjPTKbLXCw78lY
 SiS9zdxEOlpQehTVLZevP4m74wfPGnVwS+sFQX1AlAzcg6Hv9Htp4x3oM6jWGiEKqdh5
 c/SIYVHqqlwDAe+/iIgtudzEnu1lQD6WLmc84fbdv9xgc0anYCWA/+4otswMghfoh0EJ
 Z+8kCWeoCDAz646yO/crwzWtxQfs0gyfsbOgNd6Kk/reN5g9lw0mSlveaeKzo0XOnAYm
 DPptmpSyeGIHxZgfxuhvCTge2N3J/eyI8byZxqqC8Lad5KHMaLI64Opt4V1dZ651P5KI
 G2aw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8qGbprXF3nim8zaqsbb04QvX1LhCWquJODSLnOZAZZI4RVW1Frug8RkRnYm3SLihuRO9XeqP7MNA==@nongnu.org
X-Gm-Message-State: AOJu0Ywwa10hzCL6j06lak4OlfrO/b3SJ86ibaJ6MWQui3pLzabPKScy
 WPFcXSTbCHezYgRZDPaYZ4mpht5TXXUiBV6l/LAr9sTA/201OgxdPQmXsH5uLnsYyZmq78b3UKi
 h/8WyWWV608O+vtlgovk+5fRRUaQRVXNsvaIMAFNOJu8/LFrAOCXZLQ==
X-Gm-Gg: Acq92OGgI8xad6uDi8OGCo5Jugp/fhvGr4vtVn1T+MFyOgE3w8lNmN5T8Nx4YgwM+WJ
 4IFfkS0c1mV5nLy3Zz1s8fkyaZVOlRzE+L6EKMw9uxCdg+mBw5qriTqCp6COAFhxKsmK5ZdesRB
 fRXdUtJh0oxZSDQg5buUFdCAWUowOD+fQbdNnPTOREzRFUN0NlvzEsfJe/9BJcm+h/5sI0PFprW
 rS3tXyN6waP7b7uZe9N6rvDPDkDFOKEKn1yCrolwEkzrXp/nE/qRr1g5BakhjwPI0K3LtgoIpWO
 DJMM2XBK5roy9dkDNXtpbn2/+SR8dBcSO4T1ORPd2DnW3/XM67S7YVj7I6HtQHaoaAeLuB0uMZp
 srOXau4hFOVfgE1j8DVyMvOxKDs21AQZpUvcw4l3dJS0UH14aTkRRh8a/HMQG4rJsxfrah4Ain1
 v/wKbY
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id
 5b1f17b1804b1-490426cef73mr297957465e9.20.1779803562906; 
 Tue, 26 May 2026 06:52:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:490:3c90:2cda with SMTP id
 5b1f17b1804b1-490426cef73mr297957165e9.20.1779803562500; 
 Tue, 26 May 2026 06:52:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d6ebf0sm36902751f8f.34.2026.05.26.06.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 06:52:41 -0700 (PDT)
Message-ID: <c2b6e502-0bd5-4b1f-b2c3-dcbc760ca733@redhat.com>
Date: Tue, 26 May 2026 15:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/32] hw/arm/tegra241-cmdqv: Use mmap'd VINTF page0 as
 VCMDQ backing
To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "clg@redhat.com" <clg@redhat.com>, "alex@shazbot.org" <alex@shazbot.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Nathan Chen <nathanc@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Jiandi An <jan@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, "phrdina@redhat.com"
 <phrdina@redhat.com>
References: <20260519103727.899332-1-skolothumtho@nvidia.com>
 <20260519103727.899332-21-skolothumtho@nvidia.com>
 <2a4edb3b-064b-4c46-8737-1bd74d5f22e9@redhat.com>
 <CH3PR12MB754807F1C34CCB89A73A219EAB0E2@CH3PR12MB7548.namprd12.prod.outlook.com>
 <862edcac-d8b0-465a-bc58-11678ff15890@redhat.com>
 <CH3PR12MB75481CAA2DD727BC68C88AA3AB0B2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB75481CAA2DD727BC68C88AA3AB0B2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vz31TMsoGxwHLdJiVO6-CxLFuR6jjknCHw7GHsrkmi4_1779803563
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/26/26 3:00 PM, Shameer Kolothum Thodi wrote:
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 26 May 2026 13:20
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; phrdina@redhat.com
>> Subject: Re: [PATCH v5 20/32] hw/arm/tegra241-cmdqv: Use mmap'd VINTF
>> page0 as VCMDQ backing
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 5/21/26 5:46 PM, Shameer Kolothum Thodi wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 21 May 2026 14:41
>>>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>>>> arm@nongnu.org; qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>>>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>>>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>>>> <jgg@nvidia.com>; zhenzhong.duan@intel.com; Krishnakant Jaju
>>>> <kjaju@nvidia.com>; phrdina@redhat.com
>>>> Subject: Re: [PATCH v5 20/32] hw/arm/tegra241-cmdqv: Use mmap'd
>> VINTF
>>>> page0 as VCMDQ backing
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Shameer,
>>>>
>>>> On 5/19/26 12:36 PM, Shameer Kolothum wrote:
>>>>> Introduce tegra241_cmdqv_vintf_ptr() to route VCMDQ Page0 register
>>>>> accesses through the mmap'd VINTF page0 backing once a hardware
>>>>> queue has been allocated.
>>>>>
>>>>> There are two QEMU trapped MMIO apertures for VCMDQ Page0
>> registers:
>>>>>   - Direct VCMDQ Page0 aperture (offset 0x10000)
>>>>>   - VINTF Page0 (offset 0x30000)
>>>>>
>>>>> These are hardware aliases: they address the same underlying
>>>>> registers. A subsequent patch maps the VINTF aperture as a
>>>>> guest-direct RAM region; in this patch both remain QEMU-trapped.
>>>>>
>>>>> VCMDQ Page0 accesses operate in one of two mutually exclusive modes,
>>>>> depending on whether a hardware queue (IOMMU_HW_QUEUE_ALLOC)
>>>> has
>>>>> been allocated for the VCMDQ:
>>>>>
>>>>>   Pre-alloc:  vintf_ptr is NULL. Both apertures use QEMU's register
>>>> do you mean vintf_page0 instead of vintf_ptr.
>>>>
>>>> vintf_page0 is set on mmap, right? and not on hwqueue_alloc
>>> Yeah. I actually meant the ptr returned by tegra241_cmdqv_vintf_ptr()
>>>
>>>> Besides pre/post-alloc sounds a bit confusing to me since it can mean
>>>> queue_alloc or mmap.
>>>> If I understand correctly vintf_page0 can be set while hwqueue_alloc has
>>>> not been done yet and conversely, hence the double check below:
>>> The "alloc" is in reference to a vcmdq is "allocated" to a vintf. I think spec
>>> has that usage.
>>>
>>> Anyway, I will make it clear.
>>>
>>>> +    if (!cmdqv->vcmdq[index] || !cmdqv->vintf_page0) {
>>>>
>>>>
>>>>>               cache. Hardware is not yet engaged.
>>>>>
>>>>>   Post-alloc: vintf_ptr is valid. Both QEMU trapped apertures access
>>>>>               registers directly via the mmap'd vintf_page0 pointer,
>>>>>               bypassing the cache. Hardware is the single source of
>>>>>               truth.
>>>>>
>>>>> The pre-to-post-alloc transition is triggered by the IOMMUFD hardware
>>>> so here you mean alloc is hw queue alloc
>>>>> queue allocation. The tegra241_cmdqv_sync_vcmdq() copies any pre-
>> alloc
>>>>> cached writes (CONS_INDX, PROD_INDX, CONFIG, GERRORN) into the
>>>> mmap'd
>>>>> page so the guest's view survives the transition.
>>>>>
>>>>> CMDQV acceleration only becomes active once the guest enables VINTF
>>>>> and the corresponding HW QUEUE is allocated through IOMMUFD. Until
>>>>> then, all VCMDQ accesses are served from the emulated register cache
>>>>> with no real hardware command processing. This matches the CMDQV
>>>>> hardware specification: if the logical CMDQ index does not map to any
>>>>> allocated Virtual CMDQ, "the access is dropped with no Fault/Interrupt".
>>>> I still does not realy understand what would be the problem of directly
>>>> mapping the direct cmdqv page0 too - I understand that theoretically the
>>>> direct view is larger than the VINTF one though -. I still think a
>>>> proper explanation is missed in this patch of 22/32
>>>>
>>>> Assuming the guest tries to set up some unmapped vcmdqs in the direct
>>>> cmdqv page and this eventually ends up writing into the VINTF view, what
>>>> would happen and in which terms does it violate the spec?
>>> Ok. Let me try to explain my understanding.
>>>
>>> This is my rationale after reading Nicolin's explanation here on the
>>> RFC where we had both direct aperture and vintf page 0 mapped to Guest .
>>> https://lore.kernel.org/qemu-devel/aXkTzRM695oTWFaD@Asurada-
>> Nvidia/
>>> Consider the example:
>>>
>>> QEMU advertises 2 VCMDQs (CMDQV_NUM_CMDQ_LOG2=1).
>>> Guest allocates vcmdq0 only, leaves vcmdq1 unallocated, then on the
>>> direct aperture for vcmdq1:
>>>
>>>   write 0x10 ->  A_VCMDQ1_PROD_INDX
>>>   read     A_VCMDQ1_PROD_INDX
>>>
>>> If we aliased the direct aperture to the VINTF mmap, the write
>>> would physically hit VINTF Page 0 in HW at an unmapped logical
>>> slot. And the spec says(p.172):
>>>
>>> " If no Virtual CMDQ is mapped to the Guest, or if the logical CMDQ index in
>>> the Virtual Interface being accessed by the software does not map to any
>> Virtual
>>> CMDQ, the access is dropped with no Fault/Interrupt."
>> OK
>>> So even though guest is using the direct aperture, in turn it ends up
>>> accessing the corresponding vinf page0 and won't see whatever it wrote.
>>>
>>> I think this contradicts spec p.176 where it says:
>>>
>>> "While the software can program the Virtual CMDQ(s) directly using the
>>> direct VCMDQ aperture (and not through the Virtual Interface), it is
>>> required that the VCMDQ be allocated to a Virtual  Interface before it
>>> is used to send commands to the SMMU."
>>>
>>> So the spec allows register programming through the direct aperture
>>> without requiring the VCMDQ to be allocated first.
>> Hum. So it is said if the cmdqv is not mapped on the VI you cannot send
>> commands to it through the direct aperture. But it does not say what
>> does happen if you do so. Why wouldn't the VI behavior be wrong, ie. "
>>
>> the access is dropped with no Fault/Interrupt."
> "While the software can program the Virtual CMDQ(s) directly using the
>   direct VCMDQ aperture (and not through the Virtual Interface), it is
>   required that the VCMDQ be allocated to a Virtual Interface before it
>   is used to send commands to the SMMU."
>
> Assuming your question is regarding the above quote:
>
> The quote is about the direct aperture and says the software "can
> program the Virtual CMDQ(s) directly using the direct VCMDQ aperture",
> and only the "send commands to the SMMU" step is gated by VINTF
> allocation. If direct-aperture writes were also dropped for unallocated
> VCMDQs, the "can program directly" wording wouldn't be meaningful.
>
> "Can program" behaviour:
>
> write 0x10 ->  A_VCMDQ1_PROD_INDX
> read       A_VCMDQ1_PROD_INDX  // read returns 0x10
>
>
> "Drop" behaviour:
>
> write 0x10 ->  A_VCMDQ1_PROD_INDX
> read       A_VCMDQ1_PROD_INDX  // read returns 0 or undefined
>
> Hope this answers your question. let me know if not.

On my end, I read that the software can use either the direct view or
the VINTF view as long as the cmdqv is mapped. And if the vcmdq is not
mapped we are not really told what happens.
But anyway this use case of using the direct view looks pretty marginal,
doesn't it. So feel free to interpret it as you agree with Nicolin and
HW experts.

Thanks

Eric

>
> Thanks,
> Shameer
>
>
>
>
>


