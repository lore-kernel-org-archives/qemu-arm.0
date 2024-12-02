Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3070085njk;
        Mon, 2 Dec 2024 09:56:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/AOaBCct9QRm5uyskaohhDsqv9JDhKd4Bf1KOA5yntSmjGGOHNm9B97s+7oeuo5+2Y6/K3fLUBO/skA==@linaro.org
X-Google-Smtp-Source: AGHT+IEovZclVI5Rpz33J97VRy6ASrdHG+yiwTPPve0539JH+scays4y00VhwM06UxCyWJTA6APk
X-Received: by 2002:a05:6214:500d:b0:6d4:1a42:8efa with SMTP id 6a1803df08f44-6d864bf0cc7mr365878136d6.0.1733162203965;
        Mon, 02 Dec 2024 09:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733162203; cv=none;
        d=google.com; s=arc-20240605;
        b=kjoYrWlRihKSFDAYSmEHiKBXMG/sOpZOdbmv7OwkArlZxFj4LTNlv0ue/RtRgI0iU/
         ILBCEMaGI8wUTyGS/uQvhVcfFIv5JSTzbjUcitr1DYZJBCcASECmO79hySdF//7LSufo
         L2IwpFt1bzTPg72Tznn6Yol4eQm+c95iwc6wD7B9yLm0S0p99l65jTmCHsgT1Q/BkqPp
         Fw0LlMuqe3nrDgU6827j/8twG6hmK2rTkW6bHrA5VabuWd/zfsAlNsufzcaX2S15+9p5
         g+lKcNmdj2KdjPQUbgovKZaYRCTAH8U1M3y5iKm/IOgeYtH8xIPzsg0m1jdV012Tz8OF
         b8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1RnQY+VXTgzU1N4LJf3TPk5wngPXdj30nDDGBwg7Zms=;
        fh=0anDOyh7eerWD5UNZX/vpPcvTS6Zel4nqajyEPDUs40=;
        b=k/O3H8jIfTstJnruT2XRuWIJvQgivSQN9H4aoTdj1SJF7j6FkIf8Fd4G7mR6pbomiO
         w7s1d2U85tNz7xa9HCpcR2KyVo+3l6kE46gBacDuTwUYJWHAIXJHyYW4nD1N94kU3JVx
         jBpAQZjfYMeNczlhCDyCyTVEpuXkjyekOP7ED/6OXZwKo4THO2ejMnF1YnxiX5EJZ3WK
         M3Ss6HLhpg6ya2jmOn0+gTH6kuCpLHdJhZW1Pjlbx3Loq6LNBGGjw546sn7EoswSBja0
         N/6WYchDGYRI9u6KDAnb62ayy02HRZNSEbL5WItsmWv4QnkBsCjyMvAckIaycK52G6CW
         NedQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BkWjouSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d89c51918fsi53469776d6.364.2024.12.02.09.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 09:56:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BkWjouSj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIAed-0003jn-Hh; Mon, 02 Dec 2024 12:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIAeb-0003jT-R1
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 12:56:13 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tIAeY-0008Ut-N3
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 12:56:13 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e3983fe3aadso3107521276.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733162169; x=1733766969; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1RnQY+VXTgzU1N4LJf3TPk5wngPXdj30nDDGBwg7Zms=;
 b=BkWjouSjqCga1ahEUv72BD+gCbS/1p6diVemr2odezJQvlpwge1CCaz1QGTmFyrHUn
 BPP/LNbFKc2aLOn5mQjWzQCyFmL2rWH5QfSnBbdfEv0aN9myCUIW1+duwhVVD8P6xGL3
 FpdgXJAKa7vVq+ob2LdzaaFesdpT2oWhAOIGMBl8S+w4ScNLwvr9JsHWOsgAheu57YLq
 k4+wNW4Tq7tXYWEUxnX7kqxU4wPx86xp/fkAF7mq1sknBLkQw0WAsaod54ajjTh0rmJq
 Hw9rwvylbrynHn97SUnjbeRkqpbsCnmjxvxkZvSykQrZOT/mcX2WvbZHFp+g4AXgJDr9
 529Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733162169; x=1733766969;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1RnQY+VXTgzU1N4LJf3TPk5wngPXdj30nDDGBwg7Zms=;
 b=LkrkVVqceG4cEt3ZttjvIjo11pMauVU9TV+uT5eAemty85UDQQWOZbp+W92WkfRrna
 YfaVWCtRjeSjy8hAOxaUSeQSmahAooTFvIFNg0HFJzu3RVEsYdCwpkQrVhUNNxGuLS0h
 pmwRPChWk0frpRNQv78mWX/TbTlJtSq1MFgoYT6H98Li3ZkmgQMyTg/oG/TD5ro4CjRp
 WeXhim73Cy6IDyiWEV8ktPuzG1jiEH6w27gsKrEg9bY3GKMG7Ke8HEohPqLyHiLypPXa
 eYxk7LaOvhGnJtfZgb37K+EPqbqZbe/Guy6a0fxFgANSfobmNlQdl/a7ZT/NuSro0uRg
 y3+A==
X-Gm-Message-State: AOJu0YyXv5ApXgvfO1GTVFccybb5MMVIiXt5t4cATeO2oJBvvW+JssSV
 VVj7nSMbRV0A3bagRGAfccLnfWdAgCCnNvn5CHh88T5MfZWVAH2ihk+9onkaKNo=
X-Gm-Gg: ASbGncsTHD63DlSO1P5nwZuALygpcbqF7LJSVkA7Oe2bsnxqYaIyQoabCWf5fnt4OOL
 sFyy2dOMgm7Os5hBTRtGQnOYOmEOaPlftMbPpkDazdHIna3XX3QjyV0Hko+wsrgbl4V3O/Qax8i
 QqosV5ygx0Q3k9YxXcuZQu5ii5oLGIH4g08aDUyT1SaI0VCL9CHLlgwNCr7zny0PzuJBomSrMJD
 DoZkLb4uRPSKHi81umvtPdA2NLHHgc0fhchOKH9guzj3EmHQaYzo7XC3BnkharhlRREdb0=
X-Received: by 2002:a05:6902:2b07:b0:e33:13ab:52c1 with SMTP id
 3f1490d57ef6-e395b9364famr24753840276.35.1733162169019; 
 Mon, 02 Dec 2024 09:56:09 -0800 (PST)
Received: from [192.168.170.227] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d8903b3a65sm32059646d6.18.2024.12.02.09.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 09:56:08 -0800 (PST)
Message-ID: <b89bb087-58f2-4039-8c11-59f373fb2b6d@linaro.org>
Date: Mon, 2 Dec 2024 11:56:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/67] target/arm: Introduce gen_gvec_cls, gen_gvec_clz
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-37-richard.henderson@linaro.org>
 <c0aa6a8b-59f4-4d3a-83c5-aff885a2eaf8@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <c0aa6a8b-59f4-4d3a-83c5-aff885a2eaf8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: bDknS03A2li9

On 12/2/24 10:29, Philippe Mathieu-Daudé wrote:
> On 1/12/24 16:05, Richard Henderson wrote:
>> Add gvec interfaces for CLS and CLZ operations.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/translate.h      |  5 +++++
>>   target/arm/tcg/gengvec.c        | 35 +++++++++++++++++++++++++++++++++
>>   target/arm/tcg/translate-a64.c  | 29 +++++++--------------------
>>   target/arm/tcg/translate-neon.c | 29 ++-------------------------
>>   4 files changed, 49 insertions(+), 49 deletions(-)
> 
> 
>> +void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
>> +                  uint32_t opr_sz, uint32_t max_sz)
>> +{
>> +    static const GVecGen2 g[] = {
>> +        { .fni4 = gen_helper_neon_cls_s8,
>> +          .vece = MO_8 },
>> +        { .fni4 = gen_helper_neon_cls_s16,
>> +          .vece = MO_16 },
>> +        { .fni4 = tcg_gen_clrsb_i32,
> 
> Why do we have tcg_gen_clrsb_i32(), ...
> 
>> +          .vece = MO_32 },
>> +    };
>> +    assert(vece <= MO_32);
>> +    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
>> +}
>> +
>> +static void gen_clz32_i32(TCGv_i32 d, TCGv_i32 n)
> 
> ... but not tcg_gen_clz32_i32()?

The tcg_gen_clz_i32 primitive has a third argument to specify the result for n == 0. 
Passing that third argument is exactly what gen_clz32_i32 is doing.


r~
