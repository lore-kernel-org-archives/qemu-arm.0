Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1366798lfm;
        Mon, 17 May 2021 08:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzseUyg//AI1BX5QemkB6VFqEvm9TaaG2y8ffNhXXpQyJJgSCyWWTkcfNLM71Jy30tCxli4
X-Received: by 2002:a05:6602:70d:: with SMTP id f13mr431085iox.16.1621264253120;
        Mon, 17 May 2021 08:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621264253; cv=none;
        d=google.com; s=arc-20160816;
        b=UODPSsQ6GeHCfPOBiBPOUTbYPNjYtx004dPRD2dJUMMvRlO6Uir4f+l1e57axYdV3K
         Jg01W1rz75jrCkHScnL+LIX9YqxvCNTEVIDkXPDsHTjUCuRpGsj0ZKcngKqzBioq3j9V
         W28lSNwPCY/s7sSc3ut8FmdOiMP+oM/M8Keq04LY64p+QaTpZBeuCBQKyu8ezC939SA3
         2PHLyj9qvRbxMxu5T6bFx+DukKC8AW+VTQOnkHa5zGbqQ0pgEAJeIL94jYl4ehluiax0
         xgMKSuazoKhpJrHOtzybuo4V/9OvHtEiuFJQjFmSAx7BEuTczxMtQGahoMpErg4TDgba
         y0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0VpQa7+04PzbGA1/sp+wdlN+i9d8SgUuzCTkMWVOSZU=;
        b=Y6qdmIYPypkx+TwfVOs/GGddoSJWd0rlDCduK5XllOZd42uD+4A4OFtgdvOH55yrAN
         BhJatPot67aTCMzT1tBTrTgvCkg2pEgpz/xDJPViKSrWTn1hJUqsNhAF892r4KzwPPTE
         3Mw6L9Sj9H3sfG5N5NTpf8eIMLQf7jQ/jYoRlFUDTdPLgZuTvNVmO4uwqYmi/AESHnvr
         xJ6NMBEa1aeNkvk+BQbnHcvJs0LnyuN4ud9bwgz9GErklV7wCNmhnu6VKAWIxXXNw1D+
         pS3AdiDtCKgi9qpo1L7NS4entOrZQ2wDNKyo0MoCeCIUUbrjZyP1SJl9U5GwPNLj1r0T
         x7TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21si19415897jat.63.2021.05.17.08.10.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 08:10:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lietQ-0002Za-6e
	for alex.bennee@linaro.org; Mon, 17 May 2021 11:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lietH-0002Ye-9G; Mon, 17 May 2021 11:10:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lietE-0001Hp-SY; Mon, 17 May 2021 11:10:43 -0400
Received: from dggems706-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkMtN4syMzmhHp;
 Mon, 17 May 2021 23:07:08 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems706-chm.china.huawei.com (10.3.19.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 23:10:36 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 23:10:35 +0800
Subject: Re: [RFC PATCH v3 4/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
To: Andrew Jones <drjones@redhat.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
 <20210516103228.37792-5-wangyanan55@huawei.com>
 <20210517091257.wavp74sn37fh3nxf@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <50306678-44ec-24f5-6d00-24a8f98b7d25@huawei.com>
Date: Mon, 17 May 2021 23:10:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210517091257.wavp74sn37fh3nxf@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 prime.zeng@hisilicon.com, Paolo Bonzini <pbonzini@redhat.com>,
 yuzenghui@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bpd+setOGPmy

Hi Drew,

On 2021/5/17 17:12, Andrew Jones wrote:
> On Sun, May 16, 2021 at 06:32:28PM +0800, Yanan Wang wrote:
>> There is a separate function virt_smp_parse() in hw/virt/arm.c used
>> to parse cpu topology for the ARM machines. So add parsing of -smp
>> cluster parameter in it, then total number of logical cpus will be
>> calculated like: max_cpus = sockets * clusters * cores * threads.
>>
>> Note, we will assume multi-cluster in one socket is not supported
>> and default the value of clusters to 1, if it's not explicitly
>> specified in -smp cmdline.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c | 32 ++++++++++++++++++--------------
>>   1 file changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 7de822e491..678d5ef36c 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2642,8 +2642,8 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>>    * with the -smp cmdlines when parsing them.
>>    *
>>    * We require that at least one of cpus or maxcpus must be provided.
>> - * Threads will default to 1 if not provided. Sockets and cores must
>> - * be either both provided or both not.
>> + * Clusters and threads will default to 1 if they are not provided.
>> + * Sockets and cores must be either both provided or both not.
>>    *
>>    * Note, if neither sockets nor cores are specified, we will calculate
>>    * all the missing values just like smp_parse() does, but will disable
>> @@ -2652,15 +2652,18 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>>   static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>   {
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(ms);
>> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>>   
>>       if (opts) {
>>           unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
>>           unsigned maxcpus = qemu_opt_get_number(opts, "maxcpus", 0);
>>           unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
>> +        unsigned clusters = qemu_opt_get_number(opts, "clusters", 0);
>>           unsigned cores = qemu_opt_get_number(opts, "cores", 0);
>>           unsigned threads = qemu_opt_get_number(opts, "threads", 0);
>>   
>> -        /* Default threads to 1 if not provided */
>> +        /* Default clusters and threads to 1 if not provided */
>> +        clusters = clusters > 0 ? clusters : 1;
>>           threads = threads > 0 ? threads : 1;
>>   
>>           if (cpus == 0 && maxcpus == 0) {
>> @@ -2676,13 +2679,13 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>               cores = 1;
>>               if (cpus == 0) {
>>                   sockets = 1;
>> -                cpus = sockets * cores * threads;
>> +                cpus = sockets * clusters * cores * threads;
>>               } else {
>>                   maxcpus = maxcpus > 0 ? maxcpus : cpus;
>> -                sockets = maxcpus / (cores * threads);
>> +                sockets = maxcpus / (clusters * cores * threads);
>>               }
>>           } else if (sockets > 0 && cores > 0) {
>> -            cpus = cpus > 0 ? cpus : sockets * cores * threads;
>> +            cpus = cpus > 0 ? cpus : sockets * clusters * cores * threads;
>>               maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>           } else {
>>               error_report("sockets and cores must be both provided "
>> @@ -2695,25 +2698,26 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
>>               exit(1);
>>           }
>>   
>> -        if (sockets * cores * threads < cpus) {
>> +        if (sockets * clusters * cores * threads < cpus) {
>>               error_report("cpu topology: "
>> -                         "sockets (%u) * cores (%u) * threads (%u) < "
>> -                         "smp_cpus (%u)",
>> -                         sockets, cores, threads, cpus);
>> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
>> +                         "threads (%u) < smp_cpus (%u)",
>> +                         sockets, clusters, cores, threads, cpus);
>>               exit(1);
>>           }
>>   
>> -        if (sockets * cores * threads != maxcpus) {
>> +        if (sockets * clusters * cores * threads != maxcpus) {
>>               error_report("cpu topology: "
>> -                         "sockets (%u) * cores (%u) * threads (%u) "
>> -                         "!= maxcpus (%u)",
>> -                         sockets, cores, threads, maxcpus);
>> +                         "sockets (%u) * clusters (%u) * cores (%u) * "
>> +                         "threads (%u) != maxcpus (%u)",
>> +                         sockets, clusters, cores, threads, maxcpus);
>>               exit(1);
>>           }
>>   
>>           ms->smp.cpus = cpus;
>>           ms->smp.max_cpus = maxcpus;
>>           ms->smp.sockets = sockets;
>> +        vms->smp_clusters = clusters;
>>           ms->smp.cores = cores;
>>           ms->smp.threads = threads;
>>       }
>> -- 
>> 2.19.1
>>
> After reworking "[RFC PATCH v3 9/9] hw/arm/virt: Add separate -smp parsing
> function for ARM machines", this should also be reworked and fully tested,
> possibly using a standalone test, as as I suggested in the other review.
Ok, I will make full test.

Thanks,
Yanan
> Thanks,
> drew
>
> .
