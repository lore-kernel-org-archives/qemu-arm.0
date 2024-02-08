Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp186681ejb;
        Thu, 8 Feb 2024 07:39:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdMVCPOQf9PUUXqB9QNUfWRqtU3S943g2Ya3Wf2urjWZARVOAkK2H/NLSYued+W3EXiHYl
X-Received: by 2002:a25:b209:0:b0:dc6:5570:898f with SMTP id i9-20020a25b209000000b00dc65570898fmr8773490ybj.17.1707406765989;
        Thu, 08 Feb 2024 07:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707406765; cv=none;
        d=google.com; s=arc-20160816;
        b=jeTxAX9XUJEjkl0oNlmKIPVN2F5WzwAvFaBGpIPp+Q4CGYoHTqtAbb2QUmPrlSIEuz
         UYT0h0fl0Pv6L6X4Z8b4+iU08sUvw3OI/oeZxO3EmitrFNBqnO8ADA9XtERR8DQ75Tv0
         Ucfdb7m7Zi5r4fLL7GsU6g8cMPNemrrqFMUgQGsUg7AsTto2L3dsMIdjdtZv8C4n5Vfv
         BcfB36vCuq+LZnoolyhE8ajL0sdaEyk56EYZRrhPg9L9rXAOkp6xPIdh+g0HKZGA2xee
         Vz/Gns1LmWBsE2oaxOcV9yCPsunwCYi0cI+OpQyNBsmo31PQQYCJwlgP7TktJzvspLZQ
         3vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NUOpsP3QnVmD6vsFx5RO8XkJ1xdy0pl+N9Lh2vhijGY=;
        fh=72WIj3jkQsczbMvZiGchxcReRaWqic67xaKpMZ3Yng8=;
        b=ZKpU3pqf8wYDaBYOccpzXr9GY7CNHb9eZrQSXl/yIKYQBtF/ClvMuGhSY5FYnvoSvc
         ZrqQYtLTDOF6Vr/+PaJ57aAiRXirJaO2BV51l3MOix1J4BpaAFreg+XPaS+d6n3OElX1
         gKYY9mjyMMdj0i2C8o8lCKOjLUp9dftMzCgSDMPS2FJBoMZgi8sftg58+4xQC3W1lYbw
         OhTZTPY1BuunGUhR+zbncc+Sq4tBZUtlV7LOQVh72JLd26KUwEporEFacpD8rCc27MoG
         bLXLRDomktXtoQvBq7EdV40lyrverEOSsIvNcbkOxNROE9xVKKCBfHuBcd8e5dc9Gw0b
         67lQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PVSgZFY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVfbUD0FoR8gzx2LUBOD41sKsi9X/qFtPyI1hXofIe8sr4GhKLwX9APbqwoc3c400sNd2uqiVZ+aUma/jA5uPTtBSiOaExv
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b37-20020a05620a272500b007859729f335si255568qkp.196.2024.02.08.07.39.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 07:39:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PVSgZFY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY6Ug-0003t9-Bv; Thu, 08 Feb 2024 10:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY6Uf-0003sp-QI
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rY6Ue-0004F0-1z
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 10:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707406755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUOpsP3QnVmD6vsFx5RO8XkJ1xdy0pl+N9Lh2vhijGY=;
 b=PVSgZFY4WVFKtd3xDwqjxp8GBJJ5+2nozNrFmfPJdJC+DC5/iS9gBNV7us3ntVU/tAhh58
 qt90gUOmYcoW+yHJfQmzhbaONAVkmxfNtNL1Iy3q5az8jO7k2th4X0xJ1HJcZB9nbc6OwF
 6XyQ1OEE4cFgYu9BAY7ZOI7tuc5po6o=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-zZrpGueyMX-e98G3ROkk0A-1; Thu, 08 Feb 2024 10:39:13 -0500
X-MC-Unique: zZrpGueyMX-e98G3ROkk0A-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3bff1bed047so1299043b6e.2
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 07:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707406753; x=1708011553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NUOpsP3QnVmD6vsFx5RO8XkJ1xdy0pl+N9Lh2vhijGY=;
 b=kochmvkhhpIJPJZ55ZjST7sQCLcbe4qWT91d6BS7u8TI6iLFGQOY3oEKNz4zjp2Sve
 710+YkKZQVjpVv76+J+J+fhGwvprjysXerTjkz6YIFN/8EPLREvLl5FdDeMgooB+q2tI
 STJWz9V/BnIund1syBCyXKzgT/tGAU2t2npYXL1zRdGOhVXt5pm8/ECF4pSPo71d4sac
 Y/4SB5THsLr5pQjLxR3u861Ye5r+/0gWULSlOmAhm4zDix7MnR19GLSh0AGBffioIsgJ
 E7aZ8gUFr8ZBUFORkB7spOsCb0T6q4FqmF46ZnPahcDaIe0+gHmmF/JWKasYzvE2DK29
 Frhg==
X-Gm-Message-State: AOJu0YxWIsff7kGgUyjGr8dEbsERFJlQ+mSB4Gk0bkEUtcS85bb186AY
 MWnqLxqPRdD8K6COnW2rRnYTlGp2a6xbK8SzjmeZO8WdI2WQR5uOZy580aBOrGUcXJT7vlMgYr1
 iXmYapMOGQxz7nJFcPWuq2d76LG/THt0xMClQsduwDhOS2U7OSw==
X-Received: by 2002:a05:6808:1411:b0:3be:459a:b373 with SMTP id
 w17-20020a056808141100b003be459ab373mr10286379oiv.52.1707406752777; 
 Thu, 08 Feb 2024 07:39:12 -0800 (PST)
X-Received: by 2002:a05:6808:1411:b0:3be:459a:b373 with SMTP id
 w17-20020a056808141100b003be459ab373mr10286357oiv.52.1707406752467; 
 Thu, 08 Feb 2024 07:39:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuZK2/QE4vBnJw+eW+oP5YXtPmlDdZakTQbwJtYWjns34Kj5b3mAePZXMUW2L3JoV176jX996u5N0LvOzsnlEOVomGJktuKLcikE7K3vtzPFljXekjbUltW1hsKq4sLggxv8juVPbITP31JKBt9uvnyFrpT8VGEuwJIP/QK/V7Mz+ShfgyutfBmqpwkSoYtqwTDqsWaCX6Lq0KKNTPKvVBtwf+tQLO4O8O6BKnMCFYHPUDfTs0L6QoYuB2+FAeeHS9cukV6jYujptlam4m6cwzpAf6NeLdzXm0rMv1OtTpk7subUesjN3SZer7FCua4HEF2IJj
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac84d11000000b0042aaa37e316sm91788qtv.22.2024.02.08.07.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 07:39:11 -0800 (PST)
Message-ID: <a9410305-b125-444c-bd9d-8ec200892bcc@redhat.com>
Date: Thu, 8 Feb 2024 16:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 mst@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 zhenzhong.duan@intel.com, yanghliu@redhat.com, alex.williamson@redhat.com,
 jasowang@redhat.com
References: <20240208101128.655167-1-eric.auger@redhat.com>
 <20240208144257.GA2863476@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240208144257.GA2863476@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.213,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QZNKDzkezRE4

Hi Jean,

On 2/8/24 15:42, Jean-Philippe Brucker wrote:
> On Thu, Feb 08, 2024 at 11:10:16AM +0100, Eric Auger wrote:
>> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
>> protected with a virtio-iommu is assigned to an x86 guest. On x86
>> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
>> whereas the virtio-iommu exposes a 64b input address space by default.
>> Hence the guest may try to use the full 64b space and DMA MAP
>> failures may be encountered. To work around this issue we endeavoured
>> to pass usable host IOVA regions (excluding the out of range space) from
>> VFIO to the virtio-iommu device so that the virtio-iommu driver can
>> query those latter during the probe request and let the guest iommu
>> kernel subsystem carve them out. 
>>
>> However if there are several devices in the same iommu group,
>> only the reserved regions of the first one are taken into
>> account by the iommu subsystem of the guest. This generally
>> works on baremetal because devices are not going to
>> expose different reserved regions. However in our case, this
>> may prevent from taking into account the host iommu geometry.
>>
>> So the simplest solution to this problem looks to introduce an
>> input address width option, aw-bits, which matches what is
>> done on the intel-iommu. By default, from now on it is set
>> to 39 bits with pc_q35 and 48 with arm virt. This replaces the
>> previous default value of 64b. So we need to introduce a compat
>> for machines older than 9.0 to behave similarly. We use
>> hw_compat_8_2 to acheive that goal.
> For the series:
>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Thanks!

and after reading your v2 last reply we case we need to support smaller
aw ranges, I will do the change when the use case arises.

Eric
>
>> Outstanding series [2] remains useful to let resv regions beeing
>> communicated on time before the probe request.
>>
>> [1] [PATCH v4 00/12] VIRTIO-IOMMU/VFIO: Don't assume 64b IOVA space
>>     https://lore.kernel.org/all/20231019134651.842175-1-eric.auger@redhat.com/
>>     - This is merged -
>>
>> [2] [RFC 0/7] VIRTIO-IOMMU/VFIO: Fix host iommu geometry handling for hotplugged devices
>>     https://lore.kernel.org/all/20240117080414.316890-1-eric.auger@redhat.com/
>>     - This is pending for review on the ML -
>>
>> This series can be found at:
>> https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v3
>> previous
>> https://github.com/eauger/qemu/tree/virtio-iommu-aw-bits-v2
>>
>> Applied on top of [3]
>> [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default page_size_mask
>> https://lore.kernel.org/all/20240117132039.332273-1-eric.auger@redhat.com/
>>
>> History:
>> v2 -> v3:
>> - Collected Zhenzhong and Cédric's R-b + Yanghang's T-b
>> - use &error_abort instead of NULL error handle
>>   on object_property_get_uint() call (Cédric)
>> - use VTD_HOST_AW_39BIT (Cédric)
>>
>> v1 -> v2
>> - Limit aw to 48b on ARM
>> - Check aw is within [32,64]
>> - Use hw_compat_8_2
>>
>>
>> Eric Auger (3):
>>   virtio-iommu: Add an option to define the input range width
>>   virtio-iommu: Trace domain range limits as unsigned int
>>   hw: Set virtio-iommu aw-bits default value on pc_q35 and arm virt
>>
>>  include/hw/virtio/virtio-iommu.h | 1 +
>>  hw/arm/virt.c                    | 6 ++++++
>>  hw/core/machine.c                | 5 ++++-
>>  hw/i386/pc.c                     | 6 ++++++
>>  hw/virtio/virtio-iommu.c         | 7 ++++++-
>>  hw/virtio/trace-events           | 2 +-
>>  6 files changed, 24 insertions(+), 3 deletions(-)
>>
>> -- 
>> 2.41.0
>>

