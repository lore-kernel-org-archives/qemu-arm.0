Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp424804njk;
        Tue, 17 Dec 2024 10:37:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV+HQlkUHsX+3f0YGKxWJQ2XgfbeF60wa0qQCCPZpEXCXnd4YkgkwzyAa+DfCCFZ2oqaHRIeh+vVmTDyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH5zyfV6a3plHMFxULMZpJkfBSh2DkolW97KbyhM/NqL3maqQ0HK8eoJHUWzJPfRBPfmy9j
X-Received: by 2002:a05:622a:1aa5:b0:467:6b20:e0b1 with SMTP id d75a77b69052e-46907bf4133mr4557671cf.6.1734460628491;
        Tue, 17 Dec 2024 10:37:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734460628; cv=none;
        d=google.com; s=arc-20240605;
        b=ZbqW9nNI9zVj+PEqzBDvLM7NmRtRrN95Of36pgpnbL5km3InfoL8b/V83Z3MWcaprO
         xR6XizmM22VbGZD0+jeNP3n2ZC+Kfxy5eiwqi1M8cG/nPwzUdQIXBIpasvE2/CRSvtcV
         qTeQgSSzJ5BusvZJ/rmjI7L5qNZSOMCDMQamEBUjC/ZmRIYgZtDpVdiNuVDmu6xg8UbC
         6ZSYchrTaz9LDGcZVNbExk+hGga4aE56a+ilsOOvZlYF3UhGmR6HNjLrxTxMMRr2bsW9
         CuTUn+x5H3nPqG3ud7V1HCKiFwSnWN+JVZCMDTCuneEnaKx2XINUqLjgvx+voshJKXvh
         gygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VhNRHwQJN+qr5GRuAJxkLst4QTuVIPazKslo8UWX+m4=;
        fh=2PR3XP55G9kFXkouJAO4bHhJkqJkNpFk/UopYVWmtcg=;
        b=CKnoPZblPKs2WSxv0VOsgstJdZTOeg2thL5VCl+GtG/dY7Y14o2mWUWDlXngryhcLu
         y5tJBHIphtLy5Wb9vphIEQAfdWxrSIX1XrSNjLcK4OvzrziWpG55rsTYaPDRoHyqcOKh
         HEUt1ml+eYojwK94GglGQQ3QREm5AANtCifpZ+no5NjBJ8tCavzNhOkK1P3P/D8LeHgb
         Im9uI7woshblC+bxACybTD+HO4e+ToWqTOb0LptAsGO1L1hZOIIY8mf06ojbV4Vhyk5J
         +LVwgJkx3+LKCSUJ32i/7sFvTtR90UwCRiYQQ3x+AfTrlU+xu1/CEyyMGn9wKspU4wsQ
         Nwqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NOtVnDEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2f271d1si101740291cf.652.2024.12.17.10.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2024 10:37:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NOtVnDEU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNcQq-0006sE-48; Tue, 17 Dec 2024 13:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tNcQo-0006s2-Rl
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 13:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1tNcQg-0004sh-7x
 for qemu-arm@nongnu.org; Tue, 17 Dec 2024 13:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734460578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhNRHwQJN+qr5GRuAJxkLst4QTuVIPazKslo8UWX+m4=;
 b=NOtVnDEUvKRYryaWQDIUkzQjTWwuSsBZh4cBBcVDWpV6jpqHoG8+okDe60bUeDpnqoEQKy
 xj9L7AWvsoKRNDCuRNvTc44W4Ti6u2GiRhhdDCwn0PNjFmGa4ItvJPwclgwCpQBRahKtvw
 Hzz4yofBYBbHQof0nk7/N+7r1v/fdfE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-zcTSE1eBMNuD3pzZR-IDJg-1; Tue, 17 Dec 2024 13:36:17 -0500
X-MC-Unique: zcTSE1eBMNuD3pzZR-IDJg-1
X-Mimecast-MFC-AGG-ID: zcTSE1eBMNuD3pzZR-IDJg
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8860ab00dso99622416d6.0
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2024 10:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734460577; x=1735065377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhNRHwQJN+qr5GRuAJxkLst4QTuVIPazKslo8UWX+m4=;
 b=jjPHVdHByQGUfe2VGN0SV+HYzOqnRuWrVf0l/VAgGhnPDrvGI7wqvJBbZ3ptY21/vZ
 F3Py4hjQcj8saWHTWiU2BPpxgDOiedmnQbqXK/wx7HdX0yGkY2sbuQSH1OXWFAYut7Ak
 dCFYS13tm/BByyqGErRPKA0KD8j0wn34VD+6xa8zACGwsVad2BioeGIDd0mDewEMISao
 SSEI2Vrz1ECwRhWhwr/qJxYQxai79I6Aiol0rGLovTlFg+o4Vibd+P69AFh4rq8I71EU
 B+YMqRVC86RC1k8VW026SMyJWAJ0ZYzR6STgdwOdT1/yrk8ZDcbpSNekrCrJf9bY8ROK
 segg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuNdZ+6VTSl4ii0XgnGznr3fS5EPIvSc867oS8+oMszfwEOg8480BRb1HCtzfbnalgYEn7zafxYw==@nongnu.org
X-Gm-Message-State: AOJu0Yz76JwQzq7q6d38vsUGB9jJt5mWWJsUcAfP57SlXzhOPPtE25Bq
 qC6XY9hsvSqmbYjvBoCskHeieJ6Hh70JXIOJjZL3oKIifH6skF7Dck0uIRhrryRRh6JYpu6Y6V6
 YtbuWPa9/uZtqLSZDS3FXu9E5W4fXyMMQuKesI6h+gPnERHEMSg==
X-Gm-Gg: ASbGnctLoANApCa/Bm5ohOW7omMcpVA9nZqELoL1LPE+WahJaX/1IR93v/ljW6y7chP
 aW4iAdcNfEaHILYXktGrZLlxGYMTzu/2gSgWmFWL/mfzddBBX5SP1ArVsF3Lef26G5MYR2VY4yD
 6MyZhzylO6W/5JDfl/CQv0N5auasXXCOR8fBKJMO1uK4NBhzzsMLyZLyg3NL51L/mb5XxAPUjIm
 gnY0TOSNyqQtcGyzE93YxquIe5wgE8Xok/7iiTNDrORnlk/JG4FCWD+sw==
X-Received: by 2002:a05:6214:501a:b0:6d8:b292:1e17 with SMTP id
 6a1803df08f44-6dd091ac0dfmr1227006d6.15.1734460577072; 
 Tue, 17 Dec 2024 10:36:17 -0800 (PST)
X-Received: by 2002:a05:6214:501a:b0:6d8:b292:1e17 with SMTP id
 6a1803df08f44-6dd091ac0dfmr1226606d6.15.1734460576753; 
 Tue, 17 Dec 2024 10:36:16 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6dccd36312csm41432126d6.82.2024.12.17.10.36.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 10:36:15 -0800 (PST)
Message-ID: <7c7c52c1-9558-4547-95d8-fb2ded592309@redhat.com>
Date: Tue, 17 Dec 2024 13:36:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, nicolinc@nvidia.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z1wh69_gZ9izr1iU@redhat.com> <Z1wsslDnwlth3A8+@nvidia.com>
 <Z1w0cgrK6Ri6smFM@redhat.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <Z1w0cgrK6Ri6smFM@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SZTnS8z7TNwNoR29ubAiSDF3DXYUnsJPQQe_NAI7Mx0_1734460577
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /1kZQ5MhUntE



On 12/13/24 8:19 AM, Daniel P. Berrangé wrote:
> On Fri, Dec 13, 2024 at 08:46:42AM -0400, Jason Gunthorpe wrote:
>> On Fri, Dec 13, 2024 at 12:00:43PM +0000, Daniel P. Berrangé wrote:
>>> On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
>>>> Hi,
>>>>
>>>> This series adds initial support for a user-creatable "arm-smmuv3-nested"
>>>> device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machine
>>>> and cannot support multiple SMMUv3s.
>>>>
>>>> In order to support vfio-pci dev assignment with vSMMUv3, the physical
>>>> SMMUv3 has to be configured in nested mode. Having a pluggable
>>>> "arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Guests
>>>> running on a host with multiple physical SMMUv3s. A few benefits of doing
>>>> this are,
>>>
>>> I'm not very familiar with arm, but from this description I'm not
>>> really seeing how "nesting" is involved here. You're only talking
>>> about the host and 1 L1 guest, no L2 guest.
>>
>> nesting is the term the iommu side is using to refer to the 2
>> dimensional paging, ie a guest page table on top of a hypervisor page
>> table.
>>
>> Nothing to do with vm nesting.
> 
> Ok, that naming is destined to cause confusion for many, given the
> commonly understood use of 'nesting' in the context of VMs...
> 
>>   
>>> Also what is the relation between the physical SMMUv3 and the guest
>>> SMMUv3 that's referenced ? Is this in fact some form of host device
>>> passthrough rather than nesting ?
>>
>> It is an acceeleration feature, the iommu HW does more work instead of
>> the software emulating things. Similar to how the 2d paging option in
>> KVM is an acceleration feature.
>>
>> All of the iommu series on vfio are creating paravirtualized iommu
>> models inside the VM. They access various levels of HW acceleration to
>> speed up the paravirtualization.
> 
> ... describing it as a HW accelerated iommu makes it significantly clearer
> to me what this proposal is about. Perhaps the device is better named as
> "arm-smmuv3-accel" ?
> 
I'm having deja-vu! ;-)
Thanks for echo-ing my earlier statements in this patch series about the use of 'nested'.
and the better use of 'accel' in these circumstances.
Even 'accel' on an 'arm-smmuv3' is a bit of a hammer, as there can be multiple accel's features
&/or implementations... I would like to see the 'accel' as a parameter to 'arm-smmuv3', and not
a complete name-space onto itself, so we can do things like 'accel=cmdvq', accel='2-level', ...

and for libvirt's sanity, a way to get those hw features from sysfs for
(possible) migration-compatibility testing.

> 
> With regards,
> Daniel

