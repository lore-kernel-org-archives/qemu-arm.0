Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4524941lfb;
        Tue, 7 Sep 2021 02:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3F5Yz1YZt+r6AkUW3uHtHqyN9FmYmQv36/bB+64U3DmEIn+wThI8VK0mbH0XNc1CsD100
X-Received: by 2002:a25:abc7:: with SMTP id v65mr6535305ybi.422.1631005991192;
        Tue, 07 Sep 2021 02:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631005991; cv=none;
        d=google.com; s=arc-20160816;
        b=I+ENWgPmsvN3olIdWDulg/WmpFYui1JEzZgYAbt9izxWmyybM1WhykwrEnpKScEUOA
         E9w5gtmtofFTGvQXZPvD2WSj22KQBGHaGzRTqltYJ8pU72daiv20+NeKb5fq27m8oU8F
         YVKKmWTS5gd6UQve8pzp/HdRsny72NRK9LozNwr+E+dSdD0J3QBzOIT8dD6j7IBpE6SR
         3bqregttyNHyl1zMQzneglarR0r4z0ZAaRSfCnSLAXaOSH7tHwiiK8Ygf2GUcUyYJWLp
         kk2ZvXbu2GsQ5HONUdNU0Pfm+Hk68QEDhYUXio6gCpuRk/ketXsl05xrFQ29Qw+Y2QT6
         4tGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=sMu98o2ssqD4MyHVsKSgEKAT9A8ToT4MSEuEu8mW8J8=;
        b=c8xlxl9Eg4NuErWE+lvQXgQ4NDD8+RPfX5ElEHXlL5TFMDjQ9OZ7rcOqfxNDgzLuKX
         T3PF32b9fOcY3a0rkp3A3JGD4WUnRGJeGtIzul7S3pD3qfv3SZ872PUyToTJErQLVFAl
         cYUvAeIdjx8zem57QnlwU7u4sZYSppdjI/fQDYmehffgAdjdbUcrpf5Wh9UdDx5Rby7d
         DcLBQmG7psO2asbx/mk/NJybx5Nj53yNQiEXLTtjNs4Zg8mgAoj4MpUuE6jIO961n1aH
         ajxqZn3mzxD6nuxqPleA0VTKS1OpNegbf4JZRUrST+kGr9HbinB6NeKEwXj27TdPIfyn
         LddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b83si12154561ybc.130.2021.09.07.02.13.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 02:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNXAE-0002yj-Fh
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 05:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mNXA3-0002vp-2I; Tue, 07 Sep 2021 05:12:59 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mNX9z-0003em-IN; Tue, 07 Sep 2021 05:12:58 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H3fZj3rYFzbmHp;
 Tue,  7 Sep 2021 17:08:45 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 17:12:36 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 17:12:35 +0800
Subject: Re: [PATCH v6 0/5] hw/arm/virt: Introduce cpu topology support
To: Andrew Jones <drjones@redhat.com>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
 <CAFEAcA99urPQ4ZnmZrOG4JvL-sO-=kTGXF5Fuz-FoVHV6+J=pg@mail.gmail.com>
 <77ee3e41-e985-74f8-8510-1c47903689a8@huawei.com>
 <CAFEAcA9n10wZY5vO1ZpwO-P3u=dV2G4J8j3xtSjzfA5YX0oouQ@mail.gmail.com>
 <342f66ab-5c03-4aa3-b398-1e02926d86f7@huawei.com>
 <20210906161523.4kc5l3usbw6l2s6r@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <7bed1b6f-562f-8b43-b63b-5e2530170523@huawei.com>
Date: Tue, 7 Sep 2021 17:12:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210906161523.4kc5l3usbw6l2s6r@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme701-chm.china.huawei.com (10.1.199.97) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Salil Mehta <salil.mehta@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU
 Developers <qemu-devel@nongnu.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kuSoyJLkxQUG


On 2021/9/7 0:15, Andrew Jones wrote:
> On Fri, Sep 03, 2021 at 03:38:13PM +0800, wangyanan (Y) wrote:
>> On 2021/9/3 15:25, Peter Maydell wrote:
>>> On Fri, 3 Sept 2021 at 08:05, wangyanan (Y) <wangyanan55@huawei.com> wrote:
>>>> On 2021/9/2 23:56, Peter Maydell wrote:
>>>>> On Tue, 24 Aug 2021 at 13:20, Yanan Wang <wangyanan55@huawei.com> wrote:
>>>>>> This new version is based on patch series [1] which introduces some
>>>>>> fix and improvement for smp parsing.
>>>>>>
>>>>>> Description:
>>>>>> Once the view of an accurate virtual cpu topology is provided to guest,
>>>>>> with a well-designed vCPU pinning to the pCPU we may get a huge benefit,
>>>>>> e.g., the scheduling performance improvement. See Dario Faggioli's
>>>>>> research and the related performance tests in [2] for reference.
>>>>>>
>>>>>> This patch series introduces cpu topology support for ARM platform.
>>>>>> Both cpu-map in DT and ACPI PPTT table are introduced to store the
>>>>>> topology information. And we only describe the topology information
>>>>>> to 6.2 and newer virt machines, considering compatibility.
>>>>>>
>>>>>> patches not yet reviewed: #1 and #3.
>>>>>>
>>>>>> [1] https://lore.kernel.org/qemu-devel/20210823122804.7692-1-wangyanan55@huawei.com/
>>>>>> [2] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-for-virtual-machines
>>>>>> -friend-or-foe-dario-faggioli-suse
>>>>> Hi; this series doesn't apply to current head-of-git. Is it
>>>>> intended to be based on some other series ?
>>>>>
>>>> Yes, it was based on the -smp parsing changes in [1] which hasn't been
>>>> picked yet. Given that [1] somehow affects the topology parsing results
>>>> which we will describe to guest, I think it may be better that [1] can be
>>>> merged first and then this series follows.
>>> OK. I'll ignore this for now; please resend once that other series
>>> has been accepted.
>> Got it.
> Also, you'll likely want to rebase on Igor's acpi refactor series[*]
>
> [*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg822151.html
>
Ok, sure. I can wait for a while and will rebase the ACPI changes on Igor's
series for next version.

Thanks,
Yanan

