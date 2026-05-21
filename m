Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27652CD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 09:57:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ08x-0000X3-Cz; Thu, 21 May 2026 05:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ08n-0000Vy-0p
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:56:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wQ08a-0006US-0B
 for qemu-arm@nongnu.org; Thu, 21 May 2026 05:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779357378;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sRxT7chWbosAYpKzgarSrZsFSGPsIH+K1+V4ROAcof8=;
 b=XLno3joa9GV+xm2r+EQ0+PjtVWgTBB8y6O+ePG2ZghoGUaDN5zb1oHSi8ABR7bCVxf+GXv
 eMBpipuTzQk4K3SPD4oL039vfJLRJipqoywiIgz0X76SBFgxzpiK+YskIYPbrjwWJAjkUa
 mAGN08enyBQPbYx4t2ScqMVsI8hiUbg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-hED2UZPNNIu5BjtaQWDPtw-1; Thu, 21 May 2026 05:56:16 -0400
X-MC-Unique: hED2UZPNNIu5BjtaQWDPtw-1
X-Mimecast-MFC-AGG-ID: hED2UZPNNIu5BjtaQWDPtw_1779357376
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-45e73a4f1dfso4200711f8f.0
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 02:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779357375; x=1779962175;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sRxT7chWbosAYpKzgarSrZsFSGPsIH+K1+V4ROAcof8=;
 b=k0WWCT8aV15zIcTCpcMdGtykMpMw5EdGuXgjWxBrJ9mqJcEYOWFVbx4NOY1DCSbKfH
 siLihEqry0oJ5XEtNdvMqRPdQBTwEAhAG5FUsLzhQzYhVNvKCXYsWly2N9bOBAkEnKfS
 QNrKl9BoWXZPPggZdWaP+43ZtXLmm5uAYzFYdeFJaNPTTlwyU0moV/CN76jFG8Wpz3hu
 LHtfTBgCSNTACkSq5PfTr3RmfnxaNBHDMmbfMWFXF/twJqoQVP660erm1tA55heC3cWv
 dyXTJaUNPulaKi9YiSAOU7LopglljlCpRtTwV0IK42eG5/iBcOKq+G/VBxIjRo4HyHkv
 Xf6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cZgYfciMrzPnzbvQhjMH09pTVa91m+CH4Bl4KDSdCo7C2Vhjq3Kg5pfdCcCGBErCJ5VkWbx6F3Q==@nongnu.org
X-Gm-Message-State: AOJu0YxSxZtAY3chbBOWsJebQCeUfHxSzaJIVKx7OMfM9emNwDxhECfd
 2XfRtS7bGZ0BLPWLeR1HFdzeoeAxf9k1kHYSFYTTLBfoQqGAog72c0vjHUK+dyzE0Ey0URRwIPx
 UFWV4Zzd6sFeu04Scm6tGQQ+00DEyw+Dj6qcRHdVRSCuDOq1zyRaWrA==
X-Gm-Gg: Acq92OGhVpqY35Cl1bnncZsRDQeV0bWCc2ew2zk2b3vYzJuNXPYY00cRqBLJJdmQfPS
 Rj+UV/5yyNhU7d7t6FtPkrq+axfn44+zFH/VNdFTOo/twYWzssXyjmwVw9a7R9o6WSLLgLpd954
 m7906KuOww5vAPFolRkKcV6rSyqmOykwYUPSOKuXqYJrXa9/VyrDycMgPqmYBlqwYj7FZABT9qV
 YlE5JKvxjnb4J8fK8eILy3aUERJYQc5Szgkwpk9e3w6kt8YslJa6FrfIQ07DC1fqqSFvM8NcTXK
 TTJMxHksuhalCUdmyzaHR6Q1w+JgIlXIs1nXri7kYQySzq12DD5iFrfU3w9FRH43iNdtt+RlNKn
 dJzWHS56BfHXWxv0oxKtQoJ34icJsegdSk/dYqFY9y5vaasb2MkyUs0b1cJm6N4TDlmcvKQ==
X-Received: by 2002:a05:600c:a112:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-490360dc0a4mr22932915e9.33.1779357375586; 
 Thu, 21 May 2026 02:56:15 -0700 (PDT)
X-Received: by 2002:a05:600c:a112:b0:48f:e230:80a3 with SMTP id
 5b1f17b1804b1-490360dc0a4mr22932675e9.33.1779357375167; 
 Thu, 21 May 2026 02:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d44d7dsm60750515e9.5.2026.05.21.02.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 02:56:14 -0700 (PDT)
Message-ID: <2d912f91-4126-41d2-ab63-8ac077cb41da@redhat.com>
Date: Thu, 21 May 2026 11:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0 for CMDQV
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
 <20260519103727.899332-18-skolothumtho@nvidia.com>
 <c0dd92b2-4ea9-45a2-afbf-b61910f71fe6@redhat.com>
 <CH3PR12MB75486D02EEBCE74D47B20834AB012@CH3PR12MB7548.namprd12.prod.outlook.com>
 <f0909a11-9bc5-47b5-a50e-b3fee4a5bdf8@redhat.com>
 <CH3PR12MB754835F2AE265DC7ADC32DBCAB0E2@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754835F2AE265DC7ADC32DBCAB0E2@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 56WKs53uM1vIUndnsgG26wOGARTJQdXr5PjRFcHiMDY_1779357376
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



On 5/21/26 11:44 AM, Shameer Kolothum Thodi wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 21 May 2026 09:00
>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org; Nicolin
>> Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>; Matt
>> Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason Gunthorpe
>> <jgg@nvidia.com>; zhenzhong.duan@intel.com; Krishnakant Jaju
>> <kjaju@nvidia.com>; phrdina@redhat.com
>> Subject: Re: [PATCH v5 17/32] hw/arm/tegra241-cmdqv: mmap VINTF Page0
>> for CMDQV
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Shameer,
>>
>> On 5/20/26 5:47 PM, Shameer Kolothum Thodi wrote:
>>> Hi Eric,
>>>
>>>> -----Original Message-----
>>>> From: Eric Auger <eric.auger@redhat.com>
>>>> Sent: 20 May 2026 13:54
>>>> To: Shameer Kolothum Thodi <skolothumtho@nvidia.com>; qemu-
>>>> arm@nongnu.org; qemu-devel@nongnu.org
>>>> Cc: peter.maydell@linaro.org; clg@redhat.com; alex@shazbot.org;
>>>> Nicolin Chen <nicolinc@nvidia.com>; Nathan Chen <nathanc@nvidia.com>;
>>>> Matt Ochs <mochs@nvidia.com>; Jiandi An <jan@nvidia.com>; Jason
>>>> Gunthorpe <jgg@nvidia.com>; zhenzhong.duan@intel.com; Krishnakant
>>>> Jaju <kjaju@nvidia.com>; phrdina@redhat.com
>>>> Subject: Re: [PATCH v5 17/32] hw/arm/tegra241-cmdqv: mmap VINTF
>> Page0
>>>> for CMDQV
>>>>
>>>> External email: Use caution opening links or attachments
>>>>
>>>>
>>>> Hi Shameer,
>>>>
>>>> On 5/19/26 12:36 PM, Shameer Kolothum wrote:
>>>>> From: Nicolin Chen <nicolinc@nvidia.com>
>>>>>
>>>>> The CMDQ-V CMDQ pages provide a VM wide view of all VCMDQs, while
>>>>> the
>>>> s/CMDQ pages/VCMDQ pages - yeah that's all very confusing ;-) -
>>>>> VINTF pages expose a logical view local to a given VINTF. Although
>>>>> real hardware may support multiple VINTFs, the kernel currently
>>>>> exposes a single VINTF per VM.
>>>>>
>>>>> The kernel provides an mmap offset for the VINTF Page0 region during
>>>> for the host VINTF page0 allocated for the VM
>>>>
>>>> Actually is the whole host passthrough principle is not really
>>>> explained anywhere. At least that's my feeling. It would be nice to
>>>> have a summary for it, in the coverletter and in individual patch. Or
>>>> maybe we can link to another doc. Reading the kernel uapi does not
>>>> really provide the full picture, at least that's my own feeling.
>>> Fair point. A summary of operation is useful. I am thinking of adding
>>> it at the top of hw/arm/tegra241-cmdqv.c:
>>>
>>> /*
>>>    * Tegra241 CMDQV - overview
>>>    * ---------------------------------------
>>>    *...
>>>    */
>>>
>>> I will populate the details and share it for review before v6.
>>>
>>>> when a VM allocates a VIOMMU for the CMDQV, the kernel allocates this
>>>> and this resource that is then given for exclusive usage of the VM ...
>>>> How does it guarantee security between VMs, etc...
>>> Isolation is enforced by the kernel and the CMDQV hardware.
>>> I think the key points here are:
>>>
>>>   - Each VM has its own iommufd FD. All iommufd objects (VINTF, hw
>>>     queues, mmap regions) belong to that FD; one VM cannot reach
>>>     another VM's IDs.
>>>
>>>   - Each FD gets its own VINTF, allocated by IOMMU_VIOMMU_ALLOC. The
>>>     kernel writes the VM's VMID into the VINTF and the host CMDQV
>> s/writes/configures
>>>     hardware checks it on every command.
>>>
>>>   - The kernel allocates the VINTF with HYP_OWN = 0, which restricts
>>>     the guest to a safe subset of commands.
>>>
>>>   - Per VINTF, the kernel programs SID_MATCH and SID_REPLACE so only
>>>     the VM's own vfio-pci devices can issue commands; other SIDs are
>>>     rejected by the hardware.
>>>
>>>   - IOMMU_HW_QUEUE_ALLOC binds each VCMDQ to one specific VINTF, so
>> a
>>>     guest cannot reach a VCMDQ that belongs to another VM.
>> at the moment a single VCMDQ is used by VM, is that a correct
>> understanding?
> Not quite. QEMU exposes one VINTF (VINTF0) with two VCMDQs to the
> guest. The guest decides how many of them to enable. A Linux guest
> enables both:
> ...
> arm-smmu-v3 arm-smmu-v3.0.auto: allocated 524288 entries for vcmdq0
> arm-smmu-v3 arm-smmu-v3.0.auto: allocated 524288 entries for vcmdq1

understood!

Eric
> ...
>
> Thanks,
> Shameer


