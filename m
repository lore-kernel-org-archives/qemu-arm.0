Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4669833lfb;
        Tue, 27 Apr 2021 04:01:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFaOx3MnA19d8IRm9h0RpAnW60ptiMdOHTAlgJLVXIlHPMkKMJMYVVnLHAO3h7LnTW8d2S
X-Received: by 2002:a17:906:5952:: with SMTP id g18mr3540143ejr.313.1619521292204;
        Tue, 27 Apr 2021 04:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619521292; cv=none;
        d=google.com; s=arc-20160816;
        b=OOW2TBpAVXgn42QB7hIh82XevjP8sqJGNIDaoV/NHeVcjme9qFAX6A9k/+Ja/5PE+3
         WVn3SJIH7CgQu1Wjb0aaGe8n28nF+Oy7CCvrQ/AdbSnMb4qY4whXRzVlaioBMbJvbvp5
         xj8clhnzPoTXkB8BC2foHnzAZoqW49vr422c/2kuU8kW0jieqaQqYkHx+as9E3VhWAI9
         1BxU8fudo2eocXsrCrPIL4QrWSjr7vmLV9dd5TEWVenmvO8DdLzcQ2ztAeUhfi9BsZcz
         gwIj8sH/58AjA0R18VnEfigJBotXCBf5vQYSGTRZxzJCrlrMcD031ctibZAHMHYArAEQ
         SlAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=KXjHATMOUpPYz6x7/P5GC2ZkC3l/pPY0bkbarvAAJL0=;
        b=HriFDyq9zcrCyRU2x54Rj7vCHLaICHkeDkXQGz/RE+hL5lxxp5ybth14G4C1EQmRvA
         X3p/j58m85Xz2OisXCMHPuT+SBbeZe1H9xImfBpSrhCf7AqqFqiPBhtLa1/34dS97Lgl
         Bk9xcTDzXaWK23JsLifjAYUHo6+T3EHGvgaK7CpxhPU133oU6d6hTv3GW6zsx7xIqkRK
         VhNUfR8drbBM4y57ALscGUqXjz8UOR5J5oXjiLqJ5M2DFoF0N+HQmCPW1pmqW0/RcS7/
         DyBanYLmL+OEbT/uhT9u93UwxBQI4lLqpyGkk3N+qjn6whbMV6MJV7nfUxrRCvvS8c3b
         SZRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23si1223489ejs.451.2021.04.27.04.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 04:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:37892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbLT9-0008Dl-B8
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 07:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbLSh-0008DZ-7C; Tue, 27 Apr 2021 07:01:03 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lbLSZ-0008MZ-CW; Tue, 27 Apr 2021 07:01:03 -0400
Received: from dggeml763-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FTzGn2jc7z19HdN;
 Tue, 27 Apr 2021 18:56:49 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggeml763-chm.china.huawei.com (10.1.199.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 27 Apr 2021 19:00:44 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 27 Apr 2021 19:00:43 +0800
Subject: Re: [RFC PATCH 0/6] Introduce cluster cpu topology support
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
 <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <a883cf7e-b820-9d20-6424-e2add3007e9b@huawei.com>
Date: Tue, 27 Apr 2021 19:00:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <13983bec-8b6b-4277-288a-e243d096bfb3@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZKyMNf5z8eWf

Hi Philippe,

On 2021/4/27 17:57, Philippe Mathieu-Daudé wrote:
> Hi Yanan,
>
> On 3/31/21 11:53 AM, Yanan Wang wrote:
>> Hi,
>> This series introduces the cluster cpu topology support, besides now
>> existing sockets, cores, and threads.
>>
>> A cluster means a group of cores that share some resources (e.g. cache)
>> among them under the LLC. For example, ARM64 server chip Kunpeng 920 has
>> 6 or 8 clusters in each NUMA, and each cluster has 4 cores. All clusters
>> share L3 cache data while cores within each cluster share the L2 cache.
>>
>> Also, there are some x86 CPU implementations (e.g. Jacobsville) where L2
>> cache is shared among a cluster of cores instead of being exclusive to
>> one single core. For example, on Jacobsville there are 6 clusters of 4
>> Atom cores, each cluster sharing a separate L2, and 24 cores sharing L3).
>> About this series:
>> Note that, this series was implemented based on [3] and [4]. Although they
>> have not merged into qemu mainline for now, it's still meaning to post this
>> series to express the thoughts first. So a RFC is sent and any comments are
>> welcomed and appreciated.
> At a glance: tests/unit/test-x86-cpuid.c should be adapted to be generic
> (but still supporting target-specific sub-tests) and some aarch64 tests
> added.
>
> Similarly the ARM PPTT tables tested in tests/qtest/bios-tables-test.c.
>
> Otherwise, the overall series looks good and coherent, but it isn't my
> area :)
Thank you for the reminder of the related tests. :)
I will have some work to make them cover the new features introduced
by this series.

Thanks,
Yanan
>
> Regards,
>
> Phil.
>
> .
