Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB70CA1015
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Sep 2025 10:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uuTQK-0001SL-Fm; Fri, 05 Sep 2025 06:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTQI-0001RT-Ti
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:12:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uuTQ5-0005Ag-Eq
 for qemu-arm@nongnu.org; Fri, 05 Sep 2025 06:12:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757067106;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0G5I9HcOPpmITgGtpGl+Dr3fIub9ASYEQ3OgxpydGEE=;
 b=JouWXi+40dnzsF8WZLDuLvew70XO5w5ReuU4LBFkxH/+eihFKt+B+jlLvrjbR4f590DqpG
 q1pkY31yL929+EHUjalFqh07MLbrRJIhsjE47s3SlBH/J15mpboJbPiNZwGOQ5YHoAIvEN
 f5V61li9lVTpsK4jGNcYXSC9cnESJtk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-MHIpC9JBPACDxmR3UNbIkw-1; Fri, 05 Sep 2025 06:11:43 -0400
X-MC-Unique: MHIpC9JBPACDxmR3UNbIkw-1
X-Mimecast-MFC-AGG-ID: MHIpC9JBPACDxmR3UNbIkw_1757067102
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3e38ae5394aso422856f8f.3
 for <qemu-arm@nongnu.org>; Fri, 05 Sep 2025 03:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757067102; x=1757671902;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0G5I9HcOPpmITgGtpGl+Dr3fIub9ASYEQ3OgxpydGEE=;
 b=P7Yu8rPRsIlCe9GM+MYlcH++/KQxTzbi4nS/BtzOj5rkzoUwtHkSIxTfN6JeMDTE+U
 d8HYZCLf9e2Hw5nwdOWs2KB87uKOl3m9MjBO1REXtDP5vWsvN5WZgXOrZm1Tfe5n0538
 7tyIiRyah8/3l7SCcV6q3UvOuT6hf2xl/zbBne3CcB1LRLIdFEmvusxa6CvV6vpGPvxT
 04tRR7VRilzY1G2n46ytSAz6sDZv17XWp0V4mYo4Njwz7tD/pkWwJNtDr8+l871m+mF1
 8fT6Vz+lCC1npDQBeDC4NDKLdMMfhYBQg8oa34klojyGpMyv0PCzyY0WBHWKm9PCA3vq
 u+aQ==
X-Gm-Message-State: AOJu0YwENSq678edxd+IHnJ2pIAkbSFZCUP8gjW04OH7IKluNJHcvyRb
 gBdJmr2UpkhXx6WDOshRZ8MC94n0Zc7t0unRq0QJ9H4R1Z5G/L8HmBQRzPL9xuoct4AkJUMgRzj
 rFhGwAvX8bQw0ZOOVznRtvaExiVz1cM/sdfQGefrn1IQeqQc+ZZH9kQ==
X-Gm-Gg: ASbGncvJGYM+oTcft+UgaB37cq2sU7laq6Yhku/TpR5W7UKLc5WGt5kOqiTl1lqvrK8
 +hTl3I4hjPEbsBNwkjnBa+zDW4ZbG0ruNr+Gdgf16TYhILrvRt9KzWEnzi5kBZxxaV1WvU62I9Q
 N8Ig8Vd+EgfSL6wfIOOel5/ITtMo/yqpYQ3mdzFYZ0R6f5UZ3AwqF4NuJtQJBBRtzOHFAZMpUVh
 afoyH2emvUg0jtPsWMFNcUbA2NNVfNdN8wjWi/iBeJUK2WaniwLMP2f+dxV8NWRrggzBYqNazRI
 onoazEQ7x+KuyE81i/XJgw2g3bmfcApeDvKoRWIjMVhRV81MP3GrrQGMMUP78uJrexAmVyymeFW
 Nu228Wq18Bic=
X-Received: by 2002:a05:6000:200d:b0:3d6:7ae1:aefe with SMTP id
 ffacd0b85a97d-3d67ae1c171mr17821272f8f.12.1757067102224; 
 Fri, 05 Sep 2025 03:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGdj9jQN43C9IFUre2oRoAnE5AWDaFH513aObpSW5LLqYJvztoYEanu7306yr21+Xt/nbUDg==
X-Received: by 2002:a05:6000:200d:b0:3d6:7ae1:aefe with SMTP id
 ffacd0b85a97d-3d67ae1c171mr17821230f8f.12.1757067101790; 
 Fri, 05 Sep 2025 03:11:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e329475a13sm2740992f8f.14.2025.09.05.03.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 03:11:41 -0700 (PDT)
Message-ID: <b3ba5610-13bc-4eea-90be-a9435ddc656d@redhat.com>
Date: Fri, 5 Sep 2025 12:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 11/15] hw/pci/pci: Introduce optional
 get_msi_address_space() callback.
To: Nicolin Chen <nicolinc@nvidia.com>, skolothumtho@nvidia.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, peter.maydell@linaro.org,
 jgg@nvidia.com, ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, shameerkolothum@gmail.com
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-12-shameerali.kolothum.thodi@huawei.com>
 <aHVflRCJM+pcsP2S@Asurada-Nvidia>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <aHVflRCJM+pcsP2S@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _FywcWhrzbHDIQ8kPNdGq5SHwmT6YVkU6qNp5uNT860_1757067102
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
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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



On 7/14/25 9:50 PM, Nicolin Chen wrote:
> On Mon, Jul 14, 2025 at 04:59:37PM +0100, Shameer Kolothum wrote:
>> On ARM, when a device is behind an IOMMU, its MSI doorbell address is
>> subject to translation by the IOMMU. This behavior affects vfio-pci
>> passthrough devices assigned to guests using an accelerated SMMUv3.
>>
>> In this setup, we configure the host SMMUv3 in nested mode, where
>> VFIO sets up the Stage-2 (S2) mappings for guest RAM, while the guest
>> controls Stage-1 (S1). To allow VFIO to correctly configure S2 mappings,
>> we currently return the system address space via the get_address_space()
>> callback for vfio-pci devices.
>>
>> However, QEMU/KVM also uses this same callback path when resolving the
>> address space for MSI doorbells:
>>
>> kvm_irqchip_add_msi_route()
>>   kvm_arch_fixup_msi_route()
>>     pci_device_iommu_address_space()
>>
>> This leads to problems when MSI doorbells need to be translated.
>>
>> To fix this, introduce an optional get_msi_address_space() callback.
>> In the SMMUv3 accelerated case, this callback returns the IOMMU address
>> space if the guest has set up S1 translations for the vfio-pci device.
>> Otherwise, it returns the system address space.
>>
>> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>  hw/arm/smmuv3-accel.c | 25 +++++++++++++++++++++++++
>>  hw/pci/pci.c          | 19 +++++++++++++++++++
>>  include/hw/pci/pci.h  | 16 ++++++++++++++++
>>  target/arm/kvm.c      |  2 +-
> I think we need to separate core changes and smmu changes, like how
> pci_device_set/unset_iommu_device were introduced.
I agree with Nicolin.

Eric
>
> Thanks
> Nicolin
>


