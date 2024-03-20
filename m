Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1692684ejb;
        Tue, 19 Mar 2024 20:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmSZFUhXt/W/c6vwOgnooq3rrdbHCeJU9xET3hnYpBUMXLsE5CwtkaHAito0OBpTJF953Pb51Cclzp7MoxCyIGKbIxqWnv
X-Google-Smtp-Source: AGHT+IHjGP/QcM5wfe9hrUYij2AY2cbD0HLx/yNr8o/XfbnjA7DK0DCqeQGcPdaoocQ7lAk39Nwr
X-Received: by 2002:ac8:7d51:0:b0:430:eeaa:5cfc with SMTP id h17-20020ac87d51000000b00430eeaa5cfcmr3242924qtb.44.1710904898791;
        Tue, 19 Mar 2024 20:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710904898; cv=none;
        d=google.com; s=arc-20160816;
        b=HOQSB84RZlzmaAgiPw2CORqKX11F94plyYpwqU/GG83rgRbCNKGGqc6H4A2Yfan0WG
         PDYNAhnjrmM9FsW6dppF78eDJWoqcl4Lhi54HTQfPUqgF3obdRCcDLGaktQ9aL9wXEUN
         FKOtSxCfCLS7IZdkLYK+cbTxf0j0i/h0KKPol+22fQeJQPXZZN4biORj+G3rX7r4hBj7
         73NzTylu2cYBiE1viY7EGsc9brZLRGWdU7a1zyQdnGllQutSxajxsTyKb8RBbGT+cT4X
         PelDz31jdzJLlW9S8jn0V8Yz7xDa8tdfc6x4XLyw8rui2PHHPb8UHzDbHkfZoQoiYiew
         zb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=HfePhma0MElPSa079fy6VOH6nMsj3WD/Ihj20Nr1Pwg=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=zYnLXZbqMJL/U7F0gvCyO8DMTm8WB9tyG24s2Aeop36+oEw/KRUGv3fQ5+tlTCq1JG
         4LuvODllCnnSn8wfla+KaSirxcQVahX0ge89I3BsWD/OQCjcC7Swoiw6f0KU38fW3U46
         y/FfY86Lp0kUnoVX70XOys3gQQQqjyB6i5E3kyNTICDs1FD4xcy6SIRfr2rL4fFBEPGw
         vAg7a5oNau94i0hXNpDTRTQ3jf720lPrfzgazhr+a6e1+j2Td27qYiL2yKUcRerYKnck
         D90NUoP141SHrgXPDwpemsFNVVlHInvnjLs7EPWtpzYZi34M/80sX9a+Max+uYlQwiBB
         AWLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020ac85a07000000b00430b0d12efbsi10519148qta.6.2024.03.19.20.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 20:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmmWC-0006M1-6m; Tue, 19 Mar 2024 23:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rmmWA-0006Lb-AK; Tue, 19 Mar 2024 23:21:30 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rmmW7-0007N0-3K; Tue, 19 Mar 2024 23:21:30 -0400
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tzv2107Bfz1R7WW;
 Wed, 20 Mar 2024 11:18:49 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 7CA6C1A016F;
 Wed, 20 Mar 2024 11:21:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 11:21:21 +0800
Message-ID: <62b8b76c-8aa0-762c-e1c5-7ca20822249f@huawei.com>
Date: Wed, 20 Mar 2024 11:21:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v8 05/23] target/arm: Support MSR access to ALLINT
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-6-ruanjinjie@huawei.com>
 <CAFEAcA9LnJJDsC8WZzd2ZYGgwqYkbH-FmxKHy0CXKcS2tEonJA@mail.gmail.com>
In-Reply-To: <CAFEAcA9LnJJDsC8WZzd2ZYGgwqYkbH-FmxKHy0CXKcS2tEonJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.417,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: cyolvXT43OVL



On 2024/3/20 1:30, Peter Maydell wrote:
> On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> Support ALLINT msr access as follow:
>>         mrs <xt>, ALLINT        // read allint
>>         msr ALLINT, <xt>        // write allint with imm
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v5:
>> - Add Reviewed-by.
>> v4:
>> - Remove arm_is_el2_enabled() check in allint_check().
>> - Change to env->pstate instead of env->allint.
>> v3:
>> - Remove EL0 check in aa64_allint_access() which alreay checks in .access
>>   PL1_RW.
>> - Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
>> - Make ALLINT msr access function controlled by aa64_nmi.
>> ---
>>  target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index b19a0178ce..aa0151c775 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -4752,6 +4752,36 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>      env->daif = value & PSTATE_DAIF;
>>  }
>>
>> +static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
>> +                              uint64_t value)
>> +{
>> +    env->pstate = (env->pstate & ~PSTATE_ALLINT) | (value & PSTATE_ALLINT);
>> +}
>> +
>> +static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
>> +{
>> +    return env->pstate & PSTATE_ALLINT;
>> +}
>> +
>> +static CPAccessResult aa64_allint_access(CPUARMState *env,
>> +                                         const ARMCPRegInfo *ri, bool isread)
>> +{
>> +    if (arm_current_el(env) == 1 && (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
>> +        return CP_ACCESS_TRAP_EL2;
>> +    }
>> +    return CP_ACCESS_OK;
> 
> Forgot to note in my earlier email: HCRX_EL2.TALLINT traps
> only writes to ALLINT, not reads, so the condition
> here needs to also look at 'isread'.

Thank you! I'll fix it.

> 
>> +}
> 
> thanks
> -- PMM
