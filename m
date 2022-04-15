Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1342015lfk;
        Thu, 14 Apr 2022 23:09:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMLOrfweQD4TAEQPdT28Evn9kblMjoGUIeklY6gVRtEwRMnc5LJ+J63uOFBayPuh5cfZ6/
X-Received: by 2002:a0c:d7c2:0:b0:433:4b0f:bac with SMTP id g2-20020a0cd7c2000000b004334b0f0bacmr6426068qvj.13.1650002958649;
        Thu, 14 Apr 2022 23:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650002958; cv=none;
        d=google.com; s=arc-20160816;
        b=pizyHw45nYVWzO+2/UXSHSO51sIZz4OTXbzBxlscKqBZKXZo5HJkrgIorwcWKISDXL
         WROCvf/5y92MrD/HGRs8pwdWb8hezO0X1azT6TbWuCwERzDHRZ+qt2z4yc2BtLS5zZW4
         lkhWFCbBhdpOzDz4IfOELtUzhFW5mkXkujNnwlnI7sfXWytYRrEnSeewaM9YPyEVxyKH
         +Y7YipRHwnFfLHDZYBeR1rMIw8hsyRAPsjnzEfJYT/o7qwsLGcVEVjBwaifBgDnMa2zb
         NW6n2f/h59iNeGAP+rLRPqvB1eVfBNFvglzakzRzJzXE36ESSipfPcwS3j6ceY/lbCWG
         EZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=ZkEA+4tWEGsF0wgxwBk2BpEtnh2JRd6AWTcq5UlzJqI=;
        b=TD9DxxAQMfhys7D9dltOG5wHF3LcBD1nxqaVD9sKtnMVW5TBnf/lUmfeOcO5GsAzBF
         zqEZHhG9tmgg91HDYIYDU9FTKuHDDiyjI5+P/RLrSoBLwMZTcF0Fo0v2xZ5hgz28A+pV
         qVhq4Z3j53aHwIW19OqMjbi+WMGJYmX17Wi1StqyYscWLJ0JbXBffvqETgGWfT9+1Xzy
         BpuR6CF5KDXvwcctZSv69UT52noUuB7eiyyn9+6+5NsAfgQAciHDVHDhb4Wo5GBvsu3D
         GZzdUBlHsThe+dA1jk8n/kv0eu3BHilivyqa8iyQBDMTt/i4l2MRnNUe/SLGuB8H9h/F
         e0wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L1s0AG6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m62-20020a375841000000b0069c41fad5d0si337215qkb.290.2022.04.14.23.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Apr 2022 23:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L1s0AG6o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nfF8w-0003JZ-3z
	for alex.bennee@linaro.org; Fri, 15 Apr 2022 02:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nfF8d-0003IV-E4
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 02:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nfF8a-0004or-CL
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 02:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650002935;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkEA+4tWEGsF0wgxwBk2BpEtnh2JRd6AWTcq5UlzJqI=;
 b=L1s0AG6oYEhtt15gxS+DR4wwFoNXAuPrG3viYVPUPlJDHd/S1rDg/OorDRULABT1SaLaLQ
 Z/esxaPrpuDH2oQtHaBxSK23jJlfvCmnjS5KQRr7tQ4nbp6XLEizRl3Wt2S5AYSg2uyM4Z
 81q4qKIK49Q7kaYZycmI8OHfDumy5dE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-Uj5VpoigMpKf8fuNb_4c5A-1; Fri, 15 Apr 2022 02:08:52 -0400
X-MC-Unique: Uj5VpoigMpKf8fuNb_4c5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A92E1C0782A;
 Fri, 15 Apr 2022 06:08:52 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67022024CB6;
 Fri, 15 Apr 2022 06:08:46 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: "wangyanan (Y)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
 <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
 <f02ae2ce-0256-ac85-0bb7-bd34244d9781@huawei.com>
 <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
 <97e0fa3c-842c-7af9-b92c-a4e77ec7f0e5@huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <ff8d1ca0-bf31-a753-9c9b-119f73a7bf38@redhat.com>
Date: Fri, 15 Apr 2022 14:08:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <97e0fa3c-842c-7af9-b92c-a4e77ec7f0e5@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, shan.gavin@gmail.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1RnMq+vPDN/G

Hi Yanan,

On 4/14/22 5:29 PM, wangyanan (Y) wrote:
> On 2022/4/14 15:35, Gavin Shan wrote:
>> On 4/14/22 10:49 AM, wangyanan (Y) wrote:
>>> On 2022/4/14 10:37, Gavin Shan wrote:
>>>> On 4/14/22 10:27 AM, wangyanan (Y) wrote:
>>>>> On 2022/4/14 8:08, Gavin Shan wrote:
>>>>>> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>>>>>>> On 2022/4/3 22:59, Gavin Shan wrote:
>>>>>>>> Currently, the SMP configuration isn't considered when the CPU
>>>>>>>> topology is populated. In this case, it's impossible to provide
>>>>>>>> the default CPU-to-NUMA mapping or association based on the socket
>>>>>>>> ID of the given CPU.
>>>>>>>>
>>>>>>>> This takes account of SMP configuration when the CPU topology
>>>>>>>> is populated. The die ID for the given CPU isn't assigned since
>>>>>>>> it's not supported on arm/virt machine yet.
>>>>>>>>
>>>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>>>> ---
>>>>>>>>   hw/arm/virt.c | 16 +++++++++++++++-
>>>>>>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>>>>>> index d2e5ecd234..3174526730 100644
>>>>>>>> --- a/hw/arm/virt.c
>>>>>>>> +++ b/hw/arm/virt.c
>>>>>>>> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>>>       int n;
>>>>>>>>       unsigned int max_cpus = ms->smp.max_cpus;
>>>>>>>>       VirtMachineState *vms = VIRT_MACHINE(ms);
>>>>>>>> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>>>>>>>>       if (ms->possible_cpus) {
>>>>>>>>           assert(ms->possible_cpus->len == max_cpus);
>>>>>>>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>>>>>>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>>>>>>>           ms->possible_cpus->cpus[n].arch_id =
>>>>>>>>               virt_cpu_mp_affinity(vms, n);
>>>>>>>> +
>>>>>>>> +        assert(!mc->smp_props.dies_supported);
>>>>>>>> + ms->possible_cpus->cpus[n].props.has_socket_id = true;
>>>>>>>> + ms->possible_cpus->cpus[n].props.socket_id =
>>>>>>>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
>>>>>>>> +            ms->smp.sockets;
>>>>>>> No need for "% ms->smp.sockets".
>>>>>>
>>>>>> Yeah, lets remove it in v6.
>>>>>>
>>>>>>>> + ms->possible_cpus->cpus[n].props.has_cluster_id = true;
>>>>>>>> + ms->possible_cpus->cpus[n].props.cluster_id =
>>>>>>>> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
>>>>>>>> + ms->possible_cpus->cpus[n].props.has_core_id = true;
>>>>>>>> + ms->possible_cpus->cpus[n].props.core_id =
>>>>>>>> +            (n / ms->smp.threads) % ms->smp.cores;
>>>>>>>> ms->possible_cpus->cpus[n].props.has_thread_id = true;
>>>>>>>> - ms->possible_cpus->cpus[n].props.thread_id = n;
>>>>>>>> + ms->possible_cpus->cpus[n].props.thread_id =
>>>>>>>> +            n % ms->smp.threads;
>>>>>>>>       }
>>>>>>>>       return ms->possible_cpus;
>>>>>>>>   }
>>>>>>> Otherwise, looks good to me:
>>>>>>> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
>>>>>>>
>>>>>>
>>>>>> Thanks for your time to review :)
>>>>>>
>>>>>>
>>>>> Oh, after further testing this patch breaks numa-test for aarch64,
>>>>> which should be checked and fixed. I guess it's because we have
>>>>> more IDs supported for ARM. We have to fully running the QEMU
>>>>> tests before sending some patches to ensure that they are not
>>>>> breaking anything. :)
>>>>>
>>>>
>>>> Thanks for catching the failure and reporting back. I'm not
>>>> too much familar with QEMU's test workframe. Could you please
>>>> share the detailed commands to reproduce the failure? I will
>>>> fix in v6, which will be done in a separate patch :)
>>>>
>>> There is a reference link: https://wiki.qemu.org/Testing
>>> To catch the failure of this patch: "make check" will be enough.
>>>
>>
>> Thanks for the pointer. The issue is caused by ms->possible_cpus->cpus[n].props.thread_id.
>> Before this patch, it's value of [0 ... smp.cpus]. However, it's always zero
>> after this patch is applied because '%' operation is applied for the thread
>> ID.
>>
>> What we need to do is to specify SMP configuration for the test case. I will
>> add PATCH[v6 5/5] for it.
> Better to keep the fix together with this patch for good bisection.

Agreed, it will be part of PATCH[v6 02/04].

>>
>> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
>> index 90bf68a5b3..6178ac21a5 100644
>> --- a/tests/qtest/numa-test.c
>> +++ b/tests/qtest/numa-test.c
>> @@ -223,7 +223,7 @@ static void aarch64_numa_cpu(const void *data)
>>      QTestState *qts;
>>      g_autofree char *cli = NULL;
>>
>> -    cli = make_cli(data, "-machine smp.cpus=2 "
>> +    cli = make_cli(data, "-machine smp.cpus=2,smp.sockets=1,smp.cores=1,smp.threads=2 "
>>
> Maybe it's better to extend aarch64_numa_cpu() by adding
> "socket_id, cluster_id, core_id" configuration to the -numa cpu,
> given that we have them for aarch64 now.
> 

Exactly, I will use the following command in v6:

   -machine smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2

Thanks,
Gavin

