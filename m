Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1021288ejb;
        Fri, 26 May 2023 02:33:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7/JjD/XOcICin9gUoyQMpMqN/PeXGeIdPhu07HmmcfX4AiagbqdDerLvsHZc49xzcPeegD
X-Received: by 2002:a05:620a:4115:b0:75b:23a1:456 with SMTP id j21-20020a05620a411500b0075b23a10456mr1581185qko.28.1685093622107;
        Fri, 26 May 2023 02:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685093622; cv=none;
        d=google.com; s=arc-20160816;
        b=wxgAfo/M1z5LLw3uD2kVo0BcW9AeWDArIOgoDtMXMOsNqFp7ua2u5tsFDEi22Xelb9
         szbb/b94WI1fMW6OHV4CyQdZp17AOMYD16yOKs6huvEJQYjF2wfrKTdfvahA4bHg2HWr
         qWHw72hAuyF78AQGtwHfvz+NFPWK6nfHz3HXR5Yyhp9Axz4A2DJ/lKIjQv5slMKH4xtY
         8OSMYDuK5dHYHr4cDgcjCy6sTb8wJNQqakEJt7kbOIYER7wunftXjtMYcj/HMtPtG9SI
         isP+IBGJkcg+/J04DsOBWyh8AsaQtuGNKBHBrrS9SZXgouZXRMGUCXpgbErWKvKFDedm
         pjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :cc:to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=lapu/jDHLbNZjxWGCm3K8M8bmzl2u0jJ1zbVd9PWtS8=;
        b=zgcmFOiHZqBbKd9U1EXGRiEfO18DQVqlV1DiehEjgORrIrvJPrTyyxnmqCO5E62Il0
         qyUO1+7WUkqYxCaFvru3fy6rJx6BJU9pp7W3fE1/pyhDxchZwwI69iSZ7OKkViEiI7hz
         5Bcq3gvGzQuzSPpID9iIVuspoKrFlg91cGtm4jB5A1XgiuzHXSBWPESedE3LSs6I1e/i
         anO6htfsW+jynOH2IUi++jJmB3DAZ78Bpl5+9lgbL2Q71fR+0c+gTzMVxIRHL8tRxRuO
         n7/OflnURiBa0KA5hP5oq+MJ0oVXjyORjAXFWXGBglgsiC9F+Pqmm1TNhyce4TldtnQi
         GfCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hs94BRij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9-20020a05620a112900b0074df20fb42bsi1276230qkk.13.2023.05.26.02.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 May 2023 02:33:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hs94BRij;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2Tp7-0006l5-0Q; Fri, 26 May 2023 05:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q2Tp4-0006j1-10
 for qemu-arm@nongnu.org; Fri, 26 May 2023 05:33:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q2Tp2-0005fh-Ah
 for qemu-arm@nongnu.org; Fri, 26 May 2023 05:33:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685093599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lapu/jDHLbNZjxWGCm3K8M8bmzl2u0jJ1zbVd9PWtS8=;
 b=hs94BRijCoO3ms3kgQghqwq/w6ZORPQpZayJMVNyNPZIMK2Ge7BhUwDN3vPw9wLzQhrxjT
 +11ub0XE+dCkbYvFLeLnX6Xt292nwN37m/IXy5AIKdaSJeBJHVSUzFW9wA5C/1Fnmppc11
 hhcTKH6N36iR8OT2gs5SVNDDKmdRr1o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-8mT351vdNNCGXPj0X3uIsw-1; Fri, 26 May 2023 05:33:18 -0400
X-MC-Unique: 8mT351vdNNCGXPj0X3uIsw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f5fffb828eso7517325e9.1
 for <qemu-arm@nongnu.org>; Fri, 26 May 2023 02:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685093597; x=1687685597;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lapu/jDHLbNZjxWGCm3K8M8bmzl2u0jJ1zbVd9PWtS8=;
 b=RF3EscXj51m9YpP4xyPorXyzlMzpPdSZ2L25kP2sQPBbyVPHQRlt1zsSVVdtGwCygB
 0gfoPrxuxrc+bsqk4EdsEtwHafB7gq8Nf+csNIWn7K5FEFHsS618IL+kU7TAHyzim0u/
 4Waaz+G2v8PD0ltKqTBE2SjUJfMgg9MEYwr7vVLMKxA3CL4TV471qzoM2aSCjdVwXQLm
 iVejGGsC5sPEeHO5E0SmPnAfJ62rNMVSMryMGlvSg++z9xaK9LdOSaKKrPzXlnhlv9vk
 Vo76RMk1TVbAQdaAG4em41yK82M/sESOJh/NsWcTiPkOn9lIO7UY+E239NiFvXZj78iU
 J4vw==
X-Gm-Message-State: AC+VfDy/mKgEkHWNKb3l7mdGYeIOro3bo7c0r5W45HrRji5Cj4r05+EN
 aBzH0aFoT2p4uXKRbF7w+Ph+gd6ze7BI4SXyyGOH8YspF3R2VoC0tgkrZVYM+w4CfCUb9k1Lf0Y
 DiMo3rewY4KaW
X-Received: by 2002:a05:600c:19c9:b0:3f6:6f26:7254 with SMTP id
 u9-20020a05600c19c900b003f66f267254mr3694397wmq.3.1685093597367; 
 Fri, 26 May 2023 02:33:17 -0700 (PDT)
X-Received: by 2002:a05:600c:19c9:b0:3f6:6f26:7254 with SMTP id
 u9-20020a05600c19c900b003f66f267254mr3694383wmq.3.1685093596973; 
 Fri, 26 May 2023 02:33:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c710:9700:7003:7e4d:43dd:7bfd?
 (p200300cbc710970070037e4d43dd7bfd.dip0.t-ipconnect.de.
 [2003:cb:c710:9700:7003:7e4d:43dd:7bfd])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a7bc4d2000000b003f427687ba7sm4523874wmk.41.2023.05.26.02.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 May 2023 02:33:16 -0700 (PDT)
Message-ID: <3c47ef15-05ce-8d46-2beb-4a06731939c2@redhat.com>
Date: Fri, 26 May 2023 11:33:15 +0200
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
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: JFLOYn3AId+b

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

With

void memory_devices_init(MachineState *ms, hwaddr base, uint64_t size)
{
     g_assert(!ms->device_memory);
     ms->device_memory = g_new0(DeviceMemoryState, 1);
     ms->device_memory->base = base;

     /*
      * An empty region (size == 0) indicates that memory devices are supported
      * by the machine, but they are not enabled (see memory_device_pre_plug()).
      */
     memory_region_init(&ms->device_memory->mr, OBJECT(ms), "device-memory",
                        size);
     memory_region_set_enabled(&ms->device_memory->mr, !!size);
     memory_region_add_subregion(get_system_memory(), ms->device_memory->base,
                                 &ms->device_memory->mr);
}

"info mtree -D" on x86-64 with only "-m 2G" (no maxmem) will show that the
region is placed at address 0 and disabled:

memory-region: system
   0000000000000000-ffffffffffffffff (prio 0, i/o): system
     0000000000000000-0000000000000000 (prio 0, i/o): device-memory [disabled]
     0000000000000000-000000007fffffff (prio 0, ram): alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
     0000000000000000-ffffffffffffffff (prio -1, i/o): pci


Good enough for me.

However, I think we could just stop allocating ms->device_memory with size == 0 and
not care about the "not supported" case in memory_device_pre_plug(): this function should
only get called by a machine, and if the machine does not support memory devices, it is
to blame for calling that function after all. (and it will only affect the error message
after all)

-- 
Thanks,

David / dhildenb

