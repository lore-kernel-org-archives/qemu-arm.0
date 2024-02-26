Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1802893ejf;
        Sun, 25 Feb 2024 18:22:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWhjsugrZnKiKn+iRgYN/4Xz7wpsTnhHKvrZdSQ7sZ8CkyUbZ+LsDEXoQowacR0ksPYYhPI2vIraUbJDwF7s+g4lY7Tet6K
X-Google-Smtp-Source: AGHT+IFXh+y9aXfukIrmtaretrJSfV8itJ0Z5kYnegi+l364VGj7o407t/SRTNJE1OEzdiZ5MbGE
X-Received: by 2002:a05:620a:66d:b0:787:bb0b:e9d6 with SMTP id a13-20020a05620a066d00b00787bb0be9d6mr6824154qkh.37.1708914178734;
        Sun, 25 Feb 2024 18:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708914178; cv=none;
        d=google.com; s=arc-20160816;
        b=RB55K+BEbcPSfhBisvU3O/oscQoB6av73mwUs2Oy2OaDydS76wSeCigQh7LNh7DhkI
         7l4/S+71v5W3aDzMfdUtzASGPGwbIi1g5wTrJa0WVUore/4wdE/D4k9eIKSl05qtN+yg
         kh+CSz6WRiX94ku5cScuo0hDQBLlDV3X7bmmsEWYHkoXUyg2bxEtzlINT48n+PhkE0Ga
         5110T8Ckmg7po1L/ho+7EfV3hdhoxZVHkwYyRUh3kzxrJodNqYAvYkDDoCTf5mHC6FwL
         6aL/zC/hjfmiAIY45sW3tdGl3CkeGtcRcPk07GvESsN3YiW7xqY/W72E57x0FOLuUzoM
         q/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=5seFG1eZkV69vGa7gJUgNarOt2TKMZhhb3hKNiRiZv0=;
        fh=/TX5S8kgkt7/rBZYZ+crJ/+YKPw+5BFKLYKcqwsm7JU=;
        b=tIXC+xbvWiLhYZTe0SzQ315xV6N2O8KN+BwFDFUxtizrDj4kpDWxoOs0ukfJaLgUKO
         AVAs9/u/kbwIqkRM9bF0n2AfrhYcXzYqMo5WHH14DrUet6oTqZj91xMOqeu6za8FVuui
         QJIiqXCD+e5+blx6l1ClJHIqREbrbJOZECOItQ9edCCqb4BJF3+vS75+tKFTk2R8Ie0D
         NztWrS0h00Ws7C9UZCtA12SOXL2C0h1Dxpt+TDSah9PJwT2xvRIQfktxOpQtAYf+NASc
         q2YhVNPDdXCPgHmBJO6Cujl0wTrcgHaGvHgbYSWPJRlVaBSevdNYa5mz6tmD/UpE5Zfp
         eenw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10-20020a05620a444a00b00787d5d40093si499602qkp.254.2024.02.25.18.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 18:22:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reQdo-0002hQ-RX; Sun, 25 Feb 2024 21:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1reQdl-0002h4-T7; Sun, 25 Feb 2024 21:22:50 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1reQdh-0006xr-DK; Sun, 25 Feb 2024 21:22:49 -0500
Received: from mail.maildlp.com (unknown [172.19.162.112])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Tjkq45hjGz1X3QS;
 Mon, 26 Feb 2024 10:20:16 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 149381400D3;
 Mon, 26 Feb 2024 10:22:30 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 10:22:29 +0800
Message-ID: <138ddc99-f6f4-9907-a1c2-6b2b88bd79d0@huawei.com>
Date: Mon, 26 Feb 2024 10:22:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH v3 04/21] target/arm: Implement ALLINT MSR (immediate)
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-5-ruanjinjie@huawei.com>
 <9b20584a-3c4c-47a2-bf42-f8d7d4eabd9f@linaro.org>
In-Reply-To: <9b20584a-3c4c-47a2-bf42-f8d7d4eabd9f@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ruanjinjie@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.331,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +F1N6K9biLXQ



On 2024/2/24 3:03, Richard Henderson wrote:
> On 2/23/24 00:32, Jinjie Ruan via wrote:
>> Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
>> to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
>> to unwind.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> v3:
>> - Remove EL0 check in allint_check().
>> - Add TALLINT check for EL1 in allint_check().
>> - Remove unnecessarily arm_rebuild_hflags() in msr_i_allint helper.
>> ---
>>   target/arm/tcg/a64.decode      |  1 +
>>   target/arm/tcg/helper-a64.c    | 24 ++++++++++++++++++++++++
>>   target/arm/tcg/helper-a64.h    |  1 +
>>   target/arm/tcg/translate-a64.c | 10 ++++++++++
>>   4 files changed, 36 insertions(+)
>>
>> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
>> index 8a20dce3c8..3588080024 100644
>> --- a/target/arm/tcg/a64.decode
>> +++ b/target/arm/tcg/a64.decode
>> @@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010
>> 11111 @msr_i
>>   MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
>>   MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
>>   MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
>> +MSR_i_ALLINT    1101 0101 0000 0 001 0100 .... 000 11111 @msr_i
> 
> Decode is incorrect either here, or in trans_MSR_i_ALLINT, because CRm
> != '000x' is UNDEFINED.
> 
> MSR_i_ALLINT    1101 0101 0000 0 001 0100 000 imm:1 000 11111
> 
> is perhaps the clearest implementation.
> 
>> +static void allint_check(CPUARMState *env, uint32_t op,
>> +                       uint32_t imm, uintptr_t ra)
>> +{
>> +    /* ALLINT update to PSTATE. */
>> +    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
>> +        (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
>> +        raise_exception_ra(env, EXCP_UDEF,
>> +                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
>> +                                               extract32(op, 3, 3), 4,
>> +                                               imm, 0x1f, 0),
>> +                           exception_target_el(env), ra);
>> +    }
>> +}
>> +
>> +void HELPER(msr_i_allint)(CPUARMState *env, uint32_t imm)
>> +{
>> +    allint_check(env, 0x8, imm, GETPC());
> 
> As previously noted, the check for MSR_i only applies to imm==1, not 0.

Sorry! The hardware manual I looked at didn't say this.

> 
> As previously noted, with ALLINT in env->pstate, you can implement this
> completely inline for EL[23], or EL1 with imm==0.
> 
> No point in passing in "op" and extracting, because you know exactly
> what the value should be for all MSR ALLINT.
> 
> 
> r~
