Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp43789lfm;
        Mon, 17 May 2021 21:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydGSqw4cZAv5BoYNJsvX2QFqd0g1EcBBywn9T8UYF4vZ+we4ik/jAloP36xQ2JNTKS9UWO
X-Received: by 2002:ad4:4a01:: with SMTP id m1mr3943295qvz.6.1621312991825;
        Mon, 17 May 2021 21:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621312991; cv=none;
        d=google.com; s=arc-20160816;
        b=pcMusn4/o0+R0w10QGTnFF5lvO6DAk8w9UUPKOMZ57bRNsVveWHVM8sCqaM9CvnjZM
         WgthYMaqeSkI55lh+5IGWtq83tiaEsRnss0IJo1vqD4GivKETEr4asO3P8SFqHe3K+zK
         /rMez+7x8M+d7XmXsvB413BpkINXDm9ua02Ot1xLK/cRK2ark8w5+TBGghyEpOtPzG72
         S84+gbTiJTekuB6kC6kQICSGolLnnig1jpY2yzAXklCu7Arsvw9RADLIqZvflUsXfh9T
         AktPWHGxebz46IHjFZygSVqHXfVYK65iM3LmUxnrQ8DqNzgKFEfBP1gVOWNoVYKuIbPV
         gcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=VmJAhuqKEjOpHasrKRFmF+xTIE9TjbXqABb4XIi9pz8=;
        b=RPllhIaMOhRJpaJq3fEB9TAceAr7+tuqn+E46yKabMtnJ97g0Aa718hhIKzmR110Ko
         B5lQfnMa+XV+rNr4UDuuIBWW1iibUm00QL95Hpm6d02z0YOFOCfu9shk+knDNtSVarp+
         gtaHoBfJcmkUxL2Fa7rSYEHhFoSB9cgI10PJOg7v+4XgXS8wb1LNffxbiTg2EmqVaoBp
         HtGvjc3vQ8+2Z8mIvGal+bXlAQtD7PVIjUPMpG34kPCIxtszvPdORV80q0K4Jd4JekHF
         GgBODlP7izg0XBdccBhDebV2JMRewlp+/uM9AGUusXg96QunL3ZdemExlAQQGa3zu2ZK
         gjeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si13407489qki.114.2021.05.17.21.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 21:43:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lirZX-00082k-6s
	for alex.bennee@linaro.org; Tue, 18 May 2021 00:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lirZ5-000820-BN; Tue, 18 May 2021 00:42:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lirZ2-00051k-F9; Tue, 18 May 2021 00:42:43 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fkjw269QMz16Pph;
 Tue, 18 May 2021 12:39:46 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 12:42:31 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 18 May 2021 12:42:30 +0800
Subject: Re: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
To: Salil Mehta <salil.mehta@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
 <20210516102900.28036-5-wangyanan55@huawei.com>
 <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <68883a1b-5303-da13-a051-e909e1d1f71b@huawei.com>
Date: Tue, 18 May 2021 12:42:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6c8f9c3502384f648f30c7381e87dda9@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 yangyicong@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /LfHC2s3jxhu

Hi Salil,

On 2021/5/18 4:48, Salil Mehta wrote:
>> From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
>> On Behalf Of Yanan Wang
>> Sent: Sunday, May 16, 2021 11:29 AM
>> To: Peter Maydell <peter.maydell@linaro.org>; Andrew Jones
>> <drjones@redhat.com>; Michael S . Tsirkin <mst@redhat.com>; Igor Mammedov
>> <imammedo@redhat.com>; Shannon Zhao <shannon.zhaosl@gmail.com>; Alistair
>> Francis <alistair.francis@wdc.com>; David Gibson
>> <david@gibson.dropbear.id.au>; qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>; zhukeqian
>> <zhukeqian1@huawei.com>; yangyicong <yangyicong@huawei.com>; Zengtao (B)
>> <prime.zeng@hisilicon.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
>> yuzenghui <yuzenghui@huawei.com>; Paolo Bonzini <pbonzini@redhat.com>;
>> Philippe Mathieu-Daudé <philmd@redhat.com>
>> Subject: [RFC PATCH v3 4/9] hw/arm/virt: Initialize the present cpu members
>>
>> We create and initialize a cpuobj for each present cpu in
>> machvirt_init(). Now we also initialize the cpu member of
>> structure CPUArchId for each present cpu in the function.
> [...]
>
>>           qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
>> +
>> +        /*
>> +         * As ARM cpu hotplug is not supported yet, we initialize
>> +         * the present cpu members here.
>> +         */
>> +        machine->possible_cpus->cpus[n].cpu = cpuobj;
>
> when vcpu Hotplug is not supported yet, what necessitates this change now?
>
The initialization will gives a way to determine whether a CPU is 
present or not.
At least, for now it will be used when generating ACPI tables, e.g. 
DSDT, MADT.
See patch 5 and 6.

Thanks,
Yanan
> .
