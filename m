Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp202720lfb;
        Wed, 21 Apr 2021 00:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw17RWk5oEOZsv9nbJEDx/+YGr4RyfEzlmbTtQ4OzoGZGEmD3XvZQ+LU5UEDfeMzdWErnU+
X-Received: by 2002:a05:620a:1e:: with SMTP id j30mr2148666qki.313.1618990845682;
        Wed, 21 Apr 2021 00:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618990845; cv=none;
        d=google.com; s=arc-20160816;
        b=KCxC5jV0/aUx0bXqL36vZoSkHWTlPa7lqQ1evLYMKSXvbkKCujhkui+ftpxo0Rwalg
         lN94tvA4XEFsiQhvHo6di1unn9rJI8JHp7dZMUYE7kCzo4XnL6mvG9+U8wK357blJ+FP
         CUHAEv8lNnTY64Y/CRQh+hs+3D5C6W2n1HTlhpGQLyPGyHv4MtjdmkeyMu8tk9xJ/gj4
         dfVP3oEGrriOwt5trGNS3T3r8m342wMh8jXdY9qlGdwvoYmZgikaoeXf1di7VNvQctRO
         h1bu8s4aUsGTvpjmfSlIBXS8zRMEFYpMS0eD0P3SyZ6yHZTerm8UsrYPQyo6/zbTaRO/
         ElQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=cMzHFEjq+hRk2WM/FHfby++BYxAxC1CB+rae3IoPPtk=;
        b=BnhNJ4g5wdH/GE9jIWKYzqeZjYMRKTD6AD7EFNzqL+D05FvM+LJ+wtcUfrAuuxJR4P
         k6GwMy/Imr56dn9RSGQKMJ8BiXT7BCQd5A5ttn1qAJH0b6eGVhYmwsw1bV9uyzgWF1e6
         NQbgUsUDdK0mEKndtZsShTz91uXfrfxFNgDx05z8MTRMfZm7ZB1RwC+anM7zzv9H4kDq
         AcJlE1Lvgxw1vI7WnAFAtToNdOLXU/xCBXztxcGWCmnIGJV7dfIqCHu1aNaOWLal8EZT
         xZbDxGzHv4xKk04f1+8BsKPV3knSdL5JSctlX/q8qvRxY4s3l5y+4PsuZvUr992GEIKa
         bjNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di12si1265423qvb.15.2021.04.21.00.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 00:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7TZ-0002ah-26
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 03:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lZ7TG-0002aA-VO; Wed, 21 Apr 2021 03:40:26 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lZ7TD-0003DY-CO; Wed, 21 Apr 2021 03:40:26 -0400
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FQC7q6cFqz5spD;
 Wed, 21 Apr 2021 15:37:43 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml405-hub.china.huawei.com (10.3.17.49) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 21 Apr 2021 15:40:06 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 21 Apr 2021 15:40:05 +0800
Subject: Re: [RFC PATCH v2 0/6] hw/arm/virt: Introduce cpu topology support
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <0a40b022-535a-a06d-b0a1-84be049f8d9e@huawei.com>
Date: Wed, 21 Apr 2021 15:40:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-1-wangyanan55@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, yangyicong@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BFNf3FE4r3Di

Hey guys, any comments will be really welcomed and appreciated! 😉

Thanks,
Yanan
On 2021/4/13 16:07, Yanan Wang wrote:
> Hi,
>
> This series is a new version of [0] recently posted by Ying Fang
> to introduce cpu topology support for ARM platform. I have taken
> over his work about this now, thanks for his contribution.
>
> Description:
> An accurate cpu topology may help improve the cpu scheduler's decision
> making when dealing with multi-core system. So cpu topology description
> is helpful to provide guest with the right view. Dario Faggioli's talk
> in [1] also shows the virtual topology could have impact on scheduling
> performace. Thus this patch series introduces cpu topology support for
> ARM platform.
>
> This series originally comes from Andrew Jones's patches [2], but with
> some re-arrangement. Thanks for Andrew's contribution. In this series,
> both fdt and ACPI PPTT table are introduced to present cpu topology to
> the guest. And a new function virt_smp_parse() not like the default
> smp_parse() is introduced, which prefers cores over sockets.
>
> [0] https://patchwork.kernel.org/project/qemu-devel/cover/20210225085627.2263-1-fangying1@huawei.com/
> [1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines-friend-or-foe-dario-faggioli-suse
> [2] https://github.com/rhdrjones/qemu/commit/ecfc1565f22187d2c715a99bbcd35cf3a7e428fa
>
> Test results:
> After applying this patch series, launch a guest with virt-6.0 and cpu
> topology configured with: -smp 96,sockets=2,clusters=6,cores=4,threads=2,
> VM's cpu topology description shows as below.
>
> Architecture:        aarch64
> Byte Order:          Little Endian
> CPU(s):              96
> On-line CPU(s) list: 0-95
> Thread(s) per core:  2
> Core(s) per socket:  24
> Socket(s):           2
> NUMA node(s):        1
> Vendor ID:           0x48
> Model:               0
> Stepping:            0x1
> BogoMIPS:            200.00
> NUMA node0 CPU(s):   0-95
>
> ---
>
> Changelogs:
> v1->v2:
> - Address Andrew Jones's comments
> - Address Michael S. Tsirkin's comments
> - Pick up one more patch(patch#6) of Andrew Jones
> - Rebased on v6.0.0-rc2 release
>
> ---
>
> Andrew Jones (3):
>    device_tree: Add qemu_fdt_add_path
>    hw/arm/virt: DT: Add cpu-map
>    hw/arm/virt: Replace smp_parse with one that prefers cores
>
> Yanan Wang (2):
>    hw/acpi/aml-build: Add processor hierarchy node structure
>    hw/arm/virt-acpi-build: Add PPTT table
>
> Ying Fang (1):
>    hw/arm/virt-acpi-build: Distinguish possible and present cpus
>
>   hw/acpi/aml-build.c          |  27 ++++++++
>   hw/arm/virt-acpi-build.c     |  77 ++++++++++++++++++++--
>   hw/arm/virt.c                | 120 ++++++++++++++++++++++++++++++++++-
>   include/hw/acpi/aml-build.h  |   4 ++
>   include/hw/arm/virt.h        |   1 +
>   include/sysemu/device_tree.h |   1 +
>   softmmu/device_tree.c        |  45 ++++++++++++-
>   7 files changed, 268 insertions(+), 7 deletions(-)
>
