Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1283611lfm;
        Wed, 19 May 2021 01:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5DihzlNSqNoLr6qsQZtcnUaCLbQjofE3ksDAGJFk+7ZnpwUbz/AUULFhiNlizyr9vwmVZ
X-Received: by 2002:a1f:b217:: with SMTP id b23mr12076268vkf.16.1621413747956;
        Wed, 19 May 2021 01:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621413747; cv=none;
        d=google.com; s=arc-20160816;
        b=OMat6Nw0NRomS7qHCrARabfPffzPIQ4vnKzrSCwwYepMPM9JRhWSZTwmCUZ7qJzzjr
         zcQ1J0k89oOpIJcsPDVvDz3K5jM4jKEhZzZ7Uv05LFhB+kGlKRwsBNVlXZPzayZ+VTB5
         /AsanxARBUvZBnD22rDexLEkie7bdTKqI0y+UKUuOlD/REhoHITiiWSsm8ewHtXidMfb
         k4AniJVWZHNduez8wLR2+g4cgdUaHMUmhM+T60B1aQaP0TKvKbzV6IOT13qS3TkFl8jr
         uUaj1grBQ4/645RRdZd1j4V8gVZMOIH0/YCdHUcWTLdFpaURe80haC/85BGCkD6IESyQ
         kexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=zuvNPgzMvXB7jtZ1idD0BRJNuYrhVCqWGg5m1fPPBYQ=;
        b=nKlIc7LF43/4yWP39/+VX8DF50NGK1pfbhAWOg1TNrX/Q9HPh9lSoETMNE8BRhmolH
         INLCK1aGHfTKKR7ckNB3BuAAwKSLGJ7Q4h2tkN9pAFGCO8HAM12eGXXy0ZPsUuhkxxLi
         euTtmCZrkKZ6Qne9RO9hbn0qoX5tuRG/zRz0u22JRdIPLy+SnSoiIcFlR7QD3eWZVNLc
         8Z0Le1xBFFycLbRK+ygkVv8yDzMmjmrj1/J/9VhQCRCRSt0vSwGEywji+5aCgHcrhQdM
         EVTRGNNUfQr13oq9pa5YV+4LOpFT0JMh1ZrKMyRU+v/2dvMGwzSWl/J4tv6/P/5lIkbB
         kbGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l24si6025835vsj.428.2021.05.19.01.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 01:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljHmd-0001kX-8A
	for alex.bennee@linaro.org; Wed, 19 May 2021 04:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljHmS-0001k6-0O; Wed, 19 May 2021 04:42:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljHmO-0008CT-50; Wed, 19 May 2021 04:42:15 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FlR9x1yQtz1BNgH;
 Wed, 19 May 2021 16:39:17 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 16:42:03 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 16:42:01 +0800
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
To: Andrew Jones <drjones@redhat.com>, Salil Mehta <salil.mehta@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
 <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
 <f766805215ac439bb988dab02247ec71@huawei.com>
 <20210519081507.mnk43k77wbekeany@gator.home>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d42d0132-43dd-9bd5-f3c5-a3f3e2eeb81e@huawei.com>
Date: Wed, 19 May 2021 16:42:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210519081507.mnk43k77wbekeany@gator.home>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9kWZRw+/fT13


On 2021/5/19 16:15, Andrew Jones wrote:
> On Wed, May 19, 2021 at 07:54:37AM +0000, Salil Mehta wrote:
>>> From: wangyanan (Y)
>>> Sent: Wednesday, May 19, 2021 4:18 AM
>>>
>>>
>>> On 2021/5/19 3:22, Salil Mehta wrote:
>>>>> From: Andrew Jones [mailto:drjones@redhat.com]
>>>>> Sent: Tuesday, May 18, 2021 8:06 PM
>>>>> To: Salil Mehta <salil.mehta@huawei.com>
>>>>> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
>>>>> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; Wanghaibin
>>>>> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Zhao
>>>>> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
>>>>> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
>>>>> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.com>; Igor
>>>>> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>; lijiajie
>>> (H)
>>>>> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au>;
>>> Linuxarm
>>>>> <linuxarm@huawei.com>; linuxarm@openeuler.org
>>>>> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
>>>>>
>>>>> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
>>>>>>    Those benefits, when vcpu pinning is used, are the same benefits
>>>>>>> as for the host, which already use PPTT tables to describe topology, even
>>>>>>> though hot plug isn't supported.
>>>>>> yes sure, you mean pinning vcpus according to the cpu topology for performance?
>>>>> Yup
>>>> Already Agreed :)
>>>>
>>>>>>> Now, if you're saying we should only generate tables for smp.cpus, not
>>>>>> Correct. This is what I thought we must be doing even now
>>>>>>
>>>>>>> smp.maxcpus, because hot plug isn't supported anyway, then I see your
>>>>>>> point. But, it'd be better to require smp.cpus == smp.maxcpus in our
>>>>>>> smp_parse function to do that, which we've never done before, so we may
>>>>>>> have trouble supporting existing command lines.
>>>>>> I am trying to recall, if the vcpu Hotplug is not supported then can they
>>>>>> ever be different?
>>>>>>
>>>>>> cpus =  (threads * cores * sockets)
>>>>>>
>>>>>> static void smp_parse(MachineState *ms, QemuOpts *opts)
>>>>>> {
>>>>>>        [...]
>>>>>>
>>>>>>           if (sockets * cores * threads != ms->smp.max_cpus) {
>>>>>>               warn_report("Invalid CPU topology deprecated: "
>>>>>>                           "sockets (%u) * cores (%u) * threads (%u) "
>>>>>>                           "!= maxcpus (%u)",
>>>>>>                           sockets, cores, threads,
>>>>>>                           ms->smp.max_cpus);
>>>>>>           }
>>>>>>        [...]
>>>>>> }
>>>>>>
>>>>>> Although, above check does not exit(1) and just warns on detecting invalid
>>>>>> CPU topology. Not sure why?
>>>>> Hmm, not sure what code you have there. I see this in
>>>>> hw/core/machine.c:smp_parse
>>>>>
>>>>>           if (ms->smp.max_cpus < cpus) {
>>>>>               error_report("maxcpus must be equal to or greater than smp");
>>>>>               exit(1);
>>>>>           }
>>>>>
>>>>>           if (sockets * cores * threads != ms->smp.max_cpus) {
>>>>>               error_report("Invalid CPU topology: "
>>>>>                            "sockets (%u) * cores (%u) * threads (%u) "
>>>>>                            "!= maxcpus (%u)",
>>>>>                            sockets, cores, threads,
>>>>>                            ms->smp.max_cpus);
>>>>>               exit(1);
>>>>>           }
>>>>>
>>>>>> Well if you think there are subtleties to support above implementation and
>>>>>> we cannot do it now then sure it is your call. :)
>>> Hi Salil, Drew,
>>>>> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
>>>>> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
>>>>> we're proposing that it should. Maybe we can start erroring out when
>>>>> cpus != maxcpus until hot plug is supported?
>>>> Agreed, both don't make any sense if hotplug is not supported and ideally should
>>>> fail with error. We should block any such topology configuration.
>>> In the ARM-specific function virt_smp_parse() (patch 9), there already
>>> have been some restrictions for the given -smp configuration.
>>> We now only allow:
>>> -smp N
>>> -smp maxcpus=M
>>> -smp N, maxcpus=M
>>>
>>> -smp N, sockets=X, cores=Y
>>> -smp N, sockets=X, cores=Y, threads=Z
>>>
>>> -smp maxcpus=M, sockets=X, cores=Y
>>> -smp maxcpus=M, sockets=X, cores=Y, threads=Z
>>>
>>> -smp N, maxcpus=M, sockets=X, cores=Y
>>> -smp N, maxcpus=M, sockets=X, cores=Y, threads=Z
>>>
>>> and disallow the other strange and rare formats that shouldn't be provided.
>>>
>>> It's reasonable to block the topology configuration which is not useful
>>> currently. I will add the requirement for "cpus==maxcpus" in this fuction
>>> if the possible conflict with existing command lines is not a big problem.
>> Hi Yanan,
>> Makes sense. I did see your other patch-set in which cluster support has been
>> added. Are we deferring that too?
> The merge of that needs to be deferred, but for a different reason. It
> shouldn't impact hot plug, because if hot plug doesn't like clusters,
> then one could configure a topology which doesn't have clusters. But,
> it can't be merged to QEMU until the kernel has merged its support.
Agreed!

Thanks,
Yanan
> Thanks,
> drew
>
> .
