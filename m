Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp104810lfk;
        Wed, 13 Apr 2022 05:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpBIHmiUZylRhYAXWjy6j9nc32ywjFwGDbqNqGJ5zcPdHM6kgPPmB0ImjczscPtFlB65zW
X-Received: by 2002:a05:620a:2986:b0:69c:59f0:d3e4 with SMTP id r6-20020a05620a298600b0069c59f0d3e4mr1416915qkp.351.1649853635345;
        Wed, 13 Apr 2022 05:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649853635; cv=none;
        d=google.com; s=arc-20160816;
        b=STlmLViO4/cCMwmmo+kRZiDJs6Uk/zL8NzKmARQQfohybmb9f8kdeVKSIFoYlbuzv4
         xzz88dUgT0eBY67ljWe5ey4G9H4e1Ks6gbe1WWeZXQmxBusr9GMQCDGz3Nma9xYe/ajA
         ZUWmDqceb7U9edBxpr0UwFCoAY6RABcQjGSgy4ZDx2hECLIW9H+BdzHVNLgTaEjVkdCn
         FOovX3tE3Dhvi5/GkNez3G3OMz09dk3y4QmOHsCUQiSPdxjG7iHMn9kZhluaikCWbRgN
         3HUKLzakaL8J1NflmJ/N2qsW/6xHU2hQjJjd/hXn0dV+JRkdT38pDX8eH9vDrl2+lhN+
         boNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=p/xHZHHjsgI/Q/cvWtofEWMimZCO3LtL208lTpQtYWU=;
        b=flMwkC9GmqSdvzyG4B04RZyuOtp3vz+I1gbyjtjI+I0e28Jl5q/ZDcwoXYSQuwqcMU
         VshK8Kjit17J/B1Tax8hFruljN0FE4CoCh8+TNoZg2A+BmqFAFZhmC5c7wxKxcfUmUbo
         ZoVBPERuddNUJgwEvDYKiCAdWcD0cKoI3HBDfAyZjqOyomFJrFXB++V3jUdHPkN89FTG
         zLusdUEZnCF95pMnCC732x4cqCHDwkZDnTx6Qh6bjD1q7U2+cKU9c35JRtRp0SiRkY3T
         B5eOaFDEuAGRtUW0dAF+OHeFpZzVil61MHeLmNdrEzviWmkV+9nqumBAZGIsw2go9qur
         ncXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020ac87396000000b002eb938166eesi738698qtp.354.2022.04.13.05.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Apr 2022 05:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1necIU-0000g7-Qw
	for alex.bennee@linaro.org; Wed, 13 Apr 2022 08:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1necHF-0000ef-Eb; Wed, 13 Apr 2022 08:39:17 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1necHA-00084E-PV; Wed, 13 Apr 2022 08:39:16 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kdhtg5czvzgYb8;
 Wed, 13 Apr 2022 20:37:15 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2375.24; Wed, 13 Apr 2022 20:39:05 +0800
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <richard.henderson@linaro.org>, <peter.maydell@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
Message-ID: <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
Date: Wed, 13 Apr 2022 20:39:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220403145953.10522-3-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-arm@nongnu.org>
X-TUID: zr6XIoafYNN1

Hi Gavin,

On 2022/4/3 22:59, Gavin Shan wrote:
> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
>
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine yet.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..3174526730 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2505,6 +2505,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>       int n;
>       unsigned int max_cpus = ms->smp.max_cpus;
>       VirtMachineState *vms = VIRT_MACHINE(ms);
> +    MachineClass *mc = MACHINE_GET_CLASS(vms);
>   
>       if (ms->possible_cpus) {
>           assert(ms->possible_cpus->len == max_cpus);
> @@ -2518,8 +2519,21 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads)) %
> +            ms->smp.sockets;
No need for "% ms->smp.sockets".
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id =
> +            (n / ms->smp.threads) % ms->smp.cores;
>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
> -        ms->possible_cpus->cpus[n].props.thread_id = n;
> +        ms->possible_cpus->cpus[n].props.thread_id =
> +            n % ms->smp.threads;
>       }
>       return ms->possible_cpus;
>   }
Otherwise, looks good to me:
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>

Thanks,
Yanan
