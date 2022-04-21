Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp306239lfk;
        Thu, 21 Apr 2022 05:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/FHdmiSBPbIQU9oMGpq6FZGvkh4P/1IBXrwukjVVRIzU+BXW5mz8QnjXKMLNddGKc6rL5
X-Received: by 2002:a05:6214:1d23:b0:446:6366:fea8 with SMTP id f3-20020a0562141d2300b004466366fea8mr13150369qvd.32.1650543250449;
        Thu, 21 Apr 2022 05:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650543250; cv=none;
        d=google.com; s=arc-20160816;
        b=MlHh1zTtCdy/dpZyX3rlviYgYOyAC7BF63AFxKJtIB1lT5errPwAXqXs/tNmmzZDJY
         tUsS6DhMDhDkud4AAXXHVzSfLtAJJ0zqqk6avkRUbXvVrR5IxEZNmAqrrUyDpbedbka9
         oflLYOM2n6TLBdQgTnFTojV2GJAu4o8mBMvr32SU/6hfJYH1WrK2W/E2x2ZGf1TNYuGn
         S62NPSNm+mo+RP9YHu725r2F0wdM7GKkJ/dsfBnt8nQBXGP3kAkcDZMn3UnXa9ZLgJbr
         IlP5KhqPv+kZzMQVCIOayzw12yoRwjNK0QKTKk0lWVzkjuNTqXqU1dJpLAZ/bgTtFgM0
         o1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=+LsM7zfvuxjn16OLy2Mvvhv+GDalkc9mILAZ4BzWdno=;
        b=oLkCnpfO4shqMzxS5+6Hlm/fnbE2ume16QqDKTGZTbN2BsDbX4Nr96o1cP3Zz1NPRL
         uHZHpyPacoVL/iWHvT8Dbe6PyiY8IkC9MA2t5SEk7IOLl+qeTIuZO+oWuxNXIoNMGPCc
         m1fkyeE5gTOBYeN5lH5OuW4AwDb2C1BRZEXe7sfEjVInYca2AmQtioYx/I35X8vHXJLF
         vqewusAmzmbn6GKXZnU1Y+nPXYVxWZ55LZkiBuJAdO2awtC1k/Rsld5GcgRGMdZgTSYR
         Hb55A85S3D82JKAaMTHoya7xX5mbU0yZXm66zbbYmWQCfj8CfgJ2V4HAKoNIqrYo4Kjj
         XHFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a05622a145100b002e1fbf3be55si1314531qtx.70.2022.04.21.05.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 05:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhVhJ-0001p5-RW
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 08:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nhVKw-0008Bn-VX; Thu, 21 Apr 2022 07:51:03 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1nhVKu-0000N3-99; Thu, 21 Apr 2022 07:51:02 -0400
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KkbTN5XK9zhXp0;
 Thu, 21 Apr 2022 19:50:48 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Apr 2022 19:50:55 +0800
Subject: Re: [PATCH v7 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Gavin Shan <gshan@redhat.com>, <qemu-arm@nongnu.org>
CC: <lvivier@redhat.com>, <eduardo@habkost.net>, <thuth@redhat.com>,
 <berrange@redhat.com>, <shan.gavin@gmail.com>, <peter.maydell@linaro.org>,
 <Jonathan.Cameron@Huawei.com>, <zhenyzha@redhat.com>, <mst@redhat.com>,
 <qemu-devel@nongnu.org>, <armbru@redhat.com>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <pbonzini@redhat.com>, <drjones@redhat.com>,
 <eblake@redhat.com>, <f4bug@amsat.org>
References: <20220420104909.233058-1-gshan@redhat.com>
 <20220420104909.233058-3-gshan@redhat.com>
Message-ID: <5f104799-20cf-2e2e-9dd8-bfee381ce670@huawei.com>
Date: Thu, 21 Apr 2022 19:50:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20220420104909.233058-3-gshan@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  "wangyanan (Y)" <wangyanan55@huawei.com>
From:  "wangyanan (Y)" via <qemu-devel@nongnu.org>
X-TUID: rdhifdH59uhZ

Hi Gavin,
Sorry I missed the v6.
On 2022/4/20 18:49, Gavin Shan wrote:
> Currently, the SMP configuration isn't considered when the CPU
> topology is populated. In this case, it's impossible to provide
> the default CPU-to-NUMA mapping or association based on the socket
> ID of the given CPU.
>
> This takes account of SMP configuration when the CPU topology
> is populated. The die ID for the given CPU isn't assigned since
> it's not supported on arm/virt machine. Besides, the used SMP
> configuration in qtest/numa-test/aarch64_numa_cpu() is corrcted
> to avoid testing failure
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>   hw/arm/virt.c           | 15 ++++++++++++++-
>   tests/qtest/numa-test.c |  3 ++-
>   2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index d2e5ecd234..5443ecae92 100644
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
> @@ -2518,8 +2519,20 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
>           ms->possible_cpus->cpus[n].type = ms->cpu_type;
>           ms->possible_cpus->cpus[n].arch_id =
>               virt_cpu_mp_affinity(vms, n);
> +
> +        assert(!mc->smp_props.dies_supported);
> +        ms->possible_cpus->cpus[n].props.has_socket_id = true;
> +        ms->possible_cpus->cpus[n].props.socket_id =
> +            (n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads));
nit: so the outermost "()" is unnecessary too.
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
> diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
> index 90bf68a5b3..aeda8c774c 100644
> --- a/tests/qtest/numa-test.c
> +++ b/tests/qtest/numa-test.c
> @@ -223,7 +223,8 @@ static void aarch64_numa_cpu(const void *data)
>       QTestState *qts;
>       g_autofree char *cli = NULL;
>   
> -    cli = make_cli(data, "-machine smp.cpus=2 "
> +    cli = make_cli(data, "-machine "
> +        "smp.cpus=2,smp.sockets=1,smp.clusters=1,smp.cores=1,smp.threads=2 "
>           "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>           "-numa cpu,node-id=1,thread-id=0 "
>           "-numa cpu,node-id=0,thread-id=1");
Thanks,
Yanan
