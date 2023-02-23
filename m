Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp929682ejc;
        Thu, 23 Feb 2023 09:17:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8eVJUxTNGALN1nYpNGQSUaEmBtipspPwm5/+qGicspAsRu9mmAKFBYv7iZ5hQBC3+nzUts
X-Received: by 2002:a05:6102:441c:b0:414:254a:b72e with SMTP id df28-20020a056102441c00b00414254ab72emr13841434vsb.15.1677172633017;
        Thu, 23 Feb 2023 09:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677172633; cv=none;
        d=google.com; s=arc-20160816;
        b=duxwjczDxwm7EGPRbqT3iStcd6JFWqrStWuqHmWQ2Cj9wvkbhjPMfUVIYmTscCxjs4
         KX0exKHJrTRA5bK/1l2c4bmNhoVyYs0EDUJoF0Ka4XV0YeAiPVk1hlNwWRUt3gqUAa5N
         lw6xwNc99ooeV8aaorKZlKHVjg8dMkdMnXT8S8Rk8cdBR690KTseMZOiuILvjUHpoI2Z
         fA2LjZv7HtdVR9H+6Ao8nBD0c2FuJsrxYJL/av7v/9hp7YEhwU48RviqQmRf9wTMTclU
         WLlLabvbax2l9Q0AFPOEjXq6fDehySbCLBPjLiaxqEPJp4UNUXBaK/Scf3x8onOF1Ljt
         DybQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9jWepWClN2pB5vLhmk0LUozfTP5zr1HxOc4XPDzxlnM=;
        b=iwh/nC9q2jOCfZNlQGx9JtwYq8w6Cm/OcJw790d45UBxzCtGMIg/cWKXyeTbcinvIi
         yWO+wVBF6+JqAm3Udj0PYP57Szso5I6aM/LDaMu2vnfpF6OAIAiuY6sru66Dy5+a5lPA
         /bCNcZYyGQ3FoySP0a6fsQ+Aaewdvy7WzT5IT8bsxkDLnPYBxcXTOqs8W26p7LHsXB11
         6jBsRDyZ53D+vb0e+loL12kL5gMl/2+uuKGe1inZ6cP1uHoznsw7rBgFvKYV201kxc9L
         45+VO8I2880aYsvOzxo7R+BX7SzoC10mRbpPBcYcYClGTscruHrmBxAVXPLRaabR4hhz
         cR/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zqL4U9q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25-20020ab06499000000b006889e84776asi4249428uam.24.2023.02.23.09.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 09:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zqL4U9q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVFDB-0002cp-He; Thu, 23 Feb 2023 12:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFD4-0002bx-0M
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:16:46 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVFD2-0005Se-1x
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:16:45 -0500
Received: by mail-pl1-x642.google.com with SMTP id u14so9874918ple.7
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 09:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jWepWClN2pB5vLhmk0LUozfTP5zr1HxOc4XPDzxlnM=;
 b=zqL4U9q2wzx41MLDXGcFUXl3UVQYNhxF7urYIvW1Ix7vSPkCILVPdImz8IEfKyHCHB
 OMbGWJa+TuK6M2oG+Af3vhiMv8Egi2nHn69ESQ5MJYxgFAodlP9cqRrhqbY4QFBZX644
 CYxuRtoJZYzNqkYpJt6AtEAbF3q9wJtBwR0WMGGNhVfwFjqKdZrPHQf4DojXyWS/VGVn
 yPXOgl/iMlUlJRwVMCjcnZIszYanXI4K5wQsQ/RSnJlyjJje8SxvvOJzBBAv1a0IiEFy
 XUiNVYiwmSPkT7jiP7pjKFaSSaDsF6nAM8A8KBRUl6fOA911CflPBebukiSmlYC3u0SK
 mJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jWepWClN2pB5vLhmk0LUozfTP5zr1HxOc4XPDzxlnM=;
 b=0Bxkmvr1H+PXvc2bIPxjCALwdfstKauLNFhj0aFewrTl0fNcAnJHzgEUI+ND7Fv5MU
 PN85gaRu1VZYo9LZ3lypxt6npBLI9Q6iQ65LpR1OyZYoMZbDprGiAHR21u1/uLka5qQV
 eeDvKzwiz76bfvIn4PLKdhIeWmSkaw07zJc8r/IHjzjNrg+Iy5kHmdF/k7rL05r7hLrT
 JNh0vpzbgTUrCAvqlvQj9H5GoUw6VkzTKv3mjiH6pluJsjno/T9ypbxFavNS39s03o3E
 AjF+WWYdbiLORHzkoD/mtShOGHcw5BsUyb7+Eduh3xTNdDv6vU9r2oq5xQI0AYP0rRXn
 V9hw==
X-Gm-Message-State: AO0yUKVEqe60tGyaz7YqTCfypa7uduADuvVpmsv7ltNTHbwFAQg5NL72
 UMWDpCyxvu0OcmUJXGfUMiA9ng==
X-Received: by 2002:a17:902:c94c:b0:198:94cb:82a5 with SMTP id
 i12-20020a170902c94c00b0019894cb82a5mr18471917pla.4.1677172602359; 
 Thu, 23 Feb 2023 09:16:42 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170902c18400b00198f9fa23a3sm9140298pld.287.2023.02.23.09.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 09:16:41 -0800 (PST)
Message-ID: <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
Date: Thu, 23 Feb 2023 07:16:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
 <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4weACDG6oF1B

On 2/23/23 06:49, Peter Maydell wrote:
> On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> FEAT_LSE2 only requires that atomic operations not cross a
>> 16-byte boundary.  Ordered operations may be completely
>> unaligned if SCTLR.nAA is set.
>>
>> Because this alignment check is so special, do it by hand.
>> Make sure not to keep TCG temps live across the branch.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +static void check_lse2_align(DisasContext *s, int rn, int imm,
>> +                             bool is_write, MemOp mop)
>> +{
>> +    TCGv_i32 tmp;
>> +    TCGv_i64 addr;
>> +    TCGLabel *over_label;
>> +    MMUAccessType type;
>> +    int mmu_idx;
>> +
>> +    tmp = tcg_temp_new_i32();
>> +    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
>> +    tcg_gen_addi_i32(tmp, tmp, imm & 15);
>> +    tcg_gen_andi_i32(tmp, tmp, 15);
>> +    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
>> +
>> +    over_label = gen_new_label();
>> +    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);
> 
> This brcond ends the basic block and destroys the content
> of TCG temporaries, which is bad because some of the
> callsites have set some of those up before calling this
> function (eg gen_compare_and_swap() has called cpu_reg()
> which might have created and initialized a temporary
> for xZR).

xzr uses tcg_constant_i64(), which has no lifetime issues.

> 
> Using a brcond anywhere other than directly in a top level
> function where you can see it and work around this awkward
> property seems rather fragile.
> 
> (Ideally there would be a variant of brcond that didn't
> trash temporaries, because almost all the time that is
> an annoying hazard rather than a useful property.)

I've cc'd you on a patch set that fixes all the temporary lifetime stuff.

v1: https://patchew.org/QEMU/20230130205935.1157347-1-richard.henderson@linaro.org/
v2: https://patchew.org/QEMU/20230222232715.15034-1-richard.henderson@linaro.org/


r~
