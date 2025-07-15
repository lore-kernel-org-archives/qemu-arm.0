Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61FFC83F17
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 20:45:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubmWz-0007nw-76; Tue, 15 Jul 2025 16:45:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubmUe-00068h-TS
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 16:43:16 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubmUb-0000o9-J1
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 16:43:16 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b3182c6d03bso6842933a12.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 13:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752612191; x=1753216991; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eujw3kzn1RZsCuTsoEqM9jaaV3g/C/ZbsJVr1f1jDmM=;
 b=tiIqbdrS8e/zD3jTuEeeCv7/UUa08ef/ic9vMAMlGFXleJr0cScULvoRfovYHj/4b6
 2Mwjlppoo5Lpjs4EXWMNjnxN4KF24gPwluCpBC1q90pFxMFyR7amAg8Tk4BlYpH+nnI3
 Hq8SQo7yXXjDfMVNs5/kHZBDoGv76yC0gUU4aFbRYAKF8i1BMPux2X4FZobY2SApsHxI
 zodgjY8kQ26DdNqVuFYmWaKtwTO87BHcNJJG8PAxHfTl0SvQUmLX+cX6+KKWrsCBRP9E
 hhzt+X2TUt5vJw9/UeVKx6VPOtYFhjoiDT2PbY67EahA2GFOBL5m0gzz31y6BfR/rTyE
 /krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752612191; x=1753216991;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eujw3kzn1RZsCuTsoEqM9jaaV3g/C/ZbsJVr1f1jDmM=;
 b=H4YKEO0UxisGf2RUpN8i80keEO1VfbDYduGkM/xmSoVqZSrRgW5Hweyh0K7upldZdx
 Y9W+6tBw3zPXKOaP/3SvwNIDhFCp/FEMWSvz6tK278qquSjIBP7mGEpOuXt7xzqtsI16
 VmMeEQ6U3ssJsp89DHR58/sTu8wUB1FilzkHzfFOE6AAu706gtAO2X1qOeE54EViA1gf
 uvTfINtx/6MhXfJBrl1wX80B8tlc1jaejuaHUOCbI6foOEqNQz2rRe7KJeBnk6np8rba
 KkFpyzctx7/RXW3Ragqve7RO+AJ1RhpQMnkyPsb5itncKhVqMg5Zu0/7pj2Nxk5NIFL/
 mTQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKwbK5pa65HWPRgj/1/qoldt3xDByROeoyhg7ktH2rXfere8LS72O4UfvRISh46oyubXYeP+O6+w==@nongnu.org
X-Gm-Message-State: AOJu0Ywm1D4alHxT2N70/vTY/EcybK3oxSZKLX59J0DJLC0oBeO/YzLN
 1TrC0RaK7zI1riU0J4uKGBv8iyRrLN6vHPN9Zz3L1hEG213REjoKzPKy5kAQ1E62/Ug=
X-Gm-Gg: ASbGnctNhZ5AaGUZDXC0ajaIgY8BuiU1GTzrsOdqA9dH0M9D1IT0SsZ3sALOf2JXFnw
 dprnxlYd7EZ+5gfLcmuEVl40JIL5UOiQCoWgLjFpuIzdookwNMMaTvdVPo+srGQxvSDKeK70Fpt
 hyW39R9hWdPgR3DyC9xn2uET0RHpuZ+c+AaFAg3IqB4VHTnV6rAHSB7Np4bRIXGNzRi8UOTgdp6
 piSZfaKS1PF7oZcihOtmuOijV9t4Mdha25szHC/KmNc37h2cBgpoglohFC2IKjnNUAA1eEcgYcG
 kcYZL5MFElyWX5TklN2xuwccsvz/RfxqzQfx3irjAumr7WWrZvT85RKCYdyQTFUtpNT2uo/gK+x
 xRj7+rnlYmGsVBmnS65y3UZMFp7Zpo2UcNdAJK6yW4AJV4w==
X-Google-Smtp-Source: AGHT+IHJjk/Uy7fMkhW4N+savMBYIGLLh1s8IgorV8vA5oM5RCbKcw4K8x2LhX7vxNmURV74VQ/41g==
X-Received: by 2002:a17:90a:c888:b0:311:c1ec:7d05 with SMTP id
 98e67ed59e1d1-31c9e7a3e8emr779268a91.35.1752612191044; 
 Tue, 15 Jul 2025 13:43:11 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c9f1b8fabsm35636a91.1.2025.07.15.13.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 13:43:10 -0700 (PDT)
Message-ID: <cb9aa716-3d6b-4b79-814d-735c0235df8c@linaro.org>
Date: Tue, 15 Jul 2025 13:43:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Provide always-false kvm_arm_*_supported()
 stubs for usermode
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250714135152.1896214-1-peter.maydell@linaro.org>
 <0b438773-01b9-42e1-8edf-2330e50387f8@linaro.org>
 <95b00393-bdd2-4db3-ac39-02a09f83b4d7@linaro.org>
 <6f0cd2fd-2152-4c28-8dd1-ca7271e686f4@linaro.org>
 <261c8c14-7df2-4ff6-8952-216555e0a557@linaro.org>
In-Reply-To: <261c8c14-7df2-4ff6-8952-216555e0a557@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/14/25 10:38 AM, Pierrick Bouvier wrote:
> On 7/14/25 8:52 AM, Richard Henderson wrote:
>> On 7/14/25 09:41, Pierrick Bouvier wrote:
>>> Indeed, clang does not fold the condition "value && kvm_enabled() && !
>>> kvm_arm_sve_supported()". Looks like a missing case.
>>> This code compiles with gcc -O0, but not clang -O0.
>>>
>>> extern int f(void);
>>> int main(int argc) {
>>>        if (argc && 0)
>>>            f();
>>> }
>>>
>>> As folding is not guaranteed by C standard, I'm not sure it's really possible to file a
>>> bug. However, since we rely on this behaviour in other parts, maybe it would be better to
>>> rewrite the condition on our side.
>>
>> It's probably worth filing a missed-optimization type bug, if that's available in clang's
>> reporting system.
>>
> 
> Sure, I'll post a bug report on clang repository.
> 
>> With my compiler hat on, I suspect that GCC generates IR like
>>
>>      if (argc) {
>>        if (0) {
>>          f();
>>        }
>>      }
>>
>> in order to get the short-circuting part of && correct, which Just So Happens to fold away
>> exactly as we wish.
>>
>> I'm not sure how clang expands the expression such that (x && 0) doesn't fold away, but (0
>> && x) does, as evidenced by
>>
> 
> For gcc, the simple GIMPLE tree is identical for both.
> 
> int main (int argc)
> {
>     int D.2775;
> 
>     {
>       if (0 != 0) goto <D.2773>; else goto <D.2774>;
>       <D.2773>:
>       f ();
>       <D.2774>:
>     }
>     D.2775 = 0;
>     return D.2775;
> }
> 
> This is the LLVM IR difference between "(0 && argc)" and "(argc && 0)".
> 
>    ; Function Attrs: noinline nounwind optnone uwtable
>    define dso_local i32 @main(i32 noundef %0) #0 {
>      %2 = alloca i32, align 4
> -  %3 = alloca i32, align 4
> -  store i32 0, ptr %2, align 4
> -  store i32 %0, ptr %3, align 4
> -  %4 = load i32, ptr %3, align 4
> -  %5 = icmp ne i32 %4, 0
> -  br i1 %5, label %6, label %9
> -
> -6:                                                ; preds = %1
> -  br i1 false, label %7, label %9
> -
> -7:                                                ; preds = %6
> -  %8 = call i32 @f()
> -  br label %9
> -
> -9:                                                ; preds = %7, %6, %1
> -  %10 = load i32, ptr %2, align 4
> -  ret i32 %10
> +  store i32 %0, ptr %2, align 4
> +  ret i32 0
>    }
> 
> -declare i32 @f() #1
> -
> 
> We can see it elides completely the if as expected, given the right
> order for expression.
> On a side note, the first operand still needs to be evaluated if it has
> a side effect (especially a function call), before ensuring the shortcut
> properly applies.
>

For reference, this is the associated bug report:
https://github.com/llvm/llvm-project/issues/148955

>>> +        if (kvm_enabled() && !kvm_arm_sve_supported()) {
>>
>>
>> r~
> 


