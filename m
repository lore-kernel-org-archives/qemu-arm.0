Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp438088njb;
        Fri, 14 Mar 2025 01:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEW9J9oJPL082V6ZoAnn0BF37kbeXTutBDF4r0h3Hhf2dHXEQ9BZhAeAFCy2vux69kaFhc4yPmbfYmng==@linaro.org
X-Google-Smtp-Source: AGHT+IEaPUsQUPjsehpWoFyJVOnKwqQrql6KHDTFWzLT/Rendw5q2dzcDOrXR6U5DpGVeik+Fk35
X-Received: by 2002:a05:6214:cc7:b0:6e8:9cd3:80d5 with SMTP id 6a1803df08f44-6eaea9f6459mr16916716d6.13.1741940156093;
        Fri, 14 Mar 2025 01:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741940156; cv=none;
        d=google.com; s=arc-20240605;
        b=Lw0fcgOtPtBslkaihJ5dTdZcboHvujNyz9kNBh/rsCRp7ijyum7sVniVmRktUcfXny
         Pw0AKuX/zL88gOBYuavdERIFfVS8+wpJVl70rAurEKQLiDNDvUUpRTaVXCjYi7HGQu/d
         coEJGBUzCSZF0E8sEYmwa9cnN6f07zoLeXGZZrPGrzPJJflIZbxsNk6FlqjZ8Ua7Q/Ot
         cm6rdc/+RyrF4hoc2PrpFtOzrMsAdVArnzSExCS3I68pr+9HsDJdV1VQMOdlFb+iTh4s
         wqyXXvUXdm9tlo2nZ0D13yFry9dIdaqTCl7hFZVVWt/vEWUCzhDDtQJHjuY0SE1zfveL
         7RvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rjRbWqEK1cRNvpLX1XN8SPfUVIwyJOinGMyrefKKi4M=;
        fh=gsWQzOY16qPF2FuRyujP1s0GvMPSpV3eyuMjZcXUPQ8=;
        b=i9kdrvoDEuIpkplbtJKC0LK+xPTVtBdTJl2nRSeds2DtJ83pqJC/2Vwlr+P6r81QfW
         z9NxORiwIljV4qjFCa5QBeEgYMW+O73CI2BcCgqV7JE1Aq5BBdXaaDmVuFMJ5stbN2iA
         sqsFojRpssyzsPIsKtoBZz1w2suonX83fCqytOVlTMkaKuvzxH5n5dpExX10i4+OxKU4
         pjvQ5abAKl8XIuUnzrouBTym9tS3Is2au7qel7d6j2FU+RfZ/oMY8CslV5ZdLaIg1T1D
         iIwMG50SfyHhi4V2j38Tp4vIdyLdEyeyy1FeiLnXsk/2lEi6j2e3nGmjICZ8Tmf6CM34
         jWKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tFj4e9ho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1dd9f9si33966166d6.54.2025.03.14.01.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Mar 2025 01:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=tFj4e9ho;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tt0Cc-0002hy-L3; Fri, 14 Mar 2025 04:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tt0CW-0002fg-5r
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 04:15:28 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tt0CU-0003d5-6D
 for qemu-arm@nongnu.org; Fri, 14 Mar 2025 04:15:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-22398e09e39so37665595ad.3
 for <qemu-arm@nongnu.org>; Fri, 14 Mar 2025 01:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741940124; x=1742544924;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rjRbWqEK1cRNvpLX1XN8SPfUVIwyJOinGMyrefKKi4M=;
 b=tFj4e9ho/pAIFqHS7lMNwqsS2fmW4BF+78jaFTXR+j0q2XadOp8xIbZ4c9xdWmSIAe
 P18Js/sasY7Ycwp3egiKCm8fUi3pKH/L/iIJUqyWxhLsXchLdh2Xt5F7usuPbPK2H83A
 qLVyH2yhhl2b7M5TPJrbcG2vViScwY3weczdKLXhrTRdzjNu6/ieBUIEfxiApXtrdo8w
 moeAMMZbqqLwU5O4qBKhPGIiVD4cqjtmZQNqr7WhtC+55Q57eFpLboIqJYpONvCeDpjs
 oISpIk5sqa+vWI4XgN0ZNXblYXMNTzon9rBW/e4wvPjQ/98iZrU86spQwpmTaJ0d5dlZ
 lIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741940124; x=1742544924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rjRbWqEK1cRNvpLX1XN8SPfUVIwyJOinGMyrefKKi4M=;
 b=cQPbkL2NJuV3osM2/gIJdSsNUZvtqDDITAxTDhsrrBja/zrteioiIz0qGK2OpMLsnr
 fvJ3z+8bIqe7AC7YQBj7oQ//rPZg4tSi5eL0b7o8ajSkH87NY9R/bxShehMU3ZBpWmAy
 9gh/egylHp4OBNMj1W71Zc9t18mImN1hPPfoABaHU8i7lbfofGNh9PNveQlw3ItaaMif
 66aCI7pa8msDy09w5ZRWwbWhvU3WZ7L7MI89zTHmxlNu0YpNttvraZ70IrSbuoI9DuMg
 5oHRHPIz7X3IZWq+I7AM2Sf67xw3vU61mz4/LxM2ryAjjqyR+u3xV0ElSOcd121tQu6t
 mg1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWePhdsRLoIlpZZHPIQLCM+ietB0TjcLeg1zDsJkfMfidMOYolnGWDr2w69A0lDaghmZNiFEtmeVQ==@nongnu.org
X-Gm-Message-State: AOJu0YzrRXSS7A+gzwvTsPOQFKGBj+TeIhugEt6hPQfXdB3O2nNdqJMj
 Uue921MeqD7Pqvgm6X+r6lOHko/sv/iODRZejUMUmYysj7KnXvFgG08JMqmoEMMwo/WAQ3Cd5MS
 oOgE=
X-Gm-Gg: ASbGncuHMOS9FCe+b5zuz8kiWaUm6vFPvhOiXxk2fJggLaD7pMpqpzd8p79nFq725Gu
 uE8ew5/mcEa6Ln8emdm6oXXtCeJu5MfUHgdQT7mb8hIga2hx7usmfRCZyTKx2rfPGg704w1aCVX
 nt7NvV8Bf4ShDdTvoLRXgT8sHLrcL9wX2mU7v/Yak0JPBSfaqhiT/JRxdzaMZuftr9LfZNdtBbB
 SuLkEWLTzKJKPU3UXTVLcNsX1tJE5p7mqm9XeRGf8QRxuEfLXd97PUIj52giAuNpbUWiqW7xVVB
 b9bixvUr/2D8dkKgJ/3HI29NSiXXE8t6QDSff3YWvEEcwuMunP1VQPYwcXkrPil/Dhbh
X-Received: by 2002:a05:6a00:2386:b0:72f:590f:2859 with SMTP id
 d2e1a72fcca58-7372239bc8amr2028605b3a.13.1741940123934; 
 Fri, 14 Mar 2025 01:15:23 -0700 (PDT)
Received: from [157.82.205.237] ([157.82.205.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7371167df81sm2486565b3a.110.2025.03.14.01.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:15:23 -0700 (PDT)
Message-ID: <6959f6ef-c142-49e0-b742-a99da1a26b61@daynix.com>
Date: Fri, 14 Mar 2025 17:15:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Define raw write for PMU CLR registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, devel@daynix.com
References: <20250313-clr-v1-1-2cc49df40fe9@daynix.com>
 <CAFEAcA9pu_Y8Ki6TFznViO1UCqqSgHgn2ZKQjbcoKVob3qF5dg@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA9pu_Y8Ki6TFznViO1UCqqSgHgn2ZKQjbcoKVob3qF5dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mH6cfbe1fzPW

On 2025/03/14 3:34, Peter Maydell wrote:
> On Thu, 13 Mar 2025 at 07:16, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> PMCNTENCLR_EL0 and PMINTENCLR_EL1 clears written bits so we need an
>> alternative raw write functions, which will be used to copy KVM kernel
>> coprocessor state into userspace.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   target/arm/helper.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index f0ead22937bf..30883cd3a989 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -1907,7 +1907,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>>         .fgt = FGT_PMCNTEN,
>>         .type = ARM_CP_ALIAS | ARM_CP_IO,
>>         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcnten),
>> -      .writefn = pmcntenclr_write },
>> +      .writefn = pmcntenclr_write,
>> +      .raw_writefn = raw_write },
>>       { .name = "PMOVSR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 3,
>>         .access = PL0_RW, .type = ARM_CP_IO,
>>         .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
>> @@ -2033,7 +2034,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
>>         .fgt = FGT_PMINTEN,
>>         .type = ARM_CP_ALIAS | ARM_CP_IO | ARM_CP_NO_RAW,
>>         .fieldoffset = offsetof(CPUARMState, cp15.c9_pminten),
>> -      .writefn = pmintenclr_write },
>> +      .writefn = pmintenclr_write,
>> +      .raw_writefn = raw_write },
>>       { .name = "CCSIDR", .state = ARM_CP_STATE_BOTH,
>>         .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 0,
>>         .access = PL1_R,
> 
> Hmm, looking more closely at this, I think this second one should
> not need a raw_writefn, because it's marked as ARM_CP_NO_RAW
> (meaning nothing should try to do a raw write to it).

Good catch; I didn't notice ARM_CP_NO_RAW.

> 
> And the first one is marked ARM_CP_ALIAS, so I'm not
> sure why we would be using it in KVM register sync:
> add_cpreg_to_list() skips ARM_CP_ALIAS (and ARM_CP_NO_RAW)
> registers when we construct the cpreg_tuples[] array that
> defines which sysregs we sync to and from KVM.

The register list is initialized with kvm_arm_init_cpreg_list() for KVM, 
which ignores those flags.

target/arm/cpregs.h explicitly says: "registers marked ARM_CP_ALIAS will 
not be migrated but may have their state set by syncing of register 
state from KVM."

ARM_CP_NO_RAW is still respected for KVM by write_cpustate_to_list() and 
write_list_to_cpustate().

> 
> (We should arguably be consistent about our usage of the
> NO_RAW flag between the pmintenclr and pmcntenclr registers.)

I sent v2 to drop the flag. target/arm/cpregs.h suggests ARM_CP_NO_RAW 
is not a flag for these registers:
 > Flag: Register has no underlying state and does not support raw access
 > for state saving/loading; it will not be used for either migration or
 > KVM state synchronization. Typically this is for "registers" which are
 > actually used as instructions for cache maintenance and so on.

These registers have underlying states and can support raw access.

Regards,
Akihiko Odaki

> 
> thanks
> -- PMM

