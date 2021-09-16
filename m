Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1186132lfp;
        Thu, 16 Sep 2021 07:40:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy08ub/NxCW8aucFZMPFreL12YF17/pZ+RNysHgMTfyMhYSywqW5G8B5kj988J1VJDhDptU
X-Received: by 2002:a0c:b2ca:: with SMTP id d10mr5697828qvf.27.1631803234775;
        Thu, 16 Sep 2021 07:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631803234; cv=none;
        d=google.com; s=arc-20160816;
        b=I2xsSCYYHOppNpdxZPfpDpZLac0sHOPJ2D7RtvX1zc34850bb8pqdyv3phJFjMHjGN
         UeYVDUCmXPLNP3OMc/9lxr4CMUL32RNyWP/1Y08Zv/LLq8zsq7FHidMakWdrni9gmLLZ
         0Bzj4tqOxHzBOZbzAI0VHQSnluxFrMUcoDrbCunJ6XXcLl61sLtxmQM2mr3ML06js5mN
         2SxuXH+ZIv185lBrcXJba7mqxRA8QjUsSemM8ZkRIaxJ3e4xtgCwIo0WRaiABE4049Bq
         iKUa3SCEqtjDftSw38RuBLijTKvL+PIc2e0KWzKdVZ8l8Z6bB4SWwYTh/BSOoGJWnrng
         Op2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Sx9U/logEqIQ/BL5QpYBK14ktb4xLvsbqieLdM4aocU=;
        b=zzm8Co1S+AqvhnPkv4xUoYttx1ArlqKXMbaGIR3K6xv0YKI3rmv4UomBDd2id4c+vx
         xQ/0Ir+AKYBmvbdF28kYZZ/vXrApSLuA9+tR50cCHrnrZ1WheFuPJ8cVA9DCeJy1AXTg
         uvph4A5LFK4pSIWGP5q7vmKEJ8+3TU9yt07g9/FVetZm65ctWka2m0XS8Fs2wuYaSHQH
         FLoE13AOHtX/nKW43vLpKDoxT23xVUIdCHEzMlksjKEa0WsI3JEguytDS07kztIOT802
         wv05g0zevMGaG1YuhhoFx+5vvCp8vFZgLGcpO7ReP9fW4dXNGTUG/RcXPS1XG8zer8dJ
         GDnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/9Fqxmt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l125si1920911qkf.215.2021.09.16.07.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 07:40:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="b/9Fqxmt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQsZ0-00088n-64
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 10:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQsYM-00087F-5A
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:39:54 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:42744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQsYJ-0001fP-OQ
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 10:39:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id q23so4002548pfs.9
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sx9U/logEqIQ/BL5QpYBK14ktb4xLvsbqieLdM4aocU=;
 b=b/9Fqxmteboz4tK5FoJ4kiKPkEJ23H8slZuOKQyYqAtwnHuealUQzXrHaVyhKxwLnu
 bydzyGrkG7J0MzsENrekdBkAwvhRPk9Fd/B/8Fb9Ac/GrcclIVfhL2Q1kbraZLq1Z+W2
 tMl798aRtz/ajIGye7UFQp1pe6PErM2MLTPr/44r4EZAILbsji7ZYaslXqawbpoK5xKB
 Ya1MpuPlyTMo5NC1imlv0G6rLzECIcQcgwCanO8u5JIJqcGu4ebrmxSRaEYd0wG/+TQA
 4JiK0S9MNVVGzMCPYYV9/z0ICHX12KaeG9NU/wOKwUZUL+8e8WBowfjpnEuXJojauHfP
 u1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sx9U/logEqIQ/BL5QpYBK14ktb4xLvsbqieLdM4aocU=;
 b=bZASkUSnRv/yfMKnTzUZtXXt7v6NOt7GvSzlUl8trJJz6mifFC3SkovV3HuUMfHBhy
 dndnViWP37Fpfei7TspU6bMZxy3GU1OusYIbJfvrboWKtINUoTYrwm0+J4r8fgQBoggB
 mm/JZKBwx1Rt6wKAvG6a0tqcNYjQ9R9xYYTdCTNLlnlCZHCPvgt7S9A78XUZAzLlI65/
 P/LuQ6vPsLnCDNKUGYk/YGZ0FDZxDbeZLSXdIOLPc7iuwZur4+qsfcksZSHCjXQPHWY9
 M0PlIuFUiOSj3/0i61CPdLkJWQoTUdnsUimQ+vOenFqg1L8uoxi/dmk1aIr5YF+t1fDa
 7azg==
X-Gm-Message-State: AOAM532OLgQ426LgsnuUnTrVnemt7ZqiX1QXBB50Hh6V1SOKJINcpWX4
 HxZJTRORjpG/jn05abTKPs+08g==
X-Received: by 2002:a63:1748:: with SMTP id 8mr5165969pgx.350.1631803189752;
 Thu, 16 Sep 2021 07:39:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id p4sm3568093pgc.15.2021.09.16.07.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 07:39:49 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate
 forms
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
 <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
 <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b1e38e35-aba6-85e0-3551-e0ca18ecdb26@linaro.org>
Date: Thu, 16 Sep 2021 07:39:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Xtig7iw97JURq2UnhqWdJA_Fok2=yYNBRoqfoX3M=FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bgXULBMzKuKJ

On 9/16/21 3:01 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 16:53, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 7:21 AM, Peter Maydell wrote:
>>> On Mon, 13 Sept 2021 at 14:56, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>>>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
>>>>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
>>>>> +{
>>>>> +    /*
>>>>> +     * We get here with a negated shift count, and we must handle
>>>>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
>>>>> +     */
>>>>> +    shift = -shift;
>>>>
>>>> You've already performed the negation in do_2shift_vec.
>>>
>>> Here we are undoing the negation we did there, so as to get a
>>> "positive means shift right" shift count back again, which is what
>>> the instruction encoding has and what tcg_gen_gvic_shri() wants.
>>
>> Ah, I misinterpreted.
>>
>>>> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
>>>> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
>>>
>>> I'm not convinced the resemblance is close enough to be worth the
>>> effort...
>>
>> Yeah, not with the negation bit above.
> 
> Could I get a reviewed-by for this patch, then, please ?

Oops, yes.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
