Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp491733lfk;
        Wed, 13 Apr 2022 17:06:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkDECsDTKG4iMhDUOBRm8iDbuaXICuRoL9sx7tjnODbr4DPhIh/dT3qVLIrCRa7aOhEN//
X-Received: by 2002:a25:e78e:0:b0:641:d314:aa5e with SMTP id e136-20020a25e78e000000b00641d314aa5emr43678ybh.108.1649894819202;
        Wed, 13 Apr 2022 17:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649894819; cv=none;
        d=google.com; s=arc-20160816;
        b=WFYaQOIxL8hCTdgYRfcX5ZRORygAMFn5ZA/HQRMW0gob5MK2nKABHj70gte2zFv0/r
         qx0m4Ey8II/w1aBwc2OgjflJGw6/klIu27UXdHj5PFhN7D1GjwJP86cih2iGoBIeArIE
         l54TwkNY1FOyzsoqTn2SXkljW2Zwjp9SUeyMhuQMWJpYdSmBhCxPudpRM3UQfCV/KyXr
         lUAgT+g7ajArsGi/+p1PGcxbEcXTp3lC8xo2Xh4z6BBnkRAoDHFgVfItEMNm5tCqBLz6
         i5o+KV9hu2bt1k2R6UwepAdybVZZeRG5+slwr8Ul/E+G+NrA1GjePjyzlgW1px2pqtlo
         Vfxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=psSEEQdzJRQE9fES8durxcThSfOe5/P6W+WHQ9ytmTg=;
        b=ofzD0EdCkD/mb2FI1Q+8Brwh+0QlCkY7PuGAl/y+tLt1vkYuEeOhqXqMb24WGH1thn
         V4MHYorUdaEz3mVQs/XWosxp6VcSI1gK9GMEdBQOyGIU44gZasbDABxNcZGlN4290+P8
         sfyoKzw24UpU/JWTaidRcLueH4lAN9zPgI0w7u6TPMsREIVdcCyfLNGS55eJ2baiMCe+
         oHtsCjtKlQeAUU5t/SG27VC8FbXKxSi0BC8hcOCmCaiZcwmjSpOjCxz9w+4+DadKKijk
         HE8+dIbnWmeCHFKW/GdIGVCSVGwUTaq7erDa9Pk6a7ArkxWGVnBGcFakkqwW9rUBFR8Z
         E8yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tq9wYYV+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d140-20020a0ddb92000000b002eba86704c4si7797469ywe.144.2022.04.13.17.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 17:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Tq9wYYV+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nen0k-0000MV-IV
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 20:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nen0Y-0000LX-BF
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 20:06:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nen0U-0005fw-MB
 for qemu-arm@nongnu.org; Wed, 13 Apr 2022 20:06:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649894801;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psSEEQdzJRQE9fES8durxcThSfOe5/P6W+WHQ9ytmTg=;
 b=Tq9wYYV+HPIFuq0svB4Ne8HnKxMd0jvJiwQ4gwHXJ8c35tWTz2czIg/GJ0f1gYdo7Ro1Qm
 mkL1mRzDVq5CBpioksdcTCJog8wJSeEBRCVITByzDIS3DVFvtTJ43Kro3C+Wh3mv4Rqivq
 m8LRA8pwvyQukb9jQCjblEWfrxunuc8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-CKpQM8pYPmOaj3OlaL7A3w-1; Wed, 13 Apr 2022 20:06:40 -0400
X-MC-Unique: CKpQM8pYPmOaj3OlaL7A3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3CEE3C32B82;
 Thu, 14 Apr 2022 00:06:39 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC8A040D1B98;
 Thu, 14 Apr 2022 00:06:34 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] qapi/machine.json: Add cluster-id
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-2-gshan@redhat.com>
 <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <6e27668c-0895-fcc8-165e-673aded5ba47@redhat.com>
Date: Thu, 14 Apr 2022 08:06:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <fedf507c-c5ea-aeec-9acc-586f08dcaea4@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0+RNYzdmSMIj

Hi Yanan,

On 4/13/22 7:49 PM, wangyanan (Y) wrote:
> On 2022/4/3 22:59, Gavin Shan wrote:
>> This adds cluster-id in CPU instance properties, which will be used
>> by arm/virt machine. Besides, the cluster-id is also verified or
>> dumped in various spots:
>>
>>    * hw/core/machine.c::machine_set_cpu_numa_node() to associate
>>      CPU with its NUMA node.
>>
>>    * hw/core/machine.c::machine_numa_finish_cpu_init() to associate
>>      CPU with NUMA node when no default association isn't provided.
>>
>>    * hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() to dump
>>      cluster-id.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine-hmp-cmds.c |  4 ++++
>>   hw/core/machine.c          | 16 ++++++++++++++++
>>   qapi/machine.json          |  6 ++++--
>>   3 files changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
>> index 4e2f319aeb..5cb5eecbfc 100644
>> --- a/hw/core/machine-hmp-cmds.c
>> +++ b/hw/core/machine-hmp-cmds.c
>> @@ -77,6 +77,10 @@ void hmp_hotpluggable_cpus(Monitor *mon, const QDict *qdict)
>>           if (c->has_die_id) {
>>               monitor_printf(mon, "    die-id: \"%" PRIu64 "\"\n", c->die_id);
>>           }
>> +        if (c->has_cluster_id) {
>> +            monitor_printf(mon, "    cluster-id: \"%" PRIu64 "\"\n",
>> +                           c->cluster_id);
>> +        }
>>           if (c->has_core_id) {
>>               monitor_printf(mon, "    core-id: \"%" PRIu64 "\"\n", c->core_id);
>>           }
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index d856485cb4..8748b64657 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -677,6 +677,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>               return;
>>           }
>> +        if (props->has_cluster_id && !slot->props.has_cluster_id) {
>> +            error_setg(errp, "cluster-id is not supported");
>> +            return;
>> +        }
>> +
>>           if (props->has_socket_id && !slot->props.has_socket_id) {
>>               error_setg(errp, "socket-id is not supported");
>>               return;
>> @@ -696,6 +701,11 @@ void machine_set_cpu_numa_node(MachineState *machine,
>>                   continue;
>>           }
>> +        if (props->has_cluster_id &&
>> +            props->cluster_id != slot->props.cluster_id) {
>> +                continue;
>> +        }
>> +
>>           if (props->has_die_id && props->die_id != slot->props.die_id) {
>>                   continue;
>>           }
>> @@ -990,6 +1000,12 @@ static char *cpu_slot_to_string(const CPUArchId *cpu)
>>           }
>>           g_string_append_printf(s, "die-id: %"PRId64, cpu->props.die_id);
>>       }
>> +    if (cpu->props.has_cluster_id) {
>> +        if (s->len) {
>> +            g_string_append_printf(s, ", ");
>> +        }
>> +        g_string_append_printf(s, "cluster-id: %"PRId64, cpu->props.cluster_id);
>> +    }
>>       if (cpu->props.has_core_id) {
>>           if (s->len) {
>>               g_string_append_printf(s, ", ");
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 9c460ec450..ea22b574b0 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to
> I remember this should be "cluster number within socket..."
> according to Igor's comments in v3 ?

Igor had suggestion to correct the description for 'core-id' like
below, but he didn't suggest anything for 'cluster-id'. The question
is clusters are sub-components of die, instead of socket, if die
is supported? You may want to me change it like below and please
confirm.

   @cluster-id: cluster number within die/socket the CPU belongs to

suggestion from Ignor in v3:

    > +# @core-id: core number within cluster the CPU belongs to

    s:cluster:cluster/die:


>> +# @core-id: core number within cluster/die the CPU belongs to
>>   # @thread-id: thread number within core the CPU belongs to
>>   #
>> -# Note: currently there are 5 properties that could be present
>> +# Note: currently there are 6 properties that could be present
>>   #       but management should be prepared to pass through other
>>   #       properties with device_add command to allow for future
>>   #       interface extension. This also requires the filed names to be kept in
>> @@ -883,6 +884,7 @@
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*cluster-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }
> Otherwise, looks good to me:
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> 
> Please also keep the involved Maintainers on Cc list in next version,
> an Ack from them is best. :)
> 

Thanks again for your time to review. Sure, I will do in next posting.

Thanks,
Gavin

