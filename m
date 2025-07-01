Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2947520dye;
        Mon, 30 Jun 2025 23:32:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU87U9hitdJ7ry9siByb3zntzcq7WE6ztYSaSGVcA3DFyvDw2g1QyvbpipitUnGrwyQp8b0Oo/DDeZptA==@linaro.org
X-Google-Smtp-Source: AGHT+IFl8duZld6TM3iDgriQ3HrrZRdQY/l+zCF1EQnH8yKuv8cpqiP3uvYYMn0Hiwqz6IS0RRu4
X-Received: by 2002:a05:6214:4d41:b0:700:c45d:f88c with SMTP id 6a1803df08f44-7010a956ademr31569736d6.6.1751351538404;
        Mon, 30 Jun 2025 23:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751351538; cv=none;
        d=google.com; s=arc-20240605;
        b=ULU7ax09wgsMqCdIT+6H5XNnn594hqD4x4XYrkrI6BhCOZv7V4EU3PXJ8TFlWZnv0L
         pBxt8beUKslTgNfiuNsywhV3fnH9LU418l6/JvAX5LDbcE3TnYXSwzwVmAQf5poY/6z5
         K8tXXm9tR+ZJIpg+eBwxjC9OFwzk/60wg31QegBqQTNASsgFWFroWjjve7jstljGRprd
         6QTQgUs5P99HnAd+Q8LaEdDvZ0dIy+j7dLSdHWWAESeyr1R1yRodNzSlttFPdRf7Hu3I
         oYpb4oh8IRAR+z4yQ2N9mma+8cM6d6kL1mlCPRjQ+6hJfzBywrJozuEGcLGV9619UrVY
         q2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6LR7ZO0C+TGNIDz+GF9OqXAtZE8ZVPkH1n+UdZpH5KA=;
        fh=vDREcxM7HvCOFfGARwqMzvnaIV88BTvmVd+w1PolsX0=;
        b=IDxmswg44+j/kGNS0+NYps08GIJXHuggekkS1xK3I/1m1b42/hA75Wiw0XtSvNR9ZN
         +C9jidHCWadJxSYWOIgo8qsZqZi6ZLfyyE1fLR9gNm/rxA11aA+976nlP3+SOE1g9sGd
         ahbarmd0BmS7LMsoRAT1E5AiGcCkyAgF9wkJ7AJzSqXAZR6bPu3O9TtZBvOI5covDU7g
         ahcG4bhYpeW6drQplCaCh7MpWLZ8A3592LhY6XRBVIkVGRzk115LwWIy+FtORIqba87G
         c2fniPiIzreU0e43SunU6Pk08of6RGJV4bijuiaoEm8rXmwgfhqb27cF2s0Pevjbfpe3
         BWeA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dy4n8Vrj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77389d62si123868576d6.392.2025.06.30.23.32.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 23:32:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dy4n8Vrj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWUWo-0001kb-A2; Tue, 01 Jul 2025 02:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUWm-0001kL-Ef
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uWUWk-0001sZ-6K
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 02:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751351489;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LR7ZO0C+TGNIDz+GF9OqXAtZE8ZVPkH1n+UdZpH5KA=;
 b=dy4n8VrjeXLZTWmp7X3BNgNlX/fr74mP7MAtv2XjMUY5bkdztdIojvwWfaGTelm7KCiffm
 iqqdwytHaZwElUJuhkcdYuPI/5McnlCHF/PTH/nNhm2eANn1c93hnKRglaDp1GXle5eHTY
 GZwop3cg0SOBiWFL3ln7c5Wd8HpDUMw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-AYLcLdkAMHiuq66RZNbrJg-1; Tue, 01 Jul 2025 02:31:28 -0400
X-MC-Unique: AYLcLdkAMHiuq66RZNbrJg-1
X-Mimecast-MFC-AGG-ID: AYLcLdkAMHiuq66RZNbrJg_1751351487
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450df53d461so23568315e9.1
 for <qemu-arm@nongnu.org>; Mon, 30 Jun 2025 23:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751351487; x=1751956287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LR7ZO0C+TGNIDz+GF9OqXAtZE8ZVPkH1n+UdZpH5KA=;
 b=w2PP7dgMnlx6qIGUSVRdYNXPD6P76eYt3n+mArZCbhdagqd7YCyheO8m2Iu5OYGYjS
 OLfu1kxNvZ77N/9xpWSNNsXH2jZzVgte2Iq7dnnyuwRpM3tGAD4IFNe7ZtSjFHAoTQWC
 D7pjLpDLPxNZnG3NSjRFQkwt7lVvfW0v7BWx03hZbICregjITC8v4BztcoiPzmlBY0Hb
 bn8DIlxlWBLrG0qsofP3kwDGxarSXlrZrfvdTrfbpX8qnleSboFhL4CszlhkUbPHw89m
 /hlcJJmt7vp77Ml6YRS4gHzUKHl5a5an9+UoaEaVbNraGA2c2HXaDeyWdDpC0Vtj2UJP
 qjfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdQfxJvwxFFei0T5CneN1e33nFliL5LlChXalghTp5oMXctvXPUfU3vpzHwtgw7XLdW/Woeov+pw==@nongnu.org
X-Gm-Message-State: AOJu0YwjkXuRPNUgAkCKghSHpYBt4nNDw3dLXRowcWUa5VXm12eY0W1Y
 142dYCxCQj4jqznIjJxyPKDhHZKQemQQGpCyMsCcXBM/M8L4pb2tGqTO36j5j0Svd0olsjXS/Pp
 o66xEd4S2F8DLin91Q5rq1sDoYaC05JqrKBhhjlB1gCOpPdT+RWqF/w==
X-Gm-Gg: ASbGncuFs1rych6T0Sao8C7trK6vMeYzy7RPUZvZ3M9TQAWkittsniM34gZWDpBjBjS
 BAUfJqz49lWgZmIEAWSmvXnykIhDEhVtVHvz/1T6aJ98lOmvSZlRu2BSS96k0HnP+la1M93v9eE
 P5D6qw9u2qw/tzBRuyIVuVWZKsC/dRwu3ZjN29mjDOABzfJ+K1NtooGUht7jx9brmgjxuqhj5rO
 fnXRkhawaxjie9dvncK/OgdxqDbeCqLKUFlaqN4qCJd2r1Rz6AWb8bnntc5QatNpUGy1rhcQwc3
 XS9qvLb2IoDFI0alMlSdxkJ4hfTQ89ELliEPU8+xvNjzT2FPtFEGRXSHC2+DOQ6r2ZwpYg==
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id
 5b1f17b1804b1-453902d3100mr146674155e9.12.1751351487019; 
 Mon, 30 Jun 2025 23:31:27 -0700 (PDT)
X-Received: by 2002:a05:600c:a009:b0:453:dbe:7574 with SMTP id
 5b1f17b1804b1-453902d3100mr146673715e9.12.1751351486515; 
 Mon, 30 Jun 2025 23:31:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59736sm12227960f8f.74.2025.06.30.23.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 23:31:25 -0700 (PDT)
Message-ID: <90fc6fd8-fe67-4a16-b287-69da9861f180@redhat.com>
Date: Tue, 1 Jul 2025 08:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/11] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "nicolinc@nvidia.com"
 <nicolinc@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>,
 "gustavo.romero@linaro.org" <gustavo.romero@linaro.org>,
 Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
 <20250623094230.76084-2-shameerali.kolothum.thodi@huawei.com>
 <ce1d4b22-d613-4143-9b50-bd3e8047bff8@redhat.com>
 <5a0ee9d2e27e47e6a4b443ef6e645b52@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5a0ee9d2e27e47e6a4b443ef6e645b52@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZImdLDDSREJ8fseh2CRDb7Qolia7_uld1GaQdjPjZ8o_1751351487
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 7apQP9UuJGzO



On 6/30/25 9:01 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
>
>> -----Original Message-----
>> From: Eric Auger <eric.auger@redhat.com>
>> Sent: Friday, June 27, 2025 12:52 PM
>> To: Shameerali Kolothum Thodi
>> <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
>> qemu-devel@nongnu.org
>> Cc: peter.maydell@linaro.org; jgg@nvidia.com; nicolinc@nvidia.com;
>> ddutile@redhat.com; berrange@redhat.com; imammedo@redhat.com;
>> nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com;
>> gustavo.romero@linaro.org; Linuxarm <linuxarm@huawei.com>; Wangzhou
>> (B) <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>;
>> zhangfei.gao@linaro.org
>> Subject: Re: [PATCH v5 01/11] hw/arm/smmu-common: Check SMMU has
>> PCIe Root Complex association
>>
>> Hi Shameer,
>>
>> On 6/23/25 11:42 AM, Shameer Kolothum wrote:
>>> We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based extra
>>> root complexes to be associated with SMMU.
>>>
>>> Although this change does not affect functionality at present, it is
>>> required when we add support for user-creatable SMMUv3 devices in
>>> future patches.
>>>
>>> Signed-off-by: Shameer Kolothum
>> <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  hw/arm/smmu-common.c                | 29 ++++++++++++++++++++++++++---
>>>  hw/pci-bridge/pci_expander_bridge.c |  1 -
>>>  include/hw/pci/pci_bridge.h         |  1 +
>>>  3 files changed, 27 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index f39b99e526..b15e7fd0e4 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -20,6 +20,7 @@
>>>  #include "trace.h"
>>>  #include "exec/target_page.h"
>>>  #include "hw/core/cpu.h"
>>> +#include "hw/pci/pci_bridge.h"
>>>  #include "hw/qdev-properties.h"
>>>  #include "qapi/error.h"
>>>  #include "qemu/jhash.h"
>>> @@ -925,6 +926,7 @@ static void smmu_base_realize(DeviceState *dev,
>> Error **errp)
>>>  {
>>>      SMMUState *s = ARM_SMMU(dev);
>>>      SMMUBaseClass *sbc = ARM_SMMU_GET_CLASS(dev);
>>> +    PCIBus *pci_bus = s->primary_bus;
>>>      Error *local_err = NULL;
>>>
>>>      sbc->parent_realize(dev, &local_err);
>>> @@ -937,11 +939,32 @@ static void smmu_base_realize(DeviceState
>> *dev, Error **errp)
>>>                                       g_free, g_free);
>>>      s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>>>
>>> -    if (s->primary_bus) {
>>> -        pci_setup_iommu(s->primary_bus, &smmu_ops, s);
>>> -    } else {
>>> +    if (!pci_bus) {
>>>          error_setg(errp, "SMMU is not attached to any PCI bus!");
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * We only allow default PCIe Root Complex(pcie.0) or pxb-pcie based
>> extra
>>> +     * root complexes to be associated with SMMU.
>>> +     */
>>> +    if (pci_bus_is_express(pci_bus) && pci_bus_is_root(pci_bus) &&
>>> +        object_dynamic_cast(OBJECT(pci_bus)->parent,
>> TYPE_PCI_HOST_BRIDGE)) {
>>> +        /*
>>> +         * For pxb-pcie, parent_dev will be set. Make sure it is
>>> +         * pxb-pcie indeed.
>>> +         */
>>> +        if (pci_bus->parent_dev) {
>>> +            if (!object_dynamic_cast(OBJECT(pci_bus), TYPE_PXB_PCIE_BUS)) {
>>> +                goto out_err;
>>> +            }
>> I still wonder whether the above check was mandated as it works for what
>> it is meant:
> Added that check to make sure we don't support pxb-cxl which is of type
> PCI_HOST_BRIDGE. Once the cxl support for ARM is up streamed and tested
> with SMMUv3, we can relax this if required.
agreed. I would add this in the commit msg while rebasing.

Eric
>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Thanks,
> Shameer
>

