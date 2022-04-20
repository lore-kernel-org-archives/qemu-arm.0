Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2811332lfk;
        Tue, 19 Apr 2022 19:18:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqjAmp8j00T3Gm6IaYKX55GgKp3xQNqSmxNgaaLbibENC/PLyDB6HBeQfJy1uQwjLkTZ3t
X-Received: by 2002:a37:a247:0:b0:69d:5e7d:42b7 with SMTP id l68-20020a37a247000000b0069d5e7d42b7mr11364965qke.320.1650421131358;
        Tue, 19 Apr 2022 19:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650421131; cv=none;
        d=google.com; s=arc-20160816;
        b=cwxZivF8C+L9tHKMrImlAkA5aks/n8KFqsUzXREIBfGWX52bOZ3siPrBF3/wYPhuW2
         NKUGxuAdX88TDskouBOLxOgV4ulQHIRiCMUm+KRfchjFk7BWiEbgEjC5DUQsVHlonRyz
         DM7DirSZilTg9cOYQ36blGaeaYtOHsRIjnBkmX/OVbp/l38aLa7Tn84Sx41fLe4qrkop
         HBoqR3QxB2KWruJ0vCqF6P8BgEqknc8/M0XFl2ZKNMOfLFVNNPyIkaZw3svX0i3M4gq9
         ZVP7pKPCvbkdSpI7s5szWHsqySCjPvJwKK4W3bFueW9ukBjeH1yPV6Ty0i1sZW4EFshL
         mSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=7nDnHCO14h90mAV42DdbmMppW0CUY8y1FtweqR+GrUM=;
        b=NQujoBjdkAmqtof1Kl+6GyhFY6mhld4vqLo4eNK4OqJ8LiaVAoXqldaF4m+RYJZHz+
         z4wC1lfOLwF89cAf04oTdCyG9MwGYC96i6M9p+KAml+jyTRAP3MEmalynGFKs9FZmwCY
         tmJkVhtwTEGhnUosPRr07995tFJOTGfB9S+dMiWQ/x45s9SeYFxInpzc+ElhuYMm89lP
         CmVRQqUqAjg2CCJe4MGxwgfFmuuUL8BFpLdjCJgUwD84COBI+hggEH1E7ExoEWsc00Om
         FrdHpph0OhHVuAKEJEDsWfq6Nw68uoR68KGDdu7DX2ZxxaFkADCGvnzpmJeuFDsx91kL
         Tsnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c51AE2EN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11-20020a056214202b00b004460e90759csi142998qvf.343.2022.04.19.19.18.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 19:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=c51AE2EN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngzve-0004DN-Rr
	for alex.bennee@linaro.org; Tue, 19 Apr 2022 22:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngzuu-0004Cp-Tk
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 22:18:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngzus-0007ZH-NX
 for qemu-arm@nongnu.org; Tue, 19 Apr 2022 22:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650421082;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nDnHCO14h90mAV42DdbmMppW0CUY8y1FtweqR+GrUM=;
 b=c51AE2ENCtOnl8DmWuSyzGFhLOORIOiKqUytP0D6rhDGFK0itO0J0eRqD9QULRiTG8Bd2i
 40yj2ZeNevXDHUTa8MAoLySAnXHpiIO1k2VCgdP60gFPgVQ4vswUn6SMLmcLBDp6hYtn9d
 Z3QnRrA+7sWVFVLYcSBkaHiHvpq964E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-RsgghjJvOq2zF6Pi0BkD6Q-1; Tue, 19 Apr 2022 22:17:58 -0400
X-MC-Unique: RsgghjJvOq2zF6Pi0BkD6Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D6E08039D7;
 Wed, 20 Apr 2022 02:17:58 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D74A54F8B0;
 Wed, 20 Apr 2022 02:17:52 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
 <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
 <6e27668c-0895-fcc8-165e-673aded5ba47@redhat.com>
 <f45a3f17-7cef-3d8c-e79c-e6a5898e665e@huawei.com>
 <Yl7cZuRxBLX9qPlw@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ef1da0ae-5bc4-2891-02ed-1ce370910719@redhat.com>
Date: Wed, 20 Apr 2022 10:17:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <Yl7cZuRxBLX9qPlw@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Markus Armbruster <armbru@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MoE0o6fGyBEb

Hi Daniel,

On 4/19/22 11:59 PM, Daniel P. Berrangé wrote:
> On Thu, Apr 14, 2022 at 10:27:25AM +0800, wangyanan (Y) wrote:
>> Hi Gavin,
>>
>> Cc: Daniel and Markus
>> On 2022/4/14 8:06, Gavin Shan wrote:
>>> Hi Yanan,
>>>
>>> On 4/13/22 7:49 PM, wangyanan (Y) wrote:
>>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>>> This adds cluster-id in CPU instance properties, which will be used
>>>>> by arm/virt machine. Besides, the cluster-id is also verified or
>>>>> dumped in various spots:
>>>>>
>>>>>     * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>>>>       CPU with its NUMA node.
>>>>>
>>>>>     * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>>>>       CPU with NUMA node when no default association isn't provided.
>>>>>
>>>>>     * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>>>>       cluster-id.
>>>>>
>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>> ---
>>>>>    hw/core/machine-hmp-cmds.c |  4 ++++
>>>>>    hw/core/machine.c          | 16 ++++++++++++++++
>>>>>    qapi/machine.json          |  6 ++++--
>>>>>    3 files changed, 24 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
>>>>> index 4e2f319aeb..5cb5eecbfc 100644
>>>>> --- a/hw/core/machine-hmp-cmds.c
>>>>> +++ b/hw/core/machine-hmp-cmds.c
>>>>> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon,
>>>>> const QDict *qdict)
>>>>>            if (c->has_die_id) {
>>>>>                monitor_printf(mon, "    die-id: \"%" PRIu64
>>>>> "\"\n", c->die_id);
>>>>>            }
>>>>> +        if (c->has_cluster_id) {
>>>>> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
>>>>> +                           c->cluster_id);
>>>>> +        }
>>>>>            if (c->has_core_id) {
>>>>>                monitor_printf(mon, "    core-id: \"%" PRIu64
>>>>> "\"\n", c->core_id);
>>>>>            }
>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>> index d856485cb4..8748b64657 100644
>>>>> --- a/hw/core/machine.c
>>>>> +++ b/hw/core/machine.c
>>>>> @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState
>>>>> *machine,
>>>>>                return;
>>>>>            }
>>>>> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
>>>>> +            error_setg(errp, "cluster-id is not supported");
>>>>> +            return;
>>>>> +        }
>>>>> +
>>>>>            if (props->has_socket_id && !slot->props.has_socket_id) {
>>>>>                error_setg(errp, "socket-id is not supported");
>>>>>                return;
>>>>> @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState
>>>>> *machine,
>>>>>                    continue;
>>>>>            }
>>>>> +        if (props->has_cluster_id &&
>>>>> +            props->cluster_id != slot->props.cluster_id) {
>>>>> +                continue;
>>>>> +        }
>>>>> +
>>>>>            if (props->has_die_id && props->die_id !=
>>>>> slot->props.die_id) {
>>>>>                    continue;
>>>>>            }
>>>>> @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const
>>>>> CPUArchId *cpu)
>>>>>            }
>>>>>            g_string_append_printf(s, "die-id: %"PRId64,
>>>>> cpu->props.die_id);
>>>>>        }
>>>>> +    if (cpu->props.has_cluster_id) {
>>>>> +        if (s->len) {
>>>>> +            g_string_append_printf(s, ", ");
>>>>> +        }
>>>>> +        g_string_append_printf(s, "cluster-id: %"PRId64,
>>>>> cpu->props.cluster_id);
>>>>> +    }
>>>>>        if (cpu->props.has_core_id) {
>>>>>            if (s->len) {
>>>>>                g_string_append_printf(s, ", ");
>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>> index 9c460ec450..ea22b574b0 100644
>>>>> --- a/qapi/machine.json
>>>>> +++ b/qapi/machine.json
>>>>> @@ -868,10 +868,11 @@
>>>>>    # @node-id: NUMA node ID the CPU belongs to
>>>>>    # @socket-id: socket number within node/board the CPU belongs to
>>>>>    # @die-id: die number within socket the CPU belongs to (since 4.1)
>>>>> -# @core-id: core number within die the CPU belongs to
>>>>> +# @cluster-id: cluster number within die the CPU belongs to
>> We also need a "(since 7.1)" tag for cluster-id.
>>>> I remember this should be "cluster number within socket..."
>>>> according to Igor's comments in v3 ?
>>>
>>> Igor had suggestion to correct the description for 'core-id' like
>>> below, but he didn't suggest anything for 'cluster-id'. The question
>>> is clusters are sub-components of die, instead of socket, if die
>>> is supported? You may want to me change it like below and please
>>> confirm.
>>>
>>>    @cluster-id: cluster number within die/socket the CPU belongs to
>>>
>>> suggestion from Ignor in v3:
>>>
>>>     > +# @core-id: core number within cluster the CPU belongs to
>>>
>>>     s:cluster:cluster/die:
>>>
>> We want "within cluster/die" description for core-id because we
>> support both "cores in cluster" for ARM and "cores in die" for X86.
>> Base on this routine, we only need "within socket" for cluster-id
>> because we currently only support "clusters in socket". Does this
>> make sense?
>>
>> Alternatively, the plainest documentation for the IDs is to simply
>> range **-id only to its next level topo like below. This may avoid
>> increasing complexity when more topo-ids are inserted middle.
>> But whether this way is acceptable is up to the Maintainers. :)
> 
> Rather saying we only support cluster on ARM and only dies on x86,
> I tend to view it as, we only support greater than 1 cluster on
> ARM, and greater than 1 die on x86.
> 
> IOW, x86 implicitly always has exactly 1-and-only-1 cluster,
> and arm implicitly always has exactly 1-and-only-1 die.
> 
> With this POV, then we can keep the description simple, only
> refering to the immediately above level in the hierarchy.
> 

Agreed and thanks a lot for the elaboration.

>>
>> # @socket-id: socket number within node/board the CPU belongs to
>> # @die-id: die number within socket the CPU belongs to (since 4.1)
>> # @cluster-id: cluster number within die the CPU belongs to (since 7.1)
>> # @core-id: core number within cluster the CPU belongs to
>> # @thread-id: thread number within core the CPU belongs to
> 
> So this suggested text is fine with me.
> 

Ok. The description will be included into v7, as v6 was posted
two days ago.

Thanks,
Gavin

