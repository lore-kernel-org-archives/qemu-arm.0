Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp414834lfb;
        Wed, 28 Apr 2021 02:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFO9OLDoaKOgJacI2aMUzoSWAhdY/GbPJpWE3QMhQ9KDg93dZGi2pGZdDWtndpm3ebC+8i
X-Received: by 2002:a05:6102:6:: with SMTP id j6mr23243163vsp.8.1619602637413;
        Wed, 28 Apr 2021 02:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619602637; cv=none;
        d=google.com; s=arc-20160816;
        b=jRGeX9+EzdKG4gZtqcG7JibYYLvnRHAYCNw9YxIgWJHjW/yyiry6Nrt7utWQflLbnO
         kN0DTYWTn2Hd3y1W6JZzlf2sihd6h3+W6tW+1c702uq8GHJ1rXh9hok9xmORmTv6KKwH
         PpoIqY5s9WsfDFKULIKYRBIcmP+xU/0RMbAOB1JLC4QKb+xaO+tTgDLrNQXFv+udY9/P
         u1TIfdk2zeDACFsxqn55rtEsZ2bgi9BscDPgS33jHUO/twfHsYOFbJK2HCo+vkzfkX1r
         oLxGmBjypiCTqTI56wmmOZl3PXqffm3gY+9DMrKmtThdYNKGr+MEG56vEHhB1RFXfOBg
         z2AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Bbtp/9GSh9JyXumLAo1RS78DrnVnb8AIpHzj+c2GCio=;
        b=IwNx4F1uafKJ4p6yPvXW+cx9Sy6Q5CdGBls1Ka5g41tjZOzDUlInLNFZfZjgl0ZmZd
         1I5bX0l65AWNchE/uxKr0GaPyyhfSNyqK+HygtSEI864ef/ZDRr8gbYCA1Bh3bR0C5q/
         HJt0oi2CJMkGMuRikHJuKj4gnb/Rjy0Ltz8w2iqvrkkcEu3etivH0h+ySIfgJj6CsnVW
         uY8dz9M9YD/4waZmywoVXR+XdMrNCdb+KLNnpLHLJWSZ0gzOmIZoGqAT2e3CosMPsLc7
         t7FHAEp+4/V/zJtudXNHLupZOlXxjkbOJJWZfw8W5rg4bqOFM9g1eGbP31JsWNyWPQco
         RnmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b197si3364021vsd.235.2021.04.28.02.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 02:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbgdA-0002k9-Pz
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 05:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbgco-0002jt-Gq; Wed, 28 Apr 2021 05:36:54 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbgcl-0004o5-SF; Wed, 28 Apr 2021 05:36:54 -0400
Received: from dggeml755-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FVYNJ64Nrz5vHX;
 Wed, 28 Apr 2021 17:33:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml755-chm.china.huawei.com (10.1.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 17:36:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 17:36:43 +0800
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
 <20210427145856.5qaetgzdl6ovnoni@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f3d5172b-13a5-a8d3-8cdb-03788e43fc52@huawei.com>
Date: Wed, 28 Apr 2021 17:36:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427145856.5qaetgzdl6ovnoni@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qOhewZ2YCy5o


On 2021/4/27 22:58, Andrew Jones wrote:
> On Tue, Apr 13, 2021 at 04:07:45PM +0800, Yanan Wang wrote:
>> From: Andrew Jones <drjones@redhat.com>
>>
>> The virt machine type has never used the CPU topology parameters, other
>> than number of online CPUs and max CPUs. When choosing how to allocate
>> those CPUs the default has been to assume cores. In preparation for
>> using the other CPU topology parameters let's use an smp_parse that
>> prefers cores over sockets. We can also enforce the topology matches
>> max_cpus check because we have no legacy to preserve.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   hw/arm/virt.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
> Thanks, this patch matches [1]. Of course, I've always considered this
> patch to be something of an RFC, though. Is there any harm in defaulting
> to sockets over cores? If not, I wonder if we shouldn't just leave the
> default as it is to avoid a mach-virt specific smp parser. The "no
> topology" compat variable will keep existing machine types from switching
> from cores to sockets, so we don't need to worry about that.
>
> [1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
For CPU topology population, ARM64 kernel will firstly try to parse ACPI 
PPTT table
and then DT in function init_cpu_topology(), if failed it will rely on 
the MPIDR value
in function store_cpu_topology(). But MPIDR can not be trusted and is 
ignored for
any topology deduction. And instead, topology of one single socket with 
multiple
cores is made, which can not represent the real underlying system topology.
I think this is the reason why VMs will in default prefer cores over 
sockets if no
topology description is provided.

With the feature introduced by this series, guest kernel can 
successfully get cpu
information from one of the two (ACPI or DT) for topology population.

According to above analysis, IMO, whether the parsing logic is "sockets 
over cores" or
"cores over sockets", it just provide different topology information and 
consequently
different scheduling performance. Apart from this, I think there will 
not any harm or
problems caused.

So maybe it's fine that we just use the arch-neutral parsing logic?
How do you think ?

Thanks,
Yanan
> Thanks,
> drew
>
>
> .
