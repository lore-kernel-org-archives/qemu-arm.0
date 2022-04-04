Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp94592lfu;
        Mon, 4 Apr 2022 03:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUG/yaFw1wZu/sc6p9D0rY18/jjEYfBmeTO8lx1NqJPP0smuq/ggjfZ8ZV01oNVz978Tp5
X-Received: by 2002:a05:620a:4090:b0:67d:59da:3fc4 with SMTP id f16-20020a05620a409000b0067d59da3fc4mr13105999qko.50.1649069312974;
        Mon, 04 Apr 2022 03:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649069312; cv=none;
        d=google.com; s=arc-20160816;
        b=0HKiEpBNGeIpWUiyaOw71Qok7i/DCrKvKUhoi0E8iYs2S4hQDv2wJQ/WTNnHGOgcfD
         zZ1Mcy+NkRlUS6YF8+02TUnDXFEhTZACdP1XHFF8qAez3q8+RlhyWJWmzgNSPn/DvYWH
         7vomFLNCQsSbeQa+lb6qW0yf0jitok7wi3FTjkTeOL2aNYNxqFIv2luejo6MWVVa5BFg
         ydsEdzFQT7PGJzQCskr+x0ZpWGXhpx5ro/Y2Q0fUlR2lmFfSv5MfDAjPss+60NDKfrVj
         JJnzy+EOyViNaHJlnAvx0cc6BtnBC3c1qdqn0ITx2SkeFYlL34J+tIXZFksa9Duss85C
         CIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Vh0TaqMdxuEBrJMClMMLJtACJj3/xfSWIMEE2aaN658=;
        b=NHnNz4Uu1kE7SMZZiq1VOp3twSbqoxSUmu4XE2frWt4iItBSo700lnIjVBCZz4tOur
         Bc/6xbVmWtbUgmBmGkR9joxqqrDAWxihoe2s9kZ6KZAVxp64cqKZ73RHuvO8Nwj5EPPr
         YveOxm7Gp1sC2Bdf2SfGXjwpF6giI/ZHnOOEEnxWiJO0SU3xG1ecPoOAIrBIcBPNCtYp
         btG9hFshVDP1ePCCCxvIREqDlSkUIqBv+9wcNl28DfKn5+1gLoWn+FwdiUHsqeAJYCSY
         CL1UNML8IW53fLa5rVk3+K7fEmC59tj4D9Am6RIyg6KxhwLunQa1IpggLO+8G/Li3tgf
         VxPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d+YScaeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a37a902000000b0067ec954803bsi2881116qke.716.2022.04.04.03.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Apr 2022 03:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d+YScaeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbKG8-0004Q1-G8
	for alex.bennee@linaro.org; Mon, 04 Apr 2022 06:48:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbKFy-0004Pf-C9
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 06:48:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nbKFr-0005cO-Cu
 for qemu-arm@nongnu.org; Mon, 04 Apr 2022 06:48:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649069294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vh0TaqMdxuEBrJMClMMLJtACJj3/xfSWIMEE2aaN658=;
 b=d+YScaeoLRD9GXAD725MrqPy1VhM8zwKIcbvbF5Xnx5iW4nMFYfDBgWsO4vR2JEFNaVu70
 W6yJodCLQGMdlQ2X6LN69T3QPGucAgX0kVUpKYdQcPth7j1D+E9lAvsZCqdNM9u/t7QpSU
 A+i6J1P8LCxoa9O5cXEkfrqci2ipCYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-5nvOzdUlPeuXN00Pr4ZA7A-1; Mon, 04 Apr 2022 06:48:11 -0400
X-MC-Unique: 5nvOzdUlPeuXN00Pr4ZA7A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C85C185A5BE;
 Mon,  4 Apr 2022 10:48:10 +0000 (UTC)
Received: from [10.72.12.126] (ovpn-12-126.pek2.redhat.com [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35BFC492D18;
 Mon,  4 Apr 2022 10:48:05 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com> <YkquyMTJqq+jFvm0@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <17bd5453-ef36-6bbc-3913-d806e0ed7a38@redhat.com>
Date: Mon, 4 Apr 2022 18:48:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <YkquyMTJqq+jFvm0@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oR3ojPi/d0+t

Hi Daniel,

On 4/4/22 4:39 PM, Daniel P. Berrangé wrote:
> On Sun, Apr 03, 2022 at 10:59:51PM +0800, Gavin Shan wrote:
>> Currently, the SMP configuration isn't considered when the CPU
>> topology is populated. In this case, it's impossible to provide
>> the default CPU-to-NUMA mapping or association based on the socket
>> ID of the given CPU.
>>
>> This takes account of SMP configuration when the CPU topology
>> is populated. The die ID for the given CPU isn't assigned since
>> it's not supported on arm/virt machine yet.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d2e5ecd234..3174526730 100644
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
>> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>>           ms->possible_cpus->cpus[n].arch_id =
>>               virt_cpu_mp_affinity(vms, n);
>> +
>> +        assert(!mc->smp_props.dies_supported);
>> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
>> +        ms->possible_cpus->cpus[n].props.socket_id =
>> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
>> +            ms->smp.sockets;
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
> 
> Does this need to be conditionalized d behind a machine property, so that
> we don't change behaviour of existing machine type versions ?
> 

I think we probably needn't to do that because the default NUMA node
for the given CPU is returned based on the socket ID in next patch.
The socket ID is calculated in this patch. Otherwise, we will see
CPU topology broken warnings in Linux guest. I think we need to fix
this issue for all machine type versions.

Thanks,
Gavin

