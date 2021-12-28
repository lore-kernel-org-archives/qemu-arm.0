Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6370604lfb;
        Tue, 28 Dec 2021 02:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHU+UxlBq7hjJ21xtqXphLXyZyHqbpC0/iH46J4un7HbPTIie/gRl5omaKCRl+dzj+b1io
X-Received: by 2002:a25:23ce:: with SMTP id j197mr16727921ybj.743.1640689014511;
        Tue, 28 Dec 2021 02:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640689014; cv=none;
        d=google.com; s=arc-20160816;
        b=h0swz4hFESlALBIqK0vlPvCsxLzNjgBE6VQGo1MMCAbKkyka2ZHxcMjnhOY2U2Vo94
         RFIv3tnqe1zwSQz2x9s7n7noVMpgukWBUNOCm2LQDewiGtx2a8y/P4SXnDpRDNWo90J/
         FShoExUSresCRW2gsnwRuY939Nr/v0JFgRbsGodnZaDt2PwBKhwsNr9x33cMlTrV468l
         LjeJwC8n4AOyeDFf+S+lHZsVHEKsUmdyriGPvEHWYcz8UHKsQbonpuM8rDL4BlU1MkYu
         6FuPvpyahCdnNwB/icfUkrBvoi0UADpCAZbU1WNT4hYDlM+lUZG3ov2/6SXkofezxuDo
         /Ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:subject;
        bh=zjEJRAVnaERWGbjINYOHdgeAxh5xfjDySQTZmf0/pB0=;
        b=h9uN27M4Q5V0TngYLoe5xMxlyCvBTUirCnSiAekebh8S0Ds65xJIqGvfxpIZBLo/LP
         egliLp/xDf7oMYjCEi1oPUJP0iOHPVfONAxUTIPQ9NgpVtC+6tR1KJ6jko8bRRGDZh8Y
         QbFZGDHd2ySvyYzSu9XGisMRFG91wBjbiYCSFy7Wq8eIMat2Yw3XY0nBjomcRJ+09KlQ
         Klvsn3Z4V4XjU0SwhEe24nehfu5S4H62E4QA7+eKwZL6mrpnXDVF3rKuUGmh16a4dNHD
         8hKSi74KbZZzagENipmDPNl9nt8+JoUQ2L8LJ0xBt0hd2bOgnm8J9EA21R/iRYk/Tm11
         yngA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si5800214ybo.741.2021.12.28.02.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 02:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n2AA1-0005MI-Uy
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 05:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2A9h-0005M4-9o; Tue, 28 Dec 2021 05:56:33 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n2A9e-0002yV-48; Tue, 28 Dec 2021 05:56:33 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JNWbR0B1Tz1DKKZ;
 Tue, 28 Dec 2021 18:53:07 +0800 (CST)
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 18:56:23 +0800
Subject: Re: [PATCH v4 00/10] ARM virt: Introduce CPU clusters topology support
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric Blake
 <eblake@redhat.com>, <wanghaibin.wang@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
Message-ID: <e73c9ce9-e2e8-308c-b638-bab8b13e93ca@huawei.com>
Date: Tue, 28 Dec 2021 18:56:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
X-TUID: 4jI8yklEQK6j

I have sent a v5 with four new patches added, so this v4 can be ignored.
v5: https://patchew.org/QEMU/20211228092221.21068-1-wangyanan55@huawei.com/

Thanks,
Yanan

On 2021/11/21 20:24, Yanan Wang wrote:
> Hi,
>
> This series introduces the new CPU clusters topology parameter
> and enable the support for it on ARM virt machines.
>
> Background and descriptions:
> The new Cluster-Aware Scheduling support has landed in Linux 5.16,
> which has been proved to benefit the scheduling performance (e.g.
> load balance and wake_affine strategy) on both x86_64 and AArch64.
> We can see Kernel PR [1] and the latest patch set [2] for reference.
>
> So now in Linux 5.16 we have four-level arch-neutral CPU topology
> definition like below and a new scheduler level for clusters.
> struct cpu_topology {
>      int thread_id;
>      int core_id;
>      int cluster_id;
>      int package_id;
>      int llc_id;
>      cpumask_t thread_sibling;
>      cpumask_t core_sibling;
>      cpumask_t cluster_sibling;
>      cpumask_t llc_sibling;
> }
>
> A cluster generally means a group of CPU cores which share L2 cache
> or other mid-level resources, and it is the shared resources that
> is used to improve scheduler's behavior. From the point of view of
> the size range, it's between CPU die and CPU core. For example, on
> some ARM64 Kunpeng servers, we have 6 clusters in each NUMA node,
> and 4 CPU cores in each cluster. The 4 CPU cores share a separate
> L2 cache and a L3 cache tag, which brings cache affinity advantage.
>
> [1] https://lore.kernel.org/lkml/163572864855.3357115.17938524897008353101.tglx@xen13/
> [2] https://lkml.org/lkml/2021/9/24/178
>
> In virtualization, on the Hosts which have pClusters, if we can
> design a vCPU topology with cluster level for guest kernel and
> have a dedicated vCPU pinning. A Cluster-Aware Guest kernel can
> also make use of the cache affinity of CPU clusters to gain
> similar scheduling performance.
>
> This series consists of two parts:
> The first part (patch 1-3):
> Implement infrastructure for CPU cluster level topology support,
> including the SMP documentation, configuration and parsing.
>
> The second part (part 4-10):
> Enable CPU cluster support on ARM virt machines, so that users
> can specify a 4-level CPU hierarchy sockets/clusters/cores/threads.
> And the 4-level topology will be described to guest kernel through
> ACPI PPTT and DT cpu-map.
>
> Changelog:
> v3->v4:
> - Significant change from v3 to v4, since the whole series is reworked
>    based on latest QEMU SMP frame.
> - v3: https://lore.kernel.org/qemu-devel/20210516103228.37792-1-wangyanan55@huawei.com/
>
> Yanan Wang (10):
>    qemu-options: Improve readability of SMP related Docs
>    hw/core/machine: Introduce CPU cluster topology support
>    hw/core/machine: Wrap target specific parameters together
>    hw/arm/virt: Support clusters on ARM virt machines
>    hw/arm/virt: Support cluster level in DT cpu-map
>    hw/acpi/aml-build: Improve scalability of PPTT generation
>    hw/arm/virt-acpi-build: Make an ARM specific PPTT generator
>    tests/acpi/bios-tables-test: Allow changes to virt/PPTT file
>    hw/acpi/virt-acpi-build: Support cluster level in PPTT generation
>    tests/acpi/bios-table-test: Update expected virt/PPTT file
>
>   hw/acpi/aml-build.c         |  66 ++------------------------
>   hw/arm/virt-acpi-build.c    |  92 +++++++++++++++++++++++++++++++++++-
>   hw/arm/virt.c               |  16 ++++---
>   hw/core/machine-smp.c       |  29 +++++++++---
>   hw/core/machine.c           |   3 ++
>   include/hw/acpi/aml-build.h |   5 +-
>   include/hw/boards.h         |   6 ++-
>   qapi/machine.json           |   5 +-
>   qemu-options.hx             |  91 +++++++++++++++++++++++++++--------
>   softmmu/vl.c                |   3 ++
>   tests/data/acpi/virt/PPTT   | Bin 76 -> 96 bytes
>   11 files changed, 214 insertions(+), 102 deletions(-)
>
> --
> 2.19.1
>
> .

