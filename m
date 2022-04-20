Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3022043lfk;
        Wed, 20 Apr 2022 03:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHJMzwZniodfxgD4FVudqHs0xHsHrlDUuKTrZiN2nZxUz7k2QMOnVywOJ3+yZciybvqjbG
X-Received: by 2002:a05:620a:430b:b0:67e:85d1:f53f with SMTP id u11-20020a05620a430b00b0067e85d1f53fmr12164083qko.43.1650450764152;
        Wed, 20 Apr 2022 03:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650450764; cv=none;
        d=google.com; s=arc-20160816;
        b=JaDa/V/4yD/y2+L/8NifefKDbGg/fwMLs/W0R1sIuRjkXshbsPvyTHeJ/41uISrxHu
         tDo+HFM94Aixl8piWEmgpHB4txOayt1er1BCCinIPjagkQ70vuwo9St8Je0axhIQ/+0/
         6R2TFbFCNaE4SQd7w7zqdchE5OQJOb/YmpZVckdgOAtum0UjZV7MTeXuaxkiF8f3hcpR
         5hnKElDU8ikeIZECwcBONO4GgAF8X3CeNmuQ/z4HPaid4O9ytzLuj0aI/PjbD1eBqfwd
         R+xTT4OcdRFYCmkcGDupZUC8wvxFnwLtppD4oVJHArwyrZ28xz2YWBnH76gTsIO/WxaA
         NXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=m9/e4yW3P7dkwFHuhc2WRFEr45ZEO0xWoQx4HPDcJUY=;
        b=XSlLoGiGvCaOvfyS0Sg+uDHcT8GSjXfWfggwneQ+zQq4jmKh3c0S60NKpgoBqtvFaa
         KdRmFsUOavEmG4AzUtta17Pp/wqRAn9iNyiEUYEWlJQqAfBbUdfYeuEnHM9KFXrnp8Zl
         +UxZxHzcnx2AsZCq3qCpfDiMVs76gwZiH/jcZyEVfkKUHCytns3yxGsEmbpYtHUktaCT
         NWqUOtsGanIahhxuh0XPT0bOViO1IVUZP9oiPtColksh7/Zwn98SszqRiPO9nOKO8iOu
         Z8d322zcYYZa37YA1MMTY2namJmnoUbccAiiDp6nPeU4AY8CO5NaS5uzom/z4F1jJIZG
         ++1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i+t2jCva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp13-20020ad45f8d000000b004444bb2f908si399228qvb.156.2022.04.20.03.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 03:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i+t2jCva;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh7db-0007xy-Gm
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 06:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7cK-0007u7-IM
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:31:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7cG-0006hL-Eg
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:31:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450679;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9/e4yW3P7dkwFHuhc2WRFEr45ZEO0xWoQx4HPDcJUY=;
 b=i+t2jCvatYy2MyNmKwprMP/Yfn4X14oaGEzZAx7TxuGKeoQ+Z8JqKBjvhgZF2yqXbgaAGk
 AbYQOfBFq8rH+B6OR+r592Jrp3F1P1w8Al3i5vIbCl9/ZMZtI7BcNUqaDqJc0ZDZArCZxk
 xO08u+R9pALhre17W/OSrbnbSpH4txM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-c-25if9mO5ONtjFzw0kdtw-1; Wed, 20 Apr 2022 06:31:16 -0400
X-MC-Unique: c-25if9mO5ONtjFzw0kdtw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F09805F4E;
 Wed, 20 Apr 2022 10:31:15 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E9AC27E89;
 Wed, 20 Apr 2022 10:31:05 +0000 (UTC)
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Igor Mammedov <imammedo@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
Date: Wed, 20 Apr 2022 18:31:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220420103248.6e3575cd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com,
 Jonathan.Cameron@Huawei.com, ani@anisinha.ca, pbonzini@redhat.com,
 lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/sK2GkWH9hR

Hi Igor,

On 4/20/22 4:32 PM, Igor Mammedov wrote:
> On Mon, 18 Apr 2022 10:09:18 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine. Besides, the used SMP
>> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
>> to avoid testing failure
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c           | 15 ++++++++++++++-
>>   tests/qtest/numa-test.c |  3 ++-
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..5443ecae92 100644
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
>> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
>> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>> +        ms->possible_cpus->cpus[n].props.cluster_id =
>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
>> +        ms->possible_cpus->cpus[n].props.core_id =
>> +            (n / ms->smp.threads) % ms->smp.cores;
>>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>> -        ms->possible_cpus->cpus[n].props.thread_id = n;
>> +        ms->possible_cpus->cpus[n].props.thread_id =
>> +            n % ms->smp.threads;
>>       }
>>       return ms->possible_cpus;
>>   }
>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>> index 90bf68a5b3..aeda8c774c 100644
>> --- a/tests/qtest/numa-test.c
>> +++ b/tests/qtest/numa-test.c
>> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>>       QTestState *qts;
>>       g_autofree char *cli = NULL;
>>   
>> -    cli = make_cli(data, "-machine smp.cpus=2 "
>> +    cli = make_cli(data, "-machine "
>> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
> 
> Is cluster-less config possible?
> (looks like it used to work before and it doesn't after this series)
> 

Nope, it's impossible. This specific test case uses arm/virt machine
where cluster is always supported.mc->smp_props.clusters_supported
has been set to true in hw/arm/virt.c::virt_machine_class_init().

Exactly, the changes to virt_possible_cpu_arch_ids() included in this patch breaks
the test. It's why the fix to qtest/numa-test has been squashed to this patch, to
make it 'bit bisect' friendly as Yanan suggested.


>>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>           "-numa cpu,node-id=1,thread-id=0 "
>>           "-numa cpu,node-id=0,thread-id=1");

Thanks,
Gavin

