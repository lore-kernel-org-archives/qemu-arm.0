Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp681285lfk;
        Thu, 14 Apr 2022 00:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCfX6uEgrJg/16Ea0J3eQY0piZJUkX9XOwlEQqlVV1kr1iTJt7mYp5m4dUbHT0QTiS1l31
X-Received: by 2002:ad4:5903:0:b0:444:45b9:e71a with SMTP id ez3-20020ad45903000000b0044445b9e71amr2138715qvb.101.1649923031614;
        Thu, 14 Apr 2022 00:57:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649923031; cv=none;
        d=google.com; s=arc-20160816;
        b=eeL+qIvJM7o51VyuwiFHt398OW+bc5I+0W+PXRbl68kqM9e7ihh5YUoS4ipFMq0DR0
         0DhY2/kOn3TBHYyg6S5RHstZdU+voVR46/hkQyQnBoJYcK3CTarZU0GuUhNbQFYOmaLg
         SUWbD8fl3SGdjO/tj4Rt+3DEKgbTGo7wI8OCOXj9fGooXwORQqbZeDVEyXcYfD4ZpyoH
         4LLWJ+4oh3E/xYpRYa2evy4qUfxsFhIlyAVcI4wwMRP1zSPST1ZvY39ldjlQB9S5OMyS
         gO4f2kUahzSZgqyuDzJIFNKkRB5Xp2wTrhRW75UX7WJzQWJzqsCluOs7tPPKrj1tarJn
         vabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=tE0REpvIzfETV3Ec/hVy2iD2Qj4moErQjMsT8f8i/go=;
        b=LJN8F7dLzH4SKUGwkvos9UEV1AulVfxIZJchj9Zvi6QhyLnSHfcZKVUmHpKO433gci
         xfsuzQ4Y3AK57WoGOgv4lqsUjJjS4BGXUbs/64q0VbqMxEPrAKtnxueYVX+VOfgMOr0h
         Z7AmdZAo/rfoZ9QAWOkQcoD1pnkfLYRxkFoYpHaf3GnsZ+XX4fel2qLRHG7RXtJ4y/hQ
         tJa1WF7LSRt2UQWK+WufVTlaKeVEDU0y5xB3ul7/bITUyjxTTMgh4Biiz/Se+l3fK0iE
         MO1VMalzUUylaOrHsplJMEM0wCm91NQJ2Lo83nVBlc+vypcGoLgH/L4cPbRjlfSfzQdp
         wRMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NdS44BA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi17-20020a05620a319100b0069c399481b0si4041098qkb.322.2022.04.14.00.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Apr 2022 00:57:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NdS44BA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1neuLn-0001uR-4C
	for alex.bennee@linaro.org; Thu, 14 Apr 2022 03:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neuLM-0001t7-9t
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 03:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1neuLJ-0001MA-Ku
 for qemu-arm@nongnu.org; Thu, 14 Apr 2022 03:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649923000;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tE0REpvIzfETV3Ec/hVy2iD2Qj4moErQjMsT8f8i/go=;
 b=NdS44BA4WWUFtfrxbZwd8kOsrv+eymST/lBBtgkv3dZNJYQVMszAHGs8CWo5YrUmQ1s4jj
 EmbF2axE2pRmqvC+i01WGknSBNId0gwqgcx4ZD4mf0TJgQ8601ELu6mxam7s+ZnGTEtS+d
 nd9RxXTLr9oUdMTZOH/4r+O3gNwf0+k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-nBqjZ84GOpWbphMbF_jDNQ-1; Thu, 14 Apr 2022 03:56:37 -0400
X-MC-Unique: nBqjZ84GOpWbphMbF_jDNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F9B2296A611;
 Thu, 14 Apr 2022 07:56:37 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F50111D3CC;
 Thu, 14 Apr 2022 07:56:31 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
 <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
 <6e27668c-0895-fcc8-165e-673aded5ba47@redhat.com>
 <f45a3f17-7cef-3d8c-e79c-e6a5898e665e@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <d615b714-90a8-8b49-8cf5-04b4f31de0c9@redhat.com>
Date: Thu, 14 Apr 2022 15:56:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <f45a3f17-7cef-3d8c-e79c-e6a5898e665e@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O6+OCDljWbrN

Hi Yanan,

On 4/14/22 10:27 AM, wangyanan (Y) wrote:
> On 2022/4/14 8:06, Gavin Shan wrote:
>> On 4/13/22 7:49 PM, wangyanan (Y) wrote:
>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>> This adds cluster-id in CPU instance properties, which will be used
>>>> by arm/virt machine. Besides, the cluster-id is also verified or
>>>> dumped in various spots:
>>>>
>>>>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>>>      CPU with its NUMA node.
>>>>
>>>>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>>>      CPU with NUMA node when no default association isn't provided.
>>>>
>>>>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>>>      cluster-id.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>   hw/core/machine-hmp-cmds.c |  4 ++++
>>>>   hw/core/machine.c          | 16 ++++++++++++++++
>>>>   qapi/machine.json          |  6 ++++--
>>>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
>>>> index 4e2f319aeb..5cb5eecbfc 100644
>>>> --- a/hw/core/machine-hmp-cmds.c
>>>> +++ b/hw/core/machine-hmp-cmds.c
>>>> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>>>>           if (c->has_die_id) {
>>>>               monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>>>>           }
>>>> +        if (c->has_cluster_id) {
>>>> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
>>>> +                           c->cluster_id);
>>>> +        }
>>>>           if (c->has_core_id) {
>>>>               monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>>>>           }
>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>> index d856485cb4..8748b64657 100644
>>>> --- a/hw/core/machine.c
>>>> +++ b/hw/core/machine.c
>>>> @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>>>               return;
>>>>           }
>>>> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
>>>> +            error_setg(errp, "cluster-id is not supported");
>>>> +            return;
>>>> +        }
>>>> +
>>>>           if (props->has_socket_id && !slot->props.has_socket_id) {
>>>>               error_setg(errp, "socket-id is not supported");
>>>>               return;
>>>> @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>>>                   continue;
>>>>           }
>>>> +        if (props->has_cluster_id &&
>>>> +            props->cluster_id != slot->props.cluster_id) {
>>>> +                continue;
>>>> +        }
>>>> +
>>>>           if (props->has_die_id && props->die_id != slot->props.die_id) {
>>>>                   continue;
>>>>           }
>>>> @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>>>>           }
>>>>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>>>>       }
>>>> +    if (cpu->props.has_cluster_id) {
>>>> +        if (s->len) {
>>>> +            g_string_append_printf(s, ", ");
>>>> +        }
>>>> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
>>>> +    }
>>>>       if (cpu->props.has_core_id) {
>>>>           if (s->len) {
>>>>               g_string_append_printf(s, ", ");
>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>> index 9c460ec450..ea22b574b0 100644
>>>> --- a/qapi/machine.json
>>>> +++ b/qapi/machine.json
>>>> @@ -868,10 +868,11 @@
>>>>   # @node-id: NUMA node ID the CPU belongs to
>>>>   # @socket-id: socket number within node/board the CPU belongs to
>>>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>>>> -# @core-id: core number within die the CPU belongs to
>>>> +# @cluster-id: cluster number within die the CPU belongs to
> We also need a "(since 7.1)" tag for cluster-id.
>>> I remember this should be "cluster number within socket..."
>>> according to Igor's comments in v3 ?
>>
>> Igor had suggestion to correct the description for 'core-id' like
>> below, but he didn't suggest anything for 'cluster-id'. The question
>> is clusters are sub-components of die, instead of socket, if die
>> is supported? You may want to me change it like below and please
>> confirm.
>>
>>   @cluster-id: cluster number within die/socket the CPU belongs to
>>
>> suggestion from Ignor in v3:
>>
>>    > +# @core-id: core number within cluster the CPU belongs to
>>
>>    s:cluster:cluster/die:
>>
> We want "within cluster/die" description for core-id because we
> support both "cores in cluster" for ARM and "cores in die" for X86.
> Base on this routine, we only need "within socket" for cluster-id
> because we currently only support "clusters in socket". Does this
> make sense?
> 

Thanks for the explanation. So ARM64 doesn't have die and x86 doesn't
have cluster? If so, I need to adjust the description for 'cluster-id'
as you suggested in v6:

   @cluster-id: cluster number within socket the CPU belongs to (since 7.1)
    
> Alternatively, the plainest documentation for the IDs is to simply
> range **-id only to its next level topo like below. This may avoid
> increasing complexity when more topo-ids are inserted middle.
> But whether this way is acceptable is up to the Maintainers. :)
> 
> # @socket-id: socket number within node/board the CPU belongs to
> # @die-id: die number within socket the CPU belongs to (since 4.1)
> # @cluster-id: cluster number within die the CPU belongs to (since 7.1)
> # @core-id: core number within cluster the CPU belongs to
> # @thread-id: thread number within core the CPU belongs to
> 

I like this scheme, but needs the confirms from Igor and maintainers.
Igor and maintainers, please let us know if the scheme is good to
have? :)

>>
>>>> +# @core-id: core number within cluster/die the CPU belongs to
>>>>   # @thread-id: thread number within core the CPU belongs to
>>>>   #
>>>> -# Note: currently there are 5 properties that could be present
>>>> +# Note: currently there are 6 properties that could be present
>>>>   #       but management should be prepared to pass through other
>>>>   #       properties with device_add command to allow for future
>>>>   #       interface extension. This also requires the filed names to be kept in
>>>> @@ -883,6 +884,7 @@
>>>>     'data': { '*node-id': 'int',
>>>>               '*socket-id': 'int',
>>>>               '*die-id': 'int',
>>>> +            '*cluster-id': 'int',
>>>>               '*core-id': 'int',
>>>>               '*thread-id': 'int'
>>>>     }
>>> Otherwise, looks good to me:
>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>
>>> Please also keep the involved Maintainers on Cc list in next version,
>>> an Ack from them is best. :)
>>>
>>
>> Thanks again for your time to review. Sure, I will do in next posting.
>>

Thanks,
Gavin

