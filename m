Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1313533lfb;
        Fri, 1 Apr 2022 19:18:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdMgqhsvpF/6hiDsqot+3lPZj5RNELsFp0kuv/GnzLQs/DxeXAp24/ai070LkP3AYKQ58h
X-Received: by 2002:a05:6214:ac5:b0:441:6510:4df5 with SMTP id g5-20020a0562140ac500b0044165104df5mr10262506qvi.86.1648865883186;
        Fri, 01 Apr 2022 19:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648865883; cv=none;
        d=google.com; s=arc-20160816;
        b=RKpfP62B1jLbVt0ZOmj7XD/DkWcnl2tJX0GV+mXrTASDSPI4ON3mzaIcmB0mlR3pcm
         vtaCdjqT4RfZQ/f9XDk0Uu1OsfnfHrlKa227efXn3BBtlqJZ9Qr2N34+ukKdzyqdyOwC
         XU20bnD0YsNuDegYsUbVysaN1608bkbGeYiRCoUp2yareQDJ8Y6e2dPfbu7YcefzQC3F
         zQx2GzE/Cy7IFLTNjPACYtHAr+CLJ9j7WZHsjfVoM+i6cDzII63+eW0g7+Mj668ha9IJ
         dgNspkiis4CPUPvEN4Pa/xi2aMPeoVGLaMJcqXpj4MmqzgqshnG83XDdPZERrlA46EN8
         pwOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=CzKp04gqQwReuP7THDVK6oELNLrdTflcF/N0bzlwC4s=;
        b=ppws0GuZLiEXetN10eHNV6RQkvi8OQw06Wpps4z1nMPgQHYKYrVt1KmLK+VU7xkoUd
         4ggT/+FS17yNkQBq66RRHu7PmrdDrjJib7ESJBUjpK5jA0X8bKAtTOpCLKUXuMAQKB0E
         CVFUNknF6ZTsfaB4UFXo8sBRhysRVa3YWLhDe3IimztkdVX2GPiNl7B4YMq3dyxR10gM
         fvgnUpEkh5HPAWemywGq6bX8dckKwFYvxmtkX3OQZkssanNqhsHQT4Oa9/0HE211H3t1
         lCUaxdLXcaAbPFgqKFzgnCLF3o+CfSexh/wMfY7KLqfQxN5wkTAjTeR2BsO1ZbCW+Oth
         rLWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m127-20020a378a85000000b0067e4be23a1csi1517190qkd.609.2022.04.01.19.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Apr 2022 19:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naTL0-0007bX-LP
	for alex.bennee@linaro.org; Fri, 01 Apr 2022 22:18:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naTKq-0007bK-Pe; Fri, 01 Apr 2022 22:17:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1naTKn-0007wi-R6; Fri, 01 Apr 2022 22:17:52 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KVgcK31mmzDq7w;
 Sat,  2 Apr 2022 10:15:29 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sat, 2 Apr 2022 10:17:44 +0800
Subject: Re: [PATCH v3 1/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <qemu-devel@nongnu.org>, <imammedo@redhat.com>, <drjones@redhat.com>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <zhenyzha@redhat.com>, <shan.gavin@gmail.com>
References: <20220323072438.71815-1-gshan@redhat.com>
 <20220323072438.71815-2-gshan@redhat.com>
Message-ID: <fcf52228-f911-a798-086b-666c9580f7ef@huawei.com>
Date: Sat, 2 Apr 2022 10:17:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220323072438.71815-2-gshan@redhat.com>
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
X-TUID: nYYSbC1FLniK

Hi Gavin,

On 2022/3/23 15:24, Gavin Shan wrote:
> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
>
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine yet. Besides, the cluster
> ID for the given CPU is assigned because it has been supported
> on arm/virt machine.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/arm/virt.c     | 11 +++++++++++
>   qapi/machine.json |  6 ++++--
>   2 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..064eac42f7 100644
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
> @@ -2518,6 +2519,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_cluster_id = true;
> +        ms->possible_cpus->cpus[n].props.cluster_id =
> +            n / (ms->smp.cores * ms->smp.threads);
> +        ms->possible_cpus->cpus[n].props.has_core_id = true;
> +        ms->possible_cpus->cpus[n].props.core_id = n / ms->smp.threads;
>           ms->possible_cpus->cpus[n].props.has_thread_id = true;
>           ms->possible_cpus->cpus[n].props.thread_id = n;
>       }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 42fc68403d..99c945f258 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -868,10 +868,11 @@
>   # @node-id: NUMA node ID the CPU belongs to
>   # @socket-id: socket number within node/board the CPU belongs to
>   # @die-id: die number within socket the CPU belongs to (since 4.1)
> -# @core-id: core number within die the CPU belongs to
> +# @cluster-id: cluster number within die the CPU belongs to
> +# @core-id: core number within cluster the CPU belongs to
>   # @thread-id: thread number within core the CPU belongs to
>   #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>   #       but management should be prepared to pass through other
>   #       properties with device_add command to allow for future
>   #       interface extension. This also requires the filed names to be kept in
> @@ -883,6 +884,7 @@
>     'data': { '*node-id': 'int',
>               '*socket-id': 'int',
>               '*die-id': 'int',
> +            '*cluster-id': 'int',
>               '*core-id': 'int',
>               '*thread-id': 'int'
>     }
Since new cluster-id is introduced, you may want to check whether to
update machine_set_cpu_numa_node() and hmp_hotpluggable_cpus(),
accordingly, which both deal with topo-ids. If we need to update them,
it's easier to review to make the whole cluster-id introduction part
a separate patch.

Thanks,
Yanan
