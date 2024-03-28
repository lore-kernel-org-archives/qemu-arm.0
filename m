Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp982758ejv;
        Thu, 28 Mar 2024 01:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKsV08GeKSNvZr6oFue6ZpB3s2kKifGJCQjpmxVImR0hY8RlZjYSFhCZ0lEMU4fcuFh55ttpUTtiF/6js7HfC7QlW7DNZ2
X-Google-Smtp-Source: AGHT+IHuafN3agb2GXyS8+ghLcug0i1YUI8z6RHydUvCmizppmscsVN39L4k9PEeTlW+p5ZE+mfv
X-Received: by 2002:a05:620a:8392:b0:78b:becf:1118 with SMTP id pb18-20020a05620a839200b0078bbecf1118mr731211qkn.64.1711616241400;
        Thu, 28 Mar 2024 01:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711616241; cv=none;
        d=google.com; s=arc-20160816;
        b=RKPqPuvzwnPz2fhCZPpLyMA8mPMx0kYa7tcqTwY6X8g9fEHrkNr2jRP36eqcp4iV+H
         uCuP2u4zF80DTp5CGABOzby6s6326CkRfkI/BRoQt9wUf0S65LJurUDj5YD+t+XvKcjS
         DYzqgG7NQ5BzlJvuAQrprvBODB2BzsZhE2rQDaJ52g7K/OS/XcGA0c/bSvmCy15/gWI9
         yS2mIm0Qnd684QbnWcBdov6q6cGbZRYK6fKJfHcx9g3UwPIBCFuzYI5bgUHV2ppZz0Xi
         I1I1bERT5LNsjzpiFE8z6HF83MskeDEvkn4OqR4Mi87uObeRAbyMqgq2ZYKvZrrb7+qU
         R4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=UcWpSxxzVLlSMJxbMAEzPdhZpZa/l6cA8E3MsnjqqPE=;
        fh=/MSHAyhUJiTYoT4ekOyS/HopHNLqBW111kC/699+MBU=;
        b=SKeDHmOaZU7dwGnCBhRNGt7nFdnNNUgWK1uaqzft0WB+3OEfxFCw4fQl3uWxyt5kPH
         YPu6Tkt4gJGloWDlbYtjRxwztNMNSEIFPQS/SPqdvonBGQj/EuwthuTJq6N4JTB6E4FO
         /0v8oFPJGgoZ56NvybSnaEaUVUAjrF5GWU2d4Bw+Vlk/GBnoJCSJzvgrSN1b8Ststq7P
         s7VPAsRZYLBRVlk6aphA+UaCSbbtwkH++2aZJFn32pVo0XaX0KVgt4A1Oe5XHP7ACiVA
         SUMtJVVLaE6sG9B82BcAuFSyT8NqRCM0E8Iw9gxmdVyJ2jpE162D8Gc5T3Qx6yA0GLaE
         HRYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az13-20020a05620a170d00b0078850338897si1059317qkb.195.2024.03.28.01.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 01:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rplZT-0002Er-ID; Thu, 28 Mar 2024 04:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rplZS-0002Ee-Qt; Thu, 28 Mar 2024 04:57:14 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rplZO-0000fY-RG; Thu, 28 Mar 2024 04:57:13 -0400
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V4y666BKLzNmf6;
 Thu, 28 Mar 2024 16:54:54 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id BC35E1404DB;
 Thu, 28 Mar 2024 16:56:56 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 16:56:56 +0800
Message-ID: <1a10de26-97aa-260a-7c5b-dfb9a4949790@huawei.com>
Date: Thu, 28 Mar 2024 16:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v8 09/23] target/arm: Handle PSTATE.ALLINT on taking
 an exception
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, 
 <wangyanan55@huawei.com>, <richard.henderson@linaro.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-10-ruanjinjie@huawei.com>
 <CAFEAcA8_2U6bydhixx+j84FUBY3tT5rN8Y4c6KHGjbbAX+1v3Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8_2U6bydhixx+j84FUBY3tT5rN8Y4c6KHGjbbAX+1v3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=ruanjinjie@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.32,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i7Rre+xqaDvZ



On 2024/3/20 0:47, Peter Maydell wrote:
> On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>>
>> Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
>> SCTLR_ELx.SPINTMASK bit.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v3:
>> - Add Reviewed-by.
>> ---
>>  target/arm/helper.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 4bc63bf7ca..81f4a8f194 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -11705,6 +11705,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>          }
>>      }
>>
>> +    if (cpu_isar_feature(aa64_nmi, cpu) &&
>> +        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
> 
> This shouldn't be checking the value of SCTLR_NMI here:
> the new PSTATE.ALLINT is set to !SPINTMASK even if NMI == 0.
> (The SPINTMASK bit description is a bit confusing, but
> the correct behaviour is clear in the AArch64.TakeException()
> pseudocode.)

It seems unreasonable to remove the SCTLR_NMI check, because if the
hardware supports FEAT_NMI but the kernel do not enable it, the ALLINT
bit in pstate will also set or clear when an exception is caught, which
seems unreasonable.

> 
>> +        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
>> +            new_mode |= PSTATE_ALLINT;
>> +        } else {
>> +            new_mode &= ~PSTATE_ALLINT;
>> +        }
>> +    }
>> +
>>      pstate_write(env, PSTATE_DAIF | new_mode);
>>      env->aarch64 = true;
>>      aarch64_restore_sp(env, new_el);
>> --
>> 2.34.1
>>
> 
> thanks
> -- PMM
