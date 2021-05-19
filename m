Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1045341lfm;
        Tue, 18 May 2021 20:18:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWBaMELyNPV1kIZgCZCiMDuN8SuquZYjTO12VNH3TVI073EIPXVEIzwRLBdt4UOSdI8ve/
X-Received: by 2002:a17:906:bcd6:: with SMTP id lw22mr9937794ejb.250.1621394326788;
        Tue, 18 May 2021 20:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621394326; cv=none;
        d=google.com; s=arc-20160816;
        b=islozagkU4lhBRUFnC65sSJUswsyHKpTGW9dQeHD0STD1exqid9LWUZbwHKQIxKXx7
         vQN86I+Hz/pH+9Cj4tr4Za0XfIdGXC/do0/DL/cajeVXeHXD6sQj5Z/dpo/uIPPOexhD
         o+tjKE/ydhmUfwVoWmwNXXKh6hqjifQQejuv389/Z2+j8f4no6qwzTmJbQWvJyVtRHyf
         5I39TMsZmLCW6KBqKyiUS2Kj2s+WPq4jvb/aUobkOXTbpDukJWDmQqfD++S/rWICVz7X
         8IBccal1Xi5nATb1JwTY+6uh2qZyRKo2T4aRdYDMi9us1ntryOxhflxhFTONtxsGvton
         tZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=GLOYEz9F81d6+PfJjb8LEPcXoHvW3+VN7U5BKl9XUsQ=;
        b=Xe1YdNUGjGlKWAPEYeg3yxgmbN6YgoMwpnggGRIQriX7z3EXehCjySnjmiWcbR3Kvy
         RhspGB4qpNQ7FjgdcrxytlHRoRWI5WjeZdrsMim62k0t/cgmo4aBNMuuDS42PYdoP7uF
         g/iJ0H8U8QmlSiJUZlZ5QMr3WjQ+BXJd0+5i+lAsKbWMARph04zMFWog7xBxBXaiFkKr
         fC4ILrucAuafCv6WD8CPyP89sfWRm8P4t6/9Z2cxTbDoZLnB9IVy9D0oZMQUrzUgPrGz
         GaTW7RCo8ldYb0RG0CYcoeoXEx23CoWOwbzjHvkjh9uh+mIJBndSxcrsusnGy9fOoS0K
         zZTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si10602599edw.144.2021.05.18.20.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 20:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljCjN-0007QZ-QB
	for alex.bennee@linaro.org; Tue, 18 May 2021 23:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljCjE-0007QK-Pc; Tue, 18 May 2021 23:18:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1ljCjB-0005xx-V9; Tue, 18 May 2021 23:18:36 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FlHzZ0N3szNywX;
 Wed, 19 May 2021 11:14:50 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 11:18:19 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 11:18:18 +0800
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
To: Salil Mehta <salil.mehta@huawei.com>, Andrew Jones <drjones@redhat.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
Date: Wed, 19 May 2021 11:18:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b61a7413f98a430685b838eecc2db74f@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
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
X-TUID: YzIW4dU4dIGJ


On 2021/5/19 3:22, Salil Mehta wrote:
>> From: Andrew Jones [mailto:drjones@redhat.com]
>> Sent: Tuesday, May 18, 2021 8:06 PM
>> To: Salil Mehta <salil.mehta@huawei.com>
>> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; Wanghaibin
>> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Zhao
>> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
>> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>;
>> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.com>; Igor
>> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>; lijiajie (H)
>> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au>; Linuxarm
>> <linuxarm@huawei.com>; linuxarm@openeuler.org
>> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
>>
>> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
>>>   Those benefits, when vcpu pinning is used, are the same benefits
>>>> as for the host, which already use PPTT tables to describe topology, even
>>>> though hot plug isn't supported.
>>> yes sure, you mean pinning vcpus according to the cpu topology for performance?
>> Yup
> Already Agreed :)
>
>>>> Now, if you're saying we should only generate tables for smp.cpus, not
>>> Correct. This is what I thought we must be doing even now
>>>
>>>> smp.maxcpus, because hot plug isn't supported anyway, then I see your
>>>> point. But, it'd be better to require smp.cpus == smp.maxcpus in our
>>>> smp_parse function to do that, which we've never done before, so we may
>>>> have trouble supporting existing command lines.
>>> I am trying to recall, if the vcpu Hotplug is not supported then can they
>>> ever be different?
>>>
>>> cpus =  (threads * cores * sockets)
>>>
>>> static void smp_parse(MachineState *ms, QemuOpts *opts)
>>> {
>>>       [...]
>>>
>>>          if (sockets * cores * threads != ms->smp.max_cpus) {
>>>              warn_report("Invalid CPU topology deprecated: "
>>>                          "sockets (%u) * cores (%u) * threads (%u) "
>>>                          "!= maxcpus (%u)",
>>>                          sockets, cores, threads,
>>>                          ms->smp.max_cpus);
>>>          }
>>>       [...]
>>> }
>>>
>>> Although, above check does not exit(1) and just warns on detecting invalid
>>> CPU topology. Not sure why?
>> Hmm, not sure what code you have there. I see this in
>> hw/core/machine.c:smp_parse
>>
>>          if (ms->smp.max_cpus < cpus) {
>>              error_report("maxcpus must be equal to or greater than smp");
>>              exit(1);
>>          }
>>
>>          if (sockets * cores * threads != ms->smp.max_cpus) {
>>              error_report("Invalid CPU topology: "
>>                           "sockets (%u) * cores (%u) * threads (%u) "
>>                           "!= maxcpus (%u)",
>>                           sockets, cores, threads,
>>                           ms->smp.max_cpus);
>>              exit(1);
>>          }
>>
>>> Well if you think there are subtleties to support above implementation and
>>> we cannot do it now then sure it is your call. :)
Hi Salil, Drew,
>> The problem is that -smp 4,maxcpus=8 doesn't error out today, even though
>> it doesn't do anything. OTOH, -smp 4,cores=2 doesn't error out either, but
>> we're proposing that it should. Maybe we can start erroring out when
>> cpus != maxcpus until hot plug is supported?
> Agreed, both don't make any sense if hotplug is not supported and ideally should
> fail with error. We should block any such topology configuration.
In the ARM-specific function virt_smp_parse() (patch 9), there already
have been some restrictions for the given -smp configuration.
We now only allow:
-smp N
-smp maxcpus=M
-smp N, maxcpus=M

-smp N, sockets=X, cores=Y
-smp N, sockets=X, cores=Y, threads=Z

-smp maxcpus=M, sockets=X, cores=Y
-smp maxcpus=M, sockets=X, cores=Y, threads=Z

-smp N, maxcpus=M, sockets=X, cores=Y
-smp N, maxcpus=M, sockets=X, cores=Y, threads=Z

and disallow the other strange and rare formats that shouldn't be provided.

It's reasonable to block the topology configuration which is not useful
currently. I will add the requirement for "cpus==maxcpus" in this fuction
if the possible conflict with existing command lines is not a big problem.

Thanks,
Yanan
>
> Thanks
> Salil
> .
