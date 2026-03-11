Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538C71125811
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 18:25:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0OFm-0001rE-2W; Wed, 11 Mar 2026 14:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0OFf-0001pN-A7
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 14:25:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1w0OFd-0007Lq-7Q
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 14:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773253544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJNOCK4CKWh0vHBUxPW+9hTdN7h2sEqQGfG64Cfbd1M=;
 b=O0kthWxEwU3/7HNfVkNEB81jC1xFhIrHQwZryotovqzUlQ9Rm0ul2sD9nJFGl14rcz9S91
 bm8a2qzwn8UT6tuvpfHpXZx9k2QeyeHKuq6y6lyJZSXS+ae6nQgczbJ76ektiEO4oEHyXc
 dEmt042/ECBX4bb7pOVhRpvk5362kXs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Sspi2QloPKilgITgLpYuxg-1; Wed, 11 Mar 2026 14:25:43 -0400
X-MC-Unique: Sspi2QloPKilgITgLpYuxg-1
X-Mimecast-MFC-AGG-ID: Sspi2QloPKilgITgLpYuxg_1773253542
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-48539bda3dcso3569625e9.2
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 11:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773253542; x=1773858342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJNOCK4CKWh0vHBUxPW+9hTdN7h2sEqQGfG64Cfbd1M=;
 b=q+pDsMF1nvxlO7dyOuWuhvCpCZsmoBahcSwDQyGVeualUaWQlgDI1Th3aXWCgzANO3
 g/g8WTzh0CMilFpM4LHu5jVHGFrC68yIHw8gN44z0CX5x7TWnijtYtgOJa9ji9iBOKWC
 +5QrhyGGf2U/4akmbGiD7EIAR6QLZv6yujyt2OP73MkGZtv4xTtp9i/GH1bTiDI7uREX
 YI1dLg+kiLsvNwBFWhIXsKQj2VDPxeILPsWFcCOTZMOpreTlnINLg27mrctDcF4ibQ4i
 xxEbQ/BfbkOLeYf1e753PdCxcpUmywH17TuIqcT0Se76mvUNtZNEHoHcqLx6rCkyadnO
 F4RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxRQC/i1hbAeTqFNMT8hBWcFDeiIYW898f95mvZm91ZDBc1hi+dmk1grj+DnT4Si+bbrj5iyuP9Q==@nongnu.org
X-Gm-Message-State: AOJu0YyIg7H2WJKE0avMMUKa+spzLzretjK7spQ33AOwTDFP2YTQomKU
 N2N++7vwztNu/sMVzECyAw26GaiCTlJfm/P4B2QS50R/JD/FihOP6fPUUsFNUarYgT1P1H+/LJ2
 t7RpVwJUwj9Q1dFV278MYyygC+IP5a+ZiwXfpqWMSnsMnsWwWegPmmw==
X-Gm-Gg: ATEYQzwBt7lkHJjlLPDP2yAX5CuIUYblanvZwds1DFQvLDrLV7Wt0V8JgfUar8AJIIU
 8tEp+U9xTy4hnWAA6gDoRdRVZ3FOox7cb2Uui4z17+0CJbMsj2j2mtOEGrSmO3J9gTWp5GUxDt9
 eu6vJXj9TYtLm+aZEDs/o3gCHWRd2gBE0lTvA9JNDkTE6pTfjAybYvVGmjhP09Lpyu/C0d5dsR9
 orK3rrXgZ4Y8Udm3ORBSmW1TscPWvd8yXsPvz3N06ggpUwb6rVVIjhvIJUd4bLq3BxPl0plAOd6
 iNxyGtVYAAp1EjHkMytGBazRoAy23tCDTGDYhc6KK9EeyaiR1+iBmDd2RxTBae9rtD3v9SHZAZj
 P3c39c1N5moV9ugKNANYWnXFh6strXypYnG1Rf+wiBbxUrDAU252JxtQp0a8zTvLwwlJJHg==
X-Received: by 2002:a05:600c:8b45:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-4854b0ac451mr56760455e9.7.1773253541743; 
 Wed, 11 Mar 2026 11:25:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8b45:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-4854b0ac451mr56760065e9.7.1773253541297; 
 Wed, 11 Mar 2026 11:25:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b0bff95sm46820475e9.3.2026.03.11.11.25.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 11:25:40 -0700 (PDT)
Message-ID: <fbc0432d-231e-400a-9749-c31ceb564a20@redhat.com>
Date: Wed, 11 Mar 2026 19:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/8] hw/arm/smmuv3-accel: Support AUTO properties
To: Nathan Chen <nathanc@nvidia.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alex Williamson <alex@shazbot.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20260309192119.870186-1-nathanc@nvidia.com>
 <a9c03e3c-448e-480a-a6dd-b3c4c7903758@redhat.com>
 <33209425-ff30-4106-827f-a12a86161afb@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <33209425-ff30-4106-827f-a12a86161afb@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rBRDU4hpuJ0xBRu3ZPWn0Xvw3Z3O4Uf1m1KB--kR9mY_1773253542
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 3/11/26 6:55 PM, Nathan Chen wrote:
>
>
> On 3/11/2026 10:43 AM, Eric Auger wrote:
>>
>> On 3/9/26 8:21 PM, Nathan Chen wrote:
>>> Hi,
>>>
>>> This series introduces support for specifying 'auto' for arm-smmuv3
>>> accelerated mode's ATS, RIL, SSIDSIZE, and OAS feature properties.
>>> When set to 'auto', these feature values are derived directly from
>>> host IOMMU capabilities, avoiding the need for management layers to
>>> introspect host settings.
>>>
>>> Accelerated SMMUv3 Address Translation Services support is derived
>>> from IDR0, Range Invalidation support is derived from IDR3, Substream
>>> ID size is derived from IDR1, and output address space is derived from
>>> IDR5.
>>>
>>> Additionally, an OnOffAuto "ats" property is added for vfio-pci
>>> devices,
>>> where setting 'auto' detects the per-device presence of
>>> IOMMU_HW_CAP_PCI_ATS_NOT_SUPPORTED from the kernel, and the ATS cap can
>>> be advertised or hidden by setting 'on' or 'off'. This is dependent
>>> on Shameer's recent kernel series for reporting effective ATS support
>>> status [0].
>>>
>>> The default values are set to 'auto' for all properties.
>>>
>>> A complete branch can be found here:
>>> https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto
>> I have just noticed we are missing documentation for smmuv3 accel
>> options in
>>
>> qemu-options.hx
>>
>> At the moment we just have:
>>
>> ``-device arm-smmuv3,primary-bus=id``
>>      This is only supported by ``-machine virt`` (ARM).
>>
>>      ``primary-bus=id``
>>          Accepts either the default root complex (pcie.0) or a
>>          pxb-pcie based root complex.
>
> I will add a commit to include documentation for the smmuv3 accel
> options in the next refresh. 

Great. Thanks!

>
> Thanks,
> Nathan
>


