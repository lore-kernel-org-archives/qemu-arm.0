Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2729574njc;
        Tue, 17 Jun 2025 12:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6J7ba+zpqBYvMCA9pp1xC5kGjryC277c1kedQ5tEgMOU815nA9HvHq5sWEofqNkPXglPDQtHdw5l3Zw==@linaro.org
X-Google-Smtp-Source: AGHT+IGszu11wV30MejVdLLTjYGNQXh2AnDdshscQlw3WxQhyKziATVMwXvlh3s7Chxv/Le7k5KW
X-Received: by 2002:a05:622a:144:b0:4a4:40b7:9cc with SMTP id d75a77b69052e-4a73c55b563mr222792491cf.12.1750187571453;
        Tue, 17 Jun 2025 12:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750187571; cv=none;
        d=google.com; s=arc-20240605;
        b=ByQyIlDfP41676uSvt0E6Z8VfjL7nqv5lva+V4fOsEl68gXLwnIioYYS0OeK4Fu5FA
         /HV6qgETGLKmq0RJnyC0gba4u8Pws0X88Xj0lV0eOsq8mhhGTO4LMDV+70nth+FDU3Uc
         v1HsFH4cIz7AwrEnbX9O1AVXrSVY+0+Yc9ZLAEI4rtmCpmG1SqF1aR4rNQkWwsnLNyp9
         4HF1394bJwlDYkygYBZAUmsskI9xDBCGFoHGzeaUh723DIWQtjXtGkwLnaJaPIJFtEyd
         oyRz1Or8z4jMtvLPlHyeM1QpYnHNKC137AdHUsx3K5FBISTMY4jEXpdvfaiwLhwBOuOs
         QnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gygR1+tTMe1iS51p2byOm8gyoI1notM5PdioMtDYE/k=;
        fh=Z4PH0FUFOahg0ZOWiHc0I0wXpN+cult37d/weMRj8NA=;
        b=kenH3cXDyl6Yqo7zo8zBAsUuA+uEVn3WqaUVxv396MSXSQhUm9Nv5g2/Qs2NyLFas7
         1n3LZkVvBlkjE8L5EakEU9UdOWIXPp5jOnJKbkedR4LCYRXa4cAmNMb6d2pkg07H85d+
         BlPndDTAlorXCFH06s/6AonEhQOmgXHekUXYoEVbrGuFfYuR3iiJ9CBvOcI2GqvUvO6S
         4vWtF3d5SZv9g6RS/Z+bjsCTf+dUa71yD7NPXlWFZTWi7C3VvWXjLUfTT1aF85IFYoNb
         H4rc5DAs/Uhd+U9lLvs48h4zA8c7lOBNJGYUomHxKQnIKZN7JfZWMz2o4XllP+erzI8A
         O12A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPyTsvpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4b1bd8si128170161cf.326.2025.06.17.12.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jun 2025 12:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XPyTsvpN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRbjZ-0000dP-AI; Tue, 17 Jun 2025 15:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uRbjX-0000d6-BB
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 15:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uRbjV-0003Vt-CH
 for qemu-arm@nongnu.org; Tue, 17 Jun 2025 15:12:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750187550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gygR1+tTMe1iS51p2byOm8gyoI1notM5PdioMtDYE/k=;
 b=XPyTsvpNHt0qCKPqHhZV4FmkNNjV8ZMTb8sW9LiFTZY6PdJhofmvXhPU3G6ObrcEwTB7xo
 voozz2D5KR0HaRowetMBy1eV0dElHqiTKacrtB5E3t1yndHxYCnXabxaWR+Au2+4zZdKYZ
 64GcGUOHw66ZAyGcu8DUAlh3WwTGNWI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-dhyuMFrENGKwlGj55nt7RQ-1; Tue, 17 Jun 2025 15:12:27 -0400
X-MC-Unique: dhyuMFrENGKwlGj55nt7RQ-1
X-Mimecast-MFC-AGG-ID: dhyuMFrENGKwlGj55nt7RQ_1750187546
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-234b133b428so44844565ad.3
 for <qemu-arm@nongnu.org>; Tue, 17 Jun 2025 12:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750187546; x=1750792346;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gygR1+tTMe1iS51p2byOm8gyoI1notM5PdioMtDYE/k=;
 b=g1Lc/DVO7bHEwekczazyvNRFzyt6eTKwc9PaTdAYt3AVNuLTyo4TZEqJbt0Z3RHG6u
 SLmpLq05GOe4NCP+q6dJS3ag3+1GFm7438c2W1TzokzXi7VZswYq/dcATAm0sAnZNMX9
 7qS2z9y3XjQyjHNn2/tWesRz54Vs8VeMkQByiiCehupByAT0KE84b4qzMXcTOxFkDx2q
 Atr0REwa0q0GffMHWXYx7IqjaZBFlyqQfbJdNPjbHvkUFw0lrVUgxsT0uxz96crhKEtq
 QchUxnr8k25mAljuiXcua+AYwLd0jEz/usEyZGcYfYaBwSKQJxXQeR7dK1BU9mfSQuf+
 eQYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcOlcFukmKoxNFF0zypkKu7Dwdn/0Nqz37z4rFHop7jXz66MRZubPk3aDm2ycIcCv2DR6mGQi7Ug==@nongnu.org
X-Gm-Message-State: AOJu0YzntvJl2PqnmA5zUskVXTJlwYOw9J7ZBTzSuZBULn3qti7Y80p9
 hzV/IYbWpP0rU4cLlLMuhFsJLa5sIx6nHN2Wa95WX73tDLC/0nFrb5XcdQIlmbJSB+kJ/9mbLHJ
 wdopFolJTbwzHceAvPknZB9Bixq7DILZMCDVEskPtGtDIUY290G/YZw==
X-Gm-Gg: ASbGnctvSuyW58EbfL9XoUSUxqVBnqUnQLgDEtEq1YPXPxiIEX7rmKggYluXZShKbeb
 Is3nN87oOQpgBBoLtWQrQZEtlrqesJbBIaGUiBC+ZQvdHkheVP66ECnP3wX0YEqn99L8MPEJ3SV
 9EH2L2v3O2r4VqgfV08xitFZRXRgVr6zz4rnmFniiGfFkd/BT3VOGXlJfu8oRSL606GV6pga+6Q
 wUkjcRseT5tG1y6znHR8jI+9ZzCtaNM0zuGLbeTiM98uyDNI0WPicY/P9t8pb3bXV1YsIADenqz
 lVtfzmVuwn62qLlHCk1KKaQ=
X-Received: by 2002:a17:902:cec6:b0:234:9052:2be6 with SMTP id
 d9443c01a7336-2366b145439mr219343095ad.41.1750187546400; 
 Tue, 17 Jun 2025 12:12:26 -0700 (PDT)
X-Received: by 2002:a17:902:cec6:b0:234:9052:2be6 with SMTP id
 d9443c01a7336-2366b145439mr219342785ad.41.1750187545999; 
 Tue, 17 Jun 2025 12:12:25 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236934a9be9sm17241315ad.47.2025.06.17.12.12.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 12:12:25 -0700 (PDT)
Message-ID: <942c316e-47d4-4337-992b-d7bfb67810ae@redhat.com>
Date: Tue, 17 Jun 2025 15:11:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root
 Complex association
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Eric Auger <eric.auger@redhat.com>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 linuxarm@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 berrange@redhat.com, imammedo@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, zhangfei.gao@linaro.org
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
 <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
 <20250616112019.00003bce@huawei.com>
 <fcd05844-d2d9-450e-b962-59b0f3964185@redhat.com>
 <20250617175247.00007d43@huawei.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20250617175247.00007d43@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W7USPrK6fk2alFbKkgltWCsEFGllhHrUyE6qymf126A_1750187546
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.89,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dEZ5rtqZF14i



On 6/17/25 12:52 PM, Jonathan Cameron wrote:
> On Tue, 17 Jun 2025 09:49:54 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> On 6/16/25 12:20 PM, Jonathan Cameron wrote:
>>> On Fri, 13 Jun 2025 15:44:43 +0100
>>> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>>>   
>>>> Although this change does not affect functionality at present, it is
>>> Patch title says PCIe.  This check is vs PCI host bridge.
>>>
>>> No idea which one you wanted, but if it is PCIe needs to be
>>> TYPC_PCIE_HOST_BRIDGE from pcie_host.h not the pci_host.h one
>>> I think.
>> I think we need TYPE_PCI_HOST_BRIDGE as we want to check against pxb
>>
>> pci-bridge/pci_expander_bridge.c:    .parent        = TYPE_PCI_HOST_BRIDGE,
> 
> Hmm. That's awkward and I'd forgotten that wrinkle.
> Need a stronger test but which one?  The PXB root bus has a parent of
> TYPE_PCIE_BUS.  Maybe we can check that?
> 
Yeah, rooted in the problem that we should have pci-switches or pci-rp's,
not just 'pxb'.


> 
>>
>> Besides the commit title/desc suggested by Jonathan you may also refine
>> the error msg which can stem now from 2 different causes
>>
>> Thanks
>>
>> Eric
>>>   
>>>> required when we add support for user-creatable SMMUv3 devices in
>>>> future patches.
>>>>
>>>> Tested-by: Nathan Chen <nathanc@nvidia.com>
>>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>>> ---
>>>>   hw/arm/smmu-common.c | 4 +++-
>>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>>> index f39b99e526..7890aa12c1 100644
>>>> --- a/hw/arm/smmu-common.c
>>>> +++ b/hw/arm/smmu-common.c
>>>> @@ -20,6 +20,7 @@
>>>>   #include "trace.h"
>>>>   #include "exec/target_page.h"
>>>>   #include "hw/core/cpu.h"
>>>> +#include "hw/pci/pci_bridge.h"
>>>>   #include "hw/qdev-properties.h"
>>>>   #include "qapi/error.h"
>>>>   #include "qemu/jhash.h"
>>>> @@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
>>>>                                        g_free, g_free);
>>>>       s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
>>>>   
>>>> -    if (s->primary_bus) {
>>>> +    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)->parent,
>>>> +                                              TYPE_PCI_HOST_BRIDGE)) {
>>>>           pci_setup_iommu(s->primary_bus, &smmu_ops, s);
>>>>       } else {
>>>>           error_setg(errp, "SMMU is not attached to any PCI bus!");
>>
>>
> 

