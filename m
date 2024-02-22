Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp187915eja;
        Thu, 22 Feb 2024 03:52:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUO1aPiDqJ9Gwg59agZp7y4AyMe8Xlms+lANH12Tep5B0b+jxIYykUtbaG2LtswbYU2PYR1a6yCm4T38dFtrdpN6QHqKo8b
X-Google-Smtp-Source: AGHT+IEjVCvths6lQOnRiEBiLqKv91jOUujG1L3Rdl1Zw1+oAvVA6m1wI1ITNX/JUTc4BeGtIMuc
X-Received: by 2002:ac8:5f4c:0:b0:42c:7c1c:b112 with SMTP id y12-20020ac85f4c000000b0042c7c1cb112mr27665857qta.67.1708602759263;
        Thu, 22 Feb 2024 03:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708602759; cv=none;
        d=google.com; s=arc-20160816;
        b=JE2YmcVGcCe2s2/Rht7rqBTfAEg85HhEeLELNUbpEO/r2m4YFO4hUDI39cbxfD6+h7
         fihyUV3RHXQPjZnx55Mc+TFfUIAA10S3iJJs1rr1r/FqX5/TecBDPbNCQbCpZwM6qOLB
         qoXBBLZ+4ypSnB8POhID2IndSOJt/6qeos9GGzduIuhaGsrAyJcE31hzyRksp1LrrkaM
         7JzRirUNzTwHbeMAGUbn+AIoggVfu/FGF1+ihYI28hR6CSshIg2+hntNXxhNEv4ho8EG
         1wkfEFfxAuvWhXMpk6XREv0ahVc9lCho5A4bhrL/yTdlaOmkfx97MxnDvbe5byn+LT/v
         QoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=PRACUuT1l4i3go7l79ZrSvBgutHcjPdbCr3tEYaYrwo=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=esHNkymNoQna4p9fd4YtLrbGfNjOMcUn5x45tddz8iLYyz4pBjxbl1kR6mF0+Y68Pb
         Ri97x/VSCXofrQMWpTLviSiLJ5CBlZCbQUIX2+yhEVgQpPsdLeUIELRVaL9Wvo2k1pUT
         FQc9UN1MN9hA+rDnEpT8cRI7B/8YVZT/8vFHOuXYuUXhcuzOzuMlo21HE05Q6iFOJ73d
         uRgaz/qGYKlzEnvTvs3Oar4RUWZkmK3X9kSw8/nE98QPnLf7gzbAF54zlwQggNEscyDm
         UgUW/XzNko7Ml1/h0aHfcwPl+/56Xi53XUHxS2NiQxj+LnwwQb+Iil7UStl6UzQ1O44i
         LRPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020ac87605000000b0042e2263b151si6298160qtq.699.2024.02.22.03.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 03:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd7cp-0008SK-3K; Thu, 22 Feb 2024 06:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd7co-0008S6-81; Thu, 22 Feb 2024 06:52:26 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rd7cl-0000Su-GX; Thu, 22 Feb 2024 06:52:25 -0500
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TgWfM0YL2z1gygD;
 Thu, 22 Feb 2024 19:50:03 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id A60CC1404DB;
 Thu, 22 Feb 2024 19:52:12 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 19:52:12 +0800
Message-ID: <fc4c1ca9-09bf-89c7-a2bc-521f7972766c@huawei.com>
Date: Thu, 22 Feb 2024 19:52:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v2 07/22] target/arm: Add support for NMI event state
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-8-ruanjinjie@huawei.com>
 <c02228ea-4f24-46f9-b6b3-34cba3059d69@linaro.org>
 <a4c733be-450b-4d28-b869-fd80630f3ecb@linaro.org>
In-Reply-To: <a4c733be-450b-4d28-b869-fd80630f3ecb@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FeHByNDST+aE



On 2024/2/22 5:25, Richard Henderson wrote:
> On 2/21/24 10:10, Richard Henderson wrote:
>> On 2/21/24 03:08, Jinjie Ruan via wrote:
>>> The NMI exception state include whether the interrupt with super
>>> priority
>>> is IRQ or FIQ, so add a nmi_is_irq flag in CPUARMState to distinguish
>>> it.
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>   target/arm/cpu.h    | 2 ++
>>>   target/arm/helper.c | 9 +++++++++
>>>   2 files changed, 11 insertions(+)
>>>
>>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>>> index 5257343bcb..051e589e19 100644
>>> --- a/target/arm/cpu.h
>>> +++ b/target/arm/cpu.h
>>> @@ -603,6 +603,8 @@ typedef struct CPUArchState {
>>>       /* State of our input IRQ/FIQ/VIRQ/VFIQ lines */
>>>       uint32_t irq_line_state;
>>> +    bool nmi_is_irq;
>>
>> Why would you need to add this to CPUARMState?
>> This has the appearance of requiring only a local variable.
>> But it is hard to tell since you do not set it within this patch at all.
> 
> According to Arm GIC section 4.6.3 Interrupt superpriority, NMI is
> always IRQ, never FIQ, so this is never required.

There is a bit of ambiguity here. The processor manual says that both
irq and fiq can have superpriority attributes, but the gic manual only
says that the IRQ has superpriority attributes.

> 
> 
> r~
> 
