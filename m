Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1495785lfy;
        Sat, 15 Aug 2020 11:10:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFLLRLqvCH7ZHLHOgXIYWHchmas+QHeKUAq4O8yrWsML8t76xNnc1G1jltmp7eii1giX7R
X-Received: by 2002:a25:ccc3:: with SMTP id l186mr9778633ybf.382.1597515050280;
        Sat, 15 Aug 2020 11:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597515050; cv=none;
        d=google.com; s=arc-20160816;
        b=FC3Y/2AIuc7cK+ZuiMJ6jU3kCUPHSOPWkB1VJpoBjY1IXiFjBOEnxF/huhaEPoq6Ok
         HshOtVrtgVObI7cKtKLxO11/hmkP+HPvp8FctKi0XknixhiEVWJWcimv9UhczfcmBE3I
         9hMhOQNkvBmfZLwBEAQ3EDylioKZit3AU0N/lQQFel6Jb0aern4vW4tzL7jOGOc7GH4P
         ncYMCgTQES/dX3M2fGGu7ZnIs7Y6VM5L8h9mlblJ+ityJdl3jgb3dVvKN5EX9h4eutWG
         teZYgOR4haGzs2fyxaEXAREBUCtfs0qCcIpv3SpBlt2eidmKOlkVS2h9ITWOlpgZ5R84
         C4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=2nJK8LBEw6/1aWX278vdmE3IL8vdz+ds7qiAW6vCuEA=;
        b=ugt2ZNFs//eBakQ1Rs98KMTbEM6mBL11c8z0HT0xeo1jTO6FqWZQ+oLzvZjxoXjJNV
         AB9wbTD5wOw1SD4XBwtmi1Kmx11sGdhFMkzYhNq1mp/ynZbXrkP//eUouL+2+RDDO3ny
         fQpo06nCET5SBqmWZihAO9YmiAosZSyJkDro7Yqh//oRq+5QCiM5BZDUpfjSG9uvkp3r
         DPTucv3Th4v7lYGwqcyc5OJ/sUnGw3FzEMHFC2oK3/ol0SnzdLLFooeZ8NlZouAUamPh
         f3e/wg4f3URJIo1Jot0mJu2lDYBtKThFqs1EhaIQHb63yKbMSFt3ni84kIWmG/gtGcyh
         XRGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si11506104ybo.358.2020.08.15.11.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 11:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k70dl-0003rz-J1
	for alex.bennee@linaro.org; Sat, 15 Aug 2020 14:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70dY-0003qF-W5; Sat, 15 Aug 2020 14:10:37 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2101 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k70dX-0008Fl-8v; Sat, 15 Aug 2020 14:10:36 -0400
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id DCACFF626E9E62984702;
 Sat, 15 Aug 2020 10:19:28 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 15 Aug 2020 10:19:28 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 15 Aug 2020 10:19:28 +0800
Subject: Re: [RFC 5/9] target/arm: introduce CPU feature dependency mechanism
To: Andrew Jones <drjones@redhat.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-6-liangpeng10@huawei.com>
 <20200813124821.psavdkhddg4duar6@kamzik.brq.redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <1e7160d1-96e7-7581-cdc9-cb4ad44aca72@huawei.com>
Date: Sat, 15 Aug 2020 10:19:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200813124821.psavdkhddg4duar6@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/15 14:10:31
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, zhukeqian 00502301 <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7zhLnoy4h+g

On 8/13/2020 8:48 PM, Andrew Jones wrote:
> On Thu, Aug 13, 2020 at 06:26:53PM +0800, Peng Liang wrote:
>> Some CPU features are dependent on other CPU features.  For example,
>> ID_AA64PFR0_EL1.FP field and ID_AA64PFR0_EL1.AdvSIMD must have the same
>> value, which means FP and ADVSIMD are dependent on each other, FPHP and
>> ADVSIMDHP are dependent on each other.
>>
>> This commit introduces a mechanism for CPU feature dependency in
>> AArch64.  We build a directed graph from the CPU feature dependency
>> relationship, each edge from->to means the `to` CPU feature is dependent
>> on the `from` CPU feature.  And we will automatically enable/disable CPU
>> feature according to the directed graph.
>>
>> For example, a, b, and c CPU features are in relationship a->b->c, which
>> means c is dependent on b and b is dependent on a.  If c is enabled by
>> user, then a and b is enabled automatically.  And if a is disabled by
>> user, then b and c is disabled automatically.
> 
> And what if a is mutually exclusive with b? I.e. a and b can both be
> disabled, but only a or b may be enabled.
> 
> Thanks,
> drew
> 
> .
> 

Currently, a and b will be both enabled or disabled.  For example, a and b are
in relationship a->b, which means b is dependent on a.  If -cpu host,a=off,b=on,
then both a and b are enabled.  If -cpu host,b=on,a=off, then both a and b are
disabled.  Maybe we should report an error to user in this scenario?

Thanks,
Peng
