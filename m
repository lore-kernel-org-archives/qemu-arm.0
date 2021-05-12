Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5162472lfg;
        Wed, 12 May 2021 09:18:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoNh1JfxGswZ2LxUPUaXqBpVL6zBfsig8H0bi/VqYDf3f5aV/QAYrt+yi/y0vVnlYsel8v
X-Received: by 2002:a5d:9343:: with SMTP id i3mr24341807ioo.77.1620836296785;
        Wed, 12 May 2021 09:18:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620836296; cv=none;
        d=google.com; s=arc-20160816;
        b=VpBmQLiL6ZYHY9l9MDQwkH4Q7GEyFSe8WjMCNZ4BHykfKYOBfN36/WAX3aWGjKjSw6
         GFVumAs8MhBV2NpHj3Ao75xjVHjSjEShJwdAU67ydg696EmSHf3+DXOvZDnpMk9H2My2
         b0dfsWE/iAhXtFOm6NJRulgfJRcNdMEOpQ1x0RQQAbYJa6uVFh2vfg16KMBSPLyoqM1n
         FuYgsTvvkPhZF1Sig0tHvZWVRPf82FkvZ9FfN6S79m2VA+QObgiMJ0EEJ993pMxfCwaX
         3+Xorr1YOZrqai4GyUvzN0ScVDuvaNgSoeGxkNK+Bq/+J5YA955AkM5iaxZPHO+ol+Kg
         VvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=NYPSOK3bAWOTjjKwcZO5WYqRW3mN9ClMaw5o3tUdjDU=;
        b=io9Wha6muZLinfI4ezZ1TSD9yPD5LJ2dTYmPRMG8sSIWMrPTYhk9B8QqhuZZ/C2HT0
         PDmhKnDHU4yhrhcHFLHjitcg2glse9VOi/6bWdoEk9ZTA7kOMSQ5zrAb8i2cbK+zWpWp
         3tDU66joRfwpcjJEZzFLZEduSNbRCS0DClxcztNnNOPPDQhY0eK0QQqeZTcFwmIvFINF
         LDv4BNOooENlh9PwlhDUfP3yF7k0c0PKntyAVBmX2j3wCcGl4a2CZDwXN4KRHhnzkGWZ
         mnnySCjWsSUMmkOW7lbn25fLrD3ZyCyEuuGVzZ5l1O58NlvKNVOeyNeWqMMyGixitQb8
         6iZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rLPVh5nO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13si151633ilm.45.2021.05.12.09.18.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 09:18:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rLPVh5nO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgrYu-0003kA-5Q
	for alex.bennee@linaro.org; Wed, 12 May 2021 12:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrYN-0003iC-2B
 for qemu-arm@nongnu.org; Wed, 12 May 2021 12:17:44 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:47010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrYA-0003fi-QJ
 for qemu-arm@nongnu.org; Wed, 12 May 2021 12:17:42 -0400
Received: by mail-qk1-x731.google.com with SMTP id 76so22712459qkn.13
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NYPSOK3bAWOTjjKwcZO5WYqRW3mN9ClMaw5o3tUdjDU=;
 b=rLPVh5nOBNHgxPoAaxaf/Gp1nsbFKKvmgsAmdKR5j/7JWNxP2sHrqlYObbt92eDskN
 8fAB5GEEe44TJmu1kUgFZrbG0cSKsc+IQiDD9af1ZyDQqfm4cW0TX+5fih1EojLOpKSc
 snZ4fgjCNP6AUgGJ6GMz1otR+TrIoe8RkUTCLlODZuDEvcNoHddMHUs6nVL1L8Of8ZlH
 XE1+CiMMp7671ocOu57BOaLlJLsC2BKL89GA3N+UJxgKIKfI8sVQ3QqvVt9slJRLI9Qw
 mEEl9E7rUz+vG84GUc+s8pTCNKzwwaypNaY5YWexcOLbJ2CHvshn6s3vW2uFpXQzo0CG
 YW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYPSOK3bAWOTjjKwcZO5WYqRW3mN9ClMaw5o3tUdjDU=;
 b=NuGzbYQAeR4Ar0EbGMfBdskLAodojxLzQgFy/nMMD2zfFmY9aAP2lo1bUueo2Zq6fo
 /laTLSoMu2b/bvvMo457fW/AXxNzspVYbL1+HxX3rauQhDyvHMG+DW/LnnHMtaAlgqVI
 vfzFTYqhm8O1ywu7vG6KQsQBPKsvDUiXCu6vm5KdaqhL4W2VzTjJgfuRjlALHubUmQIj
 Ql31lpcEBqT0H6i9t2ykSoNVba0J7ryijkJwMLqDZyl+0IdfAXXXtd/02GFkw8uezkzI
 hzaUyTTuh7OohseqcCG6SOrZ/08TAoGVxsEPpz0lK8GZPMYKqTmLLDjkW0dcdALvSQ8C
 GQmg==
X-Gm-Message-State: AOAM533JgqO62PzS9PFrkAVlNDiZ/ApwOdCGrsO8KLskJ1I4/8UrFgCR
 Y6WxonJEsuy4FEmpNyDdvC4ODg==
X-Received: by 2002:a05:620a:2081:: with SMTP id
 e1mr33205426qka.44.1620836249679; 
 Wed, 12 May 2021 09:17:29 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j196sm356278qke.25.2021.05.12.09.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:17:29 -0700 (PDT)
Subject: Re: [PATCH v6 38/82] target/arm: Implement SVE2 ADDHNB, ADDHNT
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-39-richard.henderson@linaro.org>
 <CAFEAcA9fwtJsQJcQQMF2VBVBWJDJgLCU1Eaq13-8PVSsTy4tUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3be38343-23e5-ff64-1dae-ddcaa963732c@linaro.org>
Date: Wed, 12 May 2021 11:17:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9fwtJsQJcQQMF2VBVBWJDJgLCU1Eaq13-8PVSsTy4tUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAl4vAK3tHps

On 5/12/21 10:23 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Stephen Long <steplong@quicinc.com>
>>
>> Signed-off-by: Stephen Long <steplong@quicinc.com>
>> Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 572d41a26c..2dead1f056 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -2112,6 +2112,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
>>   #undef DO_SHRNB
>>   #undef DO_SHRNT
>>
>> +#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
>> +{                                                                           \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
>> +        TYPEW nn = *(TYPEW *)(vn + i);                                      \
>> +        TYPEW mm = *(TYPEW *)(vm + i);                                      \
>> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
>> +    }                                                                       \
>> +}
> 
> Doesn't this need H macros like the 'T' version ?

No, all memory ops are the same TYPEW column.


r~
