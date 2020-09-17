Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp581325lfq;
        Thu, 17 Sep 2020 06:27:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnWbSuda5hWuBjFX2tTD4tJeX/AGTgp8FlTBeT1uBB96Ck60Jawi9ePvihu4/XyYOfUOXt
X-Received: by 2002:a25:b9c3:: with SMTP id y3mr2401579ybj.440.1600349249221;
        Thu, 17 Sep 2020 06:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600349249; cv=none;
        d=google.com; s=arc-20160816;
        b=P3cl+715VQvEvFVtUNbLzodacCJLGi9ij6VUmB2KxFjPxRUVUcsUaIRG+qjPiVKwo/
         1g6ZhQxxnOjR1eTpm1wVdnZzGmPQu9uAqUkmuBG8EkYptEb4jZP36Z+CF/+5UKlFYf0C
         yPtGSRRnZwncacIFN/iHdH8xWZXa8omsCnL/+SIQ9od4M5yqDKFIAV5Ks2SjRQSxkyjc
         +iKNeUE3XelUvjdVArDt4jnx5k5GIxz3A2HCkbiqVQb5fBMdra13ME2qKGkUp1rj/bPt
         NQBCqQvXURG36sABr0wWdUr28S0cywDSyLGS8qmIUav3v+iezgTa/HSdTeTvBN8lKHN2
         Dd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=fAsxb4Jp4OcRNGFAxn7eNI2gjWh16t3QTu5OEWRQSkI=;
        b=fa5cQDaY39ygUrm0ScF3IR6vqc/ZjakRi6pkxVBY6jnUYycSAaLh3ygp+Kyg2AR7Wr
         FoX2beIcXClKe6nqpKtBwUXwNafqBhAZj+6eXAZspvIsVuopOPEkpP4ChewuHmY1nZPC
         ni/DgJY4F65mGOdA9qAga8l19FJu4Squ9Y058eLxutPeQmOmpSP58GDLljiRTmCSBH8q
         fMgCtCofn2luV1euEhOpEIShaU4v5iCJ8PTqJ1Xavb+li33apd/PsRcfA7wiel8Jm6uF
         WtLEASXBJMkqMiITX+LOBpiFS8sw+Sse6+1kw9TjJuagDEh+20HmCNt4Poj1PksGS/qi
         P9rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m65si1185826ybf.268.2020.09.17.06.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 06:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kItwe-00089m-Lh
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 09:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kItwW-00088e-1E; Thu, 17 Sep 2020 09:27:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47444 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kItwT-0003x6-Rl; Thu, 17 Sep 2020 09:27:19 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 203ECA78578142DC1B22;
 Thu, 17 Sep 2020 21:27:07 +0800 (CST)
Received: from [10.174.185.104] (10.174.185.104) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 21:27:00 +0800
Subject: Re: [RFC PATCH 03/12] target/arm/kvm32: make MPIDR consistent with
 CPU Topology
To: Andrew Jones <drjones@redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-4-fangying1@huawei.com>
 <20200917080706.s4edh2vd2gzjwg6y@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <e009e583-03da-721e-04db-7efad9658267@huawei.com>
Date: Thu, 17 Sep 2020 21:26:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200917080706.s4edh2vd2gzjwg6y@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:27:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RB+t16GSF4+o



On 9/17/2020 4:07 PM, Andrew Jones wrote:
> On Thu, Sep 17, 2020 at 11:20:24AM +0800, Ying Fang wrote:
>> MPIDR helps to provide an additional PE identification in a multiprocessor
>> system. This patch adds support for setting MPIDR from userspace, so that
>> MPIDR is consistent with CPU topology configured.
>>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   target/arm/kvm32.c | 46 ++++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/target/arm/kvm32.c b/target/arm/kvm32.c
>> index 0af46b41c8..85694dc8bf 100644
>> --- a/target/arm/kvm32.c
>> +++ b/target/arm/kvm32.c
> 
> This file no longer exists in mainline. Please rebase the whole series.
Thanks, it is gone. Will rebase it.
> 
> Thanks,
> drew
> 
> .
> 
