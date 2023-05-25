Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp449040ejb;
        Thu, 25 May 2023 06:40:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ikv1PDPQ5ktLpm2nIJOV83VDvZrgq9U/B9NZVbiZAbr15yRtbugXTf9ZiFGJ7+tCAAolo
X-Received: by 2002:ad4:5f0d:0:b0:621:33a2:4a3b with SMTP id fo13-20020ad45f0d000000b0062133a24a3bmr1263778qvb.48.1685022053230;
        Thu, 25 May 2023 06:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685022053; cv=none;
        d=google.com; s=arc-20160816;
        b=AeDKLMX5PQHLb0jYlb9edpgWi3SPsIsCnmxlt/SnVv0ZZd+gS9jDoSIjgeoHueV4WR
         Lp4Pa58CNIRlSAraWd8YhkqsK6E1nRfUafq55WKZoRHGPP1ENVjWwYO7jgR3qaFaJzHI
         HM8gyr9oSGT78s2g+LPULCg8wgITJu/10VgYEWVrHleHnR1fNgdR4yCndGpbz2ZQSJry
         9J3qlxkEM8rcwr1Ve65tgWYDrcK0ewzaoFHawoRHZXdGhObrlZviDxPk8sw/X4wsR7ld
         O28qWWHi9cppziaWO0On6HnNQoeuDkqo8O4Uka5yHTM50l52LrrjEA2fxibew+nv9Q/0
         iwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :cc:to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=p3TEsEg1Uyk/qryI/0DgbPNmc12+z7O76PXfVfETWas=;
        b=j01V/9AmmSeooI8NfxprCm8ifeWe4q+XXGe1CPKZDZH2KvEK8ZbBf3JloNjFjjVuZa
         dJhDyIveQnkL1Kya1wzjZq/DEKPNdL3zi1515f0K9+0tDaXmxkfSoC6CBfcJGsLTx6TV
         BuAbIXDMIIR9f5L2BtlsOHtxBT7I//KJynGE4udXYEv3zlJTOWFe4hQNQCwqYpa/wtfa
         Fy7Ct+Cyf+1SBqo1BvZiQSE+7V8jNvna+eCq2XQPpjoHSNTjh6TyfmVL6OpYq/aw3dae
         sm8acfT902BVuXp0GFXoyd5zObNbgBgMINj9qFlCZD2mldUbOQ8l4/tRWQ7zG1vgaxV1
         A0hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QAkqVin+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm13-20020a056214268d00b006236d96c8e3si482903qvb.348.2023.05.25.06.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 06:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QAkqVin+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2BCo-000879-2W; Thu, 25 May 2023 09:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q2BCn-00085g-Bu
 for qemu-arm@nongnu.org; Thu, 25 May 2023 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q2BCY-0008UY-75
 for qemu-arm@nongnu.org; Thu, 25 May 2023 09:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685022021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3TEsEg1Uyk/qryI/0DgbPNmc12+z7O76PXfVfETWas=;
 b=QAkqVin+uSThlMmKYGXBJbZukZ8vzSC5d8SNVM+LgzJjTP7LfnzHhunJGKIlUm6Q0vUV8r
 E+TIzkbyXGHgbbmrjuzJGdveEBl6F2J0QY2atMQ62ScSS7eM/p0+dxTo/cARK0vYCYkr6h
 LYCaJChvJYqddBUf8ZjUtby81XaNix4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-W3HwIXyEOOqlYJqyt3N9ag-1; Thu, 25 May 2023 09:40:18 -0400
X-MC-Unique: W3HwIXyEOOqlYJqyt3N9ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f5df65fa35so2583985e9.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 06:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685022017; x=1687614017;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p3TEsEg1Uyk/qryI/0DgbPNmc12+z7O76PXfVfETWas=;
 b=Hx32Ou5H585ma0P9BuCgA5r4FYaXmx5QjIDdpCsylO2zR135Jc/z+hzn1C4Qe30cq/
 D7Wu71v2tV29WEfAWkSoE6HAz4WJUjKCwTqv0ElT7/OqIg0HecGoCOVS8PjsyWysY6jN
 l12ZRMEUEKYhRlKJwf7ZtbpGVhWSD2ogcLSNIjuKY1Z/evZQA1zOECqVsAR3zUqgUjI8
 c56sQcwQzrmH2LkT7M2Myc2GIB6t0V3F+nwy1SO/GWmfUi8EJPy7fnwsD53XXNpJb2aK
 q+Z0Ndk9b7xXH9s4cgvHA87bBkKrzDGn/3zpzqnd/n1wlYY2nNEfPkA07y64zPY4inGS
 TK6w==
X-Gm-Message-State: AC+VfDzLCcJ1DQxZerlOb1UB1VPBJ/r3R8Erk8pL/Bw+lgt4Tu1veIVy
 zgdEZ0XAj+Bwxwf/U98Wm4kOss+H+x6oaj67clv8miqoS6VL8tP+ikOioGHdz1v7PXFVI4RAid6
 FYTjEOKoCZxB4
X-Received: by 2002:a7b:ce96:0:b0:3f6:7af:8fe7 with SMTP id
 q22-20020a7bce96000000b003f607af8fe7mr2442417wmj.10.1685022016963; 
 Thu, 25 May 2023 06:40:16 -0700 (PDT)
X-Received: by 2002:a7b:ce96:0:b0:3f6:7af:8fe7 with SMTP id
 q22-20020a7bce96000000b003f607af8fe7mr2442393wmj.10.1685022016526; 
 Thu, 25 May 2023 06:40:16 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884cdsm5653862wmg.36.2023.05.25.06.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 06:40:16 -0700 (PDT)
Message-ID: <b2108d2d-3123-def0-a3af-d4de57e7f72e@redhat.com>
Date: Thu, 25 May 2023 15:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230523185144.533592-1-david@redhat.com>
 <20230523185144.533592-3-david@redhat.com>
 <d2b91574-a6cb-32be-2713-ba6bf6b7e565@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 2/3] memory-device: Factor out device memory
 initialization into memory_devices_init()
In-Reply-To: <d2b91574-a6cb-32be-2713-ba6bf6b7e565@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.091, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: HPgn2NHu9pdQ

On 25.05.23 15:30, Philippe Mathieu-Daudé wrote:
> Hi David,
> 
> On 23/5/23 20:51, David Hildenbrand wrote:
>> Let's factor the common setup out, to prepare for further changes.
>>
>> On arm64, we'll add the subregion to system RAM now earlier -- which
>> shouldn't matter, because the system RAM memory region should already be
>> alive at that point.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    hw/arm/virt.c                  |  9 +--------
>>    hw/i386/pc.c                   | 17 ++++++-----------
>>    hw/loongarch/virt.c            | 14 ++++----------
>>    hw/mem/memory-device.c         | 20 ++++++++++++++++++++
>>    hw/ppc/spapr.c                 | 15 ++++++---------
>>    include/hw/mem/memory-device.h |  2 ++
>>    6 files changed, 39 insertions(+), 38 deletions(-)
> 
> Split in boring 'first add method then use it for each arch'
> would be easier to review.

Right, I agree if I'd be touching more code (I consider this fairly 
minimal and straight-forward refactoring).

> 
>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
>> index 6c025b02c1..d99ceb621a 100644
>> --- a/hw/mem/memory-device.c
>> +++ b/hw/mem/memory-device.c
>> @@ -17,6 +17,7 @@
>>    #include "qemu/range.h"
>>    #include "hw/virtio/vhost.h"
>>    #include "sysemu/kvm.h"
>> +#include "exec/address-spaces.h"
>>    #include "trace.h"
>>    
>>    static gint memory_device_addr_sort(gconstpointer a, gconstpointer b)
>> @@ -333,6 +334,25 @@ uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
>>        return memory_region_size(mr);
>>    }
>>    
>> +void memory_devices_init(MachineState *ms, hwaddr base, uint64_t size)
>> +{
>> +    g_assert(!ms->device_memory);
>> +    ms->device_memory = g_new0(DeviceMemoryState, 1);
>> +    ms->device_memory->base = base;
>> +
>> +    /*
>> +     * See memory_device_get_free_addr(): An empty device memory region
>> +     * means "this machine supports memory devices, but they are not enabled".
>> +     */
>> +    if (size > 0) {
>> +        memory_region_init(&ms->device_memory->mr, OBJECT(ms), "device-memory",
>> +                           size);
>> +        memory_region_add_subregion(get_system_memory(),
>> +                                    ms->device_memory->base,
>> +                                    &ms->device_memory->mr);
> 
> What about always init/register and set if enabled?
> 
>     memory_region_set_enabled(&ms->device_memory->mr, size > 0);
> 
> Otherwise why allocate ms->device_memory?

We have right now:

ms->device_memory not allocated: no support
ms->device_memory->mr with size 0: not enabled
ms->device_memory->mr with size > 0: enabled

Let me see if initializing a memory region with size 0 (and adding a 
subregion with size 0) works.

Thanks!

-- 
Thanks,

David / dhildenb

