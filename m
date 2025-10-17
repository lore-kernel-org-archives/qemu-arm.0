Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3B6CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 19:04:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9pk6-0000It-Mz; Fri, 17 Oct 2025 15:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9pk5-0000IW-JG
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 15:03:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9pk2-0005Cc-Jy
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 15:03:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3352018e051so2675976a91.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760727832; x=1761332632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uku7aAPcFrSLbT4Wezvfehb1h4Yz0KUtRB+nV1hGm6k=;
 b=LBi95shy77gxB6GRd/rOoECIQlYnVKplPoorkx9cWIYNC5cAg+Nx6Sy+DzbXfBRRb6
 TVVpOrKZpELvU+88gto0Qs1HiVist9b/7EBkinOkDcf9ze/1V6eS5f/q80p4sMQMPrmd
 JHrLz5SHc/GdkO6CmP24J/abK4zcEb7ZcVV9xJEintR2kjTKgtl3w56U22NwlRM6lX++
 jtOIXaUwfBGWeANkDzwZ1vFd5w90DaUlcGS1NSGSBn1Jh60ETbQRZMFImUrmbU8Nu3rz
 A4WacKMZxsiJalFelAxX9P2NwugwvyEapjG+TalWt5eV/lBBGF5OYwu3dT/dy+4HEHTk
 YoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760727832; x=1761332632;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uku7aAPcFrSLbT4Wezvfehb1h4Yz0KUtRB+nV1hGm6k=;
 b=gYjp8ygU4vESD8kNOYGUo4ULvxVsuBIyLrIxuEsKc3z3Lkj7EhBCamkr0fdLE6sW5I
 mNFBIwFYB4wae7kirkkYSRy5Vipee18N3f5EhrQ/jqQ8lCilIUq8DnU22jvLZZR6iarD
 2VlU0i7Wrl2X5Z7sIMycGbiZrpN4lVDqgcMJYcXPzUWkOHUV+FtFjyFJ3Hlli6R3gZzT
 wpIV/N9PrRa39ANjTJGmIg5Cb3sEVajtav+F2qw7hqsqpdO1yt3ccHMD2cTGbgKiifxA
 b23REc3keuM2JEX1+odS0HV8cAZLktfIk9SehiJ6rFN0CC8chjzlEWCeTGhPj4rpVKFm
 yO6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqp631SZ/ij4zD2MoNQ16rAc/6Ml77KIMy9Y4yP6gNBij17t48rnN3SKi2GqiaHZyytIEaotajlQ==@nongnu.org
X-Gm-Message-State: AOJu0YwABQub4epycjmivwRlCbABAsFKIhRaaTsLrqfkbzQkHxl0ZyMD
 9bBvc+BgSZHP76M0/HLOE51lFlwL96Xye8cZXl10rTJ5NYsAFcEuUpLRHvv7wrKFx14=
X-Gm-Gg: ASbGncvUj7Pk3IUaXMOc4lE2ON0TyKuN+j+06dzMqhjjVts934gLE8Kd2yJkWMSHJ/o
 0ZjX9tx9olI27kvDjD1v97qu9WPEh3qaAwkNJ0K3vb6iRco27fIcMEtscLN4MTe48nznonVA8x+
 ENOqVdmhJZGOODyKHqnuLFm4beRBERmqPkgKaRC9ZZ5rF6O2hqCPCVf1PgUmUCAyDL5gZlAFcDp
 9WO2NxGInJGp+/CsdoH2aeN2lpq5I3AQsmO/xIpxJhlQEpAC8nx8cUdfR/dsrP/eKIz2qY6oMkK
 1+ASscns4vjnuCjJ/r8y6RtmUVS9MTXaAu0ss4UGhWHto7Z5ecBmyRpqvSkgZdeov4yKrFR0Ewh
 jLmzRq28gaoSqYtYO6idTL1Noi6m/mlS2Oj5NL1eN7bLiTVsdyWwo9Me0N7+0OBbjuoszz3vSyH
 IDtZwqrCbuiesXdD0UBO/UdFCN
X-Google-Smtp-Source: AGHT+IFvUw3WBtk4jgwLRQ2LURgGvv6bDzvu9p3O9Cc9ClpQ8Zh7sSW5p2VtwBwl3EKkuM3OZigj9w==
X-Received: by 2002:a17:90b:2d8b:b0:336:bfce:13c9 with SMTP id
 98e67ed59e1d1-33bcf8e3d37mr5532297a91.20.1760727832337; 
 Fri, 17 Oct 2025 12:03:52 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33ba96ca5d9sm2800586a91.2.2025.10.17.12.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 12:03:51 -0700 (PDT)
Message-ID: <3593bf1e-1036-485c-87c9-41fc650823b7@linaro.org>
Date: Fri, 17 Oct 2025 12:03:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/37] target/arm: Extend PAR_EL1 to 128-bit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-22-richard.henderson@linaro.org>
 <CAFEAcA9J-g1cKTXk_pv1AWLgx5YksvEGyAbL2Z6coB6=wA0dZw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9J-g1cKTXk_pv1AWLgx5YksvEGyAbL2Z6coB6=wA0dZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 10/17/25 05:49, Peter Maydell wrote:
> On Tue, 14 Oct 2025 at 21:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Do not yet produce the 128-bit AT format result, but zero the
>> high bits whenever the low bits are written.  This corresponds
>> to PAR_EL1.D128 = 0, and bits [127:65] as RES0.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
>> index 0e8f229aa7..9e6af3d974 100644
>> --- a/target/arm/tcg/cpregs-at.c
>> +++ b/target/arm/tcg/cpregs-at.c
>> @@ -353,6 +353,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>>
>>       ss = for_el3 ? arm_security_space(env) : arm_security_space_below_el3(env);
>>       env->cp15.par_el[1] = do_ats_write(env, value, access_perm, mmu_idx, ss);
>> +    env->cp15.par_el1_hi = 0;
>>   }
>>
>>   static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
>> @@ -496,6 +497,7 @@ static void ats_s1e1a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>>       ARMSecuritySpace ss = arm_security_space_below_el3(env);
>>
>>       env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
>> +    env->cp15.par_el1_hi = 0;
> 
> I guess this is where the downside of not storing the
> register as an Int128 shows up -- we have to remember
> to explicitly clear the high half everywhere that we
> have code that's doing an implicit-write to the 64-bit
> version of the register.

Yes.  Thankfully, PAR_EL1 is the only 128-bit register with implicit writes.


r~

