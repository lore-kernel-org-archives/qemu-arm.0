Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2102012lfb;
        Sun, 3 Apr 2022 03:49:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3zAojGUMAOnWdnI9c8KQaJR/Z/6NpOUEquZ6vKuzflLmw7skxWlc+H2KY/WTxcVCysO68
X-Received: by 2002:a0c:f806:0:b0:440:f78f:1f67 with SMTP id r6-20020a0cf806000000b00440f78f1f67mr14334081qvn.95.1648982951573;
        Sun, 03 Apr 2022 03:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648982951; cv=none;
        d=google.com; s=arc-20160816;
        b=LAsI+IicMkIBYAEFqnkinBi48PLbrIkFklSpTaFZWIZbXupr5xvGpz8qc80ezBE0W0
         H+PM+5Cdn+wkhpcFowJ7JCz8VvdkHXzkXE2CpatLMYF2zs2CZkxNzAWjIIwCYBaETyv+
         tCwdN/uiub+wQ6wgyOdhiDUsSQBCCI4ic0/Ht14JkBqiaOz/FRR7kcCOO6Lfgo7irydA
         fEWI95rTE8iA2x97bCaw7xXdvlmDHQtovPcP16IoWZX9vW1QQXn7QEDSGPpVLRLsSzQi
         13IjithIHA6mXnVcJTolvW0Th7vHFVCm7HCVKEZTT2nYIWS0aB1GzqKnKv8oEa8lXmix
         JoaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=UYw3wN8HR62CbXyVWDGuunk04pRh30+eHbdN4l9yMe0=;
        b=inq8deeJHBPRtv0yVjHLwUlFLthJq5DNUJgwOlLc6Bf4Z7fNTl1mzRmcF3IFmhS+Y3
         2c1VdFDC5H06mm6GgzyAiAi+2WC8EA3GTGmTAk/CfQ+C5CbXEkvFZxnv681U2PYmYtMV
         QD5TjHwrCl0xi5/cqyE5kolVHOVQVBVp1UXZSTU9UxjcPDBYYti8obJ6DUcA41WlHCAR
         H41EFpgbXbifmKiGL8OH3masQloiwwryhUCHkxJrNroTH9vHUOKK9t4kZ/Vz+2s5FKnr
         capU4KDZtdehOfagzvAXLGumBWXGf/hkL8drfZ1QU9rYJx7uKF3PNs+1Ts/ZViBPJQYl
         KmKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UpFT1Coj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o204-20020a3741d5000000b0067e4be2382bsi2291421qka.112.2022.04.03.03.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 03:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UpFT1Coj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naxnC-00070e-1r
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 06:49:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxmV-0006ze-JD
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxmU-0008Gn-1C
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 06:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648982905;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYw3wN8HR62CbXyVWDGuunk04pRh30+eHbdN4l9yMe0=;
 b=UpFT1Coj14XmdeWrCl2FQ+gIMwvEaDyQBEuAtscbi6rMfxcRW3vg1Ryx7wBMb2mtqO8A08
 rp5gsKja8U0fnlMPTHUd1Tx2FldxipNkSjR4k2QABfOe5i+BZz0MDkRpUy6Bo6VxhFAUmk
 YEtwJL4P++/yh3YJP96imZoX0qh+VfI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-q7-4qP_VMECFXFkOlYqrGQ-1; Sun, 03 Apr 2022 06:48:21 -0400
X-MC-Unique: q7-4qP_VMECFXFkOlYqrGQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49E0B3801EC0;
 Sun,  3 Apr 2022 10:48:21 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D0B8555901;
 Sun,  3 Apr 2022 10:48:16 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
 <20220330151832.3da04abf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <3e4ee12d-0dc9-15e9-3e22-3f39e57582dd@redhat.com>
Date: Sun, 3 Apr 2022 18:48:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220330151832.3da04abf@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQzwjYnk3zmu

Hi Igor,

On 3/30/22 9:18 PM, Igor Mammedov wrote:
> On Wed, 23 Mar 2022 15:24:35 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine yet. Besides, the cluster
>> ID for the given CPU is assigned because it has been supported
>> on arm/virt machine.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c     | 11 +++++++++++
>>   qapi/machine.json |  6 ++++--
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..064eac42f7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>       int n;
>>       unsigned int max_cpus = ms->smp.max_cpus;
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>   
>>       if (ms->possible_cpus) {
>>           assert(ms->possible_cpus->len == max_cpus);
>> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            n / (ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>           ms->possible_cpus->cpus[n].props.thread_id = n;
> 
> shouldn't be above values calculated similar to the way they are
> calculated in x86_topo_ids_from_idx()? /note '% foo' part/
> 

I think it's fine not to have '% foo' here. However, I think it'd
better to have the similar '% foo' as x86 does. I will add this part
in v4.

>>       }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..99c945f258 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to
>> +# @core-id: core number within cluster the CPU belongs to
>>   # @thread-id: thread number within core the CPU belongs to
>>   #
>> -# Note: currently there are 5 properties that could be present
>> +# Note: currently there are 6 properties that could be present
>>   #       but management should be prepared to pass through other
>>   #       properties with device_add command to allow for future
>>   #       interface extension. This also requires the filed names to be kept in
>> @@ -883,6 +884,7 @@
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*cluster-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }

Thanks,
Gavin

