Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2128513lfb;
        Sun, 3 Apr 2022 04:55:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDX0rkj+/Yi6tSGNVYhHokQfprHRuo2kLeFOilbn/nYPpc76U9zuLvxa6p9Le7qibXtTur
X-Received: by 2002:a05:6214:21e4:b0:441:248a:9823 with SMTP id p4-20020a05621421e400b00441248a9823mr13838575qvj.35.1648986946310;
        Sun, 03 Apr 2022 04:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648986946; cv=none;
        d=google.com; s=arc-20160816;
        b=kfxDH8f5vYdgk+0wK/GVKWzNV0GVrvCO8FZEqLjyNlj11I+36HXk41u49XsRaUKQtn
         r0rBFcIdTxxz7sDVgZLTVA+xEtQv0+sJlidS3sYdVcRvp0VO9fxEQSFmpg8RMM2eY/ae
         7AgeVvYJVWG9QMOJ6SJeXhIn9Mhv0jADoLav/cLiIeXpiD8s/Pta012MB3HrBfWhKys9
         JzFbZPaodcqOwpgR7v8xfp4IhXbKJ3WqE/JOGZ60XtWkdcFHTGccQ1DSHntQEcfFJKEL
         Ljd1gxsREYdltpIksa0ZhEO7yehswzFlfEhMj+0TqmZb1lEn8e6eF8ij3lI6WBxfRt1W
         axvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=V9gSXj7WglC0xp+Om9bDaHbnu2Th64BG7mfXE+eJ8b0=;
        b=X1UgalKXLYo4VRjuUzy+fkdb8yX6AP/uiT1JiuIGaPFq8C+aniQ1g3kTxIeVi2NKtN
         on6bQ/nvhVWMSmfLeJd/uMj4PMcgrdK95zzRQUQBWk7VXWhBPmtRaKK2COLIGWImBgmF
         nQ/z5rA4gzmVfjsI0LxYWgV+q0BCFpIVbjbjshCQ8U8uDaULydTBvr58hsUrMkz4/Oak
         XTaAnGU43lArC0mGvwDm9o2RNQqspDRaLqYFjQzbkUWj/DPsY8ZArhbavVlRNQ4gOni0
         yC91NYUdVQhmEZeKUaeSxLeHEMJSrED3ykI8jbF9A0rU8nNYzZPx3NPoicDBlkQwGGbz
         zuCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUBez8RP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx6-20020a056214058600b00440e46a7d5esi2165909qvb.508.2022.04.03.04.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 04:55:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUBez8RP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naypd-0007No-PM
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 07:55:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naypR-0007HD-4U
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:55:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naypO-0001tA-1c
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648986928;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9gSXj7WglC0xp+Om9bDaHbnu2Th64BG7mfXE+eJ8b0=;
 b=QUBez8RPQULgzgRQuv1KYYgh/wIMlAh+YqIustQ7FNRCrRPb1/sl9GUioeu8wTeIrWmznL
 0eP9JWTL9yMI1xYtcceK6b8GeX1A9utOLAoLYoDo9CnfRvwnlyigT3BJWxKXlvNqKNUq2A
 xwwmD3/fVsr8DCBis9b6PbbL2BNrgN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-TDX1mjVhMGWoLSnqcT5KCQ-1; Sun, 03 Apr 2022 07:55:27 -0400
X-MC-Unique: TDX1mjVhMGWoLSnqcT5KCQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BF7F85A5A8;
 Sun,  3 Apr 2022 11:55:27 +0000 (UTC)
Received: from [10.72.12.82] (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8532B40EC010;
 Sun,  3 Apr 2022 11:55:20 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
 <fcf52228-f911-a798-086b-666c9580f7ef@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <5044c71d-f485-e3be-1a61-00dadbab82fe@redhat.com>
Date: Sun, 3 Apr 2022 19:55:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <fcf52228-f911-a798-086b-666c9580f7ef@huawei.com>
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
X-TUID: WjB4xP7KP/b3

Hi Yanan,

On 4/2/22 10:17 AM, wangyanan (Y) wrote:
> On 2022/3/23 15:24, Gavin Shan wrote:
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
>>   hw/arm/virt.c     | 11 +++++++++++
>>   qapi/machine.json |  6 ++++--
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..064eac42f7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>       int n;
>>       unsigned int max_cpus = ms->smp.max_cpus;
>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>       if (ms->possible_cpus) {
>>           assert(ms->possible_cpus->len == max_cpus);
>> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            n / (ms->smp.cores * ms->smp.threads);
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>           ms->possible_cpus->cpus[n].props.thread_id = n;
>>       }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 42fc68403d..99c945f258 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -868,10 +868,11 @@
>>   # @node-id: NUMA node ID the CPU belongs to
>>   # @socket-id: socket number within node/board the CPU belongs to
>>   # @die-id: die number within socket the CPU belongs to (since 4.1)
>> -# @core-id: core number within die the CPU belongs to
>> +# @cluster-id: cluster number within die the CPU belongs to
>> +# @core-id: core number within cluster the CPU belongs to
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
> Since new cluster-id is introduced, you may want to check whether to
> update machine_set_cpu_numa_node() and hmp_hotpluggable_cpus(),
> accordingly, which both deal with topo-ids. If we need to update them,
> it's easier to review to make the whole cluster-id introduction part
> a separate patch.
> 

Yes, I agree. hw/core/machine-hmp-cmds.c::hmp_hotpluggable_cpus() also
needs 'cluster-id' either. I will have the changes in v5 because I didn't
catch your comments before posting v4. Please go ahead to review v5
directly.

Thanks,
Gavin


