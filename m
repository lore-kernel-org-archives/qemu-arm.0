Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2254607ejf;
        Mon, 26 Feb 2024 11:17:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU469GCqSLGdSULPvh/hlBMjAKfkfvIIQhC7aq/DkanW//+/mUxqLlg43pfrsqEYXwnMnJmvgOjeETIPhKrivAZ4T4B5ZS7
X-Google-Smtp-Source: AGHT+IGehx8pZNRSAoC4Yh5zqq5SzmQpkdEU2cH8AtBjlQ323QDnqsdcyoBbUV2NqeFaOiD2gbhe
X-Received: by 2002:ad4:5e89:0:b0:690:79e:6a7e with SMTP id jl9-20020ad45e89000000b00690079e6a7emr100796qvb.28.1708975070283;
        Mon, 26 Feb 2024 11:17:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708975070; cv=none;
        d=google.com; s=arc-20160816;
        b=rcLTFoWuuonVVwYM2N+NZiut4V+YXLwOo+mPsZCQAyWTWqeopS3s6ifhRM5mNhhbvX
         meXu6ymqmo4zbSHhVCPoYfAEURFe36+aNxPo/w1trheDYan/QR9vGWpOc07a74CbpTkx
         5z2NHCCtfgTMfTUi4eCmApIIQGpon9UizC9IC70w8EblTvQ6azPnbzjxshjDeKQPBAHk
         2meI3/LKZRvPTlDQlCDjuf8j4GKhdn8prToqoS/EtQApD2rAAikDZ7tQw5744dkmbQLh
         KWS8cM1oOM++P4fnpqCngqLkB/h1RjP/X9hNSzLMURMplNa13FqLP81bVH+UbTyGglkg
         ydmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=rQXxalWk9PMKM+/XNnXpOpeMZf7T4Zf1m38nWD9CjMw=;
        fh=ipukswFHz+huq1up+dCya3JqlvVOF7K0ZTx+2TY65MY=;
        b=cYw/Fo4E2YOwjCpkMuk3ar+45wu8dHBEt0KrDm7PmSD0wLu7iF9B5m5nUGIoDctvF2
         0mQRA+JAso84/0yAxrdKWMX3rgNt66hr5nTqWA7xYXbMB0ZgFTqKYab0lK50ptdilDdq
         jctNJZZaWyWwwrbY9p+cC1gUDbIbM293LVpgI67XbfnePG3ggYRvEarj+C+Tl4O+xBmo
         X+qA95DIdgWY/mljQ0bYn5XO2vIIsEw1JQmBcbJO7kAzivxIw4PnkxeK/zc31Opms4dA
         j6XynXdZ1Cx1PAucdkF0WWfdTAtCod2QXuiGRjXJkLYnDPD63dAGWTSHcB0OccZi2jM0
         Ybgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tlC0ENlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq1-20020a056214258100b0068fcd9c3506si5757903qvb.151.2024.02.26.11.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 11:17:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tlC0ENlR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1regT7-0008J8-1w; Mon, 26 Feb 2024 14:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1regT6-0008IY-3v
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 14:16:52 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1regT4-0006kE-CE
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 14:16:51 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6e459b39e2cso1985295b3a.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708975008; x=1709579808; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rQXxalWk9PMKM+/XNnXpOpeMZf7T4Zf1m38nWD9CjMw=;
 b=tlC0ENlRJvIb6o6kXJVfDQBT7PP2Zfp9x+mUPq9uXBBjOj3255QkrtZvKcKrCQ9FOH
 cVxb7C6sFuTxrtlrxzdYixsGINZ5as1jaLsqwxNZq5CnEVKBrPNNNOjidnLTIRK7tuRV
 /Y0S3rpuSO/Vcgs8DQX2R2/sr3GV0VQPTa/VyGusAKAJWLQJ3el/kMwx/lviwje/8EPo
 H5jAZPY2fmV+xp3F7NnHgNFJ02F1mlzfd4uqfQgzGHlKei5X/fbF913kaVu7ogYQKi7W
 YnFiz7c7QQPsNNsHMUAIvIaAZEn5JMREAPsvjXR6RDdnvZwYRtWbDatqYjhbmXLLAIpq
 xlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708975008; x=1709579808;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQXxalWk9PMKM+/XNnXpOpeMZf7T4Zf1m38nWD9CjMw=;
 b=Oo4OoiDZCZGxpLqvxFDaCVg2g9CwPYjFPJoAvGVs/SQvsz9BueeL7XFOpRLBYjdVC7
 3lv/ZQTFMrBrswVE+xF6qPsW+SFSqJBgbDpj9XlI3tKdQ9i0vS2/FtLT8UsyfSLHnaxJ
 ixZ+PgaAuQu8wTxq80SA2oJBIDct/4k/22RyTroDZkWAY+z6ajNdBJNhcGzYpoi20yoW
 ilpQA13c5epgHBCp1rS3Rwx52r1hn9+n4kSbD6WEmfLvHa5EYsegQpG+PlMPo3sBZ9+p
 pgpQnSmw0oOW1+F5N8JSWMz/HTGApKUx3RGC7/0Pdr7TGmHjNN4XnOC1UPj72n+tPy8D
 n52g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXadpF3DtP+82y67NO5wnYDLHgxly62DwMqM8LvbZF3Qf6haREqA39q5mnNZzrCWymSHX3POMP9Qa/V5fyTKeden0+b
X-Gm-Message-State: AOJu0YxsLyQH9Bd4oizP48vtKxq+S0gvkPTjiZqFdGld0PuQaWB03DNH
 Tz5ekTCC5hiFJVsWxTP1M7BQcmnPKfpeyfHkacDB4oRAtdADL01yJoDnbEZFYGE=
X-Received: by 2002:a05:6a21:1798:b0:1a1:5:e883 with SMTP id
 nx24-20020a056a21179800b001a10005e883mr78445pzb.22.1708975007763; 
 Mon, 26 Feb 2024 11:16:47 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 r7-20020aa78b87000000b006e48b04d8c0sm4416024pfd.64.2024.02.26.11.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 11:16:47 -0800 (PST)
Message-ID: <4aba8c00-90c0-4b01-b6bb-fadda72acfef@linaro.org>
Date: Mon, 26 Feb 2024 09:16:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 04/21] target/arm: Implement ALLINT MSR (immediate)
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240223103221.1142518-1-ruanjinjie@huawei.com>
 <20240223103221.1142518-5-ruanjinjie@huawei.com>
 <9b20584a-3c4c-47a2-bf42-f8d7d4eabd9f@linaro.org>
 <138ddc99-f6f4-9907-a1c2-6b2b88bd79d0@huawei.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <138ddc99-f6f4-9907-a1c2-6b2b88bd79d0@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yFBlUIWbIaj6

On 2/25/24 16:22, Jinjie Ruan wrote:
> 
> 
> On 2024/2/24 3:03, Richard Henderson wrote:
>> On 2/23/24 00:32, Jinjie Ruan via wrote:
>>> Add ALLINT MSR (immediate) to decodetree. And the EL0 check is necessary
>>> to ALLINT. Avoid the unconditional write to pc and use raise_exception_ra
>>> to unwind.
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>> v3:
>>> - Remove EL0 check in allint_check().
>>> - Add TALLINT check for EL1 in allint_check().
>>> - Remove unnecessarily arm_rebuild_hflags() in msr_i_allint helper.
>>> ---
>>>    target/arm/tcg/a64.decode      |  1 +
>>>    target/arm/tcg/helper-a64.c    | 24 ++++++++++++++++++++++++
>>>    target/arm/tcg/helper-a64.h    |  1 +
>>>    target/arm/tcg/translate-a64.c | 10 ++++++++++
>>>    4 files changed, 36 insertions(+)
>>>
>>> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
>>> index 8a20dce3c8..3588080024 100644
>>> --- a/target/arm/tcg/a64.decode
>>> +++ b/target/arm/tcg/a64.decode
>>> @@ -207,6 +207,7 @@ MSR_i_DIT       1101 0101 0000 0 011 0100 .... 010
>>> 11111 @msr_i
>>>    MSR_i_TCO       1101 0101 0000 0 011 0100 .... 100 11111 @msr_i
>>>    MSR_i_DAIFSET   1101 0101 0000 0 011 0100 .... 110 11111 @msr_i
>>>    MSR_i_DAIFCLEAR 1101 0101 0000 0 011 0100 .... 111 11111 @msr_i
>>> +MSR_i_ALLINT    1101 0101 0000 0 001 0100 .... 000 11111 @msr_i
>>
>> Decode is incorrect either here, or in trans_MSR_i_ALLINT, because CRm
>> != '000x' is UNDEFINED.
>>
>> MSR_i_ALLINT    1101 0101 0000 0 001 0100 000 imm:1 000 11111
>>
>> is perhaps the clearest implementation.
>>
>>> +static void allint_check(CPUARMState *env, uint32_t op,
>>> +                       uint32_t imm, uintptr_t ra)
>>> +{
>>> +    /* ALLINT update to PSTATE. */
>>> +    if (arm_current_el(env) == 1 && arm_is_el2_enabled(env) &&
>>> +        (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
>>> +        raise_exception_ra(env, EXCP_UDEF,
>>> +                           syn_aa64_sysregtrap(0, extract32(op, 0, 3),
>>> +                                               extract32(op, 3, 3), 4,
>>> +                                               imm, 0x1f, 0),
>>> +                           exception_target_el(env), ra);
>>> +    }
>>> +}
>>> +
>>> +void HELPER(msr_i_allint)(CPUARMState *env, uint32_t imm)
>>> +{
>>> +    allint_check(env, 0x8, imm, GETPC());
>>
>> As previously noted, the check for MSR_i only applies to imm==1, not 0.
> 
> Sorry! The hardware manual I looked at didn't say this.

In DDI0487J.a, C6.2.229 MSR (immediate), it is present in the pseudocode

   when PSTATEField_ALLINT
     if (PSTATE.EL == EL1 && IsHCRXEL2Enabled()
         && HCRX_EL2.TALLINT == '1' && CRm<0> == '1') then
       AArch64.SystemAccessTrap(EL2, 0x18);
     PSTATE.ALLINT = CRm<0>;

In D19.2.49 HCRX_EL2, it is present as text for the description of TALLINT.


r~
