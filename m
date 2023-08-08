Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp2293908ejb;
        Tue, 8 Aug 2023 09:04:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpUlQsEauFooVeAkM/qkbMIlTILRmdLXnD8fXEy1mfJMqna1pTve95surm7JU1UsQMGqGE
X-Received: by 2002:a05:620a:4607:b0:76c:bb18:e718 with SMTP id br7-20020a05620a460700b0076cbb18e718mr180955qkb.16.1691510686305;
        Tue, 08 Aug 2023 09:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691510686; cv=none;
        d=google.com; s=arc-20160816;
        b=y9KgFJL8h7idalcTdr3MAOS4Qkj5UEYCjKxsMAcLCzqzIn46zgpppn+ri/RVd8rODB
         5hvKjmbv6dzIEyPgiNNXCJ1H/TbV+bKPXnIoh7v0Oe2rSZ4vS4aZFSRPXitB6R1D9dPV
         cuXAvg1+m7equYXzYurmO6/nDBgR4OsLOkBUE907BI+0WXL6/yw2wbl7Elk86Ci7qiAg
         npejRz6R8MEqXB8I4psCO6yZVvM3q7b/+JdqL/ewZZhAkVP/bAX1Iax3BqWw7DK9MkGu
         ZfbB0GwU+y/oFftt9VcQ9HJrFZ5rnxe2Cud7vFVI4zFNLA7hq8wLl1iUgI9b5fqrKWmc
         n6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=w4MXxugO4lsDbRuMeAk6J+79QpXfOwfDex5Oq3uNbBQ=;
        fh=suv5xTjx36fqisDPVLYE9Wxpju9TBVv1sbkAE72NWoc=;
        b=tNV2bz5/cXX19vksaPjvaNyfQ+OKLbunsRxJyAzCOTxzz3ozJv+k5oPCxazABsGslw
         VZI0N4Zbav28nQjAIBKinu3njo2ifCdq3obax6O9OUZGccvByCBIzuUcz7uHBdpS4eRg
         7esc4dSpO3gCc/hgcI8vsk7Fk3KZv1uONFaIvstk2j1UrobHLjoYXXl/Wdvj3kKzixCT
         kvaMNV0jwvFl+s4pSu+Gp3JU/Cal6m78ymCa6dtFnGygHNFHKFJM9Kvy0p3r9DB5c75/
         lgHG3fzqK91GzjFyUywBXsCA2369EAaMvFgYp6wi1bQqQriFRw87ts5NVIVC647erx2q
         RZ1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftm+pQvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a188d00b00403ee822493si6183891qtc.407.2023.08.08.09.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Aug 2023 09:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ftm+pQvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTPCM-0002W7-7A; Tue, 08 Aug 2023 12:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTPCI-0002Tb-H6
 for qemu-arm@nongnu.org; Tue, 08 Aug 2023 12:04:38 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTPCG-0005w2-GZ
 for qemu-arm@nongnu.org; Tue, 08 Aug 2023 12:04:38 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-686b9964ae2so4197906b3a.3
 for <qemu-arm@nongnu.org>; Tue, 08 Aug 2023 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691510672; x=1692115472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w4MXxugO4lsDbRuMeAk6J+79QpXfOwfDex5Oq3uNbBQ=;
 b=ftm+pQvC8jW22VQn3Yjn2cUWayhMJxCCk/YIQqnTrri7bMV6ntcUm1ws5oV2RCOJFd
 y/JOT/R3s+ebPGoTIwfGoNzkEEEkzrfNGiBgg/4ytEtf8ax//Wb/4Irr2y7Py0JYxM5v
 d7KlTykaNCKLIQhYdAzhK2po/6gzv3TfBLdL0azQRpdsbgibrsaslUpDeVUvaTmAC1qN
 2/1CsURoK4xTL0/YqqeVRYE17mlBmvG5w+yBgOIyNOYKlq/Kc96TmiBKKCJwSRkSaVcX
 jiORclbORjYxJx1AjrxwCs96nOYz7VD1hEUjK28UktMiXAFLJbaGwetLeAI0p4WpkyQr
 HdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691510672; x=1692115472;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w4MXxugO4lsDbRuMeAk6J+79QpXfOwfDex5Oq3uNbBQ=;
 b=H6A2aOApRFnK+5tPUS3/7isHBmzwT/NFONwSKaLrBtLBzISii6bCs7ij11fvobQaEA
 8FR9rE4FgQA7VUnZM2Um84BzGLRbYP47PlNc0eLOB2JT41vkJSQ0uXQAn7vkc1g0O1Fw
 7X6JLlIEkFlkeczwRgNQqlplThAz0PIzT3QnUchiI5lDp2aCumC//vALw2KqRiLYyfbU
 Q43IUY6MVzlq3Y9zKXWO2eIWy8Kvg9/uuP3XMTTqVvJ1EH9pHYJUa8P+DufpamlO297i
 qR27HUSAq1cmNS/JJErIxRJAjuIF1LEdFLPxXq7DtUcgwBOX47HzlxAvA2eYLkg9ncJw
 5cWg==
X-Gm-Message-State: AOJu0Yy9j9XbfXcBZswKg31qZ+aZ8jetewdktbQXXRaRpPV/5V//blO1
 YJajKZdIJihn3sjKE4GFoI47HjPAP9Rn8y80jwE=
X-Received: by 2002:a05:6a20:3d84:b0:138:60e:9c4 with SMTP id
 s4-20020a056a203d8400b00138060e09c4mr13249563pzi.23.1691510672480; 
 Tue, 08 Aug 2023 09:04:32 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:63dc:2a47:f4bc:4a95?
 ([2602:47:d490:6901:63dc:2a47:f4bc:4a95])
 by smtp.gmail.com with ESMTPSA id
 b14-20020aa7870e000000b00687790191a2sm8270302pfo.58.2023.08.08.09.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 09:04:32 -0700 (PDT)
Message-ID: <2f65a947-cad1-b292-51f8-5af58596d7d7@linaro.org>
Date: Tue, 8 Aug 2023 09:04:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/24] tcg: Use tcg_gen_negsetcond_*
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
References: <20230808031143.50925-1-richard.henderson@linaro.org>
 <20230808031143.50925-3-richard.henderson@linaro.org>
 <CAFEAcA8ORUejjC3iVdjYSkX1St6ntxXbDPtTC0tuv5C_5rQ8xQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8ORUejjC3iVdjYSkX1St6ntxXbDPtTC0tuv5C_5rQ8xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=unavailable autolearn_force=no
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
X-TUID: DWLnIOHA8+n0

On 8/8/23 08:55, Peter Maydell wrote:
> On Tue, 8 Aug 2023 at 04:13, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tcg-op-gvec.c | 6 ++----
>>   tcg/tcg-op.c      | 6 ++----
>>   2 files changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
>> index a062239804..e260a07c61 100644
>> --- a/tcg/tcg-op-gvec.c
>> +++ b/tcg/tcg-op-gvec.c
>> @@ -3692,8 +3692,7 @@ static void expand_cmp_i32(uint32_t dofs, uint32_t aofs, uint32_t bofs,
>>       for (i = 0; i < oprsz; i += 4) {
>>           tcg_gen_ld_i32(t0, cpu_env, aofs + i);
>>           tcg_gen_ld_i32(t1, cpu_env, bofs + i);
>> -        tcg_gen_setcond_i32(cond, t0, t0, t1);
>> -        tcg_gen_neg_i32(t0, t0);
>> +        tcg_gen_negsetcond_i32(cond, t0, t0, t1);
>>           tcg_gen_st_i32(t0, cpu_env, dofs + i);
>>       }
> 
> Is it not possible for the optimizer to notice "you did
> a setcond followed by a neg, let me turn it into negsetcond
> for you" ?

Not at present, no.  That sort of peephole optimization is a bit more difficult than what 
we do at present.


r~

