Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1364011ejb;
        Mon, 4 Sep 2023 07:06:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhpyDIkt6EjLdtUOwF9vln50A2KFVepO6iFWaX3ohxk93af1psYYjaDzo99ELmpiYmnN03
X-Received: by 2002:a05:622a:c5:b0:412:4c9:93c4 with SMTP id p5-20020a05622a00c500b0041204c993c4mr13859090qtw.59.1693836412279;
        Mon, 04 Sep 2023 07:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693836412; cv=none;
        d=google.com; s=arc-20160816;
        b=Lu+v4DynZrbE2NrkIk2Pb9Xq9pcqHE+NfMh9tI9t+DfEEDETKLrPmYv94oXbZBXgU2
         56AJQbNE2c+/42cVEqRCnlfxYnXedboFhrJMFoMPiQBKu33bmNcXsGgw1hiDCvUKHhPi
         4WEZsqWcnCgNejL2/MtPX3a1/as6hXF8eGDAPoi8GQx4GeKUsttkq2GBuN/0Xkmi6L2X
         GuA2YhKJr0Z++k1/BCvjLOBAhq28RPm3fWWD2RV9ZeosNo7P7JS4Gn7LjAsxuPGVMlu4
         8Fg4Kdc0pjOtVZBbW3dZUo/CPWaQ11Uuw7AQd0SXva75uHtqUPdl80DxVGU5eMYsjgMz
         atGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RwyMHhZeSZclptVm/lKpxcxHNUhunHMxC2rmEIIQW3w=;
        fh=aT213HZcFrVVaoPFtYiegoKWeAuCj1CYib+ZypQtoOc=;
        b=gx5Y2Gd5DJ7W8FWMLE+vtMszFT/TQgT8eCusQPPosyS8RFCvWWJyX41pGOi/yYJjpe
         N21pfFBb9t7+UyxaeUZEBd+e933b9xt+cJB81MSbJpwIN11hYvh6i/PfV90duiF+YV7i
         qbs4OM4GUzMtdztSXrABxhlnMwCf2yip6jh3frLXFbWEq7xXDigOrilYTz+gNeYzmyVJ
         Os30gLupASK5hnzWUU9LWpleEaMma5XgjZMzkyu5G/iK/x4OEXtFdfhHRNbYMo/61lHj
         ZiAGcsVSXHqSYubT09TtNyEnn4RekSaGFZZBr5Co+aQ3EbTSMcR2uW6NkgPPSb8EffKz
         O5bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjHN4oEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cf23-20020a05622a401700b00414b35ac570si3435228qtb.234.2023.09.04.07.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 07:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CjHN4oEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdADu-0004Zb-6u; Mon, 04 Sep 2023 10:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdADq-0004YI-6K
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:06:35 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdADn-00018v-Lt
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 10:06:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a65f9147ccso84012866b.1
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 07:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693836389; x=1694441189; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RwyMHhZeSZclptVm/lKpxcxHNUhunHMxC2rmEIIQW3w=;
 b=CjHN4oEvNdgZfmpsSZZqDOWstPs3WrBkvi9fbUBBZl8onw/7eo6Z09gpZpscppBX5F
 e0t9yaMpodW6Tcwwx8ACGjIQY47QVmH07BTdfhV5/Av2392oS8dIYOLBL92fvrAJuNE/
 +bF1l4cwQWquWzpCXdniSlGcIMRMa1WklK9UedoBfD6XLo8+0m3a46XqcOkaPy/Eca6H
 qCttPR/PjgAUkMknc19TAKqSREXxsY6Y8KW2Z/XP1ZDd58QUVg9BuwQnI5aqbl7hJOwN
 KQG3AkosH72NlhKrq90MkW44DUBNVHNloxOBYhhNN8NkTWew4Dnp2oahTFF4tAKDhAzT
 v+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693836389; x=1694441189;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RwyMHhZeSZclptVm/lKpxcxHNUhunHMxC2rmEIIQW3w=;
 b=eaL/yLlBtt7MizmXju4w+BAHpOiKACuxO0fH73u10sRMqBo32HSxr22qSh9uW5DJab
 hPeLM+kkeS8hdwIOJyGZSgUufqUcteJ/KEYFNSTmKJ5b4Hk4YRKr3tZ8nUfiFugo0sVs
 5hxkh8oFm30Pqlvqk8VH4fL56tQI3qhpS55v1aXH01jKSMxbwsbvFAkd3ndIN4weEjRq
 R8Ku/fuvDs6D6LRmcl0nrv95vb93+s9RrfzXfzZvIAdvfdhFLzioZ6pniK4ox9ilU6M2
 IQpMXNQuuL6zHmJ15Ln/IZjW6M+LaoCRRGRDtByTvsNobMWKTagE2r6Al36iv4/Et/1d
 Zw+Q==
X-Gm-Message-State: AOJu0YxSg4U08h2aSbwlwKu4kd2VhrWkPQ7JG5AiDbXXsRQtNKJJ5Ttp
 DSSoGjZvLLnagWEB2gZM+yduLw==
X-Received: by 2002:a17:906:6988:b0:99d:f560:5d3c with SMTP id
 i8-20020a170906698800b0099df5605d3cmr6900592ejr.23.1693836389281; 
 Mon, 04 Sep 2023 07:06:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a170906960100b00992d122af63sm6208298ejx.89.2023.09.04.07.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 07:06:28 -0700 (PDT)
Message-ID: <d136124b-ab5e-9868-8637-6cf3edb8ca54@linaro.org>
Date: Mon, 4 Sep 2023 16:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 02/11] target/arm: Clean up local variable shadowing
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@csgraf.de>
References: <20230831225607.30829-1-philmd@linaro.org>
 <20230831225607.30829-3-philmd@linaro.org>
 <CAFEAcA_e+fU6JKtS+W63wr9cCJ6btu_hT_ydZWOwC0kBkDYYYQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_e+fU6JKtS+W63wr9cCJ6btu_hT_ydZWOwC0kBkDYYYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: tHUijTAIbRnV

On 1/9/23 12:46, Peter Maydell wrote:
> On Thu, 31 Aug 2023 at 23:56, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Fix:
>>
>>    target/arm/tcg/translate-m-nocp.c:509:18: error: declaration shadows a local variable [-Werror,-Wshadow]
>>          TCGv_i32 tmp = load_cpu_field(v7m.fpdscr[M_REG_NS]);
>>                   ^
>>    target/arm/tcg/translate-m-nocp.c:433:14: note: previous declaration is here
>>      TCGv_i32 tmp;
>>               ^
>>    target/arm/tcg/mve_helper.c:2463:17: error: declaration shadows a local variable [-Werror,-Wshadow]
>>          int64_t extval = sextract64(src << shift, 0, 48);
>>                  ^
>>    target/arm/tcg/mve_helper.c:2443:18: note: previous declaration is here
>>      int64_t val, extval;
>>                   ^
>>    target/arm/hvf/hvf.c:1936:13: error: declaration shadows a local variable [-Werror,-Wshadow]
>>          int ret = 0;
>>              ^
>>    target/arm/hvf/hvf.c:1807:9: note: previous declaration is here
>>      int ret;
>>          ^
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/hvf/hvf.c              | 1 -
>>   target/arm/tcg/mve_helper.c       | 8 ++++----
>>   target/arm/tcg/translate-m-nocp.c | 2 +-
>>   3 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
>> index 486f90be1d..20d534faef 100644
>> --- a/target/arm/hvf/hvf.c
>> +++ b/target/arm/hvf/hvf.c
>> @@ -1933,7 +1933,6 @@ int hvf_vcpu_exec(CPUState *cpu)
>>           uint32_t rt = (syndrome >> 5) & 0x1f;
>>           uint32_t reg = syndrome & SYSREG_MASK;
>>           uint64_t val;
>> -        int ret = 0;
>>
>>           if (isread) {
>>               ret = hvf_sysreg_read(cpu, reg, rt);
> 
> I'm not sure this is correct.
> 
> The hvf_vcpu_exec() function is not documented, but in practice
> its caller expects it to return either EXCP_DEBUG (for "this was
> a guest debug exception you need to deal with") or something else
> (presumably the intention being 0 for OK).
> 
> The hvf_sysreg_read() and hvf_sysreg_write() functions are also not
> documented, but they return 0 on success, or 1 for a completely
> unrecognized sysreg where we've raised the UNDEF exception (but
> not if we raised an UNDEF exception for an unrecognized GIC sysreg --
> I think this is a bug). We use this return value to decide whether
> we need to advance the PC past the insn or not. It's not the same
> as the return value we want to return from hvf_vcpu_exec().

Indeed.

> So I think the correct fix here is to retain the variable as
> locally scoped but give it a name that doesn't clash with the
> other function-scoped variable.

OK.

>> diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
>> index 403b345ea3..32087b6f0a 100644
>> --- a/target/arm/tcg/mve_helper.c
>> +++ b/target/arm/tcg/mve_helper.c
>> @@ -924,8 +924,8 @@ DO_1OP_IMM(vorri, DO_ORRI)
>>           bool qc = false;                                                \
>>           for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
>>               bool sat = false;                                           \
>> -            TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);          \
>> -            mergemask(&d[H##ESIZE(e)], r, mask);                        \
>> +            TYPE r_ = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);         \
>> +            mergemask(&d[H##ESIZE(e)], r_, mask);                       \
>>               qc |= sat & mask & 1;                                       \
>>           }                                                               \
>>           if (qc) {                                                       \
> 
> The commit message doesn't list an error message relating to
> this change and it's not immediately obvious to me what 'r'
> would be shadowing here.

Full error:

target/arm/tcg/mve_helper.c: In function ‘helper_mve_vqshlsb’:
target/arm/tcg/mve_helper.c:1259:19: warning: declaration of ‘r’ shadows 
a previous local [-Wshadow=compatible-local]
  1259 |         typeof(N) r = FN(N, (int8_t)(M), sizeof(N) * 8, ROUND, 
&su32);  \
       |                   ^
target/arm/tcg/mve_helper.c:1267:5: note: in expansion of macro 
‘WRAP_QRSHL_HELPER’
  1267 |     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
       |     ^~~~~~~~~~~~~~~~~
target/arm/tcg/mve_helper.c:927:22: note: in expansion of macro 
‘DO_SQSHL_OP’
   927 |             TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat); 
         \
       |                      ^~
target/arm/tcg/mve_helper.c:945:5: note: in expansion of macro ‘DO_2OP_SAT’
   945 |     DO_2OP_SAT(OP##b, 1, int8_t, FN)            \
       |     ^~~~~~~~~~
target/arm/tcg/mve_helper.c:1277:1: note: in expansion of macro 
‘DO_2OP_SAT_S’
  1277 | DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
       | ^~~~~~~~~~~~

So 'r' comes from:

#define WRAP_QRSHL_HELPER(FN, N, M, ROUND, satp) \
     ({                                           \
         uint32_t su32 = 0;                       \
         typeof(N) r = FN(N, (int8_t)(M), sizeof(N) * 8, ROUND, &su32); \
         if (su32) {                              \
             *satp = true;                        \
         }                                        \
         r;                                       \
     })

I'll rename this one as 'qrshl_ret', and the previous one
'vqdmladh_ret'.

>> @@ -2460,7 +2460,7 @@ static inline int64_t do_sqrshl48_d(int64_t src, int64_t shift,
>>               return extval;
>>           }
>>       } else if (shift < 48) {
>> -        int64_t extval = sextract64(src << shift, 0, 48);
>> +        extval = sextract64(src << shift, 0, 48);
>>           if (!sat || src == (extval >> shift)) {
>>               return extval;
>>           }
>> @@ -2492,7 +2492,7 @@ static inline uint64_t do_uqrshl48_d(uint64_t src, int64_t shift,
>>               return extval;
>>           }
>>       } else if (shift < 48) {
>> -        uint64_t extval = extract64(src << shift, 0, 48);
>> +        extval = extract64(src << shift, 0, 48);
>>           if (!sat || src == (extval >> shift)) {
>>               return extval;
>>           }
> 
> These two parts are good, but one of them is missing from the
> listed error messages in the commit message.

I'll record both.

Thanks,

Phil.
