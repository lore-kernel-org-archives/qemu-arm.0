Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8DBC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 16:14:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZtt2-0003y5-Bv; Thu, 10 Jul 2025 12:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uZtgz-0000B8-Tv
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uZtgx-0004aM-OI
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752163209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2788gbQaVQRApXodVht/wRl5mLS9bLsRgJ/dXJC548M=;
 b=Yps8xskkvR2UTbZrbMbU+a8larVu8JWg+HTvTn5Dw2WEjGzXDzt805cMRcGweBocMuLvM+
 jYoQPnAsroM8/VA3l1G/sZKaUC40MUZxbauAMzIYl+95MXzGhy44OdflPwsi/qWZy6+2Qi
 0eYG+Bt9+Ri2opnxVM42aBHwP3uwqp4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-jVQze04LNIqNipBbvevGfw-1; Thu, 10 Jul 2025 12:00:08 -0400
X-MC-Unique: jVQze04LNIqNipBbvevGfw-1
X-Mimecast-MFC-AGG-ID: jVQze04LNIqNipBbvevGfw_1752163206
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-74ae13e99d6so1966973b3a.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752163206; x=1752768006;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2788gbQaVQRApXodVht/wRl5mLS9bLsRgJ/dXJC548M=;
 b=AH8/W997DN0yOuI7zZT4N2VJRAfUu+YUpUZbuHJj0X0uKCNNQ6QHVlLtiarZSnxXm6
 ffsM8lsvfwmPOosEvnHr2vyNKvwj6qP1v3PT884hGLIfnw8+zLxLUBNMCM87Rynpli+9
 Rpt4W7jBcxpDE3MSgSDzZFw29UkGIpKo0s01nqAjxjVnqdMe+VYrROEqRNCp0sDIbwAZ
 5iZddKP0J7SCUn6BDVlhuLuY0vUW9QUK2zLGm6q6coU4ldzu7+QSbp7CQxeRmTm6NOE4
 E10PHCbeg2oc7yktL1kpMBrqgYBAZMEq+qddsPdgl5iR4N/enwUYIpGb9k7C/V0byRrX
 K3ew==
X-Gm-Message-State: AOJu0YxaxOF+nRrhZOn+3yUuBq0q64nKIRZ12nI9pKbsG/aRab+WlAlj
 Coizp9Jj6H2ZybntPRs8Lxuco2DW/ADPOqAoxdX4NsCptf+A35YbmrVfVT/9osM7aXetLTH+kvA
 QB6/3urGRKo4iEYJZHS/da3/6gisQM96CHdHtEAgQD0wh34QVyisX5w==
X-Gm-Gg: ASbGncuQQ4g6psBt/8tvYQS97srlk7fj5rlWB4sDuvbIZl9GsL07HQz/uars/5LofN3
 c3XyS8CeJYzWGMGzllIvPNaJsyzgAXDdeBmfUwML1oivyfKYKrYJ3ZUKZ6HPhiKU+/GC8rW2VdB
 9sJJ1Dsl2Aya6GF6ZC3iOb++gN2B2FLgaxKnxNlE1GidlTF3ybj0JteKz+z0LwuLiAqnfBCZK/g
 0rjDS4hr41nCwBBD1OKwL2k7VDlHDiomVM11z/mqAEDMzseHXdpLLk0zduyr2jW2R/gy30mnxwV
 +8Gf9BVW5xudloqpK079WDA=
X-Received: by 2002:a05:6a20:549d:b0:227:d017:cca9 with SMTP id
 adf61e73a8af0-22fc2ef8aefmr7873503637.9.1752163205801; 
 Thu, 10 Jul 2025 09:00:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKZvSwY3CmIV5v+lZVUqGgU17MjzBptq+XfzqgO2mlClCcIFhGyGBPRJ1ObzBLpEg2WB5zGQ==
X-Received: by 2002:a05:6a20:549d:b0:227:d017:cca9 with SMTP id
 adf61e73a8af0-22fc2ef8aefmr7873428637.9.1752163205177; 
 Thu, 10 Jul 2025 09:00:05 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bc0fa6609sm2072920a12.60.2025.07.10.09.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 09:00:04 -0700 (PDT)
Message-ID: <aef834e0-d6dc-40d0-a6aa-24ed44b77325@redhat.com>
Date: Thu, 10 Jul 2025 11:59:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/12] hw/pci: Introduce pci_setup_iommu_per_bus() for
 per-bus IOMMU ops retrieval
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250708154055.101012-1-shameerali.kolothum.thodi@huawei.com>
 <20250708154055.101012-8-shameerali.kolothum.thodi@huawei.com>
 <aG2M/BI3UAYxKCD3@Asurada-Nvidia>
 <741503f8f96148b389b875e6b6812c1a@huawei.com>
 <aG8ECVeOYXPzBEVB@Asurada-Nvidia>
 <3a51c0e0f3ce4c2580ff596008615439@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <3a51c0e0f3ce4c2580ff596008615439@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Axvq-q8Wfl1sM1U-qwjHBIR-Mlc73D2PEjj7v0_JVus_1752163206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 7/10/25 3:37 AM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Nicolin Chen <nicolinc@nvidia.com>
>> Sent: Thursday, July 10, 2025 1:07 AM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
>> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; imammedo@redhat.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com;
>> gustavo.romero@linaro.org; mst@redhat.com;
>> marcel.apfelbaum@gmail.com; Linuxarm <linuxarm@huawei.com>;
>> Wangzhou (B) <wangzhou1@hisilicon.com>; jiangkunkun
>> <jiangkunkun@huawei.com>; Jonathan Cameron
>> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v7 07/12] hw/pci: Introduce
>> pci_setup_iommu_per_bus() for per-bus IOMMU ops retrieval
>>
>> On Wed, Jul 09, 2025 at 08:20:35AM +0000, Shameerali Kolothum Thodi
>> wrote:
>>>> On Tue, Jul 08, 2025 at 04:40:50PM +0100, Shameer Kolothum wrote:
>>>>> @@ -2909,6 +2909,19 @@ static void
>>>> pci_device_get_iommu_bus_devfn(PCIDevice *dev,
>>>>>               }
>>>>>           }
>>>>>
>>>>> +        /*
>>>>> +         * When multiple PCI Express Root Buses are defined using pxb-
>>>> pcie,
>>>>> +         * the IOMMU configuration may be specific to each root bus.
>>>> However,
>>>>> +         * pxb-pcie acts as a special root complex whose parent is
>>>> effectively
>>>>> +         * the default root complex(pcie.0). Ensure that we retrieve the
>>>>> +         * correct IOMMU ops(if any) in such cases.
>>>>> +         */
>>>>> +        if (pci_bus_is_express(iommu_bus) &&
>>>> pci_bus_is_root(iommu_bus)) {
>>>>> +            if (!iommu_bus->iommu_per_bus && parent_bus-
>>>>> iommu_per_bus) {
>>>>> +                break;
>>>>
>>>> Mind elaborating why the current bus must unset iommu_per_bus
>> while
>>>> its parent sets iommu_per_bus?
>>>>
>>>> My understanding is that for a pxb-pcie we should set iommu_per_bus
>>>> but for its parent (the default root complex) we should unset its
>>>> iommu_per_bus?
>>>
>>> Well, for new arm-smmuv3 dev you need an associated pcie root
>>> complex. Either the default pcie.0 or a pxb-pcie one. And as I
>>> mentioned in my reply to the other thread(patch #2) and commit log
>> here,
>>> the pxb-pcie is special extra root complex in Qemu which has pcie.0 has
>>> parent bus.
>>>
>>> The above pci_device_get_iommu_bus_devfn() at present, iterate over
>> the
>>> parent_dev if it is set and returns the parent_bus IOMMU ops even if the
>>> associated pxb-pcie bus doesn't have any IOMMU. This creates problem
>>> for a case that is described here in the cover letter here,
>>> https://lore.kernel.org/qemu-devel/20250708154055.101012-1-
>> shameerali.kolothum.thodi@huawei.com/
>>>
>>> (Please see "Major changes from v4:" section)
>>>
>>> To address that issue, this patch introduces an new helper function to
>> specify that
>>> the IOMMU ops are specific to the associated root
>> complex(iommu_per_bus) and
>>> use that to return the correct IOMMU ops.
>>>
>>> Hope with that context it is clear now.
>>
>> Hmm, I was not questioning the context, I get what the patch is
>> supposed to do.
>>
>> I was asking the logic that is unclear to me why it breaks when:
>>      !pxb-pcie->iommu_per_bus && pcie.0->iommu_per_bus
>>
>> Or in which case pcie.0 would be set to iommu_per_bus=true?
> 
> Yes. Consider the example I gave in cover  letter,
> 
> -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.1 \
> -device virtio-net-pci,bus=pcie.0,netdev=net0,id=virtionet.0 \
> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.2 \
> -device pcie-root-port,id=pcie.port1,chassis=2,bus=pcie.1 \
> -device virtio-net-pci,bus=pcie.port1,netdev=net1,id=virtionet.1
> 
> pcie.0 is behind new SMMUv3 dev(smmuv3.1) and has iommu_per_bus set.
> pcie.1 has no SMMv3U and iommu_per_bus is not set for it.
pcie.1 doesn't?   then what is this line saying/meaning?:
  -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.2 \

I read that as an smmuv3 attached to pcie.1, with an id of smmuv3.2;
just as I read this config:
  -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.1 \
as an smmuv3 attached to pcie.0 iwth id smmuv3.1

> 
> And we don't want pci_device_get_iommu_bus_devfn() to return pcie.0's
> IOMMU ops for virtionet.1. Hence the break.
> 
> Thanks,
> Shameer
> 


