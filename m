Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp349187lfb;
        Wed, 28 Apr 2021 01:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFn9lH2v8ZUwCp/EeY+qwklfLKWQDuHz42daiSy9js+wD+wqcEOBlTPKXHUVQEmYDR6Im/
X-Received: by 2002:a17:906:8a62:: with SMTP id hy2mr216011ejc.232.1619597197690;
        Wed, 28 Apr 2021 01:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619597197; cv=none;
        d=google.com; s=arc-20160816;
        b=AzQZ2XYZsAa7T7OOzCDv8w8ZhqMHYQLageb0/n+sqj/3KnXCnwFusLmHnu1tdzDEfn
         5ciaAIfaKfW1WnKW0RINGUexeM4ADfGg9+HvVvPLVuBeKUhQfBC9w/dXJAI+a/yX9xe3
         x7W3v/MMyBQ/YO5HyTwiPQ8xCVImMTeBcPjQgigq0cpnN9gkF0c73VC+XtFs8Wje94UO
         S/gRBSE2ftfC9zXniBqaDafzzZnhHG1Abb8w3o9HHNCDgDQzpafwI3HED9wj2P7BmZ1V
         DQmFcL8S5Z9rAxHtWm2Ayb4ZVh5/8mJn+rqpL7qjHb8Kk8NDzJ78OrQLo62ORZZaUUQ2
         6/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=IonOAqT9HTfhJxW0UqUDtNQN9esAeLt2neJlahTwTaM=;
        b=Gdf3oA96U1UxFHsW7/N0zPNWB/kaVp6jvu8i6LSQZE6NdXdVt/atTOrOonBTNZpiHI
         eYFEECvcUbF3rNjunMeDKM6NbiPoPxn8PNDA1/lxTm4Zo85bLiEDU+zC9S+9NrkdfiqZ
         TbypLxWjpTVhnig4upEsqkLvVofm+sdJQkY/WOKI8c5B3XiNX4E3phIn4PfDBcmqj79q
         cVp21p9duNHIXP8aRfUXGUtQUbTQ7k3H1yN1q8vLYMqeCKXLMmCpYHrR/j54d2bFf6Lr
         otXEYQWYMRQMVcY0fBhcDP8YbQl02eiVtm89at1RBjijU0zNMeKUW2YcBfXnrdhmeoAC
         6o1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jg11si2186362ejc.175.2021.04.28.01.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Apr 2021 01:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbfDQ-0002t8-TM
	for alex.bennee@linaro.org; Wed, 28 Apr 2021 04:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbfBQ-0001mK-Pf; Wed, 28 Apr 2021 04:04:32 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbfBO-0000LJ-7X; Wed, 28 Apr 2021 04:04:32 -0400
Received: from dggeml701-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FVWLg1qKdzYbkS;
 Wed, 28 Apr 2021 16:02:03 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml701-chm.china.huawei.com (10.3.17.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 28 Apr 2021 16:04:20 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 28 Apr 2021 16:04:19 +0800
Subject: Re: [RFC PATCH v2 6/6] hw/arm/virt: Replace smp_parse with one that
 prefers cores
To: Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-7-wangyanan55@huawei.com>
 <20210427145856.5qaetgzdl6ovnoni@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <db9cb1b8-1399-aa29-f8a5-874f6508f330@huawei.com>
Date: Wed, 28 Apr 2021 16:04:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210427145856.5qaetgzdl6ovnoni@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: tJibDXOrkzWZ

Hi Drew,

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
> default as it is to avoid a mach-virt specific smp parser.
 From my view, I did't find any harm in defaulting to sockets over 
cores, but I'm not really sure..
At least, the arch-neutral function smp_parse and pc_smp_parse for x86 
all prefer sockets over cores in default.
>   The "no
> topology" compat variable will keep existing machine types from switching
> from cores to sockets, so we don't need to worry about that.
Yes, I agree about this.

Thanks,
Yanan
> [1] https://github.com/rhdrjones/qemu/commit/c0670b1bccb4d08c7cf7c6957cc8878a2af131dd
>
> Thanks,
> drew
>
>
> .
