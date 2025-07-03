Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp633257dyc;
        Thu, 3 Jul 2025 08:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLmTLfKryGi08VdjWLSrv1Pk9acZgQj9MRw3stjQSuY2ikzoF4Mzd3ogcuc6roTnYrTH0D/KatnBq6jA==@linaro.org
X-Google-Smtp-Source: AGHT+IFiKrjhSqZp9/r6xCOyIoPAKO8UTAqRvN8Y/2pzK1oWRNV7G4UF7U3jzCfG5TsKOqgy/Srw
X-Received: by 2002:a05:6122:d82:b0:531:4041:c4c7 with SMTP id 71dfb90a1353d-5346764a192mr3537938e0c.7.1751558078847;
        Thu, 03 Jul 2025 08:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751558078; cv=none;
        d=google.com; s=arc-20240605;
        b=hxrh/9t7Ym6XjoNoefB6lpC0KKXs0kawWsmIUsBC7GsCqERbac4DCgd3PnZzSvWvIN
         uwXzzbG0MKsWHpoEwUIoUvDe3xEOIdQILKSjPy2VnXYfgPV75Da0NPS4OH51cj/35Bk6
         PNTLTrQ/HJr2Cny0ai1N9dHTc3cCgyOhjEIyBVSfRTXxn0rSyg/OPURY9iQoYuT5erCj
         ccP9Wd4CdqyQm5Oiqt6omCDoBs4X6Op0Pg3n1m/k+f/7gGSstHaFeFhRbMv/7hYs8aSF
         ATUKmQZOKey2yoeeLd8SdfLEH3E8vqvIZo23elOC53gSQ2c5yZoON5qLsgxPsAvObc8E
         LunA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NF+no9p+3maMSsijBYB32Ph41608BK9I+kmKZxnFeOY=;
        fh=GuMu1WCKgS3dbL88xlNIBER1Up0djmzGG1E43W7TdXU=;
        b=EHImb7USEcJYy15t8nqSRPfTr90ZWPfdYOIfezKAjOriSO+BP8DM0xSBPRx57QsJ/d
         UcOen09j65w/xbEgcIkuVRMKPUj55RLYuVygIZ/3ujRgrzR5J9C+ujr5fYAxSlruKATJ
         h/0qZLGh/pW1Gc0B2AmWhZWNxQdBjrZSKRO2pwcF8un3Vvf9oay/Vf+YWLjOEomiB21M
         hieGOU7tRBMwXMbG9pYrPAlFcoxqR9HN9/9yyOpf9Pib9jl8bMXn8wApQUGWeGY4DNOb
         wk2izsv6KQ4vF4cOt6g8Y+BJSgPRqdr+cuC8w1cdryhxxxKEGVkc4rLL86ot+YRJFTPa
         +Qeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBTUfzOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5330930976asi4022097e0c.203.2025.07.03.08.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 08:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DBTUfzOw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXMGQ-0008Ab-7p; Thu, 03 Jul 2025 11:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXMGC-00089x-Pv
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 11:54:04 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXMG9-0000Lf-Tm
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 11:54:03 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-40b1f402deaso66046b6e.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751558039; x=1752162839; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NF+no9p+3maMSsijBYB32Ph41608BK9I+kmKZxnFeOY=;
 b=DBTUfzOwPzDPl3AyVODM7pi3rvV4xfVwmxtJwIad2t+RbZdYxb0IiTtMAly4f+Swg2
 EeWB88ySp6Eza9UkztmMP++pfvTSElmd1cna5+NLhw5GZ4wYqO9bd4Hg/6MFtP1QIGHj
 zCSE1fZOIuWZJ4eb/ro6tq/4WcoQBFQsPMnPaKVY1rpTd5M0bnmrMYElSOHVyf4i0qqt
 4tEz936xNWjsZjoXih8BcpZAV3NwmcQ7zENdCT3PkhSvNaF4kMOF7/ByNRPwV8DlATGZ
 lA6B3mWf3IbFKS+6l9DkbUbKAL1bj6iVoYhBnwfX0IROkruqtBTdWhBnIJIlQNvHdhmN
 UzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751558039; x=1752162839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NF+no9p+3maMSsijBYB32Ph41608BK9I+kmKZxnFeOY=;
 b=qMaRl87Kdnux/11crRw+XeN7JRq/n4b+Jl1bwukLkI8PN9npHMd79mXDMjahNhE/mr
 JoffLRnlFyT7Yn/qqiXGrqRiary4DDyM4aK4TB5lx9l403olBbx1LA1MFIxhIcTbxjZE
 Alf/4mdwoOu6o8JlJWYmdunBZC79yEF3QNrDlQEyCqQCEYTFGvwyplKXi+MilG+5kCmG
 aBoBOiuX5v27YZVy9AMt6rXvxAFA/jaEC9GlSYC0VLwYmSCGRPmiT5S4NoK12BpFggLt
 F9lZWzaEqqmnR6YLWV4ul0NGHtcLap4R+rIq3EjRKJ2XW/VU3/kVMMBKU7cqh8MFEMH7
 yosg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEHK57WJ00MiG4IGyX25qhN+KlBG1Y2unoZvQFk08H3/L22iCvQOoUUFHeWV6R83gM+9rrbiDNpA==@nongnu.org
X-Gm-Message-State: AOJu0YyxVghQ9+MkYgbLC9FxoQG36gkfVC+kOhOQJPKqtRET7wwbu+hQ
 xX9MmmEdqkeCYseiNJsrluqv7NQjJNTEwg/SohfRsirpicVYCmwcJqAg5fbEjo8UoT8=
X-Gm-Gg: ASbGncuiO3iDw2tLntUViNfvsGgYm4ixYubx0XrmCK0C/CGKEdgnqgugZqSbh3NaNhA
 eMLk74yNq0fu6ESyFITBCbTtPM4TUxzbwRhSLT1N2YWfnwetPog6Bcdb4ZpUMhK/iY348lJYDHJ
 Xfm2X/BQRFsnjdhwbezfFk7t2Bd5JWxTu91vgLoHDfPAYlDa9GmysujfGiOcZm5MC/qiH4Oi0Ro
 NfPJPWCi9ca2q7iCRh9TdN8NVc+gzbtLUQj4t4X8tnANousEHHBx1/HBQQODfrspYBnK9qpELeN
 qKkMkF+M8LrhqT6I/muV/TkFaLnW0PHqvN5xZBFIRD8TzJ/h/8XhcXUtmWJXppRfuDSRmYyJmb5
 X
X-Received: by 2002:a05:6808:300e:b0:403:50e7:83db with SMTP id
 5614622812f47-40c0fd85993mr2902399b6e.25.1751558038977; 
 Thu, 03 Jul 2025 08:53:58 -0700 (PDT)
Received: from [10.25.6.71] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40b32421a92sm3015237b6e.42.2025.07.03.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 08:53:58 -0700 (PDT)
Message-ID: <49b1a585-6249-48b3-86bb-2dbc81963899@linaro.org>
Date: Thu, 3 Jul 2025 09:53:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 49/97] target/arm: Implement SME2 SQCVT, UQCVT, SQCVTU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-50-richard.henderson@linaro.org>
 <CAFEAcA-Qj5Vv6x08epwiWs0ihDLa4=mihMvrx=D+xOLkdYFvYQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-Qj5Vv6x08epwiWs0ihDLa4=mihMvrx=D+xOLkdYFvYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w7Qk5w8miIa1

On 7/3/25 04:20, Peter Maydell wrote:
> On Wed, 2 Jul 2025 at 13:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/helper-sme.h    |  20 ++++++
>>   target/arm/tcg/sme_helper.c    | 116 +++++++++++++++++++++++++++++++++
>>   target/arm/tcg/translate-sme.c |  35 ++++++++++
>>   target/arm/tcg/sme.decode      |  22 +++++++
>>   4 files changed, 193 insertions(+)
> 
> 
>> index d69d57c4cb..906d369d37 100644
>> --- a/target/arm/tcg/sme_helper.c
>> +++ b/target/arm/tcg/sme_helper.c
>> @@ -1561,6 +1561,64 @@ void HELPER(sme2_fcvt_n)(void *vd, void *vs, float_status *fpst, uint32_t desc)
>>       }
>>   }
>>
>> +#define SQCVT2(NAME, TW, TN, HW, HN, SAT)                       \
>> +void HELPER(NAME)(void *vd, void *vs, uint32_t desc)            \
>> +{                                                               \
>> +    ARMVectorReg scratch;                                       \
>> +    size_t oprsz = simd_oprsz(desc), n = oprsz / sizeof(TW);    \
>> +    TW *s0 = vs, *s1 = vs + sizeof(ARMVectorReg);               \
>> +    TN *d = vd;                                                 \
>> +    if ((vd - vs) < 2 * sizeof(ARMVectorReg)) {                 \
> 
> Does this do the right thing if Vd is less than Vs?
> Pointer differences are signed, I think, so for eg vd == 0
> vs == 16 we unnecessarily use the scratch reg.
> Maybe clearer to write
>     (vd >= vs && vd < (vs + 2 * sizeof(..))
> 
> (Similarly for other use of this condition later in the patch.)

I should probably split out a helper for this, there are so many instances.


> 
> 
>> +        d = (TN *)&scratch;                                     \
>> +    }                                                           \
>> +    for (size_t i = 0; i < n; ++i) {                            \
>> +        d[HN(i)] = SAT(s0[HW(i)]);                              \
>> +        d[HN(i) + n] = SAT(s1[HW(i)]);                          \
> 
> Should this be HN(i + n) ?

They're equivalent, because n is the whole vector size, and so does not overlap the xor on 
8-byte endianness.

>> +    for (size_t i = 0; i < n; ++i) {                            \
>> +        d[HN(2 * i + 0)] = SAT(s0[HW(i)]);                      \
>> +        d[HN(2 * i + 1)] = SAT(s1[HW(i)]);                      \
> 
> Hmm, here we do do HN(whole expr)...

None of these inputs is known to be a multiple of 8.


r~
