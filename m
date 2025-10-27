Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AA3CCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 18:03:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDRYo-0001bY-9D; Mon, 27 Oct 2025 14:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRYj-0001bH-Hh
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 14:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDRYe-00023V-JK
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 14:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761588175;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjUtJp1v7vEbLfbOlBex5B7avq6+g+Yf2RtMEtpxjo0=;
 b=iKUItQO+zfYoy5Aag19bqcbowsT4oHnXReKqAlcban1NlruU4b2lxs131nhMUBkG2tPq6C
 l25XP44p1sPsmjHDlBqT+zHChKcokqPW6aopfVgaU+A9qFhxJ8G2VozugwEGSVHmw2UmY5
 ftXx2FsiuCwIjxnosGuhrPYTUGWSfOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-xKSxiCTRPpKYqKZ2hJvGcA-1; Mon, 27 Oct 2025 14:02:54 -0400
X-MC-Unique: xKSxiCTRPpKYqKZ2hJvGcA-1
X-Mimecast-MFC-AGG-ID: xKSxiCTRPpKYqKZ2hJvGcA_1761588173
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-40cfb98eddbso3338635f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 11:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761588173; x=1762192973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XjUtJp1v7vEbLfbOlBex5B7avq6+g+Yf2RtMEtpxjo0=;
 b=bZPSaj8qIpwYvQnlm/n2MgVMTujF4jRENmyrN4h7b+Uy/v5Sh6dP9uuSUBCW3AKiJb
 lx0i+2hzHUX6xoe5B60Od/xeKRQO6HmA3SRrBPmRsTSR2H0h/5bmRDYbDV4CfrME5SCE
 NtNS1n6LW7EMV251NdHwWqgGyII5sX2pD9XZ/sbj/+pT1nLwjGwHt+d8eIoztsQcAY3X
 a/llLKCpMPHAPD2hIl3m9lJ4N8YGpI3aTOrEFi2Pe4z/+NzFg1a+rpzsLDtNqtFLix+e
 2zRgkj98ZpNV9EcWT8P2VNRdDP7OIeF32jRJoC4vDzzTNEdV6CaHNMdWen1d64Cyl1Ky
 z1AA==
X-Gm-Message-State: AOJu0YyX18W2bUwFbfJzwtMIdsy2jNAFCp7cv8U7QJcJmURqq+LFWpiG
 0/t772LwNeivyY9WVjCI8dX7OescD2cVqQUH8ZbhAQtzTYYODSFuV5Q/dt/zPAmWBApJN1sj4ir
 c/DsQNP9o/IWKhPs8+volGiwCyMmhBA7GW2uSKlLV+2pSRj9555LOWQ==
X-Gm-Gg: ASbGncsgfwfSEsY+ruR6vO3B/hbylwd+tvjaM5RHWI7xqcPwMkEnwFM6ZOSDzJ9ZEK4
 3hLY2lG4i7jd4aZVxIPRzF45EJaR26C5HVR3x92FsiLaLs7x3uJnAYs78lnCXgnj5nzNHdlZiKg
 8wdbTLdDxG3qTIXR3p6kzslHTNFE8SB2lEl0v9Z3zrszwsxY1jh0qJJjLMgeElZ0VJU1rmqbc+w
 8XhRGeV/8Zg251yjos0emwle7/MhJ2YXiCzuMcVSUDd0FiKzYndcp8Fl4kyBsVyaL744i71Clrq
 jszaMINyF+iNM7MT6pDy7U/7A/SDZrBmXAQpaTiLVuz6Evr8AjrTw1Czy0/Hjegu0dHpiQhhyXI
 +Qfpq4v3KEkbORz6ItTOWuXUaUyxiSHsM/ueB13ZxtqfkiQ==
X-Received: by 2002:a05:6000:258a:b0:429:8b4a:c3a0 with SMTP id
 ffacd0b85a97d-429a81a80f3mr341268f8f.2.1761588172922; 
 Mon, 27 Oct 2025 11:02:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMIGa/PQxPqXpVoQp0fy9LhRfwEplWMoyFREuylitfZa0UGO8QdDDMrGtOT//loIiaLx1TnQ==
X-Received: by 2002:a05:6000:258a:b0:429:8b4a:c3a0 with SMTP id
 ffacd0b85a97d-429a81a80f3mr341231f8f.2.1761588172475; 
 Mon, 27 Oct 2025 11:02:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cbb2bsm15624115f8f.13.2025.10.27.11.02.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 11:02:51 -0700 (PDT)
Message-ID: <017783c8-0866-4d59-b94a-431041714176@redhat.com>
Date: Mon, 27 Oct 2025 19:02:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
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
 <20250929133643.38961-23-skolothumtho@nvidia.com>
 <26f4d9b2-75be-4913-bb60-01e647a7ec83@redhat.com>
 <aP+oRLu/BYNaAPHG@Asurada-Nvidia>
 <25d22f06-69e2-4954-9bd9-f73f899fc114@redhat.com>
 <CH3PR12MB754817705781C75530974DB1ABFCA@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CH3PR12MB754817705781C75530974DB1ABFCA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xWD50IPv75Y6xDtccp3wHVfJTlYWqG42zTnycgvJMO0_1761588173
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



On 10/27/25 6:54 PM, Shameer Kolothum wrote:
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: 27 October 2025 17:38
>> To: Nicolin Chen <nicolinc@nvidia.com>
>> Cc: Shameer Kolothum <skolothumtho@nvidia.com>; qemu-
>> arm@nongnu.org; qemu-devel@nongnu.org; peter.maydell@linaro.org;
>> Jason Gunthorpe <jgg@nvidia.com>; ddutile@redhat.com;
>> berrange@redhat.com; Nathan Chen <nathanc@nvidia.com>; Matt Ochs
>> <mochs@nvidia.com>; smostafa@google.com; wangzhou1@hisilicon.com;
>> jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
>> zhangfei.gao@linaro.org; zhenzhong.duan@intel.com; yi.l.liu@intel.com;
>> shameerkolothum@gmail.com
>> Subject: Re: [PATCH v4 22/27] hw/arm/smmuv3-accel: Add support for ATS
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 10/27/25 6:13 PM, Nicolin Chen wrote:
>>> Hi Eric,
>>>
>>> On Mon, Oct 27, 2025 at 05:59:13PM +0100, Eric Auger wrote:
>>>> On 9/29/25 3:36 PM, Shameer Kolothum wrote:
>>>>> QEMU SMMUv3 does not enable ATS (Address Translation Services) by
>> default.
>>>>> When accelerated mode is enabled and the host SMMUv3 supports ATS, it
>> can
>>>>> be useful to report ATS capability to the guest so it can take advantage
>>>>> of it if the device also supports ATS.
>>>>>
>>>>> Note: ATS support cannot be reliably detected from the host SMMUv3 IDR
>>>>> registers alone, as firmware ACPI IORT tables may override them. The
>>>>> user must therefore ensure the support before enabling it.
>>>> This looks incomplete to me. ATS is a big topic in itself. I would
>>>> prefer we do not advertise it until we do not have full support for it
>>>> (including emulation). Comparing to
>>>> c049bf5bb9dd ("intel_iommu: Add support for ATS") which was recently
>>>> contributed we miss at least translation request implementations
>>>> (PCIIOMMUOps ats_request_translation callback implementation).
>>>>
>>>> See:
>>>> https://lore.kernel.org/all/20250628180226.133285-11-
>> clement.mathieu--drif@eviden.com/#r
>>> In accelerated SMMUv3 case, ATS translation and invalidation are
>>> done by the physical SMMU. Wondering why do we need this?
>> in 06/27 you still can have emulated EPs hotplugged in the loop, no?
> That can be prevented by propagating an error from the get_address_space()
> callback. It’s already on my TODO list as a follow-up series, but I can move it
> forward if this is a major concern here.
>
>> I remember some discussions with Peter who was also reluctant in general
>> to introduce some partial feature support. I think in general this is a
>> good policy to have features emulated and then accelerated. That's also
>> good for testing in case we can bring up some test env.
> Understood. However, ATS and PASID are the two key features required to make
> any meaningful use of the accelerated support. I’m not suggesting we skip
> emulation for ATS or PASID entirely, just that we prioritize the acceleration
> path first. 😊
I understand this is needed for vSVA. Nevertheless accel SMMU can
already work and be tested in a stdalone manner without ATS and PASID.
Those 2 features add a significant complexity on top of the core series
including from the review pov. This partial support support is not
necessarily great. Also I have not closely followed the thread related
to "[PATCH v4 26/27] vfio: Synthesize vPASID capability to VM" touching
pci.c. I don't know how much this is contreversial. just reading the
commit msg frightens me a little bit: "This is a choice in the good hope
of no conflict with any existing cap or hidden registers" ;-) Eric
>
> Please let me know if there are any strong opinions on this.
>
> Thanks,
> Shameer


