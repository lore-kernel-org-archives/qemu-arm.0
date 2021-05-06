Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp999456lfg;
        Thu, 6 May 2021 00:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGjJFfyqfJfn4aitPNYPx4AFbnVekozHFY3XYisfXvgBDK06IsCQxsh/0KdwZOCakZ8mAD
X-Received: by 2002:a1f:3852:: with SMTP id f79mr1567846vka.24.1620284690067;
        Thu, 06 May 2021 00:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620284690; cv=none;
        d=google.com; s=arc-20160816;
        b=fhLattc+40vkeoToNloC9FBSU00zrPVW3ES6GaKzNSlXD6Yh2d2rQ+3sqylaQcTdYo
         0TH/2IcliH4URyrJ02cpyJfKidzIZHAETBgkV1wKL9vET22xge8dk2mHJSrgEw3zlsc+
         +1QXKLYPmGv/wVnjHp0M9NQ3r0mQAk92L2QI7Z0mt8QbeQemLE76GF4+Y9DFB3+7zire
         cyIFAUg2+YEPytWSpARQAuXDApdcuStlczsMmF4H+4oKONt8bWIFQJfo5woHkBAP2WiH
         f+KTsQsRImukyOWA6myjIGzpSjSlxx6zmg8WOlYuN0gr2GY4VD9me0rf3Gum0jAfp/8q
         5KLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=kLQY1p4XgweU7ySnvSs34NxWe3w9G9QBBj26Y1yUCZc=;
        b=qV7E9wQOeIltUWLVgcF4ILcODXrRHd0hblKpt76qTeJc9uyDwHnrxBgigm9nceYTfV
         +sEC1/aKQ0E6vpr/GZArR6UhjgKZC2e6DooqIAaCXoWuthHeSrWCr9PLLzD4fUFe+ZCy
         jXGy9vUOJAcXtXhJ5pqe4d/MImYIheeF0I9hdzxsFTBJkKYZSLYhZz3QJ8Zo9ZxpAdgd
         KEeM0f9G5Vuepjd0TB7gvbTLBcRFxz4eug2nRfBLQM69EFubq4kUrQS9ey6FQQahemmb
         W7RVWSOK6yAflsYCHCb7sjCkBf3eStgG5KE22c/wIZYlWoga039ShvRaTnUX0C43iqh7
         ml8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si605167vsz.415.2021.05.06.00.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 May 2021 00:04:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:36794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1leY41-0004fc-C9
	for alex.bennee@linaro.org; Thu, 06 May 2021 03:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1leY3t-0004fO-9M; Thu, 06 May 2021 03:04:41 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1leY3q-0000p6-6O; Thu, 06 May 2021 03:04:41 -0400
Received: from dggeml705-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FbPbg3MsZz19Ldj;
 Thu,  6 May 2021 15:00:15 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml705-chm.china.huawei.com (10.3.17.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 15:04:22 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 6 May 2021 15:04:15 +0800
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
To: Andrew Jones <drjones@redhat.com>
References: <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
 <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
 <20210429110229.7jtz6hfrfvqdkrbx@gator>
 <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
 <20210430064125.3b5fjolwqculrjxz@gator.home>
 <20210430070131.kkavbosw27ze4iuh@gator.home>
 <dedb07c3-b6fa-ccb0-9d06-65c7866238db@huawei.com>
 <20210430104927.do6cxs6yw6yqlq6e@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7fbaedf0-6f21-e131-198d-d39500460ce0@huawei.com>
Date: Thu, 6 May 2021 15:04:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210430104927.do6cxs6yw6yqlq6e@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, Igor
 Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8VpcBro4wzM

Hi Drew,

On 2021/4/30 18:49, Andrew Jones wrote:
> On Fri, Apr 30, 2021 at 05:33:42PM +0800, wangyanan (Y) wrote:
>> On 2021/4/30 15:01, Andrew Jones wrote:
>>> On Fri, Apr 30, 2021 at 08:41:25AM +0200, Andrew Jones wrote:
>>>> On Fri, Apr 30, 2021 at 01:09:00PM +0800, wangyanan (Y) wrote:
>>>>> But I think the requirement for ARM "if even one parameter other than cpus
>>>>> or maxcpus
>>>>> is provided then all parameters must be provided" will be better. This can
>>>>> ensure the
>>>>> whole accurate users-specified topology. As you mentioned, if anybody who
>>>>> bothers
>>>>> to specify one, why not also specify the others.
>>>>>
>>>>> I can add the requirement for ARM in the documentation, and also check the
>>>>> parameters
>>>>> in virt_smp_parse. Will this be fine?
>>>> We sort of have to support command lines that are missing 'maxcpus' and
>>>> 'clusters', unless we work together with libvirt to make the change.
>>>> Currently libvirt will generate '-smp 16,sockets=16,cores=1,threads=1'
>>>> from '<vcpu placement='static'>16</vcpu>'. That's sufficient for our
>>>> stricter, but not completely strict requirements. And, I still think
>>>> 'threads' could be optional, because there's a good chance the user
>>>> doesn't want to describe them, so a default of 1 is good enough. Also,
>>>> given maxcpus, but not cpus, it's pretty obvious that cpus should equal
>>>> maxcpus.
>>>>
>>> We also still need just 'cpus' or just 'maxcpus' to work, since that
>>> already works now. So, at least these should work
>>>
>>>    -smp N
>>>    -smp maxcpus=N
>>>    -smp N,maxcpus=M
>>>    -smp N,sockets=N,cores=1,threads=1
>>>    -smp N,maxcpus=M,sockets=M,cores=1,threads=1
>>>
>>> since they work today, even though no topology is described.
>> Yes. I forgot this point that we should consider the compat.
>>> If we want to
>>> describe a topology for the first three, then we'll have to pick one,
>>> which brings us back to the sockets over cores stuff. Or, we could choose
>>> to just not generate topology descriptions when none is provided.
>> I find that both preferring cores over sockets and not generating topology
>> descriptions
>> when none is provided can't solve everything. We can only ensure guest will
>> get one
>> socket with multiple cores with qemu cmdline "-smp N".
>>
>> But if we specify N cpus without any other parameters in libvirt xml, a qemu
>> cmdline like
>> "-smp N, sockets=N, cores=1,threads=1" will be generated, and as a result
>> guest will get
>> N sockets. In this case, we still can't avoid the silent change.
>>
>> So maybe we should just prefer sockets over cores like the general
>> smp_parse() and libvirt,
>> and let users use "-smp N, sockets=1, cores=N,threads=1" to get what they
>> want if they
>> use version 6.0 or later.
> Rather than doing the preference of sockets over cores thing, let's
> require that sockets, cores, and one of maxcpus or cpus are provided,
> as we discussed in the other mail.
Ok, I see.

Thanks for these discussions about parsing of -smp command line. :)
Now it seems that a separate virt_smp_parse() function for ARM is still 
necessary,
I will implement it in v3 of the other "Introduce cpu topology support" 
series.

Thanks,
Yanan
>
> Thanks,
> drew
>
> .
