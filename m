Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3046534lft;
        Mon, 4 Jul 2022 01:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzIo4bZyLl8wgW1gPI/tzE/7ArKyLBp4PXdtcOZLpIauMAVnsR9wulSe8rdAdO+/dyAKcn
X-Received: by 2002:a81:2f04:0:b0:31c:914d:b486 with SMTP id v4-20020a812f04000000b0031c914db486mr5884312ywv.325.1656923309195;
        Mon, 04 Jul 2022 01:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656923309; cv=none;
        d=google.com; s=arc-20160816;
        b=mS9oO8SMM8H/iXAU6Ayu7Tdkaq7Yi9TbB2G95dllQ4IpQCABHeTBUb8lRvUGT4F3Lw
         ASBhYat9ecVBoBvEPmYWlxbQoNcYX00acN9z1AauMVUsH+TBQlxu3kziSiM6geppqWHq
         g3zlkcZu9Vqjhqte/VttmjXuU/ala5DPTeUFMVZbhMnary1e97JIajZo0TR/Zcp2bD2P
         +JdzrycvH5vAY4N09twOeiC7p7ovu6rSvkNiawpTmXJv88ruQt+2a7l+tj60VJ4xJMr1
         iNdnYVgKdUd/sZf0oQvKB5tqChrasKC5xqTLdqCqyKiemK4DCJfbD01iH6dacVyIK3KU
         speA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yNKG7IpIr7TYhwY1wBtLpL+Qo3iWdUHl1AGVBxprW2o=;
        b=LafwqWnG4Wuy0doI+hPGU16RWlfcEWsed0aG1nd0vGXzhclfrzCmeA6IA1qC5Vrcnw
         0yGBgpw7YyE6NEJVvWsmN64stS8wTi2x1q/KtptRNxRZbYRLQAOShu4HDpAqhObLubWl
         yRkVzFhUjpSdApjOsjmpF3m2XvooSYOlybMOvjSHBvfGQUEJgs8a/HhEHx34LrrmbCwt
         J18Iw7gxL/XenXEHVNvm7knVEGe9DaDqDCrGIqhnZ36qVzW5xYwqjB2LBAvmrr3el7g8
         48k/mZXKZHvNPS+Pj+gevfWGflCszAfEpt8M8InJscwEUVxeSoV0j3+1eVwIGja2futK
         odtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nE68Pu/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h185-20020a2521c2000000b00668a9064f04si36977400ybh.644.2022.07.04.01.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 01:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nE68Pu/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8HRU-0006S0-JB
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 04:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8HRE-0006QS-Pf
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:28:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8HRC-0003es-Gd
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 04:28:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso369757pjk.3
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 01:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yNKG7IpIr7TYhwY1wBtLpL+Qo3iWdUHl1AGVBxprW2o=;
 b=nE68Pu/xQKg20UqVUwRX210PooQOPkDJ8E3rVW5Ng6LbZd9hvOuAjc8l8ZfyWXnE5/
 xEr6JjlSLFOacPAf6pgiNybXLZB+5LIXPwx2A8rUlRv6IZdsGnIaK5zESGIhRuvvHm5+
 hH4dgKj4VGC2tWqB1KiUN01wPvrSn0hJ9UKyKPi6oyIDOoD2vb9WPWoefTqXQuLc4a+c
 L53BE1wBRdw080nuju8jZmM8zx8azhzghZf7aS+sxKW8miBhj9fudPPcQ1HL+F8yhlTY
 uil5ars2Uf0NcZJc+MrVUyJpZZW7r03iPM9OAMckVXS0UjVrFEIPkDgCmY8r11TJeYAO
 4qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yNKG7IpIr7TYhwY1wBtLpL+Qo3iWdUHl1AGVBxprW2o=;
 b=ZoK+LuAwSnfzTyVjv8JPGaSu6oP+NAw+rp7u8FR1PrZGWS0fv4GFL4+DNpeSeduK+e
 2fDmRnMXaIFNmnua5VKSB9HrDcXHPrvgEPl48uxG+UYUQKs7uwmXQMwtpz4nRjSet0Ej
 SY87RmJHM6das3wFXhatl5PjfUC0EXFKjh0K+LS0s241W2/DndvWH3+/eGBALBs2wxgA
 EnlB3jBcBTv4wzjDYVZENrnYTFSkPEdxlag9Rxxf9OL0Qkv24mfmEq1TJo7UYJMtMoU9
 Yv6psbvNQdQndDDYn/FbJDDn4RTfsE+rV1FvvXHz+GQgohoUeAQrJ/tzAXxlM6j+/CF6
 H3Cg==
X-Gm-Message-State: AJIora+rTB4EBhomio90GY0Mqj8iWGF8T7on3SJVfihdLxaOIXoAIHE+
 8765lSedaV7lRQEyIfLN71PobQ==
X-Received: by 2002:a17:90b:1b49:b0:1ec:a756:edc with SMTP id
 nv9-20020a17090b1b4900b001eca7560edcmr33695124pjb.200.1656923285147; 
 Mon, 04 Jul 2022 01:28:05 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 70-20020a621849000000b0051bb79437f7sm20452640pfy.37.2022.07.04.01.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:28:04 -0700 (PDT)
Message-ID: <bea0892e-ab42-a61d-418e-37ea49cb5a25@linaro.org>
Date: Mon, 4 Jul 2022 13:58:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 03/45] target/arm: Trap non-streaming usage when
 Streaming SVE is active
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-4-richard.henderson@linaro.org>
 <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9MNTrD=O+v53TsejbbpJrNzfhWv-uq6tJfXnXzLKSQRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3e5eoaYfRZtF

On 7/1/22 16:36, Peter Maydell wrote:
>> +    /*
>> +     * The SME exception we are testing for is raised via
>> +     * AArch64.CheckFPAdvSIMDEnabled(), and for AArch32 this is called
>> +     * when EL1 is using A64 or EL2 using A64 and !TGE.
>> +     * See AArch32.CheckAdvSIMDOrFPEnabled().
>> +     */
>> +    if (el == 0
>> +        && FIELD_EX64(env->svcr, SVCR, SM)
>> +        && (!arm_is_el2_enabled(env)
>> +            || (arm_el_is_aa64(env, 2) && !(env->cp15.hcr_el2 & HCR_TGE)))
>> +        && arm_el_is_aa64(env, 1)
>> +        && !sme_fa64(env, el)) {
> 
> I can't get any of:
>   * the logic in the comment
>   * the logic in the C code
>   * the logic in the the pseudocode AArch32.CheckAdvSIMDOrFPEnabled()
>     which causes it to call AArch64.CheckFPEnabled()
> to line up with each other.
> 
> The comment has:
>   * (EL1 A64) OR (EL2 A64 && !TGE)
> The pseudocode has:
>   * (!TGE && EL1 A64) OR (TGE && EL2 A64 && EL1 A64)
>     [seems odd that it is checking the width of EL1 in the TGE case
>      but I haven't followed the logic through to find out why]
> The C code here has:
>   * (!TGE && EL2 A64 && EL1 A64)
> 
> What am I missing ?

I'm looking at 0487H.a... are you looking at a different version?
Because the pseudocode I see isn't what you list above:

> if PSTATE.EL == EL0 && (!EL2Enabled() || (!ELUsingAArch32(EL2) && HCR_EL2.TGE == '0')) &&

> !ELUsingAArch32(EL1) then
So

   (!EL2 || (EL2 A64 && !TGE)) && EL1 A64

which is, as far as I can see, what the C code has.

I'll adjust the comment, anyway.


r~
