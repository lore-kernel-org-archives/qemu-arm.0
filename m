Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6932617lfb;
        Tue, 28 Dec 2021 19:49:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhdyhKebamUyVeF71U7emuZ1Fqupiro8NgSubLI7kzL5thTajqWt6UFbvCGEvc9IVj3Dip
X-Received: by 2002:a25:db0e:: with SMTP id g14mr12851663ybf.60.1640749752673;
        Tue, 28 Dec 2021 19:49:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640749752; cv=none;
        d=google.com; s=arc-20160816;
        b=wFcIXA8sGU18Pt7shb3WNK4NWdNP4Njx20jRdPgAtbtwOaY9AUJ+FdYdVaDd9YJDZf
         A79jHTJSJBYbYV8nCpBKbhI6YDbYqeDs7uV8WEccvKd3BQBGwBTzjmrhb6x+fxIV/Sbu
         AzuIuxWtesTHKgOyxdSMQGroF4ci85SB3p+cObib5DDjfWg5gCqymGvT9A9mArp5tf2x
         tnBYXLNQnz/Di0McMWRErJGWpDBQ3LorkloljtnGg3jb2XzRb9KfZSDXH0tEyDuulUGK
         owEX2zB+WjmSBljh4sSfMdeXPXi5Yne1izwp8Bc9VMtuls84gg7g2D3uIueAwIsgKuKJ
         URoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=45a3wldCmQbvIhOmFDuXNQRfoGbRRI9kMKYhftWYQ4A=;
        b=ZTUBIg0vgdfzSwm3cc6h3ylNevGKznlb6oxQY0zPIQw0j0kmq23WtvQR49ku3TXSXZ
         COR0CsClg8loz2jyQfLr4xDbCrzh0UyGYvrCgeACrVtSq/nhXUhKOZDOW1+4X13g0+1f
         cFM10XmcfQhrOPIjEWyMEc47XRyKf2rG158rRdatCqAvS7AP/Vw98Z36sxYBFjwRRT10
         V+sWY7wzxOwsnLQ5rpfq9ENBkeX+Wx1BqDacrRQpJ0Jm+nFdmZW4ajZ8iFOLJ2Nr83Ve
         QKhCHkvS1yORe8bgOUA4lvjms40PX8pFapJQBz0TXcd81g8ycUtMvroyyJLHhM1mXL3Y
         er1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si4435976ybk.380.2021.12.28.19.49.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 19:49:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:57222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2Pxg-00039m-4D
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 22:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2Pwr-0002X2-My; Tue, 28 Dec 2021 22:48:21 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2Pwn-00076J-9W; Tue, 28 Dec 2021 22:48:21 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNy3q691Lz8vms;
 Wed, 29 Dec 2021 11:45:43 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 11:48:10 +0800
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster topology
 support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
 <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
Message-ID: <2248a06d-7c3d-2ee3-e683-901d9bcbec02@huawei.com>
Date: Wed, 29 Dec 2021 11:48:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rBRITg5saBaY

Hi Philippe,
Thanks for your review.

On 2021/12/29 3:17, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 12/28/21 10:22, Yanan Wang wrote:
>> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
>> which has been proved to benefit the scheduling performance (e.g.
>> load balance and wake_affine strategy) on both x86_64 and AArch64.
>>
>> So now in Linux 5.16 we have four-level arch-neutral CPU topology
>> definition like below and a new scheduler level for clusters.
>> struct cpu_topology {
>>      int thread_id;
>>      int core_id;
>>      int cluster_id;
>>      int package_id;
>>      int llc_id;
>>      cpumask_t thread_sibling;
>>      cpumask_t core_sibling;
>>      cpumask_t cluster_sibling;
>>      cpumask_t llc_sibling;
>> }
>>
>> A cluster generally means a group of CPU cores which share L2 cache
>> or other mid-level resources, and it is the shared resources that
>> is used to improve scheduler's behavior. From the point of view of
>> the size range, it's between CPU die and CPU core. For example, on
>> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
>> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
>> L2 cache and a L3 cache tag, which brings cache affinity advantage.
>>
>> In virtualization, on the Hosts which have pClusters, if we can
> Maybe [*] -> reference to pClusters?
Hm, I'm not sure what kind of reference is appropriate here.
The third paragraph in the commit message has explained what
a cluster generally means. We can also read the description of
clusters in Linux kernel Kconfig files: [1] and [2].

[1]arm64: https://github.com/torvalds/linux/blob/master/arch/arm64/Kconfig

config SCHED_CLUSTER
        bool "Cluster scheduler support"
        help
          Cluster scheduler support improves the CPU scheduler's decision
          making when dealing with machines that have clusters of CPUs.
          Cluster usually means a couple of CPUs which are placed closely
          by sharing mid-level caches, last-level cache tags or internal
          busses.

[2]x86: https://github.com/torvalds/linux/blob/master/arch/x86/Kconfig

config SCHED_CLUSTER
        bool "Cluster scheduler support"
        depends on SMP
        default y
        help
          Cluster scheduler support improves the CPU scheduler's decision
          making when dealing with machines that have clusters of CPUs.
          Cluster usually means a couple of CPUs which are placed closely
          by sharing mid-level caches, last-level cache tags or internal
          busses.
>> design a vCPU topology with cluster level for guest kernel and
>> have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
>> also make use of the cache affinity of CPU clusters to gain
>> similar scheduling performance.
>>
>> This patch adds infrastructure for CPU cluster level topology
>> configuration and parsing, so that the user can specify cluster
>> parameter if their machines support it.
>>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/core/machine-smp.c | 26 +++++++++++++++++++-------
>>   hw/core/machine.c     |  3 +++
>>   include/hw/boards.h   |  6 +++++-
>>   qapi/machine.json     |  5 ++++-
>>   qemu-options.hx       |  7 ++++---
>>   softmmu/vl.c          |  3 +++
>>   6 files changed, 38 insertions(+), 12 deletions(-)
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index edeab6084b..ff0ab4ca20 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1404,7 +1404,9 @@
>>   #
>>   # @dies: number of dies per socket in the CPU topology
>>   #
>> -# @cores: number of cores per die in the CPU topology
>> +# @clusters: number of clusters per die in the CPU topology
> Missing:
>
>     #            (since 7.0)
Ah, yes.
>> +#
>> +# @cores: number of cores per cluster in the CPU topology
>>   #
>>   # @threads: number of threads per core in the CPU topology
>>   #
>> @@ -1416,6 +1418,7 @@
>>        '*cpus': 'int',
>>        '*sockets': 'int',
>>        '*dies': 'int',
>> +     '*clusters': 'int',
>>        '*cores': 'int',
>>        '*threads': 'int',
>>        '*maxcpus': 'int' } }
> If you want I can update the doc when applying.
Do you mean the missing "since 7.0"?
If you have a plan to apply the first 1-7 patches separately and
I don't need to respin, please help to update it, thank you! :)

Thanks,
Yanan
> Thanks,
>
> Phil.
>
> .

